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
	ld de, wBGPals palette PAL_BATTLE_BG_PLAYER_HP + 2
	jr .okay

.Player:
	ld de, wBGPals palette PAL_BATTLE_BG_ENEMY_HP + 2

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
	ld [hCGBPalUpdate], a
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

	farcall MultiSlotMoveTypes

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
	ld de, wUnknBGPals palette 7 + 2
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
	ld a, [wCurTMHM]
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
	ld de, wUnknBGPals palette 7 + 2
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
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [wUnknBGPals palette 0], a
	ld [wUnknBGPals palette 2], a
	ld a, [hl]
	ld [wUnknBGPals palette 0 + 1], a
	ld [wUnknBGPals palette 2 + 1], a
	pop af
	ld [rSVBK], a
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
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld c, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ld [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a
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

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a

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

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

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
	ld [rSVBK], a

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
	ld a, [rLCDC]
	bit 7, a
	jr nz, ApplyAttrMapVBank0
	hlcoord 0, 0, wAttrMap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, 1
	ld [rVBK], a
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
	ld [rVBK], a
	ret

ApplyAttrMapVBank0::
	ld a, [hBGMapMode]
	push af
	ld a, 2
	ld [hBGMapMode], a
	call Delay2
	pop af
	ld [hBGMapMode], a
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
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
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
	call FarCopyWRAM
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
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	xor a
	ld [rVBK], a
	ld a, $80
	ld [rBGPI], a
	ld c, 4 * 8
.bgpals_loop
if !DEF(MONOCHROME)
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ld [rBGPD], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ld [rBGPD], a
else
	ld a, PAL_MONOCHROME_WHITE % $100
	ld [rBGPD], a
	ld a, PAL_MONOCHROME_WHITE / $100
	ld [rBGPD], a
endc
	dec c
	jr nz, .bgpals_loop
	ld a, $80
	ld [rOBPI], a
	ld c, 4 * 8
.obpals_loop
if !DEF(MONOCHROME)
	ld a, (palred 31 + palgreen 31 + palblue 31) % $100
	ld [rOBPD], a
	ld a, (palred 31 + palgreen 31 + palblue 31) / $100
	ld [rOBPD], a
else
	ld a, PAL_MONOCHROME_WHITE % $100
	ld [rOBPD], a
	ld a, PAL_MONOCHROME_WHITE / $100
	ld [rOBPD], a
endc
	dec c
	jr nz, .obpals_loop
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wUnknBGPals
	call .LoadWhitePals
	ld hl, wBGPals
	call .LoadWhitePals
	pop af
	ld [rSVBK], a
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

LoadMapPals::
;	farcall LoadSpecialMapPalette
;	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wPermission]
	and 7
	ld e, a
	ld d, 0
	ld hl, .TilesetColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [wTimeOfDayPal]
	and 3
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	; Switch to palettes WRAM bank
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wUnknBGPals
	ld b, 7
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ld [rSVBK], a

.got_pals
	farcall LoadSpecialMapPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wMapGroup]
	cp GROUP_LAKE_ONWA
	jp z, .rockscheck1
	cp GROUP_ROUTE_3
	jp z, .rockscheck2
	cp GROUP_SUNBEAM_ISLAND
	jp z, .sunbeam
	cp GROUP_SUNSET_BAY
	jp z, .sunset
	cp GROUP_SKATEPARK
	jp z, .skateparkcheck
	cp GROUP_SHIMMER_CITY
	jp z, .shimmer
.got_pals_cont
	ld a, [wTileset]
	cp TILESET_CAVE
	jp z, .rocks
	cp TILESET_STARGLOW_CAVERN
	jp z, .starglow
	cp TILESET_RANCH
	jp z, .ranch
	cp TILESET_PARK
	jp z, .park
	cp TILESET_AIRPORT
	jp z, .airport
	cp TILESET_SNOW
	jp z, .snow
	cp TILESET_LUSTER
	jp z, .luster
	cp TILESET_MALL_1
	jp z, .lustermall
	cp TILESET_MALL_2
	jp z, .lustermall2
	cp TILESET_SEWER
	jp z, .sewer
	cp TILESET_ICE_CAVE
	jp z, .ice_cave
	cp TILESET_PLAYER_HOUSE
	jp z, .playerhouse
	cp TILESET_PLAYER_ROOM
	jp z, .playerroom
	cp TILESET_JUNGLE
	jp z, .jungle
	cp TILESET_GATE
	jp z, .gate
	cp TILESET_HOUSE_1
	jp z, .candle
	cp TILESET_NETT_BUILDING
	jp z, .nett
	cp TILESET_DESERT
	jp z, .desert
	cp TILESET_MART
	jp z, .mart
	cp TILESET_LAB
	jp z, .lab
	jp .normal
.playerhouse
	ld a, [wMapGroup]
	cp GROUP_TWINKLE_GYM_ENTRY
	jp nz, .normal
	ld a, [wMapNumber]
	cp MAP_TWINKLE_GYM_BLUE_ROOM
	jp z, .blue_room
	cp MAP_TWINKLE_GYM_YELLOW_ROOM
	jp z, .yellow_room
	cp MAP_TWINKLE_GYM_RED_ROOM
	jp z, .red_room
	jp .normal
	
.mart
	ld a, [wMapGroup]
	cp GROUP_BRILLO_TOWN
	jp nz, .normal
	ld a, [wMapNumber]
	cp MAP_BRILLO_GAME_CORNER
	jp nz, .normal
	call .normal
	ld hl, MapObjectPalsCasino
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.desert
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp z, .sandstorm
	ld a, [wMapNumber]
	cp MAP_BRILLO_TOWN
	jp z, .sailboat
	cp MAP_DESERT_ROUTE_NORTH
	jp z, .desertfire
	cp MAP_DESERT_WASTELAND_OASIS
	jp z, .oasis
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsSand
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.oasis
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, StandardGrassPalette
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.sandstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .desertfirecont1
	ld a, [wTimeOfDayPal]
	and 3
	
	ld bc, 8 palettes
	ld hl, MapObjectPalsSandstorm
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.desertfire
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .desertfirecont1
	ld a, [wTimeOfDayPal]
	jr .desertfirecont2
.desertfirecont1
	ld a, 1
.desertfirecont2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsSnow
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	
	ld a, 1
	and 3
	ld hl, MapObjectPalsRocks
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	
	jp .fire
	
.jungle
	ld a, [wMapNumber]
	cp MAP_SUNBEAM_JUNGLE
	jp nz, .outside
	eventflagcheck EVENT_JUNGLE_CAVE_BLUE
	jp z, .normal
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsWaterfallCave
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
	
.nett
	ld a, [wMapGroup]
	cp GROUP_NETT_BUILDING_1F
	ld a, [wMapNumber]
	jr nz, .snes
	cp MAP_NETT_BUILDING_1F
	jr nz, .nett2
	call .normal
	ld hl, MapObjectPalsNett
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
	
.nett2
	eventflagcheck EVENT_NETT_BUILDING_DUNGEON
	jr nz, .nett2_dark
	call .normal
	ld hl, MapObjectPalsNett2
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.nett2_dark
	ld hl, MapObjectPalsNettDark
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.playerroom
	eventflagcheck EVENT_N64
	jr nz, .n64
.snes
	call .normal
	ld hl, MapObjectPalsSnes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.n64
	call .normal
	ld hl, MapObjectPalsN64
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.gate
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp nz, .snes
	ld a, [wTimeOfDay]
	and 3
	ld bc, 3 palettes
	ld hl, MapObjectPalsSunbeamView
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 3 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.blue_room
	eventflagcheck EVENT_BLUE_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_BLUE_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_BLUE_ROOM_STEAM_3
	jr nz, .steam3
	jr .no_steam
.yellow_room
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_3
	jr nz, .steam3
	jr .no_steam
.red_room
	eventflagcheck EVENT_RED_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_RED_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_RED_ROOM_STEAM_3
	jr nz, .steam3
	jr .no_steam
.steam1
	ld hl, MapObjectPalsTwinkleGym1
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.steam2
	ld hl, MapObjectPalsTwinkleGym2
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.steam3
	ld hl, MapObjectPalsTwinkleGym3
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.no_steam
	ld hl, MapObjectPalsTwinkleGym4
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.ice_cave
	ld a, [wPlayerPalette]
	cp 4
	jr z, .ice_cave_purple
	eventflagcheck EVENT_TORCH_LIT
	jr nz, .torch
	jr .ice_cave_cont
.torch
	ld a, 1
.ice_cave_cont
	and 3
	ld bc, 8 palettes
	eventflagcheck EVENT_MAMOSWINE_CUTSCENE
	jr z, .not_mamo
	ld hl, MapObjectPalsIceCave2
	jr .ice_cave_cont2
.not_mamo
	ld hl, MapObjectPalsIceCave
.ice_cave_cont2
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.ice_cave_purple
	eventflagcheck EVENT_TORCH_LIT
	jr nz, .torch_purple
	jr .ice_cave_purple_cont
.torch_purple
	ld a, 1
.ice_cave_purple_cont
	and 3
	ld bc, 8 palettes
	eventflagcheck EVENT_MAMOSWINE_CUTSCENE
	jr z, .not_mamo_purple
	ld hl, MapObjectPalsIceCavePurple2
	jr .ice_cave_purple_cont2
.not_mamo_purple
	ld hl, MapObjectPalsIceCavePurple
.ice_cave_purple_cont2
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.sewer
	ld a, [wMapNumber]
	cp MAP_LUSTER_SEWERS_B1F
	jp z, .rocks
	cp MAP_LUSTER_SEWERS_B2F
	jp z, .rocks
	ld hl, MapObjectPalsSewer
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.sunbeam
	ld a, [wMapNumber]
	cp MAP_SUNBEAM_ISLAND
	jp z, .sailboat
	cp MAP_SUNBEAM_BEACH
	jp z, .umbrella
	jp .got_pals_cont
.umbrella
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsUmbrella
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
.rockscheck1
	ld a, [wMapNumber]
	cp MAP_LAKE_ONWA
	jp nz, .got_pals_cont
	eventflagcheck EVENT_LAKE_ROCKS_BROWN
	jp z, .sailboat
	jr .rocks
.rockscheck2
	ld a, [wMapNumber]
	cp MAP_ROUTE_3
	jp nz, .got_pals_cont
	eventflagcheck EVENT_ROUTE_3_ROCKS_BROWN
	jp z, .got_pals_cont
.rocks
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsRocks
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wPermission]
	cp FOREST
	jp z, .outside
	cp TOWN
	jp z, .outside
	cp ROUTE
	jp z, .outside
	ret
.starglow
	ld hl, MapObjectPalsStarglow
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.ranch
	ld a, [wMapNumber]
	cp MAP_ROUTE_9
	jr z, .ranchcont
	cp MAP_DODRIO_RANCH_RACETRACK
	jr z, .ranchcont
	cp MAP_FLICKER_PASS_OUTSIDE
	jr z, .ranchcont
	jp .hangar
.ranchcont
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .ranchyellow
.park
.airport
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsRanch
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
.ranchyellow
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsRanchYellow
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
	
.hangar
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .ranchyellow
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsHangar
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
	
.luster
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .lustercont1
	ld a, [wTimeOfDayPal]
	jr .lustercont2
.lustercont1
	ld a, 1
.lustercont2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsLuster
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
	
.snow
	eventflagcheck EVENT_SNOWSTORM_HAPPENING
	jr nz, .snowstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .snowcont1
	ld a, [wTimeOfDayPal]
	jr .snowcont2
.snowcont1
	ld a, 1
.snowcont2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsSnow
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
.fire
	ld a, [wPlayerPalette]
	cp 3
	jr z, .snowbrown
	ld hl, MapObjectPalsSnowFire
	ld de, wUnknOBPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.snowbrown
	ld hl, MapObjectPalsSnowFire
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.snowstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .snowstormcont1
	ld a, [wTimeOfDayPal]
	jr .snowstormcont2
.snowstormcont1
	ld a, 1
.snowstormcont2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsSnowstorm
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wPlayerPalette]
	cp 3
	jr z, .snowstormbrown
	ld hl, MapObjectPalsSnowstormFire
	ld de, wUnknOBPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.snowstormbrown
	ld hl, MapObjectPalsSnowstormFire
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.lustermall
	ld hl, MapObjectPalsLusterMall
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.lustermall2
	call .normal
	ld a, [wMapNumber]
	cp MAP_LUSTER_MALL_ELECTRONICS_SHOP
	jp z, .snes
	cp MAP_LUSTER_MALL_COFFEE_SHOP
	jr z, .coffee
	ret
.coffee
	ld hl, MapObjectPalsCoffee
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.skateparkcheck
	ld a, [wMapNumber]
	cp MAP_SKATEPARK
	jp nz, .got_pals_cont
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsSkatepark
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
	
.sunset
	ld a, [wMapNumber]
	cp MAP_SUNSET_BAY
	jr z, .sailboat
	cp MAP_SAILBOAT_CUTSCENE
	jr z, .sailboat
	cp MAP_SUNSET_CAPE
	jr z, .lighthouse
	jp .normal
	
.sailboat
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsSailboat
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside
	
.lighthouse
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsLighthouse
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside

.lab
	call .normal
	eventflagcheck EVENT_AIRPORT_LUGGAGE_2
	jr nz, .luggage2
	eventflagcheck EVENT_AIRPORT_LUGGAGE_3
	jr nz, .luggage3
	eventflagcheck EVENT_AIRPORT_LUGGAGE_4
	jr nz, .luggage4
	eventflagcheck EVENT_AIRPORT_SLOWPOKE
	jr nz, .slowpoke
.luggage1
	ld hl, MapObjectPalsLuggage1
	jr .lab_end
.luggage2
	ld hl, MapObjectPalsLuggage2
	jr .lab_end
.luggage3
	ld hl, MapObjectPalsLuggage3
	jr .lab_end
.luggage4
	ld hl, MapObjectPalsLuggage4
	jr .lab_end
.slowpoke
	ld hl, MapObjectPalsSlowpoke
.lab_end
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.shimmer
	ld a, [wMapNumber]
	cp MAP_SHIMMER_CITY
	jp z, .binoculars
	cp MAP_SHIMMER_HARBOR
	jp z, .sailboat
	cp MAP_SHIMMER_LAB_EXPERIMENTAL_LAB
	jp z, .fossil_lab
	jr .normal
	
.fossil_lab
	call .normal
	ld hl, MapObjectPalsFossilLab
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.binoculars
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsBinoculars
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jr .outside
	
.candle
	ld a, [wMapGroup]
	cp GROUP_LUSTER_CITY_RESIDENTIAL
	jp nz, .normal
	ld hl, MapObjectPalsCandle
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.normal
	ld a, [wTileset]
	cp TILESET_SPOOKY
	jr z, .outside
	ld a, [wPermission]
	cp FOREST
	jr z, .outside
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr z, .outside
	ld a, [wMapGroup]
	cp GROUP_LUSTER_TRAIN_STATION
	ret nz
	ld a, [wMapNumber]
	cp MAP_LUSTER_TRAIN_STATION
	ret nz
.outside
	ld a, [wTileset]
	cp TILESET_GROVE
	ret z
	cp TILESET_MOUNTAIN
	ret z
	cp TILESET_JUNGLE
	ret z
	cp TILESET_SNOW
	ret z
	cp TILESET_PARK
	ret z
	cp TILESET_AIRPORT
	ret z
	cp TILESET_DESERT
	ret z
	
	ld a, [wTimeOfDayPal]
	and 3
	cp DUSK
	jr z, .dusk
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	jr .controof	
.dusk
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPalsDusk
	add hl, de
	jr .morn_day
.controof
	ld a, [wTimeOfDayPal]
	and 3
	cp NITE
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, wUnknBGPals + 6 palettes + 2
	ld bc, 4
	ld a, $5
	jp FarCopyWRAM


.TilesetColorsPointers:
	dw .OutdoorColors ; unused
	dw .OutdoorColors ; TOWN
	dw .OutdoorColors ; ROUTE
	dw .IndoorColors ; INDOOR
	dw .DungeonColors ; CAVE
	dw .Perm5Colors ; PERM_5
	dw .IndoorColors ; GATE
	dw .DungeonColors ; DUNGEON
	dw .OutdoorColors ; FOREST

; Valid indices: $00 - $29
.OutdoorColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.IndoorColors:
	db $20, $21, $22, $23, $24, $25, $26, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $07 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07 ; dark

.DungeonColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.Perm5Colors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

LoadTownSignPalette::
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPalsDusk
	add hl, de
rept 4
	inc hl
endr
	ld de, wUnknBGPals + 7 palettes + 2
	ld bc, 4
	ld a, $5
	jp FarCopyWRAM

	
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

TilesetBGPalette:
INCLUDE "maps/palettes/bgpals/bg.pal"

MapObjectPals::
INCLUDE "maps/palettes/obpals/ob.pal"

MapObjectPalsRocks::
INCLUDE "maps/palettes/obpals/obrocks.pal"

MapObjectPalsUmbrella::
INCLUDE "maps/palettes/obpals/obumbrella.pal"

MapObjectPalsStarglow::
INCLUDE "maps/palettes/obpals/obstarglow.pal"

MapObjectPalsIceCave::
INCLUDE "maps/palettes/obpals/obicecave.pal"

MapObjectPalsIceCave2::
INCLUDE "maps/palettes/obpals/obicecave2.pal"

MapObjectPalsIceCavePurple::
INCLUDE "maps/palettes/obpals/obicecavepurple.pal"

MapObjectPalsIceCavePurple2::
INCLUDE "maps/palettes/obpals/obicecavepurple2.pal"

MapObjectPalsTwinkleGym1::
INCLUDE "maps/palettes/obpals/obtwinklegym1.pal"

MapObjectPalsTwinkleGym2::
INCLUDE "maps/palettes/obpals/obtwinklegym2.pal"

MapObjectPalsTwinkleGym3::
INCLUDE "maps/palettes/obpals/obtwinklegym3.pal"

MapObjectPalsTwinkleGym4::
INCLUDE "maps/palettes/obpals/obtwinklegym4.pal"

MapObjectPalsSewer::
INCLUDE "maps/palettes/obpals/obsewer.pal"

MapObjectPalsRanch::
INCLUDE "maps/palettes/obpals/obranch.pal"

MapObjectPalsRanchYellow::
INCLUDE "maps/palettes/obpals/obranchyellow.pal"

MapObjectPalsHangar::
INCLUDE "maps/palettes/obpals/obranchhangar.pal"

MapObjectPalsSnow::
INCLUDE "maps/palettes/obpals/obsnow.pal"

MapObjectPalsSnowFire::
INCLUDE "maps/palettes/obpals/obsnowfire.pal"

MapObjectPalsSnowstorm::
INCLUDE "maps/palettes/obpals/obsnowstorm.pal"

MapObjectPalsSnowstormFire::
INCLUDE "maps/palettes/obpals/obsnowstormfire.pal"

MapObjectPalsSandstorm::
INCLUDE "maps/palettes/obpals/obsandstorm.pal"

MapObjectPalsSailboat::
INCLUDE "maps/palettes/obpals/obsailboat.pal"

MapObjectPalsLighthouse::
INCLUDE "maps/palettes/obpals/oblighthouse.pal"

MapObjectPalsBinoculars::
INCLUDE "maps/palettes/obpals/obbinoculars.pal"

MapObjectPalsSkatepark::
INCLUDE "maps/palettes/obpals/obskatepark.pal"

MapObjectPalsSunbeamView::
INCLUDE "maps/palettes/obpals/obsunbeamview.pal"

MapObjectPalsLuster::
INCLUDE "maps/palettes/obpals/obluster.pal"

MapObjectPalsLusterMall::
INCLUDE "maps/palettes/obpals/oblustermall.pal"

MapObjectPalsFossilLab::
INCLUDE "maps/palettes/obpals/fossillab.pal"

MapObjectPalsNett::
INCLUDE "maps/palettes/obpals/nett.pal"

MapObjectPalsNett2::
INCLUDE "maps/palettes/obpals/nett2.pal"

MapObjectPalsNettDark::
INCLUDE "maps/palettes/obpals/nettdark.pal"

MapObjectPalsSnes::
INCLUDE "maps/palettes/obpals/snes.pal"

MapObjectPalsN64::
INCLUDE "maps/palettes/obpals/n64.pal"

MapObjectPalsCoffee::
INCLUDE "maps/palettes/obpals/coffee.pal"

MapObjectPalsWaterfallCave::
INCLUDE "maps/palettes/obpals/waterfallcave.pal"

MapObjectPalsCandle::
INCLUDE "maps/palettes/obpals/candle.pal"

MapObjectPalsSand::
INCLUDE "maps/palettes/obpals/obsand.pal"

MapObjectPalsCasino::
INCLUDE "maps/palettes/obpals/casino.pal"

MapObjectPalsLuggage1::
INCLUDE "maps/palettes/obpals/luggage1.pal"

MapObjectPalsLuggage2::
INCLUDE "maps/palettes/obpals/luggage2.pal"

MapObjectPalsLuggage3::
INCLUDE "maps/palettes/obpals/luggage3.pal"

MapObjectPalsLuggage4::
INCLUDE "maps/palettes/obpals/luggage4.pal"

MapObjectPalsSlowpoke::
INCLUDE "maps/palettes/obpals/slowpoke.pal"

RoofPals::
INCLUDE "maps/palettes/roofpals/roof.pal"

StandardGrassPalette::
INCLUDE "maps/palettes/obpals/grass.pal"

RoofPalsDusk::
INCLUDE "maps/palettes/roofpals/roofdusk.pal"

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

INCLUDE "data/events/paintings/palettes.asm"

INCLUDE "engine/palettes.asm"
