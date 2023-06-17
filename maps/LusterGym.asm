LusterGym_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterGymTrigger0
	scene_script LusterGymTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterGymCallback

	db 2 ; warp events
	warp_def 21, 14, 25, LUSTER_MALL
	warp_def 21, 15, 26, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 14 ; object events
	person_event SPRITE_GYM_GUY, 19, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterGymGuy, -1
	person_event SPRITE_POLLY,  3,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterGymPolly, -1
	person_event SPRITE_SCHOOLBOY, 18,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, LusterGymTrainer1, EVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 12,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer2, EVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 13,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, LusterGymTrainer3, EVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 14,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer4, EVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY,  7,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer5, EVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY,  8, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer6, EVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 18,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer1Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 12,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer2Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 13,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer3Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY, 14,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer4Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY,  7,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer5Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_SCHOOLBOY,  8, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer6Rematch, EVENT_HAVENT_BEAT_POLLY

	const_def 1 ; object constants
	const LUSTER_GYM_GUY
	const LUSTER_GYM_POLLY

LusterGymTrigger0:
	clearevent EVENT_POLLY_NOT_IN_BOUTIQUE
	applyonemovement LUSTER_GYM_GUY, step_down
	opentext
	writetext LusterGymCallbackText
	waitbutton
	closetext
	applyonemovement PLAYER, turn_step_down
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	pause 5
	callasm LusterGymCheckPlayerXCoord
	ifequal $0f, .right
	warp2 DOWN, LUSTER_MALL, $10, $03
	end
.right
	warp2 DOWN, LUSTER_MALL, $11, $03
	end
	
LusterGymTrigger1:
	end

LusterGymCallback:
	callasm LusterGymCheckPlayerXCoord
	ifequal $0f, .moveperson
	return
.moveperson
	moveperson LUSTER_GYM_GUY, $0f, $13
	return
	
LusterGymCallbackText:
	text "Hey, TRAINER."
	
	para "The GYM LEADER"
	line "isn't here, sorry…"
	
	para "You just missed"
	line "her."
	
	para "She said she was"
	line "going clothes"
	cont "shopping."
	
	para "Maybe you could"
	line "go find her and"
	cont "ask her for a"
	cont "battle."
	done
	
LusterGymPolly:
	faceplayer
	opentext
	checkevent EVENT_BEAT_POLLY
	iftrue .FightDone
	writetext LusterGymPollyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymPollyTextWin, LusterGymPollyTextLoss
	loadtrainer POLLY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POLLY
	clearevent EVENT_HAVENT_BEAT_POLLY
	opentext
	writetext Text_ReceivedFifthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FIFTHBADGE
	checkcode VAR_BADGES
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_POLLY
	iftrue .GotTMFromPolly
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_1
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_2
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_3
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_4
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_5
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_6
	writetext LusterGymPollyTextAfterBattle
	buttonsound
;	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_POLLY
	writetext LusterGymPollyTextTMSpeech
	waitbutton
	closetext
	spriteface LUSTER_GYM_POLLY, DOWN
	end

.GotTMFromPolly:
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
	iftrue LusterGymPollyRematch
PollyTextLoop:
	writetext LusterGymPollyTextLoop
	waitbutton
	closetext
	end
	
LusterGymPollyRematch:
	checkevent EVENT_BEAT_POLLY_REMATCH
	iftrue PollyTextLoop
	writetext LusterGymPollyTextBeforeBattleRematch
	yesorno
	iffalse .end
	writetext LusterGymPollyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymPollyTextWinRematch, LusterGymPollyTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer POLLY, 1
	jump .cont
.sixbadges
	loadtrainer POLLY, 2
	jump .cont
.sevenbadges
	loadtrainer POLLY, 3
	jump .cont
.eightbadges
	loadtrainer POLLY, 4
.cont
	startbattle
	reloadmapafterbattle
	opentext
	writetext LusterGymPollyTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_POLLY_REMATCH
	spriteface LUSTER_GYM_POLLY, DOWN
	end
.end
	writetext LusterGymPollyTextNoRematch
	waitbutton
	closetext
	end
	
LusterGymPollyTextBeforeBattle:
	text "BEFORE BATTLE."
	done
	
LusterGymPollyTextBeforeBattleRematch:
	text "REMATCH?"
	done
	
LusterGymPollyTextAfterBattle:
	text "AFTER BATTLE."
	done
	
LusterGymPollyTextTMSpeech:
	text "TM SPEECH"
	done
	
LusterGymPollyTextWin:
	text "YOU WIN"
	done
	
LusterGymPollyTextWinRematch:
	text "YOU WIN REMATCH"
	done
	
LusterGymPollyTextLoss:
	text "YOU LOSE"
	done
	
LusterGymPollyTextLoop:
	text "SPEECH LOOP"
	done
	
LusterGymPollyTextNoRematch:
	text "NO REMATCH"
	done
	
Text_ReceivedFifthBadge:
	text "YOU GOT FIFTH"
	line "BADGE"
	done
	
LusterGymTrainer1:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_LUSTER_GYM_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WON"
	done
	
LusterGymTrainer2:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_LUSTER_GYM_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WON"
	done
	
LusterGymTrainer3:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_LUSTER_GYM_TRAINER_3, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WON"
	done
	
LusterGymTrainer4:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_LUSTER_GYM_TRAINER_4, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WON"
	done
	
LusterGymTrainer5:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_LUSTER_GYM_TRAINER_5, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WON"
	done
	
LusterGymTrainer6:
	generictrainer SCHOOLBOY, TIMMY_1, EVENT_BEAT_LUSTER_GYM_TRAINER_6, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WON"
	done
	
LusterGymTrainer1Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext LusterGymTrainer1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer1RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
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
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	end
.FightDone
	writetext LusterGymTrainer1RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer1RematchRegularText:
	text "NORMAL TEXT"
	line "REMATCH"
	done

LusterGymTrainer1RematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

LusterGymTrainer1RematchBeatenText:
	text "YOU WON"
	line "REMATCH"
	done
	
LusterGymTrainer2Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext LusterGymTrainer2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer2RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
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
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	end
.FightDone
	writetext LusterGymTrainer2RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer2RematchRegularText:
	text "NORMAL TEXT"
	line "REMATCH"
	done

LusterGymTrainer2RematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

LusterGymTrainer2RematchBeatenText:
	text "YOU WON"
	line "REMATCH"
	done
	
LusterGymTrainer3Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext LusterGymTrainer3RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer3RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
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
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	end
.FightDone
	writetext LusterGymTrainer3RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer3RematchRegularText:
	text "NORMAL TEXT"
	line "REMATCH"
	done

LusterGymTrainer3RematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

LusterGymTrainer3RematchBeatenText:
	text "YOU WON"
	line "REMATCH"
	done
	
LusterGymTrainer4Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext LusterGymTrainer4RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer4RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
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
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	end
.FightDone
	writetext LusterGymTrainer4RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer4RematchRegularText:
	text "NORMAL TEXT"
	line "REMATCH"
	done

LusterGymTrainer4RematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

LusterGymTrainer4RematchBeatenText:
	text "YOU WON"
	line "REMATCH"
	done
	
LusterGymTrainer5Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext LusterGymTrainer5RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer5RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
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
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	end
.FightDone
	writetext LusterGymTrainer5RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer5RematchRegularText:
	text "NORMAL TEXT"
	line "REMATCH"
	done

LusterGymTrainer5RematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

LusterGymTrainer5RematchBeatenText:
	text "YOU WON"
	line "REMATCH"
	done
	
LusterGymTrainer6Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
	iftrue .FightDone
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext LusterGymTrainer6RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer6RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
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
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
	end
.FightDone
	writetext LusterGymTrainer6RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer6RematchRegularText:
	text "NORMAL TEXT"
	line "REMATCH"
	done

LusterGymTrainer6RematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

LusterGymTrainer6RematchBeatenText:
	text "YOU WON"
	line "REMATCH"
	done
	
LusterGymGuy:
	end
	
LusterGymCheckPlayerXCoord:
	ld a, [wXCoord]
	ld [wScriptVar], a
	ret