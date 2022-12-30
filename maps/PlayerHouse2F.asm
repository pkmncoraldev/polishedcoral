PlayerHouse2F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, PlayerHouse2FInitializeRoom
	callback MAPCALLBACK_TILES, PlayerHouse2FSetSpawn

	db 14 ; warp events
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
	warp_event 13, 14, BRILLO_TOWN, 1
	warp_event 15, 14, ROUTE_11, 1

	db 1 ; coord events
	xy_trigger 0, 10, 17, 0, SunbeamWarp, 0, 0

	db 17 ; bg events
	bg_event  4,  1, SIGNPOST_UP, PlayerHousePC
	bg_event  5,  1, SIGNPOST_JUMPSTD, radio2
	bg_event  7,  1, SIGNPOST_READ, PlayerHouseBookshelf
	bg_event  3,  1, SIGNPOST_READ, PlayerHouseCloset
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

	db 3 ; object events
	object_event  6,  2, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_N64
	object_event  6,  2, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_N64
	object_event  6,  2, SPRITE_N64, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_SNES

	const_def 1 ; object constants
	const PLAYERHOUSE2F_SNES
	
PlayerHouseDebugPoster:
	opentext
	waitsfx
	writetext PlayerHouseDebugText1
	yesorno
	iffalse .items
	givepoke MUK_A, 100
	givepoke POLIWAG, 100

.items
	writetext PlayerHouseDebugText6
	yesorno
	iffalse .keyitems
	giveitem LUM_BERRY, 1
	giveitem RAWST_BERRY, 1
	giveitem PERSIM_BERRY, 1
	giveitem PP_UP, 99
	giveitem CHOICE_SCARF, 1
	giveitem QUICK_POWDER, 1
	giveitem KINGS_ROCK, 1
	giveitem THICK_CLUB, 1
	giveitem PAINTBRUSH, 1
	giveitem LINK_CABLE, 99
	giveitem UP_GRADE, 2
	giveitem RARE_CANDY, 99
	giveitem PROTEIN, 99
	giveitem EXP_SHARE, 99
	giveitem BIG_MALASADA, 3
	giveitem THUNDERSTONE, 3
	giveitem FIRE_STONE, 3
	giveitem LEAF_STONE, 3
	giveitem WATER_STONE, 3
	giveitem DAWN_STONE, 3
	giveitem DUSK_STONE, 3
	giveitem MASTER_BALL, 10
	giveitem BLOSSOM_TEA, 3
	giveitem FLOWER_PETAL, 6
	giveitem COVER_FOSSIL, 1
	giveitem PLUME_FOSSIL, 1
	giveitem OLD_AMBER, 1
	giveitem EVERSTONE, 1
	givetmhm TM_FAKE_OUT
	givetmhm TM_METAL_CLAW
	givetmhm TM_BULLDOZE
	givetmhm TM_RAIN_DANCE
	givetmhm TM_CHARM
	givetmhm TM_FIRE_PUNCH
	givetmhm TM_THUNDERPUNCH
	givetmhm TM_ICE_PUNCH
	givetmhm TM_ROOST
	givetmhm TM_HAIL
	givetmhm TM_DIG
	givetmhm TM_SUNNY_DAY
	givetmhm TM_WILL_O_WISP
	givetmhm TM_CURSE
	givetmhm TM_WORK_UP_GROWTH
	givetmhm TM_STEEL_WING
.keyitems
	writetext PlayerHouseDebugText2
	yesorno
	iffalse .badges
;	loadwildmon BLISSEY, 100
;	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
;	startbattle
	setflag ENGINE_TRAINER_CARD
	setflag ENGINE_POKEDEX
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setevent EVENT_RUNNING_SHOES
	setevent EVENT_BIKE_UPGRADED
	addcellnum PHONE_MOM
	addcellnum PHONE_SPRUCE
	setevent EVENT_MOM_GOT_POKEGEAR
	giveitem SKATEBOARD
	giveitem BICYCLE
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
	givecoins 20
	setevent EVENT_KNOW_OLLIE
	setevent EVENT_KNOW_GRIND
	callasm FillPokedex
.badges
	writetext PlayerHouseDebugText3
	yesorno
	iffalse .hms
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
	setflag ENGINE_READ_CHUCK_JOURNAL
	setflag ENGINE_READ_JASMINE_JOURNAL
	setflag ENGINE_READ_PRYCE_JOURNAL
	setflag ENGINE_READ_CLAIR_JOURNAL
	domaptrigger FLICKER_STATION, 1
.hms
	writetext PlayerHouseDebugText4
	yesorno
	iffalse .done
	setflag ENGINE_GOT_ROCK_SMASH
	setflag ENGINE_GOT_CUT
	setflag ENGINE_GOT_FLY
	givetmhm HM_ROCK_SMASH
	givetmhm HM_CUT
	givetmhm HM_FLY	
.done
	writetext PlayerHouseDebugText5
	waitbutton
	closetext
	end
	
FillPokedex:
	ld hl, wPokedexSeen
	call .Fill
	ld hl, wPokedexCaught
.Fill:
	ld a, %11111111
	ld bc, 31 ; 001-248
	call ByteFill
	ret
	
PlayerHouseDebugText1:
	text "DEBUG POSTER"
	
	para "#MON?"
	done
	
PlayerHouseDebugText2:
	text "KEY ITEMS?"
	done
	
PlayerHouseDebugText3:
	text "BADGES?"
	done
	
PlayerHouseDebugText4:
	text "HMs?"
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
	
PlayerHouse2FInitializeRoom:
;	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	callasm FixPlayerPalKrisHouse
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_CORY
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_CORA
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_PIPPI
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_RED
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_LEAF
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_GOLD
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
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_KRIS
.done
	jumpstd initializeevents
	return

.SkipInizialization:
	return

PlayerHouse2FSetSpawn:
;	special ToggleMaptileDecorations
	checkdebugmode
	iffalse .skip_debug
	changeblock $4, $6, $2c
.skip_debug
	checkevent EVENT_N64
	iftrue .n64
	return
.n64
	changeblock $6, $0, $2b
	changeblock $6, $2, $2a
	return

PlayerHouseBookshelf:
	jumpstd picturebookshelf
	
GameConsole:
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
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
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
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
	special RestartMapMusic
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
.no
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
GameConsoleSetMapMusic:
	xor a
	jr GameConsoleMusic
GameConsoleRestoreMapMusic:
	ld a, MUSIC_SUNSET_BAY
GameConsoleMusic:
	ld [wMapMusic], a
	ret
	
PlayerHouseRadio:
;	jumpstd radio1
	end

PlayerHousePC:
	jumptext PlayerHousePCText
;	opentext
;	special Special_PlayerHousePC
;	endtext

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
	
SetPlayerPalKrisHouse:
	ld a, [wMenuCursorY] ; 1 - 8
	sub $1
	ld [wPlayerPalette], a
	ld [wPlayerInitialPalette], a
	jp ReplaceKrisSprite
	