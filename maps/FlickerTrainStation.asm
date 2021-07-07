FlickerTrainStation_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, FlickerTrainStationCallback

	db 3 ; warp events
	warp_event  7, 11, FLICKER_STATION, 5
	warp_event  8, 11, FLICKER_STATION, 6
	warp_event  8,  1, FLICKER_TRAIN_CUTSCENE, 1

	db 0 ; coord events

	db 10 ; bg events
	bg_event  7,  8, SIGNPOST_UP, FlickerTrainStationScheduleFront
	bg_event  8,  8, SIGNPOST_UP, FlickerTrainStationScheduleFront
	bg_event  7,  7, SIGNPOST_DOWN, FlickerTrainStationScheduleBack
	bg_event  8,  7, SIGNPOST_DOWN, FlickerTrainStationScheduleBack
	bg_event  4,  5, SIGNPOST_JUMPTEXT, FlickerTrainStationFlowersText
	bg_event 11,  5, SIGNPOST_JUMPTEXT, FlickerTrainStationFlowersText
	bg_event  2,  4, SIGNPOST_JUMPTEXT, FlickerTrainStationWindowText
	bg_event  3,  4, SIGNPOST_JUMPTEXT, FlickerTrainStationWindowText
	bg_event 12,  4, SIGNPOST_JUMPTEXT, FlickerTrainStationWindowText
	bg_event 13,  4, SIGNPOST_JUMPTEXT, FlickerTrainStationWindowText

	db 4 ; object events
	person_event SPRITE_POKEFAN_F,  5,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, FlickerTrainStationNPC1, -1
	person_event SPRITE_CHILD,  5,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerTrainStationNPC2, -1
	person_event SPRITE_BURGLAR,  5, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerTrainStationNPC3, -1
	person_event SPRITE_OFFICER,  4,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerTrainStationClerk, -1
	
	const_def 1 ; object constants
	const FLICKER_TRAIN_STATION_NPC1
	const FLICKER_TRAIN_STATION_NPC2
	const FLICKER_TRAIN_STATION_NPC3
	const FLICKER_TRAIN_STATION_CLERK
	
FlickerTrainStationCallback:
	checkevent EVENT_TRAIN_GOING_WEST
	iffalse .end
	moveperson FLICKER_TRAIN_STATION_CLERK, 9, 3
	earthquake 5
	applymovement PLAYER, Movement_FlickerTrainStationPlayer
	applymovement FLICKER_TRAIN_STATION_CLERK, Movement_FlickerTrainStationClerk2
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
.end
	return
	
FlickerTrainStationClerk:
;	jumptextfaceplayer FlickerTrainStationClerkTextDemo
	faceplayer
	opentext
	writetext FlickerTrainStationClerkText1
	yesorno
	iffalse .end
	closetext
	domaptrigger TRAIN_CABIN_1, $0
	setevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	follow FLICKER_TRAIN_STATION_CLERK, PLAYER
	applymovement FLICKER_TRAIN_STATION_CLERK, Movement_FlickerTrainStationClerk
	stopfollow
	spriteface FLICKER_TRAIN_STATION_CLERK, RIGHT
	spriteface PLAYER, LEFT
	opentext
	writetext FlickerTrainStationClerkText2
	waitbutton
	closetext
	applyonemovement PLAYER, step_up
	domaptrigger FLICKER_TRAIN_CUTSCENE, $0
	domaptrigger LUSTER_TRAIN_CUTSCENE, $0
	warpcheck
	end
.end
	writetext FlickerTrainStationClerkText3
	waitbutton
	closetext
	end
	
	
FlickerTrainStationNPC1:
	faceplayer
	opentext
	writetext FlickerTrainStationNPC1Text
	waitbutton
	spriteface FLICKER_TRAIN_STATION_NPC1, DOWN
	closetext
	end
	
FlickerTrainStationNPC2:
	faceplayer
	opentext
	writetext FlickerTrainStationNPC2Text1
	waitbutton
	spriteface FLICKER_TRAIN_STATION_NPC1, RIGHT
	closetext
	pause 5
	opentext
	writetext FlickerTrainStationNPC2Text2
	waitbutton
	spriteface FLICKER_TRAIN_STATION_NPC2, LEFT
	closetext
	pause 5
	opentext
	writetext FlickerTrainStationNPC2Text3
	waitbutton
	spriteface FLICKER_TRAIN_STATION_NPC1, DOWN
	closetext
	end
	
FlickerTrainStationNPC3:
	faceplayer
	opentext
	writetext FlickerTrainStationNPC3Text
	waitbutton
	spriteface FLICKER_TRAIN_STATION_NPC3, DOWN
	closetext
	end

FlickerTrainStationScheduleFront:
	jumptext FlickerTrainStationScheduleFrontText
	
FlickerTrainStationScheduleBack:
	jumptext FlickerTrainStationScheduleBackText
	
FlickerTrainStationClerkTextDemo:
	text "Sorry."
	
	para "The trains aren't"
	line "running right now."
	done
	
FlickerTrainStationClerkText1:
	text "Take the train to"
	line "LUSTER CITY?"
	done
	
FlickerTrainStationClerkText2:
	text "Right through"
	line "here."
	done
	
FlickerTrainStationClerkText3:
	text "Have a nice day."
	done
	
FlickerTrainStationNPC1Text:
	text "I'm taking my son"
	line "to the big city!"
	
	para "He's so excited."
	done
	
FlickerTrainStationNPC2Text1:
	text "MOMMY's taking me"
	line "to LUSTER CITY!"
	
	para "YAAAAY!"
	done
	
FlickerTrainStationNPC2Text2:
	text "Now now."
	
	para "Settle down."
	done
	
FlickerTrainStationNPC2Text3:
	text "Sorry MOMMY…"
	done
	
FlickerTrainStationNPC3Text:
	text "I hope that kid"
	line "over there quiets"
	cont "down."
	
	para "I'm getting a head-"
	line "ache already…"
	done
	
FlickerTrainStationScheduleFrontText:
	text "The train sche-"
	line "dule."
	
	para "“The train headed"
	line "for LUSTER CITY"
	cont "will be departing"
	cont "soon.”"
	done
	
FlickerTrainStationScheduleBackText:
	text "PLACEHOLDER"
	done
	
FlickerTrainStationFlowersText:
	text "Some pretty"
	line "flowers."
	
	para "They smell like…"
	
	para "Plastic?"
	done
	
FlickerTrainStationWindowText:
	text "You see the"
	line "reflection of"
	cont "yourself sitting"
	cont "backwards in a"
	cont "chair."
	
	para "…"
	
	para "Turn around and"
	line "act your age!"
	done
	
Movement_FlickerTrainStationPlayer:
	step_down
	step_down
	step_down
	step_down
	step_end
	
Movement_FlickerTrainStationClerk:
	step_up
	step_up
	step_left
	step_end
	
Movement_FlickerTrainStationClerk2:
	step_left
	step_down
	step_end
