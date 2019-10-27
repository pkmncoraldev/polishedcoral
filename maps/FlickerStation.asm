FlickerStation_MapScriptHeader:
	db 4 ; scene scripts
	scene_script FlickerStationTrigger0
	scene_script FlickerStationTrigger1
	scene_script FlickerStationTrigger2
	scene_script FlickerStationTrigger3

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, FlickerStationFlypointCallback
	callback MAPCALLBACK_OBJECTS, FlickerStationGirlMove

	db 7 ; warp events
	warp_def 27, 39, 1, FLICKER_POKECENTER
	warp_def 13, 37, 1, FLICKER_MART
	warp_def 13, 47, 1, FLICKER_SOUND_SPEECH_HOUSE
	warp_def 13, 59, 1, FLICKER_NAME_SPEECH_HOUSE
	warp_def 25, 53, 1, FLICKER_TRAIN_STATION
	warp_def 25, 54, 2, FLICKER_TRAIN_STATION
	warp_def 18, 55, 3, FLICKER_TRAIN_STATION

	db 2 ; coord events
	xy_trigger 0, 26,  9, 0, FlickerStation3Girls, 0, 0
	xy_trigger 1, 26, 14, 0, FlickerStation3GirlsExtra, 0, 0

	db 9 ; bg events
	signpost 27, 40, SIGNPOST_READ, FlickerCenterSign
	signpost 13, 38, SIGNPOST_READ, FlickerMartSign
	signpost 33, 43, SIGNPOST_READ, FlickerSign
	signpost 19, 22, SIGNPOST_READ, FlickerTrainDoor
	signpost 19, 19, SIGNPOST_READ, FlickerTrainDoor
	signpost 16, 23, SIGNPOST_READ, FlickerTrainDoor
	signpost 16, 20, SIGNPOST_READ, FlickerTrainDoor
	signpost 13, 22, SIGNPOST_READ, FlickerTrainDoor
	signpost 13, 19, SIGNPOST_READ, FlickerTrainDoor

	db 10 ; object events
	person_event SPRITE_FAT_GUY, 26, 56, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 30, 45, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationNPC2, -1
	person_event SPRITE_BUG_CATCHER, 16, 51, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC3, -1
	person_event SPRITE_SCHOOLGIRL, 16, 52, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC4, -1
	person_event SPRITE_YOUNGSTER, 14, 41, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, FlickerStationNPC5, -1
	person_event SPRITE_COOL_DUDE, 31, 57, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, FlickerStationNPC6, -1
	person_event SPRITE_DELINQUENT_F, 24,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationGirl1, -1
	person_event SPRITE_DELINQUENT_F, 26,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationGirl2, -1
	person_event SPRITE_DELINQUENT_F, 29,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationGirl3, -1


	const_def 1 ; object constants
	const FLICKER_STATION_NPC1
	const FLICKER_STATION_NPC2
	const FLICKER_STATION_NPC3
	const FLICKER_STATION_NPC4
	const FLICKER_STATION_NPC5
	const FLICKER_STATION_NPC6
	const FLICKER_STATION_TRAINER1
	const FLICKER_STATION_TRAINER2
	const FLICKER_STATION_TRAINER3
	
FlickerStationTrigger0:
	end
	
FlickerStationTrigger1:
	end
	
FlickerStationTrigger2:
	end
	
FlickerStationTrigger3:
	opentext
	writetext FlickerStationAllAboardText
	waitbutton
	closetext
	callasm FlickerStationTrainThing
	dotrigger $2
	end
	
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
	
FlickerStationTrainThing:
	ld hl, rIE
	set LCD_STAT, [hl]
	xor a
	ld [hWX], a
	ld a, 64
	ld [hWY], a
	ld a, 1
	ld [hLCDTrain], a
	ret
	nop
	
FlickerStation3Girls:
	special Special_StopRunning
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_1
	iftrue .skiptrainer1
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER1,  30
	applymovement FLICKER_STATION_TRAINER1, Movement_FlickerStation3Girls1
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
	applymovement FLICKER_STATION_TRAINER2, Movement_FlickerStation3Girls4
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	end
	
.skip
	jumptextfaceplayer TrainerFlickerStation_2NormalText2
	
FlickerStationGirl3:
	jumptextfaceplayer TrainerFlickerStation_3NormalText
	
FlickerStationNPC1:
	jumptextfaceplayer FlickerStationNPC1Text
	
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
	
	para "the trains here"
	line "are no joke."
	
	para "They're seriously"
	line "fast!"
	done
	
FlickerStationNPC2Text:
	text "The train here"
	line "runs to LUSTER"
	cont "CITY."
	
	para "This little town"
	line "is kinda like a"
	
	para "gateway to the"
	line "biggest city in"
	cont "ONWA!"
	done
	
FlickerStationNPC3Text:
	text "Woah!"

	para "Look a the trains!"
	
	para "So cool!"
	done
	
FlickerStationNPC4Text:
	text "All he talks about"
	line "is trains…"
	
	para "I'm so bored of"
	line "trains!"
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
	
FlickerStationAllAboardText:
	text "All aboard!"
	
	para "Next stop:"
	line "LUSTER CITY!"
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
	
Movement_FlickerStation3Girls1:
	step_down
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
	
Movement_FlickerStation3Girls4:
	step_left
	step_end
