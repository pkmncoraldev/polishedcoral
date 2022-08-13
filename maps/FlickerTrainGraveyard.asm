FlickerTrainGraveyard_MapScriptHeader:
	db 3 ; scene scripts
	scene_script FlickerTrainGraveyardTrigger0
	scene_script FlickerTrainGraveyardTrigger1
	scene_script FlickerTrainGraveyardTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, FlickerTrainGraveyardGirlMove

	db 0 ; warp events

	db 3 ; coord events
	xy_trigger 0, 28,  9, 0, FlickerTrainGraveyard3Girls, 0, 0
	xy_trigger 1, 28, 14, 0, FlickerTrainGraveyard3GirlsExtra, 0, 0
	xy_trigger 1, 29, 14, 0, FlickerTrainGraveyard3GirlsExtra, 0, 0

	db 6 ; bg events
	signpost 21, 20, SIGNPOST_UP, FlickerTrainDoor
	signpost 21, 17, SIGNPOST_UP, FlickerTrainDoor
	signpost 18, 21, SIGNPOST_UP, FlickerTrainDoor
	signpost 18, 18, SIGNPOST_UP, FlickerTrainDoor
	signpost 15, 20, SIGNPOST_UP, FlickerTrainDoor
	signpost 15, 17, SIGNPOST_UP, FlickerTrainDoor

	db 4 ; object events
	person_event SPRITE_DELINQUENT_F, 26,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerTrainGraveyardGirl1, -1
	person_event SPRITE_DELINQUENT_F, 28,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerTrainGraveyardGirl2, -1
	person_event SPRITE_DELINQUENT_F, 31,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerTrainGraveyardGirl3, -1
	tmhmball_event  7, 30, TM_WILL_O_WISP, EVENT_FLICKER_STATION_WILL_O_WISP


	const_def 1 ; object constants
	const FLICKER_STATION_TRAINER1
	const FLICKER_STATION_TRAINER2
	const FLICKER_STATION_TRAINER3
	
FlickerTrainGraveyardTrigger0:
	end
	
FlickerTrainGraveyardTrigger1:
	end
	
FlickerTrainGraveyardTrigger2:
	end
	
FlickerTrainGraveyardGirlMove:
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_2
	iffalse .end
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	dotrigger $2
.end
	return
	
FlickerTrainGraveyard3Girls:
	special Special_StopRunning
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_1
	iftrue .skiptrainer1
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER1,  30
	applyonemovement FLICKER_STATION_TRAINER1, step_down
	spriteface PLAYER, UP
	opentext
	writetext TrainerFlickerTrainGraveyard_1SeenText
	waitbutton
	closetext
	winlosstext TrainerFlickerTrainGraveyard_1BeatenText, 0
	setlasttalked FLICKER_STATION_TRAINER1
	loadtrainer DELINQUENT_F, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_1

.skiptrainer1
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_3
	iftrue .skiptrainer3
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER3,  30
	applymovement FLICKER_STATION_TRAINER3, Movement_FlickerTrainGraveyard3Girls2
	spriteface PLAYER, DOWN
	opentext
	writetext TrainerFlickerTrainGraveyard_3SeenText
	waitbutton
	closetext
	winlosstext TrainerFlickerTrainGraveyard_3BeatenText, 0
	setlasttalked FLICKER_STATION_TRAINER3
	loadtrainer DELINQUENT_F, 3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_3
	
.skiptrainer3
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	showemote EMOTE_SHOCK, FLICKER_STATION_TRAINER2,  30
	applymovement FLICKER_STATION_TRAINER2, Movement_FlickerTrainGraveyard3Girls3
	spriteface PLAYER, LEFT
	opentext
	writetext TrainerFlickerTrainGraveyard_2SeenText
	waitbutton
	closetext
	winlosstext TrainerFlickerTrainGraveyard_2BeatenText, 0
	setlasttalked FLICKER_STATION_TRAINER2
	loadtrainer DELINQUENT_F, 2
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_FLICKER_STATION
	setevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_2
	dotrigger $1
	end
	
FlickerTrainGraveyard3GirlsExtra:
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	dotrigger $2
	end
	
FlickerTrainDoor:
	jumptext FlickerTrainDoorText
	
FlickerTrainGraveyardGirl1:
	jumptextfaceplayer TrainerFlickerTrainGraveyard_1NormalText
	
FlickerTrainGraveyardGirl2:
	checkevent EVENT_FLICKER_STATION_GIRL_TALKED
	iftrue .skip1
	setevent EVENT_FLICKER_STATION_GIRL_TALKED
	jump .skip2
.skip1
	checkevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	iftrue .skip2
	faceplayer
	opentext
	writetext TrainerFlickerTrainGraveyard_2NormalText2
	waitbutton
	closetext
	applyonemovement FLICKER_STATION_TRAINER2, step_left
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
	end
.skip2
	jumptextfaceplayer TrainerFlickerTrainGraveyard_2NormalText1
	
FlickerTrainGraveyardGirl3:
	jumptextfaceplayer TrainerFlickerTrainGraveyard_3NormalText
	
TrainerFlickerTrainGraveyard_1SeenText:
	text "Eeek!"
	
	para "What are you doing"
	line "stalking around"
	cont "back here?"
	done
	
TrainerFlickerTrainGraveyard_1BeatenText:
	text "Eeek!"
	done
	
TrainerFlickerTrainGraveyard_1NormalText:
	text "You've got some"
	line "nerve creeping up"
	cont "on sweet, innocent"
	cont "girls like us!"
	done
	
TrainerFlickerTrainGraveyard_2SeenText:
	text "You think you're"
	line "tough, huh?"
	
	para "Well, too bad!"
	
	para "This is OUR secret"
	line "spot!"
	done
	
TrainerFlickerTrainGraveyard_2BeatenText:
	text "Gah!"
	
	para "You ARE tough!"
	done
	
TrainerFlickerTrainGraveyard_2NormalText1:
	text "Well, whatever…"
	
	para "Just because you"
	line "beat me, doesn't"
	cont "mean this is your"
	cont "spot!"
	done
	
TrainerFlickerTrainGraveyard_2NormalText2:
	text "Huh?"
	
	para "Oh."
	
	para "You want to get"
	line "by?"
	
	para "Right…"
	done
	
TrainerFlickerTrainGraveyard_3SeenText:
	text "Hehe!"
	
	para "You're kinda"
	line "cute…"
	done
	
TrainerFlickerTrainGraveyard_3BeatenText:
	text "Hehehe!"
	done
	
TrainerFlickerTrainGraveyard_3NormalText:
	text "Later, cutie!"
	
	para "Hehe!"
	done
	
Movement_FlickerTrainGraveyard3Girls2:
	step_up
	step_up
	step_end
	
Movement_FlickerTrainGraveyard3Girls3:
	step_right
	step_right
	step_right
	step_end
	