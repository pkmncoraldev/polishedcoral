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

	db 1 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET


	const_def 1 ; object constants
	const OBSCURA_MUSEUM_EMPLOYEE_ROOM_SNARE

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
	ld a, [wLostGirls]
	inc a
	ld [wLostGirls], a
MusuemKeyboardAsm2:
	ld [wScriptVar], a
	ret
	
MusuemKeyboardAsm3:
	xor a
	ld [wLostGirls], a
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
	