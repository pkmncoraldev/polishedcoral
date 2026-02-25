;INCLUDE "engine/vary_colors.asm"

INCLUDE "engine/cgb.asm"

CheckShininess:
; Check if a mon is shiny by personality at bc.
; Return carry if shiny.
	ld a, [bc]
	and SHINY_MASK
	jr z, .NotShiny
	scf
	ret

.NotShiny:
	and a
	ret

InitPartyMenuPalettes:
	ld de, wUnknBGPals
	ld hl, PartyMenuBGPals
rept 4
	call LoadHLPaletteIntoDE
endr
	call InitPartyMenuOBPals
	jp WipeAttrMap

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, wBGPals palette PAL_BATTLE_BG_ENEMY_HP + 2
	jr .okay

.Player:
	ld de, wBGPals palette PAL_BATTLE_BG_PLAYER_HP + 2

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarInteriorPals
	add hl, bc
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, wAttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	jp FillBoxCGB

LoadPlayerStatusIconPalette:
	ld a, [wPlayerSubStatus2]
	ld de, wBattleMonStatus
	farcall GetStatusConditionIndex
	ld hl, StatusIconPals
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld de, wUnknBGPals palette PAL_BATTLE_BG_STATUS + 2
	ld bc, 2
	ld a, $5
	jp FarCopyWRAM

LoadEnemyStatusIconPalette:
	ld a, [wEnemySubStatus2]
	ld de, wEnemyMonStatus
	farcall GetStatusConditionIndex
	ld hl, StatusIconPals
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld de, wUnknBGPals palette PAL_BATTLE_BG_STATUS + 4
	ld bc, 2
	ld a, $5
	jp FarCopyWRAM

LoadBattleCategoryAndTypePals:
	ld a, [wPlayerMoveStruct + MOVE_CATEGORY]
	ld b, a
	ld a, [wPlayerMoveStruct + MOVE_TYPE]
	ld c, a
	ld de, wUnknBGPals palette PAL_BATTLE_BG_TYPE_CAT + 2
LoadCategoryAndTypePals:
	ld hl, CategoryIconPals
	ld a, b
	add a
	add a
	push bc
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, 4
	ld a, $5
	push de
	call FarCopyWRAM
	pop de

	ld hl, TypeIconPals
	pop bc
	ld a, c

	farcall MultiSlotMoveTypesNoWeatherBall

	add a
	ld c, a
	ld b, 0
	add hl, bc
	inc de
	inc de
	inc de
	inc de
	ld bc, 2
	ld a, $5
	jp FarCopyWRAM
	
	
LoadItemIconPalette:
	ld a, [wCurSpecies]
	ld bc, ItemIconPalettes
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	cp 7
	jr z, .eighth
	jr .fifth
.first
	ld de, wUnknOBPals palette 0 + 2
	jr .cont
.second
	ld de, wUnknOBPals palette 1 + 2
	jr .cont
.third
	ld de, wUnknOBPals palette 2 + 2
	jr .cont
.forth
	ld de, wUnknOBPals palette 3 + 2
	jr .cont
.eighth
	ld de, wUnknOBPals palette 7 + 2
	jr .cont
.fifth
	ld de, wUnknOBPals palette 4 + 2
.cont
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ld hl, BlackPalette
	ld bc, 2
	ld a, $5
	jp FarCopyWRAM
	
LoadClothesIconPalette:
	ld a, [wCurSpecies]
	ld bc, ClothesIconPalettes
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, bc
	ld de, wUnknBGPals palette 7 + 2
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ld hl, BlackPalette
	ld bc, 2
	ld a, $5
	jp FarCopyWRAM

LoadTMHMIconPalette:
	ld a, [wd265]
	dec a
	ld hl, TMHMTypes
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld hl, TMHMTypeIconPals
	ld c, a
	ld b, 0
rept 4
	add hl, bc
endr
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	jr .fifth
.first
	ld de, wUnknOBPals palette 0 + 2
	jr .cont
.second
	ld de, wUnknOBPals palette 1 + 2
	jr .cont
.third
	ld de, wUnknOBPals palette 2 + 2
	jr .cont
.forth
	ld de, wUnknOBPals palette 3 + 2
	jr .cont
.fifth
	ld de, wUnknOBPals palette 4 + 2
.cont
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ld hl, BlackPalette
	ld bc, 2
	ld a, $5
	jp FarCopyWRAM

LoadStatsScreenPals:
	ld hl, StatsScreenPagePals
	ld b, 0
	add hl, bc
	add hl, bc
	ldh a, [rSVBK]
	push af
	push bc
	ld a, $5
	ldh [rSVBK], a
	ld a, [hli]
	ld [wUnknBGPals palette 0], a
	ld [wUnknBGPals palette 2], a
	ld a, [hl]
	ld [wUnknBGPals palette 0 + 1], a
	ld [wUnknBGPals palette 2 + 1], a
	pop bc
	ld a, c
	
	cp 0
	jr z, .pink_page
	ld a, [wCurHPPal]
	ld e, a
	ld d, $0
	ld hl, HPBarInteriorPals + 2
	add hl, de
	add hl, de
	ld bc, 2
	ld de, wUnknBGPals + 4
	ld a, $5
	call FarCopyWRAM
	jr .cont
.pink_page
	ld hl, GenderAndExpBarPals + 2
	ld bc, 2
	ld de, wUnknBGPals + 4
	ld a, $5
	call FarCopyWRAM
	
.cont
	pop af
	ldh [rSVBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MailPals
	add hl, de
	ld de, wUnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	jp ApplyAttrMap

LoadHLPaletteIntoDE:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld c, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

LoadOnePalette:
; Loads a single palette from hl to de in GBC Video WRAMX
	ld c, 1 palettes
	; fallthrough
LoadPalettes:
; Load c palette bytes from hl to de in GBC Video WRAMX
	ldh a, [rSVBK]
	push af
	ld a, BANK("GBC Video")
	ldh [rSVBK], a
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a

if !DEF(MONOCHROME)
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ld [de], a
	inc de
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ld [de], a
	inc de
else
	ld a, PAL_MONOCHROME_WHITE % $100
	ld [de], a
	inc de
	ld a, PAL_MONOCHROME_WHITE / $100
	ld [de], a
	inc de
endc

	ld c, 2 * 2
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

if !DEF(MONOCHROME)
	xor a ; RGB 00, 00, 00
rept 2
	ld [de], a
	inc de
endr
else
	ld a, PAL_MONOCHROME_BLACK % $100
	ld [de], a
	inc de
	ld a, PAL_MONOCHROME_BLACK / $100
	ld [de], a
	inc de
endc

	pop af
	ldh [rSVBK], a
	ret

FillBoxCGB:
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

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a

	ld hl, wUnknBGPals
	ld c, 8
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ldh [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

Reset7BGPals:
	push af
	push bc
	push de
	push hl

	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a

	ld hl, wUnknBGPals
	ld c, 7
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ldh [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret
	
WipeAttrMap:
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	jp ByteFill

ApplyPals:
	ld hl, wUnknBGPals
	ld de, wBGPals
	ld bc, 16 palettes
	ld a, $5
	jp FarCopyWRAM

ApplyAttrMap:
	ldh a, [rLCDC]
	bit 7, a
	jr nz, ApplyAttrMapVBank0
	hlcoord 0, 0, wAttrMap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, 1
	ldh [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	xor a
	ldh [rVBK], a
	ret

ApplyAttrMapVBank0::
	ldh a, [hBGMapMode]
	push af
	ld a, 2
	ldh [hBGMapMode], a
	call Delay2
	pop af
	ldh [hBGMapMode], a
	ret

ApplyPartyMenuHPPals: ; 96f3
	ld hl, wHPPals
	ld a, [wHPPalIndex]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, wAttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wHPPalIndex]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	jp FillBoxCGB

InitPartyMenuOBPals:
	ld hl, PartyMenuOBPals
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5
	jp FarCopyWRAM

InitPokegearPalettes:
; This is needed because the regular palette is dark at night.
	ld hl, PokegearOBPals
	ld de, wUnknOBPals
	ld bc, 2 palettes
	ld a, $5
	jp FarCopyWRAM

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonPersonality
	ld c, l
	ld b, h
	ld a, [wTempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	push de
	farcall GetEnemyMonPersonality
	ld c, l
	ld b, h
	ld a, [wTempEnemyMonSpecies]
	call GetFrontpicPalettePointer
	pop de
	ret

GetPlayerOrMonPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	dec a
	
	ld a, [wPlayerGender]
	cp PIPPI
	jr z, .pippi
	ld a, [wPlayerPalette]
	cp $0
	jp nz, .cont1
	ld hl, PlayerPalette
	ret

.cont1
	ld a, [wPlayerPalette]
	sub $1
	jp nz, .cont2
	ld hl, PlayerPalette2
	ret
	
.cont2
	ld a, [wPlayerPalette]
	sub $2
	jp nz, .cont3
	ld hl, PlayerPalette3
	ret

.cont3
	ld a, [wPlayerPalette]
	sub $3
	jp nz, .cont4
	ld hl, PlayerPalette4
	ret
	
.cont4
	ld a, [wPlayerPalette]
	sub $4
	jp nz, .cont5
	ld hl, PlayerPalette5
	ret
	
.cont5
	ld a, [wPlayerPalette]
	sub $5
	jp nz, .cont6
	ld hl, PlayerPalette6
	ret
	
.cont6
	ld hl, PlayerPalette7
	ret
	
.pippi
	ld hl, ClefairyPalette
	ret

GetFrontpicPalettePointer:
	and a
	jr nz, GetMonNormalOrShinyPalettePointer
	ld a, [wTrainerClass]

GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

GetPaintingPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PaintingPalettes
	add hl, bc
	ret

GetMonPalettePointer:
	push af
	ld h, b
	ld l, c
	; c = species
	ld c, a
	; b = form
	inc hl ; Form is in the byte after Shiny
	ld a, [hl]
	and FORM_MASK
	ld b, a
	; bc = index
	call GetSpeciesAndFormIndex
	ld h, b
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	pop af
	ret

GetMonNormalOrShinyPalettePointer:
	push bc
	call GetMonPalettePointer
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr
	ret

LoadPokemonPalette:
	; a = species
	ld a, [wCurPartySpecies]
	; hl = palette
	call GetMonPalettePointer
	; load palette in BG 7
	ld a, $5
	ld de, wUnknBGPals palette 7 + 2
	ld bc, 4
	jp FarCopyWRAM

LoadPartyMonPalette:
	; bc = personality
	ld hl, wPartyMon1Personality
	ld a, [wCurPartyMon]
	call GetPartyLocation
	ld c, l
	ld b, h
	; a = species
	ld a, [wCurPartySpecies]
	; hl = palette
	call GetMonNormalOrShinyPalettePointer
	; load palette in BG 7
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT + 2
	ld bc, 4
	jp FarCopyWRAM
	; hl = DVs
;	ld hl, wPartyMon1DVs
;	ld a, [wCurPartyMon]
;	call GetPartyLocation
	; b = species
;	ld a, [wCurPartySpecies]
;	ld b, a
	; vary colors by DVs
;	call CopyDVsToColorVaryDVs
;	ld hl, wUnknBGPals palette PAL_BG_TEXT + 2
;	jp VaryColorsByDVs

LoadTrainerPalette:
	; a = class
	ld a, [wTrainerClass]
	; hl = palette
	call GetTrainerPalettePointer
	; load palette in BG 7
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT + 2
	ld bc, 4
	jp FarCopyWRAM

LoadPaintingPalette:
	; a = class
	ld a, [wTrainerClass]
	; hl = palette
	call GetPaintingPalettePointer
	; load palette in BG 7
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld bc, 8
	jp FarCopyWRAM

InitCGBPals::
	ld a, $1
	ldh [rVBK], a
	ld hl, VTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	xor a
	ldh [rVBK], a
	ld a, $80
	ldh [rBGPI], a
	ld c, 4 * 8
.bgpals_loop
if !DEF(MONOCHROME)
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ldh [rBGPD], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ldh [rBGPD], a
else
	ld a, PAL_MONOCHROME_WHITE % $100
	ldh [rBGPD], a
	ld a, PAL_MONOCHROME_WHITE / $100
	ldh [rBGPD], a
endc
	dec c
	jr nz, .bgpals_loop
	ld a, $80
	ldh [rOBPI], a
	ld c, 4 * 8
.obpals_loop
if !DEF(MONOCHROME)
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ldh [rOBPD], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ldh [rOBPD], a
else
	ld a, PAL_MONOCHROME_WHITE % $100
	ldh [rOBPD], a
	ld a, PAL_MONOCHROME_WHITE / $100
	ldh [rOBPD], a
endc
	dec c
	jr nz, .obpals_loop
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wUnknBGPals
	call .LoadWhitePals
	ld hl, wBGPals
	call .LoadWhitePals
	pop af
	ldh [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
if !DEF(MONOCHROME)
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ld [hli], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ld [hli], a
else
	ld a, PAL_MONOCHROME_WHITE % $100
	ld [hli], a
	ld a, PAL_MONOCHROME_WHITE / $100
	ld [hli], a
endc
	dec c
	jr nz, .loop
	ret

CopyData: ; 0x9a52
; copy bc bytes of data from hl to de
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret
; 0x9a5b

ClearBytes: ; 0x9a5b
; clear bc bytes of data starting from de
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, ClearBytes
	ret
; 0x9a64

LoadPlayerPalettewUnknOBPalsDe:
	ld a, [wPlayerPalette]
	cp 1
	jr z, .blue
	cp 2
	jr z, .green
	cp 3
	jr z, .brown
	cp 4
	jr z, .purple
	cp 5
	jr z, .teal
	cp 6
	jr z, .pink
;.red
	ld de, wUnknOBPals
	ret
.blue
	ld de, wUnknOBPals + 1 palettes
	ret
.green
	ld de, wUnknOBPals + 2 palettes
	ret
.brown
	ld de, wUnknOBPals + 3 palettes
	ret
.purple
	ld de, wUnknOBPals + 4 palettes
	ret
.teal
	ld de, wUnknOBPals + 5 palettes
	ret
.pink
	ld de, wUnknOBPals + 6 palettes
	ret
	
Palette_b309: ; b309 mobile
	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 00, 00, 00

Palette_b311: ; b311 not mobile
	RGB 31, 31, 31
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 00, 00, 00

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

INCLUDE "data/events/paintings/palettes.asm"

INCLUDE "engine/palettes.asm"
