ObscuraMuseumEmployeeRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  5, 12, 3, OBSCURA_CITY
	warp_def  6, 12, 4, OBSCURA_CITY
	warp_def 12,  5, 3, OBSCURA_MUSEUM_1F
	warp_def 12,  6, 3, OBSCURA_MUSEUM_1F

	db 0 ; coord events

	db 14 ; bg events
	signpost  1,  2, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1,  3, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1,  4, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1,  5, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 10, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 11, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  4,  3, SIGNPOST_UP, ObscuraMuseumComputer1
	signpost  4,  9, SIGNPOST_UP, ObscuraMuseumComputer2
	signpost  8,  3, SIGNPOST_UP, ObscuraMuseumComputer3
	signpost  8,  9, SIGNPOST_UP, ObscuraMuseumComputer4
	signpost  4,  2, SIGNPOST_UP, ObscuraMuseumKeyboard1
	signpost  4,  8, SIGNPOST_UP, ObscuraMuseumKeyboard2
	signpost  8,  2, SIGNPOST_UP, ObscuraMuseumKeyboard3
	signpost  8,  8, SIGNPOST_UP, ObscuraMuseumKeyboard4

	db 8 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SCIENTIST_F,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomAbiegail, -1
	person_event SPRITE_RECEPTIONIST,  1,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomNPC1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SCIENTIST,  9, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomNPC2, -1
	person_event SPRITE_SCIENTIST_F,  3,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomNPC3, -1
	person_event SPRITE_SCIENTIST,  3, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomNPC4, -1
	person_event SPRITE_SCIENTIST_F, 11,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomNPC5, -1
	person_event SPRITE_SCIENTIST, 12,  8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomNPC6, -1


	const_def 1 ; object constants
	const OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE
	const OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE

ObscuraMuseumEmployeeRoomAbiegail:
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	checkevent EVENT_TALKED_TO_PROF_HILL_WITH_BALL
	iftrue .ball
	jumptextfaceplayer ObscuraMuseumEmployeeRoomAbiegailText1
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomAbiegailText2
.ball
	faceplayer
	opentext
	checkevent EVENT_GAVE_ABIE_ANCIENT_BALL
	iftrue .gave_ball
	writetext ObscuraMuseumEmployeeRoomAbiegailText3
	waitbutton
	writetext ObscuraMuseumEmployeeRoomBallText
	takeitem ANCIENT_BALL
	playsound SFX_LEVEL_UP
	setevent EVENT_GAVE_ABIE_ANCIENT_BALL
	waitsfx
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	spriteface OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, UP
	jump .cont
.YouAreFacingDown
	spriteface OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, DOWN
.cont
	pause 15
	opentext
	writetext ObscuraMuseumEmployeeRoomAbiegailText4
	waitbutton
	closetext
	pause 20
	faceplayer
	pause 10
	opentext
	writetext ObscuraMuseumEmployeeRoomAbiegailText5
	buttonsound
	farwritetext StdBlankText
	pause 6
	specialphonecall SPECIALCALL_GAVEANCIENTBALL
	setevent EVENT_SPRUCE_BUSY_SIGNAL
.gave_ball
	writetext ObscuraMuseumEmployeeRoomAbiegailText6
	waitbutton
	closetext
	end
	
ObscuraMuseumEmployeeRoomBallText:
	text "<PLAYER> handed"
	line "over ANCIENT BALL!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText1:
	text "My name is"
	line "DR. ABIEGAIL."
	
	para "I'm the head of"
	line "research here."
	done
	
ObscuraMuseumEmployeeRoomAbiegailText2:
	text "My name is"
	line "DR. ABIEGAIL."
	
	para "I'm the head of"
	line "research here."
	
	para "These TEAM SNARE"
	line "goons…"
	
	para "What a pain!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText3:
	text "My name is"
	line "DR. ABIEGAIL."
	
	para "I'm the head of"
	line "research here."
	
	para "Are you <PLAYER>?"
	
	para "PROF. HILL told"
	line "me you have an"
	cont "item of interest"
	cont "for me."
	
	para "Well, let's take"
	line "a look."
	done
	
ObscuraMuseumEmployeeRoomAbiegailText4:
	text "Hmm…"
	done

ObscuraMuseumEmployeeRoomAbiegailText5:
	text "Well, it's the"
	line "real deal alright."
	
	para "This is"
	line "unbelievable!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText6:
	text "My father spent"
	line "his entire career"
	cont "trying to prove"
	cont "the existence of a"
	cont "#BALL this old."
	
	para "There have long"
	line "been theories of"
	cont "people training"
	cont "#MON in ancient"
	cont "times."
	
	para "But there was"
	line "never solid proof."
	
	para "Until now!"
	
	para "I've got to call"
	line "my father and tell"
	cont "him right away!"
	
	para "After that, we'll"
	line "get this out on"
	cont "display as soon"
	cont "as possible."
	
	para "Thank you so much"
	line "for all your help!"
	done

ObscuraMuseumEmployeeRoomNPC1:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iftrue .barrier
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC1Text1
.barrier
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC1Text3
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC1Text2
	
ObscuraMuseumEmployeeRoomNPC1Text1:
	text "TEXT 1"
	done
	
ObscuraMuseumEmployeeRoomNPC1Text2:
	text "Those people just"
	line "barged in and"
	cont "started giving"
	cont "orders!"
	
	para "What do they want?"
	done
	
ObscuraMuseumEmployeeRoomNPC1Text3:
	text "Secret code?"
	
	para "It's six digits."
	
	para "I don't know"
	line "anything else!"
	
	para "P-<WAIT_S>please leave"
	line "me alone!"
	done
	
ObscuraMuseumEmployeeRoomNPC2:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iftrue .barrier
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC2Text1
.barrier
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC2Text3
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC2Text2
	
ObscuraMuseumEmployeeRoomNPC2Text1:
	text "TEXT 1"
	done
	
ObscuraMuseumEmployeeRoomNPC2Text2:
	text "What a pain."
	
	para "We're in the middle"
	line "of important"
	cont "research."
	done
	
ObscuraMuseumEmployeeRoomNPC2Text3:
	text "Code for the"
	line "barrier?"
	
	para "All I know is the"
	line "first and last"
	cont "digits are the"
	cont "same."
	done
	
ObscuraMuseumEmployeeRoomNPC3:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iftrue .barrier
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC3Text1
.barrier
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC3Text3
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC3Text2
	
ObscuraMuseumEmployeeRoomNPC3Text1:
	text "TEXT 1"
	done
	
ObscuraMuseumEmployeeRoomNPC3Text2:
	text "TEAM SNARE?"
	
	para "Who do they think"
	line "they are?"
	done
	
ObscuraMuseumEmployeeRoomNPC3Text3:
	text "The secret code.<WAIT_S>"
	line "Right!"
	
	para "All I can tell you"
	line "is 1 comes between"
	cont "3 and 4."
	done
	
ObscuraMuseumEmployeeRoomNPC4:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iftrue .barrier
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC4Text1
.barrier
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC4Text3
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC4Text2
	
	
ObscuraMuseumEmployeeRoomNPC4Text1:
	text "TEXT 1"
	done
	
ObscuraMuseumEmployeeRoomNPC4Text2:
	text "Please!<WAIT_S>"
	line "Help us!"
	done
	
ObscuraMuseumEmployeeRoomNPC4Text3:
	text "Code?"
	
	para "3 comes fourth in"
	line "the sequence."
	
	para "That's all I know!"
	done
	
ObscuraMuseumEmployeeRoomNPC5:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iftrue .barrier
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC5Text1
.barrier
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC5Text3
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC5Text2
	
ObscuraMuseumEmployeeRoomNPC5Text1:
	text "TEXT 1"
	done
	
ObscuraMuseumEmployeeRoomNPC5Text2:
	text "There's a lot here"
	line "worth tons of"
	cont "money!"
	
	para "They can't get"
	line "away with this!"
	done
	
ObscuraMuseumEmployeeRoomNPC5Text3:
	text "I don't know"
	line "the code."
	
	para "All I know is that"
	line "2 and 4 show up"
	cont "twice each."
	done

ObscuraMuseumEmployeeRoomNPC6:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iftrue .barrier
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC6Text1
.barrier
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC6Text3
.snare
	jumptextfaceplayer ObscuraMuseumEmployeeRoomNPC6Text2

ObscuraMuseumEmployeeRoomNPC6Text1:
	text "TEXT 1"
	done
	
ObscuraMuseumEmployeeRoomNPC6Text2:
	text "You aren't with"
	line "them, are you?"
	done
	
ObscuraMuseumEmployeeRoomNPC6Text3:
	text "You need the"
	line "barrier code?"
	
	para "All I know is 2"
	line "isn't last in the"
	cont "sequence."
	done

ObscuraMuseumComputer1:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	jumptext ObscuraMuseumComputer1Text2
.nope
	jumptext ObscuraMuseumComputer1Text1
	
ObscuraMuseumComputer2:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	jumptext ObscuraMuseumComputer2Text2
.nope
	jumptext ObscuraMuseumComputer2Text1
	
ObscuraMuseumComputer3:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	jumptext ObscuraMuseumComputer3Text2
.nope
	jumptext ObscuraMuseumComputer3Text1
	
ObscuraMuseumComputer4:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	jumptext ObscuraMuseumComputer4Text2
.nope
	jumptext ObscuraMuseumComputer4Text1
	
ObscuraMuseumKeyboard1:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumKeyboardText2
	yesorno
	iffalse .no
	closetext
	playsound SFX_TALLY
	callasm MusuemKeyboardAsm
	ifequal 5, .correct
	setevent EVENT_MUSEUM_FAILED_TERMINAL
.correct
	waitsfx
	callasm MusuemKeyboardAsm2
	ifequal 6, ObscuraMuseumKeyboardDone
	end
.no
	closetext
	end
.nope
	jumptext ObscuraMuseumKeyboardText1
	
ObscuraMuseumKeyboard2:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumKeyboardText2
	yesorno
	iffalse .no
	closetext
	playsound SFX_TALLY
	callasm MusuemKeyboardAsm
	ifequal 2, .correct
	ifequal 3, .correct
	setevent EVENT_MUSEUM_FAILED_TERMINAL
.correct
	waitsfx
	callasm MusuemKeyboardAsm2
	ifequal 6, ObscuraMuseumKeyboardDone
	end
.no
	closetext
	end
.nope
	jumptext ObscuraMuseumKeyboardText1
	
ObscuraMuseumKeyboard3:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumKeyboardText2
	yesorno
	iffalse .no
	closetext
	playsound SFX_TALLY
	callasm MusuemKeyboardAsm
	ifequal 4, .correct
	setevent EVENT_MUSEUM_FAILED_TERMINAL
.correct
	waitsfx
	callasm MusuemKeyboardAsm2
	ifequal 6, ObscuraMuseumKeyboardDone
	end
.no
	closetext
	end
.nope
	jumptext ObscuraMuseumKeyboardText1
	
ObscuraMuseumKeyboard4:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumKeyboardText2
	yesorno
	iffalse .no
	closetext
	playsound SFX_TALLY
	callasm MusuemKeyboardAsm
	ifequal 1, .correct
	ifequal 6, .correct
	setevent EVENT_MUSEUM_FAILED_TERMINAL
.correct
	waitsfx
	callasm MusuemKeyboardAsm2
	ifequal 6, ObscuraMuseumKeyboardDone
	end
.no
	closetext
	end
.nope
	jumptext ObscuraMuseumKeyboardText1
	
ObscuraMuseumKeyboardDone:
	pause 25
	callasm MusuemKeyboardAsm3
	checkevent EVENT_MUSEUM_FAILED_TERMINAL
	iftrue .failed
	clearevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	clearevent EVENT_MUSEUM_BARRIER_DOWN
	clearevent EVENT_MUSEUM_ROPE_LEFT
	clearevent EVENT_MUSEUM_ROPE_RIGHT
	setevent EVENT_MUSEUM_2F_ROCKY_GONE
	playsound SFX_TRANSACTION
	jumptext ObscuraMuseumKeyboardDoneSuccessText
.failed
	checkevent EVENT_DO_TERMINAL_GRUNT_2
	iffalse .male
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNARE_GIRL
	jump .cont
.male
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNARE
.cont
	clearevent EVENT_MUSEUM_FAILED_TERMINAL
	playsound SFX_WRONG
	opentext
	writetext ObscuraMuseumKeyboardDoneFailedText
	waitbutton
	closetext
	callasm MuseumSnareAppearAsm
	ifequal 1, .top_left
	ifequal 2, .top_right
	ifequal 3, .low_left
	ifequal 4, .low_right
.top_left
	moveperson OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, 1, 10
	jump .top
.top_right
	moveperson OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, 7, 10
.top
	spriteface OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, UP
	appear OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, Movement_MuseumEmployeeRoomSnareUp
	jump .cont2
.low_left
	moveperson OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, 1, 4
	jump .low
.low_right
	moveperson OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, 7, 4
.low
	spriteface OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, DOWN
	appear OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE, Movement_MuseumEmployeeRoomSnareDown
.cont2
	setlasttalked OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE
	faceplayer
	spriteface PLAYER, LEFT
	opentext
	writetext ObscuraMuseumEmployeeRoomSnareText1
	waitbutton
	closetext
	waitsfx
	winlosstext ObscuraMuseumEmployeeRoomSnareWinText, -1
	checkevent EVENT_DO_TERMINAL_GRUNT_2
	iftrue .grunt2
	checkevent EVENT_DO_TERMINAL_GRUNT_3
	iftrue .grunt3
	loadtrainer GRUNTM, MUSEUM_GRUNTM_7
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	setevent EVENT_DO_TERMINAL_GRUNT_2
	jump .end
.grunt2
	loadtrainer GRUNTF, MUSEUM_GRUNTF_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	clearevent EVENT_DO_TERMINAL_GRUNT_2
	setevent EVENT_DO_TERMINAL_GRUNT_3
	jump .end
.grunt3
	loadtrainer GRUNTM, MUSEUM_GRUNTM_8
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	clearevent EVENT_DO_TERMINAL_GRUNT_3
.end
	startbattle
	disappear OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE
	reloadmapafterbattle
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	end
	
Movement_MuseumEmployeeRoomSnareUp:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
Movement_MuseumEmployeeRoomSnareDown:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
ObscuraMuseumEmployeeRoomSnareText1:
	text "Intruder alert!"
	done
	
ObscuraMuseumEmployeeRoomSnareWinText:
	text "Too strong!"
	done
	
ObscuraMuseumKeyboardDoneSuccessText:
	text "Correct"
	line "sequence."
	
	para "Dropping barrier."
	done
	
ObscuraMuseumKeyboardDoneFailedText:
	text "Incorrect"
	line "sequence."
	done
	
MusuemKeyboardAsm:
	ld a, [wMuseumTerminalInputs]
	inc a
	ld [wMuseumTerminalInputs], a
MusuemKeyboardAsm2:
	ld [wScriptVar], a
	ret
	
MusuemKeyboardAsm3:
	xor a
	ld [wMuseumTerminalInputs], a
	ret
	
MuseumSnareAppearAsm:
	ld a, [wXCoord]
	cp 8
	jr z, .right
.left
	ld a, [wYCoord]
	cp 9
	jr z, .left_down
.left_up
	ld a, 1
	ld [wScriptVar], a
	ret
	
.left_down
	ld a, 3
	ld [wScriptVar], a
	ret
.right
	ld a, [wYCoord]
	cp 9
	jr z, .right_down
.right_up
	ld a, 2
	ld [wScriptVar], a
	ret
.right_down
	ld a, 4
	ld [wScriptVar], a
	ret
	
ObscuraMuseumComputer1Text1:
	text "“TERMINAL <SHARP>1”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer1Text2:
	text "“TERMINAL <SHARP>1”"
	
	para "Use the keyboard"
	line "to activate."
	done
	
ObscuraMuseumComputer2Text1:
	text "“TERMINAL <SHARP>2”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer2Text2:
	text "“TERMINAL <SHARP>2”"
	
	para "Use the keyboard"
	line "to activate."
	done
	
ObscuraMuseumComputer3Text1:
	text "“TERMINAL <SHARP>3”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer3Text2:
	text "“TERMINAL <SHARP>3”"
	
	para "Use the keyboard"
	line "to activate."
	done
	
ObscuraMuseumComputer4Text1:
	text "“TERMINAL <SHARP>4”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer4Text2:
	text "“TERMINAL <SHARP>4”"
	
	para "Use the keyboard"
	line "to activate."
	done
	
ObscuraMuseumKeyboardText1:
	text "Better not touch"
	line "it…"
	done
	
ObscuraMuseumKeyboardText2:
	text "Activate the"
	line "terminal?"
	done
	