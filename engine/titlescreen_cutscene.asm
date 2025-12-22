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
	dw TitleScreenTimer0
	dw TitleScreenCutscene0
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
	ld bc, 3 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	ld hl, TitleMedBirds_OAM
	ld de, wSprites + 3 *4
	ld bc, 10 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	ld hl, TitleBigBird_OAM
	ld de, wSprites + 13 * 4
	ld bc, 16 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a

	ld a, 0
	ld [wMagnetTrainDirection], a

;	ld c, 60
;	call DelayFrames

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

	ld hl, TitleScreenPalettes1
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
	
TitleScreenCutscene0:
	call LenseFlareAnimate2
	; Run the timer down.
	ld hl, wcf65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jp z, .end
	
	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	
;	ld hl, wcf65
;	ld a, [hl]
;	and %000001
;	jr nz, .big_bird
	
	ld hl, wcf65
	inc hl
	ld a, [hl]
	cp 1
	jr z, .med_birds
	dec hl
	ld a, [hl]
	cp $f0
	jr c, .big_bird
.med_birds
	ld a, 10 ;number of sprites
	ld hl, wSprites + 3 *4
.med_birds_loop
	dec [hl]
	inc hl
	dec [hl]
	inc hl
	inc hl
	inc hl
	dec a
	cp 0
	jr nz, .med_birds_loop
	
	
.big_bird
	ld hl, wcf65
	inc hl
	ld a, [hl]
	cp 1
	jr z, .done_birds
	ld a, 16 ;number of sprites
	ld hl, wSprites + 13 * 4
.big_bird_loop
	dec [hl]
	inc hl
	dec [hl]
	inc hl
	inc hl
	inc hl
	dec a
	cp 0
	jr nz, .big_bird_loop	
.done_birds
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and START | A_BUTTON
	jp nz, TitleScreenSkipToEnd

	ld hl, wcf65
	ld a, [hl]
	cp $98
	jr z, .pal2
	cp $96
	jr z, .pal1
	cp $b6
	jr z, .pal2
	cp $b4
	jr z, .pal3
	ret
.pal1
	ld hl, TitleScreenPalettes1
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	ld hl, TitleScreenOBPalettes1
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 0
	call FadePalettes
	ret
.pal2
	ld hl, TitleScreenPalettes2
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	ld hl, TitleScreenOBPalettes2
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 0
	call FadePalettes
	ret
.pal3
	ld hl, TitleScreenPalettes3
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	ld hl, TitleScreenOBPalettes3
	ld a, BANK(wUnknOBPals)
	call StackCallInWRAMBankA
	ld de, wUnknOBPals
	ld bc, 8 palettes
	rst CopyBytes
	ld c, 0
	call FadePalettes
	ret
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret

TitleScreenCutscene1:
	call LenseFlareAnimate
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
	
	ld hl, wcf65
	ld a, [hl]
	and %000001
	jr nz, .done_birds
	
;.med_birds
	ld hl, wcf65
	inc hl
	ld a, [hl]
	cp 1
	jr z, .done_birds
	dec hl
	ld a, [hl]
	cp $a3
	jr nc, .done_birds
	ld a, 10 ;number of sprites
	ld hl, wSprites + 3 *4
.med_birds_loop
	dec [hl]
	inc hl
	dec [hl]
	inc hl
	inc hl
	inc hl
	dec a
	cp 0
	jr nz, .med_birds_loop
	
.done_birds	
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and START | A_BUTTON
	jp nz, TitleScreenSkipToEnd
	
	xor a
	ldh [hLCDCPointer], a
	
	ld hl, wcf65
	ld a, [hl]
	and %011111
	jr nz, .cont
	
	call TitleScreenScrollDown
	
	ld a, [wNumHits]
	inc a
	ld [wNumHits], a	
.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
	
TitleScreenCutscene2:
	call LenseFlareAnimate
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

	ld hl, wcf65
	ld a, [hl]
	and %000111
	jr nz, .cont
	
	call TitleScreenScrollDown
	
	ld a, [wNumHits]
	inc a
	ld [wNumHits], a
.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret

TitleScreenCutscene3:
	call LenseFlareAnimate
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
	
	ld hl, wcf65
	ld a, [hl]
	and %000001
	jr nz, .cont
	
	call TitleScreenScrollDown

	ld a, [wNumHits]
	inc a
	ld [wNumHits], a
.cont
	ret
	
.end
	ld hl, wJumptableIndex
	inc [hl]
	ld hl, wcf65
	inc [hl]
	ret
	
LenseFlareAnimate:
	ld hl, wcf65
	ld a, [hl]
	and %000001
	jr nz, .clear

	ld a, [wNumHits]
	cp $31
	jr nc, .clear
	ld e, a
	ld d, 0
	ld hl, GetTitleLensFlare_OAM
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
	ld de, wSprites + 37 *4
	ld bc, 3 * 4	;number of sprites * 4 bytes per sprite
	jp CopyBytes
.clear
	ld hl, TitleLensFlare_OAM00
	ld de, wSprites + 37 *4
	ld bc, 3 * 4	;number of sprites * 4 bytes per sprite
	jp CopyBytes
	
LenseFlareAnimate2:
	ld hl, wcf65
	ld a, [hl]
	cp $96
	jr c, .cont
	cp $b6
	jr nc, .cont
	jr .clear
.cont
	and %000001
	jr nz, .clear
	ld hl, TitleLensFlare_OAM01
	ld de, wSprites
	ld bc, 3 * 4	;number of sprites * 4 bytes per sprite
	jp CopyBytes
.clear
	ld hl, TitleLensFlare_OAM00
	ld de, wSprites
	ld bc, 3 * 4	;number of sprites * 4 bytes per sprite
	jp CopyBytes
	
GetTitleLensFlare_OAM:
	dw TitleLensFlare_OAM01
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
	
TitleWavePalsList:
	dw TitleScreenWavePalettes2
	dw TitleScreenWavePalettes2
	dw TitleScreenWavePalettes3
	dw TitleScreenWavePalettes3
	dw TitleScreenWavePalettes4
	dw TitleScreenWavePalettes4
	dw TitleScreenWavePalettes5
	dw TitleScreenWavePalettes6
	dw TitleScreenWavePalettes6
	dw TitleScreenWavePalettes1
	
TitleScreenSkipToEnd:
	ld de, 73 * 39
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wJumptableIndex
	ld a, 9
	ld [hl], a
	ret
	
TitleScreenFlash:
	ld c, 6
	call DelayFrames
	
	call SetWhitePals
	ld c, 6
	call FadePalettes
	
	call DisableLCD
	
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

	ld hl, TitleScreenPalettes1
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	
	ld hl, TitleScreenWavePalettes1
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
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
	
	ld hl, Title_OAM
	ld de, wSprites
	ld bc, 40 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	xor a
	ldh [rVBK], a
	ld hl, TitleLogoTilemap
	farcall LoadTitleScreenTilemap	
	
	call EnableLCD
	
	xor a
	ld [wTitleBird1], a
	ld [wTitleBird1TileTimer], a
	ld [wWaveFrame], a
	ld a, 20
	ld [wTitleBird2], a
	ld a, 40
	ld [wTitleBird2TileTimer], a
	
	ld c, 6
	call FadePalettes

	ld hl, wJumptableIndex
	inc [hl]
	ret

TitleScreenTimer0:
	call LenseFlareAnimate2
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld de, 348
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	
	ld a, 0
	ldh [hSCY], a
	ret

TitleScreenTimer1:
	ld a, 10 ;number of sprites
	ld hl, wSprites + 3 *4
.med_birds_loop
	dec [hl]
	inc hl
	dec [hl]
	inc hl
	inc hl
	inc hl
	dec a
	cp 0
	jr nz, .med_birds_loop
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
	ldh [hSCY], a
	
	; call ClearSprites
	

	
	ld hl, TitleLensFlare_OAM00
	ld de, wSprites
	ld bc, 3 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	call LenseFlareAnimate
	
	ret

TitleScreenTimer2:
	ld hl, TitlePanning_OAM
	ld de, wSprites
	ld bc, 25 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld de, 199
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	
	call LenseFlareAnimate
	ret

	
TitleScreenTimer3:

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld de, 166
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	
	call LenseFlareAnimate
	ret


TitleScreenTimer4:

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

;	ld a, [wSaveFileExists]
;	and a
;	jr z, .ok
;	ld hl, wStatusFlags
;	bit 6, [hl] ; hall of fame
;	jr z, .ok
;	ld de, 56 * 60
;.ok
; Start a timer
	ld de, 2800
	ld hl, wcf65
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 6304

TitleScreenMain:
	hlcoord 11, 1
	lb bc, 1, 6
	lb de, $80, 0
	farcall DrawTitleGraphic

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

	call TitleAnimateBirds
	call TitleAnimateWaves
	call TitleAnimateBreak
;	call DelayFrame
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	call TitleScreenScrollRight
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
.done
	ld [wIntroSceneFrameCounter], a
	call SetWhitePals
	ld c, 6
	call FadePalettes
; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
	
TitleAnimateBreak:
	ld hl, wSprites + 19  * 4 + 2	;number of sprites before break * 4 bytes per sprite + 2 bytes for tile id
	ld c, 6
	ld a, [wWaveFrame]
	cp 16
	jr nc, .clear
	cp 15
	jr nc, .five
	cp 14
	jr nc, .four
	cp 13
	jr nc, .three
	cp 12
	jr nc, .two
	cp 11
	jr nc, .one
.clear
	ld a, $36
	call .loop
	ld hl, wSprites + 24  * 4 + 2	;last cliff tile id
	ld a, $35
	ld [hl], a
	ret
.one
	ld a, $18
	jr .loop
.two
	ld a, $1e
	jr .loop
.three
	ld a, $24
	jr .loop
.four
	ld a, $2a
	jr .loop
.five
	ld a, $30
.loop
	ld [hl], a
	inc a
	inc hl
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret
	
TitleAnimateWaves:
	ld hl, wcf65
	ld a, [hl]
	and %000111
	ret nz
	ld a, [wWaveFrame]
	inc a
	and 31
	ld [wWaveFrame], a
	cp 8
	ret c
	cp 18
	ret nc
	sub 8
	ld e, a
	ld d, 0
	ld hl, TitleWavePalsList
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	ld de, wUnknBGPals + 3 palettes
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA
	ld bc, 1 palettes
	rst CopyBytes
	ld c, 1
	call FadePalettes
	ret

TitleAnimateBirds:
	ld hl, wSprites + 28  * 4 + 2	;number of sprites before bird * 4 bytes per sprite + 2 bytes for tile id
	ld bc, wTitleBird1
	ld de, wTitleBird1TileTimer
	call AnimateBird
	ld hl, wSprites + 29  * 4 + 2	;number of sprites before bird * 4 bytes per sprite + 2 bytes for tile id
	ld bc, wTitleBird2
	ld de, wTitleBird2TileTimer
	call AnimateBird
	ret
	
AnimateBird:
	call GetBirdTile
	dec hl
	dec hl
	ld a, [wcf65]
	and 7
	ret nz
	ld a, [bc]
	inc a
	ld [bc], a
	cp 78
	jr nc, .loop
	cp 77
	jr nc, .overshot
	cp 72
	call nc, .up
	and 15
	call z, .down
	call .left
	ret
.up
	dec [hl]
	ret
.loop
	xor a
	ld [bc], a
	ld [de], a
	ret
.down
	inc [hl]
	ret
.left
	and 1
	ret nz
	inc hl
	dec [hl]
	ret
.overshot
	inc [hl]
	inc hl
	dec [hl]
	ret
	
GetBirdTile:
	ld a, [wcf65]
	and 3
	ret nz
	ld a, [de]
	inc a
	ld [de], a
	cp 152
	jr nc, .mid
	cp 144
	jr nc, .down
	cp 143
	jr nc, .mid
	cp 142
	jr nc, .up
	cp 141
	jr nc, .mid
	cp 140
	jr nc, .down
	cp 139
	jr nc, .mid
	cp 138
	jr nc, .up
	ret
.mid
	ld a, $0b
	ld [hl], a
	ret
.up
	ld a, $08
	ld [hl], a
	ret
.down
	ld a, $0e
	ld [hl], a
	ret

TitleScreenEnd:

; Wait until the music is done fading.

	ld hl, wcf65
	inc [hl]

	ld a, [wMusicFade]
	and a
	ret nz

	ld a, 2
	ld [wIntroSceneFrameCounter], a

	call SetWhitePals
	ld c, 6
	call FadePalettes

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 6389

TitleScreenScrollDown:
	ld hl, wSprites
	ld a, 25	;number of sprites
.loop
	dec [hl]
	inc hl
	inc hl
	inc hl
	inc hl
	dec a
	jr nz, .loop
	ldh a, [hSCY]
	inc a
	ldh [hSCY], a
	ret
	
TitleScreenScrollRight:
	ld hl, wLYOverridesBackup
	ldh a, [hSCY]
	ld b, a
	ld a, 241
	sub b
	ld c, a
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
	ld hl, wcf65
	ld a, [hl]
	and %000001
	jr nz, .end
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
.end
	ret
.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret
	
TitleScreenPalettes1:
; BG
	RGB 15, 24, 31
	RGB 20, 21, 24
	RGB 31, 10, 06
	RGB 28, 29, 31
	
	RGB 00, 00, 31
	RGB 18, 09, 09
	RGB 13, 08, 09
	RGB 09, 06, 08
	
	RGB 28, 29, 31
	RGB 22, 28, 31
	RGB 15, 24, 31
	RGB 07, 17, 28
	
	RGB 15, 24, 31
	RGB 19, 26, 31
	RGB 26, 30, 31
	RGB 28, 29, 31
	
	RGB 15, 24, 31
	RGB 23, 29, 31
	RGB 26, 30, 31
	RGB 28, 29, 31
	
	RGB 31, 13, 21
	RGB 31, 17, 24
	RGB 23, 03, 06
	RGB 15, 24, 31
	
	RGB 28, 29, 31
	RGB 31, 20, 25
	RGB 23, 03, 06
	RGB 15, 24, 31
	
	RGB 28, 29, 31
	RGB 31, 22, 26
	RGB 23, 03, 06
	RGB 15, 24, 31
	
TitleScreenPalettes2:
; BG
	
	RGB 13, 22, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 13, 22, 31
	RGB 16, 24, 31
	RGB 21, 27, 31
	RGB 28, 30, 30
	
	RGB 13, 22, 31
	RGB 20, 28, 31
	RGB 25, 30, 31
	RGB 28, 30, 30
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
TitleScreenPalettes3:
; BG
	RGB 09, 19, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 09, 19, 31
	RGB 09, 19, 31
	RGB 11, 21, 31
	RGB 26, 30, 31
	
	RGB 09, 19, 31
	RGB 15, 24, 31
	RGB 23, 29, 31
	RGB 26, 30, 31
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
TitleScreenOBPalettes1:
;OB
	RGB 31, 31, 31
	RGB 22, 04, 05
	RGB 12, 13, 15
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 22, 04, 05
	RGB 15, 01, 02
	RGB 07, 07, 07

	RGB 28, 29, 31
	RGB 11, 20, 29
	RGB 07, 17, 27
	RGB 04, 14, 24

	RGB 31, 00, 00
	RGB 04, 12, 09
	RGB 01, 08, 05
	RGB 31, 00, 00

	RGB 00, 00, 31
	RGB 18, 09, 09
	RGB 13, 08, 09
	RGB 09, 06, 08

	RGB 00, 00, 31
	RGB 28, 29, 31
	RGB 11, 24, 31
	RGB 09, 06, 08

	RGB 31, 00, 00
	RGB 31, 31, 31
	RGB 31, 22, 26
	RGB 23, 03, 06

	RGB 00, 00, 00
	RGB 16, 25, 31
	RGB 18, 26, 31
	RGB 21, 27, 31
	
TitleScreenOBPalettes2:
;OB
	RGB 31, 31, 31
	RGB 22, 04, 05
	RGB 12, 13, 15
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 22, 04, 05
	RGB 15, 01, 02
	RGB 07, 07, 07

	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 07, 14, 21
	RGB 06, 12, 19

	RGB 31, 00, 00
	RGB 04, 12, 09
	RGB 01, 08, 05
	RGB 31, 00, 00

	RGB 00, 00, 31
	RGB 18, 09, 09
	RGB 13, 08, 09
	RGB 09, 06, 08

	RGB 00, 00, 31
	RGB 28, 29, 31
	RGB 11, 24, 31
	RGB 09, 06, 08

	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 31, 00

	RGB 00, 00, 00
	RGB 10, 17, 26
	RGB 11, 21, 30
	RGB 21, 27, 31
	
TitleScreenOBPalettes3:
;OB
	RGB 31, 31, 31
	RGB 22, 04, 05
	RGB 12, 13, 15
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 22, 04, 05
	RGB 15, 01, 02
	RGB 07, 07, 07

	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 07, 07, 07
	RGB 07, 07, 07

	RGB 31, 00, 00
	RGB 04, 12, 09
	RGB 01, 08, 05
	RGB 31, 00, 00

	RGB 00, 00, 31
	RGB 18, 09, 09
	RGB 13, 08, 09
	RGB 09, 06, 08

	RGB 00, 00, 31
	RGB 28, 29, 31
	RGB 11, 24, 31
	RGB 09, 06, 08

	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 31

	RGB 00, 00, 00
	RGB 11, 21, 30
	RGB 21, 27, 31
	RGB 31, 31, 31
	
TitleScreenWavePalettes1:
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	
TitleScreenWavePalettes2:
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	RGB 11, 24, 31	;lite
	RGB 07, 17, 28	;dark
	
TitleScreenWavePalettes3:
	RGB 07, 17, 28	;dark
	RGB 28, 29, 31	;white
	RGB 11, 24, 31	;lite
	RGB 07, 17, 28	;dark
	
TitleScreenWavePalettes4:
	RGB 28, 29, 31	;white
	RGB 11, 24, 31	;lite
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	
TitleScreenWavePalettes5:
	RGB 11, 24, 31	;lite
	RGB 11, 24, 31	;lite
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	
TitleScreenWavePalettes6:
	RGB 11, 24, 31	;lite
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	RGB 07, 17, 28	;dark
	
TitleMedBirds_OAM:
;y pos, x pos, tile, palette
	dsprite  12,  0, 23,  0, $48, 2
	dsprite  12,  0, 24,  0, $49, 2
	dsprite  13,  0, 23,  0, $4e, 2
	dsprite  12,  5, 25,  0, $48, 2
	dsprite  12,  5, 26,  0, $49, 2
	dsprite  13,  5, 25,  0, $4e, 2
	dsprite  14,  0, 23,  0, $4a, 2
	dsprite  14,  0, 24,  0, $4b, 2
	dsprite  15,  0, 23,  0, $50, 2
	dsprite  15,  0, 24,  0, $51, 2
	
TitleBigBird_OAM:
;y pos, x pos, tile, palette
	dsprite  19,  11,  23,  0, $4c, 2
	dsprite  19,  11,  24,  0, $4d, 2
	dsprite  20,  11,  20,  0, $52, 2
	dsprite  20,  11,  21,  0, $53, 2
	dsprite  20,  11,  22,  0, $54, 2
	dsprite  20,  11,  23,  0, $55, 2
	dsprite  20,  11,  24,  0, $56, 2
	dsprite  21,  11,  21,  0, $57, 2
	dsprite  21,  11,  22,  0, $58, 2
	dsprite  21,  11,  23,  0, $59, 2
	dsprite  22,  11,  20,  0, $5a, 2
	dsprite  22,  11,  21,  0, $5b, 2
	dsprite  22,  11,  22,  0, $5c, 2
	dsprite  22,  11,  22,  0, $4f, 2
	dsprite  23,  11,  20,  0, $5e, 2
	dsprite  23,  11,  21,  0, $5f, 2
	
TitlePanning_OAM:
;y pos, x pos, tile, palette
	dsprite 21,  4,  4,  0, $0f, 0
	dsprite 22,  4,  3,  3, $07, 0
	dsprite 22,  4,  4,  3, $05, 0
	dsprite 23,  4,  3,  0, $00, 0
	dsprite 23,  4,  4,  0, $01, 0
	dsprite 23,  4,  5,  0, $02, 0
	dsprite 24,  4,  3,  0, $03, 1
	dsprite 24,  4,  5,  0, $04, 1
	dsprite 25,  4,  3,  0, $06, 0
	dsprite 25,  3,  5,  0, $02, 0
	dsprite 26,  4,  3,  0, $09, 1
	dsprite 26,  4,  5,  0, $0a, 1
	dsprite 27,  4,  1,  0, $10, 3
	dsprite 27,  4,  2,  0, $11, 3
	dsprite 27,  4,  3,  0, $0c, 0
	dsprite 27,  4,  5,  0, $0d, 0
	dsprite 27,  4,  5,  6, $12, 4
	dsprite 27,  4,  6,  6, $13, 4
	dsprite 28,  4,  9,  0, $14, 4
	dsprite 30,  4,  9,  0, $35, 5
	dsprite 31,  4,  1,  0, $15, 5
	dsprite 31,  4,  2,  0, $16, 5
	dsprite 31,  4,  3,  0, $17, 5
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
Title_OAM:
;y pos, x pos, tile, palette
	dsprite  8,  0,  4,  0, $0f, 0
	dsprite  9,  0,  3,  3, $07, 0
	dsprite  9,  0,  4,  3, $05, 0
	dsprite 10,  0,  3,  0, $00, 0
	dsprite 10,  0,  4,  0, $01, 0
	dsprite 10,  0,  5,  0, $02, 0
	dsprite 11,  0,  3,  0, $03, 1
	dsprite 11,  0,  5,  0, $04, 1
	dsprite 12,  0,  3,  0, $06, 0
	dsprite 11,  7,  5,  0, $02, 0
	dsprite 13,  0,  3,  0, $09, 1
	dsprite 13,  0,  5,  0, $0a, 1
	dsprite 14,  0,  1,  0, $10, 3
	dsprite 14,  0,  2,  0, $11, 3
	dsprite 14,  0,  3,  0, $0c, 0
	dsprite 14,  0,  5,  0, $0d, 0
	dsprite 14,  0,  5,  6, $12, 4
	dsprite 14,  0,  6,  6, $13, 4
	dsprite 15,  0,  9,  0, $14, 4
	dsprite 17,  0,  3,  7, $36, 5
	dsprite 17,  0,  5,  0, $36, 5
	dsprite 17,  0,  6,  0, $36, 5
	dsprite 17,  0,  7,  0, $36, 5
	dsprite 17,  0,  8,  0, $36, 5
	dsprite 17,  0,  9,  0, $35, 5
	dsprite 18,  0,  1,  0, $15, 5
	dsprite 18,  0,  2,  0, $16, 5
	dsprite 18,  0,  3,  0, $17, 5
	dsprite  9,  6, 21,  0, $0b, 2 | PRIORITY
	dsprite  9,  1, 21,  6, $0b, 2 | PRIORITY
	dsprite 19,  0, 12,  0, $3c, 6
	dsprite 19,  0, 13,  0, $3d, 6
	dsprite 19,  0, 14,  0, $3e, 6
	dsprite 19,  0, 15,  0, $3f, 6
	dsprite 19,  0, 16,  0, $40, 6
	dsprite 19,  0, 17,  0, $41, 6
	dsprite 19,  0, 18,  0, $42, 6
	dsprite 19,  0, 19,  0, $43, 6
	dsprite 19,  0, 20,  0, $44, 6
	dsprite 19,  0, 1,  0, $4a, 6
	
TitleLensFlare_OAM00:
;y pos, x pos, tile, palette
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  0,  0, $00, 0
	
TitleLensFlare_OAM01:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  0, $45, 7
	dsprite  6,  0, 15,  0, $46, 7
	dsprite  4,  0, 17,  0, $47, 7
	
TitleLensFlare_OAM02:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  1, $45, 7
	dsprite  6,  1, 15,  0, $46, 7
	dsprite  4,  2, 17,  0, $47, 7
	
TitleLensFlare_OAM03:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  2, $45, 7
	dsprite  6,  2, 15,  0, $46, 7
	dsprite  4,  4, 16,  7, $47, 7
	
TitleLensFlare_OAM04:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  3, $45, 7
	dsprite  6,  3, 15,  0, $46, 7
	dsprite  4,  6, 16,  7, $47, 7
	
TitleLensFlare_OAM05:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  4, $45, 7
	dsprite  6,  4, 15,  0, $46, 7
	dsprite  5,  0, 16,  6, $47, 7
	
TitleLensFlare_OAM06:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  4, $45, 7
	dsprite  6,  5, 15,  0, $46, 7
	dsprite  5,  2, 16,  6, $47, 7
	
TitleLensFlare_OAM07:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  5, $45, 7
	dsprite  6,  6, 15,  0, $46, 7
	dsprite  5,  4, 16,  5, $47, 7
	
TitleLensFlare_OAM08:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  5, $45, 7
	dsprite  6,  7, 15,  0, $46, 7
	dsprite  5,  6, 16,  5, $47, 7
	
TitleLensFlare_OAM09:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  6, $45, 7
	dsprite  7,  0, 15,  0, $46, 7
	dsprite  6,  0, 16,  4, $47, 7
	
TitleLensFlare_OAM10:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  6, $45, 7
	dsprite  7,  1, 14,  7, $46, 7
	dsprite  6,  2, 16,  4, $47, 7
	
TitleLensFlare_OAM11:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  6, $45, 7
	dsprite  7,  2, 14,  7, $46, 7
	dsprite  6,  4, 16,  3, $47, 7
	
TitleLensFlare_OAM12:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  7,  3, 14,  7, $46, 7
	dsprite  6,  6, 16,  3, $47, 7
	
TitleLensFlare_OAM13:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  7,  4, 14,  7, $46, 7
	dsprite  7,  0, 16,  3, $47, 7
	
TitleLensFlare_OAM14:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  7,  5, 14,  7, $46, 7
	dsprite  7,  2, 16,  2, $47, 7
	
TitleLensFlare_OAM15:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  7,  5, 14,  7, $46, 7
	dsprite  7,  3, 16,  2, $47, 7
	
TitleLensFlare_OAM16:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  7,  6, 14,  7, $46, 7
	dsprite  7,  4, 16,  2, $47, 7
	
TitleLensFlare_OAM17:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  7,  6, 14,  7, $46, 7
	dsprite  7,  5, 16,  1, $47, 7
	
TitleLensFlare_OAM18:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  7,  7, 14,  7, $46, 7
	dsprite  7,  6, 16,  1, $47, 7
	
TitleLensFlare_OAM19:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  7,  7, 14,  7, $46, 7
	dsprite  7,  7, 16,  1, $47, 7
	
TitleLensFlare_OAM20:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  7,  7, 14,  7, $46, 7
	dsprite  7,  7, 16,  1, $47, 7
	
TitleLensFlare_OAM21: ;middle
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  0, 14,  7, $46, 7
	dsprite  8,  0, 16,  0, $47, 7
	
TitleLensFlare_OAM22: ;middle
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  0, 14,  7, $46, 7
	dsprite  8,  0, 16,  0, $47, 7
	
TitleLensFlare_OAM23: ;middle
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  0, 14,  7, $46, 7
	dsprite  8,  0, 16,  0, $47, 7
	
TitleLensFlare_OAM24:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  1, 14,  7, $46, 7
	dsprite  8,  1, 16,  1, $47, 7
	
TitleLensFlare_OAM25:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  1, 14,  7, $46, 7
	dsprite  8,  1, 16,  1, $47, 7
	
TitleLensFlare_OAM26:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  1, 14,  7, $46, 7
	dsprite  8,  2, 16,  1, $47, 7
	
TitleLensFlare_OAM27:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  2, 14,  7, $46, 7
	dsprite  8,  3, 16,  1, $47, 7
	
TitleLensFlare_OAM28:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  2, 14,  7, $46, 7
	dsprite  8,  4, 16,  2, $47, 7
	
TitleLensFlare_OAM29:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  3, 14,  7, $46, 7
	dsprite  8,  5, 16,  2, $47, 7
	
TitleLensFlare_OAM30:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  3, 14,  7, $46, 7
	dsprite  8,  6, 16,  2, $47, 7
	
TitleLensFlare_OAM31:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  4, 14,  7, $46, 7
	dsprite  9,  0, 16,  3, $47, 7
	
TitleLensFlare_OAM32:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  5, 14,  7, $46, 7
	dsprite  9,  2, 16,  3, $47, 7
	
TitleLensFlare_OAM33:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  6, 14,  7, $46, 7
	dsprite  9,  4, 16,  3, $47, 7
	
TitleLensFlare_OAM34:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  8,  7, 14,  7, $46, 7
	dsprite  9,  6, 16,  4, $47, 7
	
TitleLensFlare_OAM35:
;y pos, x pos, tile, palette
	dsprite  8,  0, 14,  0, $45, 7
	dsprite  9,  0, 15,  0, $46, 7
	dsprite 10,  0, 16,  4, $47, 7
	
TitleLensFlare_OAM36:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  9,  1, 15,  0, $46, 7
	dsprite 10,  2, 16,  5, $47, 7
	
TitleLensFlare_OAM37:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  9,  2, 15,  0, $46, 7
	dsprite 10,  4, 16,  5, $47, 7
	
TitleLensFlare_OAM38:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  9,  3, 15,  0, $46, 7
	dsprite 10,  6, 16,  6, $47, 7
	
TitleLensFlare_OAM39:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  7, $45, 7
	dsprite  9,  4, 15,  0, $46, 7
	dsprite 11,  0, 16,  6, $47, 7
	
TitleLensFlare_OAM40:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  6, $45, 7
	dsprite  9,  5, 15,  0, $46, 7
	dsprite 11,  2, 16,  7, $47, 7
	
TitleLensFlare_OAM41:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  6, $45, 7
	dsprite  9,  6, 15,  0, $46, 7
	dsprite 11,  4, 16,  7, $47, 7
	
TitleLensFlare_OAM42:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  6, $45, 7
	dsprite  9,  7, 15,  0, $46, 7
	dsprite 11,  6, 17,  0, $47, 7
	
TitleLensFlare_OAM43:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  5, $45, 7
	dsprite 10,  0, 15,  0, $46, 7
	dsprite 12,  0, 17,  0, $47, 7
	
TitleLensFlare_OAM45:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  4, $45, 7
	dsprite 10,  2, 15,  0, $46, 7
	dsprite 12,  4, 17,  1, $47, 7
	
TitleLensFlare_OAM48:
;y pos, x pos, tile, palette
	dsprite  8,  0, 13,  2, $45, 7
	dsprite 10,  5, 15,  0, $46, 7
	dsprite 13,  2, 17,  3, $47, 7
