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
	ld [wNumHits], a
	
	ld hl, TitleLensFlare_OAM01
	ld de, wSprites
	ld bc, 24
	call CopyBytes
	
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a

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
	
	ld hl, TitleScreenOBPalettes1
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
	
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and START | A_BUTTON
	jp nz, TitleScreenSkipToEnd
	
	xor a
	ldh [hLCDCPointer], a
	
	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]

	and %011111
	jr nz, .cont
	
	ld a, [hSCY]
	inc a
	ld [hSCY], a
	
	ld a, [wNumHits]
	inc a
	ld [wNumHits], a
	
	ld e, a
	ld d, 0
	ld hl, GetTitleLensFlare_OAM
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wSprites
	ld bc, 24
	call CopyBytes

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

	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and START | A_BUTTON
	jp nz, TitleScreenSkipToEnd
	
	xor a
	ldh [hLCDCPointer], a

	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]
	
	and %000111
	jr nz, .cont
	
	ld a, [hSCY]
	inc a
	ld [hSCY], a
	
	ld a, [wNumHits]
	inc a
	ld [wNumHits], a
	cp 8
	jr z, .changepal1
	cp 15
	jr z, .changepal2
.return
	ld a, [wNumHits]
	
	ld e, a
	ld d, 0
	ld hl, GetTitleLensFlare_OAM
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wSprites
	ld bc, 24
	call CopyBytes

.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
.changepal1
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenOBPalettes2
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 1
	call FadePalettes
	jr .return
.changepal2
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenOBPalettes3
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 1
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
	
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and START | A_BUTTON
	jp nz, TitleScreenSkipToEnd
	
	ld hl, wcf65
	ld a, [hl]
	cp 126
	jr z, .changepal1

.return1
	xor a
	ldh [hLCDCPointer], a
	
	ld hl, wUnknBGPals palette 0 + 2
	ld a, [hl]
	ld c, a
	inc [hl]

	and %000001
	jr nz, .cont
	
	ld a, [hSCY]
	inc a
	ld [hSCY], a

	ld a, [wNumHits]
	inc a
	ld [wNumHits], a
	cp 30
	jr z, .changepal2
	cp 35
	jr z, .changepal3
.return2
	ld a, [wNumHits]
	
	ld e, a
	ld d, 0
	ld hl, GetTitleLensFlare_OAM
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wSprites
	ld bc, 24
	call CopyBytes
	
.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
.changepal1
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenPalettes2
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 1
	call FadePalettes
	jr .return1
.changepal2
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenOBPalettes2
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 1
	call FadePalettes
	jr .return2
.changepal3
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenOBPalettes1
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 1
	call FadePalettes
	jr .return2
	
GetTitleLensFlare_OAM:
	dw 0
	dw TitleLensFlare_OAM02
	dw TitleLensFlare_OAM03
	dw TitleLensFlare_OAM04
	dw TitleLensFlare_OAM05
	dw TitleLensFlare_OAM06
	dw TitleLensFlare_OAM07
	dw TitleLensFlare_OAM08
	dw TitleLensFlare_OAM09
	dw TitleLensFlare_OAM10
	dw TitleLensFlare_OAM11
	dw TitleLensFlare_OAM12
	dw TitleLensFlare_OAM13
	dw TitleLensFlare_OAM14
	dw TitleLensFlare_OAM15
	dw TitleLensFlare_OAM16
	dw TitleLensFlare_OAM17
	dw TitleLensFlare_OAM18
	dw TitleLensFlare_OAM19
	dw TitleLensFlare_OAM20
	dw TitleLensFlare_OAM21
	dw TitleLensFlare_OAM22
	dw TitleLensFlare_OAM23
	dw TitleLensFlare_OAM24
	dw TitleLensFlare_OAM25
	dw TitleLensFlare_OAM26
	dw TitleLensFlare_OAM27
	dw TitleLensFlare_OAM28
	dw TitleLensFlare_OAM29
	dw TitleLensFlare_OAM30
	dw TitleLensFlare_OAM31
	dw TitleLensFlare_OAM32
	dw TitleLensFlare_OAM33
	dw TitleLensFlare_OAM34
	dw TitleLensFlare_OAM35
	dw TitleLensFlare_OAM36
	dw TitleLensFlare_OAM37
	dw TitleLensFlare_OAM38
	dw TitleLensFlare_OAM39
	dw TitleLensFlare_OAM40
	dw TitleLensFlare_OAM41
	dw TitleLensFlare_OAM42
	dw TitleLensFlare_OAM43
	dw TitleLensFlare_OAM00
	dw TitleLensFlare_OAM45
	dw TitleLensFlare_OAM00
	dw TitleLensFlare_OAM00
	dw TitleLensFlare_OAM48
	dw TitleLensFlare_OAM00
	dw TitleLensFlare_OAM50
	dw TitleLensFlare_OAM51
	dw TitleLensFlare_OAM52
	dw TitleLensFlare_OAM53
	dw TitleLensFlare_OAM54
	dw TitleLensFlare_OAM55
	dw TitleLensFlare_OAM56
	dw TitleLensFlare_OAM57
	dw TitleLensFlare_OAM58
	dw TitleLensFlare_OAM59
	dw TitleLensFlare_OAM60
	dw TitleLensFlare_OAM61
	dw TitleLensFlare_OAM62
	dw TitleLensFlare_OAM63
	dw TitleLensFlare_OAM64
	dw TitleLensFlare_OAM65
	dw TitleLensFlare_OAM66
	dw TitleLensFlare_OAM67
	dw TitleLensFlare_OAM68
	dw TitleLensFlare_OAM69
	dw TitleLensFlare_OAM70
	dw TitleLensFlare_OAM71
	dw TitleLensFlare_OAM72
	dw TitleLensFlare_OAM73
	dw TitleLensFlare_OAM74
	dw TitleLensFlare_OAM75
	dw TitleLensFlare_OAM76
	dw TitleLensFlare_OAM77
	dw TitleLensFlare_OAM78
	dw TitleLensFlare_OAM79
	dw TitleLensFlare_OAM80
	dw TitleLensFlare_OAM81
	dw TitleLensFlare_OAM82
	dw TitleLensFlare_OAM83
	dw TitleLensFlare_OAM84
	dw TitleLensFlare_OAM85
	dw TitleLensFlare_OAM86
	dw TitleLensFlare_OAM87
	dw TitleLensFlare_OAM88
	dw TitleLensFlare_OAM89
	dw TitleLensFlare_OAM90
	dw TitleLensFlare_OAM91
	dw TitleLensFlare_OAM92
	dw TitleLensFlare_OAM93
	dw TitleLensFlare_OAM94
	dw TitleLensFlare_OAM95
	dw TitleLensFlare_OAM96
	dw TitleLensFlare_OAM97
	dw TitleLensFlare_OAM98
	dw TitleLensFlare_OAM99
	dw TitleLensFlare_OAM100
	dw TitleLensFlare_OAM101
	dw TitleLensFlare_OAM102
	dw TitleLensFlare_OAM103
	dw TitleLensFlare_OAM104
	dw TitleLensFlare_OAM105
	dw TitleLensFlare_OAM106
	dw TitleLensFlare_OAM107
	dw TitleLensFlare_OAM108
	dw TitleLensFlare_OAM109
	dw TitleLensFlare_OAM110
	dw TitleLensFlare_OAM111
	dw TitleLensFlare_OAM112
	dw TitleLensFlare_OAM113
	
TitleScreenSkipToEnd:
	ld de, 73 * 39
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wJumptableIndex
	ld a, 7
	ld [hl], a
	ret
	
TitleScreenFlash:
;	ld a, $88
;	ld [hWY], a
	
	ld c, 10
	call DelayFrames
	
	call SetWhitePals
	ld c, 6
	call FadePalettes
	
	ld hl, TitleLighthouse_OAM
	ld de, wSprites
	ld bc, 24
	call CopyBytes
	
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenPalettes3
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld hl, TitleScreenOBPalettes1
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld de, MUSIC_TITLE2
	call PlayMusic
	
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	
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
	
	ld a, 0
	ld [hSCY], a
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
	ld de, 169
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
	RGB 13, 18, 24
	RGB 22, 27, 31
	RGB 31, 31, 31
	
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
	RGB 18, 25, 31
	RGB 22, 27, 31
	RGB 31, 31, 31
	
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
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	
TitleScreenOBPalettes1:
;OB
	RGB 00, 00, 00
	RGB 08, 14, 23
	RGB 10, 17, 26
	RGB 11, 21, 30

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
	
TitleScreenOBPalettes2:
;OB
	RGB 00, 00, 00
	RGB 10, 17, 26
	RGB 11, 21, 30
	RGB 21, 27, 31

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
	
TitleScreenOBPalettes3:
;OB
	RGB 00, 00, 00
	RGB 11, 21, 30
	RGB 21, 27, 31
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
	
TitleLighthouse_OAM:
;y pos, x pos, tile, palette
	dsprite 12,  0,  3,  0, $00, 1
	dsprite 13,  0,  3,  0, $02, 1
	dsprite 14,  0,  3,  0, $04, 1
	dsprite 12,  0,  4,  0, $01, 1
	dsprite 13,  0,  4,  0, $03, 1
	dsprite 14,  0,  4,  0, $05, 1
	
TitleLensFlare_OAM00:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM01:
	dsprite  8,  0, 13,  0, $06, 0
	dsprite  6,  0, 15,  0, $07, 0
	dsprite  4,  0, 17,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM02:
	dsprite  8,  0, 13,  1, $06, 0
	dsprite  6,  1, 15,  0, $07, 0
	dsprite  4,  2, 17,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM03:
	dsprite  8,  0, 13,  2, $06, 0
	dsprite  6,  2, 15,  0, $07, 0
	dsprite  4,  4, 16,  7, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM04:
	dsprite  8,  0, 13,  3, $06, 0
	dsprite  6,  3, 15,  0, $07, 0
	dsprite  4,  6, 16,  7, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0

TitleLensFlare_OAM05:
	dsprite  8,  0, 13,  4, $06, 0
	dsprite  6,  4, 15,  0, $07, 0
	dsprite  5,  0, 16,  6, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM06:
	dsprite  8,  0, 13,  4, $06, 0
	dsprite  6,  5, 15,  0, $07, 0
	dsprite  5,  2, 16,  6, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM07:
	dsprite  8,  0, 13,  5, $06, 0
	dsprite  6,  6, 15,  0, $07, 0
	dsprite  5,  4, 16,  5, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM08:
	dsprite  8,  0, 13,  5, $06, 0
	dsprite  6,  7, 15,  0, $07, 0
	dsprite  5,  6, 16,  5, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM09:
	dsprite  8,  0, 13,  6, $06, 0
	dsprite  7,  0, 15,  0, $07, 0
	dsprite  6,  0, 16,  4, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM10:
	dsprite  8,  0, 13,  6, $06, 0
	dsprite  7,  1, 14,  7, $07, 0
	dsprite  6,  2, 16,  4, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM11:
	dsprite  8,  0, 13,  6, $06, 0
	dsprite  7,  2, 14,  7, $07, 0
	dsprite  6,  4, 16,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM12:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  7,  3, 14,  7, $07, 0
	dsprite  6,  6, 16,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM13:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  7,  4, 14,  7, $07, 0
	dsprite  7,  0, 16,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM14:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  7,  5, 14,  7, $07, 0
	dsprite  7,  2, 16,  2, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM15:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  7,  5, 14,  7, $07, 0
	dsprite  7,  3, 16,  2, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM16:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  7,  6, 14,  7, $07, 0
	dsprite  7,  4, 16,  2, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM17:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  7,  6, 14,  7, $07, 0
	dsprite  7,  5, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM18:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  7,  7, 14,  7, $07, 0
	dsprite  7,  6, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM19:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  7,  7, 14,  7, $07, 0
	dsprite  7,  7, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM20:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  7,  7, 14,  7, $07, 0
	dsprite  7,  7, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM21: ;middle
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  0, 14,  7, $07, 0
	dsprite  8,  0, 16,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM22: ;middle
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  0, 14,  7, $07, 0
	dsprite  8,  0, 16,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM23: ;middle
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  0, 14,  7, $07, 0
	dsprite  8,  0, 16,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM24:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  1, 14,  7, $07, 0
	dsprite  8,  1, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM25:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  1, 14,  7, $07, 0
	dsprite  8,  1, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM26:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  1, 14,  7, $07, 0
	dsprite  8,  2, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM27:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  2, 14,  7, $07, 0
	dsprite  8,  3, 16,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM28:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  2, 14,  7, $07, 0
	dsprite  8,  4, 16,  2, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM29:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  3, 14,  7, $07, 0
	dsprite  8,  5, 16,  2, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM30:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  3, 14,  7, $07, 0
	dsprite  8,  6, 16,  2, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM31:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  4, 14,  7, $07, 0
	dsprite  9,  0, 16,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM32:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  5, 14,  7, $07, 0
	dsprite  9,  2, 16,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM33:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  6, 14,  7, $07, 0
	dsprite  9,  4, 16,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM34:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  8,  7, 14,  7, $07, 0
	dsprite  9,  6, 16,  4, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM35:
	dsprite  8,  0, 14,  0, $06, 0
	dsprite  9,  0, 15,  0, $07, 0
	dsprite 10,  0, 16,  4, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM36:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  9,  1, 15,  0, $07, 0
	dsprite 10,  2, 16,  5, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM37:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  9,  2, 15,  0, $07, 0
	dsprite 10,  4, 16,  5, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM38:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  9,  3, 15,  0, $07, 0
	dsprite 10,  6, 16,  6, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM39:
	dsprite  8,  0, 13,  7, $06, 0
	dsprite  9,  4, 15,  0, $07, 0
	dsprite 11,  0, 16,  6, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM40:
	dsprite  8,  0, 13,  6, $06, 0
	dsprite  9,  5, 15,  0, $07, 0
	dsprite 11,  2, 16,  7, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM41:
	dsprite  8,  0, 13,  6, $06, 0
	dsprite  9,  6, 15,  0, $07, 0
	dsprite 11,  4, 16,  7, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM42:
	dsprite  8,  0, 13,  6, $06, 0
	dsprite  9,  7, 15,  0, $07, 0
	dsprite 11,  6, 17,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM43:
	dsprite  8,  0, 13,  5, $06, 0
	dsprite 10,  0, 15,  0, $07, 0
	dsprite 12,  0, 17,  0, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM45:
	dsprite  8,  0, 13,  4, $06, 0
	dsprite 10,  2, 15,  0, $07, 0
	dsprite 12,  4, 17,  1, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM48:
	dsprite  8,  0, 13,  2, $06, 0
	dsprite 10,  5, 15,  0, $07, 0
	dsprite 13,  2, 17,  3, $08, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM50:
	dsprite 19,  7,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  7,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM51:
	dsprite 19,  6,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  6,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM52:
	dsprite 19,  5,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  5,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM53:
	dsprite 19,  4,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  4,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM54:
	dsprite 19,  3,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  3,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM55:
	dsprite 19,  2,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  2,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM56:
	dsprite 19,  1,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  1,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM57:
	dsprite 19,  0,  3,  0, $00, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 19,  0,  4,  0, $01, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM58:
	dsprite 18,  7,  3,  0, $00, 1
	dsprite 19,  7,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  7,  4,  0, $01, 1
	dsprite 19,  7,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM59:
	dsprite 18,  6,  3,  0, $00, 1
	dsprite 19,  6,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  6,  4,  0, $01, 1
	dsprite 19,  6,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM60:
	dsprite 18,  5,  3,  0, $00, 1
	dsprite 19,  5,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  5,  4,  0, $01, 1
	dsprite 19,  5,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM61:
	dsprite 18,  4,  3,  0, $00, 1
	dsprite 19,  4,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  4,  4,  0, $01, 1
	dsprite 19,  4,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM62:
	dsprite 18,  3,  3,  0, $00, 1
	dsprite 19,  3,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  3,  4,  0, $01, 1
	dsprite 19,  3,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM63:
	dsprite 18,  2,  3,  0, $00, 1
	dsprite 19,  2,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  2,  4,  0, $01, 1
	dsprite 19,  2,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM64:
	dsprite 18,  1,  3,  0, $00, 1
	dsprite 19,  1,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  1,  4,  0, $01, 1
	dsprite 19,  1,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM65:
	dsprite 18,  0,  3,  0, $00, 1
	dsprite 19,  0,  3,  0, $02, 1
	dsprite  0,  0,  0,  0, $00, 0
	dsprite 18,  0,  4,  0, $01, 1
	dsprite 19,  0,  4,  0, $03, 1
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM66:
	dsprite 17,  7,  3,  0, $00, 1
	dsprite 18,  7,  3,  0, $02, 1
	dsprite 19,  7,  3,  0, $04, 1
	dsprite 17,  7,  4,  0, $01, 1
	dsprite 18,  7,  4,  0, $03, 1
	dsprite 19,  7,  4,  0, $05, 1
	
TitleLensFlare_OAM67:
	dsprite 17,  6,  3,  0, $00, 1
	dsprite 18,  6,  3,  0, $02, 1
	dsprite 19,  6,  3,  0, $04, 1
	dsprite 17,  6,  4,  0, $01, 1
	dsprite 18,  6,  4,  0, $03, 1
	dsprite 19,  6,  4,  0, $05, 1
	
TitleLensFlare_OAM68:
	dsprite 17,  5,  3,  0, $00, 1
	dsprite 18,  5,  3,  0, $02, 1
	dsprite 19,  5,  3,  0, $04, 1
	dsprite 17,  5,  4,  0, $01, 1
	dsprite 18,  5,  4,  0, $03, 1
	dsprite 19,  5,  4,  0, $05, 1
	
TitleLensFlare_OAM69:
	dsprite 17,  4,  3,  0, $00, 1
	dsprite 18,  4,  3,  0, $02, 1
	dsprite 19,  4,  3,  0, $04, 1
	dsprite 17,  4,  4,  0, $01, 1
	dsprite 18,  4,  4,  0, $03, 1
	dsprite 19,  4,  4,  0, $05, 1
	
TitleLensFlare_OAM70:
	dsprite 17,  3,  3,  0, $00, 1
	dsprite 18,  3,  3,  0, $02, 1
	dsprite 19,  3,  3,  0, $04, 1
	dsprite 17,  3,  4,  0, $01, 1
	dsprite 18,  3,  4,  0, $03, 1
	dsprite 19,  3,  4,  0, $05, 1
	
TitleLensFlare_OAM71:
	dsprite 17,  2,  3,  0, $00, 1
	dsprite 18,  2,  3,  0, $02, 1
	dsprite 19,  2,  3,  0, $04, 1
	dsprite 17,  2,  4,  0, $01, 1
	dsprite 18,  2,  4,  0, $03, 1
	dsprite 19,  2,  4,  0, $05, 1
	
TitleLensFlare_OAM72:
	dsprite 17,  1,  3,  0, $00, 1
	dsprite 18,  1,  3,  0, $02, 1
	dsprite 19,  1,  3,  0, $04, 1
	dsprite 17,  1,  4,  0, $01, 1
	dsprite 18,  1,  4,  0, $03, 1
	dsprite 19,  1,  4,  0, $05, 1
	
TitleLensFlare_OAM73:
	dsprite 17,  0,  3,  0, $00, 1
	dsprite 18,  0,  3,  0, $02, 1
	dsprite 19,  0,  3,  0, $04, 1
	dsprite 17,  0,  4,  0, $01, 1
	dsprite 18,  0,  4,  0, $03, 1
	dsprite 19,  0,  4,  0, $05, 1
	
TitleLensFlare_OAM74:
	dsprite 16,  7,  3,  0, $00, 1
	dsprite 17,  7,  3,  0, $02, 1
	dsprite 18,  7,  3,  0, $04, 1
	dsprite 16,  7,  4,  0, $01, 1
	dsprite 17,  7,  4,  0, $03, 1
	dsprite 18,  7,  4,  0, $05, 1
	
TitleLensFlare_OAM75:
	dsprite 16,  6,  3,  0, $00, 1
	dsprite 17,  6,  3,  0, $02, 1
	dsprite 18,  6,  3,  0, $04, 1
	dsprite 16,  6,  4,  0, $01, 1
	dsprite 17,  6,  4,  0, $03, 1
	dsprite 18,  6,  4,  0, $05, 1
	
TitleLensFlare_OAM76:
	dsprite 16,  5,  3,  0, $00, 1
	dsprite 17,  5,  3,  0, $02, 1
	dsprite 18,  5,  3,  0, $04, 1
	dsprite 16,  5,  4,  0, $01, 1
	dsprite 17,  5,  4,  0, $03, 1
	dsprite 18,  5,  4,  0, $05, 1
	
TitleLensFlare_OAM77:
	dsprite 16,  4,  3,  0, $00, 1
	dsprite 17,  4,  3,  0, $02, 1
	dsprite 18,  4,  3,  0, $04, 1
	dsprite 16,  4,  4,  0, $01, 1
	dsprite 17,  4,  4,  0, $03, 1
	dsprite 18,  4,  4,  0, $05, 1
	
TitleLensFlare_OAM78:
	dsprite 16,  3,  3,  0, $00, 1
	dsprite 17,  3,  3,  0, $02, 1
	dsprite 18,  3,  3,  0, $04, 1
	dsprite 16,  3,  4,  0, $01, 1
	dsprite 17,  3,  4,  0, $03, 1
	dsprite 18,  3,  4,  0, $05, 1
	
TitleLensFlare_OAM79:
	dsprite 16,  2,  3,  0, $00, 1
	dsprite 17,  2,  3,  0, $02, 1
	dsprite 18,  2,  3,  0, $04, 1
	dsprite 16,  2,  4,  0, $01, 1
	dsprite 17,  2,  4,  0, $03, 1
	dsprite 18,  2,  4,  0, $05, 1
	
TitleLensFlare_OAM80:
	dsprite 16,  1,  3,  0, $00, 1
	dsprite 17,  1,  3,  0, $02, 1
	dsprite 18,  1,  3,  0, $04, 1
	dsprite 16,  1,  4,  0, $01, 1
	dsprite 17,  1,  4,  0, $03, 1
	dsprite 18,  1,  4,  0, $05, 1
	
TitleLensFlare_OAM81:
	dsprite 16,  0,  3,  0, $00, 1
	dsprite 17,  0,  3,  0, $02, 1
	dsprite 18,  0,  3,  0, $04, 1
	dsprite 16,  0,  4,  0, $01, 1
	dsprite 17,  0,  4,  0, $03, 1
	dsprite 18,  0,  4,  0, $05, 1
	
TitleLensFlare_OAM82:
	dsprite 15,  7,  3,  0, $00, 1
	dsprite 16,  7,  3,  0, $02, 1
	dsprite 17,  7,  3,  0, $04, 1
	dsprite 15,  7,  4,  0, $01, 1
	dsprite 16,  7,  4,  0, $03, 1
	dsprite 17,  7,  4,  0, $05, 1
	
TitleLensFlare_OAM83:
	dsprite 15,  6,  3,  0, $00, 1
	dsprite 16,  6,  3,  0, $02, 1
	dsprite 17,  6,  3,  0, $04, 1
	dsprite 15,  6,  4,  0, $01, 1
	dsprite 16,  6,  4,  0, $03, 1
	dsprite 17,  6,  4,  0, $05, 1
	
TitleLensFlare_OAM84:
	dsprite 15,  5,  3,  0, $00, 1
	dsprite 16,  5,  3,  0, $02, 1
	dsprite 17,  5,  3,  0, $04, 1
	dsprite 15,  5,  4,  0, $01, 1
	dsprite 16,  5,  4,  0, $03, 1
	dsprite 17,  5,  4,  0, $05, 1
	
TitleLensFlare_OAM85:
	dsprite 15,  4,  3,  0, $00, 1
	dsprite 16,  4,  3,  0, $02, 1
	dsprite 17,  4,  3,  0, $04, 1
	dsprite 15,  4,  4,  0, $01, 1
	dsprite 16,  4,  4,  0, $03, 1
	dsprite 17,  4,  4,  0, $05, 1
	
TitleLensFlare_OAM86:
	dsprite 15,  3,  3,  0, $00, 1
	dsprite 16,  3,  3,  0, $02, 1
	dsprite 17,  3,  3,  0, $04, 1
	dsprite 15,  3,  4,  0, $01, 1
	dsprite 16,  3,  4,  0, $03, 1
	dsprite 17,  3,  4,  0, $05, 1
	
TitleLensFlare_OAM87:
	dsprite 15,  2,  3,  0, $00, 1
	dsprite 16,  2,  3,  0, $02, 1
	dsprite 17,  2,  3,  0, $04, 1
	dsprite 15,  2,  4,  0, $01, 1
	dsprite 16,  2,  4,  0, $03, 1
	dsprite 17,  2,  4,  0, $05, 1
	
TitleLensFlare_OAM88:
	dsprite 15,  1,  3,  0, $00, 1
	dsprite 16,  1,  3,  0, $02, 1
	dsprite 17,  1,  3,  0, $04, 1
	dsprite 15,  1,  4,  0, $01, 1
	dsprite 16,  1,  4,  0, $03, 1
	dsprite 17,  1,  4,  0, $05, 1
	
TitleLensFlare_OAM89:
	dsprite 15,  0,  3,  0, $00, 1
	dsprite 16,  0,  3,  0, $02, 1
	dsprite 17,  0,  3,  0, $04, 1
	dsprite 15,  0,  4,  0, $01, 1
	dsprite 16,  0,  4,  0, $03, 1
	dsprite 17,  0,  4,  0, $05, 1
	
TitleLensFlare_OAM90:
	dsprite 14,  7,  3,  0, $00, 1
	dsprite 15,  7,  3,  0, $02, 1
	dsprite 16,  7,  3,  0, $04, 1
	dsprite 14,  7,  4,  0, $01, 1
	dsprite 15,  7,  4,  0, $03, 1
	dsprite 16,  7,  4,  0, $05, 1
	
TitleLensFlare_OAM91:
	dsprite 14,  6,  3,  0, $00, 1
	dsprite 15,  6,  3,  0, $02, 1
	dsprite 16,  6,  3,  0, $04, 1
	dsprite 14,  6,  4,  0, $01, 1
	dsprite 15,  6,  4,  0, $03, 1
	dsprite 16,  6,  4,  0, $05, 1
	
TitleLensFlare_OAM92:
	dsprite 14,  5,  3,  0, $00, 1
	dsprite 15,  5,  3,  0, $02, 1
	dsprite 16,  5,  3,  0, $04, 1
	dsprite 14,  5,  4,  0, $01, 1
	dsprite 15,  5,  4,  0, $03, 1
	dsprite 16,  5,  4,  0, $05, 1
	
TitleLensFlare_OAM93:
	dsprite 14,  4,  3,  0, $00, 1
	dsprite 15,  4,  3,  0, $02, 1
	dsprite 16,  4,  3,  0, $04, 1
	dsprite 14,  4,  4,  0, $01, 1
	dsprite 15,  4,  4,  0, $03, 1
	dsprite 16,  4,  4,  0, $05, 1
	
TitleLensFlare_OAM94:
	dsprite 14,  3,  3,  0, $00, 1
	dsprite 15,  3,  3,  0, $02, 1
	dsprite 16,  3,  3,  0, $04, 1
	dsprite 14,  3,  4,  0, $01, 1
	dsprite 15,  3,  4,  0, $03, 1
	dsprite 16,  3,  4,  0, $05, 1
	
TitleLensFlare_OAM95:
	dsprite 14,  2,  3,  0, $00, 1
	dsprite 15,  2,  3,  0, $02, 1
	dsprite 16,  2,  3,  0, $04, 1
	dsprite 14,  2,  4,  0, $01, 1
	dsprite 15,  2,  4,  0, $03, 1
	dsprite 16,  2,  4,  0, $05, 1
	
TitleLensFlare_OAM96:
	dsprite 14,  1,  3,  0, $00, 1
	dsprite 15,  1,  3,  0, $02, 1
	dsprite 16,  1,  3,  0, $04, 1
	dsprite 14,  1,  4,  0, $01, 1
	dsprite 15,  1,  4,  0, $03, 1
	dsprite 16,  1,  4,  0, $05, 1
	
TitleLensFlare_OAM97:
	dsprite 14,  0,  3,  0, $00, 1
	dsprite 15,  0,  3,  0, $02, 1
	dsprite 16,  0,  3,  0, $04, 1
	dsprite 14,  0,  4,  0, $01, 1
	dsprite 15,  0,  4,  0, $03, 1
	dsprite 16,  0,  4,  0, $05, 1
	
TitleLensFlare_OAM98:
	dsprite 13,  7,  3,  0, $00, 1
	dsprite 14,  7,  3,  0, $02, 1
	dsprite 15,  7,  3,  0, $04, 1
	dsprite 13,  7,  4,  0, $01, 1
	dsprite 14,  7,  4,  0, $03, 1
	dsprite 15,  7,  4,  0, $05, 1
	
TitleLensFlare_OAM99:
	dsprite 13,  6,  3,  0, $00, 1
	dsprite 14,  6,  3,  0, $02, 1
	dsprite 15,  6,  3,  0, $04, 1
	dsprite 13,  6,  4,  0, $01, 1
	dsprite 14,  6,  4,  0, $03, 1
	dsprite 15,  6,  4,  0, $05, 1
	
TitleLensFlare_OAM100:
	dsprite 13,  5,  3,  0, $00, 1
	dsprite 14,  5,  3,  0, $02, 1
	dsprite 15,  5,  3,  0, $04, 1
	dsprite 13,  5,  4,  0, $01, 1
	dsprite 14,  5,  4,  0, $03, 1
	dsprite 15,  5,  4,  0, $05, 1
	
TitleLensFlare_OAM101:
	dsprite 13,  4,  3,  0, $00, 1
	dsprite 14,  4,  3,  0, $02, 1
	dsprite 15,  4,  3,  0, $04, 1
	dsprite 13,  4,  4,  0, $01, 1
	dsprite 14,  4,  4,  0, $03, 1
	dsprite 15,  4,  4,  0, $05, 1
	
TitleLensFlare_OAM102:
	dsprite 13,  3,  3,  0, $00, 1
	dsprite 14,  3,  3,  0, $02, 1
	dsprite 15,  3,  3,  0, $04, 1
	dsprite 13,  3,  4,  0, $01, 1
	dsprite 14,  3,  4,  0, $03, 1
	dsprite 15,  3,  4,  0, $05, 1
	
TitleLensFlare_OAM103:
	dsprite 13,  2,  3,  0, $00, 1
	dsprite 14,  2,  3,  0, $02, 1
	dsprite 15,  2,  3,  0, $04, 1
	dsprite 13,  2,  4,  0, $01, 1
	dsprite 14,  2,  4,  0, $03, 1
	dsprite 15,  2,  4,  0, $05, 1
	
TitleLensFlare_OAM104:
	dsprite 13,  1,  3,  0, $00, 1
	dsprite 14,  1,  3,  0, $02, 1
	dsprite 15,  1,  3,  0, $04, 1
	dsprite 13,  1,  4,  0, $01, 1
	dsprite 14,  1,  4,  0, $03, 1
	dsprite 15,  1,  4,  0, $05, 1
	
TitleLensFlare_OAM105:
	dsprite 13,  0,  3,  0, $00, 1
	dsprite 14,  0,  3,  0, $02, 1
	dsprite 15,  0,  3,  0, $04, 1
	dsprite 13,  0,  4,  0, $01, 1
	dsprite 14,  0,  4,  0, $03, 1
	dsprite 15,  0,  4,  0, $05, 1
	
TitleLensFlare_OAM106:
	dsprite 12,  7,  3,  0, $00, 1
	dsprite 13,  7,  3,  0, $02, 1
	dsprite 14,  7,  3,  0, $04, 1
	dsprite 12,  7,  4,  0, $01, 1
	dsprite 13,  7,  4,  0, $03, 1
	dsprite 14,  7,  4,  0, $05, 1
	
TitleLensFlare_OAM107:
	dsprite 12,  6,  3,  0, $00, 1
	dsprite 13,  6,  3,  0, $02, 1
	dsprite 14,  6,  3,  0, $04, 1
	dsprite 12,  6,  4,  0, $01, 1
	dsprite 13,  6,  4,  0, $03, 1
	dsprite 14,  6,  4,  0, $05, 1
	
TitleLensFlare_OAM108:
	dsprite 12,  5,  3,  0, $00, 1
	dsprite 13,  5,  3,  0, $02, 1
	dsprite 14,  5,  3,  0, $04, 1
	dsprite 12,  5,  4,  0, $01, 1
	dsprite 13,  5,  4,  0, $03, 1
	dsprite 14,  5,  4,  0, $05, 1
	
TitleLensFlare_OAM109:
	dsprite 12,  4,  3,  0, $00, 1
	dsprite 13,  4,  3,  0, $02, 1
	dsprite 14,  4,  3,  0, $04, 1
	dsprite 12,  4,  4,  0, $01, 1
	dsprite 13,  4,  4,  0, $03, 1
	dsprite 14,  4,  4,  0, $05, 1
	
TitleLensFlare_OAM110:
	dsprite 12,  3,  3,  0, $00, 1
	dsprite 13,  3,  3,  0, $02, 1
	dsprite 14,  3,  3,  0, $04, 1
	dsprite 12,  3,  4,  0, $01, 1
	dsprite 13,  3,  4,  0, $03, 1
	dsprite 14,  3,  4,  0, $05, 1
	
TitleLensFlare_OAM111:
	dsprite 12,  2,  3,  0, $00, 1
	dsprite 13,  2,  3,  0, $02, 1
	dsprite 14,  2,  3,  0, $04, 1
	dsprite 12,  2,  4,  0, $01, 1
	dsprite 13,  2,  4,  0, $03, 1
	dsprite 14,  2,  4,  0, $05, 1
	
TitleLensFlare_OAM112:
	dsprite 12,  1,  3,  0, $00, 1
	dsprite 13,  1,  3,  0, $02, 1
	dsprite 14,  1,  3,  0, $04, 1
	dsprite 12,  1,  4,  0, $01, 1
	dsprite 13,  1,  4,  0, $03, 1
	dsprite 14,  1,  4,  0, $05, 1
	
TitleLensFlare_OAM113:
	dsprite 12,  0,  3,  0, $00, 1
	dsprite 13,  0,  3,  0, $02, 1
	dsprite 14,  0,  3,  0, $04, 1
	dsprite 12,  0,  4,  0, $01, 1
	dsprite 13,  0,  4,  0, $03, 1
	dsprite 14,  0,  4,  0, $05, 1
