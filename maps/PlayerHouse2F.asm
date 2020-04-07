PlayerHouse2F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, PlayerHouse2FInitializeRoom
	callback MAPCALLBACK_TILES, PlayerHouse2FSetSpawn

	db 12 ; warp events
	warp_event  9,  0, PLAYER_HOUSE_1F, 3
	warp_event  5, 10, SUNSET_BAY, 1
	warp_event  7, 10, DAYBREAK_VILLAGE, 1
	warp_event  9, 10, GLINT_CITY, 1
	warp_event 11, 10, STARGLOW_VALLEY, 1
	warp_event 13, 10, LAKE_ONWA, 1
	warp_event 15, 10, MT_ONWA_CLIFF, 1
	warp_event 19, 10, EVENTIDE_FOREST, 1
	warp_event  5, 14, ROUTE_9, 3
	warp_event  7, 14, FLICKER_STATION, 1
	warp_event  9, 14, TWINKLE_TOWN, 1
	warp_event 11, 14, LUSTER_CITY_SHOPPING, 1

	db 1 ; coord events
	xy_trigger 0, 10, 17, 0, SunbeamWarp, 0, 0

	db 17 ; bg events
	bg_event  4,  1, SIGNPOST_UP, PlayerHousePC
	bg_event  5,  1, SIGNPOST_READ, PlayerHouseRadio
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
	bg_event 18, 10, SIGNPOST_JUMPTEXT, PlayerHouseEventideForest
	bg_event  4, 14, SIGNPOST_JUMPTEXT, PlayerHouseRoute9
	bg_event  6, 14, SIGNPOST_JUMPTEXT, PlayerHouseFlickerStation
	bg_event  8, 14, SIGNPOST_JUMPTEXT, PlayerHouseTwinkle
	bg_event 10, 14, SIGNPOST_JUMPTEXT, PlayerHouseLuster

	db 1 ; object events
	object_event  6,  2, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, -1

	const_def 1 ; object constants
	const PLAYERHOUSE2F_SNES
	
PlayerHouseDebugPoster:
	opentext
	waitsfx
	playsound SFX_BUMP_SNOWSTORM
	writetext PlayerHouseMapsText
	waitbutton
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
;	setflag ENGINE_FIRSTBADGE
;	setflag ENGINE_SECONDBADGE
;	setflag ENGINE_THIRDBADGE
;	setflag ENGINE_FOURTHBADGE
;	setflag ENGINE_SIXTHBADGE
;	setflag ENGINE_FIFTHBADGE
;	setflag ENGINE_SEVENTHBADGE
;	setflag ENGINE_EIGHTHBADGE
	addcellnum PHONE_MOM
	addcellnum PHONE_SPRUCE
	setevent EVENT_MOM_GOT_POKEGEAR
	givepoke CORSOLA, 100
	givepoke CHARMANDER, 100
	giveitem LIBRARY_CARD
	giveitem POKE_FLUTE
	giveitem BICYCLE
	giveitem OLD_ROD
	giveitem GOOD_ROD
x = 0
rept NUM_TMS + NUM_HMS
	givetmhm x
x = x + 1
endr
	closetext
	end
	
PlayerHouseMapsText:
	text "TEST EVENT"
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
	
PlayerHouseEventideForest:
	text "EVENTIDE FOREST"
	done
	
PlayerHouseRoute9:
	text "DODRIO RANCH"
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
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .pippi
	setevent EVENT_PLAYER_IS_MALE
	clearevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_PIPPI
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_CHRIS
	jump .done
.girl
	setevent EVENT_PLAYER_IS_FEMALE
	clearevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_MALE
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_KRIS
	jump .done
.pippi
	setevent EVENT_PLAYER_IS_PIPPI
	clearevent EVENT_PLAYER_IS_MALE
	clearevent EVENT_PLAYER_IS_FEMALE
	variablesprite SPRITE_PLAYER_CUTSCENE, SPRITE_PIPPI
.done
	jumpstd initializeevents
	return

.SkipInizialization:
	return

PlayerHouse2FSetSpawn:
;	special ToggleMaptileDecorations
	return

PlayerHouseBookshelf:
	jumpstd picturebookshelf
	
GameConsole:
	pause 4
	playmusic MUSIC_SNES_KIRBY
	opentext
	writetext GameConsoleText_Kirby
	waitbutton
	closetext
	special RestartMapMusic
	end
	
PlayerHouseRadio:
	jumpstd radio1

PlayerHousePC:
	opentext
	special Special_PlayerHousePC
	endtext

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
	warp SUNBEAM_ISLAND, 8, 49
	end
	
GameConsoleText_SMW:
	text "It's an SNES."
	
	para "A man wearing"
	line "overalls is riding"
	cont "a green dinosaur."
	done
	
GameConsoleText_Kirby:
	text "It's an SNES."
	
	para "A Pink Puff is"
	line "eating everything"
	cont "in its path."
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

FixPlayerPalKrisHouse:
;	ld a, [wPlayerPalette]
;	add $1
;	ld [wPlayerInitialPalette], a
	ret
	
SetPlayerPalKrisHouse:
	ld a, [wMenuCursorY] ; 1 - 8
	sub $1
	ld [wPlayerPalette], a
	add $1	;prevents respawn as another color when fainting. why?????
	ld [wPlayerInitialPalette], a
	ret