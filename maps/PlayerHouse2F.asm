PlayerHouse2F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, PlayerHouse2FInitializeRoom
	callback MAPCALLBACK_TILES, PlayerHouse2FSetSpawn

	db 22 ; warp events
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

	db 1 ; coord events
	xy_trigger 0, 10, 17, 0, SunbeamWarp, 0, 0

	db 28 ; bg events
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
	if_equal $3, .Key
	if_equal $4, .badges
	closewindow
.page2
	loadmenu .PlayerHouseDebugMenu2Data
	verticalmenu
	iffalse .end
	if_equal $1, .tms
	if_equal $2, .Sfx
	if_equal $3, .mina
	if_equal $4, .girls
	closewindow
	jump .page1
.Mons
	closewindow
	waitsfx
	givepoke CHARIZARD, 30
	givepoke HYPNO, 99
	givepoke EEVEE, 99
	jump .return
.Items
	closewindow
	writetext PlayerHouseDebug2ItemsText
	waitbutton
	giveitem CORAL_SHARD, 99
	giveitem GOLD_TEA, 99
	giveitem SILVER_TEA, 99
	giveitem GOLD_LEAF, 99
	giveitem SILVER_LEAF, 99
	giveitem MAGMARIZER, 99
	giveitem ELECTIRIZER, 99
	giveitem NUGGET, 99
	giveitem BIG_NUGGET, 99
	giveitem MOOMOO_BREW, 99
	giveitem RARE_CANDY, 99
	giveitem FIVESTARHELM, 1
	giveitem SWEET_HONEY, 1
	giveitem BLOSSOM_TEA, 3
	giveitem SUNSHINE_TEA, 99
	giveitem PEARL, 99
	giveitem BIG_PEARL, 99
	giveitem LEAF_STONE, 99
	giveitem FIRE_STONE, 99
	giveitem WATER_STONE, 99
	giveitem THUNDERSTONE, 99
	giveitem MOON_STONE, 99
	giveitem POKE_DOLL, 99
	giveitem STARDUST, 99
	giveitem FRESH_WATER, 99
	giveitem SODA_POP, 99
	giveitem LEMONADE, 99
	giveitem MOOMOO_MILK, 99
	giveitem BOTTLE_CAP, 99
	giveitem RAGECANDYBAR, 99
	giveitem LUCKY_EGG, 99
	giveitem HP_UP, 99
	giveitem PROTEIN, 99
	giveitem IRON, 99
	giveitem CARBOS, 99
	giveitem CALCIUM, 99
	giveitem ZINC, 99
	giveitem PP_UP, 99
	giveitem PP_MAX, 99
	giveitem ETHER, 99
	giveitem MAX_ETHER, 99
	giveitem ELIXIR, 99
	giveitem MAX_ELIXIR, 99
	giveitem REVIVE, 99
	giveitem MAX_REVIVE, 99
	giveitem FULL_HEAL, 99
	giveitem ANTIDOTE, 99
	giveitem BURN_HEAL, 99
	giveitem PARALYZEHEAL, 99
	giveitem AWAKENING, 99
	giveitem ICE_HEAL, 99
	giveitem FULL_RESTORE, 99
	giveitem MAX_POTION, 99
	giveitem POTION, 99
	giveitem SUPER_POTION, 99
	giveitem HYPER_POTION, 99
	giveitem REPEL, 99
	giveitem SUPER_REPEL, 99
	giveitem MAX_REPEL, 99
	giveitem AMULET_COIN, 1
	giveitem BIG_MALASADA, 1
	giveitem BERRY_JUICE, 1
	giveitem FLOWER_PETAL, 6
	giveitem BLOSSOM_TEA, 3
	giveitem SUNSHINE_TEA, 99
	giveitem PAINTBRUSH, 99
	giveitem COVER_FOSSIL
	giveitem PLUME_FOSSIL
	
	giveitem MASTER_BALL, 99
	giveitem POKE_BALL, 99
	giveitem GREAT_BALL, 99
	giveitem ULTRA_BALL, 99
;	giveitem SAFARI_BALL, 99
	giveitem LEVEL_BALL, 99
	giveitem LURE_BALL, 99
	giveitem MOON_BALL, 99
	giveitem FRIEND_BALL, 99
	giveitem FAST_BALL, 99
	giveitem HEAVY_BALL, 99
	giveitem LOVE_BALL, 99
;	giveitem PARK_BALL, 99
	giveitem REPEAT_BALL, 99
	giveitem TIMER_BALL, 99
	giveitem NEST_BALL, 99
	giveitem NET_BALL, 99
	giveitem DIVE_BALL, 99
	giveitem LUXURY_BALL, 99
	giveitem HEAL_BALL, 99
	giveitem QUICK_BALL, 99
	giveitem DUSK_BALL, 99
	giveitem PREMIER_BALL, 99
	giveitem CHERISH_BALL, 99
	jump .return
.Key
	closewindow
	writetext PlayerHouseDebug2KeyText
	waitbutton
	setflag ENGINE_TRAINER_CARD
	setflag ENGINE_POKEDEX
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setevent EVENT_RUNNING_SHOES
	setevent EVENT_BIKE_UPGRADED
	addcellnum PHONE_MOM
	addcellnum PHONE_SPRUCE
	addcellnum PHONE_WENDY
	addcellnum PHONE_AUTO
	setevent EVENT_MOM_GOT_POKEGEAR
	giveitem TAPE_PLAYER
	giveitem SKATEBOARD
	giveitem BICYCLE
	giveitem BLACK_PEARL
	giveitem B_ROOM_KEY
	giveitem R_ROOM_KEY
	giveitem Y_ROOM_KEY
	giveitem ANCIENT_BALL
	giveitem ITEMFINDER
	giveitem POLLEN_POUCH
	giveitem LIBRARY_CARD
	giveitem POKE_FLUTE
	giveitem OLD_ROD
	giveitem GOOD_ROD
	giveitem RIVAL_POKEDEX
	giveitem OVAL_CHARM
	giveitem COIN_CASE
	giveitem TRAIN_TICKET
	giveitem TRAIN_PASS
	giveitem TORCH
	giveitem CLAY_POT
	giveitem NETT_SPECS
	givecoins 20
	setevent EVENT_KNOW_OLLIE
	setevent EVENT_KNOW_GRIND
	callasm FillPokedex
	special InitRoamMoltres
	callasm UnlockSongs
	setevent EVENT_TALKED_TO_TENT_GUY_WITH_TREASURE
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
	givetmhm TM_DIVE
	givetmhm TM_FIRE_BLAST
	givetmhm TM_FAKE_OUT
	givetmhm TM_SUBSTITUTE
	givetmhm TM_WEATHER_BALL
	givetmhm TM_STEEL_WING
	givetmhm TM_ROOST
	givetmhm TM_WILL_O_WISP
	givetmhm TM_ACROBATICS
	givetmhm TM_GIGA_IMPACT
	givetmhm TM_SAND_ATTACK_SMOKESCREEN_FLASH
	givetmhm TM_ANCIENTPOWER
	givetmhm TM_THUNDERPUNCH
	givetmhm TM_FIRE_PUNCH
	givetmhm TM_ICE_PUNCH
	givetmhm HM_CUT
	givetmhm HM_FLY
	givetmhm HM_SURF
	givetmhm HM_ROCK_SMASH
	givetmhm HM_ROCK_CLIMB
	givetmhm HM_STRENGTH
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
.Sfx
	closewindow
	callasm PlayerRoomSfxTest
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
	db $80 ; flags
	db 5 ; items
	db "#MON@"
	db "ITEMS@"
	db "KEY ITEMS@"
	db "BADGES@"
	db "PAGE 2@"
	
.PlayerHouseDebugMenu2Data: ; 0x48dfc
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2PlayerHouseDebug2
	db 1 ; default option
; 0x48e04

.MenuData2PlayerHouseDebug2: ; 0x48e04
	db $80 ; flags
	db 5 ; items
	db "TMs/HMs@"
	db "SFX TEST@"
	db "ACTIVATE MINA@"
	db "RESCUE GIRLS@"
	db "PAGE 1@"
	
PlayerHouseDebug2ItemsText:
	text "Obtained"
	line "ITEMS."
	done
	
PlayerHouseDebug2KeyText:
	text "Obtained"
	line "KEY ITEMS."
	done
	
PlayerHouseDebug2BadgeText:
	text "Obtained all"
	line "BADGES."
	done
	
PlayerHouseDebug2TMText:
	text "Obtained all"
	line "TMs and HMs."
	done
	
PlayerHouseDebug2MinaText:
	text "MINA quest"
	line "started."
	done
	
PlayerHouseDebug2GirlsText:
	text "RADIANT TOWN"
	line "girls rescued."
	done
	
PlayerRoomSfxTest:
	call WaitSFX
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
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
	jr .drawnumbers
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
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	jr .loop
.end
	ld a, [wMapMusic]
	ld e, a
	ld d, 0
	call PlayMusic
	xor a
	ld [wPlaceBallsX], a
	pop af
	ld [hInMenu], a
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
.up
	ld a, [wPlaceBallsX]
	cp NUM_SFX
	jr nz, .cont_up
	xor a
	ld [wPlaceBallsX], a
	jr .drawnumbers
.cont_up
	inc a
	ld [wPlaceBallsX], a
	jr .drawnumbers
.down
	ld a, [wPlaceBallsX]
	cp 0
	jr nz, .cont_down
	ld a, NUM_SFX
	ld [wPlaceBallsX], a
	jr .drawnumbers
.cont_down
	dec a
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
	db "B:Quit@"
	
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
;	jumpstd radio1
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
	