ObscuraGym_MapScriptHeader:
	db 0 ; scene scripts
	
	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraGymCallback

	db 2 ; warp events
	warp_def 23, 14, 2, OBSCURA_MUSEUM_2F
	warp_def 23, 15, 3, OBSCURA_MUSEUM_2F

	db 0 ; coord events

	db 0 ; bg events

	db 12 ; object events
	person_event SPRITE_ROCKY,  2, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraGymRocky, -1
	person_event SPRITE_RECEPTIONIST, 17, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymClerk1, -1
	person_event SPRITE_RECEPTIONIST,  8, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraGymClerk2, EVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST,  6,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady1, EVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST,  6, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady2, EVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST, 15,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady3, EVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST, 15, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymQuizLady4, EVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST,  8, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraGymTrainerRematch5, EVENT_HAVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST,  6,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymTrainerRematch1, EVENT_HAVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST,  6, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymTrainerRematch2, EVENT_HAVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST, 15,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymTrainerRematch3, EVENT_HAVENT_BEAT_ROCKY
	person_event SPRITE_RECEPTIONIST, 15, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymTrainerRematch4, EVENT_HAVENT_BEAT_ROCKY

	
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
	faceplayer
	opentext TEXTBOX_ROCKY
	checkevent EVENT_BEAT_ROCKY
	iftrue .FightDone
	writetext ObscuraGymRockyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext ObscuraGymRockyTextWin, ObscuraGymRockyTextLoss
	loadtrainer ROCKY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKY
	clearevent EVENT_HAVENT_BEAT_ROCKY
	clearevent EVENT_OBSCURA_GYM_LOCKED
	setevent EVENT_OBSCURA_GYM_ROPES_1
	setevent EVENT_OBSCURA_GYM_ROPES_2
	opentext
	writetext Text_ReceivedSeventhBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SEVENTHBADGE
	checkcode VAR_BADGES
	changetextboxspeaker TEXTBOX_ROCKY
	
.FightDone:
	checkevent EVENT_GOT_TM_FROM_ROCKY
	iftrue .GotTMFromRocky
	writetext ObscuraGymRockyTextAfterBattle
	buttonsound
	changetextboxspeaker
	verbosegivetmhm TM_VENOSHOCK
	setevent EVENT_GOT_TM_FROM_ROCKY
	changetextboxspeaker TEXTBOX_ROCKY
	writetext ObscuraGymRockyTextTMSpeech
	waitbutton
	closetext
	spriteface OBSCURA_GYM_ROCKY, DOWN
	end

.GotTMFromRocky:
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_1_REMATCH
	iffalse RockyTextLoop
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_2_REMATCH
	iffalse RockyTextLoop
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_3_REMATCH
	iffalse RockyTextLoop
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_4_REMATCH
	iffalse RockyTextLoop
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_5_REMATCH
	iftrue ObscuraGymRockyRematch
RockyTextLoop:
	writetext ObscuraGymRockyTextLoop
	waitbutton
	closetext
	end
	
ObscuraGymRockyRematch:
	checkevent EVENT_BEAT_ROCKY_REMATCH
	iftrue RockyTextLoop
	writetext ObscuraGymRockyTextBeforeBattleRematch
	yesorno
	iffalse .end
	writetext ObscuraGymRockyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext ObscuraGymRockyTextWinRematch, ObscuraGymRockyTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	loadtrainer ROCKY, 1
	jump .cont
.eightbadges
	loadtrainer ROCKY, 2
.cont
	startbattle
	reloadmapafterbattle
	opentext TEXTBOX_ROCKY
	writetext ObscuraGymRockyTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_ROCKY_REMATCH
	spriteface OBSCURA_GYM_ROCKY, DOWN
	end
.end
	writetext ObscuraGymRockyTextNoRematch
	waitbutton
	closetext
	end
	
ObscuraGymRockyTextBeforeBattle:
	text "BEFORE BATTLE"
	done
	
ObscuraGymRockyTextAfterBattle:
	text "AFTER BATTLE"
	done
	
ObscuraGymRockyTextTMSpeech:
	text "TM SPEECH"
	done
	
ObscuraGymRockyTextLoop:
	text "TEXT LOOP"
	done
	
Text_ReceivedSeventhBadge:
	text "<PLAYER> received"
	line "the GEOBADGE."
	done
	
ObscuraGymRockyTextBeforeBattleRematch:
	text "BEFORE BATTLE"
	line "REMATCH"
	done
	
ObscuraGymRockyTextNoRematch:
	text "NO REMATCH"
	done
	
ObscuraGymRockyTextWin:
	text "YOU WIN"
	done
	
ObscuraGymRockyTextLoss:
	text "YOU LOSE"
	done
	
ObscuraGymRockyTextWinRematch:
	text "YOU WIN REMATCH"
	done
	
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
	wait 6
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
	writetext ObscuraGymClerk2Text6
	loadmenu .FinalQustionMenuData
	verticalmenu
	closewindow
	if_equal 1, .rocky
;.rockford
	writetext ObscuraGymClerk2Text7
	jump .cont
.rocky
	writetext ObscuraGymClerk2Text8
.cont
	waitbutton
	closetext
	waitsfx
	winlosstext ObscuraGymClerk2WinText, 0
	setlasttalked OBSCURA_GYM_CLERK_2
	loadtrainer MUSEUM_GUIDE_2, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
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
	
.FinalQustionMenuData:
	db $40 ; flags
	db 06, 00 ; start coords
	db 11, 10 ; end coords
	dw .FinalQustionMenuData2
	db 1 ; default option

.FinalQustionMenuData2:
	db $80 ; flags
	db 2 ; items
	db "ROCKY@"
	db "ROCKFORD@"
	db "12@"
	db "4@"
	
ObscuraGymClerk2Text1:
	text "If you want to see"
	line "the GYM LEADER,"
	
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
	text "<WAIT_L>All 4 quizzes are"
	line "done!"
	done
	
ObscuraGymClerk2Text4:
	text "Alright, no more"
	line "quizzes."
	
	para "I'll move the rope"
	line "for real now."
	done
	
ObscuraGymClerk2Text5:
	text "Say hi to ROCKY"
	line "for me."
	done
	
ObscuraGymClerk2Text6:
	text "Ok!<WAIT_S> I'll move the"
	line "rope."
	
	para "…<WAIT_L><WAIT_L>But first one"
	line "more question!"
	
	para "Sorry, he made"
	line "me do this…"
	
	para "Here we go."
	line "Last question:"
	
	para "What is our GYM"
	line "LEADER's name?"
	done
	
ObscuraGymClerk2Text7:
	text "The answer is…<WAIT_L>"
	line "ROCKY!"
	
	para "He insists that"
	line "everyone call him"
	cont "“ROCKFORD”, but"
	cont "no one does that!"
	
	para "So that means it's"
	line "battle time!"
	
	para "Sorry!"
	done
	
ObscuraGymClerk2Text8:
	text "The answer is…<WAIT_L>"
	line "ROCKFORD!"
	
	para "He desparately"
	line "wants people to"
	cont "call him by his"
	cont "full name."
	
	para "“It's a matter of"
	line "respect”, he says."
	
	para "“Don't let them"
	line "pass unless they"
	cont "call me ROCKFORD”."
	
	para "So that means it's"
	line "battle time!"
	
	para "Sorry!"
	done
	
ObscuraGymClerk2WinText:
	text "Well done."
	done
	
ObscuraGymQuizLadyGymDone:
	jumptextfaceplayer ObscuraGymTrainer1RematchRegularText
	
ObscuraGymQuizLady1:
	checkevent EVENT_BEAT_ROCKY
	iftrue ObscuraGymQuizLadyGymDone
	checkevent EVENT_OBSCURA_QUIZ_1_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz1YesOrNoText
	yesorno
	iffalse .no
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	writetext ObscuraGymFirstQuestionText
	playmusic MUSIC_EVOLUTION
	wait 5
;question 1
	callasm ObscuraGymSetupTimerBoxAsm
	writetext ObscuraGymQ1Q1Text
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
	playmapmusic
	scall ObscuraGymQuizDone
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
	loadtrainer MUSEUM_GUIDE, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	scall ObscuraGymBattleDone
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
	db "3@"
	db "16@"
	db "12@"
	db "4@"
	
.Q1Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q1Q2MenuData2
	db 1 ; default option

.Q1Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "BLUE@"
	db "RED@"
	db "GREEN@"
	db "YELLOW@"
	
.Q1Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q1Q3MenuData2
	db 1 ; default option

.Q1Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "PLANT@"
	db "BOOKSHELF@"
	db "TRASH CAN@"
	db "FLOOR MAT@"

ObscuraGymQuizLady2:
	checkevent EVENT_BEAT_ROCKY
	iftrue ObscuraGymQuizLadyGymDone
	checkevent EVENT_OBSCURA_QUIZ_2_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz2YesOrNoText
	yesorno
	iffalse .no
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	writetext ObscuraGymFirstQuestionText
	playmusic MUSIC_EVOLUTION
	wait 5
;question 1
	callasm ObscuraGymSetupTimerBoxAsm
	writetext ObscuraGymQ2Q1Text
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
	if_not_equal 4, .Question3Wrong
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
	playmapmusic
	scall ObscuraGymQuizDone
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
	loadtrainer MUSEUM_GUIDE, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmapmusic
	scall ObscuraGymBattleDone
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
	db "4@"
	db "2@"
	db "3@"
	db "255@"
	
.Q2Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q2Q2MenuData2
	db 1 ; default option

.Q2Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "LEMONADE@"
	db "ROCK CANDY@"
	db "SUNSHINE TEA@"
	db "POTATO CHIPS@"
	
.Q2Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q2Q3MenuData2
	db 1 ; default option

.Q2Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "ROCKY@"
	db "WOODY@"
	db "SUDOWOODO@"
	db "PETRO@"

ObscuraGymQuizLady3:
	checkevent EVENT_BEAT_ROCKY
	iftrue ObscuraGymQuizLadyGymDone
	checkevent EVENT_OBSCURA_QUIZ_3_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz3YesOrNoText
	yesorno
	iffalse .no
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	writetext ObscuraGymFirstQuestionText
	playmusic MUSIC_EVOLUTION
	wait 5
;question 1
	callasm ObscuraGymSetupTimerBoxAsm
	writetext ObscuraGymQ3Q1Text
	setevent EVENT_OBSCURA_QUIZ_ACTIVE
	loadmenu .Q3Q1MenuData
	verticalmenu
	closewindow
	if_equal $69, .Question1TimesUp
	if_not_equal 4, .Question1Wrong
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
	playmapmusic
	scall ObscuraGymQuizDone
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
	winlosstext ObscuraQuiz3WinText, 0
	setlasttalked OBSCURA_GYM_QUIZ_LADY_3
	loadtrainer MUSEUM_GUIDE, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmapmusic
	scall ObscuraGymBattleDone
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
	db "FOOTPRINT IN ROCK@"
	db "DNA SAMPLE@"
	db "INSECT IN AMBER@"
	db "ALL ARE FOSSILS@"
	
.Q3Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q3Q2MenuData2
	db 1 ; default option

.Q3Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "PRESERVED WOOD@"
	db "WOOD-SHAPED STONE@"
	db "HARDWOOD@"
	db "FRIGHTENED WOOD@"
	
.Q3Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q3Q3MenuData2
	db 1 ; default option

.Q3Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "243 MILLION YEARS@"
	db "621 MILLION YEARS@"
	db "432 MILLION YEARS@"
	db "234 MILLION YEARS@"

ObscuraGymQuizLady4:
	checkevent EVENT_BEAT_ROCKY
	iftrue ObscuraGymQuizLadyGymDone
	checkevent EVENT_OBSCURA_QUIZ_4_FINISHED
	iftrue ObscuraGymQuizAlreadyDone
	opentext
	writetext ObscuraGymQuiz4YesOrNoText
	yesorno
	iffalse .no
	loadvar wMuseumQuizQuestionNumber, 1
	loadvar wRanchRaceFrames, 2
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, QUIZ_TIME_LIMIT
	writetext ObscuraGymFirstQuestionText
	playmusic MUSIC_EVOLUTION
	wait 5
;question 1	
	callasm ObscuraGymSetupTimerBoxAsm
	writetext ObscuraGymQ4Q1Text
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
	playmapmusic
	scall ObscuraGymQuizDone
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
	loadtrainer MUSEUM_GUIDE, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmapmusic
	scall ObscuraGymBattleDone
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
	db "FAST RUNNER@"
	db "FIERCE HUNTER@"
	db "GRACEFUL FLYER@"
	db "IT WAS ALL 3@"
	
.Q4Q2MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q4Q2MenuData2
	db 1 ; default option

.Q4Q2MenuData2:
	db $80 ; flags
	db 4 ; items
	db "HUGE WINGS@"
	db "STRONG JAW@"
	db "POWERFUL LEGS@"
	db "POTENT VENOM@"
	
.Q4Q3MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .Q4Q3MenuData2
	db 1 ; default option

.Q4Q3MenuData2:
	db $80 ; flags
	db 4 ; items
	db "STRONG LEGS@"
	db "LESS FUR@"
	db "SMALL WINGS@"
	db "MORE EYES@"
	
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
	
ObscuraGymQuizDone:
	callasm ObscuraGymCheckCounterAsm
	if_equal 1, .one
	if_equal 2, .two
	if_equal 3, .three
;.four
	writetext ObscuraGymQuiz4PassedText2
	jump .done
.one
	writetext ObscuraGymQuiz1PassedText2
	jump .done
.two
	writetext ObscuraGymQuiz2PassedText2
	jump .done
.three
	writetext ObscuraGymQuiz3PassedText2
.done
	waitbutton
	closetext
	end
	
ObscuraGymBattleDone:
	opentext
	writetext ObscuraGymPostBattleText
	playsound SFX_LEVEL_UP
	waitsfx
	callasm ObscuraGymCheckCounterAsm
	if_equal 1, .one
	if_equal 2, .two
	if_equal 3, .three
;.four
	writetext ObscuraQuiz4PostBattleText
	jump .done
.one
	writetext ObscuraQuiz1PostBattleText
	jump .done
.two
	writetext ObscuraQuiz2PostBattleText
	jump .done
.three
	writetext ObscuraQuiz3PostBattleText
.done
	waitbutton
	closetext
	end
	
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
	wait 1
	playsound SFX_QUIT_SLOTS
	waitsfx
	end
	
QuizTimesUp:
	scall ObscuraQuizCleanUp
	playsound SFX_WRONG
	writetext ObscuraGymTimesUpText
	waitsfx
	wait 1
	playsound SFX_QUIT_SLOTS
	waitsfx
	end
	
ObscuraGymQuizAlreadyDone:
	callasm ObscuraGymCheckCounterAsm
	if_equal 1, .one
	if_equal 2, .two
	if_equal 3, .three
;.four
	jumptextfaceplayer ObscuraQuiz4PostBattleText
.one
	jumptextfaceplayer ObscuraGymQuiz1PassedText2
.two
	jumptextfaceplayer ObscuraGymQuiz2PassedText2
.three
	jumptextfaceplayer ObscuraGymQuiz3PassedText2
	
ObscuraGymQuiz1YesOrNoText:
	text "This quiz is:"
	line "“EYE FOR DETAILS”."
	
	para "How well are you"
	line "aware of your"
	cont "surroundings?"
	
	para "Shall we get"
	line "started?"
	done
	
ObscuraGymQ1Q1Text:
	text "How many total"
	line "questions are"
	cont "there to answer"
	cont "in this GYM?"
	done
	
ObscuraGymQ1Q1CorrectText:
	text "12 questions!"
	
	para "Next question:"
	done
	
ObscuraGymQ1Q1WrongText:
	text "4 quizzes with"
	line "3 questions each."
	
	para "That's a total"
	line "of 12 questions!"
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ1Q2Text:
	text "What color is"
	line "lady by the rope"
	cont "barrier wearing?"
	done
	
ObscuraGymQ1Q2CorrectText:
	text "Red really suits"
	line "her, don't you"
	cont "think?"
	
	para "Ok, last question"
	line "for this quiz:"
	done
	
ObscuraGymQ1Q2WrongText:
	text "She wears red!"
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ1Q3Text:
	text "What is missing"
	line "from my station"
	cont "that all of the"
	cont "others have?"
	done
	
ObscuraGymQ1Q3CorrectText:
	text "I don't keep"
	line "a plant at my"
	cont "station because"
	cont "kept knocking"
	cont "it over…"
	done
	
ObscuraGymQ1Q3WrongText:
	text "Everyone but me"
	line "keeps a plant at"
	cont "their station."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraQuiz1WinText:
	text "Good job!"
	done
	
ObscuraQuiz1PostBattleText:
	text "3 more to go!"
	done
	
ObscuraGymQuiz1PassedText:
	text "Quiz complete!"
	done
	
ObscuraGymQuiz1PassedText2:
	text "Good job!"
	
	para "That's one quiz"
	line "down!"
	
	para "3 more to go!"
	done

ObscuraGymQuiz2YesOrNoText:
	text "This quiz is:"
	line "“MUSEUM TRIVIA”."
	
	para "How well do you"
	line "remember your trip"
	cont "to the MUSEUM?"
	
	para "Shall we get"
	line "started?"
	done
	
ObscuraGymQ2Q1Text:
	text "How many floors"
	line "does the MUSEUM"
	cont "have?"
	done
	
ObscuraGymQ2Q1CorrectText:
	text "The MUSEUM has"
	line "3 floors."
	
	para "Next question:"
	done
	
ObscuraGymQ2Q1WrongText:
	text "The MUSEUM has"
	line "3 floors."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ2Q2Text:
	text "What unique item"
	line "is sold in the"
	cont "VENDING MACHINE on"
	cont "the first floor?"
	done
	
ObscuraGymQ2Q2CorrectText:
	text "The ROCK CANDY"
	line "sold here is so"
	cont "popular, we have"
	cont "trouble keeping"
	cont "it in stock."
	
	para "Ok, last question"
	line "for this quiz:"
	done
	
ObscuraGymQ2Q2WrongText:
	text "The answer is"
	line "ROCK CANDY."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ2Q3Text:
	text "What is the name"
	line "of the MUSEUM's"
	cont "mascot?"
	done
	
ObscuraGymQ2Q3CorrectText:
	text "Our cute little"
	line "SUDOWOODO mascot"
	cont "is “PETRO”!"
	done
	
ObscuraGymQ2Q3WrongText:
	text "The answer is"
	line "“PETRO”."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraQuiz2WinText:
	text "Nice job!"
	done

ObscuraQuiz2PostBattleText:
	text "Halfway there!"
	done

ObscuraGymQuiz2PassedText:
	text "Quiz complete!"
	done
	
ObscuraGymQuiz2PassedText2:
	text "Nice work!"
	
	para "Halfway there!"
	done

ObscuraGymQuiz3YesOrNoText:
	text "This quiz is:"
	line "“FOSSIL FACTS”."
	
	para "How well do you"
	line "know your stuff"
	cont "when it comes to"
	cont "fossils?"
	
	para "Shall we get"
	line "started?"
	done
	
ObscuraGymQ3Q1Text:
	text "Which of the"
	line "following is"
	cont "NOT considered"
	cont "a fossil?"
	done
	
ObscuraGymQ3Q1CorrectText:
	text "All of those"
	line "are fossils!"
	
	para "Next question:"
	done
	
ObscuraGymQ3Q1WrongText:
	text "Fossils are any"
	line "trace of ancient"
	cont "organisms that are"
	cont "preserved to the"
	cont "modern day."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ3Q2Text:
	text "Petrified wood is:"
	done
	
ObscuraGymQ3Q2CorrectText:
	text "Petrified wood"
	line "isn't actually"
	cont "wood at all!"
	
	para "Ok, last question"
	line "for this quiz:"
	done
	
ObscuraGymQ3Q2WrongText:
	text "Petrified wood is"
	line "stone that is in"
	cont "the shape of wood."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ3Q3Text:
	text "The oldest known"
	line "dinosaur fossil"
	cont "is how old?"
	done
	
ObscuraGymQ3Q3CorrectText:
	text "It's about 243"
	line "million years old,"
	cont "and comes from the"
	cont "Triassic Period."
	done
	
ObscuraGymQ3Q3WrongText:
	text "It's about 243"
	line "million years old,"
	cont "and comes from the"
	cont "Triassic Period."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraQuiz3WinText:
	text "Great job!"
	done

ObscuraQuiz3PostBattleText:
	text "Only one more"
	line "to go."
	done

ObscuraGymQuiz3PassedText:
	text "Quiz complete!"
	done
	
ObscuraGymQuiz3PassedText2:
	text "Great!"
	
	para "Only one more"
	line "to go."
	done

ObscuraGymQuiz4YesOrNoText:
	text "This quiz is:"
	line "“ANCIENT #MON”."
	
	para "How well do you"
	line "know about #MON"
	cont "of the past?"
	
	para "Shall we get"
	line "started?"
	done
	
ObscuraGymQ4Q1Text:
	text "ARCHEOPS was NOT"
	line "known for being:"
	done
	
ObscuraGymQ4Q1CorrectText:
	text "Despite its wings,"
	line "ARCHEOPS was very"
	cont "clumsy in the air."
	
	para "Next question:"
	done
	
ObscuraGymQ4Q1WrongText:
	text "Despite its wings,"
	line "ARCHEOPS was very"
	cont "clumsy in the air."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ4Q2Text:
	text "CARRACOSTA hunted"
	line "prey with its:"
	done
	
ObscuraGymQ4Q2CorrectText:
	text "It used it's jaw"
	line "to crush rocks"
	cont "and prey."
	
	para "Ok, last question"
	line "for this quiz:"
	done
	
ObscuraGymQ4Q2WrongText:
	text "It used it's jaw"
	line "to crush rocks"
	cont "and prey."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraGymQ4Q3Text:
	text "VOLCARONA's ancient"
	line "ancestor had:"
	done
	
ObscuraGymQ4Q3CorrectText:
	text "Ancient VOLCARONA"
	line "was a quadruped"
	cont "with strong legs."
	done
	
ObscuraGymQ4Q3WrongText:
	text "Ancient VOLCARONA"
	line "was a quadruped"
	cont "with strong legs."
	
	para "Sorry, that means"
	line "it's battle time!"
	done
	
ObscuraQuiz4WinText:
	text "Excellent job!"
	done
	
ObscuraQuiz4PostBattleText:
	text "That means you"
	line "are done with all"
	cont "4 quizzes!"
	
	para "Go talk to the"
	line "lady by the rope"
	cont "barrier."
	done
	
ObscuraGymQuiz4PassedText:
	text "Quiz complete!"
	done
	
ObscuraGymQuiz4PassedText2:
	text "You did it!"
	
	para "That means you"
	line "are done with all"
	cont "4 quizzes!"
	
	para "Go talk to the"
	line "lady by the rope"
	cont "barrier."
	done
	
ObscuraGymQuizNoText:
	text "Let me know when"
	line "you're ready."
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
	
ObscuraGymPostBattleText:
	text "Beating me in"
	line "battle means"
	cont "you've passed"
	cont "my quiz."
	done
	
ObscuraGymFirstQuestionText:
	text "Alright!"
	
	para "First question:"
	done
	
ObscuraGymTrainerRematch1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_1_REMATCH
	iftrue .FightDone
	writetext ObscuraGymTrainer1RematchSeenText
	yesorno
	iffalse .no
	closetext
	waitsfx
	winlosstext ObscuraQuiz1WinText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	loadtrainer LASS, KATHY_7
	jump .cont
.eightbadges
	loadtrainer LASS, KATHY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_OBSCURA_GYM_TRAINER_1_REMATCH
	end
.FightDone
	writetext ObscuraGymTrainer1RematchRegularText
	waitbutton
.no
	closetext
	end
	
ObscuraGymTrainerRematch2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_2_REMATCH
	iftrue .FightDone
	writetext ObscuraGymTrainer1RematchSeenText
	yesorno
	iffalse .no
	closetext
	waitsfx
	winlosstext ObscuraQuiz2WinText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	loadtrainer LASS, KATHY_7
	jump .cont
.eightbadges
	loadtrainer LASS, KATHY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_OBSCURA_GYM_TRAINER_2_REMATCH
	end
.FightDone
	writetext ObscuraGymTrainer1RematchRegularText
	waitbutton
.no
	closetext
	end
	
ObscuraGymTrainerRematch3:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_3_REMATCH
	iftrue .FightDone
	writetext ObscuraGymTrainer1RematchSeenText
	yesorno
	iffalse .no
	closetext
	waitsfx
	winlosstext ObscuraQuiz3WinText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	loadtrainer LASS, KATHY_7
	jump .cont
.eightbadges
	loadtrainer LASS, KATHY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_OBSCURA_GYM_TRAINER_3_REMATCH
	end
.FightDone
	writetext ObscuraGymTrainer1RematchRegularText
	waitbutton
.no
	closetext
	end
	
ObscuraGymTrainerRematch4:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_4_REMATCH
	iftrue .FightDone
	writetext ObscuraGymTrainer1RematchSeenText
	yesorno
	iffalse .no
	closetext
	waitsfx
	winlosstext ObscuraQuiz4WinText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	loadtrainer LASS, KATHY_7
	jump .cont
.eightbadges
	loadtrainer LASS, KATHY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_OBSCURA_GYM_TRAINER_4_REMATCH
	end
.FightDone
	writetext ObscuraGymTrainer1RematchRegularText
	waitbutton
.no
	closetext
	end
	
ObscuraGymTrainerRematch5:
	faceplayer
	opentext
	checkevent EVENT_BEAT_OBSCURA_GYM_TRAINER_5_REMATCH
	iftrue .FightDone
	writetext ObscuraGymTrainer5RematchSeenText
	yesorno
	iffalse .no
	closetext
	waitsfx
	winlosstext ObscuraGymClerk2WinText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	loadtrainer LASS, KATHY_7
	jump .cont
.eightbadges
	loadtrainer LASS, KATHY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_OBSCURA_GYM_TRAINER_5_REMATCH
	end
.FightDone
	writetext ObscuraGymClerk2Text5
	waitbutton
.no
	closetext
	end
	
ObscuraGymTrainer1RematchSeenText:
	text "No quiz this time."
	line "Only a battle!"
	
	para "You ready?"
	done
	
ObscuraGymTrainer1RematchRegularText:
	text "Enjoy the rest of"
	line "your MUSEUM visit."
	done

ObscuraGymTrainer5RematchSeenText:
	text "Back for a rematch"
	line "with ROCKY?"
	
	para "Ready for battle"
	line "time once again?"
	done
