INCLUDE "constants.asm"


SECTION "Code 1", ROMX

LoadPushOAM:: ; 4031
	lb bc, (PushOAMCodeEnd - PushOAMCode), hPushOAM & $ff
	ld hl, PushOAMCode
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret

PushOAMCode: ; 403f
	ld a, wSprites / $100
	ldh [rDMA], a
	ld a, 40
.loop
	dec a
	jr nz, .loop
	ret
PushOAMCodeEnd:

ReanchorBGMap_NoOAMUpdate:: ; 6454
	ldh a, [hOAMUpdate]
	push af

	ld a, $1
	ldh [hOAMUpdate], a
	ldh a, [hBGMapMode]
	push af

	xor a
	ldh [hBGMapMode], a
	ldh [hLCDCPointer], a
	ld a, $90
	ldh [hWY], a
	call LoadMapPart

	ld a, VBGMap1 / $100
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	call BGMapAnchorTopLeft
	farcall LoadBlindingFlashPalette
	farcall ApplyPals
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ldh [hBGMapAddress], a
	ld [wBGMapAnchor], a
	ldh [hSCX], a
	ldh [hSCY], a
	inc a
	ldh [hCGBPalUpdate], a
	ld a, VBGMap0 / $100 ; overworld
	ldh [hBGMapAddress + 1], a
	ld [wBGMapAnchor + 1], a
	call ApplyBGMapAnchorToObjects

	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ld hl, wVramState
	set 6, [hl]
	ret

LoadFonts_NoOAMUpdate:: ; 64bf
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call LoadFontsExtra
	ld a, $90
	ldh [hWY], a
	call SafeUpdateSprites
	call LoadStandardFont

	pop af
	ldh [hOAMUpdate], a
	ret

ReanchorBGMap_NoOAMUpdate_NoDelay::
	ldh a, [hOAMUpdate]
	push af

	ld a, $1
	ldh [hOAMUpdate], a
	ldh a, [hBGMapMode]
	push af

	xor a
	ldh [hBGMapMode], a
	ldh [hLCDCPointer], a
	ld a, $90
	ldh [hWY], a
	call LoadMapPart

	ld a, VBGMap1 / $100
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	call CopyTilemapAtOnce
	xor a
	ldh [hWY], a
	ldh [hBGMapAddress], a
	ld [wBGMapAnchor], a
	ldh [hSCX], a
	ldh [hSCY], a
	inc a
	ldh [hCGBPalUpdate], a
	ld a, VBGMap0 / $100 ; overworld
	ldh [hBGMapAddress + 1], a
	ld [wBGMapAnchor + 1], a
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ld hl, wVramState
	set 6, [hl]
	ld b, 0
	jp SafeCopyTilemapAtOnce

INCLUDE "engine/map_objects.asm"
INCLUDE "engine/intro_menu.asm"
INCLUDE "engine/init_options.asm"
INCLUDE "engine/math.asm"
INCLUDE "engine/npc_movement.asm"



SECTION "Code 2", ROMX


INCLUDE "data/predef_pointers.asm"
INCLUDE "engine/color.asm"

CheckTime:: ; c000
	ld a, [wTimeOfDay]
	ld hl, TimeOfDayTable
	ld de, 2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c

	xor a
	ld c, a
	ret

TimeOfDayTable: ; c012
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db DUSK, 1 << DUSK
	db -1

GetBreedMon1LevelGrowth: ; e698
	ld hl, wBreedMon1Stats
	ld de, wTempMon
	ld bc, BOXMON_STRUCT_LENGTH
	rst CopyBytes
	farcall CalcLevel
	ld a, [wBreedMon1Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret

GetBreedMon2LevelGrowth: ; e6b3
	ld hl, wBreedMon2Stats
	ld de, wTempMon
	ld bc, BOXMON_STRUCT_LENGTH
	rst CopyBytes
	farcall CalcLevel
	ld a, [wBreedMon2Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret
	

SECTION "Code 3", ROMX

INCLUDE "engine/sine.asm"
INCLUDE "engine/events/specials.asm"
INCLUDE "engine/printnum.asm"
INCLUDE "engine/health.asm"
INCLUDE "engine/events/overworld.asm"
INCLUDE "engine/items.asm"
INCLUDE "engine/anim_hp_bar.asm"
INCLUDE "engine/move_mon.asm"
INCLUDE "engine/billspctop.asm"
INCLUDE "engine/trainer_scripts.asm"

BugContest_SetCaughtContestMon: ; e6ce
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wd265], a
	call DisplayAlreadyCaughtText
	call DisplayCaughtContestMonStats
	call YesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, .caughttext
	jp PrintText

.generatestats ; e6fd
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld a, [wOTPartyMon1Form]
	ld [wCurForm], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [wMonType], a
	ld hl, wOTPartyMon1
	ld de, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ret

.caughttext ; 0xe71d
	; Caught @ !
	text_jump UnknownText_0x1c10c0
	db "@"

DisplayAlreadyCaughtText: ; cc0c7
	call GetPokemonName
	ld hl, .AlreadyCaughtText
	jp PrintText

.AlreadyCaughtText: ; 0xcc0d0
	; You already caught a @ .
	text_jump UnknownText_0x1c10dd
	db "@"

DisplayCaughtContestMonStats: ; cc000
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call LoadFontsBattleExtra

	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	hlcoord 0, 0
	lb bc, 4, 13
	call TextBox

	hlcoord 0, 6
	lb bc, 4, 13
	call TextBox

	hlcoord 2, 0
	ld de, .Stock
	call PlaceString

	hlcoord 2, 6
	ld de, .This
	call PlaceString

	hlcoord 5, 4
	ld de, .Health
	call PlaceString

	hlcoord 5, 10
	ld de, .Health
	call PlaceString

	ld a, [wContestMon]
	ld [wd265], a
	call GetPokemonName
	ld de, wStringBuffer1
	hlcoord 1, 2
	call PlaceString

	ld h, b
	ld l, c
	ld a, [wContestMonLevel]
	ld [wTempMonLevel], a
	call PrintLevel

	ld de, wEnemyMonNick
	hlcoord 1, 8
	call PlaceString

	ld h, b
	ld l, c
	ld a, [wEnemyMonLevel]
	ld [wTempMonLevel], a
	call PrintLevel

	hlcoord 11, 4
	ld de, wContestMonMaxHP
	lb bc, 2, 3
	call PrintNum

	hlcoord 11, 10
	ld de, wEnemyMonMaxHP
	call PrintNum

	ld hl, SwitchMonText
	call PrintText

	pop af
	ld [wOptions1], a

	call ApplyTilemapInVBlank
	ld b, CGB_DIPLOMA
	call GetCGBLayout
	jp SetPalettes

.Health:
	db "Health@"
.Stock:
	db " Stock <PK><MN> @"
.This:
	db " This <PK><MN>  @"

SwitchMonText: ; cc0c2
	; Switch #MON?
	text_jump UnknownText_0x1c10cf
	db "@"


SECTION "Code 4", ROMX

INCLUDE "engine/pack.asm"
INCLUDE "engine/time.asm"
INCLUDE "engine/tmhm.asm"
INCLUDE "engine/naming_screen.asm"
INCLUDE "engine/events/itemball.asm"
INCLUDE "engine/events/heal_machine_anim.asm"
INCLUDE "engine/events/whiteout.asm"
INCLUDE "engine/events/forced_movement.asm"
INCLUDE "engine/events/itemfinder.asm"
INCLUDE "engine/startmenu.asm"
INCLUDE "engine/selectmenu.asm"
INCLUDE "engine/events/elevator.asm"
INCLUDE "engine/events/bug_contest.asm"
INCLUDE "engine/events/safari_game.asm"
INCLUDE "engine/events/std_tiles.asm"


SECTION "Roofs", ROMX

INCLUDE "engine/mapgroup_roofs.asm"


SECTION "Code 5", ROMX

INCLUDE "engine/rtc.asm"
INCLUDE "engine/overworld.asm"
INCLUDE "engine/tile_events.asm"
INCLUDE "engine/save.asm"
INCLUDE "engine/spawn_points.asm"
INCLUDE "engine/map_setup.asm"
INCLUDE "engine/pokecenter_pc.asm"


SECTION "Code 6", ROMX

INCLUDE "engine/clock_reset.asm"
INCLUDE "engine/events/specials_2.asm"
INCLUDE "engine/item_effects.asm"


;SECTION "Effect Command Pointers", ROMX

INCLUDE "data/battle/effect_command_pointers.asm"


SECTION "Code 7", ROMX

INCLUDE "engine/events/pokepic.asm"
INCLUDE "engine/scrolling_menu.asm"
INCLUDE "engine/switch_items.asm"
INCLUDE "engine/menu.asm"
INCLUDE "engine/mon_menu.asm"
INCLUDE "engine/battle/menu.asm"
INCLUDE "engine/buy_sell_toss.asm"
INCLUDE "engine/events/prof_oaks_pc.asm"
INCLUDE "engine/decorations.asm"
INCLUDE "data/trainers/dvs.asm"

UpdateItemDescriptionAndBagQuantity:
	hlcoord 0, 0
	lb bc, 1, 8
	call ClearBox
	ld a, [wMenuSelection]
	cp -1
	jr z, UpdateItemDescription
	hlcoord 0, 0
	ld de, BagXString
	call PlaceString
	ld a, [wMenuSelection]
	call GetQuantityInBag
	hlcoord 3, 0
	ld de, wBuffer1
	lb bc, 2, 3
	call PrintNum
UpdateItemDescription: ; 0x244c3
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farjp PrintItemDescription

BagXString:
	db "Bag ×@"

UpdateTMHMDescriptionAndOwnership:
	hlcoord 0, 0
	lb bc, 1, 8
	call ClearBox
	ld a, [wMenuSelection]
	cp -1
	jr z, UpdateTMHMDescription
	ld a, [wCurTMHM]
	call CheckTMHM
	ld de, OwnedTMString
	jr c, .GotString
	ld de, UnownedTMString
.GotString
	hlcoord 0, 0
	call PlaceString
UpdateTMHMDescription:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farjp PrintTMHMDescription

UpdateMonDescription:
	hlcoord 0, 0
	lb bc, 1, 8
	call ClearBox
	ld a, [wMenuSelection]
	cp -1
	jr z, UpdateMonDescription2
	ld a, [wCurItem]
	dec a
	call CheckCaughtMon
	ld de, OwnedTMString
	jr nz, .GotString
	ld a, [wCurItem]
	dec a
	call CheckSeenMon
	ld de, SeenMonString
	jr nz, .GotString
	ld de, NewMonString
.GotString
	hlcoord 0, 0
	call PlaceString
UpdateMonDescription2:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farjp PrintMonDescription
	
UpdateClothesDescriptionAndOwnership:
	hlcoord 0, 0
	lb bc, 1, 8
	call ClearBox
	ld a, [wMenuSelection]
	cp -1
	jr z, UpdateClothesDescription
	ld a, [wCurTMHM]
	call CheckClothes
	ld de, OwnedTMString
	jr c, .GotString
	ld de, UnownedTMString
.GotString
	hlcoord 0, 0
	call PlaceString
UpdateClothesDescription:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farjp PrintClothesDescription
	
UpdateDecoDescriptionAndOwnership:
	hlcoord 0, 0
	lb bc, 1, 8
	call ClearBox
	ld a, [wMenuSelection]
	cp -1
	jr z, UpdateDecoDescription
	ld a, [wCurTMHM]
	call CheckDeco
	ld de, OwnedTMString
	ld a, [wScriptVar]
	cp TRUE
	jr z, .GotString
	ld de, UnownedTMString
.GotString
	hlcoord 0, 0
	call PlaceString
UpdateDecoDescription:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wMenuSelection]
	cp -1
	ret z
	decoord 1, 14
	farjp PrintDecoDescription
	
CheckDeco:: ; d3fb
	ld a, [wCurTMHM]
	ld c, a
	xor a
	ld b, a
	ld hl, DECO_FLAGS_START
	add hl, bc
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [wScriptVar], a
	ret
	
ReceiveDeco:: ; d3c4
	ld a, [wCurTMHM]
	ld c, a
	xor a
	ld b, a
	ld hl, DECO_FLAGS_START
	add hl, bc
	ld e, l
	ld d, h
	ld b, SET_FLAG
	jp EventFlagAction
	
OwnedTMString:
	db "OWNED@"
UnownedTMString:
	db "UNOWNED@"
SeenMonString:
	db "SEEN@"
NewMonString:
	db "UNSEEN@"

GetQuantityInBag:
	ld a, [wCurItem]
	push af
	ld a, [wMenuSelection]
	ld [wCurItem], a
	call CountItem
	pop af
	ret

INCLUDE "data/items/icon_pointers.asm"

PlaceMenuItemName:
; places a star near the name if registered
	push de
	dec de
	ld a, " "
	ld [de], a
	ld a, [wMenuSelection]
	push bc
	and a
	jr z, .not_registered
	ld b, a
	ld hl, wRegisteredItems
	ld a, [hli]
	cp b
	ld c, "▲"
	jr z, .registered
	ld a, [hli]
	cp b
	ld c, "◀"
	jr z, .registered
	ld a, [hli]
	cp b
	ld c, "<PHONE>"
	jr z, .registered
	ld a, [hli]
	cp b
	ld c, "▼"
	jr nz, .not_registered
.registered
	push bc
	push de
	farcall CheckRegisteredItem
	pop de
	pop bc
	dec a
	jr nz, .not_unique
	ld c, "★"
.not_unique
	ld a, c
	ld [de], a
.not_registered
	pop bc
	pop de
	push de
	
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	cp a, -1 ; special case for Cancel in Key Items pocket
	ld de, ScrollingMenu_CancelString ; found in scrolling_menu.asm
	ld [wNamedObjectIndexBuffer], a
	call nz, GetItemName
	pop hl
	call PlaceString
	
	ld a, [wCurSpecies]
	cp a, -1
	jr z, .clear
	ld e, a
	ld d, 0
	ld hl, ItemIconPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, 4
	ld c, a
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
	ld hl, VTiles0 tile $68
	jr .finish
.second
	ld hl, VTiles0 tile $6c
	jr .finish
.third
	ld hl, VTiles0 tile $70
	jr .finish
.forth
	ld hl, VTiles0 tile $74
.finish
	push af
	call Get2bpp
	farcall LoadItemIconPalette
	call SetPalettes
	pop af
	inc a
	ld [wPlaceBallsX], a
	ret
.fifth
	ld hl, VTiles0 tile $78
	call Get2bpp
	farcall LoadItemIconPalette
	call SetPalettes
	xor a
	ld [wPlaceBallsX], a
	ret
.clear
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first2
	cp 1
	jr z, .second2
	cp 2
	jr z, .third2
	cp 3
	jr z, .forth2
	jr .fifth2
.first2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $68
	call Get2bpp
.second2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $6c
	call Get2bpp
.third2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $70
	call Get2bpp
.forth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $74
	call Get2bpp
.fifth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, VTiles0 tile $78
	call Get2bpp
	xor a
	ld [wPlaceBallsX], a
	ret

PlaceMenuTMHMName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndexBuffer], a
	farcall GetTMHMName
	pop hl
	jp PlaceString

PlaceMartClothesName:
	push de
	ld a, [wMenuSelection]
	cp a, -1 ; special case for Cancel in Key Items pocket
	ld de, ScrollingMenu_CancelString ; found in scrolling_menu.asm
	ld [wNamedObjectIndexBuffer], a
	call nz, GetClothesName
	pop hl
	jp PlaceString
	
PlaceMartDecoName:
	push de
	ld a, [wMenuSelection]
	cp a, -1 ; special case for Cancel in Key Items pocket
	ld de, ScrollingMenu_CancelString ; found in scrolling_menu.asm
	ld [wNamedObjectIndexBuffer], a
	call nz, GetDecoName2
	pop hl
	jp PlaceString
	
PlaceMartPokemonName:
	push de
	ld a, [wMenuSelection]
	cp a, -1 ; special case for Cancel in Key Items pocket
	ld de, ScrollingMenu_CancelString ; found in scrolling_menu.asm
	ld [wNamedObjectIndexBuffer], a
	call nz, GetPokemonName
	pop hl
	call PlaceString
	farjp LoadBuyMonIcon

PlaceMenuItemQuantity: ; 0x24ac3
	push de
	eventflagcheck EVENT_IN_PLAYERS_PC
	jr nz, .skip
	ld a, [wMenuSelection]
	ld [wCurItem], a
	
	cp RARE_CANDY
	jr nz, .skip
	push af
	ld a, [wUnknownRC]
	ld b, a
	ld a, [wMenuSelectionQuantity]
	cp b
	jr z, .done_check
	ld de, MUSIC_CLOWN
	call PlayMusic
	eventflagset EVENT_YOU_CHEATED
	ld a, PLAYER_CLOWN
	ld [wPlayerState], a
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
.done_check
	pop af
.skip
	
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	pop hl
	and a
	ret nz
_PlaceMenuQuantity:
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wMenuSelectionQuantity
	lb bc, 1, 2
	jp PrintNum

PlaceMoneyTopRight: ; 24ae8
	ld hl, MenuDataHeader_0x24b15
	call CopyMenuDataHeader
	jr PlaceMoneyDataHeader

PlaceMoneyBottomLeft: ; 24af0
	ld hl, MenuDataHeader_0x24b1d
	call CopyMenuDataHeader
	jr PlaceMoneyDataHeader

PlaceMoneyAtTopLeftOfTextbox: ; 24af8
	ld hl, MenuDataHeader_0x24b15
	lb de, 0, 11
	call OffsetMenuDataHeader

PlaceMoneyDataHeader: ; 24b01
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	jp PrintNum

MenuDataHeader_0x24b15: ; 0x24b15
	db $40 ; flags
	db 00, 10 ; start coords
	db 02, 19 ; end coords
	dw NULL
	db 1 ; default option

MenuDataHeader_0x24b1d: ; 0x24b1d
	db $40 ; flags
	db 11, 00 ; start coords
	db 13, 09 ; end coords
	dw NULL
	db 1 ; default option

PlaceBlueCardPointsTopRight:
	hlcoord 11, 0
	lb bc, 1, 7
	call TextBox
	hlcoord 12, 1
	ld de, wBlueCardBalance
	lb bc, 1, 3
	call PrintNum
	ld de, .PointsString
	jp PlaceString

.PointsString:
	db " Pts@"

PlaceBattlePointsTopRight:
	hlcoord 12, 0
	lb bc, 1, 6
	call TextBox
	hlcoord 13, 1
	ld de, wBattlePoints
	lb bc, 1, 3
	call PrintNum
	ld de, .BPString
	jp PlaceString

.BPString:
	db " BP@"

Special_DisplayCoinCaseBalance:
	hlcoord 8, 0
	ld de, CoinString
	call PlaceString
	ld de, wCoins
	lb bc, PRINTNUM_LEFTALIGN | 2, 4
	hlcoord 15, 0
	jp PrintNum

Special_DisplayPollenPouchBalance: ; 24b25
	hlcoord 9, 0
	ld de, PuffString
	call PlaceString
	ld de, wPollenSteps
	lb bc, PRINTNUM_LEFTALIGN | 2, 4
	hlcoord 16, 0
	jp PrintNum

Special_DisplayMoneyAndCoinBalance: ; 24b4e
	hlcoord 5, 0
	lb bc, 4, 13
	call TextBox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 11, 1
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 14, 3
	ld de, wCoins
	lb bc, 2, 5
	jp PrintNum

MoneyString: ; 24b83
	db "MONEY@"
CoinString: ; 24b89
	db "COINs ×@"
PuffString:
	db "PUFFs ×@"

StartMenu_DrawBugContestStatusBox: ; 24bdc
	hlcoord 0, 0
	lb bc, 5, 17
	jp TextBox

StartMenu_PrintBugContestStatus: ; 24be7
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 1, 5
	ld de, .Balls
	call PlaceString
	hlcoord 8, 5
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, .Caught
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, .None
	jr z, .no_contest_mon
	ld [wd265], a
	call GetPokemonName

.no_contest_mon
	hlcoord 8, 1
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .skip_level
	hlcoord 1, 3
	ld de, .Level
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, 3
	call Print8BitNumRightAlign

.skip_level
	pop af
	ld [wOptions1], a
	ret

.Caught: ; 24c4b
	db "Caught@"
.Balls: ; 24c52
	db "Balls:@"
.None: ; 24c59
	db "None@"
.Level: ; 24c5e
	db "Level@"

PadCoords_de: ; 27092
	ld a, d
	add 4
	ld d, a
	ld a, e
	add 4
	ld e, a
	jp GetBlockLocation

LevelUpHappinessMod: ; 2709e
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	farjp ChangeHappiness

_ReturnToBattle_UseBall: ; 2715c
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	farcall GetMonBackpic
	jr .continue

.gettutorialbackpic
	farcall GetTrainerBackpic
.continue
	farcall GetMonFrontpic
	farcall _LoadBattleFontsHPBar
	call GetMemCGBLayout
	call CloseWindow
	call LoadStandardMenuDataHeader
	call ApplyTilemapInVBlank
	call SetPalettes
	farcall LoadPlayerStatusIcon
	farcall LoadEnemyStatusIcon
	farjp FinishBattleAnim

INCLUDE "data/moves/effects_pointers.asm"

INCLUDE "data/moves/effects.asm"


SECTION "Code 8", ROMX

INCLUDE "engine/link.asm"


SECTION "Code 9", ROMX

INCLUDE "data/battle/music.asm"
INCLUDE "engine/battle/trainer_huds.asm"
INCLUDE "engine/battle/ai/redundant.asm"
INCLUDE "engine/events/move_deleter.asm"
INCLUDE "engine/tmhm2.asm"
INCLUDE "engine/events/pokerus.asm"
INCLUDE "data/trainers/class_names.asm"
INCLUDE "data/moves/descriptions.asm"

ShowLinkBattleParticipants: ; 2ee18
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	farcall _ShowLinkBattleParticipants
	ld c, 150
	call DelayFrames
	call ClearTileMap
	jp ClearSprites

FindFirstAliveMonAndStartBattle: ; 2ee2f
	xor a
	ldh [hMapAnims], a
	call DelayFrame
	ld b, 6
	ld hl, wPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr nz, .okay
	add hl, de
	dec b
	jr nz, .loop

.okay
	ld de, MON_LEVEL - MON_HP
	add hl, de
	ld a, [hl]
	ld [wBattleMonLevel], a
	predef Predef_StartBattle
	farcall _LoadBattleFontsHPBar
	ld a, 1
	ldh [hBGMapMode], a
	call ClearSprites
	call ClearTileMap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ldh [rWY], a
	ldh [hMapAnims], a
	ret

ClearBattleRAM: ; 2ef18
	xor a
	ld [wBattlePlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [wCriticalHit], a
	ld [wBattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [wCurBattleMon], a
	ld [wTimeOfDayPal], a
	ld [wTotalBattleTurns], a
	ld [wPlayerTurnsTaken], a
	ld [wEnemyTurnsTaken], a
	ld [wEvolvableFlags], a

	ld hl, wPlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonDVs
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonPersonality
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonPersonality
	ld [hli], a
	ld [hl], a

	; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	; Clear UsedItems
	ld hl, wPartyUsedItems
	ld bc, 6
	xor a
	call ByteFill
	ld hl, wOTPartyUsedItems
	ld bc, 6
	xor a
	call ByteFill

	farcall ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a
	ld [hli], a
	ld [hl], VBGMap0 / $100
	ret

PlaceGraphic: ; 2ef6e
; Fill wBoxAlignment-aligned box width b height c
; with iterating tile starting from hGraphicStartTile at hl.
; Predef $13

	ld de, SCREEN_WIDTH

	ld a, [wBoxAlignment]
	and a
	jr nz, .right

	ldh a, [hGraphicStartTile]
.x1
	push bc
	push hl

.y1
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y1

	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .x1
	ret

.right
; Right-aligned.
	push bc
	ld b, 0
	dec c
	add hl, bc
	pop bc

	ldh a, [hGraphicStartTile]
.x2
	push bc
	push hl

.y2
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y2

	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .x2
	ret


SECTION "Code 10", ROMX

INCLUDE "engine/mail.asm"
INCLUDE "engine/events/fruit_trees.asm"
INCLUDE "engine/events/hidden_grottoes.asm"
INCLUDE "engine/battle/ai/move.asm"

AnimateDexSearchSlowpoke: ; 441cf
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	jp DelayFrames

.FrameIDs: ; 441fc
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame: ; 44207
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SpriteData
	ld de, wSprites
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop

.SpriteData: ; 44228
	dsprite 11, 0,  9, 0, $00, $0
	dsprite 11, 0, 10, 0, $01, $0
	dsprite 11, 0, 11, 0, $02, $0
	dsprite 12, 0,  9, 0, $10, $0
	dsprite 12, 0, 10, 0, $11, $0
	dsprite 12, 0, 11, 0, $12, $0
	dsprite 13, 0,  9, 0, $20, $0
	dsprite 13, 0, 10, 0, $21, $0
	dsprite 13, 0, 11, 0, $22, $0
	db -1

DisplayDexEntry:
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString ; mon species
	ld a, [wd265]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 5
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, "№"
	ld [hli], a
	ld a, "."
	ld [hli], a
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
	inc hl
	inc hl
	ld a, d
	or e
	jr z, .skip_height
	ld a, [wOptions2]
	bit POKEDEX_UNITS, a
	jr z, .imperial_height

	push hl
	ld l, d
	ld h, e
	ld bc, -100
	ld e, 0
.inchloop
	ld a, h
	and a
	jr nz, .inchloop2
	ld a, l
	cp 100
	jr c, .inchdone
.inchloop2
	add hl, bc
	inc e
	jr .inchloop
.inchdone
	ld a, e
	ld e, l
	ld d, 0
	ld hl, 0
	ld bc, 12
	rst AddNTimes
	add hl, de
	ld b, h
	ld c, l
	ld de, 16646 ; 0.254 << 16
	call Mul16
	ld de, hTmpd
	hlcoord 11, 7
	lb bc, 2, PRINTNUM_LEFTALIGN | 5
	call PrintNum
	pop hl
	jr .skip_height

.imperial_height
	push hl
	push de
	ld hl, sp+$0
	ld d, h
	ld e, l
	hlcoord 12, 7
	lb bc, 2, PRINTNUM_MONEY | 4
	call PrintNum
	hlcoord 14, 7
	ld [hl], "′"
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	ld a, [wOptions2]
	bit POKEDEX_UNITS, a
	jr z, .imperial_weight

	ld c, d
	ld b, e
	ld de, 29726 ; 0.45359237 << 16
	call Mul16
	ld de, hTmpd
	hlcoord 11, 9
	lb bc, 2, PRINTNUM_LEFTALIGN | 5
	call PrintNum
	jr .skip_weight

.imperial_weight
	push de
	ld hl, sp+$0
	ld d, h
	ld e, l
	hlcoord 11, 9
	lb bc, 2, PRINTNUM_LEFTALIGN | 5
	call PrintNum
	pop de

.skip_weight
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $5f ; horizontal divider
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	pop de
	inc de
	pop af
	hlcoord 2, 11
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $5f ; horizontal divider
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
	pop de
	inc de
	pop af
	hlcoord 2, 11
	jp FarString

; Metric conversion code by TPP Anniversary Crystal 251
; https://github.com/TwitchPlaysPokemon/tppcrystal251pub/blob/public/main.asm
Mul16:
	;[hTmpd][hTmpe]hl = bc * de
	xor a
	ldh [hTmpd], a
	ldh [hTmpe], a
	ld hl, 0
	ld a, 16
	ldh [hProduct], a
.loop
	sla l
	rl h
	ldh a, [hTmpe]
	rla
	ldh [hTmpe], a
	ldh a, [hTmpd]
	rla
	ldh [hTmpd], a
	sla e
	rl d
	jr nc, .noadd
	add hl, bc
	ldh a, [hTmpe]
	adc 0
	ldh [hTmpe], a
	ldh a, [hTmpd]
	adc 0
	ldh [hTmpd], a
.noadd
	ldh a, [hProduct]
	dec a
	ldh [hProduct], a
	jr nz, .loop
	ret

GetDexEntryPointer: ; 44333
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	and $3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks: ; 44351
	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)

	call GetDexEntryPointer ; b:de
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

PokedexDataPointerTable: ; 0x44378
INCLUDE "data/pokemon/dex_entry_pointers.asm"


SECTION "Code 11", ROMX

INCLUDE "engine/main_menu.asm"
INCLUDE "engine/search.asm"
INCLUDE "engine/events/celebi.asm"
INCLUDE "engine/tileset_palettes.asm"

Special_MoveTutor: ; 4925b
	call FadeToMenu
	call ClearBGPalettes
	call ClearScreen
	call DelayFrame
	ld b, CGB_PACKPALS
	call GetCGBLayout
	xor a
	ld [wItemAttributeParamBuffer], a
	ld a, [wScriptVar]
	and a
	ld [wPutativeTMHMMove], a
	jr z, .relearner
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	call CopyName1
.relearner
	farcall ChooseMonToLearnTMHM
	jr c, .cancel
	jr .enter_loop

.loop
	farcall ChooseMonToLearnTMHM_NoRefresh
	jr c, .cancel
.enter_loop
	call CheckCanLearnMoveTutorMove
	jr nc, .loop
	xor a
	jr .quit

.cancel
	ld a, -1
.quit
	ld [wScriptVar], a
	jp CloseSubmenu

CheckCanLearnMoveTutorMove: ; 492b9
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader

	predef CanLearnTMHMMove

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .can_learn
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld a, [wPutativeTMHMMove]
	and a
	jr z, .reminder2
	ld a, BANK(Text_TMHMNotCompatible)
	ld hl, Text_TMHMNotCompatible
	call FarPrintText
	jr .didnt_learn

.reminder2
	ld a, BANK(Text_ReminderNotCompatible)
	ld hl, Text_ReminderNotCompatible
	call FarPrintText
	jr .didnt_learn

.can_learn
	ld a, [wPutativeTMHMMove]
	and a
	jr z, .reminder
	farcall KnowsMove
	jr c, .didnt_learn

	predef LearnMove
.perform_move_learn
	ld a, b
	and a
	jr z, .didnt_learn

	ld c, HAPPINESS_LEARNMOVE
	farcall ChangeHappiness
	jr .learned

.reminder
	farcall ChooseMoveToRelearn
	jr nc, .can_remind
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld a, BANK(MoveReminderNoMovesText)
	ld hl, MoveReminderNoMovesText
	call FarPrintText
	jr .didnt_learn

.can_remind
	jr z, .didnt_learn
	ld a, [wMoveScreenSelectedMove]
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	push hl
	push de
	farcall CheckMultiMoveSlot2
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	push af
	ld a, [wTempMonSpecies]
	ld [wCurPartySpecies], a
	pop af
	farcall GetMultiMoveSlotName2
	jr .done_multi_move
.not_multi_move_slot
	pop de
	pop hl
	call GetMoveName
.done_multi_move
	call CopyName1
	predef LearnMove
	xor a
	ld [wPutativeTMHMMove], a
	jr .perform_move_learn

.didnt_learn
	call ExitMenu
	and a
	ret

.learned
	call ExitMenu
	scf
	ret

.MenuDataHeader: ; 0x4930a
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords

AskRememberPassword: ; 4ae12
	call .DoMenu
	ld a, 0 ; not xor a; preserve carry flag
	jr c, .okay
	ld a, $1

.okay
	ld [wScriptVar], a
	ret

.DoMenu: ; 4ae1f
	lb bc, 14, 7
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	call VerticalMenu
	push af
	ld c, 15
	call DelayFrames
	call Buena_ExitMenu
	pop af
	jr c, .refused
	ld a, [wMenuCursorY]
	cp $2
	jr z, .refused
	and a
	ret

.refused
	ld a, $2
	ld [wMenuCursorY], a
	scf
	ret

Buena_ExitMenu: ; 4ae5e
	ldh a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ldh [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ldh [hOAMUpdate], a
	ret

PackGFX:
INCBIN "gfx/pack/pack.2bpp"
PackFGFX: ; 48e9b
INCBIN "gfx/pack/pack_f.2bpp"


SECTION "Code 12", ROMX

EmptyAllSRAMBanks: ; 4cf1f
	xor a
	call .EmptyBank
	ld a, $1
	call .EmptyBank
	ld a, $2
	call .EmptyBank
	ld a, $3
	; fallthrough

.EmptyBank: ; 4cf34
	call GetSRAMBank
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	jp CloseSRAM

CheckSave:: ; 4cffe
	ld a, BANK(sCheckValue1)
	call GetSRAMBank
	ld a, [sCheckValue1]
	ld b, a
	ld a, [sCheckValue2]
	ld c, a
	call CloseSRAM
	ld a, b
	cp SAVE_CHECK_VALUE_1
	jr nz, .ok
	ld a, c
	cp SAVE_CHECK_VALUE_2
	jr nz, .ok
	ld c, $1
	ret

.ok
	ld c, $0
	ret

INCLUDE "data/maps/scenes.asm"

Shrink1Pic: ; 4d249
INCBIN "gfx/new_game/shrink1.2bpp.lz"

Shrink2Pic: ; 4d2d9
INCBIN "gfx/new_game/shrink2.2bpp.lz"

_ResetClock: ; 4d3b1
	ld b, CGB_OPTIONS
	call GetCGBLayout
	call SetPalettes
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_NONE
	call PlayMusic
	ld hl, .text_askreset
	call PrintText
	ld hl, .NoYes_MenuDataHeader
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	ld a, $80
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ld hl, .text_okay
	jp PrintText

.text_okay ; 0x4d3fe
	; Select CONTINUE & reset settings.
	text_jump UnknownText_0x1c55db
	db "@"

.text_askreset ; 0x4d408
	; Reset the clock?
	text_jump UnknownText_0x1c561c
	db "@"

.NoYes_MenuDataHeader: ; 0x4d40d
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw .NoYes_MenuData2
	db 1 ; default option

.NoYes_MenuData2: ; 0x4d415
	db $c0 ; flags
	db 2 ; items
	db "No@"
	db "Yes@"

_DeleteSaveData: ; 4d54c
	ld b, CGB_OPTIONS
	call GetCGBLayout
	call SetPalettes
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_NONE
	call PlayMusic
	ld hl, .Text_ClearAllSaveData
	call PrintText
	ld hl, TitleScreenNoYesMenuDataHeader
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	farcall BlankScreen
	ld hl, .Text_ClearAllSaveDataPositive
	call PrintText
	ld hl, TitleScreenNoYesMenuDataHeader
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	farcall BlankScreen
	ld hl, .Text_ClearAllSaveDataDone
	call PrintText
	farjp EmptyAllSRAMBanks

.Text_ClearAllSaveData: ; 0x4d580
	; Clear all save data?
	text_jump UnknownText_0x1c564a
	db "@"
	
.Text_ClearAllSaveDataPositive: ; 0x4d580
	; Are you sure?
	text_jump Text_ClearAllSaveDataPositive
	db "@"

.Text_ClearAllSaveDataDone:
	; All save data cleared.
	text_jump Text_ClearAllSaveDataDone
	db "@"
	
TitleScreenNoYesMenuDataHeader: ; 0x4d585
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2: ; 0x4d58d
	db $c0 ; flags
	db 2 ; items
	db "No@"
	db "Yes@"

FlagPredef: ; 4d7c1
; Perform action b on flag c in flag array hl.
; If checking a flag, check flag array d:hl unless d is 0.

; For longer flag arrays, see FlagAction.

	push hl
	push bc

; Divide by 8 to get the byte we want.
	push bc
	srl c
	srl c
	srl c
	ld b, 0
	add hl, bc
	pop bc

; Which bit we want from the byte
	ld a, c
	and 7
	ld c, a

; Shift left until we can mask the bit
	ld a, 1
	jr z, .shifted
.shift
	add a
	dec c
	jr nz, .shift
.shifted
	ld c, a

; What are we doing to this flag?
	dec b
	jr z, .set ; 1
	dec b
	jr z, .check ; 2

.reset
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	jr .done

.set
	ld a, [hl]
	or c
	ld [hl], a
	jr .done

.check
	ld a, d
	cp 0
	jr nz, .farcheck

	ld a, [hl]
	and c
	jr .done

.farcheck
	call GetFarByte
	and c

.done
	pop bc
	pop hl
	ld c, a
	ret

GetTrademonFrontpic: ; 4d7fd
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonForm
	ld de, VTiles2
	push de
	push af
	predef GetVariant
	pop af
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	pop de
	predef FrontpicPredef
	ret

AnimateTrademonFrontpic: ; 4d81e
	ld a, [wOTTrademonSpecies]
	call IsAPokemon
	ret c
	farcall ShowOTTrademonStats
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wOTTrademonPersonality]
	ld [wTempMonPersonality], a
	ld a, [wOTTrademonPersonality + 1]
	ld [wTempMonPersonality + 1], a
	ld b, CGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	farcall TradeAnim_ShowGetmonFrontpic
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	hlcoord 7, 2
	lb de, $0, ANIM_MON_TRADE
	predef AnimateFrontpic
	ret

CheckPokerus: ; 4d860
	and a
	ret

Special_CheckForLuckyNumberWinners: ; 4d87a
	xor a
	ld [wScriptVar], a
	ld [wFoundMatchingIDInParty], a
	ld a, [wPartyCount]
	and a
	ret z
	ld d, a
	ld hl, wPartyMon1ID
	ld bc, wPartySpecies
.PartyLoop:
	ld a, [bc]
	inc bc
	cp EGG
	call nz, .CompareLuckyNumberToMonID
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .PartyLoop
	ld a, BANK(sBox)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .SkipOpenBox
	ld d, a
	ld hl, sBoxMon1ID
	ld bc, sBoxSpecies
.OpenBoxLoop:
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipOpenBoxMon
	call .CompareLuckyNumberToMonID
	jr nc, .SkipOpenBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipOpenBoxMon:
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .OpenBoxLoop

.SkipOpenBox:
	call CloseSRAM
	ld c, $0
.BoxesLoop:
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .SkipBox
	ld hl, .BoxBankAddresses
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl now contains the address of the loaded box in SRAM
	ld a, [hl]
	and a
	jr z, .SkipBox ; no mons in this box
	push bc
	ld b, h
	ld c, l
	inc bc
	ld de, sBoxMon1ID - sBox
	add hl, de
	ld d, a
.BoxNLoop:
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipBoxMon

	call .CompareLuckyNumberToMonID ; sets wScriptVar and wCurPartySpecies appropriately
	jr nc, .SkipBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipBoxMon:
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .BoxNLoop
	pop bc

.SkipBox:
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .BoxesLoop

	call CloseSRAM
	ld a, [wScriptVar]
	and a
	ret z ; found nothing
	ld a, [wFoundMatchingIDInParty]
	and a
	push af
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .FoundPartymonText
	pop af
	jr z, .print
	ld hl, .FoundBoxmonText

.print
	jp PrintText

.CompareLuckyNumberToMonID: ; 4d939
	push bc
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, wBuffer1
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld hl, wLuckyNumberDigitsBuffer
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	lb bc, 5, 0
	ld hl, wLuckyNumberDigitsBuffer + 4
	ld de, wBuffer1 + 4
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	dec de
	dec hl
	inc c
	dec b
	jr nz, .loop

.done
	pop hl
	push hl
	ld de, -6
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	push af
	ld a, c
	ld b, 1
	cp 5
	jr z, .okay
	ld b, 2
	cp 4
	jr z, .okay
	ld b, 3
	cp 3
	jr nc, .okay
	ld b, 4
	cp 2
	jr nz, .nomatch

.okay
	inc b
	ld a, [wScriptVar]
	and a
	jr z, .bettermatch
	cp b
	jr c, .nomatch

.bettermatch
	dec b
	ld a, b
	ld [wScriptVar], a
	pop bc
	ld a, b
	ld [wCurPartySpecies], a
	pop bc
	scf
	ret

.nomatch
	pop bc
	pop bc
	and a
	ret

.BoxBankAddresses: ; 4d99f
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14

.FoundPartymonText: ; 0x4d9c9
	; Congratulations! We have a match with the ID number of @  in your party.
	text_jump UnknownText_0x1c1261
	db "@"

.FoundBoxmonText: ; 0x4d9ce
	; Congratulations! We have a match with the ID number of @  in your PC BOX.
	text_jump UnknownText_0x1c12ae
	db "@"

Special_PrintTodaysLuckyNumber: ; 4d9d3
	ld hl, wStringBuffer3
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [wStringBuffer3 + 5], a
	ret

CheckPartyFullAfterContest:: ; 4d9e5
	ld a, [wContestMon]
	and a
;	jp z, .DidntCatchAnything
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wPartyCount
	ld a, [hl]
	cp 6
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wContestMon]
	ld [hli], a
	ld [wCurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, wPartyMon1Species
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	rst CopyBytes
	ld a, [wCurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	farcall InitNickname

.Party_SkipNickname:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wMonOrItemNameBuffer
	rst CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, POKE_BALL
	ld [wCurItem], a
	call SetCaughtData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, STARGLOW_DEPTHS
	ld [hl], a
	xor a
	ld [wContestMon], a
	and a
	ld [wScriptVar], a
	ret

.TryAddToBox: ; 4daa3
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	call CloseSRAM
	jr nc, .BoxFull
	xor a
	ld [wCurPartyMon], a
	ld hl, wContestMon
	ld de, wBufferMon
	ld bc, BOXMON_STRUCT_LENGTH
	rst CopyBytes
	ld hl, wPlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	rst CopyBytes
	farcall InsertPokemonIntoBox
	ld a, [wCurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	call GiveANickname_YesNo
	ld hl, wStringBuffer1
	jr c, .Box_SkipNickname
	ld a, BOXMON
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	farcall InitNickname
	ld hl, wMonOrItemNameBuffer

.Box_SkipNickname:
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	call CloseSRAM
	ld a, $1
	ld [wScriptVar], a
	jr .BoxFinish
.BoxFull:
	ld a, $2
	ld [wScriptVar], a
.BoxFinish:
	ld a, BANK(sBoxMon1Level)
	call GetSRAMBank
	ld a, [sBoxMon1Level]
	ld [wCurPartyLevel], a
	call CloseSRAM
	call SetBoxMonCaughtData
	ld a, BANK(sBoxMon1CaughtLocation)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLocation
	ld a, STARGLOW_DEPTHS
	ld [hl], a
	call CloseSRAM
	xor a
	ld [wContestMon], a
	ret

;.DidntCatchAnything: ; 4db35
;	ld a, $2
;	ld [wScriptVar], a
;	ret

GiveANickname_YesNo: ; 4db3b
	ld a, [wInitialOptions]
	bit NUZLOCKE_MODE, a
	jr nz, .AlwaysNickname
	ld hl, TextJump_GiveANickname
	call PrintText
	jp YesNoBox

.AlwaysNickname:
	ld a, 1
	and a
	ret

TextJump_GiveANickname: ; 0x4db44
	; Give a nickname to the @  you received?
	text_jump UnknownText_0x1c12fc
	db "@"

SetCaughtData: ; 4db49
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtData
	call GetPartyLocation
SetBoxmonOrEggmonCaughtData: ; 4db53
	; CaughtGender
	ld a, [wPlayerGender]
	and a
	jr z, .male
	ld a, FEMALE
	jr .ok
.male
	ld a, MALE
.ok
	ld b, a
	; CaughtTime
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	rrca
	or b
	ld b, a
	; CaughtBall
	ld a, [wCurItem]
	and CAUGHTBALL_MASK
	or b
	ld [hli], a
	; CaughtLevel
	ld a, [wCurPartyLevel]
	ld [hli], a
	; CaughtLocation
	call GetCurrentLandmark
	ld [hl], a
	ret

SetBoxMonCaughtData: ; 4db83
	ld a, BANK(sBoxMon1CaughtData)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtData
	call SetBoxmonOrEggmonCaughtData
	jp CloseSRAM

SetGiftBoxMonCaughtData: ; 4db92
	push bc
	ld a, BANK(sBoxMon1CaughtData)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtData
	pop bc
	call SetGiftMonCaughtData
	jp CloseSRAM

SetGiftPartyMonCaughtData: ; 4dba3
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtData
	call GetPartyLocation
SetGiftMonCaughtData: ; 4dbaf
	; CaughtGender
	; b contains it
	; CaughtTime
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	rrca
	or b
	ld b, a
	; CaughtBall
	; c contains it
	ld a, c
	and CAUGHTBALL_MASK
	or b
	ld [hli], a
	; CaughtLevel
	; Met in a trade
	xor a
	ld [hli], a
	; CaughtLocation
	; Unknown location
	ld [hl], a
	ret

SetEggMonCaughtData: ; 4dbb8 (13:5bb8)
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtData
	call GetPartyLocation
	ld a, [wCurPartyLevel]
	push af
	ld a, EGG_LEVEL
	ld [wCurPartyLevel], a
	ld a, POKE_BALL
	ld [wCurItem], a
	call SetBoxmonOrEggmonCaughtData
	pop af
	ld [wCurPartyLevel], a
	ret

_FindGreaterThanThatLevel: ; 4dbd2
	ld hl, wPartyMon1Level
	jp FindGreaterThanThatLevel

_FindAtLeastThatHappy: ; 4dbd9
	ld hl, wPartyMon1Happiness
	jp FindAtLeastThatHappy

_FindThatSpecies: ; 4dbe0
	ld hl, wPartyMon1Species
	jp FindThatSpecies

_FindThatSpeciesYourTrainerID: ; 4dbe6
	ld hl, wPartyMon1Species
	call FindThatSpecies
	ret z
	ld a, c
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .nope
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	jr nz, .nope
	ld a, $1
	and a
	ret

.nope
	xor a
	ret

FindAtLeastThatHappy: ; 4dc0a
; Sets the bits for the Pokemon that have a happiness greater than or equal to b.
; The lowest bits are used.  Sets z if no Pokemon in your party is at least that happy.
	ld c, $0
	ld a, [wPartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	call GetPartyLocation
	ld a, b
	cp [hl]
	pop hl
	jr z, .greater_equal
	jr nc, .lower

.greater_equal
	ld a, c
	or $1
	ld c, a

.lower
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret

FindGreaterThanThatLevel: ; 4dc31
	ld c, $0
	ld a, [wPartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	call GetPartyLocation
	ld a, b
	cp [hl]
	pop hl
	jr c, .greater
	ld a, c
	or $1
	ld c, a

.greater
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret

FindThatSpecies: ; 4dc56
; Find species b in your party.
; If you have no Pokemon, returns c = -1 and z.
; If that species is in your party, returns its location in c, and nz.
; Otherwise, returns z.
	ld c, -1
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	inc c
	cp b
	jr nz, .loop
	ld a, $1
	and a
	ret

RetroactivelyIgnoreEggs: ; 4dc67
	ld e, -2
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr nz, .skip_notegg
	ld a, c
	and e
	ld c, a

.skip_notegg
	rlc e
	jr .loop

INCLUDE "engine/stats_screen.asm"

CatchTutorial:: ; 4e554
	ld a, [wBattleType]
	dec a
	ld c, a
	ld hl, .dw
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw ; 4e564 (13:6564)
	dw .DudeTutorial
	dw .DudeTutorial
	dw .DudeTutorial

.DudeTutorial: ; 4e56a (13:656a)
; Back up your name
	ld hl, wPlayerName
	ld de, wBackupName
	ld bc, NAME_LENGTH
	rst CopyBytes
; Copy Dude's name to your name
	ld hl, .Dude
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	rst CopyBytes

	call .LoadDudeData

	xor a
	ldh [hJoyDown], a
	ldh [hJoyPressed], a

	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	farcall StartBattle
	call StopAutoInput

	ld hl, wBackupName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret

.LoadDudeData: ; 4e5b7 (13:65b7)
	ld hl, wDudeNumItems
	ld de, .DudeItems
	call .CopyDudeData
	ld hl, wDudeNumMedicine
	ld de, .DudeMedicine
	call .CopyDudeData
	ld hl, wDudeNumBalls
	ld de, .DudeBalls
.CopyDudeData:
	ld a, [de]
	inc de
	ld [hli], a
	cp -1
	jr nz, .CopyDudeData
	ret

.Dude: ; 4e5da
	db "Lyra@"
.DudeItems:
	db 2, REPEL, 1, GOLD_LEAF, 1, -1
.DudeMedicine:
	db 3, POTION, 2, ANTIDOTE, 1, FRESH_WATER, 1, -1
.DudeBalls:
	db 2, POKE_BALL, 10, PREMIER_BALL, 1, -1

.AutoInput: ; 4e5df
	db NO_INPUT, $ff ; end

INCLUDE "engine/evolution_animation.asm"

InitDisplayForHallOfFame: ; 4e881
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	call EnableLCD
	ld hl, .SavingRecordDontTurnOff
	call PrintText
	call ApplyAttrAndTilemapInVBlank
	jp SetPalettes

.SavingRecordDontTurnOff: ; 0x4e8bd
	; SAVING RECORD… DON'T TURN OFF!
	text_jump UnknownText_0x1bd39e
	db "@"

InitDisplayForLeafCredits: ; 4e8c2
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, VBGMap1 - VBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld hl, wUnknBGPals
	ld c, 4 tiles
.load_white_palettes
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
	jr nz, .load_white_palettes
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	call EnableLCD
	call ApplyAttrAndTilemapInVBlank
	jp SetPalettes

ResetDisplayBetweenHallOfFameMons: ; 4e906
	ldh a, [rSVBK]
	push af
	ld a, $6
	ldh [rSVBK], a
	ld hl, wScratchTileMap
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	ld a, " "
	call ByteFill
	hlbgcoord 0, 0
	ld de, wScratchTileMap
	lb bc, $0, $40
	call Request2bpp
	pop af
	ldh [rSVBK], a
	ret

INCLUDE "engine/battle/sliding_intro.asm"

INCLUDE "engine/bsod.asm"

INCLUDE "engine/events/stats_judge.asm"

INCLUDE "engine/events/poisonstep.asm"
INCLUDE "engine/events/pokeflute.asm"
INCLUDE "engine/events/sacred_ash.asm"


SECTION "Code 13", ROMX

INCLUDE "engine/party_menu.asm"

CopyPkmnToTempMon: ; 5084a
; gets the BaseData of a Pkmn
; and copys the PkmnStructure to wTempMon

	ld a, [wCurPartyMon]
	ld e, a
	call GetPkmnSpecies
CopyPkmnToTempMon2:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData

	ld a, [wMonType]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	and a
	jr z, .copywholestruct
	ld hl, wOTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	cp OTPARTYMON
	jr z, .copywholestruct
	ld bc, BOXMON_STRUCT_LENGTH
	farjp CopyBoxmonToTempMon

.copywholestruct
	ld a, [wCurPartyMon]
	rst AddNTimes
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ret

CalcwBufferMonStats: ; 5088b
	ld bc, wBufferMon
	jr _TempMonStatsCalculation

CalcTempmonStats: ; 50890
	ld bc, wTempMon
_TempMonStatsCalculation: ; 50893
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EVS - 1
	add hl, bc
	push bc
	ld b, TRUE
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wCurPartySpecies]
	cp EGG
	jr nz, .not_egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .zero_status

.not_egg
	push bc
	ld hl, MON_MAXHP
	add hl, bc
	ld bc, 2
	rst CopyBytes
	pop bc

.zero_status
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret

GetPkmnSpecies: ; 508d5
; [wMonType] has the type of the Pkmn
; e = Nr. of Pkmn (i.e. [wCurPartyMon])

	ld a, [wMonType]
	and a ; PARTYMON
	jr z, .partymon
	cp OTPARTYMON
	jr z, .otpartymon
	cp BOXMON
	jr z, .boxmon
	cp BREEDMON
	jr z, .breedmon
	; WILDMON

.partymon
	ld hl, wPartySpecies
	jr .done

.otpartymon
	ld hl, wOTPartySpecies
	jr .done

.boxmon
	ld a, BANK(sBoxSpecies)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call .done
	jp CloseSRAM

.breedmon
	ld a, [wBreedMon1Species]
	jr .done2

.done
	ld d, 0
	add hl, de
	ld a, [hl]

.done2
	ld [wCurPartySpecies], a
	ret

INCLUDE "data/types/names.asm"

PrintNature:
; Print nature b at hl.
	push hl
	ld hl, NatureNames
	jr _PrintNatureProperty

PrintNatureIndicators:
; Print indicators for nature b at hl.
	push hl
	ld hl, NatureIndicators
_PrintNatureProperty:
	ld a, b
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "data/natures.asm"

DrawPlayerHP: ; 50b0a
	ld a, $1
	ld [wWhichHPBar], a
	push hl
	push bc
	ld a, [wMonType]
	cp BOXMON
	jr z, .at_least_1_hp

	ld a, [wTempMonHP]
	ld b, a
	ld a, [wTempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .at_least_1_hp

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .fainted

.at_least_1_hp
	ld a, [wTempMonMaxHP]
	ld d, a
	ld a, [wTempMonMaxHP + 1]
	ld e, a
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon

	ld b, d
	ld c, e

.not_boxmon
	predef ComputeHPBarPixels
	ld a, 6
	ld d, a
	ld c, a

.fainted
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	farcall DrawBattleHPBar
	pop hl

; Print HP
	ld bc, $15 ; move (1,1)
	add hl, bc
	ld de, wTempMonHP
	ld a, [wMonType]
	cp BOXMON
	jr nz, .not_boxmon_2
	ld de, wTempMonMaxHP
.not_boxmon_2
	lb bc, 2, 3
	call PrintNum

	ld a, "/"
	ld [hli], a

; Print max HP
	ld de, wTempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret

PrintTempMonStats: ; 50b7b
; Print wTempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, MostStatNames
	call PlaceString
	pop hl
	pop bc

	push bc
	push hl
	push hl
	ld a, [wTempMonNature]
	ld b, a
	farcall GetNature
	pop hl
rept 8
	inc hl
endr
;	predef PrintNatureIndicators
	pop hl
	pop bc

	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, wTempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, wTempMonDefense
	call .PrintStat
	ld de, wTempMonSpclAtk
	call .PrintStat
	ld de, wTempMonSpclDef
	call .PrintStat
	ld de, wTempMonSpeed
	jp PrintNum

.PrintStat: ; 50bab
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

AllStatNames:
	db   "HEALTH<NL>"
MostStatNames:
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	next "@"

PrintStatDifferences: ; 50b7b
	ld a, [wTextBoxFlags]
	push af
	set NO_LINE_SPACING, a
	ld [wTextBoxFlags], a

	; Figure out length of largest modifier (+x, +xx or +xxx)
	ld hl, wStringBuffer3
	ld c, 6
	ld b, 1
.loop
	call .ComputeStatDifference
	inc hl
	inc hl
	ld a, [wStringBuffer3 + 12]
	and a
	ld a, [wStringBuffer3 + 13]
	ld d, 4
	jr nz, .got_digit_length
	cp 100
	jr nc, .got_digit_length
	dec d
	cp 10
	jr nc, .got_digit_length
	dec d
.got_digit_length
	ld a, b
	cp d
	jr nc, .digit_length_not_larger
	ld b, d
.digit_length_not_larger
	dec c
	jr nz, .loop

	ld a, b
	ld [wStringBuffer3 + 14], a
	ld de, wStringBuffer3
	ld b, 1 ; show stat+difference
	call .PrintStatDisplay
	ld de, wTempMonMaxHP
	ld b, 0 ; just show stat
	call .PrintStatDisplay
	pop af
	ld [wTextBoxFlags], a
	ret

.ComputeStatDifference:
	push de
	push bc
	ld a, [hli]
	cpl
	ld d, a
	ld a, [hld]
	cpl
	add 1
	jr nc, .dont_inc_b
	inc d
.dont_inc_b
	ld e, a
	ld bc, wTempMonMaxHP - wStringBuffer3
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hld]
	ld c, a
	push bc
	ld bc, wStringBuffer3 - wTempMonMaxHP
	add hl, bc
	pop bc
	push hl
	ld h, b
	ld l, c
	add hl, de
	ld a, h
	ld [wStringBuffer3 + 12], a
	ld a, l
	ld [wStringBuffer3 + 13], a
	pop hl
	pop bc
	pop de
	ret

.PrintStatDisplay:
	push de
	push bc
	call .PrintStatNames
	ld bc, 9
	add hl, bc
	pop bc
	pop de
	call .PrintStats
	jp WaitPressAorB_BlinkCursor

.PrintStatNames:
	ld a, [wStringBuffer3 + 14]
	push af
	hlcoord 6, 4
.coord_loop
	dec hl
	dec a
	jr nz, .coord_loop
	pop af
	push af
	ld b, 6
	ld c, 12
	add c
	ld c, a
	call TextBox
	pop af
	push af
	hlcoord 7, 5
.coord_loop2
	dec hl
	dec a
	jr nz, .coord_loop2
	pop af
	push hl
	ld de, AllStatNames
	call PlaceString
	pop hl
	ret

.PrintStats:
	; Some screen movement is done because internal stat order is different
	; from the order we want to display.
	; Printing: HP, Atk, Def, SAtk, SDef, Speed
	; Internal: HP, Atk, Def, Speed, SAtk, SDef
	call .PrintStat ; HP
	call .PrintStat ; Attack
	call .PrintStat ; Defense

	push bc
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	pop bc
	call .PrintStat ; Speed

	push bc
	ld bc, -SCREEN_WIDTH * 3
	add hl, bc
	pop bc
	call .PrintStat
.PrintStat:
	push bc
	push hl
	push de
	ld a, b
	lb bc, 2, 3
	push af
	call PrintNum
	pop af
	and a
	jr z, .mod_done
	pop hl
	call .ComputeStatDifference
	ld d, h
	ld e, l
	pop hl
	push hl
	inc hl
	inc hl
	inc hl
	ld a, "+"
	ld [hli], a

	ld b, 2
	ld a, [wStringBuffer3 + 14]
	ld c, a
	dec c
	push de
	ld de, wStringBuffer3 + 12
	call PrintNum
.mod_done
	pop de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc de
	inc de
	pop bc
	ret

GetShininess:
; Return the shininess of a given monster (wCurPartyMon/wCurOTMon/CurWildMon)
; based on wMonType.

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, wPartyMon1Shiny
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wMonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, wOTPartyMon1Shiny
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1Shiny
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Other
	ld hl, wTempMonShiny
	dec a
	jr z, .Shininess

; else: WildMon
	ld hl, wEnemyMonShiny
	jr .Shininess

; Get our place in the party/box.

.PartyMon:
.sBoxMon
	ld a, [wCurPartyMon]
	rst AddNTimes

.Shininess:

; sBoxMon data is read directly from SRAM.
	ld a, [wMonType]
	cp BOXMON
	ld a, 1
	call z, GetSRAMBank

; Shininess
	ld a, [hl]
	and SHINY_MASK
	ld b, a

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM

; Check the shininess value
	ld a, b
	and a
	ret

GetGender: ; 50bdd
; Return the gender of a given monster (wCurPartyMon/wCurOTMon/CurWildMon)
; based on wMonType.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; This is determined by checking the Personality gender value,
; which was already determined by the species' gender ratio.

; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, wPartyMon1Gender
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wMonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, wOTPartyMon1Gender
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1Gender
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Other (used for breeding, possibly elsewhere)
	ld hl, wTempMonGender
	dec a
	jr z, .Gender

; else: WildMon
	ld hl, wEnemyMonGender
	jr .Gender

; Get our place in the party/box.

.PartyMon:
.sBoxMon
	ld a, [wCurPartyMon]
	rst AddNTimes

.Gender:

; sBoxMon data is read directly from SRAM.
	ld a, [wMonType]
	cp BOXMON
	ld a, 1
	call z, GetSRAMBank

; Gender and form are stored in the same byte
	ld a, [hl]
	ld b, a

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM

; We need the gender ratio to do anything with this.
	ld a, [wCurPartySpecies]
	ld c, a
	push bc ; b == gender|form
	ld a, b
	and FORM_MASK
	ld b, a
	call GetGenderRatio ; c = gender ratio
	pop af ; a = gender|form
	and GENDER_MASK
	ld b, a

; Fixed values ignore the Personality gender value.
	ld a, c
	cp GENDERLESS
	jr z, .Genderless
	and a ; cp ALL_MALE
	jr z, .Male
	cp ALL_FEMALE
	jr z, .Female

; Otherwise, use the Personality gender value directly.
	ld a, b
	and a ; cp MALE
	jr z, .Male

.Female:
	xor a
	ret

.Male:
	ld a, 1
	and a
	ret

.Genderless:
	scf
	ret

ListMovePP: ; 50c50
	ld a, [wNumMoves]
	inc a
	ld c, a
	ld a, NUM_MOVES
	sub c
	ld b, a
	push hl
	ld a, [wBuffer1]
	ld e, a
	ld d, $0
	ld a, "<BOLDP>"
	call .load_loop
	ld a, b
	and a
	jr z, .skip
	ld c, a
	ld a, "-"
	call .load_loop

.skip
	pop hl
	inc hl
	inc hl
	inc hl
	ld d, h
	ld e, l
	ld hl, wTempMonMoves
	ld b, 0
.loop
	ld a, [hli]
	and a
	ret z
	push bc
	push hl
	push de
	ld hl, wMenuCursorY
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	ld a, [wMonType]
	push af
	ld a, BOXMON
	ld [wMonType], a
	farcall GetMaxPPOfMove
	pop af
	ld [wMonType], a
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, wTempMonPP - (wTempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [wStringBuffer1 + 4], a
	ld h, d
	ld l, e
	push hl
	ld de, wStringBuffer1 + 4
	lb bc, 1, 2
	call PrintNum
	ld a, "/"
	ld [hli], a
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
	pop hl
	ld a, [wBuffer1]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .loop
	ret

.load_loop ; 50cc9
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .load_loop
	ret

GetStatusConditionIndex:
; de points to status, e.g. from a party_struct or battle_struct
; return the status condition index in a
	push de
	inc de
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr z, .fnt
	ld a, [de]
	ld b, a
	and SLP
	ld a, 0
	jr nz, .slp
	xor a
	bit TOX, b
	jr nz, .tox
	bit PSN, b
	jr nz, .psn
	bit PAR, b
	jr nz, .par
	bit BRN, b
	jr nz, .brn
	bit FRZ, b
	jr nz, .frz
	jr .done
.tox
	inc a
.fnt
	inc a
.frz
	inc a
.brn
	inc a
.slp
	inc a
.par
	inc a
.psn
	inc a
.done
	ret

PlaceStatusString: ; 50d0a
	xor a
	call GetStatusConditionIndex
	and a
	ret z
	push de

	ld d, 0
	ld e, a
	push hl
	ld hl, StatusStringPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	pop hl

	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a

	pop de
	ld a, $1
	and a
	ret

StatusStringPointers:
	dw OKString
	dw PsnString
	dw ParString
	dw SlpString
	dw BrnString
	dw FrzString
	dw FntString
	dw ToxString

OKString:  db "OK @"
PsnString: db "Psn@"
ParString: db "Par@"
SlpString: db "Slp@"
BrnString: db "Brn@"
FrzString: db "Frz@"
FntString: db "Fnt@"
ToxString: db "Tox@"

ListMoves: ; 50d6f
; List moves at hl, spaced every [wBuffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jp z, .no_more_moves
	push de
	push hl
	push hl
	cp TACKLE_SCRATCH_POUND
	jr nz, .not_tackle
	farcall GetTackleName
	jp .cont
.not_tackle
	cp DEFENSE_CURL_HARDEN_WITHDRAW
	jr nz, .not_defense_curl
	farcall GetDefenseCurlName
	jp .cont
.not_defense_curl
	cp LEER_TAIL_WHIP
	jr nz, .not_leer
	farcall GetLeerName
	jp .cont
.not_leer
	cp BARRIER_IRON_DEFENSE_ACID_ARMOR
	jr nz, .not_barrier
	farcall GetBarrierName
	jp .cont
.not_barrier
	cp LOCK_ON_MIND_READER
	jr nz, .not_lock_on
	farcall GetLockOnName
	jp .cont
.not_lock_on
	cp SHARPEN_HOWL_MEDITATE
	jr nz, .not_sharpen
	farcall GetSharpenName
	jp .cont
.not_sharpen
	cp MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	jr nz, .not_fury_swipes
	farcall GetFurySwipesName
	jp .cont
.not_fury_swipes
	cp SYNTHESIS_MOONLIGHT_MORNING_SUN
	jr nz, .not_synthesis
	farcall GetSynthesisName
	jr .cont
.not_synthesis
	cp MEAN_LOOK_BLOCK_SPIDER_WEB
	jr nz, .not_mean_look
	farcall GetMeanLookName
	jr .cont
.not_mean_look
	cp CHARM_FEATHER_DANCE
	jr nz, .not_charm
	farcall GetCharmName
	jr .cont
.not_charm
	cp SCARY_FACE_COTTON_SPORE_STRING_SHOT
	jr nz, .not_scary_face
	farcall GetScaryFaceName
	jr .cont
.not_scary_face
	cp ROAR_WHIRLWIND
	jr nz, .not_roar
	farcall GetRoarName
	jr .cont
.not_roar
	cp SAND_ATTACK_SMOKESCREEN_FLASH
	jr nz, .not_sand_attack
	farcall GetSandAttackName
	jr .cont
.not_sand_attack
	cp SOFTBOILED_MILK_DRINK_RECOVER
	jr nz, .not_softboiled
	farcall GetSoftboiledName
	jr .cont
.not_softboiled
	cp FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	jr nz, .not_foresight
	farcall GetForesightName
	jr .cont
.not_foresight
	cp AGILITY_ROCK_POLISH
	jr nz, .not_agility
	farcall GetAgilityName
	jr .cont
.not_agility
	cp WORK_UP_GROWTH
	jr nz, .not_workup
	farcall GetWorkUpName
	jr .cont
.not_workup
	cp TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	jr nz, .not_transform
	farcall GetTransformName
	jr .cont
.not_transform
	cp SING_HYPNOSIS
	jr nz, .not_sing
	farcall GetSingName
	jr .cont
.not_sing
	ld [wCurSpecies], a
	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
.cont
	ld de, wStringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wNumMoves], a
	inc b
	pop hl
	push bc
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	ret z
	jp .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], "-"
	ld a, [wBuffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop
	ret

CalcLevel: ; 50e1b
	ld a, [wTempMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld d, 1
.next_level
	inc d
	ld a, d
	cp (MAX_LEVEL + 1) % $100
	jr z, .got_level
	call CalcExpAtLevel
	push hl
	ld hl, wTempMonExp + 2
	ldh a, [hProduct + 3]
	ld c, a
	ld a, [hld]
	sub c
	ldh a, [hProduct + 2]
	ld c, a
	ld a, [hld]
	sbc c
	ldh a, [hProduct + 1]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .next_level

.got_level
	dec d
	ret

CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, d
	cp 1
	jr nz, .UseExpFormula
; Pokémon have 0 experience at level 1
	xor a
	ldh [hProduct], a
	ldh [hProduct + 1], a
	ldh [hProduct + 2], a
	ldh [hProduct + 3], a
	ret
.UseExpFormula
	ld a, [wBaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
; Cube the level
	call .LevelSquared
	ld a, d
	ldh [hMultiplier], a
	call Multiply

; Multiply by a
	ld a, [hl]
	and $f0
	swap a
	ldh [hMultiplier], a
	call Multiply
; Divide by b
	ld a, [hli]
	and $f
	ldh [hDivisor], a
	ld b, 4
	call Divide
; Push the cubic term to the stack
	ldh a, [hQuotient + 0]
	push af
	ldh a, [hQuotient + 1]
	push af
	ldh a, [hQuotient + 2]
	push af
; Square the level and multiply by the lower 7 bits of c
	call .LevelSquared
	ld a, [hl]
	and $7f
	ldh [hMultiplier], a
	call Multiply
; Push the absolute value of the quadratic term to the stack
	ldh a, [hProduct + 1]
	push af
	ldh a, [hProduct + 2]
	push af
	ldh a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
; Multiply the level by d
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
; Subtract e
	ld b, [hl]
	ldh a, [hProduct + 3]
	sub b
	ldh [hMultiplicand + 2], a
	ld b, $0
	ldh a, [hProduct + 2]
	sbc b
	ldh [hMultiplicand + 1], a
	ldh a, [hProduct + 1]
	sbc b
	ldh [hMultiplicand], a
; If bit 7 of c is set, c is negative; otherwise, it's positive
	pop af
	and $80
	jr nz, .subtract
; Add c*n**2 to (d*n - e)
	pop bc
	ldh a, [hProduct + 3]
	add b
	ldh [hMultiplicand + 2], a
	pop bc
	ldh a, [hProduct + 2]
	adc b
	ldh [hMultiplicand + 1], a
	pop bc
	ldh a, [hProduct + 1]
	adc b
	ldh [hMultiplicand], a
	jr .done_quadratic

.subtract
; Subtract c*n**2 from (d*n - e)
	pop bc
	ldh a, [hProduct + 3]
	sub b
	ldh [hMultiplicand + 2], a
	pop bc
	ldh a, [hProduct + 2]
	sbc b
	ldh [hMultiplicand + 1], a
	pop bc
	ldh a, [hProduct + 1]
	sbc b
	ldh [hMultiplicand], a

.done_quadratic
; Add (a/b)*n**3 to (d*n - e +/- c*n**2)
	pop bc
	ldh a, [hProduct + 3]
	add b
	ldh [hMultiplicand + 2], a
	pop bc
	ldh a, [hProduct + 2]
	adc b
	ldh [hMultiplicand + 1], a
	pop bc
	ldh a, [hProduct + 1]
	adc b
	ldh [hMultiplicand], a
	ret

.LevelSquared: ; 50eed
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, d
	ldh [hMultiplicand + 2], a
	ldh [hMultiplier], a
	jp Multiply

INCLUDE "data/growth_rates.asm"

_SwitchPartyMons:
	ld a, [wSwitchMon]
	dec a
	ld [wBuffer3], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wBuffer2], a
	cp b
	ret z
	call .SwapMonAndMail
	ld a, [wBuffer3]
	call .ClearSprite
	ld a, [wBuffer2]
	; fallthrough

.ClearSprite: ; 50f34 (14:4f34)
	push af
	hlcoord 0, 1
	ld bc, 2 * SCREEN_WIDTH
	rst AddNTimes
	ld bc, 2 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop af
	ld hl, wSprites
	ld bc, $10
	rst AddNTimes
	ld de, $4
	ld c, $4
.gfx_loop
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .gfx_loop
	ld de, SFX_SWITCH_POKEMON
	jp WaitPlaySFX

.SwapMonAndMail: ; 50f62 (14:4f62)
	push hl
	push de
	push bc
	ld bc, wPartySpecies
	ld a, [wBuffer2]
	ld l, a
	ld h, $0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wBuffer3]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	ld a, [wBuffer2]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	push hl
	ld de, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ld a, [wBuffer3]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	pop de
	ld hl, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ld a, [wBuffer2]
	ld hl, wPartyMonOT
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld a, [wBuffer3]
	ld hl, wPartyMonOT
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, wPartyMonNicknames
	ld a, [wBuffer2]
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld hl, wPartyMonNicknames
	ld a, [wBuffer3]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, sPartyMail
	ld a, [wBuffer2]
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	push hl
	ld de, wd002
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	rst CopyBytes
	ld hl, sPartyMail
	ld a, [wBuffer3]
	ld bc, MAIL_STRUCT_LENGTH
	rst AddNTimes
	pop de
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	rst CopyBytes
	pop de
	ld hl, wd002
	ld bc, MAIL_STRUCT_LENGTH
	rst CopyBytes
	call CloseSRAM
	pop bc
	pop de
	pop hl
	ret

.CopyNameTowd002: ; 51036 (14:5036)
	ld de, wd002

.CopyName: ; 51039 (14:5039)
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret

INCLUDE "gfx/load_pics.asm"

InsertPokemonIntoBox: ; 51322
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call InsertSpeciesIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wBufferMonNick
	call InsertDataIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	ld de, wBufferMonOT
	call InsertDataIntoBoxOrParty
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld de, wBufferMon
	call InsertDataIntoBoxOrParty
	ld hl, wBufferMonMoves
	ld de, wTempMonMoves
	ld bc, NUM_MOVES
	rst CopyBytes
	ld hl, wBufferMonPP
	ld de, wTempMonPP
	ld bc, NUM_MOVES
	rst CopyBytes
	ld a, [wCurPartyMon]
	ld b, a
	farcall RestorePPofDepositedPokemon
	jp CloseSRAM

InsertPokemonIntoParty: ; 5138b
	ld hl, wPartyCount
	call InsertSpeciesIntoBoxOrParty
	ld a, [wPartyCount]
	dec a
	ld [wd265], a
	ld hl, wPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wBufferMonNick
	call InsertDataIntoBoxOrParty
	ld a, [wPartyCount]
	dec a
	ld [wd265], a
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld de, wBufferMonOT
	call InsertDataIntoBoxOrParty
	ld a, [wPartyCount]
	dec a
	ld [wd265], a
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wBufferMon
	jp InsertDataIntoBoxOrParty

InsertSpeciesIntoBoxOrParty: ; 513cb
	inc [hl]
	inc hl
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartySpecies]
	ld c, a
.loop
	ld a, [hl]
	ld [hl], c
	inc hl
	inc c
	ld c, a
	jr nz, .loop
	ret

InsertDataIntoBoxOrParty: ; 513e0
	push de
	push hl
	push bc
	ld a, [wd265]
	dec a
	rst AddNTimes
	push hl
	add hl, bc
	ld d, h
	ld e, l
	pop hl
.loop
	push bc
	ld a, [wd265]
	ld b, a
	ld a, [wCurPartyMon]
	cp b
	pop bc
	jr z, .insert
	push hl
	push de
	push bc
	rst CopyBytes
	pop bc
	pop de
	pop hl
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	pop de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr .loop

.insert
	pop bc
	pop hl
	ld a, [wCurPartyMon]
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl
	rst CopyBytes
	ret

INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/variant_forms.asm"

SECTION "Code 14", ROMX

INCLUDE "engine/battle/abilities.asm"
INCLUDE "data/trainers/final_text.asm"
INCLUDE "engine/player_movement.asm"
INCLUDE "engine/engine_flags.asm"
INCLUDE "engine/variables.asm"
INCLUDE "data/text/battle.asm"


SECTION "Code 15", ROMX

INCLUDE "gfx/battle_anims.asm"


SECTION "Code 16", ROMX

INCLUDE "engine/player_gfx.asm"
INCLUDE "engine/events/kurt.asm"
INCLUDE "engine/events/unown.asm"
INCLUDE "engine/events/buena.asm"
INCLUDE "engine/events/movesets.asm"
INCLUDE "engine/events/battle_tower/battle_tower.asm"
INCLUDE "engine/events/battle_tower/trainer_text.asm"
INCLUDE "engine/events/item_maniacs.asm"


SECTION "Code 17", ROMX

INCLUDE "engine/timeofdaypals.asm"
INCLUDE "engine/battle_start.asm"
INCLUDE "engine/sprites.asm"
INCLUDE "engine/mon_icons.asm"
INCLUDE "engine/events/field_moves.asm"
INCLUDE "engine/events/magnet_train.asm"
INCLUDE "data/pokemon/menu_icon_pointers.asm"
INCLUDE "data/pokemon/variant_menu_icon_pointers.asm"
INCLUDE "data/pokemon/menu_icons.asm"


SECTION "Code 18", ROMX

INCLUDE "engine/phone.asm"
INCLUDE "engine/timeset.asm"
INCLUDE "engine/pokegear.asm"
INCLUDE "engine/events/fish.asm"


SECTION "Code 19", ROMX

INCLUDE "engine/events_2.asm"
;INCLUDE "engine/radio.asm"
INCLUDE "gfx/mail.asm"
INCLUDE "engine/slot_machine.asm"


SECTION "Code 20", ROMX

INCLUDE "engine/events/std_scripts.asm"
INCLUDE "engine/phone_scripts.asm"
INCLUDE "engine/card_flip.asm"


SECTION "Code 21", ROMX

INCLUDE "engine/battle_anims/bg_effects.asm"


SECTION "Code 22", ROMX


INCLUDE "engine/unown_puzzle.asm"
;INCLUDE "engine/dummy_game.asm"
INCLUDE "engine/billspc.asm"
INCLUDE "engine/fade.asm"


SECTION "Code 23", ROMX

INCLUDE "engine/battle/hidden_power.asm"
INCLUDE "engine/battle/misc.asm"
INCLUDE "engine/unowndex.asm"
Special_CheckMagikarpLength:
Special_MagikarpHouseSign:
	ret
;INCLUDE "engine/events/magikarp.asm"
INCLUDE "engine/events/name_rater.asm"
INCLUDE "audio/distorted_cries.asm"
INCLUDE "engine/events/npc_trade.asm"


SECTION "Code 24", ROMX

INCLUDE "engine/tileset_anims.asm"
;INCLUDE "engine/events/wonder_trade.asm"
WonderTrade::
ret


SECTION "Code 25", ROMX

INCLUDE "engine/misc_gfx.asm"
INCLUDE "engine/warp_connection.asm"
INCLUDE "engine/battle/used_move_text.asm"
INCLUDE "gfx/items.asm"

SECTION "Load Map Part", ROMX
; linked, do not separate
INCLUDE "engine/player_step.asm"
INCLUDE "engine/load_map_part.asm"
; end linked section

SECTION "Code 26", ROMX

INCLUDE "engine/events/halloffame.asm"
INCLUDE "engine/copy_tilemap_at_once.asm"

PrintAbility:
; Print ability b at hl.
	ld l, b
	ld h, 0
	ld bc, AbilityNames
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 3, 13
	jp PlaceString

BufferAbility:
; Buffer name for b into wStringBuffer1
	ld l, b
	ld h, 0
	ld bc, AbilityNames
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	ret z
	jr .loop

PrintAbilityDescription:
; Print ability description for b
; we can't use PlaceString, because it would linebreak with an empty line inbetween
	ld l, b
	ld h, 0
	ld bc, AbilityDescriptions
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 15
	jp PlaceString

INCLUDE "data/abilities.asm"


SECTION "Introduction", ROMX

INCLUDE "engine/options_menu.asm"
INCLUDE "engine/crystal_intro.asm"

CopyrightGFX:: ; e4000
INCBIN "gfx/splash/copyright.2bpp"


SECTION "Move Animation Framesets", ROMX

INCLUDE "engine/battle_anims/framesets.asm"

SECTION "Title Screen", ROMX

INCLUDE "engine/title.asm"


SECTION "Diploma", ROMX

INCLUDE "engine/diploma.asm"


SECTION "Collision Permissions", ROMX

INCLUDE "data/collision_permissions.asm"


SECTION "Typefaces", ROMX

INCLUDE "gfx/font.asm"

SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"


SECTION "Effect Commands", ROMX

INCLUDE "engine/battle/effect_commands.asm"


SECTION "Move Animation Pointers", ROMX

INCLUDE "data/moves/animation_pointers.asm"


SECTION "Move Animations 1", ROMX

INCLUDE "data/moves/animations.asm"


SECTION "Move Animations 2", ROMX

INCLUDE "data/moves/animations_2.asm"


SECTION "Battle Animations", ROMX

INCLUDE "engine/battle_anims/anim_commands.asm"
INCLUDE "engine/battle_anims/core.asm"
INCLUDE "data/battle_anims/objects.asm"
INCLUDE "engine/growl_roar_ded_vblank_hook.asm"
INCLUDE "engine/battle_anims/helpers.asm"
INCLUDE "data/battle_anims/oam.asm"
INCLUDE "data/battle_anims/object_gfx.asm"


SECTION "Ball Colors", ROMX

INCLUDE "data/battle_anims/ball_colors.asm"


SECTION "Battle Functions", ROMX

INCLUDE "engine/battle_anims/functions.asm"


SECTION "Battle Graphics", ROMX

SubstituteFrontpic: INCBIN "gfx/battle/substitute-front.2bpp.lz"
SubstituteBackpic:  INCBIN "gfx/battle/substitute-back.2bpp.lz"

GhostFrontpic:      INCBIN "gfx/battle/ghost.2bpp.lz"


SECTION "Moves", ROMX

INCLUDE "data/moves/moves.asm"


SECTION "Enemy Trainers", ROMX

INCLUDE "engine/battle/ai/items.asm"

AIScoring: ; 38591
INCLUDE "engine/battle/ai/scoring.asm"

GetTrainerClassName: ; 3952d
	ld a, c
	ld [wCurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, wStringBuffer1
	ret

GetOTName: ; 39550
	ld hl, wOTPlayerName
	ld a, [wLinkMode]
	and a
	jr nz, .ok

	ld a, c
	ld [wCurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld hl, wStringBuffer1

.ok
	ld bc, TRAINER_CLASS_NAME_LENGTH
	ld de, wOTClassName
	push de
	rst CopyBytes
	pop de
	ret

GetTrainerAttributes: ; 3957b
	ld a, [wTrainerClass]
	ld c, a
	call GetOTName
	ld a, [wTrainerClass]
	dec a
	ld hl, TrainerClassAttributes + TRNATTR_ITEM1
	ld bc, NUM_TRAINER_ATTRIBUTES
	rst AddNTimes
	ld de, wEnemyTrainerItem1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	ld [wEnemyTrainerBaseReward], a
	ret

ComputeTrainerReward: ; 3991b (e:591b)
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a
	ld a, [wCurPartyLevel]
	ld [hl], a
	call Multiply
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

INCLUDE "data/trainers/attributes.asm"


SECTION "Enemy Trainer Pointers", ROMX

INCLUDE "engine/read_party.asm"
INCLUDE "data/trainers/party_pointers.asm"
INCLUDE "data/trainers/parties.asm"


SECTION "Wild Data", ROMX

INCLUDE "engine/wildmons.asm"


SECTION "Pokedex", ROMX

INCLUDE "engine/pokedex.asm"


SECTION "Evolution", ROMX

INCLUDE "engine/evolve.asm"


SECTION "Pic Animations", ROMX

INCLUDE "engine/pic_animation.asm"

; Pic animations are assembled in 3 parts:

; Top-level animations:
; 	frame #, duration: Frame 0 is the original pic (no change)
;	setrepeat #:       Sets the number of times to repeat
; 	dorepeat #:        Repeats from command # (starting from 0)
; 	end

; Bitmasks:
;	Layered over the pic to designate affected tiles

; Frame definitions:
;	first byte is the bitmask used for this frame
;	following bytes are tile ids mapped to each bit in the mask

; Main animations (played everywhere)
INCLUDE "gfx/pokemon/anim_pointers.asm"
INCLUDE "gfx/pokemon/anims.asm"

; Extra animations, appended to the main animation
; Used in the status screen (blinking, tail wags etc.)
INCLUDE "gfx/pokemon/extra_pointers.asm"
INCLUDE "gfx/pokemon/extras.asm"

; Variants have their own animation data despite having entries in the main tables
INCLUDE "gfx/pokemon/variant_anim_pointers.asm"
INCLUDE "gfx/pokemon/variant_anims.asm"
INCLUDE "gfx/pokemon/variant_extra_pointers.asm"
INCLUDE "gfx/pokemon/variant_extras.asm"


SECTION "Pic Animations Frames 1", ROMX

INCLUDE "gfx/pokemon/frame_pointers.asm"
INCLUDE "gfx/pokemon/frames.asm"


SECTION "Pic Animations Frames 2", ROMX

INCLUDE "gfx/pokemon/variant_frame_pointers.asm"
INCLUDE "gfx/pokemon/variant_frames.asm"


SECTION "Pic Animations Bitmasks", ROMX

; Bitmasks
INCLUDE "gfx/pokemon/bitmask_pointers.asm"
INCLUDE "gfx/pokemon/bitmasks.asm"
INCLUDE "gfx/pokemon/variant_bitmask_pointers.asm"
INCLUDE "gfx/pokemon/variant_bitmasks.asm"


SECTION "Standard Text", ROMX

INCLUDE "data/text/std_text.asm"


SECTION "Phone Scripts", ROMX

INCLUDE "engine/more_phone_scripts.asm"
INCLUDE "engine/buena_phone_scripts.asm"


SECTION "Phone Text 1", ROMX

INCLUDE "data/phone/text/anthony_overworld.asm"
INCLUDE "data/phone/text/todd_overworld.asm"
INCLUDE "data/phone/text/gina_overworld.asm"
INCLUDE "data/phone/text/irwin_overworld.asm"
INCLUDE "data/phone/text/arnie_overworld.asm"
INCLUDE "data/phone/text/alan_overworld.asm"
INCLUDE "data/phone/text/dana_overworld.asm"
INCLUDE "data/phone/text/chad_overworld.asm"
INCLUDE "data/phone/text/derek_overworld.asm"
INCLUDE "data/phone/text/tully_overworld.asm"
INCLUDE "data/phone/text/brent_overworld.asm"
INCLUDE "data/phone/text/tiffany_overworld.asm"
INCLUDE "data/phone/text/vance_overworld.asm"
INCLUDE "data/phone/text/wilton_overworld.asm"
INCLUDE "data/phone/text/kenji_overworld.asm"
INCLUDE "data/phone/text/parry_overworld.asm"
INCLUDE "data/phone/text/erin_overworld.asm"


SECTION "Phone Text 2", ROMX

INCLUDE "data/phone/text/jack_overworld.asm"
INCLUDE "data/phone/text/beverly_overworld.asm"
INCLUDE "data/phone/text/huey_overworld.asm"
INCLUDE "data/phone/text/gaven_overworld.asm"
INCLUDE "data/phone/text/beth_overworld.asm"
INCLUDE "data/phone/text/jose_overworld.asm"
INCLUDE "data/phone/text/reena_overworld.asm"
INCLUDE "data/phone/text/joey_overworld.asm"
INCLUDE "data/phone/text/wade_overworld.asm"
INCLUDE "data/phone/text/ralph_overworld.asm"


SECTION "Phone Text 3", ROMX

INCLUDE "data/phone/text/mom.asm"
INCLUDE "data/phone/text/bill.asm"
INCLUDE "data/phone/text/spruce.asm"
INCLUDE "data/phone/text/trainers1.asm"
INCLUDE "data/phone/text/liz_overworld.asm"


SECTION "Phone Text 4", ROMX

INCLUDE "data/phone/text/extra.asm"
INCLUDE "data/phone/text/lyra.asm"


SECTION "Phone Text 5", ROMX

INCLUDE "data/phone/text/extra2.asm"


SECTION "Item Text", ROMX

INCLUDE "data/items/names.asm"

PrintItemDescription: ; 0x1c8955
; Print the description for item [wCurSpecies] at de.

	ld hl, ItemDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString
; 0x1c8987

PrintTMHMDescription:
; Print the description for TM/HM [wCurSpecies] at de.

	ld a, [wCurSpecies]
	inc a
	ld [wCurTMHM], a
	ld [wCurTMHMBuffer], a
	push de
	predef GetTMHMMove
	pop hl
	ld a, [wd265]
	ld [wCurSpecies], a
	predef PrintMoveDesc
	ret
	
PrintClothesDescription:
; Print the description for Clothes [wCurSpecies] at de.

	ld hl, ClothesDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString
	
PrintMonDescription: ; 0x1c8955
; Print the description for item [wCurSpecies] at de.

	ld hl, BuyMonDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString
	
PrintDecoDescription: ; 0x1c8955
; Print the description for item [wCurSpecies] at de.

	ld hl, DecoDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString

MoveReminderNoMovesText:
	text "Sorry… There isn't"
	line "any move I can"

	para "make that #mon"
	line "remember."
	done
	
INCLUDE "data/items/descriptions.asm"
INCLUDE "data/items/clothes_names.asm"
INCLUDE "data/pokemon/buy_mon_descriptions.asm"
INCLUDE "data/decorations/buydeconames.asm"


SECTION "Move and Landmark Text", ROMX

INCLUDE "data/moves/names.asm"

INCLUDE "engine/landmarks.asm"


SECTION "Battle Tower Text", ROMX

INCLUDE "data/battle_tower/trainer_text.asm"


SECTION "Crystal Data", ROMX

INCLUDE "engine/events/battle_tower/load_trainer.asm"
INCLUDE "data/events/odd_eggs.asm"
INCLUDE "engine/sgb_border.asm"


SECTION "Coral Data 1", ROMX

CoralDevScreenGFX:: ; e4000
INCBIN "gfx/intro/splash/coraldev.2bpp"

BusterGFX::
INCBIN "gfx/intro/splash/buster.2bpp"

DisclaimerScreenGFX:: ; e4000
INCBIN "gfx/intro/splash/disclaimer.2bpp"

DisclaimerScreenGFX2:: ; e4000
INCBIN "gfx/intro/splash/disclaimer2.2bpp"

OriginalGameByGFX:: ; e4000
INCBIN "gfx/splash/originalgameby.2bpp"

INCLUDE "engine/battle/multi_move_slots.asm"

INCLUDE "engine/battle/effect_commands/curse.asm"

INCLUDE "engine/battle/effect_commands/cottonguard.asm"

INCLUDE "engine/battle/effect_commands/shellsmash.asm"

INCLUDE "engine/battle/effect_commands/quiverdance.asm"

INCLUDE "engine/battle/effect_commands/mimic.asm"


SECTION "Coral Data 2", ROMX

INCLUDE "engine/titlescreen_cutscene.asm"
INCLUDE "engine/trainer_card.asm"
INCLUDE "data/pokemon/names.asm"


SECTION "Coral Data 3", ROMX

INCLUDE "engine/events/mom.asm"
INCLUDE "engine/money.asm"
INCLUDE "engine/events/daycare.asm"
INCLUDE "engine/breeding.asm"
INCLUDE "data/items/attributes.asm"
INCLUDE "engine/events/happiness_egg.asm"

INCLUDE "engine/learn.asm"

DrawBattleHPBar:: ; 3750
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels

	push hl
	push de
	push bc

; Place 'HP:'
	ld a, "<HP1>"
	ld [hli], a
	inc a ; ld a, "<HP2>"
	ld [hli], a

; Draw a template
	push hl
	inc a ; ld a, "<NOHP>" ; empty bar
.template
	ld [hli], a
	dec d
	jr nz, .template
	ld a, "<HPEND>" ; bar end cap
	ld [hl], a
	pop hl

; Safety check # pixels
	ld a, e
	and a
	jr nz, .fill
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
; Keep drawing tiles until pixel length is reached
	ld a, e
	sub TILE_WIDTH
	jr c, .lastbar

	ld e, a
	ld a, "<FULLHP>"
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.lastbar
	ld a, "<NOHP>"
	add e
	ld [hl], a

.done
	pop bc
	pop de
	pop hl
	ret
; 3786

FacingPlayerDistance_bc:: ; 36a5
	push de
	call FacingPlayerDistance
	ld b, d
	ld c, e
	pop de
	ret
; 36ad

FacingPlayerDistance:: ; 36ad
; Return carry if the sprite at bc is facing the player,
; and its distance in d.

	ld hl, OBJECT_NEXT_MAP_X ; x
	add hl, bc
	ld d, [hl]

	ld hl, OBJECT_NEXT_MAP_Y ; y
	add hl, bc
	ld e, [hl]

	ld a, [wPlayerStandingMapX]
	cp d
	jr z, .CheckY

	ld a, [wPlayerStandingMapY]
	cp e
	jr z, .CheckX

	and a
	ret

.CheckY:
	ld a, [wPlayerStandingMapY]
	sub e
	jr z, .NotFacing
	jr nc, .Above

; Below
	cpl
	inc a
	ld d, a
	ld e, OW_UP
	jr .CheckFacing

.Above:
	ld d, a
	ld e, OW_DOWN
	jr .CheckFacing

.CheckX:
	ld a, [wPlayerStandingMapX]
	sub d
	jr z, .NotFacing
	jr nc, .Left

; Right
	cpl
	inc a
	ld d, a
	ld e, OW_LEFT
	jr .CheckFacing

.Left:
	ld d, a
	ld e, OW_RIGHT

.CheckFacing:
	call GetSpriteDirection
	cp e
	jr nz, .NotFacing
	scf
	ret

.NotFacing:
	and a
	ret
; 36f5

GetTMHMName:: ; 3487
; Get TM/HM name by item id wNamedObjectIndexBuffer.

	push hl
	push de
	push bc
	ld a, [wNamedObjectIndexBuffer]
	push af

; TM/HM prefix
	cp HM01
	push af
	jr c, .TM

	ld hl, .HMText
	ld bc, .HMTextEnd - .HMText
	jr .asm_34a1

.TM:
	ld a, [wNamedObjectTypeBuffer]
	cp TAPE_NAME
	jr z, .tape
	
	ld hl, .TMText
	ld bc, .TMTextEnd - .TMText
	jr .asm_34a1
	
.tape:
	ld hl, .TapeText
	ld bc, .TapeTextEnd - .TapeText

.asm_34a1
	ld de, wStringBuffer1
	rst CopyBytes
	ld a, [wNamedObjectTypeBuffer]
	cp TAPE_NAME
	jr nz, .not_tape
	pop af
	jr .tape2

.not_tape
; TM/HM number
	ld a, [wNamedObjectIndexBuffer]
	ld c, a

; HM numbers start from 51, not 1
	pop af
	ld a, c
	jr c, .asm_34b9
	sub NUM_TMS
.asm_34b9
	inc a
.tape2
; Divide and mod by 10 to get the top and bottom digits respectively
	ld b, "0"
.mod10
	sub 10
	jr c, .asm_34c2
	inc b
	jr .mod10
.asm_34c2
	add 10

	push af
	ld a, b
	ld [de], a
	inc de
	pop af

	ld b, "0"
	add b
	ld [de], a

; End the string
	inc de
	ld a, "@"
	ld [de], a

	pop af
	ld [wNamedObjectIndexBuffer], a
	pop bc
	pop de
	pop hl
	ld de, wStringBuffer1
	ret

.TMText:
	db "TM"
.TMTextEnd:
	db "@"

.HMText:
	db "HM"
.HMTextEnd:
	db "@"
	
.TapeText:
	db "AUDIO CASSETTE "
.TapeTextEnd:
	db "@"
; 34df

SECTION "Coral Data 5", ROMX
INCLUDE "engine/battle/porygon_encounter.asm"
INCLUDE "engine/player_object.asm"
INCLUDE "engine/battle/generate_wild_form.asm"
INCLUDE "engine/events/skatepark_score.asm"
INCLUDE "engine/mart_clerks.asm"

CheckUniqueWildMove:
	ld a, [wBattleType]
	cp BATTLETYPE_LEGENDARY
	jp z, .boss
	cp BATTLETYPE_SHINY_LEGENDARY
	jp z, .boss
	cp BATTLETYPE_PORYGON
	jp z, .boss
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld c, a
	ld hl, UniqueWildMoves
.loop
	ld a, [hli] ; landmark
	cp -1
	ret z
	cp c
	jr nz, .inc2andloop
	ld a, [hli] ; species
	ld b, a
	ld a, [wCurPartySpecies]
	cp b
	jr nz, .inc1andloop
	ld a, [hli] ; move
	ld b, a
	cp FLY
	jr z, .TeachMove
	cp SAND_ATTACK_SMOKESCREEN_FLASH
	jr z, .TeachMove
.ChanceToTeach
	call Random
	cp 50 percent + 1
	ret nc
.TeachMove
	ld hl, wEnemyMonMoves + 1 ; second move
	ld a, b
	ld [hl], a
	ret

.inc2andloop
	inc hl
.inc1andloop
	inc hl
	jr .loop
	
.boss
	ld a, [wTempEnemyMonSpecies]
	ld c, a
	ld hl, BossWildMoves
.loop2
	ld a, [hli] ; species
	cp -1
	ret z
	cp c
	jr nz, .inc4andloop2
	ld a, [hli] ; move
	ld b, a
	push hl
	ld hl, wEnemyMonMoves ; first move
	ld a, b
	ld [hl], a
	
	pop hl
	ld a, [hli] ; move
	ld b, a
	push hl
	ld hl, wEnemyMonMoves + 1; first move
	ld a, b
	ld [hl], a
	
	pop hl
	ld a, [hli] ; move
	ld b, a
	push hl
	ld hl, wEnemyMonMoves + 2; first move
	ld a, b
	ld [hl], a
	
	pop hl
	ld a, [hli] ; move
	ld b, a
	ld hl, wEnemyMonMoves + 3; first move
	ld a, b
	ld [hl], a
	ret

.inc4andloop2
	inc hl
	inc hl
	inc hl
.inc1andloop2
	inc hl
	jr .loop2

INCLUDE "data/pokemon/unique_wild_moves.asm"
INCLUDE "data/pokemon/boss_wild_moves.asm"

MovementLeaf::
	ld hl, wDailyFlags2
	bit 7, [hl] ; ENGINE_WINDY_DAY
	jr z, .leaf_reset
	ld a, [wPlayerSpriteX]
	add 100
	ld e, a
	ld a, [wObject1SpriteX]
	cp e
	jr z, .leaf_reset
	ld a, [wPlayerStandingMapX]
	ld [wObject1StandingMapX], a
	xor a
	ld [wObject1Flags + 1], a
	
	ld a, [wRanchRaceSeconds]
	inc a
	ld [wRanchRaceSeconds], a
	
	ld a, [wObject1SpriteX]
	add 3
	ld [wObject1SpriteX], a
	
	ld a, [wObject1SpriteY]
	push af
	ld a, [wRanchRaceFrames]
	cp 0
	jr z, .leaf_downward
;.leaf_upward
	call Random
	cp 1 + (20 percent)
	jr c, .leaf_sub
	jr .leaf_stay
.leaf_downward
	call Random
	cp 1 + (20 percent)
	jr c, .leaf_add
.leaf_stay
	pop af
	ld [wObject1SpriteY], a
	ret
.leaf_add
	pop af
	add 1
	ld [wObject1SpriteY], a
	ret
.leaf_sub
	pop af
	sub 1
	ld [wObject1SpriteY], a
	ret
	
	
.leaf_reset
	call Random
	cp 1 + (25 percent)
	ret c
	call Random
	cp 1 + (50 percent)
	jr c, .set_leaf_downward
;.set_leaf_upward
	ld a, 1
	ld [wRanchRaceFrames], a
	jr .leaf_reset_cont
.set_leaf_downward
	xor a
	ld [wRanchRaceFrames], a
.leaf_reset_cont
	xor a
	ld [wRanchRaceSeconds], a
	ld a, [wPlayerSpriteX]
	sub 100
	ld [wObject1SpriteX], a
	ld a, 70
	call RandomRange
	ld e, a
	ld a, [wPlayerSpriteY]
	push af
	call Random
	cp 1 + (50 percent)
	jr c, .leaf_reset_add
	pop af
	sub e
	jr .leaf_reset_cont2
.leaf_reset_add
	pop af
	add e
.leaf_reset_cont2
	ld [wObject1SpriteY], a
	ld a, [wPlayerStandingMapX]
	ld [wObject1StandingMapX], a
	ld [wObject1LastMapX], a
	ld a, [wPlayerStandingMapY]
	ld [wObject1StandingMapY], a
	ld [wObject1LastMapY], a
	ret

ProfSpruceSpeech: ; 0x5f99
	ld de, OriginalGameByGFX
	ld hl, VTiles0
	lb bc, BANK(OriginalGameByGFX), $0c
	call Request2bpp

	ld de, MUSIC_ROUTE_2
	call PlayMusic

	
	call SetWhitePals
	ld c, 31
	call FadePalettes
	
	xor a
	ld [wCurPartySpecies], a
	ld a, PROF_SPRUCE
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic
	call ApplyTilemap

	ld c, 60
	call DelayFrames
	
	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes

	ld hl, SpruceText1
	call PrintText
	ld c, 15
	call FadeToWhite
	call ClearTileMap

	ld a, MUNCHLAX
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a
	ld [wTempMonDVs + 2], a

	call ApplyTilemap
	
	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes

	ld hl, SpruceText2
	call PrintText
	ld hl, SpruceText4
	call PrintText
	ld c, 15
	call FadeToWhite
	call ClearTileMap

	xor a
	ld [wCurPartySpecies], a
	ld a, PROF_SPRUCE
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic
	call ApplyTilemap

	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes

	ld hl, SpruceText5
	call PrintText
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	
	call DelayFrame
	hlbgcoord 0, 0
	ld bc, BG_MAP_HEIGHT * BG_MAP_WIDTH
	ld a, " "
	call ByteFill
	call RefreshScreen

.ChooseGender:
	ld b, CGB_INTRO_PLAYER_PALS
	call GetCGBLayout
	
	ld hl, PlayerIntroPaletteWhite
	ld de, wUnknBGPals palette 1
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld hl, PlayerIntroPaletteWhite
	ld de, wUnknBGPals palette 2
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	
	ld c, 30
	call FadePalettes
	ld hl, SpruceTextB
	call PrintText
	
	xor a
	ld [wCurPartySpecies], a
	call FinishPrepIntroPicBoy
	call FinishPrepIntroPicGirl
	call DelayFrame
	
	ld hl, PlayerIntroPaletteGray
	ld de, wUnknBGPals palette 1
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld hl, PlayerIntroPaletteGray
	ld de, wUnknBGPals palette 2
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 60
	call FadePalettes
	
.genderloop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .got_gender
	call ChooseGender_HandleJoypad
	call ChooseGender_UpdateCursorOAM
	call DelayFrame
	jr .genderloop
	
;	ld hl, .MenuDataHeader
;	call LoadMenuDataHeader
;	call ApplyAttrAndTilemapInVBlank
;	call VerticalMenu
;	call CloseWindow
;	ld a, [wMenuCursorY]
;	dec a
.got_gender
	call ClearSprites
	ld de, SFX_READ_TEXT
	call PlaySFX

	ld a, [wPlaceBallsY]
	ld [wPlayerGender], a
	cp 0
	jr nz, .girl
	call Intro_PlayerFadeGirl
	ld hl, SpruceTextF
	call PrintText
	call Intro_PlayerFadeBoy
	jr .gender_done
.girl
	call Intro_PlayerFadeBoy
	ld hl, SpruceTextF
	call PrintText
	call Intro_PlayerFadeGirl
.gender_done
	call ClearTileMap

	ld b, CGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank

	ld hl, SpruceTextC
	call PrintText
	call ClearTileMap
	ld hl, .MenuDataHeaderPal
	call LoadMenuDataHeader
	call ApplyAttrAndTilemapInVBlank
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	sub $1
	ld [wPlayerPalette], a
	ld [wPlayerInitialPalette], a
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	
	call Load1bppFont
	call Load1bppFrame

	ld c, 15
	call DelayFrames
	
	ld b, CGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	
	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic
	
	ld c, 60
	call FadePalettes
	
	ld hl, SpruceTextD
	call PrintText
	call YesNoBox
	jr c, .cancel
	jp .ContinueOpening
	
.MenuDataHeader: ; 0x48dfc
	db $40 ; flags
	db 06, 06 ; start coords
	db 11, 12 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x48e04

.MenuData2: ; 0x48e04
	db $a1 ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"
		
.MenuDataHeaderPal: ; 0x48dfc
	db $40 ; flags
	db 00, 05 ; start coords
	db 16, 15 ; end coords
	dw .MenuData2Pal
	db 1 ; default option
; 0x48e04

.MenuData2Pal: ; 0x48e04
	db $a1 ; flags
	db 7 ; items
	db "Red@"
	db "Blue@"
	db "Green@"
	db "Brown@"
	db "Purple@"
	db "Teal@"
	db "Pink@"
	
.cancel 
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	farcall LoadNamingScreenGFX
	jp .ChooseGender

.ContinueOpening
	ld hl, SpruceText6
	call PrintText
	call NamePlayer
	ld a, [wPlayerGender]
	cp PIPPI
	jr nz, .notpippi2
	
	ld c, 15
	call FadeToWhite
	call ClearTileMap	
	farcall _PippiScreen
	
	ld de, MUSIC_ROUTE_2 ; remove after demo
	call PlayMusic ; remove after demo
	jp .cancel ; remove after demo
	
;	jr .endpippiscreen ;uncomment after demo
.notpippi2
	ld c, 15
	call FadeToWhite
	call ClearTileMap

	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, CGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes
	
	ld hl, SpruceText8
	call PrintText
.endpippiscreen
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	farcall LoadNamingScreenGFX

	xor a
	ld [wCurPartySpecies], a
	ld a, RIVAL
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic
	call ApplyTilemap
	
	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes
	
	ld hl, SpruceText9
	call PrintText
	call NameRival
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	
	xor a
	ld [wCurPartySpecies], a
	ld a, RIVAL
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic
	call ApplyTilemap
	
	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes
	
	ld hl, SpruceText7
	call PrintText
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	
	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, CGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes
	
	ld hl, SpruceTextA
	call PrintText
	
	ld a, [wPlayerGender]
	cp PIPPI
	ret nz
	ld a, 7
	ld [wPlayerPalette], a
	ld [wPlayerInitialPalette], a
	ret
InitializeWorld:: ; 5d23
	call Random
	cp 50 percent
	jr c, .set_windy
	jr .skip
.set_windy
	ld hl, wDailyFlags2
	set 7, [hl] ; ENGINE_WINDY_DAY
.skip
	call ShrinkPlayer
	farcall SpawnPlayer
	farjp _InitializeStartDay
	
Intro_PlayerFadeBoy:
	ld hl, PlayerIntroPaletteWhite
	ld de, wUnknBGPals palette 1
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 30
	jp FadePalettes
	
Intro_PlayerFadeGirl:
	ld hl, PlayerIntroPaletteWhite
	ld de, wUnknBGPals palette 2
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 30
	jp FadePalettes
	
ChooseGender_HandleJoypad: ; e089c
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jp nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jp nz, .d_right
	ret
.d_left
	ld a, [wPlaceBallsY]
	cp 0
	ret z
	dec a
	ld [wPlaceBallsY], a
	ld de, SFX_READ_TEXT
	call PlaySFX
	ret
.d_right
	ld a, [wPlaceBallsY]
	cp 1
	ret z
	inc a
	ld [wPlaceBallsY], a
	ld de, SFX_READ_TEXT
	call PlaySFX
	ret
	
ChooseGender_UpdateCursorOAM:
	ld a, [wPlaceBallsY]
	cp 0
	jr z, .one
.two
	ld hl, ChooseGender_OAM02
	ld de, wSprites
	ld bc, 9
	jp CopyBytes
.one
	ld hl, ChooseGender_OAM01
	ld de, wSprites
	ld bc, 9
	jp CopyBytes
	
ChooseGender_OAM01:
;y pos, x pos, tile, palette
	dsprite  4,  4, 6,  0, $09, $0 | PRIORITY
	dsprite  4,  4, 7,  0, $0a, $0 | PRIORITY
	
ChooseGender_OAM02:
;y pos, x pos, tile, palette
	dsprite  4,  4, 15,  0, $09, $0 | PRIORITY
	dsprite  4,  4, 16,  0, $0a, $0 | PRIORITY
	
PlayerIntroPaletteWhite:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

PlayerIntroPaletteGray:
	RGB 31, 31, 31
	RGB 24, 24, 24
	RGB 12, 12, 12
	RGB 00, 00, 00
	
FakeProfSpruceSpeech::
	ld c, 31
	call FadeToBlack
	call ClearTileMap

	ld de, MUSIC_ROUTE_2
	call PlayMusic

	
	call SetWhitePals
	ld c, 31
	call FadePalettes
	
	xor a
	ld [wCurPartySpecies], a
	ld a, PROF_SPRUCE
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic
	call ApplyTilemap

	ld c, 60
	call DelayFrames
	
	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes

	ld hl, SpruceText1
	call PrintText
	ld c, 15
	call FadeToWhite
	call ClearTileMap

	ld a, SPIRITOMB
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a
	ld [wTempMonDVs + 2], a

	call ApplyTilemap
	
	ld b, CGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetCGBLayout
	call ApplyAttrAndTilemapInVBlank
	ld c, 60
	call FadePalettes
	
	ld a, [wOptions1]
	push af
	ld a, $3
	ld c, a
	ld a, [wOptions1]
	and $fc
	or c
	ld [wOptions1], a
	
	set 6, a
	ld [wInputFlags], a
	
	call SetUpTextBox
	push hl
	call ClearSpeechBox
	pop hl
	
	call SaveMusic
	
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY
	ld d, 9
.loop
	push de
	ld hl, SpruceTextE
	call PrintTextBoxText2
	call RestoreMusic
	inc bc
	inc bc
	inc bc
	pop de
	dec d
	jr nz, .loop

	
	ld a, 60
	ld [wPlaceBallsY], a
.loop2
	ld c, 2
	call DelayFrames
	call RestoreMusic
	ld a, [wPlaceBallsY]
	dec a
	ld [wPlaceBallsY], a
	cp 0
	jr nz, .loop2
	
	ld de, MUSIC_NONE
	call PlayMusic
	
	ld c, 150
	call DelayFrames
	
	pop af
	ld [wOptions1], a
	
	xor a
	ld [wInputFlags], a
	ret


	ld hl, SpruceText2
	call PrintText
	ld hl, SpruceText4
	call PrintText
	ld c, 15
	call FadeToWhite
	call ClearTileMap
	ret
	
SpruceText1: ; 0x6045
	text_jump _SpruceText1
	db "@"

SpruceText2: ; 0x604a
	text_jump _SpruceText2
	start_asm
	ld a, MUNCHLAX
	call PlayCry
	call WaitSFX
	ld hl, SpruceText3
	ret

SpruceText3: ; 0x605b
	text_jump _SpruceText3
	db "@"

SpruceText4: ; 0x6060
	text_jump _SpruceText4
	db "@"

SpruceText5: ; 0x6065
	text_jump _SpruceText5
	db "@"

SpruceText6: ; 0x606a
	text_jump _SpruceText6
	db "@"

SpruceText7: ; 0x606f
	text_jump _SpruceText7
	db "@"
	
SpruceText8: ; 0x606f
	text_jump _SpruceText8
	db "@"
	
SpruceText9: ; 0x606f
	text_jump _SpruceText9
	db "@"
	
SpruceTextA: ; 0x606f
	text_jump _SpruceTextA
	db "@"
	
SpruceTextB: ; 0x606f
	text_jump _SpruceTextB
	db "@"

SpruceTextC: ; 0x606f
	text_jump _SpruceTextC
	db "@"
	
SpruceTextD: ; 0x606f
	text_jump _SpruceTextD
	db "@"
	
SpruceTextE: ; 0x606f
	text_jump _SpruceTextE
	db "@"

SpruceTextF: ; 0x606f
	text_jump _SpruceTextF
	db "@"



TextJump_AreYouABoyOrAreYouAGirl: ; 0x48e0f
	; Are you a boy? Or are you a girl?
	text_jump Text_AreYouABoyOrAreYouAGirl
	db "@"
; 0x48e14

NamePlayer: ; 0x6074
	ld b, $1 ; player
	ld de, wPlayerName
	farcall NamingScreen
	ld hl, wPlayerName
	ld de, DefaultMalePlayerName
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .Male
	ld de, DefaultFemalePlayerName
.Male:
	jp InitName

NameRival: ; 0x6074
	ld b, $2 ; rival
	ld de, wRivalName
	farcall NamingScreen
	ld hl, wRivalName
	ld de, DefaultRivalName
	jp InitName

INCLUDE "data/default_player_names.asm"

ShrinkPlayer: ; 610f

	ldh a, [hROMBank]
	push af

	ld a, 0 << 7 | 32 ; fade out
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeIDLo], a
	ld a, d
	ld [wMusicFadeIDHi], a

	ld de, SFX_ESCAPE_ROPE
	call PlaySFX
	pop af
	rst Bankswitch

	ld c, 8
	call DelayFrames

	ld hl, Shrink1Pic
	ld b, BANK(Shrink1Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	ld hl, Shrink2Pic
	ld b, BANK(Shrink2Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	hlcoord 6, 4
	lb bc, 7, 7
	call ClearBox

	ld c, 3
	call DelayFrames

	call Intro_PlacePlayerSprite
	call Load1bppFrame

	ld c, 50
	call DelayFrames

	ld c, 15
	call FadeToWhite
	jp ClearTileMap
; 616a

Intro_PleaseJustFuckingWork:
	ld hl, IntroFadeTestThing
	ld a, [hli]
	call DmgToCgbBGPals
;	ld c, 10
;	call DelayFrames
	ret
	
IntroFadeTestThing:
	db %11100100

Intro_RotatePalettesLeftFrontpic: ; 616a
	ld hl, IntroFadePalettes
	ld b, IntroFadePalettesEnd - IntroFadePalettes
.loop
	ld a, [hli]
	call DmgToCgbBGPals
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .loop
	ret
; 617c

IntroFadePalettes: ; 0x617c
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100
IntroFadePalettesEnd:
; 6182
DrawIntroPlayerPic:
	xor a
	ld [wCurPartySpecies], a
	ld a, [wPlayerGender]
	cp PIPPI
	jr nz, .notpippi
	ld a, PLAYER_PIPPI
	jr .ok
.notpippi
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .male
	ld a, PLAYER_CORA
	jr .ok
.male
	ld a, PLAYER_CORY
.ok
	ld [wTrainerClass], a
Intro_PrepTrainerPic: ; 619c
	ld de, VTiles2
	farcall GetTrainerPic
	jr FinishPrepIntroPic
; 61b4

ShrinkFrame: ; 61b4
	ld de, VTiles2
	ld c, $31
	predef DecompressPredef
FinishPrepIntroPic:
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

FinishPrepIntroPicBoy:
	ld a, PLAYER_CORY
	ld [wTrainerClass], a
	ld de, VTiles2
	farcall GetTrainerPic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 2, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret
	
FinishPrepIntroPicGirl:
	ld a, PLAYER_CORA
	ld [wTrainerClass], a
	ld de, VTiles2 tile 49
	farcall GetTrainerPic
	ld a, 49
	ldh [hGraphicStartTile], a
	hlcoord 11, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

Intro_PlacePlayerSprite: ; 61cd
	farcall GetPlayerIcon
	ld c, $c
	ld hl, VTiles0
	call Request2bppInWRA6

	ld hl, wSprites
	ld de, .sprites
	ld a, [de]
	inc de

	ld c, a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a

	ld b, 0
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .male
	ld b, 1
.male
	ld a, b

	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 61fe

.sprites ; 61fe
	db 4
	db  9 * 8 + 4,  9 * 8, 0
	db  9 * 8 + 4, 10 * 8, 1
	db 10 * 8 + 4,  9 * 8, 2
	db 10 * 8 + 4, 10 * 8, 3
	
SECTION "Coral Data 6", ROMX
	INCLUDE "engine/busterscreen.asm"
    INCLUDE "engine/mart.asm"
    INCLUDE "data/items/marts.asm"
	INCLUDE "data/text/textbox_names.asm"
