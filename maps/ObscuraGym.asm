ObscuraGym_MapScriptHeader:
	db 0 ; scene scripts
	
	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraGymCallback

	db 2 ; warp events
	warp_def 23, 14, 2, OBSCURA_MUSEUM_2F
	warp_def 23, 15, 3, OBSCURA_MUSEUM_2F

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_ROCKY,  2, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraGymRocky, -1
	person_event SPRITE_RECEPTIONIST, 17, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymClerk1, -1
	person_event SPRITE_RECEPTIONIST,  8, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraGymClerk2, -1
	person_event SPRITE_RECEPTIONIST,  6,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady1, -1
	person_event SPRITE_RECEPTIONIST,  6, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady2, -1
	person_event SPRITE_RECEPTIONIST, 15,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady3, -1
	person_event SPRITE_RECEPTIONIST, 15, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady4, -1

	
	const_def 1 ; object constants
	const OBSCURA_GYM_ROCKY
	const OBSCURA_GYM_CLERK_1
	const OBSCURA_GYM_CLERK_2
	const OBSCURA_GYM_QUIZ_LADY_1
	const OBSCURA_GYM_QUIZ_LADY_2
	const OBSCURA_GYM_QUIZ_LADY_3
	const OBSCURA_GYM_QUIZ_LADY_4
	
ObscuraGymCallback:
	domaptrigger OBSCURA_MUSEUM_2F, $0
	checkevent EVENT_OBSCURA_GYM_LOCKED
	iffalse .skip_1
	changeblock $e, $16, $93
.skip_1
	checkevent EVENT_OBSCURA_GYM_ROPES_1
	iffalse .skip_2
	changeblock $a, $12, $4b
	changeblock $12, $12, $4b
.skip_2
	checkevent EVENT_OBSCURA_GYM_ROPES_2
	iffalse .skip_3
	changeblock $e, $8, $4b
.skip_3
	return
	
ObscuraGymRocky:
	end
	
ObscuraGymClerk1:
	opentext
	checkevent EVENT_OBSCURA_GYM_LOCKED
	iftrue .quizstarted
	checkevent EVENT_OBSCURA_GYM_CLERK_1_TALKED_ONCE
	iftrue .talked
	setevent EVENT_OBSCURA_GYM_CLERK_1_TALKED_ONCE
	writetext ObscuraGymClerk1Text1
	jump .yesno
.talked
	writetext ObscuraGymClerk1Text2
	yesorno
	iffalse .no_explanation
	writetext ObscuraGymClerk1Text6
	jump .yesno
.no_explanation
	writetext ObscuraGymClerk1Text7
.yesno
	yesorno
	iffalse .no
.start
	writetext ObscuraGymClerk1Text3
	waitbutton
	closetext
	pause 10
	special FadeOutPalettesBlack
	changeblock $e, $16, $93
	changeblock $a, $12, $4b
	changeblock $12, $12, $4b
	closetext
	setevent EVENT_OBSCURA_GYM_LOCKED
	setevent EVENT_OBSCURA_GYM_ROPES_1
	pause 40
	special FadeInTextboxPalettes
	pause 10
	loadvar wObscuraQuizzesDone, 0
	jumptext ObscuraGymClerk1Text5
.no
	writetext ObscuraGymClerk1Text4
	waitbutton
	closetext
	end
.quizstarted
	writetext ObscuraGymClerk1Text5
	waitbutton
	closetext
	end
	
ObscuraGymClerk1Text1:
	text "Welcome to the"
	line "OBSCURA CITY"
	cont "#MON GYM!"
	
	para "How has your visit"
	line "to the MUSEUM been"
	cont "today?"
	
	para "Have you been"
	line "paying attention?"
	
	para "I hope so, because"
	line "it's quiz time!"
	
	para "If you want to see"
	line "the GYM LEADER,"
	cont "you'll need to pass"
	cont "four crazy quizes!"
	
	para "You'll have just"
	line "15 seconds to"
	cont "answer 3 questions"
	cont "relating to things"
	cont "you've learned here"
	cont "at the MUSEUM."
	
	para "If you get one"
	line "wrong or let the"
	cont "clock run out,"
	
	para "then it's battle"
	line "time instead!"
	
	para "Either way, talk"
	line "to the nice lady"
	cont "in red when you"
	cont "are finished."
	
	para "She'll let you"
	line "through to the"
	cont "GYM LEADER."
	
	para "Oh, and one more"
	line "thing:"
	
	para "Once you start,"
	line "we'll have to lock"
	cont "the doors."
	
	para "You'd better be"
	line "prepared."
	
	para "Alright, are"
	line "you ready?"
	done
	
ObscuraGymClerk1Text2:
	text "Welcome to the"
	line "OBSCURA CITY"
	cont "#MON GYM!"
	
	para "How has your visit"
	line "to the MUSEUM been"
	cont "today?"
	
	para "Do you need an"
	line "explanation?"
	done
	
ObscuraGymClerk1Text3:
	text "I'll move the"
	line "ropes and lock"
	cont "the doors."
	done
	
ObscuraGymClerk1Text4:
	text "Last second cram"
	line "session?"
	done
	
ObscuraGymClerk1Text5:
	text "Good luck, and"
	line "remember:"
	
	para "Haaave fun"
	line "with it!"
	done
	
ObscuraGymClerk1Text6:
	text "Have you been"
	line "paying attention?"
	
	para "I hope so, because"
	line "it's quiz time!"
	
	para "If you want to see"
	line "the GYM LEADER,"
	cont "you'll need to pass"
	cont "four crazy quizes!"
	
	para "You'll have just"
	line "15 seconds to"
	cont "answer 3 questions"
	cont "relating to things"
	cont "you've learned here"
	cont "at the MUSEUM."
	
	para "If you get one"
	line "wrong or let the"
	cont "clock run out,"
	
	para "then it's battle"
	line "time instead!"
	
	para "Either way, talk"
	line "to the nice lady"
	cont "in red when you"
	cont "are finished."
	
	para "She'll let you"
	line "through to the"
	cont "GYM LEADER."
	
	para "Oh, and one more"
	line "thing:"
	
	para "Once you start,"
	line "we'll have to lock"
	cont "the doors."
	
	para "You'd better be"
	line "prepared."
	
	para "Alright, are"
	line "you ready?"
	done
	
ObscuraGymClerk1Text7:
	text "Alright, are"
	line "you ready?"
	done
	
ObscuraGymClerk2:
	faceplayer
	checkevent EVENT_OBSCURA_GYM_ROPES_2
	iftrue .ropesdone
	opentext
	writetext ObscuraGymClerk2Text1
	pause 15
	callasm ObscuraGymCheckCounterAsm
	if_equal 4, .done_all
	writetext ObscuraGymClerk2Text2
	waitbutton
	closetext
	spriteface OBSCURA_GYM_CLERK_2, DOWN
	end
.done_all
	writetext ObscuraGymClerk2Text3
	playsound SFX_LEVEL_UP
	waitsfx
	wait 2
	writetext ObscuraGymClerk2Text4
	waitbutton
	closetext
	spriteface OBSCURA_GYM_CLERK_2, RIGHT
	pause 10
	special FadeOutPalettesBlack
	changeblock $e, $8, $4b
	closetext
	setevent EVENT_OBSCURA_GYM_ROPES_2
	pause 40
	faceplayer
	special FadeInTextboxPalettes
	pause 10
	loadvar wObscuraQuizzesDone, 0
.ropesdone
	opentext
	writetext ObscuraGymClerk2Text5
	waitbutton
	closetext
	spriteface OBSCURA_GYM_CLERK_2, DOWN
	end
	
ObscuraGymClerk2Text1:
	text "If you see the"
	line "GYM LEADER,"
	
	para "you'll need to"
	line "have finished all"
	cont "4 quizzes."
	
	para "Let's see…"
	done
	
ObscuraGymClerk2Text2:
	text "<WAIT_L>Nope!"
	
	para "Come back when"
	line "you're done!"
	done
	
ObscuraGymClerk2Text3:
	text "<WAIT_L>Ok!"
	
	para "All 4 quizzes are"
	line "done!"
	done
	
ObscuraGymClerk2Text4:
	text "I'll move the rope."
	done
	
ObscuraGymClerk2Text5:
	text "Good luck against"
	line "the GYM LEADER."
	done
	
ObscuraGymQuizLady1:
	checkevent EVENT_OBSCURA_QUIZ_1_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz1YesOrNoText
	yesorno
	iffalse .no
;question 1
	writetext ObscuraGymQ1Q1Text
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	callasm ObscuraGymSetupTimerBoxAsm
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q1Q1MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question1TimesUp
	if_not_equal 3, .Question1Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ1Q1CorrectText
	waitbutton
;question 2
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ1Q2Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q1Q2MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question2TimesUp
	if_not_equal 2, .Question2Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ1Q2CorrectText
	waitbutton
;question 3
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ1Q3Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q1Q3MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question3TimesUp
	if_not_equal 1, .Question3Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ1Q3CorrectText
	waitbutton
;wrap up
	setevent EVENT_OBSCURA_QUIZ_1_FINISHED
	setevent EVENT_OBSCURA_QUIZ_1_PASSED
	scall ObscuraQuizCleanUp
	playsound SFX_CAUGHT_MON
	writetext ObscuraGymQuiz1PassedText
	waitsfx
	closetext
	end
.no
	writetext ObscuraGymQuizNoText
	waitbutton
	closetext
	end
.Question1Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ1Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ1Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ1Q3WrongText
	waitbutton
	closetext
	jump .battle
.Question1TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ1Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ1Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ1Q3WrongText
	waitbutton
	closetext
.battle
	waitsfx
	winlosstext ObscuraQuiz1WinText, 0
	setlasttalked OBSCURA_GYM_QUIZ_LADY_1
	loadtrainer YOUNGSTER, JOEY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext ObscuraQuiz1PostBattleText
	waitbutton
	closetext
	setevent EVENT_OBSCURA_QUIZ_1_FINISHED
	end
	
.Q1Q1MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q1Q1MenuData2
	db 1 ; default option

.Q1Q1MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	
.Q1Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q1Q2MenuData2
	db 1 ; default option

.Q1Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	
.Q1Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q1Q3MenuData2
	db 1 ; default option

.Q1Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	db "WRONG@"

ObscuraGymQuizLady2:
	checkevent EVENT_OBSCURA_QUIZ_2_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz2YesOrNoText
	yesorno
	iffalse .no
;question 1
	writetext ObscuraGymQ2Q1Text
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	callasm ObscuraGymSetupTimerBoxAsm
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q2Q1MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question1TimesUp
	if_not_equal 3, .Question1Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ2Q1CorrectText
	waitbutton
;question 2
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ2Q2Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q2Q2MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question2TimesUp
	if_not_equal 2, .Question2Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ2Q2CorrectText
	waitbutton
;question 3
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ2Q3Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q2Q3MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question3TimesUp
	if_not_equal 1, .Question3Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ2Q3CorrectText
	waitbutton
;wrap up
	setevent EVENT_OBSCURA_QUIZ_2_FINISHED
	setevent EVENT_OBSCURA_QUIZ_2_PASSED
	scall ObscuraQuizCleanUp
	playsound SFX_CAUGHT_MON
	writetext ObscuraGymQuiz2PassedText
	waitsfx
	closetext
	end
.no
	writetext ObscuraGymQuizNoText
	waitbutton
	closetext
	end
.Question1Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ2Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ2Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ2Q3WrongText
	waitbutton
	closetext
	jump .battle
.Question1TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ2Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ2Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ2Q3WrongText
	waitbutton
	closetext
.battle
	waitsfx
	winlosstext ObscuraQuiz2WinText, 0
	setlasttalked OBSCURA_GYM_QUIZ_LADY_2
	loadtrainer YOUNGSTER, JOEY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext ObscuraQuiz2PostBattleText
	waitbutton
	closetext
	setevent EVENT_OBSCURA_QUIZ_2_FINISHED
	end
	
.Q2Q1MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q2Q1MenuData2
	db 1 ; default option

.Q2Q1MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	
.Q2Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q2Q2MenuData2
	db 1 ; default option

.Q2Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	
.Q2Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q2Q3MenuData2
	db 1 ; default option

.Q2Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	db "WRONG@"

ObscuraGymQuizLady3:
	checkevent EVENT_OBSCURA_QUIZ_3_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz3YesOrNoText
	yesorno
	iffalse .no
;question 1
	writetext ObscuraGymQ3Q1Text
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	callasm ObscuraGymSetupTimerBoxAsm
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q3Q1MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question1TimesUp
	if_not_equal 3, .Question1Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ3Q1CorrectText
	waitbutton
;question 2
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ3Q2Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q3Q2MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question2TimesUp
	if_not_equal 2, .Question2Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ3Q2CorrectText
	waitbutton
;question 3
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ3Q3Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q3Q3MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question3TimesUp
	if_not_equal 1, .Question3Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ3Q3CorrectText
	waitbutton
;wrap up
	setevent EVENT_OBSCURA_QUIZ_3_FINISHED
	setevent EVENT_OBSCURA_QUIZ_3_PASSED
	scall ObscuraQuizCleanUp
	playsound SFX_CAUGHT_MON
	writetext ObscuraGymQuiz3PassedText
	waitsfx
	closetext
	end
.no
	writetext ObscuraGymQuizNoText
	waitbutton
	closetext
	end
.Question1Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ3Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ3Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ3Q3WrongText
	waitbutton
	closetext
	jump .battle
.Question1TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ3Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ3Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ3Q3WrongText
	waitbutton
	closetext
.battle
	waitsfx
	winlosstext ObscuraQuiz1WinText, 0
	setlasttalked OBSCURA_GYM_QUIZ_LADY_3
	loadtrainer YOUNGSTER, JOEY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext ObscuraQuiz3PostBattleText
	waitbutton
	closetext
	setevent EVENT_OBSCURA_QUIZ_3_FINISHED
	end
	
.Q3Q1MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q3Q1MenuData2
	db 1 ; default option

.Q3Q1MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	
.Q3Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q3Q2MenuData2
	db 1 ; default option

.Q3Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	
.Q3Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q3Q3MenuData2
	db 1 ; default option

.Q3Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	db "WRONG@"

ObscuraGymQuizLady4:
	checkevent EVENT_OBSCURA_QUIZ_4_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz4YesOrNoText
	yesorno
	iffalse .no
;question 1
	writetext ObscuraGymQ4Q1Text
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	callasm ObscuraGymSetupTimerBoxAsm
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q4Q1MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question1TimesUp
	if_not_equal 3, .Question1Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ4Q1CorrectText
	waitbutton
;question 2
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ4Q2Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q4Q2MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question2TimesUp
	if_not_equal 2, .Question2Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ4Q2CorrectText
	waitbutton
;question 3
	callasm ObscuraGymPrintQuestionNumberAsm
	writetext ObscuraGymQ4Q3Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q4Q3MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question3TimesUp
	if_not_equal 1, .Question3Wrong
	scall ObscuraGymCorrect
	writetext ObscuraGymQ4Q3CorrectText
	waitbutton
;wrap up
	setevent EVENT_OBSCURA_QUIZ_4_FINISHED
	setevent EVENT_OBSCURA_QUIZ_4_PASSED
	scall ObscuraQuizCleanUp
	playsound SFX_CAUGHT_MON
	writetext ObscuraGymQuiz4PassedText
	waitsfx
	closetext
	end
.no
	writetext ObscuraGymQuizNoText
	waitbutton
	closetext
	end
.Question1Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ4Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ4Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3Wrong
	scall ObscuraGymWrong
	writetext ObscuraGymQ4Q3WrongText
	waitbutton
	closetext
	jump .battle
.Question1TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ4Q1WrongText
	waitbutton
	closetext
	jump .battle
.Question2TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ4Q2WrongText
	waitbutton
	closetext
	jump .battle
.Question3TimesUp
	scall QuizTimesUp
	writetext ObscuraGymQ4Q3WrongText
	waitbutton
	closetext
.battle
	waitsfx
	winlosstext ObscuraQuiz4WinText, 0
	setlasttalked OBSCURA_GYM_QUIZ_LADY_4
	loadtrainer YOUNGSTER, JOEY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext ObscuraQuiz4PostBattleText
	waitbutton
	closetext
	setevent EVENT_OBSCURA_QUIZ_4_FINISHED
	end
	
.Q4Q1MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q4Q1MenuData2
	db 1 ; default option

.Q4Q1MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	
.Q4Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q4Q2MenuData2
	db 1 ; default option

.Q4Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "WRONG@"
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	
.Q4Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q4Q3MenuData2
	db 1 ; default option

.Q4Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "CORRECT@"
	db "WRONG@"
	db "WRONG@"
	db "WRONG@"
	
ObscuraGymIncQuizCounterAsm:
	ld a, [wObscuraQuizzesDone]
	inc a
	ld [wObscuraQuizzesDone], a
	ret
	
ObscuraGymCheckCounterAsm:
	ld a, [wObscuraQuizzesDone]
	ld [wScriptVar], a
	ret
	
ObscuraGymPrintQuestionNumberAsm:
	ld a, [wMuseumQuizQuestionNumber]
	inc a
	ld [wMuseumQuizQuestionNumber], a
	hlcoord 10, 1
	ld de, wMuseumQuizQuestionNumber
	lb bc, 1, 1
	jp PrintNum
	
ObscuraGymSetupTimerBoxAsm:
	hlcoord 0, 0
	lb bc, 1, 12
	call TextBox
	hlcoord 14, 0
	lb bc, 1, 4
	call TextBox
	hlcoord 15, 0
	ld de, .TimeString
	call PlaceString
	hlcoord 1, 1
	ld de, .QuestionString
	call PlaceString
	hlcoord 16, 1
	ld de, wCurrentAirportBaggage
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
	
.TimeString:
	db "TIME@"
	
.QuestionString:
	db "QUESTION 1/3@"
	
ObscuraQuizCleanUp:
	clearevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadvar wMuseumQuizQuestionNumber, 0
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	callasm ObscuraGymIncQuizCounterAsm
	end
	
ObscuraGymCorrect:
	clearevent EVENT_OBSCURA_QUIZ_ACTIVE
	playsound SFX_LEVEL_UP
	writetext ObscuraGymCorrectText
	waitsfx
	wait 2
	end
	
ObscuraGymWrong:
	scall ObscuraQuizCleanUp
	playsound SFX_WRONG
	writetext ObscuraGymWrongText
	waitsfx
	wait 8
	end
	
QuizTimesUp:
	scall ObscuraQuizCleanUp
	playsound SFX_WRONG
	writetext ObscuraGymTimesUpText
	waitsfx
	wait 8
	end
	
ObscuraGymQuizAlreadyDone:
	jumptextfaceplayer ObscuraGymQuizAlreadyDoneText
	
ObscuraGymQuiz1YesOrNoText:
	text "Start quiz 1?"
	done
	
ObscuraGymQ1Q1Text:
	text "Quiz 1"
	line "Question 1"
	done
	
ObscuraGymQ1Q1CorrectText:
	text "Q1Q1"
	line "Correct!"
	done
	
ObscuraGymQ1Q1WrongText:
	text "Q1Q1"
	line "Wrong!"
	done
	
ObscuraGymQ1Q2Text:
	text "Quiz 1"
	line "Question 2"
	done
	
ObscuraGymQ1Q2CorrectText:
	text "Q1Q2"
	line "Correct!"
	done
	
ObscuraGymQ1Q2WrongText:
	text "Q1Q2"
	line "Wrong!"
	done
	
ObscuraGymQ1Q3Text:
	text "Quiz 1"
	line "Question 3"
	done
	
ObscuraGymQ1Q3CorrectText:
	text "Q1Q3"
	line "Correct!"
	done
	
ObscuraGymQ1Q3WrongText:
	text "Q1Q3"
	line "Wrong!"
	done
	
ObscuraQuiz1WinText:
	text "Q1 YOU WIN!"
	done
	
ObscuraQuiz1PostBattleText:
	text "Q1 Battle done."
	done
	
ObscuraGymQuiz1PassedText:
	text "Q1 Passed!"
	done

ObscuraGymQuiz2YesOrNoText:
	text "Start quiz 2?"
	done
	
ObscuraGymQ2Q1Text:
	text "Quiz 2"
	line "Question 1"
	done
	
ObscuraGymQ2Q1CorrectText:
	text "Q2Q1"
	line "Correct!"
	done
	
ObscuraGymQ2Q1WrongText:
	text "Q2Q1"
	line "Wrong!"
	done
	
ObscuraGymQ2Q2Text:
	text "Quiz 2"
	line "Question 2"
	done
	
ObscuraGymQ2Q2CorrectText:
	text "Q2Q2"
	line "Correct!"
	done
	
ObscuraGymQ2Q2WrongText:
	text "Q2Q2"
	line "Wrong!"
	done
	
ObscuraGymQ2Q3Text:
	text "Quiz 2"
	line "Question 3"
	done
	
ObscuraGymQ2Q3CorrectText:
	text "Q2Q3"
	line "Correct!"
	done
	
ObscuraGymQ2Q3WrongText:
	text "Q2Q3"
	line "Wrong!"
	done
	
ObscuraQuiz2WinText:
	text "Q2 YOU WIN!"
	done

ObscuraQuiz2PostBattleText:
	text "Q2 Battle done."
	done

ObscuraGymQuiz2PassedText:
	text "Q2 Passed!"
	done

ObscuraGymQuiz3YesOrNoText:
	text "Start quiz 3?"
	done
	
ObscuraGymQ3Q1Text:
	text "Quiz 3"
	line "Question 1"
	done
	
ObscuraGymQ3Q1CorrectText:
	text "Q3Q1"
	line "Correct!"
	done
	
ObscuraGymQ3Q1WrongText:
	text "Q3Q1"
	line "Wrong!"
	done
	
ObscuraGymQ3Q2Text:
	text "Quiz 3"
	line "Question 2"
	done
	
ObscuraGymQ3Q2CorrectText:
	text "Q3Q2"
	line "Correct!"
	done
	
ObscuraGymQ3Q2WrongText:
	text "Q3Q2"
	line "Wrong!"
	done
	
ObscuraGymQ3Q3Text:
	text "Quiz 3"
	line "Question 3"
	done
	
ObscuraGymQ3Q3CorrectText:
	text "Q3Q3"
	line "Correct!"
	done
	
ObscuraGymQ3Q3WrongText:
	text "Q3Q3"
	line "Wrong!"
	done
	
ObscuraQuiz3WinText:
	text "Q3 YOU WIN!"
	done

ObscuraQuiz3PostBattleText:
	text "Q3 Battle done."
	done

ObscuraGymQuiz3PassedText:
	text "Q3 Passed!"
	done

ObscuraGymQuiz4YesOrNoText:
	text "Start quiz 4?"
	done
	
ObscuraGymQ4Q1Text:
	text "Quiz 4"
	line "Question 1"
	done
	
ObscuraGymQ4Q1CorrectText:
	text "Q4Q1"
	line "Correct!"
	done
	
ObscuraGymQ4Q1WrongText:
	text "Q4Q1"
	line "Wrong!"
	done
	
ObscuraGymQ4Q2Text:
	text "Quiz 4"
	line "Question 2"
	done
	
ObscuraGymQ4Q2CorrectText:
	text "Q4Q2"
	line "Correct!"
	done
	
ObscuraGymQ4Q2WrongText:
	text "Q4Q2"
	line "Wrong!"
	done
	
ObscuraGymQ4Q3Text:
	text "Quiz 4"
	line "Question 3"
	done
	
ObscuraGymQ4Q3CorrectText:
	text "Q4Q3"
	line "Correct!"
	done
	
ObscuraGymQ4Q3WrongText:
	text "Q4Q3"
	line "Wrong!"
	done
	
ObscuraQuiz4WinText:
	text "Q4 YOU WIN!"
	done
	
ObscuraQuiz4PostBattleText:
	text "Q4 Battle done."
	done
	
ObscuraGymQuiz4PassedText:
	text "Q4 Passed!"
	done
	
ObscuraGymQuizNoText:
	text "Next time then."
	done

ObscuraGymCorrectText:
	text "Correct!"
	done

ObscuraGymWrongText:
	text "Wrong!"
	done

ObscuraGymTimesUpText:
	text "Time's up!"
	done
	
ObscuraGymQuizAlreadyDoneText:
	text "Already done."
	done
