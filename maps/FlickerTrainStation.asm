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

	db 6 ; object events
	person_event SPRITE_POKEFAN_F,  5,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, FlickerTrainStationNPC1, -1
	person_event SPRITE_CHILD,  5,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerTrainStationNPC2, -1
	person_event SPRITE_BURGLAR,  5, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerTrainStationNPC3, -1
	person_event SPRITE_OFFICER,  4,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerTrainStationClerk, -1
	person_event SPRITE_SNARE,  5, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerTrainStationSnare, EVENT_FLICKER_TRAIN_STATION_SNARE
	person_event SPRITE_COLBY, 10,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	
	const_def 1 ; object constants
	const FLICKER_TRAIN_STATION_NPC1
	const FLICKER_TRAIN_STATION_NPC2
	const FLICKER_TRAIN_STATION_NPC3
	const FLICKER_TRAIN_STATION_CLERK
	const FLICKER_TRAIN_STATION_SNARE
	const FLICKER_TRAIN_STATION_RIVAL
	
FlickerTrainStationCallback:
	checkevent EVENT_TRAIN_GOING_WEST
	iffalse .end
	moveperson FLICKER_TRAIN_STATION_CLERK, 9, 3
	earthquake 5
	applymovement PLAYER, Movement_FlickerTrainStationPlayer1
	applymovement FLICKER_TRAIN_STATION_CLERK, Movement_FlickerTrainStationClerk2
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
.end
	return
	
FlickerTrainStationClerk:
	faceplayer
	opentext
	checkdebugmode
	iffalse .normal
	writetext FlickerTrainStationClerkTextDebug
	yesorno
	iffalse .end_debug
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
.end_debug
	writetext FlickerTrainStationClerkText3
	waitbutton
	closetext
	end
	
.normal
	checkitem TRAIN_PASS
	iftrue .pass
	checkitem TRAIN_TICKET
	iffalse .no
	setevent EVENT_FLICKER_STATION_RIVAL
	writetext FlickerTrainStationClerkText6
	waitbutton
	writetext FlickerTrainStationFlashedTicketText
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext FlickerTrainStationClerkText10
	yesorno
	iffalse .end
	takeitem TRAIN_TICKET
.return
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
	
.pass
	checkevent EVENT_USED_TRAIN_PASS_ONCE
	iftrue .pass2
	writetext FlickerTrainStationClerkText7
	yesorno
	setevent EVENT_USED_TRAIN_PASS_ONCE
	iffalse .end
	jump .return
.pass2
	writetext FlickerTrainStationClerkText8
	yesorno
	iffalse .end
	jump .return
	
.no
	writetext FlickerTrainStationClerkText1
	yesorno
	iffalse .saidno
	writetext FlickerTrainStationClerkText4
	waitbutton
	jump .end
.saidno
	writetext FlickerTrainStationClerkText5
	waitbutton
.end
	closetext
	checkevent EVENT_FLICKER_STATION_RIVAL
	iffalse .rival
	end
.rival
	pause 10
	playsound SFX_ENTER_DOOR
	waitsfx
	pause 5
	playmusic MUSIC_RIVAL_ENCOUNTER
	appear FLICKER_TRAIN_STATION_RIVAL
	pause 20
	applymovement FLICKER_TRAIN_STATION_RIVAL, Movement_FlickerStationRival1
	spriteface PLAYER, LEFT
	opentext
	writetext FlickerTrainStationRivalText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_FlickerTrainStationPlayer2
	applyonemovement FLICKER_TRAIN_STATION_RIVAL, step_right
	spriteface FLICKER_TRAIN_STATION_RIVAL, UP
	opentext
	writetext FlickerTrainStationRivalText2
	waitbutton
	closetext
	pause 5
	opentext
	writetext FlickerTrainStationClerkText9
	waitbutton
	closetext
	pause 5
	applymovement FLICKER_TRAIN_STATION_CLERK, Movement_FlickerTrainStationClerk3
	spriteface FLICKER_TRAIN_STATION_CLERK, LEFT
	pause 5
	spriteface FLICKER_TRAIN_STATION_RIVAL, RIGHT
	opentext
	writetext FlickerTrainStationRivalText3
	waitbutton
	closetext
	applymovement FLICKER_TRAIN_STATION_RIVAL, Movement_FlickerStationRival2
	playsound SFX_EXIT_BUILDING
	disappear FLICKER_TRAIN_STATION_RIVAL
	waitsfx
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_FLICKER_STATION
	applymovement FLICKER_TRAIN_STATION_CLERK, Movement_FlickerTrainStationClerk2
	pause 10
	setevent EVENT_FLICKER_STATION_RIVAL
	end
	
FlickerTrainStationSnare:
	jumptextfaceplayer FlickerTrainStationSnareText
	
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
	
FlickerTrainStationSnareText:
	text "Where's my TRAIN"
	line "TICKET!?"
	
	para "They won't let me"
	line "on without it!"
	
	para "Oh, I'm so fired…"
	done
	
FlickerTrainStationClerkTextDemo:
	text "Sorry."
	
	para "The trains aren't"
	line "running right now."
	done
	
FlickerTrainStationClerkTextDebug:
	text "Take the train to"
	line "LUSTER CITY?"
	done
	
FlickerTrainStationClerkText1:
	text "You can't ride the"
	line "train to LUSTER"
	cont "CITY without a"
	cont "TRAIN TICKET."
	
	para "A snot-nosed kid"
	line "like you couldn't"
	cont "afford one!"
	
	para "Tell ya what."
	
	para "I'll give you one"
	line "for ¥1,000,000."
	done
	
FlickerTrainStationClerkText2:
	text "Right through"
	line "here…"
	
	para "Enjoy your visit"
	line "to LUSTER CITY…"

	para "Grumble, grumble…"
	done
	
FlickerTrainStationClerkText3:
	text "Have a nice day…"
	
	para "Grumble, grumble…"
	done
	
FlickerTrainStationClerkText4:
	text "You can't afford"
	line "that! Heh…"
	
	para "Now get outta"
	line "here, kid!"
	
	para "You're holding up"
	line "the line!"
	done
	
FlickerTrainStationClerkText5:
	text "That's what I"
	line "thought. Heh…"
	
	para "Now get outta"
	line "here, kid!"
	
	para "You're holding up"
	line "the line!"
	done
	
FlickerTrainStationClerkText6:
	text "You can't ride the"
	line "train to LUSTER"
	cont "CITY without a"
	cont "TRAIN TICKET."
	
	para "A snot-nosed kid"
	line "like you couldn't"
	cont "afford one!"
	done
	
FlickerTrainStationFlashedTicketText:
	text "<PLAYER> flashed"
	line "the TRAIN TICKET."
	done
	
	
FlickerTrainStationClerkText10:
	text "WHAT!?"
	
	para "You have a TRAIN"
	line "TICKET!?"
	
	para "…"
	
	para "Well, I guess I"
	line "have no choice…"
	
	para "Do you want to"
	line "ride the TRAIN to"
	cont "LUSTER CITY?"
	done
	
FlickerTrainStationClerkText7:
	text "Not you again!"
	
	para "No way you have"
	line "another TRAIN"
	cont "TICKET!"
	
	para "<PLAYER> flashed"
	line "the TRAIN PASS."
	
	para "WHAT!?"
	
	para "You have a TRAIN"
	line "PASS!?"
	
	para "Unlimited rides!?"
	
	para "…"
	
	para "Well, I guess I"
	line "have no choice…"
	
	para "Do you want to"
	line "ride the TRAIN to"
	cont "LUSTER CITY?"
	done
	
FlickerTrainStationClerkText8:
	text "Not you again!"
	
	para "<PLAYER> flashed"
	line "the TRAIN PASS."
	
	para "…"
	
	para "Well, I guess I"
	line "have no choice…"
	
	para "Do you want to take"
	line "the TRAIN to LUSTER"
	cont "CITY?"
	done
	
FlickerTrainStationClerkText9:
	text "Right this way,"
	line "sir!"
	done
	
FlickerTrainStationRivalText1:
	text "<RIVAL>: You"
	line "again?"
	
	para "What's that?"
	
	para "You can't afford"
	line "a TRAIN TICKET?"
	
	para "HA!"
	
	para "That's hilarious!"
	
	para "Don't worry."
	
	para "I'm not even going"
	line "to waste my time"
	cont "with you."
	
	para "Move aside!"
	
	para "I've got more imp-"
	line "ortant things to"
	cont "do right now."
	done
	
FlickerTrainStationRivalText2:
	text "<RIVAL> flashed"
	line "a TRAIN TICKET."
	done
	
FlickerTrainStationRivalText3:
	text "Later, loser!"
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
	text "Something is"
	line "scribbled on the"
	cont "back of the sign…"
	
	para "…"
	
	para "Better not repeat"
	line "that out loud…"
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
	
Movement_FlickerTrainStationPlayer1:
	step_down
	step_down
	step_down
	step_down
	step_end
	
Movement_FlickerTrainStationPlayer2:
	fix_facing
	step_right
	remove_fixed_facing
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
	
Movement_FlickerTrainStationClerk3:
	step_up
	step_right
	step_end
	
Movement_FlickerStationRival1:
	step_up
	step_left
	step_up
	step_up
	step_up
	step_up
	step_right
	step_end
	
Movement_FlickerStationRival2:
	step_up
	step_up
	step_up
	step_up
	step_end
