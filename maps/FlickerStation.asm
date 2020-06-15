FlickerStation_MapScriptHeader:
	db 3 ; scene scripts
	scene_script FlickerStationTrigger0
	scene_script FlickerStationTrigger1
	scene_script FlickerStationTrigger2

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, FlickerStationFlypointCallback
	callback MAPCALLBACK_OBJECTS, FlickerStationGirlMove

	db 7 ; warp events
	warp_def 27, 37, 1, FLICKER_POKECENTER
	warp_def 13, 35, 1, FLICKER_MART
	warp_def 13, 43, 1, FLICKER_SOUND_SPEECH_HOUSE
	warp_def 13, 53, 1, FLICKER_NAME_SPEECH_HOUSE
	warp_def 27, 51, 1, FLICKER_TRAIN_STATION
	warp_def 27, 52, 2, FLICKER_TRAIN_STATION
	warp_def  5, 51, 1, FLICKER_PASS_1F
	

	db 2 ; coord events
	xy_trigger 0, 26,  9, 0, FlickerStation3Girls, 0, 0
	xy_trigger 1, 26, 14, 0, FlickerStation3GirlsExtra, 0, 0

	db 9 ; bg events
	signpost 27, 38, SIGNPOST_READ, FlickerCenterSign
	signpost 13, 36, SIGNPOST_READ, FlickerMartSign
	signpost 33, 40, SIGNPOST_READ, FlickerSign
	signpost 19, 20, SIGNPOST_UP, FlickerTrainDoor
	signpost 19, 17, SIGNPOST_UP, FlickerTrainDoor
	signpost 16, 21, SIGNPOST_UP, FlickerTrainDoor
	signpost 16, 18, SIGNPOST_UP, FlickerTrainDoor
	signpost 13, 20, SIGNPOST_UP, FlickerTrainDoor
	signpost 13, 17, SIGNPOST_UP, FlickerTrainDoor

	db 12 ; object events
	person_event SPRITE_FAT_GUY, 28, 54, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 30, 43, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationNPC2, -1
	person_event SPRITE_CHILD, 16, 49, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC3, -1
	person_event SPRITE_SCHOOLGIRL, 16, 50, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC4, -1
	person_event SPRITE_YOUNGSTER, 14, 38, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC5, -1
	person_event SPRITE_COOL_DUDE, 33, 55, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, FlickerStationNPC6, -1
	person_event SPRITE_HIKER, 11, 48, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC7, -1
	person_event SPRITE_DELINQUENT_F, 24,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationGirl1, -1
	person_event SPRITE_DELINQUENT_F, 26,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationGirl2, -1
	person_event SPRITE_DELINQUENT_F, 29,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationGirl3, -1
	tmhmball_event  7, 28, TM_THUNDERPUNCH, 1, EVENT_FLICKER_STATION_
	itemball_event 41,  8, POTION, 1, EVENT_FLICKER_STATION_POKEBALL


	const_def 1 ; object constants
	const FLICKER_STATION_NPC1
	const FLICKER_STATION_NPC2
	const FLICKER_STATION_NPC3
	const FLICKER_STATION_NPC4
	const FLICKER_STATION_NPC5
	const FLICKER_STATION_NPC6
	const FLICKER_STATION_NPC7
	const FLICKER_STATION_TRAINER1
	const FLICKER_STATION_TRAINER2
	const FLICKER_STATION_TRAINER3
	
FlickerStationTrigger0:
	end
	
FlickerStationTrigger1:
	end
	
FlickerStationTrigger2:
	end
	
FlickerStationPlayerSeatAsm:
	ld hl, rIE
    res LCD_STAT, [hl]
    xor a
    ld [hLCDTrain], a
    ld a, $B0
    ld [hWY], a
	ld a, 7
    ld [hWX], a
	ld a, PLAYER_SITTING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
FlickerStationFlypointCallback:
	setflag ENGINE_FLYPOINT_FLICKER
	return
	
FlickerStationGirlMove:
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_2
	iffalse .end
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	dotrigger $2
.end
	return
	
FlickerStation3Girls:
	special Special_StopRunning
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_1
	iftrue .skiptrainer1
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER1,  30
	applyonemovement FLICKER_STATION_TRAINER1, step_down
	spriteface PLAYER, UP
	opentext
	writetext TrainerFlickerStation_1SeenText
	waitbutton
	closetext
	winlosstext TrainerFlickerStation_1BeatenText, 0
	setlasttalked FLICKER_STATION_TRAINER1
	loadtrainer DELINQUENT_F, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_1

.skiptrainer1
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_3
	iftrue .skiptrainer3
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER3,  30
	applymovement FLICKER_STATION_TRAINER3, Movement_FlickerStation3Girls2
	spriteface PLAYER, DOWN
	opentext
	writetext TrainerFlickerStation_3SeenText
	waitbutton
	closetext
	winlosstext TrainerFlickerStation_3BeatenText, 0
	setlasttalked FLICKER_STATION_TRAINER3
	loadtrainer DELINQUENT_F, 4
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_3
	
.skiptrainer3
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER2,  30
	applymovement FLICKER_STATION_TRAINER2, Movement_FlickerStation3Girls3
	spriteface PLAYER, LEFT
	opentext
	writetext TrainerFlickerStation_2SeenText
	waitbutton
	closetext
	winlosstext TrainerFlickerStation_2BeatenText, 0
	setlasttalked FLICKER_STATION_TRAINER2
	loadtrainer DELINQUENT_F, 3
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GLINT_GROVE
	setevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_2
	dotrigger $1
	end
	
FlickerStation3GirlsExtra:
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	dotrigger $2
	end
	
FlickerTrainDoor:
	jumptext FlickerTrainDoorText
	
FlickerSign:
	jumptext FlickerSignText
	
FlickerCenterSign:
	jumpstd pokecentersign

FlickerMartSign:
	jumpstd martsign
	
FlickerStationGirl1:
	jumptextfaceplayer TrainerFlickerStation_1NormalText
	
FlickerStationGirl2:
	checkevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	iftrue .skip
	faceplayer
	opentext
	writetext TrainerFlickerStation_2NormalText1
	waitbutton
	closetext
	applyonemovement FLICKER_STATION_TRAINER2, step_left
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	end
	
.skip
	jumptextfaceplayer TrainerFlickerStation_2NormalText2
	
FlickerStationGirl3:
	jumptextfaceplayer TrainerFlickerStation_3NormalText
	
FlickerStationNPC1:
	faceplayer
	opentext
	writetext FlickerStationNPC1Text
	waitbutton
	spriteface FLICKER_STATION_NPC1, DOWN
	closetext
	end
	
FlickerStationNPC2:
	jumptextfaceplayer FlickerStationNPC2Text
	
FlickerStationNPC3:
	faceplayer
	opentext
	writetext FlickerStationNPC3Text
	waitbutton
	spriteface FLICKER_STATION_NPC3, DOWN
	closetext
	end
	
FlickerStationNPC4:
	faceplayer
	opentext
	writetext FlickerStationNPC4Text
	waitbutton
	spriteface FLICKER_STATION_NPC4, DOWN
	closetext
	end
	
FlickerStationNPC5:
	jumptextfaceplayer FlickerStationNPC5Text
	
FlickerStationNPC6:
	jumptextfaceplayer FlickerStationNPC6Text
	
FlickerStationNPC7:
	jumptextfaceplayer FlickerStationNPC7Text
	
FlickerTrainDoorText:
	text "It's shut tight."
	done
	
FlickerSignText:
	text "FLICKER STATION"
	
	para "The charming por-"
	line "tal to prosperity."
	done
	
FlickerStationNPC6Text:
	text "The train station"
	line "recently reopened."
	
	para "It was closed for"
	line "renovations."
	
	para "How inconvenient!"
	done
	
FlickerStationNPC1Text:
	text "This town may"
	line "seem sleepy, but"
	cont "the trains here"
	cont "are no joke."
	
	para "They're seriously"
	line "fast!"
	done
	
FlickerStationNPC2Text:
	text "The train here"
	line "runs to LUSTER"
	cont "CITY."
	
	para "This little town"
	line "is kinda like a"
	cont "gateway to the"
	cont "biggest city in"
	cont "ONWA!"
	done
	
FlickerStationNPC3Text:
	text "Woah!"

	para "Look at the"
	line "trains!"
	
	para "So cool!"
	done
	
FlickerStationNPC4Text:
	text "All he talks about"
	line "is trains…"
	
	para "Trains, trains,"
	line "trains!"
	
	para "I hate trains!"
	done
	
FlickerStationNPC5Text:
	text "I'm so tired of"
	line "dirt roads."
	
	para "I keep getting"
	line "gravel in my"
	cont "shoes."
	
	para "I just want to go"
	line "to the city!"
	done
	
FlickerStationNPC7Text:
	text "That cave leads"
	line "up higher in the"
	cont "mountains."
	
	para "It gets pretty"
	line "chilly up there,"
	cont "so be prepared."
	done
	
FlickerStationAllAboardText:
	text "All aboard!"
	
	para "Train heading to"
	line "LUSTER CITY is"
	cont "now departing!"
	done
	
TrainerFlickerStation_1SeenText:
	text "SEEN TEXT"
	done
	
TrainerFlickerStation_1BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerStation_1NormalText:
	text "NORMAL TEXT"
	done
	
TrainerFlickerStation_2SeenText:
	text "SEEN TEXT"
	done
	
TrainerFlickerStation_2BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerStation_2NormalText1:
	text "NORMAL TEXT"
	
	para "Huh?"
	
	para "Oh."
	
	para "You want to get"
	line "by?"
	
	para "Right…"
	done
	
TrainerFlickerStation_2NormalText2:
	text "NORMAL TEXT"
	done
	
TrainerFlickerStation_3SeenText:
	text "SEEN TEXT"
	done
	
TrainerFlickerStation_3BeatenText:
	text "BEATEN TEXT"
	done
	
TrainerFlickerStation_3NormalText:
	text "NORMAL TEXT"
	done
	
Movement_FlickerStationOfficer:
	step_left
	step_up
	step_end
	
Movement_FlickerStationTrainCamera:
	slow_step_up
	slow_step_right
	step_end
	
Movement_FlickerStation3Girls2:
	step_up
	step_up
	step_end
	
Movement_FlickerStation3Girls3:
	step_right
	step_right
	step_right
	step_end
	