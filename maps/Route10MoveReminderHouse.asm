Route10MoveReminderHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  1, 4, ROUTE_10
	warp_def  9,  2, 4, ROUTE_10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoveReminderScript, -1

MoveReminderScript:
	faceplayer
	opentext
	checkevent EVENT_MOVE_REMINDER_INTRO
	iftrue .skip_intro
	setevent EVENT_MOVE_REMINDER_INTRO
	writetext MoveReminderIntroText
	buttonsound
	farwritetext StdBlankText
.skip_intro
	writetext MoveReminderPromptText
	yesorno
	iffalse .done
	checkitem BOTTLE_CAP
	iffalse .none
	takeitem BOTTLE_CAP
	checkitem BOTTLE_CAP
	iffalse .one
	takeitem BOTTLE_CAP
	checkitem BOTTLE_CAP
	iffalse .two
	takeitem BOTTLE_CAP
	writebyte NO_MOVE ; to toggle move relearner
	writetext MoveReminderWhichMonText
	waitbutton
	special Special_MoveTutor
	ifequal 0, .done
.cancel
	giveitem BOTTLE_CAP
	giveitem BOTTLE_CAP
	giveitem BOTTLE_CAP
.done
	jumpopenedtext MoveReminderCancelText

.two
	giveitem BOTTLE_CAP
.one
	giveitem BOTTLE_CAP
.none
	jumpopenedtext MoveReminderNoBottleCapText

MoveReminderIntroText::
	text "Yo! I'm the"
	line "MOVE REMINDER."

	para "I can make your"
	line "#MON remember"
	cont "moves they've"
	cont "forgotten."

	para "Or sometimes"
	line "moves they've"
	cont "never even known!"
	
	para "Money?"
	
	para "Nah! I collect"
	line "BOTTLE CAPs!"
	done

MoveReminderPromptText::
	text "Do you want me to"
	line "teach one of your"
	cont "#MON a move?"
	
	para "I'll do it for"
	line "3 BOTTLE CAPs."
	done

MoveReminderWhichMonText::
	text "Which #MON"
	line "needs tutoring?"
	done

MoveReminderNoBottleCapText::
	text "Huh? You don't"
	line "have the BOTTLE"
	cont "CAPs?"

	para "Don't you ever"
	line "drink SODA POP?"
	done

MoveReminderCancelText::
	text "If your #MON"
	line "needs more moves,"

	para "come back with"
	line "some BOTTLE CAPs."
	done