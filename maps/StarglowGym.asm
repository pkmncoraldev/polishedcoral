StarglowGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 21, 3, 7, STARGLOW_VALLEY
	warp_def 21, 4, 7, STARGLOW_VALLEY

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	person_event SPRITE_RODNEY, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowGymRodneyScript, -1
	person_event SPRITE_GYM_GUY, 20, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, StarglowGymGuyScript, -1
	person_event SPRITE_FISHER, 13, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerStarglowGym_1, EVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 7, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerStarglowGym_2, EVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 11, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerStarglowGym_3, EVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 6, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerStarglowGym_4, EVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 13, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowGymTrainer1Rematch, EVENT_HAVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 7, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowGymTrainer2Rematch, EVENT_HAVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 11, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowGymTrainer3Rematch, EVENT_HAVENT_BEAT_RODNEY
	person_event SPRITE_FISHER, 6, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowGymTrainer4Rematch, EVENT_HAVENT_BEAT_RODNEY

StarglowGymRodneyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RODNEY
	iftrue .FightDone
	writetext StarglowGymRodneyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowGymRodneyTextWin, StarglowGymRodneyTextLoss
	loadtrainer RODNEY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RODNEY
	clearevent EVENT_HAVENT_BEAT_RODNEY
	opentext
	writetext Text_ReceivedSecondBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SECONDBADGE
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_RODNEY
	iftrue .GotTMFromRodney
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_1
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_2
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_3
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_4
	setevent EVENT_DAYBREAK_GROTTO_HIKER
	writetext StarglowGymRodneyTextAfterBattle
	buttonsound
	verbosegivetmhm TM_RAIN_DANCE
	setevent EVENT_GOT_TM_FROM_RODNEY
	writetext StarglowGymRodneyTextTMSpeech
	waitbutton
	closetext
	specialphonecall SPECIALCALL_COMETOISLAND
	end

.GotTMFromRodney:
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_1_REMATCH
	iffalse RodneyTextLoop
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_2_REMATCH
	iffalse RodneyTextLoop
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_3_REMATCH
	iffalse RodneyTextLoop
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_4_REMATCH
	iftrue StarglowGymRodneyRematch
RodneyTextLoop:
	writetext StarglowGymRodneyTextLoop
	waitbutton
	closetext
	end

	
StarglowGymRodneyRematch:
	checkevent EVENT_BEAT_RODNEY_REMATCH
	iftrue RodneyTextLoop
	writetext StarglowGymRodneyTextBeforeBattle1Rematch
	yesorno
	iffalse .end
	writetext StarglowGymRodneyTextBeforeBattle2Rematch
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowGymRodneyTextWinRematch, StarglowGymRodneyTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	loadtrainer RODNEY, 2
	jump .cont
.threebadges
	loadtrainer RODNEY, 3
	jump .cont
.fourbadges
	loadtrainer RODNEY, 4
	jump .cont
.fivebadges
	loadtrainer RODNEY, 5
	jump .cont
.sixbadges
	loadtrainer RODNEY, 6
	jump .cont
.sevenbadges
	loadtrainer RODNEY, 7
	jump .cont
.eightbadges
	loadtrainer RODNEY, 8
.cont
	startbattle
	reloadmapafterbattle
	opentext
	writetext StarglowGymRodneyTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_RODNEY_REMATCH
	end
.end
	writetext StarglowGymRodneyTextNoRematch
	waitbutton
	closetext
	end
	
StarglowGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_RODNEY
	iftrue .StarglowGymGuyWinScript
	opentext
	writetext StarglowGymGuyText
	waitbutton
	closetext
	end

.StarglowGymGuyWinScript:
	opentext
	writetext StarglowGymGuyWinText
	waitbutton
	closetext
	end
	
TrainerStarglowGym_1:
	generictrainer FISHER, GERALD_2, EVENT_BEAT_STARGLOW_GYM_TRAINER_1, .SeenText, .BeatenText

	text "You're going"
	line "places, kid!"
	done

.SeenText:
	text "RODNEY is the best"
	line "fisherman the"
	cont "world has ever"
	cont "seen!"
	
	para "If he deemed you"
	line "worthy, you must"
	cont "be good."
	done

.BeatenText:
	text "Just like I said!"
	done
	
TrainerStarglowGym_2:
	generictrainer FISHER, WALTER_2, EVENT_BEAT_STARGLOW_GYM_TRAINER_2, .SeenText, .BeatenText

	text "RODNEY's #MON"
	line "are a lot tougher"
	cont "than mine."
	done

.SeenText:
	text "Did you know that"
	line "WATER TYPE is the"
	cont "most common #-"
	cont "MON TYPE?"
	
	para "That doesn't mean"
	line "they're weak!"
	done

.BeatenText:
	text "Maybe it does…"
	done
	
TrainerStarglowGym_3:
	generictrainer FISHER, BORRIS_2, EVENT_BEAT_STARGLOW_GYM_TRAINER_3, .SeenText, .BeatenText

	text "As well as train-"
	line "ing, I also get my"
	cont "fishing supplies"
	cont "here."
	done

.SeenText:
	text "Fishing is so pop-"
	line "ular around here,"
	
	para "it only makes"
	line "sense for the GYM"
	cont "to be a tackle"
	cont "shop!"
	done

.BeatenText:
	text "Oof…"
	done
	
TrainerStarglowGym_4:
	generictrainer FISHER, CLINT_2, EVENT_BEAT_STARGLOW_GYM_TRAINER_4, .SeenText, .BeatenText

	text "Go on."
	
	para "I won't try to stop"
	line "you again."
	done

.SeenText:
	text "Not so fast!"
	
	para "You'll have to beat"
	line "me to get to the"
	cont "GYM LEADER."
	done

.BeatenText:
	text "Well, that's that."
	done
	
StarglowGymTrainer1Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_1_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext StarglowGymTrainer1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowGymTrainer1RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	loadtrainer FISHER, GERALD_2
	jump .cont
.threebadges
	loadtrainer FISHER, GERALD_3
	jump .cont
.fourbadges
	loadtrainer FISHER, GERALD_4
	jump .cont
.fivebadges
	loadtrainer FISHER, GERALD_5
	jump .cont
.sixbadges
	loadtrainer FISHER, GERALD_6
	jump .cont
.sevenbadges
	loadtrainer FISHER, GERALD_7
	jump .cont
.eightbadges
	loadtrainer FISHER, GERALD_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_1_REMATCH
	end
.FightDone
	writetext StarglowGymTrainer1RematchRegularText
	waitbutton
	closetext
	end

StarglowGymTrainer1RematchRegularText:
	text "You're going"
	line "places, kid!"
	done

StarglowGymTrainer1RematchSeenText:
	text "You're back for"
	line "more?"
	
	para "Here we go again!"
	done

StarglowGymTrainer1RematchBeatenText:
	text "Just like I said!"
	done
	
StarglowGymTrainer2Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_2_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext StarglowGymTrainer2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowGymTrainer2RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	loadtrainer FISHER, WALTER_2
	jump .cont
.threebadges
	loadtrainer FISHER, WALTER_3
	jump .cont
.fourbadges
	loadtrainer FISHER, WALTER_4
	jump .cont
.fivebadges
	loadtrainer FISHER, WALTER_5
	jump .cont
.sixbadges
	loadtrainer FISHER, WALTER_6
	jump .cont
.sevenbadges
	loadtrainer FISHER, WALTER_7
	jump .cont
.eightbadges
	loadtrainer FISHER, WALTER_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_2_REMATCH
	end
.FightDone
	writetext StarglowGymTrainer2RematchRegularText
	waitbutton
	closetext
	end

StarglowGymTrainer2RematchRegularText:
	text "RODNEY's #MON"
	line "are getting"
	cont "stronger, too."
	done

StarglowGymTrainer2RematchSeenText:
	text "WATER TYPES are"
	line "very common,"
	
	para "but I won't give"
	line "up on mine!"
	done

StarglowGymTrainer2RematchBeatenText:
	text "You're getting"
	line "stronger!"
	done
	
StarglowGymTrainer3Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_3_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext StarglowGymTrainer3RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowGymTrainer3RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	loadtrainer FISHER, BORRIS_2
	jump .cont
.threebadges
	loadtrainer FISHER, BORRIS_3
	jump .cont
.fourbadges
	loadtrainer FISHER, BORRIS_4
	jump .cont
.fivebadges
	loadtrainer FISHER, BORRIS_5
	jump .cont
.sixbadges
	loadtrainer FISHER, BORRIS_6
	jump .cont
.sevenbadges
	loadtrainer FISHER, BORRIS_7
	jump .cont
.eightbadges
	loadtrainer FISHER, BORRIS_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_3_REMATCH
	end
.FightDone
	writetext StarglowGymTrainer3RematchRegularText
	waitbutton
	closetext
	end

StarglowGymTrainer3RematchRegularText:
	text "Guess you're here"
	line "for the training!"
	done

StarglowGymTrainer3RematchSeenText:
	text "Did you come back"
	line "for more training,"
	
	para "or just fishing"
	line "supplies?"
	done

StarglowGymTrainer3RematchBeatenText:
	text "Oof…"
	done
	
StarglowGymTrainer4Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_STARGLOW_GYM_TRAINER_4_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext StarglowGymTrainer4RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowGymTrainer4RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	ifequal 3, .threebadges
	loadtrainer FISHER, CLINT_2
	jump .cont
.threebadges
	loadtrainer FISHER, CLINT_3
	jump .cont
.fourbadges
	loadtrainer FISHER, CLINT_4
	jump .cont
.fivebadges
	loadtrainer FISHER, CLINT_5
	jump .cont
.sixbadges
	loadtrainer FISHER, CLINT_6
	jump .cont
.sevenbadges
	loadtrainer FISHER, CLINT_7
	jump .cont
.eightbadges
	loadtrainer FISHER, CLINT_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_STARGLOW_GYM_TRAINER_4_REMATCH
	end
.FightDone
	writetext StarglowGymTrainer4RematchRegularText
	waitbutton
	closetext
	end

StarglowGymTrainer4RematchRegularText:
	text "Go on."
	
	para "I won't try to stop"
	line "you again."
	done

StarglowGymTrainer4RematchSeenText:
	text "You have to beat"
	line "everyone to get"
	cont "another shot at"
	cont "the GYM LEADER!"
	done

StarglowGymTrainer4RematchBeatenText:
	text "Well, that's still"
	line "that."
	done
	
StarglowGymRodneyTextBeforeBattle:
	text "Hahaha!"
	
	para "So you came?"
	
	para "Those thugs were"
	line "causing quite the"
	cont "stir earlier,"
	
	para "but you put 'em"
	line "in their place."
	
	para "I'm RODNEY."
	
	para "GYM LEADER of"
	line "STARGLOW VALLEY!"
	
	para "My grandfather was"
	line "the founder of"
	cont "this little fish-"
	cont "ing town!"
	
	para "He trained me to"
	line "become the master"
	cont "fisherman you see"
	cont "before you."
	
	para "I, in turn, use"
	line "those skills to"
	cont "train my own"
	cont "#MON!"
	
	para "Let me show you"
	line "the raw power of"
	cont "the rushing waves!"
	done
	
StarglowGymRodneyTextWin:
	text "Amazing!"
	
	para "You bested my"
	line "fierce WATER-type"
	cont "#MON!"
	
	para "You've earned this."
	done
	
StarglowGymRodneyTextWinRematch:
	text "Amazing!"
	
	para "You're still the"
	line "real deal!"
	done
	
StarglowGymRodneyTextLoss:
	text "Washed away by"
	line "the waves!"
	done
	
Text_ReceivedSecondBadge:
	text "<PLAYER> received"
	line "the SPLASHBADGE."
	done
	
StarglowGymRodneyTextAfterBattle:
	text "The SPLASHBADGE"
	line "shows that you"
	cont "beat me in battle."
	
	para "It's real proof of"
	line "your mettle!"
	
	para "It also allows"
	line "your #MON to"
	cont "use the move CUT"
	cont "outside of battle."
	
	para "You should also"
	line "take this."
	done
	
StarglowGymRodneyTextTMSpeech:
	text "That TM contains"
	line "RAIN DANCE."
	
	para "Using it, your"
	line "#MON can summon"
	cont "a downpour at any"
	cont "time!"
	
	para "WATER-type moves"
	line "are boosted in the"
	cont "rain."
	
	para "It's a great move"
	line "to have at your"
	cont "disposal."
	
	para "…"
	
	para "When I was young,"
	line "my grandfather"
	cont "always told me to"
	cont "push myself and"
	cont "reach for the"
	cont "stars."
	
	para "Your potential is"
	line "limitless!"
	
	para "Go out and be the"
	line "best TRAINER you"
	cont "can be!"
	
	para "Come back for a"
	line "rematch whenever"
	cont "you want!"
	done
	
StarglowGymRodneyTextLoop:
	text "When I was young,"
	line "my grandfather"
	cont "always told me to"
	cont "push myself and"
	cont "reach for the"
	cont "stars."
	
	para "Your potential is"
	line "limitless!"
	
	para "Go out and be the"
	line "best TRAINER you"
	cont "can be!"
	
	para "Come back for a"
	line "rematch whenever"
	cont "you want!"
	done
	
StarglowGymRodneyTextNoRematch:
	text "Don't be so wishy-"
	line "washy!"
	done
	
StarglowGymGuyText:
	text "Yo!"
	
	para "Champ in making!"
	
	para "This GYM is also a"
	line "tackle shop!"
	
	para "That means all the"
	line "TRAINERS here use"
	cont "WATER #MON."
	
	para "Hit 'em with an"
	line "ELECTRIC or GRASS"
	cont "TYPE move to take"
	cont "'em out easily."
	
	para "You won't get very"
	line "far with a FIRE or"
	cont "ROCK TYPE, though…"
	
	para "I'm sure you can"
	line "handle it!"
	done
	
StarglowGymGuyWinText:
	text "Great job, kid!"
	
	para "I never doubted"
	line "you for a second!"
	
	para "That's two down!"
	done

StarglowGymRodneyTextBeforeBattle1Rematch:
	text "You're back?"
	
	para "…and you took out"
	line "all the TRAINERS"
	cont "in the GYM!"
	
	para "You must want a"
	line "rematch!"
	done

StarglowGymRodneyTextBeforeBattle2Rematch:
	text "Let me show you"
	line "the raw power of"
	cont "the rushing waves!"
	done
