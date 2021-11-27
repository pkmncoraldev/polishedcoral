Route10MoveReminderHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  1, 4, ROUTE_10
	warp_def  9,  2, 4, ROUTE_10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, MoveReminderScript, -1

MoveReminderScript:
	faceplayer
	opentext
	writetext MoveReminderIntroText
	waitbutton
	checkitem BOTTLE_CAP
	iffalse .no_bottle_cap
	writetext MoveReminderPromptText
	yesorno
	iffalse .refused
	writebyte NO_MOVE ; to toggle move relearner
	writetext MoveReminderWhichMonText
	waitbutton
	special Special_MoveTutor
	ifequal $0, .teach_move
.refused
	jumpopenedtext MoveReminderCancelText

.no_bottle_cap
	jumpopenedtext MoveReminderNoGoldLeafText

.teach_move
	takeitem BOTTLE_CAP
	jumpopenedtext MoveReminderCancelText

MoveReminderIntroText::
	text "Me? I'm the"
	line "Move Maniac."

	para "I'll make your"
	line "#mon remember"

	para "a move if you'll"
	line "trade me a"
	cont "Gold Leaf."
	done

MoveReminderPromptText::
	text "Do you want me to"
	line "teach one of your"
	cont "#mon a move?"
	done

MoveReminderWhichMonText::
	text "Which #mon"
	line "needs tutoring?"
	done

MoveReminderNoGoldLeafText::
	text "Huh? You don't"
	line "have any Gold"
	cont "Leaves."

	para "Sometimes you can"
	line "find them on wild"
	cont "Bellsprout."
	done

MoveReminderNoMovesText::
	text "Sorry… There isn't"
	line "any move I can"

	para "make that #mon"
	line "remember."
	done

MoveReminderCancelText::
	text "If your #mon"
	line "needs to learn a"

	para "move, come back"
	line "with a Gold Leaf."
	done