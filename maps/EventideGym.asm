EventideGym_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, EventideGymCallback

	db 2 ; warp events
	warp_event 24, 21, EVENTIDE_VILLAGE, 8
	warp_event 25, 21, EVENTIDE_VILLAGE, 9

	db 0 ; coord events

	db 8 ; bg events
	bg_event 22, 14, SIGNPOST_UP, EventideGymBlueSwitchScript
	bg_event 27,  8, SIGNPOST_UP, EventideGymBlueSwitchScript
	bg_event  0,  4, SIGNPOST_UP, EventideGymRedSwitchScript
	bg_event 11, 12, SIGNPOST_UP, EventideGymYellowSwitchScript
	bg_event 37, 16, SIGNPOST_UP, EventideGymRedSwitchScript
	bg_event  8,  4, SIGNPOST_UP, EventideGymRedSwitchScript
	bg_event 45,  8, SIGNPOST_UP, EventideGymBlueSwitchScript
	bg_event 25,  4, SIGNPOST_UP, EventideGymYellowSwitchScript

	db 11 ; object events
	person_event SPRITE_WENDY,  2, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EventideGymWendy, -1
	person_event SPRITE_BIRD_KEEPER,  8, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, EventideGymTrainer1, EVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER, 16, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, EventideGymTrainer2, EVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER,  9, 42, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, EventideGymTrainer3, EVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER,  4,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, EventideGymTrainer4, EVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER, 15, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, EventideGymTrainer5, EVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER,  8, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 3, EventideGymTrainer1Rematch, EVENT_HAVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER, 16, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, EventideGymTrainer2Rematch, EVENT_HAVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER,  9, 42, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, EventideGymTrainer3Rematch, EVENT_HAVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER,  4,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 2, EventideGymTrainer4Rematch, EVENT_HAVENT_BEAT_WENDY
	person_event SPRITE_BIRD_KEEPER, 15, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 2, EventideGymTrainer5Rematch, EVENT_HAVENT_BEAT_WENDY

	
	const_def 1 ; object constants
	const EVENTIDEGYM_WENDY
	
EventideGymCallback:
	checkevent EVENT_EVENTIDE_GYM_RED_SWITCH
	iftrue .red_on
	jump .check_blue
.red_on
	changeblock $14, $a, $9a
	changeblock $12, $a, $9a
	changeblock $10, $a, $9a
	changeblock $e, $8, $aa
	changeblock $e, $6, $ab
	changeblock $c, $6, $9a
	changeblock $22, $c, $c2
	changeblock $22, $e, $c3

.check_blue
	checkevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	iftrue .blue_on
	jump .check_yellow
.blue_on
	changeblock $1c, $a, $a1
	changeblock $1e, $a, $a1
	changeblock $20, $a, $a1
	
.check_yellow
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .yellow_on
	jump .check_black
.yellow_on
	changeblock $18, $6, $97
	
.check_black
	checkevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	iftrue .black_on
	return
.black_on
	changeblock $18, $c, $94
	changeblock $28, $a, $98
	changeblock $26, $a, $98
	changeblock $4, $6, $98
	changeblock $6, $6, $98
	changeblock $8, $8, $ac
	changeblock $8, $a, $b0
	return

EventideGymRedSwitchScript:
	opentext
	writetext EventideGymRedSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	checkevent EVENT_EVENTIDE_GYM_RED_SWITCH
	iftrue .turn_off
	changeblock $14, $a, $9a
	changeblock $12, $a, $9a
	changeblock $10, $a, $9a
	changeblock $e, $8, $aa
	changeblock $e, $6, $ab
	changeblock $c, $6, $9a
	changeblock $22, $c, $c2
	changeblock $22, $e, $c3
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_RED_SWITCH
	jump EventideGymBlackSwitchScript
.turn_off
	changeblock $14, $a, $9b
	changeblock $12, $a, $9b
	changeblock $10, $a, $9b
	changeblock $e, $8, $a8
	changeblock $e, $6, $a9
	changeblock $c, $6, $9b
	changeblock $22, $c, $c0
	changeblock $22, $e, $c1
	closetext
	clearevent EVENT_EVENTIDE_GYM_RED_SWITCH
	jump EventideGymBlackSwitchScript
	
EventideGymBlueSwitchScript:
	opentext
	writetext EventideGymBlueSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	checkevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	iftrue .turn_off
	changeblock $1c, $a, $a1
	changeblock $1e, $a, $a1
	changeblock $20, $a, $a1
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	jump EventideGymBlackSwitchScript
.turn_off
	changeblock $1c, $a, $a0
	changeblock $1e, $a, $a0
	changeblock $20, $a, $a0
	reloadmappart
	closetext
	clearevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	jump EventideGymBlackSwitchScript
	
	
EventideGymYellowSwitchScript:
	opentext
	writetext EventideGymYellowSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .turn_off
	changeblock $18, $6, $97
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	jump EventideGymBlackSwitchScript
.turn_off
	changeblock $18, $6, $96
	reloadmappart
	closetext
	clearevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
;fallthrough
	
EventideGymBlackSwitchScript:
	checkevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	iftrue .turn_off
	changeblock $18, $c, $94
	changeblock $28, $a, $98
	changeblock $26, $a, $98
	changeblock $4, $6, $98
	changeblock $6, $6, $98
	changeblock $8, $8, $ac
	changeblock $8, $a, $b0
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	end
.turn_off
	changeblock $18, $c, $95
	changeblock $28, $a, $99
	changeblock $26, $a, $99
	changeblock $4, $6, $99
	changeblock $6, $6, $99
	changeblock $8, $8, $cd
	changeblock $8, $a, $ce
	reloadmappart
	closetext
	clearevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	end

EventideGymNoSwitchScript:
	writetext EventideGymNoSwitchText
	waitbutton
	closetext
	end
	
EventideGymWendy:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WENDY
	iftrue .FightDone
	writetext EventideGymWendyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymWendyTextWin, EventideGymWendyTextLoss
	loadtrainer WENDY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WENDY
	clearevent EVENT_HAVENT_BEAT_WENDY
	opentext
	writetext Text_ReceivedThridBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THIRDBADGE
	checkcode VAR_BADGES
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_WENDY
	iftrue .GotTMFromWendy
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2
	writetext EventideGymWendyTextAfterBattle
	buttonsound
	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_WENDY
	writetext EventideGymWendyTextTMSpeech
	waitbutton
	closetext
	end

.GotTMFromWendy:
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1_REMATCH
	iffalse WendyTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2_REMATCH
	iffalse WendyTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_3_REMATCH
	iffalse WendyTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_4_REMATCH
	iffalse WendyTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_5_REMATCH
	iftrue EventideGymWendyRematch
WendyTextLoop:
	writetext EventideGymWendyTextLoop
	waitbutton
	closetext
	end
	
EventideGymWendyRematch:
	checkevent EVENT_BEAT_WENDY_REMATCH
	iftrue WendyTextLoop
	writetext EventideGymWendyTextBeforeBattleRematch
	yesorno
	iffalse .end
	closetext
	waitsfx
	winlosstext EventideGymWendyTextWinRematch, EventideGymWendyTextLoss
	checkflag ENGINE_FOURTHBADGE
	iftrue .fourbadges
	checkflag ENGINE_FIFTHBADGE
	iftrue .fivebadges
	checkflag ENGINE_SIXTHBADGE
	iftrue .sixbadges
	checkflag ENGINE_SEVENTHBADGE
	iftrue .sevenbadges
	checkflag ENGINE_EIGHTHBADGE
	iftrue .eightbadges
	loadtrainer WENDY, 3
	jump .cont
.fourbadges
	loadtrainer WENDY, 4
	jump .cont
.fivebadges
	loadtrainer WENDY, 5
	jump .cont
.sixbadges
	loadtrainer WENDY, 6
	jump .cont
.sevenbadges
	loadtrainer WENDY, 7
	jump .cont
.eightbadges
	loadtrainer WENDY, 8
.cont
	startbattle
	reloadmapafterbattle
	opentext
	writetext EventideGymWendyTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_WENDY_REMATCH
	end
.end
	writetext EventideGymWendyTextNoRematch
	waitbutton
	closetext
	end
	
Text_ReceivedThridBadge:
	text "<PLAYER> received"
	line "the GALEBADGE."
	done

EventideGymWendyTextBeforeBattle:
	text "BEFORE BATTLE"
	done
	
EventideGymWendyTextWin:
	text "YOU WIN"
	done
	
EventideGymWendyTextWinRematch:
	text "YOU WIN"
	line "REMATCH"
	done
	
EventideGymWendyTextLoss:
	text "YOU LOSE"
	done
	
EventideGymWendyTextAfterBattle:
	text "AFTER BATTLE"
	done
	
EventideGymWendyTextTMSpeech:
	text "TM SPEECH"
	done
	
EventideGymWendyTextLoop:
	text "SPEECH LOOP"
	done
	
EventideGymWendyTextBeforeBattleRematch:
	text "REMATCH TEXT"
	done
	
EventideGymWendyTextNoRematch:
	text "NO REMATCH"
	done
	
EventideGymTrainer1:
	generictrainer BIRD_KEEPER, RICKY_3, EVENT_BEAT_EVENTIDE_GYM_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer2:
	generictrainer BIRD_KEEPER, VERN_3, EVENT_BEAT_EVENTIDE_GYM_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer3:
	generictrainer BIRD_KEEPER, ROY_3, EVENT_BEAT_EVENTIDE_GYM_TRAINER_3, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer4:
	generictrainer BIRD_KEEPER, SPENCER_3, EVENT_BEAT_EVENTIDE_GYM_TRAINER_4, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer5:
	generictrainer BIRD_KEEPER, CALEB_3, EVENT_BEAT_EVENTIDE_GYM_TRAINER_5, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer1Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext EventideGymTrainer1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymTrainer1RematchBeatenText, 0
	checkflag ENGINE_FOURTHBADGE
	iftrue .fourbadges
	checkflag ENGINE_FIFTHBADGE
	iftrue .fivebadges
	checkflag ENGINE_SIXTHBADGE
	iftrue .sixbadges
	checkflag ENGINE_SEVENTHBADGE
	iftrue .sevenbadges
	checkflag ENGINE_EIGHTHBADGE
	iftrue .eightbadges
	loadtrainer BIRD_KEEPER, RICKY_3
	jump .cont
.fourbadges
	loadtrainer BIRD_KEEPER, RICKY_4
	jump .cont
.fivebadges
	loadtrainer BIRD_KEEPER, RICKY_5
	jump .cont
.sixbadges
	loadtrainer BIRD_KEEPER, RICKY_6
	jump .cont
.sevenbadges
	loadtrainer BIRD_KEEPER, RICKY_7
	jump .cont
.eightbadges
	loadtrainer BIRD_KEEPER, RICKY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1_REMATCH
	end
.FightDone
	writetext EventideGymTrainer1RematchRegularText
	waitbutton
	closetext
	end

EventideGymTrainer1RematchRegularText:
	text "NORMAL TEXT"
	done

EventideGymTrainer1RematchSeenText:
	text "SEEN TEXT"
	done

EventideGymTrainer1RematchBeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer2Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext EventideGymTrainer2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymTrainer2RematchBeatenText, 0
	checkflag ENGINE_FOURTHBADGE
	iftrue .fourbadges
	checkflag ENGINE_FIFTHBADGE
	iftrue .fivebadges
	checkflag ENGINE_SIXTHBADGE
	iftrue .sixbadges
	checkflag ENGINE_SEVENTHBADGE
	iftrue .sevenbadges
	checkflag ENGINE_EIGHTHBADGE
	iftrue .eightbadges
	loadtrainer BIRD_KEEPER, VERN_3
	jump .cont
.fourbadges
	loadtrainer BIRD_KEEPER, VERN_4
	jump .cont
.fivebadges
	loadtrainer BIRD_KEEPER, VERN_5
	jump .cont
.sixbadges
	loadtrainer BIRD_KEEPER, VERN_6
	jump .cont
.sevenbadges
	loadtrainer BIRD_KEEPER, VERN_7
	jump .cont
.eightbadges
	loadtrainer BIRD_KEEPER, VERN_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2_REMATCH
	end
.FightDone
	writetext EventideGymTrainer2RematchRegularText
	waitbutton
	closetext
	end

EventideGymTrainer2RematchRegularText:
	text "NORMAL TEXT"
	done

EventideGymTrainer2RematchSeenText:
	text "SEEN TEXT"
	done

EventideGymTrainer2RematchBeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer3Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_3_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext EventideGymTrainer3RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymTrainer3RematchBeatenText, 0
	checkflag ENGINE_FOURTHBADGE
	iftrue .fourbadges
	checkflag ENGINE_FIFTHBADGE
	iftrue .fivebadges
	checkflag ENGINE_SIXTHBADGE
	iftrue .sixbadges
	checkflag ENGINE_SEVENTHBADGE
	iftrue .sevenbadges
	checkflag ENGINE_EIGHTHBADGE
	iftrue .eightbadges
	loadtrainer BIRD_KEEPER, ROY_3
	jump .cont
.fourbadges
	loadtrainer BIRD_KEEPER, ROY_4
	jump .cont
.fivebadges
	loadtrainer BIRD_KEEPER, ROY_5
	jump .cont
.sixbadges
	loadtrainer BIRD_KEEPER, ROY_6
	jump .cont
.sevenbadges
	loadtrainer BIRD_KEEPER, ROY_7
	jump .cont
.eightbadges
	loadtrainer BIRD_KEEPER, ROY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_3_REMATCH
	end
.FightDone
	writetext EventideGymTrainer3RematchRegularText
	waitbutton
	closetext
	end

EventideGymTrainer3RematchRegularText:
	text "NORMAL TEXT"
	done

EventideGymTrainer3RematchSeenText:
	text "SEEN TEXT"
	done

EventideGymTrainer3RematchBeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer4Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_4_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext EventideGymTrainer4RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymTrainer4RematchBeatenText, 0
	checkflag ENGINE_FOURTHBADGE
	iftrue .fourbadges
	checkflag ENGINE_FIFTHBADGE
	iftrue .fivebadges
	checkflag ENGINE_SIXTHBADGE
	iftrue .sixbadges
	checkflag ENGINE_SEVENTHBADGE
	iftrue .sevenbadges
	checkflag ENGINE_EIGHTHBADGE
	iftrue .eightbadges
	loadtrainer BIRD_KEEPER, SPENCER_3
	jump .cont
.fourbadges
	loadtrainer BIRD_KEEPER, SPENCER_4
	jump .cont
.fivebadges
	loadtrainer BIRD_KEEPER, SPENCER_5
	jump .cont
.sixbadges
	loadtrainer BIRD_KEEPER, SPENCER_6
	jump .cont
.sevenbadges
	loadtrainer BIRD_KEEPER, SPENCER_7
	jump .cont
.eightbadges
	loadtrainer BIRD_KEEPER, SPENCER_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_4_REMATCH
	end
.FightDone
	writetext EventideGymTrainer4RematchRegularText
	waitbutton
	closetext
	end

EventideGymTrainer4RematchRegularText:
	text "NORMAL TEXT"
	done

EventideGymTrainer4RematchSeenText:
	text "SEEN TEXT"
	done

EventideGymTrainer4RematchBeatenText:
	text "YOU WIN"
	done
	
EventideGymTrainer5Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_5_REMATCH
	iftrue .FightDone
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext EventideGymTrainer5RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymTrainer5RematchBeatenText, 0
	checkflag ENGINE_FOURTHBADGE
	iftrue .fourbadges
	checkflag ENGINE_FIFTHBADGE
	iftrue .fivebadges
	checkflag ENGINE_SIXTHBADGE
	iftrue .sixbadges
	checkflag ENGINE_SEVENTHBADGE
	iftrue .sevenbadges
	checkflag ENGINE_EIGHTHBADGE
	iftrue .eightbadges
	loadtrainer BIRD_KEEPER, CALEB_3
	jump .cont
.fourbadges
	loadtrainer BIRD_KEEPER, CALEB_4
	jump .cont
.fivebadges
	loadtrainer BIRD_KEEPER, CALEB_5
	jump .cont
.sixbadges
	loadtrainer BIRD_KEEPER, CALEB_6
	jump .cont
.sevenbadges
	loadtrainer BIRD_KEEPER, CALEB_7
	jump .cont
.eightbadges
	loadtrainer BIRD_KEEPER, CALEB_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_5_REMATCH
	end
.FightDone
	writetext EventideGymTrainer5RematchRegularText
	waitbutton
	closetext
	end

EventideGymTrainer5RematchRegularText:
	text "NORMAL TEXT"
	done

EventideGymTrainer5RematchSeenText:
	text "SEEN TEXT"
	done

EventideGymTrainer5RematchBeatenText:
	text "YOU WIN"
	done

EventideGymYesSwitchText:
	text "Who wouldn't?"
	done

EventideGymNoSwitchText:
	text "Better not…"
	done

EventideGymRedSwitchText:
	text "A red SWITCH!"
	
	para "Push it?"
	done

EventideGymBlueSwitchText:
	text "A blue SWITCH!"
	
	para "Push it?"
	done

EventideGymYellowSwitchText:
	text "A yellow SWITCH!"
	
	para "Push it?"
	done
