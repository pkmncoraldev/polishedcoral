GlintGym_MapScriptHeader:
	db 2 ; scene scripts
	scene_script GlintGymTrigger0
	scene_script GlintGymTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17, 5, 7, GLINT_CITY
	warp_def 17, 4, 7, GLINT_CITY

	db 4 ; coord events
	xy_trigger 0, 15, 3, 0, GlintGymLibrarianStopsYou1, 0, 0
	xy_trigger 0, 15,  4, 0, GlintGymLibrarianStopsYou2, 0, 0
	xy_trigger 0, 15, 5, 0, GlintGymLibrarianStopsYou3, 0, 0
	xy_trigger 0, 15, 6, 0, GlintGymLibrarianStopsYou4, 0, 0

	db 20 ; bg events
	signpost -1, -1, SIGNPOST_READ, GlintGymStatue
	signpost -1, -1, SIGNPOST_READ, GlintGymStatue
	signpost 13, 9, SIGNPOST_READ, GlintGymBook1
	signpost 13, 8, SIGNPOST_READ, GlintGymBook2
	signpost 13, 7, SIGNPOST_READ, GlintGymBook3
	signpost 13, 2, SIGNPOST_READ, GlintGymBook4
	signpost 13, 1, SIGNPOST_READ, GlintGymBook5
	signpost 13, 0, SIGNPOST_READ, GlintGymBook6
	signpost 5, 9, SIGNPOST_READ, GlintGymBook7
	signpost 5, 8, SIGNPOST_READ, GlintGymBook8
	signpost 5, 7, SIGNPOST_READ, GlintGymBook9
	signpost 5, 6, SIGNPOST_READ, GlintGymBook10
	signpost 5, 3, SIGNPOST_READ, GlintGymBook11
	signpost 5, 2, SIGNPOST_READ, GlintGymBook12
	signpost 5, 1, SIGNPOST_READ, GlintGymBook13
	signpost 5, 0, SIGNPOST_READ, GlintGymBook14
	signpost 1, 9, SIGNPOST_READ, GlintGymBook15
	signpost 1, 8, SIGNPOST_READ, GlintGymBook16
	signpost 1, 1, SIGNPOST_READ, GlintGymBook17
	signpost 1, 0, SIGNPOST_READ, GlintGymBook18

	db 7 ; object events
	person_event SPRITE_STANLEY, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintGymStanley, -1
	person_event SPRITE_SCIENTIST_F, 16, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GlintGymLibrarian, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGymGuyScript, -1
	person_event SPRITE_SCHOOLBOY, 10,  6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GlintGymTrainer1, EVENT_BEAT_STANLEY
	person_event SPRITE_SCHOOLBOY,  7,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, GlintGymTrainer2, EVENT_BEAT_STANLEY
	person_event SPRITE_SCHOOLBOY, 10,  6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintGymTrainer1Rematch, EVENT_HAVENT_BEAT_STANLEY
	person_event SPRITE_SCHOOLBOY,  7,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintGymTrainer2Rematch, EVENT_HAVENT_BEAT_STANLEY

	
	const_def 1 ; object constants
	const GLINTGYM_STANLEY
	const GLINTGYM_LIBRARIAN
	const GLINTGYM_GYM_GUY
	const GLINTGYM_TRAINER1
	const GLINTGYM_TRAINER2
	const GLINTGYM_TRAINER1_REMATCH
	const GLINTGYM_TRAINER2_REMATCH
	
GlintGymTrigger0:
	end
	
GlintGymTrigger1:
	end
	
GlintGymStanley:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STANLEY
	iftrue .FightDone
	writetext GlintGymStanleyTextBeforeBattle1
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymMovePlayer
	spriteface PLAYER, RIGHT
	applymovement GLINTGYM_STANLEY, Movement_GlintGymMoveStanley
	faceplayer
	opentext
	writetext GlintGymStanleyTextBeforeBattle2
	waitbutton
	closetext
	waitsfx
	winlosstext GlintGymStanleyTextWin, GlintGymStanleyTextLoss
	loadtrainer STANLEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_STANLEY
	clearevent EVENT_HAVENT_BEAT_STANLEY
	opentext
	writetext Text_ReceivedFirstBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FIRSTBADGE
	checkcode VAR_BADGES
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_STANLEY
	iftrue .GotTMFromStanley
	setevent EVENT_BEAT_GLINT_GYM_TRAINER_1
	setevent EVENT_BEAT_GLINT_GYM_TRAINER_2
	writetext GlintGymStanleyTextAfterBattle
	buttonsound
	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_STANLEY
	setevent EVENT_GLINT_BIRDS
	writetext GlintGymStanleyTextTMSpeech
	waitbutton
	closetext
	applymovement GLINTGYM_STANLEY, Movement_GlintGymMoveStanley2
	end

.GotTMFromStanley:
	checkevent EVENT_BEAT_GLINT_GYM_TRAINER_1_REMATCH
	iffalse StanleyTextLoop
	checkevent EVENT_BEAT_GLINT_GYM_TRAINER_2_REMATCH
	iftrue GlintGymStanleyRematch
StanleyTextLoop:
	writetext GlintGymStanleyTextLoop
	waitbutton
	closetext
	end
	
GlintGymStanleyRematch:
	checkevent EVENT_BEAT_STANLEY_REMATCH
	iftrue StanleyTextLoop
	writetext GlintGymStanleyTextBeforeBattle1Rematch
	yesorno
	iffalse .end
	closetext
	applymovement PLAYER, Movement_GlintGymMovePlayer
	spriteface PLAYER, RIGHT
	applymovement GLINTGYM_STANLEY, Movement_GlintGymMoveStanley
	faceplayer
	opentext
	writetext GlintGymStanleyTextBeforeBattle2
	waitbutton
	closetext
	waitsfx
	winlosstext GlintGymStanleyTextWinRematch, GlintGymStanleyTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	ifequal 2, .twobadges
	loadtrainer STANLEY, 1
	jump .cont
.twobadges
	loadtrainer STANLEY, 2
	jump .cont
.threebadges
	loadtrainer STANLEY, 3
	jump .cont
.fourbadges
	loadtrainer STANLEY, 4
	jump .cont
.fivebadges
	loadtrainer STANLEY, 5
	jump .cont
.sixbadges
	loadtrainer STANLEY, 6
	jump .cont
.sevenbadges
	loadtrainer STANLEY, 7
	jump .cont
.eightbadges
	loadtrainer STANLEY, 8
.cont
	startbattle
	reloadmapafterbattle
	opentext
	writetext GlintGymStanleyTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_STANLEY_REMATCH
	applymovement GLINTGYM_STANLEY, Movement_GlintGymMoveStanley2
	end
.end
	writetext GlintGymStanleyTextNoRematch
	waitbutton
	closetext
	end
	
GlintGymTrainer1:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_GLINT_GYM_TRAINER_1, .SeenText, .BeatenText

	text "I haven't made it"
	line "to 'B' yet."
	
	para "Don't make fun of"
	line "me."
	done

.SeenText:
	text "I'm reading through"
	line "the library's set"
	cont "of encyclopedias."
	
	para "I'm starting with"
	line "the letter 'A'."
	done

.BeatenText:
	text "I couldn't read"
	line "you…"
	done

GlintGymTrainer2:
	generictrainer SCHOOLBOY, DAMIAN_1, EVENT_BEAT_GLINT_GYM_TRAINER_2, .SeenText, .BeatenText

	text "At least now I"
	line "can study in"
	cont "peace."
	done

.SeenText:
	text "Shhhh!"
	
	para "Quiet in the"
	line "library!"
	done

.BeatenText:
	text "I guess I need to"
	line "read more about"
	cont "type matchups…"
	done

	
GlintGymTrainer1Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GLINT_GYM_TRAINER_1_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext GlintGymTrainer1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext GlintGymTrainer1RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	ifequal 2, .twobadges
	loadtrainer SCHOOLBOY, TIMMY_1
	jump .cont
.twobadges
	loadtrainer SCHOOLBOY, TIMMY_2
	jump .cont
.threebadges
	loadtrainer SCHOOLBOY, TIMMY_3
	jump .cont
.fourbadges
	loadtrainer SCHOOLBOY, TIMMY_4
	jump .cont
.fivebadges
	loadtrainer SCHOOLBOY, TIMMY_5
	jump .cont
.sixbadges
	loadtrainer SCHOOLBOY, TIMMY_6
	jump .cont
.sevenbadges
	loadtrainer SCHOOLBOY, TIMMY_7
	jump .cont
.eightbadges
	loadtrainer SCHOOLBOY, TIMMY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_GLINT_GYM_TRAINER_1_REMATCH
	end
.FightDone
	writetext GlintGymTrainer1RematchRegularText
	waitbutton
	closetext
	end

GlintGymTrainer1RematchRegularText:
	text "I finally made"
	line "it to 'B'!"
	done

GlintGymTrainer1RematchSeenText:
	text "I'm still reading"
	line "through the entire"
	cont "set of"
	cont "encyclopedias."
	
	para "I'm making some"
	line "real progress!"
	done

GlintGymTrainer1RematchBeatenText:
	text "You're just too"
	line "hard to read!"
	done

GlintGymTrainer2Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GLINT_GYM_TRAINER_2_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext GlintGymTrainer2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext GlintGymTrainer2RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	ifequal 2, .twobadges
	loadtrainer SCHOOLBOY, DAMIAN_1
	jump .cont
.twobadges
	loadtrainer SCHOOLBOY, DAMIAN_2
	jump .cont
.threebadges
	loadtrainer SCHOOLBOY, DAMIAN_3
	jump .cont
.fourbadges
	loadtrainer SCHOOLBOY, DAMIAN_4
	jump .cont
.fivebadges
	loadtrainer SCHOOLBOY, DAMIAN_5
	jump .cont
.sixbadges
	loadtrainer SCHOOLBOY, DAMIAN_6
	jump .cont
.sevenbadges
	loadtrainer SCHOOLBOY, DAMIAN_7
	jump .cont
.eightbadges
	loadtrainer SCHOOLBOY, DAMIAN_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_GLINT_GYM_TRAINER_2_REMATCH
	end
.FightDone
	writetext GlintGymTrainer2RematchRegularText
	waitbutton
	closetext
	end

GlintGymTrainer2RematchRegularText:
	text "At least now I"
	line "can study in"
	cont "peace."
	done

GlintGymTrainer2RematchSeenText:
	text "Quiet in the"
	line "library!"
	
	para "Oh, it's you"
	line "again…"
	done

GlintGymTrainer2RematchBeatenText:
	text "I guess I need to"
	line "read more about"
	cont "type matchups…"
	done
	
	
GlintGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_STANLEY
	iftrue .GlintGymGuyWinScript
	opentext
	writetext GlintGymGuyText
	waitbutton
	closetext
	end

.GlintGymGuyWinScript:
	opentext
	writetext GlintGymGuyWinText
	waitbutton
	closetext
	end

GlintGymLibrarian:
	faceplayer
	checkitem LIBRARY_CARD
	iftrue .GlintGymLibrarian2
	opentext
	writetext GlintGymLibrarianText1
	waitbutton
	closetext
	end
	
.GlintGymLibrarian2:
	checkevent EVENT_SHOWN_LIBRARY_CARD
	iftrue .GlintGymLibrarian3
	setevent EVENT_SHOWN_LIBRARY_CARD
	opentext
	writetext GlintGymLibrarianText2
	waitbutton
	closetext
	dotrigger $1
	end
	
.GlintGymLibrarian3:
	opentext
	writetext GlintGymLibrarianText3
	waitbutton
	closetext
	end
	
GlintGymStatue:
	checkflag ENGINE_FIRSTBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext STANLEY, 1, $1
	jumpstd gymstatue2

GlintGymLibrarianStopsYou1:
	checkitem LIBRARY_CARD
	iftrue GlintGymLibrarianStopsYou1_2
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymMoveStanley
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGymLibrarianText1
	waitbutton
	closetext
	end
	
GlintGymLibrarianStopsYou1_2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymMoveStanley
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGymLibrarianText2
	waitbutton
	closetext
	setevent EVENT_SHOWN_LIBRARY_CARD
	dotrigger $1
	end
	
GlintGymLibrarianStopsYou2:
	checkitem LIBRARY_CARD
	iftrue GlintGymLibrarianStopsYou2_2
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymLibrarianStopsYou2
	opentext
	writetext GlintGymLibrarianText1
	waitbutton
	closetext
	end
	
GlintGymLibrarianStopsYou2_2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymLibrarianStopsYou2
	opentext
	writetext GlintGymLibrarianText2
	waitbutton
	closetext
	setevent EVENT_SHOWN_LIBRARY_CARD
	dotrigger $1
	end
	
GlintGymLibrarianStopsYou3:
	checkitem LIBRARY_CARD
	iftrue GlintGymLibrarianStopsYou3_2
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymLibrarianStopsYou3
	opentext
	writetext GlintGymLibrarianText1
	waitbutton
	closetext
	end
	
GlintGymLibrarianStopsYou3_2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymLibrarianStopsYou3
	opentext
	writetext GlintGymLibrarianText2
	waitbutton
	closetext
	setevent EVENT_SHOWN_LIBRARY_CARD
	dotrigger $1
	end
	
GlintGymLibrarianStopsYou4:
	checkitem LIBRARY_CARD
	iftrue GlintGymLibrarianStopsYou4_2
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymLibrarianStopsYou4
	opentext
	writetext GlintGymLibrarianText1
	waitbutton
	closetext
	end
	
GlintGymLibrarianStopsYou4_2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTGYM_LIBRARIAN, 15
	pause 7
	opentext
	spriteface PLAYER, LEFT
	writetext GlintGymLibrarianStopsYouText
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGymLibrarianStopsYou4
	opentext
	writetext GlintGymLibrarianText2
	waitbutton
	closetext
	setevent EVENT_SHOWN_LIBRARY_CARD
	dotrigger $1
	end
	
GlintGymLibrarianStopsYouEnd:
	end
	
Movement_GlintGymMovePlayer:
	step_left
	step_end
	
Movement_GlintGymMoveStanley:
	step_down
	step_end
	
Movement_GlintGymMoveStanley2:
	step_up
	step_end
	
Movement_GlintGymLibrarianStopsYou2:
	step_down
	step_left
	step_end
	
Movement_GlintGymLibrarianStopsYou3:
	step_down
	step_left
	step_left
	step_end
	
Movement_GlintGymLibrarianStopsYou4:
	step_down
	step_left
	step_left
	step_left
	step_end
	
GlintGymStanleyTextBeforeBattle1:
	text "Ah. You came."
	
	para "I knew you were"
	line "something special"
	cont "when I met you in"
	cont "the grove."
	
	para "I'm STANLEY."
	
	para "I'm the GLINT CITY"
	line "GYM LEADER."
	
	para "I graduated top of"
	line "my class at the"
	cont "DAYBREAK #MON"
	cont "TRAINER SCHOOL."
	
	para "NORMAL-types are"
	line "vastly underrated."
	
	para "Sure, they don't"
	line "have many"
	cont "strengths,"
	
	para "but they don't have"
	line "many weaknesses"
	cont "either."
	done
	
GlintGymStanleyTextBeforeBattle2:
	text "I'll show you that"
	line "sound strategy is"
	cont "far more important"
	cont "than pure power!"
	done
	
GlintGymStanleyTextWin:
	text "I guess your stra-"
	line "tegy trumped mine."
	
	para "Take this."
	
	para "It's the #MON"
	line "LEAGUE STARKBADGE."
	done
	
GlintGymStanleyTextWinRematch:
	text "I guess your stra-"
	line "tegy trumped mine."
	
	para "Good job!"
	done
	
GlintGymStanleyTextLoss:
	text "It seems your"
	line "skills aren't up"
	cont "to snuff."
	
	para "You should study"
	line "some more."
	done
	
Text_ReceivedFirstBadge:
	text "<PLAYER> received"
	line "the STARKBADGE."
	done
	
GlintGymStanleyTextAfterBattle:
	text "That badge shows"
	line "that you bested me"
	cont "in battle."
	
	para "It also allows you"
	line "to use the HM"
	cont "ROCK SMASH outside"
	cont "of battle."
	
	para "Your #MON"
	line "doesn't even need"
	cont "to know the move."
	
	para "As long as they"
	line "CAN learn it,"
	
	para "you're good to go!"
	
	para "You'll need to"
	line "find the HM your-"
	cont "self, though."
	
	para "I also want you to"
	line "have this."	
	done
	
GlintGymStanleyTextTMSpeech:
	text "TMs teach your"
	line "#MON new moves."

	para "That TM contains"
	line "the move FAKE OUT."
	
	para "FAKE OUT always"
	line "goes first and"
	cont "always makes your"
	cont "opponent flinch."
	
	para "You can only use"
	line "it on the first"
	cont "turn that your"
	cont "#MON is in"
	cont "battle, however."
	
	para "It's a great strat-"
	line "egic move!"
	
	para "…"
	
	para "You gave a really"
	line "good fight."
	
	para "I'll study and"
	line "train harder."
	
	para "Come back and beat"
	line "all the TRAINERS"
	cont "in the GYM if you"
	cont "want a rematch."
	
	para "I'll be waiting!"
	done
	
GlintGymStanleyTextLoop:
	text "You gave a really"
	line "good fight."
	
	para "I'll study and"
	line "train harder."
	
	para "Come back and beat"
	line "all the TRAINERS"
	cont "in the GYM if you"
	cont "want a rematch."
	
	para "I'll be waiting!"
	done

GlintGymStanleyTextBeforeBattle1Rematch:
	text "It seems like you"
	line "beat everyone in"
	cont "the GYM again."
	
	para "You must want a"
	line "rematch!"
	done
	
GlintGymStanleyTextNoRematch:
	text "Oh, I see."
	done
	
GlintGymGuyText:
	text "Yo!"
	
	para "Champ in making!"
	
	para "This must be your"
	line "first GYM."
	
	para "The TRAINERS here"
	line "specialize in"
	cont "NORMAL-type #-"
	cont "MON."
	
	para "They can't take a"
	line "hit from FIGHTING-"
	cont "type moves,"
	
	para "but GHOST moves"
	line "can't touch them at"
	cont "all."
	
	para "You should be"
	line "ready for"
	cont "anything."
	done

GlintGymGuyWinText:
	text "You won?"

	para "Nice!"
	
	para "That's your first"
	line "step to becoming"
	cont "the CHAMPION of"
	cont "the ONWA REGION!"
	
	para "Keep it up, kid!"
	done

GlintGymLibrarianStopsYouText:
	text "Excuse me!"
	done
	
GlintGymLibrarianText1:
	text "Welcome to the"
	line "GLINT CITY #-"
	cont "MON GYM."
	
	para "The GYM doubles as"
	line "a library,"
	
	para "so please keep"
	line "your voice down."
	
	para "You need a LIBRARY"
	line "CARD to enter."
	
	para "Please return with"
	line "a LIBRARY CARD."
	done

GlintGymLibrarianText2:
	text "Welcome to the"
	line "GLINT CITY #-"
	cont "MON GYM."
	
	para "The GYM doubles as"
	line "a library,"
	
	para "so please keep"
	line "your voice down."
	
	para "You need a LIBRARY"
	line "CARD to enter."
	
	para "Let me see."
	
	para "Ok, <PLAYER>."
	
	para "Have a nice visit."
	done

GlintGymLibrarianText3:
	text "Welcome to the"
	line "GLINT CITY #-"
	cont "MON GYM."
	
	para "The GYM doubles as"
	line "a library,"
	
	para "so please keep"
	line "your voice down."
	
	para "Have a nice visit."
	done
	
GlintGymBook1:
	jumptext GlintGymBookText1
	
GlintGymBook2:
	jumptext GlintGymBookText2
	
GlintGymBook3:
	jumptext GlintGymBookText3
	
GlintGymBook4:
	jumptext GlintGymBookText4
	
GlintGymBook5:
	jumptext GlintGymBookText5
	
GlintGymBook6:
	jumptext GlintGymBookText6
	
GlintGymBook7:
	jumptext GlintGymBookText7
	
GlintGymBook8:
;	checkevent EVENT_GOT_CLUE_1
;	iftrue .gotclue
;	opentext
;	writetext GlintGymBookText8
;	buttonsound
;	verbosegiveitem CLUE_1
;	closetext
;	setevent EVENT_GOT_CLUE_1
;	end
	
;.gotclue
	jumptext GlintGymBookText8_2
	
GlintGymBook9:
	jumptext GlintGymBookText9
	
GlintGymBook10:
	jumptext GlintGymBookText10
	
GlintGymBook11:
	jumptext GlintGymBookText11
	
GlintGymBook12:
	opentext
	writetext GlintGymBookText12_1
	yesorno
	iffalse .no
	writetext GlintGymBookText12_2
	waitbutton
	closetext
	end
.no
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
GlintGymBook13:
	jumptext GlintGymBookText13
	
GlintGymBook14:
	jumptext GlintGymBookText14
	
GlintGymBook15:
	opentext
	writetext GlintGymBookText15_1
	yesorno
	iffalse .no
	writetext GlintGymBookText15_2
	waitbutton
	closetext
	end
.no
	writetext GlintGymBookText15_3
	waitbutton
	closetext
	end
	
GlintGymBook16:
	jumptext GlintGymBookText16
	
GlintGymBook17:
	jumptext GlintGymBookText17
	
GlintGymBook18:
	jumptext GlintGymBookText18

	
GlintGymBookText1:
	text "“Sautéed MAGIKARP"
	line "with a LEPPA BERRY"
	cont "Pan Sauce”"
	
	para "“FARFETCH'D"
	line "Fricasseé with"
	cont "Grilled LEEK”"
	
	para "Is this…"
	
	para "A #MON COOK-"
	line "BOOK!?"
	done
	
GlintGymBookText2:
	text "“#MON"
	line "ETYMOLOGY”"
	
	para "No one is quite"
	line "sure where the"
	cont "word #MON comes"
	cont "from."
	
	para "Some scholars be-"
	line "lieve the word has"
	cont "origins in a"
	cont "foreign word"
	cont "“boku” for “I” or"
	cont "“my”, and “man”."
	
	para "The word would"
	line "essentially mean"
	cont "“my man”, or"
	cont "“friend”."
	done
	
GlintGymBookText3:
	text "A children's novel"
	line "where people can"
	cont "morph into #-"
	cont "MON."
	
	para "You remember"
	line "reading these when"
	cont "you were younger."
	done
	
GlintGymBookText4:
	text "“#MON BREEDING"
	line "FOR DUMMIES!”"
	
	para "…"
	
	para "…"
	
	para "…"
	
	para "This is far too"
	line "detailed…"
	done
	
GlintGymBookText5:
	text "A novel about a"
	line "world where #-"
	cont "MON don't exist."
	
	para "Interesting."
	done
	
GlintGymBookText6:
	text "An article on the"
	line "RUINS OF ALPH in"
	cont "the JOHTO region!"
	
	para "There is a strange"
	line "language written"
	cont "on the walls."	
	done
	
GlintGymBookText7:
	text "An old #MON"
	line "ENCYCLOPEDIA!"
	
	para "This is what they"
	line "used before #-"
	cont "DEXS."
	done
	
GlintGymBookText8:
	text "What's this?"
	
	para "A dusty scrap of"
	line "paper."
	done
	
GlintGymBookText8_2:
	text "An empty"
	line "bookshelf…"
	done
	
GlintGymBookText9:
	text "A children's book"
	line "called “THE HUNGRY"
	cont "LITTLE VENIPEDE”."
	done
	
GlintGymBookText10:
	text "A book called"
	line "“OVERCOMING"
	cont "SHYNESS”."
	
	para "Seems useful!"
	done
	
GlintGymBookText11:
	text "A history book on"
	line "the domestication"
	cont "of #MON."
	
	para "It's a very dense"
	line "read."
	
	para "You have to keep"
	line "re-reading the"
	cont "passages."
	done
	
GlintGymBookText12_1:
	text "A book titled"
	line "“VEILSTONE'S"
	cont "MYTH”."
	
	para "Read it?"
	done
	
GlintGymBookText12_2:
	text "A young man,"
	line "callow and foolish"
	cont "in innocence, came"
	cont "to own a sword."
	
	para "With it, he smote"
	line "#MON, which"
	cont "gave sustenance,"
	cont "with carefree"
	cont "abandon."
	
	para "Those not taken as"
	line "food, he discarded"
	cont "with no after-"
	cont "thought."
	
	para "The following"
	line "year, no #MON"
	cont "appeared."
	
	para "Larders grew bare."
	
	para "The young man,"
	line "seeking the miss-"
	cont "ing #MON,"
	cont "journyed afar."
	
	para "Long did he"
	line "search."
	
	para "And far and wide,"
	line "too, until one he"
	cont "did find."
	
	para "Asked he, “Why"
	line "do you hide?”"
	
	para "To which the #-"
	line "MON replied…"
	
	para "“If you bear your"
	line "sword to bring"
	cont "harm upon us,"
	
	para "claws and fangs,"
	line "we will exact a"
	cont "toll."
	
	para "From your kind we"
	line "will take our"
	cont "toll,"
	
	para "for it must"
	line "be done."
	
	para "Done it must be"
	line "to guard ourselves"
	cont "and for it,"
	cont "I apologize."
	
	para "To the skies, the"
	line "young man shouted"
	cont "his dismay."
	
	para "“In having found"
	line "this sword, I have"
	cont "lost so much."
	
	para "Gorged with power,"
	line "I grew blind to"
	cont "#MON being"
	cont "alive."
	
	para "I will never fall"
	line "savage again."
	
	para "This sword I"
	line "denounce and"
	cont "forsake."
	
	para "I plead for for-"
	line "giveness, for I "
	cont "was but a fool.”"
	
	para "So saying this,"
	line "the young man"
	cont "hurled the sword"
	cont "to the ground,"
	cont "snapping it."
	
	para "Seeing this, the"
	line "#MON disappear-"
	cont "red to a place"
	cont "beyond seeing…"
	done
	
GlintGymBookText13:
	text "A story about a"
	line "young boy being"
	cont "saved from drown-"
	cont "ing by a CORSOLA."
	
	para "“Some people treat"
	line "them like simple"
	cont "creatures,"
	
	para "but I think #-"
	line "MON can have just"
	cont "as much heart as"
	cont "us if you give"
	cont "them the chance.”"
	done
	
GlintGymBookText14:
	text "A comic book"
	line "called “CAPTAIN"
	cont "PAPERWEIGHT”."
	
	para "Sounds boring…"
	done
	
GlintGymBookText15_1:
	text "You've found an"
	line "old magazine."
	
	para "Read it?"
	done
	
GlintGymBookText15_2:
	text "“My secret life,"
	line "chapter three.”"
	
	para "(Story from the"
	line "previous chapter.)"
	
	para "I was neither a"
	line "murder suspect,"
	
	para "nor a target for"
	line "an international"
	cont "spy organization."
	
	para "But I drove a car"
	line "down the Jersey"
	cont "Turnpike at 80mph."
	
	para "…A police officer"
	line "pulled me over and"
	
	para "asked for my"
	line "driver's license."
	
	para "He said I was"
	line "going 20mph over"
	cont "the speed limit."
	
	para "I instantly point-"
	line "ed to my wife and"
	cont "said,"
	
	para "“I'm in a hurry,"
	line "my wife is in"
	cont "labor.”"
	
	para "Fortunatly, my"
	line "wife actually had"
	cont "a big stomach."
	
	para "I hoped he'd let me"
	line "go with this"
	cont "excuse."
	
	para "“Oh, since it's an"
	line "emergency."
	
	para "I'll lead you to"
	line "the hospital with"
	cont "my police car,”"
	cont "he said."
	
	para "“No, it's not"
	line "necessary.”"
	
	para "“Why not?” asked "
	line "the officer."
	
	para "“Uh… well…”"
	
	para "“Let's get going,”"
	line "said the officer…"
	
	para "“No, no! We can't!"
	
	para "This baby is a"
	line "demon child!”"
	done
	
GlintGymBookText15_3:
	text "Good."
	
	para "That may be the"
	line "best choice."
	done
	
	
GlintGymBookText16:
	text "A study on the"
	line "trees in GLINT"
	cont "GROVE."
	
	para "“Many believe that"
	line "the trees in the"
	cont "grove give off a"
	cont "special form of"
	cont "energy."
	
	para "This energy is"
	line "said to be what"
	cont "attracts FAIRY-"
	cont "type #MON to"
	cont "the grove and also"
	cont "gives the trees "
	cont "their distinct"
	cont "year-round pink"
	cont "color.”"
	
	para "It goes on for"
	line "a bit…"
	done
	
GlintGymBookText17:
	text "A #MON tabloid."
	
	para "“I MARRIED MY"
	line "SLUGMA!”"
	
	para "Yikes!"
	done
	
GlintGymBookText18:
	text "“ON #MON"
	line "EVOLUTION”"
	
	para "BY: PROFESSOR"
	line "ROWAN"
	done
