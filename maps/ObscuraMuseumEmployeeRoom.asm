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
	signpost  4,  3, SIGNPOST_UP, ObscuraMuseumKeyboard1
	signpost  4,  9, SIGNPOST_UP, ObscuraMuseumKeyboard2
	signpost  8,  3, SIGNPOST_UP, ObscuraMuseumKeyboard3
	signpost  8,  9, SIGNPOST_UP, ObscuraMuseumKeyboard4
	signpost  4,  2, SIGNPOST_UP, ObscuraMuseumKeyboard1
	signpost  4,  8, SIGNPOST_UP, ObscuraMuseumKeyboard2
	signpost  8,  2, SIGNPOST_UP, ObscuraMuseumKeyboard3
	signpost  8,  8, SIGNPOST_UP, ObscuraMuseumKeyboard4

	db 8 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SCIENTIST_F,  6,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseumEmployeeRoomAbiegail, EVENT_MUSEUM_ABIE_GONE
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
	checkevent EVENT_GOT_MASTERBALL
	iftrue .got_masterball
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	checkitem ANCIENT_BALL
	iftrue .ball
	checkevent EVENT_SHOWED_HILL_BLACK_PEARL
	iftrue .pearl
	jumptextfaceplayer TEXTBOX_ABIE, ObscuraMuseumEmployeeRoomAbiegailText1
.snare
	jumptextfaceplayer TEXTBOX_ABIE, ObscuraMuseumEmployeeRoomAbiegailText2
.got_masterball
	jumptextfaceplayer TEXTBOX_ABIE, ObscuraMuseumEmployeeRoomAbiegailText13
.pearl
	faceplayer
	opentext TEXTBOX_ABIE
	checkevent EVENT_GAVE_ABIE_BLACK_PEARL
	iftrue .gave_pearl
	writetext ObscuraMuseumEmployeeRoomAbiegailText3
	waitbutton
	changetextboxspeaker
	writetext ObscuraMuseumEmployeeRoomPearlText
	takeitem BLACK_PEARL
	playsound SFX_LEVEL_UP
	setevent EVENT_GAVE_ABIE_BLACK_PEARL
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
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText4
	waitbutton
	closetext
	pause 20
	faceplayer
	pause 10
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText5
	buttonsound
	changetextboxspeaker
	verbosegivetmhm HM_DIVE
.gave_pearl
	changetextboxspeaker TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText6
	waitbutton
	closetext
	end
.ball
	faceplayer
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText7
	waitbutton
	changetextboxspeaker
	writetext ObscuraMuseumEmployeeRoomBallText
	takeitem ANCIENT_BALL
	playsound SFX_LEVEL_UP
	setevent EVENT_GAVE_ABIE_ANCIENT_BALL
	waitsfx
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown2
	spriteface OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, UP
	jump .cont2
.YouAreFacingDown2
	spriteface OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, DOWN
.cont2
	pause 15
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText8
	waitbutton
	closetext
	pause 20
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, Movement_Abie_1
	applyonemovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, remove_fixed_facing
	pause 10
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText9
	waitbutton
	closetext
	pause 10
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, Movement_Abie_2
	applyonemovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, remove_fixed_facing
	pause 10
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText10
	waitbutton
	closetext
	pause 10
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, Movement_Abie_3
	applyonemovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, remove_fixed_facing
	pause 10
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText11
	waitbutton
	closetext
	pause 20
	faceplayer
	opentext TEXTBOX_ABIE
	writetext ObscuraMuseumEmployeeRoomAbiegailText12
	waitbutton
	closetext
	specialphonecall SPECIALCALL_GAVEANCIENTBALL
	setevent EVENT_SPRUCE_BUSY_SIGNAL
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, Movement_Abie_4
	jump .cont3
.YouAreFacingUp
	applymovement OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE, Movement_Abie_5
.cont3
	playsound SFX_EXIT_BUILDING
	disappear OBSCURA_MUSEUM_EMPLOYEE_ROOM_ABIE
	end	
	
ObscuraMuseumEmployeeRoomPearlText:
	text "<PLAYER> handed"
	line "over BLACK PEARL!"
	done
	
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
	
	para "Well, it certainly"
	line "seems the same as"
	cont "the one on display"
	cont "here…"
	
	para "And you said you"
	line "found this in the"
	cont "ruins of a temple"
	cont "in the desert?"
	done

ObscuraMuseumEmployeeRoomAbiegailText5:
	text "This is"
	line "unbelievable!"
	
	para "Ours was found in"
	line "the deep water"
	cont "to the NORTH of"
	cont "PORT SHIMMER."
	
	para "This could suggest"
	line "a connection bet-"
	cont "ween that area and"
	cont "the ancient people"
	cont "of the desert."
	
	para "More investigation"
	line "must be done."
	
	para "Seeing as you have"
	line "been so heavily"
	cont "involved so far,"
	
	para "I must ask for"
	line "your assitance"
	cont "one more time."
	
	para "Here, take this."
	done
	
ObscuraMuseumEmployeeRoomAbiegailText6:
	text "That HM will let"
	line "you dive under the"
	cont "water at certain"
	cont "spots."
	
	para "However, you will"
	line "need a GYM BADGE"
	cont "from our very own"
	cont "ROCKY to use it."
	
	para "With it, I want"
	line "you to explore the"
	cont "waters NORTH of"
	cont "PORT SHIMMER."
	
	para "If my hunch is"
	line "correct, you just"
	cont "might find signs"
	cont "of ancient civili-"
	cont "ization nearby."
	
	para "Who knows what new"
	line "information such a"
	cont "discovery could"
	cont "bring to light!"
	
	para "I'm counting on"
	line "you, <PLAYER>."
	
	para "If you find any"
	line "information,"
	cont "let me know!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText7:
	text "<PLAYER>!<WAIT_S>"
	line "What's the news?"
	
	para "…<WAIT_L>You're kidding!"
	
	para "Yet more ruins?"
	
	para "Then my hunch was"
	line "spot on!"
	
	para "And you say you"
	line "found an artifact?"
	
	para "Well let's see!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText8:
	text "Hmm…"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText9:
	text "Unbelievable!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText10:
	text "Extraordinary!!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText11:
	text "Absolutely"
	line "astonishing!!!"
	done
	
ObscuraMuseumEmployeeRoomAbiegailText12:
	text "It looks just like"
	line "a modern #BALL!"
	
	para "But it predates"
	line "any record we have"
	cont "of the creation of"
	cont "the #BALL!"
	
	para "This will change"
	line "our knowledge of"
	cont "the relationship"
	cont "between ancient"
	cont "man and #MON!"
	
	para "This is an"
	line "incredible find!"
	
	para "My father spent"
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
	
ObscuraMuseumEmployeeRoomAbiegailText13:
	text "You've done more"
	line "for my father than"
	cont "you'll ever know."
	
	para "He told me that"
	line "you were one of"
	cont "the kids that was"
	cont "sent one of his"
	cont "starter #MON."
	
	para "And now look at"
	line "you!"
	
	para "I'm sure you know"
	line "this, but you've"
	cont "really made the"
	cont "old man proud!"
	done
	
Movement_Abie_1:
	turn_step_left
	turn_step_left
	turn_step_left
	step_end
	
Movement_Abie_2:
	turn_step_right
	turn_step_right
	turn_step_right
	step_end
	
Movement_Abie_3:
	turn_step_up
	turn_step_up
	turn_step_up
	step_end
	
Movement_Abie_4:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end
	
Movement_Abie_5:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end

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
	writetext ObscuraMuseumComputer1Text2
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
	writetext ObscuraMuseumKeyboardText3
	waitbutton
	closetext
	end
.nope
	jumptext ObscuraMuseumComputer1Text1
	
ObscuraMuseumKeyboard2:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumComputer2Text2
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
	writetext ObscuraMuseumKeyboardText3
	waitbutton
	closetext
	end
.nope
	jumptext ObscuraMuseumComputer2Text1
	
ObscuraMuseumKeyboard3:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumComputer3Text2
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
	writetext ObscuraMuseumKeyboardText3
	waitbutton
	closetext
	end
.nope
	jumptext ObscuraMuseumComputer3Text1
	
ObscuraMuseumKeyboard4:
	checkevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	iffalse .nope
	opentext
	writetext ObscuraMuseumComputer4Text2
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
	writetext ObscuraMuseumKeyboardText3
	waitbutton
	closetext
	end
.nope
	jumptext ObscuraMuseumComputer4Text1
	
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
	loadtrainer GRUNTM, MUSEUM_GRUNTM_5
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
	loadtrainer GRUNTM, MUSEUM_GRUNTM_6
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
	
	para "Activate the"
	line "terminal?"
	done
	
ObscuraMuseumComputer2Text1:
	text "“TERMINAL <SHARP>2”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer2Text2:
	text "“TERMINAL <SHARP>2”"
	
	para "Activate the"
	line "terminal?"
	done
	
ObscuraMuseumComputer3Text1:
	text "“TERMINAL <SHARP>3”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer3Text2:
	text "“TERMINAL <SHARP>3”"
	
	para "Activate the"
	line "terminal?"
	done
	
ObscuraMuseumComputer4Text1:
	text "“TERMINAL <SHARP>4”"
	
	para "Better not touch"
	line "it…"
	done
	
ObscuraMuseumComputer4Text2:
	text "“TERMINAL <SHARP>4”"
	
	para "Activate the"
	line "terminal?"
	done
	
ObscuraMuseumKeyboardText1:
	text "Better not touch"
	line "it…"
	done
	
ObscuraMuseumKeyboardText2:
	text "Activate the"
	line "terminal?"
	done
	
ObscuraMuseumKeyboardText3:
	text "Better not…"
	done
	