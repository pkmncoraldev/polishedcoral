DaybreakPokemonTrainerSchool_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 4, 15, DAYBREAK_VILLAGE, 1
	warp_event 3, 15, DAYBREAK_VILLAGE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 0, 1, SIGNPOST_READ, AcademyBookshelf
	bg_event 1, 1, SIGNPOST_READ, AcademyBookshelf
	bg_event 3, 0, SIGNPOST_READ, AcademyBlackboard
	bg_event 4, 0, SIGNPOST_READ, AcademyBlackboard

	db 5 ; object events
	person_event SPRITE_TEACHER, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, DaybreakPokemonTrainerSchoolTeacher, -1
	person_event SPRITE_YOUNGSTER, 5, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DaybreakPokemonTrainerSchoolNPC1, -1
	person_event SPRITE_GAMEBOY_KID, 11, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DaybreakPokemonTrainerSchoolNPC2, -1
	person_event SPRITE_CUTE_GIRL, 7, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, DaybreakPokemonTrainerSchoolNPC3, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX, 4, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AcademyNotebook, -1

	const_def 1 ; object constants
	const DAYBREAK_POKEMON_TRAINER_SCHOOL_TEACHER
	const DAYBREAK_POKEMON_TRAINER_SCHOOL_YOUNGSTER
	const DAYBREAK_POKEMON_TRAINER_SCHOOL_GAMEBOY_KID
	const DAYBREAK_POKEMON_TRAINER_SCHOOL_LASS
	const DAYBREAK_POKEMON_TRAINER_SCHOOL_POKEDEX
	
DaybreakPokemonTrainerSchoolTeacher:
	checkevent EVENT_BEAT_TEACHER
	iftrue .checkquickclaw
	faceplayer
	opentext
	writetext DaybreakPokemonTrainerSchoolTeacherText1
	yesorno
	iftrue .Battle
	writetext DaybreakPokemonTrainerSchoolTeacherText2
	waitbutton
	spriteface DAYBREAK_POKEMON_TRAINER_SCHOOL_TEACHER, DOWN
	closetext
	end
	
.Battle:
	writetext DaybreakPokemonTrainerSchoolTeacherText3
	waitbutton
	closetext
	waitsfx
	winlosstext DaybreakPokemonTrainerSchoolTeacherWinText, 0
	setlasttalked DAYBREAK_POKEMON_TRAINER_SCHOOL_TEACHER
	loadtrainer TEACHERFAST, KATE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_TEACHER
.getquickclaw
	opentext
	writetext DaybreakPokemonTrainerSchoolTeacherText4
	waitbutton
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	writetext DaybreakPokemonTrainerSchoolTeacherText5
	waitbutton
	spriteface DAYBREAK_POKEMON_TRAINER_SCHOOL_TEACHER, DOWN
	closetext
	setevent EVENT_GOT_QUICK_CLAW
	end
.checkquickclaw
	checkevent EVENT_GOT_QUICK_CLAW
	iffalse .getquickclaw
.normaltext:
	faceplayer
	opentext
	writetext DaybreakPokemonTrainerSchoolTeacherText6
	waitbutton
	spriteface DAYBREAK_POKEMON_TRAINER_SCHOOL_TEACHER, DOWN
	closetext
	end
.NoRoom:
	writetext DaybreakPokemonTrainerSchoolTeacherText7
	waitbutton
	closetext
	end
	
DaybreakPokemonTrainerSchoolNPC1:
	faceplayer
	opentext
	checkevent EVENT_SCHOOL_KID_GAVE_BALLS
	iftrue .normaltext
	writetext DaybreakPokemonTrainerSchoolNPC1Text1
	waitbutton
	writetext DaybreakPokemonTrainerSchoolGetPokeballsText
	playsound SFX_ITEM
	waitsfx
	buttonsound
	writetext DaybreakPokemonTrainerSchoolPutAwayPokeballsText
	waitbutton
	giveitem POKE_BALL, 5
	setevent EVENT_SCHOOL_KID_GAVE_BALLS

.normaltext:
	writetext DaybreakPokemonTrainerSchoolNPC1Text2
	waitbutton
	spriteface DAYBREAK_POKEMON_TRAINER_SCHOOL_YOUNGSTER, UP
	closetext
	end

DaybreakPokemonTrainerSchoolNPC2:
	faceplayer
	opentext
	writetext DaybreakPokemonTrainerSchoolNPC2Text
	waitbutton
	spriteface DAYBREAK_POKEMON_TRAINER_SCHOOL_GAMEBOY_KID, DOWN
	closetext
	end
	
DaybreakPokemonTrainerSchoolNPC3:
	faceplayer
	opentext
	writetext DaybreakPokemonTrainerSchoolNPC3Text
	waitbutton
	spriteface DAYBREAK_POKEMON_TRAINER_SCHOOL_LASS, UP
	closetext
	end
	
AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenudata .MenuHeader
	_2dmenu
	closewindow
	if_equal $1, .Poison
	if_equal $2, .Paralysis
	if_equal $3, .Sleep
	if_equal $4, .Burn
	if_equal $5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.MenuHeader:
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 11 ; end coords
	dw .Data
	db 1 ; default option

.Data:
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyBookshelf:
	jumpstd difficultbookshelf

DaybreakPokemonTrainerSchoolGetPokeballsText:
	text "<PLAYER> received"
	line "5 # BALLS!"
	done
	
DaybreakPokemonTrainerSchoolPutAwayPokeballsText:
	text "<PLAYER> put the"
	line "# BALLS in"
	cont "the BALL POCKET."
	done
	
DaybreakPokemonTrainerSchoolTeacherText1:
	text "Oh! <PLAYER>!"

	para "It's so good to"
	line "see you!"
	
	para "I see you have"
	line "your own #MON."
	
	para "How about we have"
	line "a battle?"
	
	para "That way the other"
	line "kids can see how a"
	cont "real battle plays"
	cont "out."
	done
	
DaybreakPokemonTrainerSchoolTeacherText2:
	text "Oh."
	
	para "Well, I'll be here"
	line "when you're ready"
	cont "to battle."
	done

DaybreakPokemonTrainerSchoolTeacherText3:
	text "I hope you've been"
	line "studying!"
	done

DaybreakPokemonTrainerSchoolTeacherText4:
	text "Good work,"
	line "<PLAYER>!"
	
	para "To commemorate"
	line "your victory you"
	cont "should have this."
	done
	
DaybreakPokemonTrainerSchoolTeacherText5:
	text "Did you see how"
	line "fast my MEOWTH is?"
	
	para "Some items can"
	line "affect how your"
	cont "#MON battles."
	
	para "That QUICK CLAW"
	line "won't magically"
	cont "make your #MON"
	cont "as fast as my"
	cont "MEOWTH,"
	
	para "but it will"
	line "sometimes allow"
	cont "your #MON to"
	cont "attack first."
	
	para "If you want a"
	line "refresher on the"
	cont "basics of battle,"
	
	para "just look at the"
	line "chalkboard."
	done
	
DaybreakPokemonTrainerSchoolTeacherText6:
	text "If you want a"
	line "refresher on the"
	cont "basics of battle,"
	
	para "just look at the"
	line "chalkboard."
	done
	
DaybreakPokemonTrainerSchoolTeacherText7:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
	
DaybreakPokemonTrainerSchoolTeacherWinText:
	text "Great work!"
	
	para "That's an A+ in"
	line "my book!"
	done
	
DaybreakPokemonTrainerSchoolNPC1Text1:
	text "Hey, <PLAYER>."
	
	para "You have a"
	line "#MON?"
	
	para "That's so cool…"
	
	para "I have to take"
	line "this course again."
	
	para "My parents got me"
	line "these,"
	
	para "but since I can't"
	line "use them,"
	
	para "why don't you take"
	line "them?"
	done

DaybreakPokemonTrainerSchoolNPC1Text2:
	text "# BALLS let you"
	line "catch #MON."
	
	para "You need to throw"
	line "one at the #MON"
	cont "you want to catch."
	
	para "You should"
	line "probably weaken"
	cont "them first."
	
	para "Otherwise you'll"
	line "have a hard time"
	cont "keeping them from"
	cont "breaking out."
	done
	
DaybreakPokemonTrainerSchoolNPC2Text:
	text "Shhhhhh…"
	
	para "Don't tell the"
	line "teacher."
	
	para "I'm almost on"
	line "the last level."
	done
	
DaybreakPokemonTrainerSchoolNPC3Text:
	text "This is my first"
	line "time taking this"
	cont "class."
	
	para "I'm really looking"
	line "forward to it!"
	done
		
AcademyBlackboardText:
	text "The blackboard"
	line "describes #MON"
	cont "status changes in"
	cont "battle."
	done

AcademyBlackboardText2:
; unused
	text "Read which topic?"
	done

AcademyPoisonText:
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"
	cont "and HP is lost as"
	cont "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done

AcademyParalysisText:
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done

AcademySleepText:
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done

AcademyBurnText:
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done

AcademyFreezeText:
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done

AcademyNotebookText:
	text "It's this kid's"
	line "notebook…"

	para "Catch #MON"
	line "using # BALLS."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done

AcademyNotebookText1:
	text "Before throwing a"
	line "# BALL, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #MON is"
	cont "easier to catch."

	para "Keep reading?"
	done

AcademyNotebookText2:
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #MON attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done

AcademyNotebookText3:
	text "People who catch"
	line "and use #MON"
	cont "in battle are"
	cont "#MON trainers."

	para "They are expected"
	line "to visit #MON"
	cont"GYMS and defeat"
	cont "other trainers."

	para "The next page"
	line "is… Blank!"
	done