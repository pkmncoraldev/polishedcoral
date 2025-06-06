Predef_StartBattle: ; 8c20f
	ld a, [wTileset]
	ld [wMoogoo], a ;wTileset gets temporarily overwriten during the pal fade
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .not_running
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite

.not_running
	call .InitGFX
	ldh a, [rBGP]
	ld [wBGP], a
	ldh a, [rOBP0]
	ld [wOBP0], a
	ldh a, [rOBP1]
	ld [wOBP1], a
	call DelayFrame
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], 3
	jr .handleLoop

.loop
	call FlashyTransitionToBattle
;	ld c, 150
	call DelayFrame
.handleLoop
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop

.done
	eventflagcheck EVENT_FAKE_BATTLE_INTO
	jr nz, .skip2
	ldh a, [rSVBK]
	push af
	ld a, BANK(wUnknBGPals)
	ldh [rSVBK], a

	ld hl, wUnknBGPals
	ld bc, 8 palettes
	xor a
	call ByteFill

	pop af
	ldh [rSVBK], a

	ld a, %11111111
	ld [wBGP], a
	call DmgToCgbBGPals
	call DelayFrame
.skip2
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCY], a

	ld a, BANK(wEnemyMon)
	ldh [rSVBK], a
	ld hl, rIE
	res LCD_STAT, [hl]
	pop af
	ldh [hVBlank], a
	jp DelayFrame
; 8c26d

.InitGFX: ; 8c26d
	eventflagcheck EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	jr nz, .skip
	farcall ReanchorBGMap_NoOAMUpdate
.skip
	call UpdateSprites
	call DelayFrame
	call .LoadPokeballTiles
	ld b, 3
	call SafeCopyTilemapAtOnce
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jp WipeLYOverrides
; 8c2a0

.LoadPokeballTiles: ; 8c2a0
; Load the tiles used in the Pokeball Graphic that fills the screen
; at the start of every Trainer battle.
	ld a, $1
	ldh [rVBK], a
	ld de, .TrainerBattlePokeballTiles
	ld hl, VTiles3 tile $f8
	lb bc, BANK(.TrainerBattlePokeballTiles), 2
	call Request2bpp
	xor a
	ldh [rVBK], a
	ld de, .TrainerBattlePokeballTiles
	ld hl, VTiles0 tile $f8
	lb bc, BANK(.TrainerBattlePokeballTiles), 2
	jp Request2bpp
; 8c2f4

.TrainerBattlePokeballTiles: ; 8c2f4
INCBIN "gfx/overworld/trainer_battle_pokeball_tiles.2bpp"


FlashyTransitionToBattle: ; 8c314
	jumptable .dw, wJumptableIndex
; 8c323

.dw ; 8c323 (23:4323)
	dw StartTrainerBattle_DetermineWhichAnimation ; 00

	; Animation 1: cave
	dw StartTrainerBattle_LoadPokeBallGraphics ; 01
	dw StartTrainerBattle_SetUpBGMap ; 02
	dw StartTrainerBattle_Flash ; 03
	dw StartTrainerBattle_Flash ; 04
	dw StartTrainerBattle_Flash ; 05
	dw StartTrainerBattle_NextScene ; 06
	dw StartTrainerBattle_SetUpForWavyOutro ; 07
	dw StartTrainerBattle_SineWave ; 08

	; Animation 2: cave, stronger
	dw StartTrainerBattle_LoadPokeBallGraphics ; 09
	dw StartTrainerBattle_SetUpBGMap ; 0a
	dw StartTrainerBattle_Flash ; 0b
	dw StartTrainerBattle_Flash ; 0c
	dw StartTrainerBattle_Flash ; 0d
	dw StartTrainerBattle_NextScene ; 0e
	; There is no setup for this one
	dw StartTrainerBattle_ZoomToBlack ; 0f

	; Animation 3: no cave
	dw StartTrainerBattle_LoadPokeBallGraphics ; 10
	dw StartTrainerBattle_SetUpBGMap ; 11
	dw StartTrainerBattle_Flash ; 12
	dw StartTrainerBattle_Flash ; 13
	dw StartTrainerBattle_Flash ; 14
	dw StartTrainerBattle_NextScene ; 15
	dw StartTrainerBattle_SetUpForSpinOutro ; 16
	dw StartTrainerBattle_SpinToBlack ; 17

	; Animation 4: no cave, stronger
	dw StartTrainerBattle_LoadPokeBallGraphics ; 18
	dw StartTrainerBattle_SetUpBGMap ; 19
	dw StartTrainerBattle_Flash ; 1a
	dw StartTrainerBattle_Flash ; 1b
	dw StartTrainerBattle_Flash ; 1c
	dw StartTrainerBattle_NextScene ; 1d
	dw StartTrainerBattle_SetUpForRandomScatterOutro ; 1e
	dw StartTrainerBattle_SpeckleToBlack ; 1f

	; All animations jump to here.
	dw StartTrainerBattle_Finish ; 20
	
	; fake animation
	dw StartTrainerBattle_LoadPokeBallGraphics.skip_hide ; 21
	dw StartTrainerBattle_SetUpBGMap ; 22
	dw StartTrainerBattle_Flash ; 23
	dw StartTrainerBattle_Flash ; 24
	dw StartTrainerBattle_Flash2 ; 25


StartTrainerBattle_DetermineWhichAnimation: ; 8c365 (23:4365)
; The screen flashes a different number of
; times depending on the level of your lead
; Pokemon relative to the opponent's.
	ld de, 0

	ld a, [wOtherTrainerClass]
	cp $69
	jr z, .fake
	and a
	jr z, .wild
	farcall SetTrainerBattleLevel

; Get the first Pokemon in your party that isn't fainted.
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .ok
	add hl, bc
	jr .loop
.ok
; to PartyMonLevel
rept 4
	dec hl
endr
	ld a, [hl]
	add 3

; Compare with wild encounter level
	ld hl, wCurPartyLevel
	cp [hl]
	jr nc, .okay
	set 0, e
.okay
	ld a, [wPermission]
	cp CAVE
	jr z, .okay2
	cp PERM_5
	jr z, .okay2
	cp DUNGEON
	jr z, .okay2
	set 1, e
.okay2
	ld hl, .StartingPoints
	add hl, de
	ld a, [hl]
	ld [wJumptableIndex], a
	ret
.wild
	ld a, 1
	ld [wJumptableIndex], a
	ret
.fake
	eventflagset EVENT_FAKE_BATTLE_INTO
	ld a, $21
	ld [wJumptableIndex], a
	ret

.StartingPoints: ; 8c38f
	db 1,  9
	db 16, 24
; 8c393

StartTrainerBattle_Finish: ; 8c393 (23:4393)
	call ClearSprites
	ld a, $80
	ld [wJumptableIndex], a
	ret

StartTrainerBattle_NextScene: ; 8c39c (23:439c)
	ld hl, wJumptableIndex
	inc [hl]
	ret

StartTrainerBattle_SetUpBGMap: ; 8c3a1 (23:43a1)
	call StartTrainerBattle_NextScene
	xor a
	ld [wcf64], a
	ldh [hBGMapMode], a
	ret

StartTrainerBattle_Flash: ; 8c3ab (23:43ab)
	call StartBattleFlash
	jp StartTrainerBattle_NextScene
	
StartTrainerBattle_Flash2:
	call StartBattleFlash
	ld c, 15
	call DelayFrames
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, $80
	ld [wJumptableIndex], a
	ret

StartTrainerBattle_SetUpForWavyOutro: ; 8c3e8 (23:43e8)
	farcall BattleStart_HideAllSpritesExceptBattleParticipants
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	call StartTrainerBattle_NextScene

	ld a, $43
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $90
	ldh [hLYOverrideEnd], a
	xor a
	ld [wcf64], a
	ld [wcf65], a
	ld hl, rIE
	set LCD_STAT, [hl]
	ret

StartTrainerBattle_SineWave: ; 8c408 (23:4408)
	ld a, [wcf64]
	cp $60
	jr nc, .end
	jp .DoSineWave

.end
	ld a, $20
	ld [wJumptableIndex], a
	ret

.DoSineWave: ; 8c419 (23:4419)
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	ld hl, wcf64
	ld d, [hl]
	add [hl]
	ld [hl], a
	ld a, wLYOverridesEnd - wLYOverrides
	ld bc, wLYOverrides
	ld e, $0

.loop
	push af
	push de
	ld a, e
	call Sine
	ld [bc], a
	inc bc
	pop de
	ld a, e
	add 2
	ld e, a
	pop af
	dec a
	jr nz, .loop
	ret

StartTrainerBattle_SetUpForSpinOutro: ; 8c43d (23:443d)
	farcall BattleStart_HideAllSpritesExceptBattleParticipants
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene
	xor a
	ld [wcf64], a
	ret

MACRO spintable_entry
	db \1
	dw .wedge\2
	dwcoord \3, \4
ENDM

; quadrants
	const_def
	const UPPER_LEFT
	const UPPER_RIGHT
	const LOWER_LEFT
	const LOWER_RIGHT

StartTrainerBattle_SpinToBlack: ; 8c44f (23:444f)
	xor a
	ldh [hBGMapMode], a
	ld a, [wcf64]
	ld e, a
	ld d, 0
	ld hl, .spintable
rept 5
	add hl, de
endr
	ld a, [hli]
	cp -1
	jr z, .end
	ld [wcf65], a
	call .load
	ld a, $1
	ldh [hBGMapMode], a
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
.mod_3
	; Ensure that music lines up with the transistion
	sub 3
	jr nc, .mod_3
	add 3
	ret z
	jp DelayFrame

.end
	xor a
	ldh [hBGMapMode], a
	ld a, $20
	ld [wJumptableIndex], a
	ret
; 8c490 (23:4490)

.spintable ; 8c490
	spintable_entry UPPER_LEFT,   1,  9,  8
	spintable_entry UPPER_LEFT,   2,  1,  6
	spintable_entry UPPER_LEFT,   3,  0,  4
	spintable_entry UPPER_LEFT,   4,  0,  2
	spintable_entry UPPER_LEFT,   5,  0,  0
	spintable_entry UPPER_LEFT,   6,  1,  0
	spintable_entry UPPER_LEFT,   7,  3,  0
	spintable_entry UPPER_LEFT,   8,  5,  0
	spintable_entry UPPER_LEFT,   9,  7,  0
	spintable_entry UPPER_LEFT,  10,  9,  0
	spintable_entry UPPER_RIGHT, 10, 10,  0
	spintable_entry UPPER_RIGHT,  9, 12,  0
	spintable_entry UPPER_RIGHT,  8, 14,  0
	spintable_entry UPPER_RIGHT,  7, 16,  0
	spintable_entry UPPER_RIGHT,  6, 18,  0
	spintable_entry UPPER_RIGHT,  5, 19,  0
	spintable_entry UPPER_RIGHT,  4, 19,  2
	spintable_entry UPPER_RIGHT,  3, 19,  4
	spintable_entry UPPER_RIGHT,  2, 18,  6
	spintable_entry UPPER_RIGHT,  1, 10,  8
	spintable_entry LOWER_RIGHT,  1, 10,  9
	spintable_entry LOWER_RIGHT,  2, 18, 11
	spintable_entry LOWER_RIGHT,  3, 19, 13
	spintable_entry LOWER_RIGHT,  4, 19, 15
	spintable_entry LOWER_RIGHT,  5, 19, 17
	spintable_entry LOWER_RIGHT,  6, 18, 17
	spintable_entry LOWER_RIGHT,  7, 16, 17
	spintable_entry LOWER_RIGHT,  8, 14, 17
	spintable_entry LOWER_RIGHT,  9, 12, 17
	spintable_entry LOWER_RIGHT, 10, 10, 17
	spintable_entry LOWER_LEFT,  10,  9, 17
	spintable_entry LOWER_LEFT,   9,  7, 17
	spintable_entry LOWER_LEFT,   8,  5, 17
	spintable_entry LOWER_LEFT,   7,  3, 17
	spintable_entry LOWER_LEFT,   6,  1, 17
	spintable_entry LOWER_LEFT,   5,  0, 17
	spintable_entry LOWER_LEFT,   4,  0, 15
	spintable_entry LOWER_LEFT,   3,  0, 13
	spintable_entry LOWER_LEFT,   2,  1, 11
	spintable_entry LOWER_LEFT,   1,  9,  9
	db -1
; 8c4f5

.load ; 8c4f5 (23:44f5)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	push hl
	ld a, [de]
	ld c, a
	inc de
.loop1
	ld [hl], $f9
	ld a, [wcf65]
	bit 0, a
	jr z, .leftside
	inc hl
	jr .okay1
.leftside
	dec hl
.okay1
	dec c
	jr nz, .loop1
	pop hl
	ld a, [wcf65]
	bit 1, a
	ld bc, SCREEN_WIDTH
	jr z, .upper
	ld bc, -SCREEN_WIDTH
.upper
	add hl, bc
	ld a, [de]
	inc de
	cp -1
	ret z
	and a
	jr z, .loop
	ld c, a
.loop2
	ld a, [wcf65]
	bit 0, a
	jr z, .leftside2
	dec hl
	jr .okay2
.leftside2
	inc hl
.okay2
	dec c
	jr nz, .loop2
	jr .loop
; 8c538 (23:4538)

; wedgeN: db width towards edge, x increment or -1 if done
.wedge1 db 10, -1
.wedge2 db 2, 4, 6, -1
.wedge3 db 1, 2, 3, 2, 3, 3, 2, -1
.wedge4 db 1, 1, 2, 2, 3, 1, 2, 2, 2, 1, 1, -1
.wedge5 db 1, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, -1
.wedge6 db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1
.wedge7 db 2, 1, 2, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, -1
.wedge8 db 2, 1, 2, 0, 2, 1, 2, 0, 1, 1, 2, 0, 1, 1, 1, -1
.wedge9 db 2, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, -1
.wedge10 db 2, 0, 2, 0, 2, 0, 1, 0, 1, 0, 1, -1
; 8c578

StartTrainerBattle_SetUpForRandomScatterOutro: ; 8c578 (23:4578)
	farcall BattleStart_HideAllSpritesExceptBattleParticipants
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene
	ld a, $10
	ld [wcf64], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

StartTrainerBattle_SpeckleToBlack: ; 8c58f (23:458f)
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld c, $c
.loop
	push bc
	call .BlackOutRandomTile
	pop bc
	dec c
	jr nz, .loop
	ret

.done
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld a, $20
	ld [wJumptableIndex], a
	ret

.BlackOutRandomTile: ; 8c5b8 (23:45b8)
.y_loop
	call Random
	cp SCREEN_HEIGHT
	jr nc, .y_loop
	ld b, a

.x_loop
	call Random
	cp SCREEN_WIDTH
	jr nc, .x_loop
	ld c, a

	hlcoord 0, -1
	ld de, SCREEN_WIDTH
	inc b

.row_loop
	add hl, de
	dec b
	jr nz, .row_loop
	add hl, bc

; If the tile has already been blacked out,
; sample a new tile
	ld a, [hl]
	cp $f9
	jr z, .y_loop
	ld [hl], $f9
	ret

StartTrainerBattle_LoadPokeBallGraphics: ; 8c5dc (23:45dc)
	ld a, [wOtherTrainerClass]
	and a
	jp z, .nextscene ; don't need to be here if wild

	farcall BattleStart_HideAllSpritesExceptBattleParticipants
.skip_hide
	xor a
	ldh [hBGMapMode], a

	ld a, [wOtherTrainerClass]
	ld de, 1
	ld hl, .SnareTrainerClasses
	call IsInArray
	ld de, SnareTransition
	jr c, .got_transition
	ld de, PokeBallTransition
.got_transition
	hlcoord 2, 1
	ld b, SCREEN_WIDTH - 4
.loop2
	push hl
	ld c, 2
.loop3
	push hl
	ld a, [de]
	inc de
.loop4
; Loading is done bit by bit
	and a
	jr z, .done
	sla a
	jr nc, .no_load
	ld [hl], $f8

	push af
	push hl
	push bc
	ld bc, wAttrMap - wTileMap
	add hl, bc
	ld a, [hl]
	and $f9 ^ (X_FLIP | Y_FLIP | PRIORITY)
	or PAL_BG_TEXT
	ld [hl], a
	pop bc
	pop hl
	pop af

.no_load
	inc hl
	jr .loop4

.done
	pop hl
	push bc
	ld bc, (SCREEN_WIDTH - 4) / 2
	add hl, bc
	pop bc
	dec c
	jr nz, .loop3

	pop hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2

	
	ld a, [wOtherTrainerClass]
	ld de, 1
	ld hl, .SnareTrainerClasses
	call IsInArray
	ld hl, .snaretimepals
	jr c, .got_colors
	ld hl, .timepals
.got_colors
	ld a, [wTimeOfDayPal]
	and %00000011
	sla a
	sla a
	sla a
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	pop bc
.got_palette
	ldh a, [rSVBK]
	push af
	ld a, $5 ; WRAM5 = palettes
	ldh [rSVBK], a
	call .copypals
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	call DelayFrame
	call CopyTilemapAtOnce

.nextscene ; 8c673 (23:4673)
	jp StartTrainerBattle_NextScene

.copypals ; 8c677 (23:4677)
	ld de, wUnknBGPals palette PAL_BG_GRAY
	call .copy
	ld de, wUnknBGPals palette PAL_BG_RED
	call .copy
	ld de, wUnknBGPals palette PAL_BG_GREEN
	call .copy
	ld de, wUnknBGPals palette PAL_BG_WATER
	call .copy
	ld de, wUnknBGPals palette PAL_BG_YELLOW
	call .copy
	ld de, wUnknBGPals palette PAL_BG_BROWN
	call .copy
	ld de, wUnknBGPals palette PAL_BG_ROOF
	call .copy
	ld de, wUnknBGPals palette PAL_BG_TEXT
	call .copy
	ld de, wUnknOBPals palette PAL_OW_SILVER
	call .copy
	ld a, [wMoogoo]
	cp TILESET_SNOW
	ret nz
	ld hl, .snowtimepals
	ld de, wUnknBGPals palette PAL_BG_WATER

.copy ; 8c698 (23:4698)
	push hl
	push de
	ld bc, 1 palettes
	rst CopyBytes
	pop de
	ld hl, wBGPals - wUnknBGPals
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, 1 palettes
	rst CopyBytes
	pop hl
	ret
; 8c6a1 (23:46a1)

.SnareTrainerClasses
	db GRUNTM
	db GRUNTF
	db KAGE
	db LOCKE
	db RIVAL_S
	db $69
	db -1

.timepals
; morn
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07
; day
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07
; nite
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07
; dusk
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07

.snaretimepals
; morn
	RGB 11, 31, 15
	RGB 05, 31, 05
	RGB 04, 27, 04
	RGB 07, 07, 07
; day
	RGB 11, 31, 15
	RGB 05, 31, 05
	RGB 04, 27, 04
	RGB 07, 07, 07
; nite
	RGB 11, 31, 15
	RGB 05, 31, 05
	RGB 04, 27, 04
	RGB 07, 07, 07
; dusk
	RGB 11, 31, 15
	RGB 05, 31, 05
	RGB 04, 27, 04
	RGB 07, 07, 07
	
.snowtimepals
; morn
	RGB 31, 18, 29
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 07, 07, 07
; day
;	RGB 31, 18, 29
;	RGB 31, 18, 29
;	RGB 31, 11, 15
;	RGB 07, 07, 07
; nite
;	RGB 31, 18, 29
;	RGB 31, 18, 29
;	RGB 31, 11, 15
;	RGB 07, 07, 07
; dusk
;	RGB 31, 18, 29
;	RGB 31, 18, 29
;	RGB 31, 11, 15
;	RGB 07, 07, 07

PokeBallTransition:
	db %00000011, %11000000
	db %00001111, %11110000
	db %00111100, %00111100
	db %00110000, %00001100
	db %01100000, %00000110
	db %01100011, %11000110
	db %11000110, %01100011
	db %11111100, %00111111
	db %11111100, %00111111
	db %11000110, %01100011
	db %01100011, %11000110
	db %01100000, %00000110
	db %00110000, %00001100
	db %00111100, %00111100
	db %00001111, %11110000
	db %00000011, %11000000

SnareTransition:
	db %00000000, %00000000
	db %00011111, %11100000
	db %00111111, %11110000
	db %01111000, %01111000
	db %01110000, %00011100
	db %01111000, %00000000
	db %00111111, %00000000
	db %00001111, %11000000
	db %00000011, %11110000
	db %00000000, %11111000
	db %00000000, %00111100
	db %01110000, %00011100
	db %00111100, %00111100
	db %00011111, %11111000
	db %00001111, %11110000
	db %00000000, %00000000

WipeLYOverrides: ; 8c6d8
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a

	ld hl, wLYOverrides
	call .wipe
	ld hl, wLYOverridesBackup
	call .wipe

	pop af
	ldh [rSVBK], a
	ret
; 8c6ef

.wipe ; 8c6ef
	xor a
	ld c, SCREEN_HEIGHT_PX
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 8c6f7


macro zoombox
; width, height, start y, start x
	db \1, \2
	dwcoord \3, \4
endm

StartTrainerBattle_ZoomToBlack: ; 8c768 (23:4768)
	farcall BattleStart_HideAllSpritesExceptBattleParticipants
	ld de, .boxes

.loop
	ld a, [de]
	cp -1
	jr z, .done
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	xor a
	ldh [hBGMapMode], a
	call .Copy
	call ApplyTilemapInVBlank
	jr .loop

.done
	ld a, $20
	ld [wJumptableIndex], a
	ret
; 8c792 (23:4792)

.boxes ; 8c792
	zoombox  4,  2,  8, 8
	zoombox  6,  4,  7, 7
	zoombox  8,  6,  6, 6
	zoombox 10,  8,  5, 5
	zoombox 12, 10,  4, 4
	zoombox 14, 12,  3, 3
	zoombox 16, 14,  2, 2
	zoombox 18, 16,  1, 1
	zoombox 20, 18,  0, 0
	db -1
; 8c7b7

.Copy: ; 8c7b7 (23:47b7)
	ld a, $f9
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 8c7c9 (23:47c9)
