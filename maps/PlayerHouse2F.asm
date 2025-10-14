DEF NUM_DEBUG_QUEST_MENU_OPTIONS EQU 7

PlayerHouse2F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, PlayerHouse2FInitializeRoom
	callback MAPCALLBACK_TILES, PlayerHouse2FSetSpawn

	db 23 ; warp events
	warp_event  9,  0, PLAYER_HOUSE_1F, 3
	warp_event  5, 10, SUNSET_BAY, 1
	warp_event  7, 10, DAYBREAK_VILLAGE, 1
	warp_event  9, 10, GLINT_CITY, 1
	warp_event 11, 10, STARGLOW_VALLEY, 1
	warp_event 13, 10, LAKE_ONWA, 1
	warp_event 15, 10, MT_ONWA_CLIFF, 1
	warp_event 19, 10, OLD_MANOR_EXTERIOR, 1
	warp_event  5, 14, EVENTIDE_VILLAGE, 1
	warp_event  7, 14, FLICKER_STATION, 1
	warp_event  9, 14, TWINKLE_TOWN, 1
	warp_event 11, 14, LUSTER_CITY_SHOPPING, 1
	warp_event 13, 14, SHIMMER_CITY, 1
	warp_event 15, 14, BRILLO_TOWN, 1
	warp_event 17, 14, DESERT_TEMPLE_1, 1
	warp_event 19, 14, RADIANT_TOWNSHIP, 1
	warp_event  5, 18, DUSK_TURNPIKE, 1
	warp_event  7, 18, CROSSROADS, 1
	warp_event  9, 18, KOMORE_VILLAGE, 6
	warp_event 11, 18, BRIGHTBURG, 1
	warp_event 13, 18, OBSCURA_CITY, 1
	warp_event 15, 18, UNDERWATER_TEMPLE_2, 1
	warp_event 17, 18, ROUTE_11_2, 2

	db 1 ; coord events
	xy_trigger 0, 10, 17, 0, SunbeamWarp, 0, 0

	db 29 ; bg events
	bg_event  4,  1, SIGNPOST_UP, PlayerHousePC
	bg_event  5,  1, SIGNPOST_READ, PlayerHouseRadio
	bg_event -1, -1, SIGNPOST_READ, PlayerHouseBookshelf
	bg_event  7,  1, SIGNPOST_READ, PlayerHouseCloset
	bg_event  8,  0, SIGNPOST_IFSET, PlayersHousePoster
;	powergap
	bg_event  2, 10, SIGNPOST_READ, PlayerHouseDebugPoster
	bg_event  4, 10, SIGNPOST_JUMPTEXT, PlayerHouseSunset
	bg_event  6, 10, SIGNPOST_JUMPTEXT, PlayerHouseDaybreak
	bg_event  8, 10, SIGNPOST_JUMPTEXT, PlayerHouseGlint
	bg_event 10, 10, SIGNPOST_JUMPTEXT, PlayerHouseStarglow
	bg_event 12, 10, SIGNPOST_JUMPTEXT, PlayerHouseLakeOnwaR
	bg_event 14, 10, SIGNPOST_JUMPTEXT, PlayerHouseLakeOnwaL
	bg_event 16, 10, SIGNPOST_JUMPTEXT, PlayerHouseSunbeamIsland
	bg_event 18, 10, SIGNPOST_JUMPTEXT, PlayerHouseOldManor
	bg_event  4, 14, SIGNPOST_JUMPTEXT, PlayerHouseEventideVillage
	bg_event  6, 14, SIGNPOST_JUMPTEXT, PlayerHouseFlickerStation
	bg_event  8, 14, SIGNPOST_JUMPTEXT, PlayerHouseTwinkle
	bg_event 10, 14, SIGNPOST_JUMPTEXT, PlayerHouseLuster
	bg_event 12, 14, SIGNPOST_JUMPTEXT, PlayerHouseShimmer
	bg_event 14, 14, SIGNPOST_JUMPTEXT, PlayerHouseBrillo
	bg_event 16, 14, SIGNPOST_JUMPTEXT, PlayerHouseDesertTemple
	bg_event 18, 14, SIGNPOST_JUMPTEXT, PlayerHouseRadiant
	bg_event  4, 18, SIGNPOST_JUMPTEXT, PlayerHouseDusk
	bg_event  6, 18, SIGNPOST_JUMPTEXT, PlayerHouseCrossroads
	bg_event  8, 18, SIGNPOST_JUMPTEXT, PlayerHouseKomore
	bg_event 10, 18, SIGNPOST_JUMPTEXT, PlayerHouseBright
	bg_event 12, 18, SIGNPOST_JUMPTEXT, PlayerHouseObscura
	bg_event 14, 18, SIGNPOST_JUMPTEXT, PlayerHouseUnderwaterTemple
	bg_event 16, 18, SIGNPOST_JUMPTEXT, PlayerHouseRoute32

	db 7 ; object events
	object_event  6,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_KRISS_HOUSE_2F_CONSOLE
	object_event  6,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll1, EVENT_KRISS_HOUSE_2F_DOLL_1
	object_event  7,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_DOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll2, EVENT_KRISS_HOUSE_2F_DOLL_2
	object_event  2,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BigDoll, EVENT_KRISS_HOUSE_2F_BIG_DOLL
	object_event -5, -5, SPRITE_MUSEUM_STANDEE, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -5, -5, SPRITE_MINA_PAINTING, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  7,  4, TAPE_PLAYER, 1, EVENT_GOT_TAPE_PLAYER
	

	const_def 1 ; object constants
	const PLAYERHOUSE2F_CONSOLE
	const PLAYERHOUSE2F_DOLL_1
	const PLAYERHOUSE2F_DOLL_2
	const PLAYERHOUSE2F_BIG_DOLL
	const PLAYERHOUSE2F_FRAME
	const PLAYERHOUSE2F_MINA_MON
	
PlayersHousePoster:
	dw EVENT_KRISS_ROOM_POSTER
	describedecoration 0
	
Doll1:
	describedecoration 1

Doll2:
	describedecoration 2

BigDoll:
	describedecoration 3
	
PlayerHouseDebugPoster:
	opentext
.return
	writetext PlayerHouseDebug2Text1
.page1
	loadmenu .PlayerHouseDebugMenuData
	verticalmenu
	iffalse .end
	if_equal $1, .Mons
	if_equal $2, .Items
	if_equal $3, .badges
	if_equal $4, .tms
	closewindow
.page2
	loadmenu .PlayerHouseDebugMenu2Data
	verticalmenu
	iffalse .end
	if_equal $1, .deco
	if_equal $2, .quests
	if_equal $3, .Sfx
	if_equal $4, .flags
	closewindow
	jump .page1
.Mons
	closewindow
.Mons2
	callasm PlayerRoomGiveMonAsm
	special Special_UpdatePalsInstant
	jump .return
.quests
	closewindow
	callasm QuestScrollingMenuAsm
	if_equal $1, .mina
	if_equal $2, .boy
	if_equal $3, .girls
	if_equal $4, .pearl_1
	if_equal $5, .pearl_2
	if_equal $6, .ancient_ball
	if_equal $7, .bridge
	closewindow
	jump .page2
.Items
	closewindow
	farwritetext StdBlankText
	callasm PlayerRoomItemIconTest
	special Special_UpdatePalsInstant
	setflag ENGINE_TRAINER_CARD
	setflag ENGINE_POKEDEX
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_BANK_CARD
	setevent EVENT_RUNNING_SHOES
	setevent EVENT_BIKE_UPGRADED
	addcellnum PHONE_MOM
	addcellnum PHONE_SPRUCE
	addcellnum PHONE_WENDY
	addcellnum PHONE_AUTO
	setevent EVENT_MOM_GOT_POKEGEAR
	givecoins 20
	setevent EVENT_KNOW_OLLIE
	setevent EVENT_KNOW_GRIND
	callasm FillPokedex
	special InitRoamMoltres
	callasm UnlockSongs
	jump .return
.badges
	closewindow
	writetext PlayerHouseDebug2BadgeText
	waitbutton
	setflag ENGINE_FIRSTBADGE
	setflag ENGINE_SECONDBADGE
	setflag ENGINE_THIRDBADGE
	setflag ENGINE_FOURTHBADGE
	setflag ENGINE_SIXTHBADGE
	setflag ENGINE_FIFTHBADGE
	setflag ENGINE_SEVENTHBADGE
	setflag ENGINE_EIGHTHBADGE
	setflag ENGINE_MET_STANLEY
	setflag ENGINE_MET_RODNEY
	setflag ENGINE_MET_WENDY
	setflag ENGINE_MET_CHARLIE
	setflag ENGINE_MET_POLLY
	setflag ENGINE_MET_LEILANI
	setflag ENGINE_MET_ROCKY
	setflag ENGINE_MET_DARCY
	domaptrigger FLICKER_STATION, 1
	jump .return
.tms
	closewindow
	writetext PlayerHouseDebug2TMText
	waitbutton
	setflag ENGINE_GOT_ROCK_SMASH
	setflag ENGINE_GOT_CUT
	setflag ENGINE_GOT_FLY
	setflag ENGINE_GOT_ROCK_CLIMB
	setflag ENGINE_GOT_SURF
	setflag ENGINE_GOT_WATERFALL
	setflag ENGINE_GOT_STRENGTH
	setflag ENGINE_GOT_DIVE
	givetmhm TM_WORK_UP_GROWTH
	givetmhm TM_CHARM
	givetmhm TM_CURSE
	givetmhm TM_HAIL
	givetmhm TM_ZAP_CANNON
	givetmhm TM_BRICK_BREAK
	givetmhm TM_SUNNY_DAY
	givetmhm TM_BLIZZARD
	givetmhm TM_HYPER_BEAM
	givetmhm TM_LIGHT_SCREEN
	givetmhm TM_PROTECT
	givetmhm TM_RAIN_DANCE
	givetmhm TM_GIGA_DRAIN
	givetmhm TM_SAFEGUARD
	givetmhm TM_BULLDOZE
	givetmhm TM_SOLAR_BEAM
	givetmhm TM_THUNDER
	givetmhm TM_DIG
	givetmhm TM_METAL_CLAW
	givetmhm TM_REFLECT
	givetmhm TM_FIRE_BLAST
	givetmhm TM_FAKE_OUT
	givetmhm TM_SUBSTITUTE
	givetmhm TM_WEATHER_BALL
	givetmhm TM_STEEL_WING
	givetmhm TM_ROOST
	givetmhm TM_WILL_O_WISP
	givetmhm TM_ACROBATICS
	givetmhm TM_SELFDESTRUCT
	givetmhm TM_GIGA_IMPACT
	givetmhm TM_SAND_ATTACK_SMOKESCREEN_FLASH
	givetmhm TM_ANCIENTPOWER
	givetmhm TM_THUNDERPUNCH
	givetmhm TM_FIRE_PUNCH
	givetmhm TM_ICE_PUNCH
	givetmhm TM_SUPERPOWER
	givetmhm HM_CUT
	givetmhm HM_FLY
	givetmhm HM_SURF
	givetmhm HM_STRENGTH
	givetmhm HM_DIVE
	givetmhm HM_ROCK_SMASH
	givetmhm HM_WATERFALL
	givetmhm HM_ROCK_CLIMB
	setflag ENGINE_FLYPOINT_HOME
	setflag ENGINE_FLYPOINT_SUNSET
	setflag ENGINE_FLYPOINT_DAYBREAK
	setflag ENGINE_FLYPOINT_GLINT
	setflag ENGINE_FLYPOINT_STARGLOW
	setflag ENGINE_FLYPOINT_LAKE_ONWA
	setflag ENGINE_FLYPOINT_SUNBEAM
	setflag ENGINE_FLYPOINT_EVENTIDE
	setflag ENGINE_FLYPOINT_FLICKER
	setflag ENGINE_FLYPOINT_TWINKLE
	setflag ENGINE_FLYPOINT_LUSTER
	setflag ENGINE_FLYPOINT_SHIMMER
	setflag ENGINE_FLYPOINT_BRILLO
	setflag ENGINE_FLYPOINT_RADIANT
	setflag ENGINE_FLYPOINT_DUSK
	setflag ENGINE_FLYPOINT_CROSSROADS
	setflag ENGINE_FLYPOINT_KOMORE
	setflag ENGINE_FLYPOINT_BRIGHT
	setflag ENGINE_FLYPOINT_OBSCURA
	setevent EVENT_UNLOCKED_SOUTH_FLY_MAP
	setevent EVENT_CAN_GO_TO_SHIMMER
	jump .return
.deco
	closewindow
	writetext PlayerHouseDebug2DecoText
	waitbutton
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_BED_2
	setevent EVENT_DECO_BED_3
	setevent EVENT_DECO_BED_4
	setevent EVENT_DECO_BED_5
	setevent EVENT_DECO_BED_6
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_CARPET_2
	setevent EVENT_DECO_CARPET_3
	setevent EVENT_DECO_CARPET_4
	setevent EVENT_DECO_CARPET_5
	setevent EVENT_DECO_PLANT_1
	setevent EVENT_DECO_PLANT_2
	setevent EVENT_DECO_PLANT_3
	setevent EVENT_DECO_PLANT_4
	setevent EVENT_DECO_POSTER_1
	setevent EVENT_DECO_POSTER_2
	setevent EVENT_DECO_POSTER_3
	setevent EVENT_DECO_POSTER_4
	setevent EVENT_DECO_POSTER_5
	setevent EVENT_DECO_POSTER_6
	setevent EVENT_DECO_POSTER_7
	setevent EVENT_DECO_POSTER_8
	setevent EVENT_DECO_POSTER_9
	setevent EVENT_DECO_SNES
	setevent EVENT_DECO_N64
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	setevent EVENT_DECO_BIG_ONIX_DOLL
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	setevent EVENT_DECO_BIG_GYARADOS_DOLL
	setevent EVENT_DECO_BIG_MAMOSWINE_DOLL
	setevent EVENT_DECO_BIG_MUK_DOLL
	setevent EVENT_DECO_PIKACHU_DOLL
	setevent EVENT_DECO_RAICHU_DOLL
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	setevent EVENT_DECO_CLEFAIRY_DOLL
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	setevent EVENT_DECO_BULBASAUR_DOLL
	setevent EVENT_DECO_CHARMANDER_DOLL
	setevent EVENT_DECO_SQUIRTLE_DOLL
	setevent EVENT_DECO_CHIKORITA_DOLL
	setevent EVENT_DECO_CYNDAQUIL_DOLL
	setevent EVENT_DECO_TOTODILE_DOLL
	setevent EVENT_DECO_POLIWAG_DOLL
	setevent EVENT_DECO_MAREEP_DOLL
	setevent EVENT_DECO_TOGEPI_DOLL
	setevent EVENT_DECO_MAGIKARP_DOLL
	setevent EVENT_DECO_ODDISH_DOLL
	setevent EVENT_DECO_GENGAR_DOLL
	setevent EVENT_DECO_MARACTUS_DOLL
	setevent EVENT_DECO_DITTO_DOLL
	setevent EVENT_DECO_VOLTORB_DOLL
	setevent EVENT_DECO_GIRAFARIG_DOLL
	setevent EVENT_DECO_COTTONEE_DOLL
	setevent EVENT_DECO_GEODUDE_DOLL
	setevent EVENT_DECO_FLITTLE_DOLL
	setevent EVENT_DECO_EXEGGCUTE_DOLL
	setevent EVENT_DECO_TEDDIURSA_DOLL
	setevent EVENT_DECO_MEOWTH_DOLL
	setevent EVENT_DECO_BUIZEL_DOLL
	setevent EVENT_DECO_GROWLITHE_DOLL
	setevent EVENT_DECO_EEVEE_DOLL
	setevent EVENT_DECO_GOLD_TROPHY
	setevent EVENT_DECO_SILVER_TROPHY
	jump .return
.Sfx
	closewindow
	farwritetext StdBlankText
	callasm PlayerRoomSfxTest
	jump .return
.flags
	closewindow
	farwritetext StdBlankText
	callasm PlayerRoomEventFlagTest
	jump .return
.mina
	closewindow
	writetext PlayerHouseDebug2MinaText
	waitbutton
	domaptrigger ROUTE_6_SOUTH, $1
	clearevent EVENT_MINA_APARTMENT_EMPTY
	clearevent EVENT_ROUTE_6_MINA_GONE
	clearevent EVENT_ROUTE_11_MINA_GONE
	clearevent EVENT_RADIANT_FIELD_MINA_GONE
	clearevent EVENT_ROUTE_29_MINA_GONE
	clearevent EVENT_ROUTE_10_MINA_GONE
	setevent EVENT_MINA_QUEST_ACTIVATED
	jump .return
.boy
	closewindow
	writetext PlayerHouseDebug2BoyText
	waitbutton
	domaptrigger EVENTIDE_VILLAGE, $2
	setevent EVENT_SAVED_BIKESHOP_OWNERS_SON
	clearevent EVENT_HAVENT_SAVED_BIKESHOP_OWNERS_SON
	jump .return
.girls
	closewindow
	writetext PlayerHouseDebug2GirlsText
	waitbutton
	clearevent EVENT_RADIANT_GYM_ACTIVE
	setevent EVENT_RADIANT_GYM_INACTIVE
	setevent EVENT_SAVED_ALL_LOST_GIRLS
	setevent EVENT_ERIKA_OUTSIDE_ORPAHANGE
	setevent EVENT_CAN_GO_TO_DESERT
	jump .return
.pearl_1
	closewindow
	writetext PlayerHouseDebug2Pearl1Text
	waitbutton
	setevent EVENT_DESERT_TEMPLE_2_POKE_BALL
	giveitem BLACK_PEARL
	jump .return
.pearl_2
	closewindow
	writetext PlayerHouseDebug2Pearl2Text
	waitbutton
	setevent EVENT_DESERT_TEMPLE_2_POKE_BALL
	setevent EVENT_SHOWED_HILL_BLACK_PEARL
	clearevent EVENT_SNARE_AT_MUSEUM
	giveitem BLACK_PEARL
	jump .return
.ancient_ball
	closewindow
	writetext PlayerHouseDebug2AncientBallText
	waitbutton
	setevent EVENT_DESERT_TEMPLE_2_POKE_BALL
	setevent EVENT_SHOWED_HILL_BLACK_PEARL
	clearevent EVENT_SNARE_AT_MUSEUM
	giveitem ANCIENT_BALL
	jump .return
.bridge
	closewindow
	writetext PlayerHouseDebug2BridgeText
	waitbutton
	setevent EVENT_CROSSROADS_CUTSCENE_DONE
	setevent EVENT_ROUTE_11_BRIDGE_BUILT
	clearevent EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	jump .return
.end
	closetext
	end
	
.PlayerHouseDebugMenuData: ; 0x48dfc
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2PlayerHouseDebug
	db 1 ; default option
; 0x48e04

.MenuData2PlayerHouseDebug: ; 0x48e04
	db $a0 ; flags
	db 5 ; items
	db "#MON@"
	db "ITEMS@"
	db "BADGES@"
	db "TMs/HMs@"
	db "PAGE 2@"
	
.PlayerHouseDebugMenu2Data: ; 0x48dfc
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2PlayerHouseDebug2
	db 1 ; default option
; 0x48e04

.MenuData2PlayerHouseDebug2: ; 0x48e04
	db $a0 ; flags
	db 5 ; items
	db "DECORATIONS@"
	db "QUESTS@"
	db "SFX TEST@"
	db "EVENT FLAGS@"
	db "PAGE 1@"
	
PlayerHouseDebug2BadgeText:
	text "Obtained all"
	line "BADGES."
	done
	
PlayerHouseDebug2TMText:
	text "Obtained all"
	line "TMs and HMs."
	done
	
PlayerHouseDebug2DecoText:
	text "Obtained all"
	line "DECORATIONS."
	done
	
PlayerHouseDebug2MinaText:
	text "MINA quest"
	line "started."
	done
	
PlayerHouseDebug2BoyText:
	text "EVENTIDE VILLAGE"
	line "boy found."
	done
	
PlayerHouseDebug2GirlsText:
	text "RADIANT TOWN"
	line "girls rescued."
	done
	
PlayerHouseDebug2Pearl1Text:
	text "BLACK PEARL"
	line "collected from"
	cont "DESERT TEMPLE."
	done
	
PlayerHouseDebug2Pearl2Text:
	text "BLACK PEARL"
	line "shown to PROF."
	cont "HILL."
	done
	
PlayerHouseDebug2AncientBallText:
	text "ANCIENT BALL"
	line "collected from"
	cont "UNDERWATER TEMPLE."
	done
	
PlayerHouseDebug2BridgeText:
	text "ROUTE 11 bridge"
	line "built."
	done
	
PlayerRoomEventFlagTest:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	farcall _LoadHexFont
	xor a
	ld [wTempMonHPEV], a
	ld [wTempMonAtkEV], a
	ld [wTempMonDefEV], a
	ld [wTempMonSpdEV], a
	ld [wMenuCursorX], a
	ld [wPlaceBallsX], a
	ld de, wTempMonHPEV
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and SELECT
	jp nz, .select
	ld a, [hl]
	and A_BUTTON
	jp nz, .A
	ld a, [hl]
	and B_BUTTON
	jp nz, .end
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	push de
	hlcoord 1, 14
	ld a, [wPlaceBallsX]
	cp 0
	jr nz, .clear_string
	ld de, .PlayerRoomEventFlagTestSetString
	jr .got_string
.clear_string
	ld de, .PlayerRoomEventFlagTestClearString
.got_string
	call PlaceString
	hlcoord 1, 16
	ld de, .PlayerRoomEventFlagTestSwapString
	call PlaceString
	call .load_flag
	jr c, .X
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	hlcoord 17, 14
	jr z, .flag_not_set
	ld a, "!"
	ld [hl], a
	pop de
	jr .draw_numbers
.flag_not_set
	ld a, "…"
	ld [hl], a
	pop de
	jr .draw_numbers
.X
	hlcoord 17, 14
	ld a, "X"
	ld [hl], a
	pop de
	jr .draw_numbers
.left
	ld a, [wMenuCursorX]
	cp 0
	jr z, .draw_numbers
	dec a
	ld [wMenuCursorX], a
	ld h, d
	ld l, e
	dec hl
	ld d, h
	ld e, l
	jr .draw_numbers
.right
	ld a, [wMenuCursorX]
	cp 3
	jr z, .draw_numbers
	inc a
	ld [wMenuCursorX], a
	ld h, d
	ld l, e
	inc hl
	ld d, h
	ld e, l
	jr .draw_numbers
.up
	ld h, d
	ld l, e
	ld a, [hl]
	inc a
	and $f
	ld [hl], a
	jr .draw_numbers
.down
	ld h, d
	ld l, e
	ld a, [hl]
	dec a
	and $f
	ld [hl], a
.draw_numbers
	push de
	
	hlcoord 12, 13
	ld a, [wMenuCursorX]
	cp 3
	jr z, .cursor_3
	cp 2
	jr z, .cursor_2
	cp 1
	jr z, .cursor_1
	ld a, $f8
	ld [hli], a
	ld bc, 3
	ld a, " "
	call ByteFill
	jr .done_cursor
.cursor_1
	ld a, " "
	ld [hli], a
	ld a, $f8
	ld [hli], a
	ld bc, 2
	ld a, " "
	call ByteFill
	jr .done_cursor
.cursor_2
	ld bc, 2
	ld a, " "
	call ByteFill
	ld a, $f8
	ld [hli], a
	ld a, " "
	ld [hl], a
	jr .done_cursor
.cursor_3
	ld bc, 3
	ld a, " "
	call ByteFill
	ld a, $f8
	ld [hl], a
	
.done_cursor
	hlcoord 12, 14
	ld de, wTempMonHPEV
	ld a, [de]
	call .place_tile
	hlcoord 13, 14
	ld de, wTempMonAtkEV
	ld a, [de]
	call .place_tile
	hlcoord 14, 14
	ld de, wTempMonDefEV
	ld a, [de]
	call .place_tile
	hlcoord 15, 14
	ld de, wTempMonSpdEV
	ld a, [de]
	call .place_tile
	
	pop de
	jp .loop
	
.place_tile
	and $f
	add $e0
	ld [hl], a
	ret
.select
	ld a, [wPlaceBallsX]
	inc a
	and 1
	ld [wPlaceBallsX], a
	jp .loop
.A
	push de
	call .load_flag
	jr c, .invalid
	ld a, [wPlaceBallsX]
	cp 0
	jr nz, .clear
;.set
	ld b, SET_FLAG
	call EventFlagAction
	ld d, 0
	ld e, SFX_TALLY
	call PlaySFX
	pop de
	jp .loop
.clear
	ld b, RESET_FLAG
	call EventFlagAction
	ld d, 0
	ld e, SFX_WALL_OPEN
	call PlaySFX
	pop de
	jp .loop
.invalid
	ld d, 0
	ld e, SFX_WRONG
	call PlaySFX
	pop de
	jp .loop
.load_flag
	ld a, [wTempMonHPEV]
	sla a
	sla a
	sla a
	sla a
	ld d, a
	ld a, [wTempMonAtkEV]
	add d
	ld d, a
	
	ld a, [wTempMonDefEV]
	sla a
	sla a
	sla a
	sla a
	ld e, a
	ld a, [wTempMonSpdEV]
	add e
	ld e, a
	
	ld hl, NUM_EVENTS
    ld a, h
    cp d
    jr nz, .high_done
    ld a, l
	dec a
    cp e

.high_done:
    ret c

    xor a
	ret
	
.end
	pop af
	ldh [hInMenu], a
	call LoadStandardFont
	ret
.PlayerRoomEventFlagTestSetString
	db "A: SET  @"
.PlayerRoomEventFlagTestClearString
	db "A: CLEAR@"
.PlayerRoomEventFlagTestSwapString
	db "SELECT: SWAP@"
	
PlayerRoomGiveMonAsm:
	call HideSprites
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	xor a
	ld [wPlaceBallsX], a
	ld [wMenuCursorY], a
	ld [wGiveMonForceAbility], a
	hlcoord 0, 0
	lb bc, 16, 18
	call TextBox
	call Load1bppFont
	call Load1bppFrame
	ld a, ABILITY_1
	ld [wGiveMonForceAbility], a
	ld a, 1
	ld [wCurPartySpecies], a
	ld [wSkipAskNickname], a
	ld a, 1
	ld [wCurForm], a
	ld a, 1
	ld [wCurPartyLevel], a
	ld a, NO_ITEM
	ld [wCurItem], a	
	jp .drawmenu
.loop
	ld a, [wPlaceBallsX]
	inc a
	ld [wPlaceBallsX], a
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jp nz, .obtain
	ld a, [hl]
	and B_BUTTON
	jp nz, .end
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	jp .drawmenu
.up
	ld a, [wMenuCursorY]
	cp 0
	jr z, .loop
	dec a
	ld [wMenuCursorY], a
	jr .loop
.down
	ld a, [wMenuCursorY]
	cp 3
	jr z, .loop
	inc a
	ld [wMenuCursorY], a
	jr .loop
.right
	ld a, [wMenuCursorY]
	cp 1
	jr z, .right_lvl
	cp 2
	jr z, .right_ability
	cp 3
	jr z, .right_form
;.right_mon
	ld a, [wCurPartySpecies]
	inc a
	cp 0
	jr nz, .right_mon_finish
	inc a
.right_mon_finish
	ld [wCurPartySpecies], a
	jr .loop
.right_lvl
	ld a, [wCurPartyLevel]
	inc a
	ld [wCurPartyLevel], a
	jr .loop
.right_ability
	ld a, [wGiveMonForceAbility]
	cp $60
	jr z, .right_ability_loop
	add $20
	jr .right_ability_finish
.right_ability_loop
	ld a, $20
.right_ability_finish
	ld [wGiveMonForceAbility], a
	jp .loop
.right_form
	ld a, [wCurForm]
	inc a
	ld [wCurForm], a
	jp .loop
.left
	ld a, [wMenuCursorY]
	cp 1
	jr z, .left_lvl
	cp 2
	jr z, .left_ability
	cp 3
	jr z, .left_form
;.left_mon
	ld a, [wCurPartySpecies]
	dec a
	cp 0
	jr nz, .left_mon_finish
	dec a
.left_mon_finish
	ld [wCurPartySpecies], a
	jp .loop
.left_lvl
	ld a, [wCurPartyLevel]
	dec a
	ld [wCurPartyLevel], a
	jp .loop
.left_ability
	ld a, [wGiveMonForceAbility]
	cp $20
	jr z, .left_ability_loop
	sub $20
	jr .left_ability_finish
.left_ability_loop
	ld a, $60
.left_ability_finish
	ld [wGiveMonForceAbility], a
	jp .loop
.left_form
	ld a, [wCurForm]
	dec a
	ld [wCurForm], a
	jp .loop
.obtain
	ld d, 0
	ld e, SFX_LEVEL_UP
	call PlaySFX
	ld a, 1
	ld [wSkipAskNickname], a
	ld a, NO_ITEM
	ld [wCurItem], a
	ld a, 0
	and a
	ld b, a
	farcall GivePoke
.drawmenu
	push hl
	hlcoord 3, 2
	ld de, .PlayerRoomGiveMonMonString
	call PlaceString
	hlcoord 3, 4
	ld de, .PlayerRoomGiveMonLevelString
	call PlaceString
	hlcoord 3, 6
	ld de, .PlayerRoomGiveMonAbilityString
	call PlaceString
	hlcoord 3, 8
	ld de, .PlayerRoomGiveMonFormString
	call PlaceString
	hlcoord 3, 2
	ld a, [wMenuCursorY]
	cp 0
	jr z, .done_cursor_loop
	ld e, a
.cursor_loop_outer
	ld a, 40
.cursor_loop_inner
	inc hl
	dec a
	cp 0
	jr nz, .cursor_loop_inner
	ld a, e
	cp 0
	dec e
	jr nz, .cursor_loop_outer
.done_cursor_loop
	ld [hl], "▶"
	pop hl
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	ld [wd265], a
	farcall LoadDebugMonIcon
	hlcoord 9, 2
	ld de, .ClearTextString
	call PlaceString
	call GetPokemonName
	hlcoord 9, 2
	call PlaceString
	hlcoord 9, 4
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	ld de, wCurPartyLevel
	call PrintNum
	
	ld a, [wGiveMonForceAbility]
	sra a
	sra a
	sra a
	sra a
	sra a
	ld [wSkipAskNickname], a
	hlcoord 13, 6
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wSkipAskNickname
	call PrintNum
	
	hlcoord 10, 8
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	ld de, wCurForm
	call PrintNum
	call BGMapAnchorTopLeft
	ld hl, .SpriteData
	ld a, [wPlaceBallsX]
	and 4
	cp 2
	jr c, .got_sprite_frame
	ld hl, .SpriteData2
.got_sprite_frame
	bcpixel 3, 2
;copy oam
	ld de, wSprites
	ld a, [hli]
.loop2
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .loop2
	jp .loop
.SpriteData:
	db 4
	dsprite 0, 4, 0, 0, $68, $0
	dsprite 0, 4, 1, 0, $69, $0
	dsprite 1, 4, 0, 0, $6a, $0
	dsprite 1, 4, 1, 0, $6b, $0
	
.SpriteData2:
	db 4
	dsprite 0, 4, 0, 0, $6c, $0
	dsprite 0, 4, 1, 0, $6d, $0
	dsprite 1, 4, 0, 0, $6e, $0
	dsprite 1, 4, 1, 0, $6f, $0
.ClearTextString
	db "          @"
.PlayerRoomGiveMonMonString
	db " MON:@"
.PlayerRoomGiveMonLevelString
	db " LVL:@"
.PlayerRoomGiveMonAbilityString
	db " ABILITY:@"
.PlayerRoomGiveMonFormString
	db " FORM:@"
.end
	call LoadStandardFont
	call LoadFontsExtra
	ld b, BANK(StdBlankText)
	ld hl, StdBlankText
	call MapTextbox
	xor a
	ld [wCurItem], a
	ld [wPlaceBallsX], a
	ld [wGiveMonForceAbility], a
	ld [wSkipAskNickname], a
	pop af
	ldh [hInMenu], a
	call RefreshScreen
	ret
	
PlayerRoomItemIconTest:
	call Load1bppFont
	call Load1bppFrame
	farcall _LoadHexFont
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	ld [wCurItem], a
	ld [wItemQuantityChangeBuffer], a
	
	
	xor a
	ld [wPlaceBallsX], a	
	jp .drawicon
.loop
	call JoyTextDelay
	ld hl, hJoyReleased
	ld a, [hl]
	and SELECT
	jp nz, .drawicon
	ld hl, hJoyPressed
	ld a, [hl]
	and SELECT
	jp nz, .drawicon
	ld a, [hl]
	and A_BUTTON
	jr nz, .obtain
	ld a, [hl]
	and B_BUTTON
	jr nz, .end
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	jr .loop
.obtain
	ld hl, wNumItems
	call ReceiveItem
	ld d, 0
	ld e, SFX_LEVEL_UP
	call PlaySFX
	jr .loop
.end
	ld b, BANK(StdBlankText)
	ld hl, StdBlankText
	call MapTextbox
	xor a
	ld [wCurItem], a
	ld [wPlaceBallsX], a
	pop af
	ldh [hInMenu], a
	call LoadStandardFont
	call LoadFontsExtra
	ret
.right
	ld a, [wCurItem]
	add 10
	ld [wCurItem], a
	jr .drawicon
.left
	ld a, [wCurItem]
	sub 10
	ld [wCurItem], a
	jr .drawicon
.up
	ld hl, hJoyDown
	ld a, [hl]
	and SELECT
	jr z, .up_cont
	ld a, [wItemQuantityChangeBuffer]
	inc a
	ld [wItemQuantityChangeBuffer], a
	jr .drawicon
.up_cont
	ld a, [wCurItem]
	inc a
	ld [wCurItem], a
	jr .drawicon
.down
	ld hl, hJoyDown
	ld a, [hl]
	and SELECT
	jr z, .down_cont
	ld a, [wItemQuantityChangeBuffer]
	dec a
	ld [wItemQuantityChangeBuffer], a
	jr .drawicon
.down_cont
	ld a, [wCurItem]
	dec a
	ld [wCurItem], a
;fallthrough
.drawicon
	call .item_bounds
	call .amount_bounds
	hlcoord 1, 14
	ld de, .ClearTextString
	call PlaceString
	hlcoord 1, 16
	ld de, PlayerRoomItemIconTestString
	call PlaceString
	ld hl, hJoyDown
	ld a, [hl]
	and SELECT
	jr z, .name
	hlcoord 6, 14
	ld a, "×"
	ld [hl], a
	hlcoord 7, 14
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wItemQuantityChangeBuffer
	call PrintNum
	jr .done_name
.name
	ld a, [wCurItem]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	hlcoord 6, 14
	call PlaceString
.done_name
	call .drawnumbers
	ld a, 7
	ld [wPlaceBallsX], a
	farcall GetItemIconTiles
	ld hl, .SpriteData
	bcpixel 15, 3
;copy oam
	ld de, wSprites + 16
	ld a, [hli]
.loop2
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .loop2
	jp .loop
.drawnumbers
	hlcoord 12, 12
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	ld de, wNamedObjectIndexBuffer
	call PrintNum
	
	hlcoord 16, 12
	ld de, wNamedObjectIndexBuffer
	inc hl
	ld a, [de]
	call .place_tile
	ld a, [de]
	swap a
.place_tile
	and $f
	add $e0
	ld [hld], a
	ret
.item_bounds
	ld a, [wCurItem]
	cp 0
	jr z, .set_item_one
	cp $ff
	ret nz
	ld a, 1
	ld [wCurItem], a
	ret
.set_item_one
	ld a, $fe
	ld [wCurItem], a
	ret
	
.amount_bounds
	ld a, [wItemQuantityChangeBuffer]
	cp 100
	jr nc, .set_amount_one
	cp 0
	ret nz
.set_amount_99
	ld a, 99
	ld [wItemQuantityChangeBuffer], a
	ret
.set_amount_one
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ret
	
.SpriteData:
	db 4
	dsprite 0, 4, 0, 0, $68, $7
	dsprite 0, 4, 1, 0, $69, $7
	dsprite 1, 4, 0, 0, $6a, $7
	dsprite 1, 4, 1, 0, $6b, $7
.ClearTextString:
	db "↑  ↓             @"
	
PlayerRoomItemIconTestString:
	db "A:Get   SEL:Amount@"
	
PlayerRoomSfxTest:
	call WaitSFX
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	ld de, MUSIC_NONE
	call PlayMusic
	
	farcall _LoadHexFont
	
	xor a
	ld [wPlaceBallsX], a
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 1, 14
	ld de, PlayerRoomSfxTestString
	call PlaceString
	hlcoord 1, 16
	ld de, PlayerRoomSfxTestString2
	call PlaceString
	jp .drawnumbers
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .end
	ld a, [hl]
	and A_BUTTON
	jr nz, .A
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	jr .loop
.end
	farcall _LoadStandardFont
	ld a, [wMapMusic]
	ld e, a
	ld d, 0
	call PlayMusic
	xor a
	ld [wPlaceBallsX], a
	pop af
	ldh [hInMenu], a
	ret
.A
	farcall CheckSFX
	jr nc, .playsound
	ld de, MUSIC_NONE
	call PlayMusic
	jr .loop
.playsound
;kill old sound
	xor a
	ld [wChannel5Flags], a
	ld [wChannel6Flags], a
	ld [wChannel7Flags], a
	ld [wChannel8Flags], a
;play new sound
	ld d, a
	ld a, [wPlaceBallsX]
	ld e, a
	call PlaySFX
	jr .loop
.right
	ld a, [wPlaceBallsX]
	add 10
	ld [wPlaceBallsX], a
	cp NUM_SFX
	jr c, .drawnumbers
	xor a
	ld [wPlaceBallsX], a
	jr .drawnumbers
.left
	ld a, [wPlaceBallsX]
	sub 10
	ld [wPlaceBallsX], a
	cp NUM_SFX
	jr c, .drawnumbers
	ld a, NUM_SFX
	ld [wPlaceBallsX], a
	jr .drawnumbers
.up
	ld a, [wPlaceBallsX]
	inc a
	ld [wPlaceBallsX], a
	cp NUM_SFX
	jr c, .drawnumbers
	xor a
	ld [wPlaceBallsX], a
	jr .drawnumbers
.down
	ld a, [wPlaceBallsX]
	dec a
	ld [wPlaceBallsX], a
	cp NUM_SFX
	jr c, .drawnumbers
	ld a, NUM_SFX
	ld [wPlaceBallsX], a
;fallthrough
.drawnumbers
	hlcoord 15, 14
	ld de, wPlaceBallsX
	inc hl
;	inc hl
;	inc hl
	ld a, [de]
	call .place_tile
	ld a, [de]
	swap a
	call .place_tile
	jp .loop
.place_tile
	and $f
	add $e0
	ld [hld], a
	ret
	
PlayerRoomSfxTestString:
	db "A:Play/Stop ↑    ↓@"
	
PlayerRoomSfxTestString2:
	db "B:Quit            @"
	
PlayerHouseDebug2Text1:
	text "DEBUG POSTER"
	done

FillPokedex:
	ld hl, wPokedexSeen
	call .Fill
	ld hl, wPokedexCaught
.Fill:
	ld a, %11111111
	ld bc, 31 ; 001-248
	call ByteFill
	ld [hl], %00111111 ; 249-254
	ret
	
UnlockSongs:
	ld hl, wUnlockedSongs
	ld a, %11111111
	ld bc, 31 ; 001-248
	call ByteFill
	ld [hl], %00111111 ; 249-254
	ld a, NUM_TAPE_PLAYER_SONGS
	ld hl, TAPE_FLAGS_START
.loop
	ld [wCurBattleMon], a
	xor a
	ld c, a
	inc hl
	ld e, l
	ld d, h
	ld b, SET_FLAG
	push hl
	call EventFlagAction
	pop hl
	ld a, [wCurBattleMon]
	dec a
	cp -1
	jr nz, .loop
	ret
	
PlayerHouseDebugText1:
	text  "#MON?"
	done
	
PlayerHouseDebugText2:
	text "KEY ITEMS?"
	done
	
PlayerHouseDebugText3:
	text "BADGES?"
	done
	
PlayerHouseDebugText4:
	text "TMs and HMs?"
	done
	
PlayerHouseDebugText5:
	text "DONE"
	done
	
PlayerHouseDebugText6:
	text "ITEMS?"
	done
	
PlayerHouseSunset:
	text "SUNSET BAY"
	done
	
PlayerHouseDaybreak:
	text "DAYBREAK VILLAGE"
	done
	
PlayerHouseGlint:
	text "GLINT CITY"
	done
	
PlayerHouseStarglow:
	text "STARGLOW VALLEY"
	done
	
PlayerHouseLakeOnwaR:
	text "LAKE ONWA"
	done
	
PlayerHouseLakeOnwaL:
	text "MT. ONWA CLIFF"
	done
	
PlayerHouseSunbeamIsland:
	text "SUNBEAM ISLAND"
	done
	
PlayerHouseOldManor:
	text "OLD MANOR"
	done
	
PlayerHouseEventideVillage:
	text "EVENTIDE VILLAGE"
	done
	
PlayerHouseFlickerStation:
	text "FLICKER STATION"
	done
	
PlayerHouseTwinkle:
	text "TWINKLE TOWN"
	done
	
PlayerHouseLuster:
	text "LUSTER CITY"
	done
	
PlayerHouseShimmer:
	text "PORT SHIMMER"
	done
	
PlayerHouseBrillo:
	text "PUEBLO BRILLO"
	done
	
PlayerHouseDesertTemple:
	text "DESERT TEMPLE"
	done
	
PlayerHouseRadiant:
	text "RADIANT TOWN"
	done
	
PlayerHouseDusk:
	text "DUSK TURNPIKE"
	done
	
PlayerHouseCrossroads:
	text "CROSSROADS"
	done
	
PlayerHouseKomore:
	text "KOMORE VILLAGE"
	done
	
PlayerHouseBright:
	text "BRIGHTBURG"
	done
	
PlayerHouseObscura:
	text "OBSCURA CITY"
	done
	
PlayerHouseUnderwaterTemple:
	text "UNDERWATER TEMPLE"
	done
	
PlayerHouseRoute32:
	text "ROUTE 11 BRIDGE"
	done
	
PlayerHouse2FInitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	callasm FixPlayerPalKrisHouse
	callasm SetHuntersThicketBalls
	addcellnum PHONE_MOM
	readvar VAR_PLAYER_GENDER
	if_equal CORY, .cory
	if_equal CORA, .cora
	if_equal PIPPI, .pippi
.cory
	setevent EVENT_PLAYER_IS_MALE
	clearevent EVENT_PLAYER_IS_FEMALE
	setevent EVENT_PLAYER_IS_CORY
	clearevent EVENT_PLAYER_IS_CORA
	clearevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_RED
	clearevent EVENT_PLAYER_IS_LEAF
	clearevent EVENT_PLAYER_IS_GOLD
	clearevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_CORY_NPC
	jump .done
.cora
	clearevent EVENT_PLAYER_IS_MALE
	setevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_CORY
	setevent EVENT_PLAYER_IS_CORA
	clearevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_RED
	clearevent EVENT_PLAYER_IS_LEAF
	clearevent EVENT_PLAYER_IS_GOLD
	clearevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_CORA_NPC
	jump .done
.pippi
	clearevent EVENT_PLAYER_IS_MALE
	setevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_CORY
	clearevent EVENT_PLAYER_IS_CORA
	setevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_RED
	clearevent EVENT_PLAYER_IS_LEAF
	clearevent EVENT_PLAYER_IS_GOLD
	clearevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_PIPPI_NPC
	jump .done
.red
	setevent EVENT_PLAYER_IS_MALE
	clearevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_CORY
	clearevent EVENT_PLAYER_IS_CORA
	clearevent EVENT_PLAYER_IS_PIPPI
	setevent EVENT_PLAYER_IS_RED
	clearevent EVENT_PLAYER_IS_LEAF
	clearevent EVENT_PLAYER_IS_GOLD
	clearevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_RED_NPC
	jump .done
.leaf
	clearevent EVENT_PLAYER_IS_MALE
	setevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_CORY
	clearevent EVENT_PLAYER_IS_CORA
	clearevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_RED
	setevent EVENT_PLAYER_IS_LEAF
	clearevent EVENT_PLAYER_IS_GOLD
	clearevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_LEAF_NPC
	jump .done
.gold
	setevent EVENT_PLAYER_IS_MALE
	clearevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_CORY
	clearevent EVENT_PLAYER_IS_CORA
	clearevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_RED
	clearevent EVENT_PLAYER_IS_LEAF
	setevent EVENT_PLAYER_IS_GOLD
	clearevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_GOLD_NPC
	jump .done
.kris
	clearevent EVENT_PLAYER_IS_MALE
	setevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_CORY
	clearevent EVENT_PLAYER_IS_CORA
	clearevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_RED
	clearevent EVENT_PLAYER_IS_LEAF
	clearevent EVENT_PLAYER_IS_GOLD
	setevent EVENT_PLAYER_IS_KRIS
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_KRIS_NPC
.done
	jumpstd initializeevents
	return

.SkipInizialization:
	return

PlayerHouse2FSetSpawn:
	special ToggleMaptileDecorations
	callasm PlayerHouseCheckPosterAsm
	ifnotequal 1, .done_poster
	moveperson PLAYERHOUSE2F_FRAME, 8, 0
	moveperson PLAYERHOUSE2F_MINA_MON, 8, 0
.done_poster
	callasm PlayerHouseCheckConsoleAsm
	ifequal 1, .snes
	ifequal 2, .n64
	clearevent EVENT_N64
	clearevent EVENT_SNES
	jump .done_console
.snes
	clearevent EVENT_N64
	setevent EVENT_SNES
	jump .done_console
.n64
	setevent EVENT_N64
	clearevent EVENT_SNES
.done_console
	checkdebugmode
	iffalse .skip_debug
	changeblock $2, $6, $23
.skip_debug
	return

PlayerHouseCheckPosterAsm:
	ld a, [wPoster]
	cp DECO_MINAS_PAINTING
	jr z, .yes
	xor a
	ld [wScriptVar], a
	ret
.yes
	ld a, 1
	ld [wScriptVar], a
	ret

PlayerHouseCheckConsoleAsm:
	ld a, [wConsole]
	cp DECO_SNES
	jr z, .snes
	cp DECO_N64
	jr z, .n64
	xor a
	ld [wScriptVar], a
	ret
.snes
	ld a, 1
	ld [wScriptVar], a
	ret
.n64
	ld a, 2
	ld [wScriptVar], a
	ret

QuestScrollingMenuAsm:
	ld a, [wLostGirls]
	push af
	xor a
	ld [wScriptVar], a
	ld a, NUM_DEBUG_QUEST_MENU_OPTIONS
	ld [wLostGirls], a
	call LoadStandardMenuDataHeader
	ld hl, QuestScrollingMenuDataHeader
	call CopyMenuDataHeader
	call InitScrollingMenu
	call UpdateSprites
	xor a
	ld [wMenuScrollPosition], a
	call ScrollingMenu
;	call CloseWindow
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .cancel
	ld a, [wScrollingMenuCursorPosition]
	inc a
	ld [wScriptVar], a
	xor a
	ld [wPlaceBallsX], a
	pop af
	ld [wLostGirls], a
	ret

.cancel
	xor a
	ld [wPlaceBallsX], a
	pop af
	ld [wLostGirls], a
	scf
	ret
	
QuestScrollingMenuDataHeader: ; 0x13550
	db $40 ; flags
	db 01, 01 ; start coords
	db 10, 18 ; end coords
	dw QuestScrollingMenuDataHeader2
	db 1 ; default option
; 0x13558

QuestScrollingMenuDataHeader2: ; 0x13558
	db $10 ; flags
	db 4, 0 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wLostGirls
	dba GetQuestScrollingMenuStrings
	dba NULL
	dba NULL
	
GetQuestScrollingMenuStrings:
	ld a, 1
	ld [wPlaceBallsX], a
	ld a, [wLostGirls]
	ld c, a
	ld a, [wScrollingMenuCursorPosition]
	cp c
	jr nz, .placestring
	call .placestring
	xor a
	ld [wPlaceBallsX], a
	ret
.placestring
	push de
	call GetString
	ld d, h
	ld e, l
	pop hl
	jp PlaceString

GetString: ; 13575
	push de
	ld e, a
	ld d, 0
	ld hl, QuestStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ret
	
QuestStrings:
	dw .Mina
	dw .Boy
	dw .Girls
	dw .BlackPearl1
	dw .BlackPearl2
	dw .AncientBall
	dw .Route11Bridge
	dw .Back
	
.Mina:				db "ACTIVATE MINA@"
.Boy:				db "RESCUE BOY@"
.Girls:				db "RESCUE GIRLS@"
.BlackPearl1:		db "BLACK PEARL 1@"
.BlackPearl2:		db "BLACK PEARL 2@"
.AncientBall:		db "ANCIENT BALL@"
.Route11Bridge:		db "ROUTE 11 BRIDGE@"
.Back:				db "BACK@"

PlayerHouseBookshelf:
	jumpstd picturebookshelf
	
GameConsole:
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .turnoff
	writetext GameConsoleText_AskTurnOnSnes
	yesorno
	iffalse .no
	writetext GameConsoleText_TurnOnSnes
	waitbutton
	closetext
	callasm GameConsoleSetMapMusic
	playmusic MUSIC_SNES_KIRBY
	pause 20
	opentext
	writetext GameConsoleText_Kirby
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	callasm GameConsoleForceTapePlayerOffAsm
	end
.turnoff
	writetext GameConsoleText_AskTurnOffKirby
	yesorno
	iffalse .no
	writetext GameConsoleText_TurnOffSnes
	waitbutton
	closetext
	pause 4
	callasm GameConsoleRestoreMapMusic
	playmapmusic
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end
.no
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
GameConsoleForceTapePlayerOffAsm:
	xor a
	ld [wTapePlayerActive], a
	ret
	
GameConsoleSetMapMusic:
	xor a
	jr GameConsoleMusic
GameConsoleRestoreMapMusic:
	ld a, MUSIC_SUNSET_BAY
GameConsoleMusic:
	ld [wMapMusic], a
	ret
	
PlayerHouseRadio:
	jumpstd radio1
	end

PlayerHousePC:
;	jumptext PlayerHousePCText
	opentext
	special Special_PlayerHousePC
	iftrue .Warp
	endtext
.Warp:
	warp NONE, 0, 0
	end

PlayerHouseCloset:
	opentext
	readvar VAR_PLAYER_GENDER
	if_equal PIPPI, .pippi
	writetext ChangeColorQuestionText
	yesorno
	iffalse .end
	writetext ChangeColorText
	waitbutton
	refreshscreen $0
	loadmenu .PlayerHouseChangeColorMenuData
	verticalmenu
	closewindow
	iffalse .end
	pause 10
	applymovement PLAYER, ChangeColorMovement1
	playsound SFX_TWINKLE
	callasm SetPlayerPalKrisHouse
	opentext
	writetext ChangeColorText2
	waitbutton
	closetext
	end
.pippi
	writetext PlayerHouseClosetPippiText
	waitbutton
.end
	closetext
	end

.PlayerHouseChangeColorMenuData: ; 0x48dfc
	db $40 ; flags
	db 00, 05 ; start coords
	db 16, 15 ; end coords
	dw .MenuData2PalKrisHouse
	db 1 ; default option
; 0x48e04

.MenuData2PalKrisHouse: ; 0x48e04
	db $80 ; flags
	db 7 ; items
	db "RED@"
	db "BLUE@"
	db "GREEN@"
	db "BROWN@"
	db "PURPLE@"
	db "TEAL@"
	db "PINK@"

ChangeColorMovement1:
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 12
	step_end
	
SunbeamWarp:
	domaptrigger SUNBEAM_ISLAND, $0
	warp SUNBEAM_ISLAND, 8, 51
	end
	
GameConsoleText_SMW:
	text "It's an SNES."
	
	para "A man wearing"
	line "overalls is riding"
	cont "a green dinosaur."
	done
	
GameConsoleText_AskTurnOnSnes:
	text "It's an SNES."
	
	para "Turn it on?"
	done
	
GameConsoleText_TurnOnSnes:
	text "<PLAYER> turned"
	line "on the SNES!"
	done
	
GameConsoleText_TurnOffSnes:
	text "<PLAYER> turned"
	line "off the SNES!"
	done
	
GameConsoleText_Kirby:
	text "A Pink Puff is"
	line "eating everything"
	cont "in its path."
	done
	
GameConsoleText_AskTurnOffKirby:
	text "A Pink Puff is"
	line "eating everything"
	cont "in its path."
	
	para "Turn off the SNES?"
	done
	
ChangeColorText:
	text "Select your"
	line "favorite color."
	done
	
ChangeColorText2:
	text "Lookin' good!"
	done
	
ChangeColorQuestionText:
	text "Change your"
	line "clothes?"
	done
	
PlayerHouseClosetPippiText:
	text "Don't be silly!"
	
	para "You aren't wearing"
	line "any clothes!"
	done
	
KrisRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisRadioText2:
	text "#MON CHANNEL!"
	done

KrisRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayerHousePCText:
	text "Your PC."
	
	para "It has a cool"
	line "desktop background"
	cont "you picked out"
	cont "yourself!"
	done

FixPlayerPalKrisHouse:
	ld a, [wPlayerPalette]
	inc a
	call ReceiveStartingClothes
	ret
	
SetHuntersThicketBalls:
	ld a, 5
	call RandomRange
	inc a
	ld [wHuntersDisguise], a
	ret
	
SetPlayerPalKrisHouse:
	ld a, [wMenuCursorY] ; 1 - 8
	sub $1
	ld [wPlayerPalette], a
	ld [wPlayerInitialPalette], a
	jp ReplaceKrisSprite
