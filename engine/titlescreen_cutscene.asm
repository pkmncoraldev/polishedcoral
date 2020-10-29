RunTitleScreen:: ; 627b
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	call TitleScreenScene
	call DelayFrame
	and a
	ret

.done_title
	scf
	ret
; 6292

TitleScreenScene: ; 62a3
	ld e, a
	ld d, 0
	ld hl, .scenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 62af

.scenes
	dw TitleScreenEntrance
	dw TitleScreenTimer1
	dw TitleScreenCutscene1
	dw TitleScreenTimer2
	dw TitleScreenCutscene2
	dw TitleScreenTimer3
	dw TitleScreenCutscene3
	dw TitleScreenFlash
	dw TitleScreenTimer4
	dw TitleScreenMain
	dw TitleScreenEnd
; 62b7


TitleScreenEntrance: ; 62bc
	ld a, 0
	ld [wMagnetTrainDirection], a

	call SetBlackPals
	ld c, 0
	call FadePalettes
	ld c, 60
	call DelayFrames

	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	ld a, [wMagnetTrainDirection]
	call ByteFill
	ld hl, wLYOverridesBackup
	ld bc, wLYOverridesBackupEnd - wLYOverridesBackup
	ld a, [wMagnetTrainDirection]
	call ByteFill
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a

	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + wStatusFlags - wPlayerData
	ld de, wStatusFlags
	ld a, [hl]
	ld [de], a
	call CloseSRAM


	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenPalettes
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld hl, TitleScreenOBPalettes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld c, 30
	call FadePalettes
	
	ld hl, wJumptableIndex
	inc [hl]
	ret

TitleScreenCutscene1:
; Run the timer down.
	ld hl, wcf65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	
	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]

	and %011111
	jr nz, .cont
	
	call TitleScreenScrollDown

.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
	
TitleScreenCutscene2:
; Run the timer down.
	ld hl, wcf65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	
	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]
	
	ld hl, wcf65
	ld a, [hl]
	cp 100
	jr z, .changepal

.return
	and %000111
	jr nz, .cont
	
	call TitleScreenScrollDown

.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
	
.changepal
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenPalettes2
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 6
	call FadePalettes
	jr .return

TitleScreenCutscene3:
; Run the timer down.
	ld hl, wcf65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	
	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]
	
	and %000001
	jr nz, .cont
	
	call TitleScreenScrollDown

.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
	
TitleScreenFlash:
;	ld a, $88
;	ld [hWY], a
	
	ld c, 10
	call DelayFrames
	
	call SetWhitePals
	ld c, 6
	call FadePalettes
	
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenPalettes3
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld hl, TitleScreenOBPalettes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a
	
	ld a, 0
	ld [wMagnetTrainDirection], a
	
	ld a, $70
	ldh [hSCY], a
	
	xor a
	ld [rVBK], a
	
;flavor blast the 2 lighthouse tiles (very frame specific)
;	hlbgcoord $2, $1a
;	ld bc, 1 * 2
;	ld a, $89
;	call ByteFill
	
	call TitleScreenScrollRight
	
	ld c, 6
	call FadePalettes

	ld hl, wJumptableIndex
	inc [hl]
	ret
; 62f6

TitleScreenTimer1: ; 62f6

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld de, 100
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ret

TitleScreenTimer2: ; 62f6

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld de, 200
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ret

	
TitleScreenTimer3: ; 62f6

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld de, 167
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ret


TitleScreenTimer4: ; 62f6

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

;	ld a, BANK(sPlayerData)
;	call GetSRAMBank
;	ld hl, sPlayerData + wStatusFlags - wPlayerData
;	ld de, wStatusFlags
;	ld a, [hl]
;	ld [de], a
;	call CloseSRAM

; Start a timer
	ld de, 73 * 39; + 36
;	ld a, [wSaveFileExists]
;	and a
;	jr z, .ok
;	ld hl, wStatusFlags
;	bit 6, [hl] ; hall of fame
;	jr z, .ok
;	ld de, 56 * 60
;.ok
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 6304

TitleScreenMain: ; 6304
; Run the timer down.
	ld hl, wcf65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e

; Save data can be deleted by pressing Up + B + Select.
	call GetJoypad
	ld hl, hJoyDown

	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .delete_save_data

; The clock can be reset by pressing Down + B + Select.
	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr z, .clock_reset

; Press Start or A to start the game.
.check_start
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .start_game
	
	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and %011111
	jr nz, .cont2

	call TitleScreenScrollRight

.cont2
	ret

.done
	ld [wIntroSceneFrameCounter], a
; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a
	ld [wMusicFadeIDLo], a
	ld [wMusicFadeIDHi], a
	ld hl, wMusicFade
	ld [hl], 8 ; 1 second

	ld hl, wcf65
	inc [hl]
	ret

.start_game
	xor a
	jr .done

.delete_save_data
	ld a, 1
	jr .done

.clock_reset
	ld a, 4
	jr .done

; 6375

TitleScreenEnd: ; 6375

; Wait until the music is done fading.

	ld hl, wcf65
	inc [hl]

	ld a, [wMusicFade]
	and a
	ret nz

	ld a, 2
	ld [wIntroSceneFrameCounter], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 6389

TitleScreenScrollDown:
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a

	ld hl, wLYOverridesBackup
	xor a ; same as ld a, 0
	ldh [hSCX], a
	ld c, 144
	ld a, [wMagnetTrainDirection]
	call .loadloop
	call PushLYOverrides
	ret
.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret
	
TitleScreenScrollRight:
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a

	ld hl, wLYOverridesBackup
	ld c, 65
	xor a ; same as ld a, 0
	ldh [hSCX], a
	call .loadloop
	ld c, 38
	ld a, [wMagnetTrainDirection]
	call .loadloop
	ld c, 40
	xor a
	call .loadloop
	call PushLYOverrides
	ret
.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret
	
TitleScreenPalettes:
; BG
	RGB 08, 13, 20
	RGB 21, 27, 31
	RGB 11, 20, 29
	RGB 08, 18, 28
	
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	
	RGB 21, 27, 31
	RGB 21, 27, 31
	RGB 21, 27, 31
	RGB 21, 27, 31
	
	RGB 08, 13, 20
	RGB 31, 31, 31
	RGB 08, 13, 20
	RGB 08, 13, 20
	
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	RGB 08, 13, 20
	
	RGB 08, 13, 20
	RGB 21, 27, 31
	RGB 11, 20, 29
	RGB 08, 18, 28
	
TitleScreenPalettes2:
; BG
	RGB 15, 24, 31
	RGB 21, 27, 31
	RGB 11, 20, 29
	RGB 08, 18, 28
	
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	
	RGB 21, 27, 31
	RGB 21, 27, 31
	RGB 21, 27, 31
	RGB 21, 27, 31
	
	RGB 15, 24, 31
	RGB 31, 31, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	
	RGB 15, 24, 31
	RGB 21, 27, 31
	RGB 11, 20, 29
	RGB 08, 18, 28
	
TitleScreenPalettes3:
; BG
	RGB 15, 24, 31
	RGB 21, 27, 31
	RGB 11, 20, 29
	RGB 08, 18, 28
	
	RGB 15, 24, 31
	RGB 31, 31, 31
	RGB 31, 22, 26
	RGB 23, 03, 06
	
	RGB 21, 27, 31
	RGB 31, 31, 31
	RGB 31, 22, 26
	RGB 23, 03, 06
	
	RGB 15, 24, 31
	RGB 31, 31, 31
	RGB 31, 13, 21
	RGB 23, 03, 06
	
	RGB 15, 24, 31
	RGB 31, 31, 31
	RGB 31, 17, 24
	RGB 23, 03, 06
	
	RGB 15, 24, 31
	RGB 31, 31, 31
	RGB 31, 20, 25
	RGB 23, 03, 06
	
	RGB 15, 24, 31
	RGB 31, 31, 31
	RGB 31, 22, 26
	RGB 23, 03, 06
	
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	RGB 15, 24, 31
	
TitleScreenOBPalettes:
;OB
	RGB 00, 00, 00
	RGB 23, 03, 06
	RGB 30, 13, 21
	RGB 31, 31, 31

	RGB 21, 27, 31
	RGB 15, 24, 31
	RGB 11, 20, 29
	RGB 08, 18, 28

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
