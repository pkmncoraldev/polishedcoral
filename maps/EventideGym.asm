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
	bg_event 37, 16, SIGNPOST_UP, EventideGymRedSwitchScript2
	bg_event  8,  4, SIGNPOST_UP, EventideGymRedSwitchScript
	bg_event 45,  8, SIGNPOST_UP, EventideGymBlueSwitchScript
	bg_event 25,  4, SIGNPOST_UP, EventideGymYellowSwitchScript

	db 7 ; object events
	person_event SPRITE_WENDY,  2, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EventideGymWendy, -1
	person_event SPRITE_BIRD_KEEPER,  8, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, EventideGymTrainer1, -1
	person_event SPRITE_BIRD_KEEPER, 16, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, EventideGymTrainer2, -1
	person_event SPRITE_BIRD_KEEPER,  9, 42, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, EventideGymTrainer3, -1
	person_event SPRITE_BIRD_KEEPER,  4,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, EventideGymTrainer4, -1
	person_event SPRITE_BIRD_KEEPER, 15, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, EventideGymTrainer5, -1
	person_event SPRITE_GYM_GUY, 14, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EventideGymGuyScript, -1

	
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

EventideGymRedSwitchScript2:
	scall EventideGymRedSwitchScript
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .oops
	end
.oops
	opentext
	writetext EventideGymRedSwitchTextOops
	waitbutton
	closetext
	special FadeOutPalettes
	warpfacing UP, EVENTIDE_GYM, 24, 21
	end

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

EventideGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_WENDY
	iftrue .EventideGymGuyWinScript
	opentext
	writetext EventideGymGuyText
	waitbutton
	closetext
	end

.EventideGymGuyWinScript:
	opentext
	writetext EventideGymGuyWinText
	waitbutton
	closetext
	end
	
EventideGymNoSwitchScript:
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
EventideGymWendy:
	setevent EVENT_MET_WENDY
	faceplayer
	opentext TEXTBOX_WENDY
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
	writetext Text_ReceivedThirdBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THIRDBADGE
	changetextboxspeaker TEXTBOX_WENDY
.FightDone:	
	checkevent EVENT_TM56
	iftrue .GotTMFromWendy
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_3
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_4
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_5
	writetext EventideGymWendyTextAfterBattle
	buttonsound
	changetextboxspeaker
	verbosegivetmhm TM_ROOST
	setevent EVENT_TM56
	changetextboxspeaker TEXTBOX_WENDY
	writetext EventideGymWendyTextTMSpeech
	waitbutton
	closetext
	end

.GotTMFromWendy:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue WendyTextLoop
	checkevent EVENT_CAN_REMATCH_WENDY
	iftrue EventideGymWendyRematch
WendyTextLoop:
	writetext EventideGymWendyTextLoop
	waitbutton
	closetext
	end
	
EventideGymWendyRematch:
	writetext EventideGymWendyTextBeforeBattle1Rematch
	yesorno
	iffalse .end
	writetext EventideGymWendyTextBeforeBattle2Rematch
	waitbutton
	closetext
	waitsfx
	winlosstext EventideGymWendyTextWinRematch, EventideGymWendyTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	loadtrainer WENDY, 1
	jump .cont
.fourbadges
	loadtrainer WENDY, 2
	jump .cont
.fivebadges
	loadtrainer WENDY, 3
	jump .cont
.sixbadges
	loadtrainer WENDY, 4
	jump .cont
.sevenbadges
	loadtrainer WENDY, 5
	jump .cont
.eightbadges
	loadtrainer WENDY, 6
.cont
	startbattle
	reloadmapafterbattle
	opentext TEXTBOX_WENDY
	writetext EventideGymWendyTextLoop
	waitbutton
	closetext
	clearevent EVENT_CAN_REMATCH_WENDY
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
.end
	writetext EventideGymWendyTextNoRematch
	waitbutton
	closetext
	end
	
EventideGymRedSwitchTextOops:
	text "Oops."
	
	para "You managed to get"
	line "yourself stuck."
	
	para "Let's try that"
	line "again!"
	done
	
Text_ReceivedThirdBadge:
	text "<PLAYER> received"
	line "the GALEBADGE."
	done

EventideGymWendyTextBeforeBattle:
	text "Hello."
	
	para "You must be a"
	line "challenger."
	
	para "I'm WENDY, the"
	line "GYM LEADER of"
	cont "EVENTIDE VILLAGE."
	
	para "I've flown just"
	line "about everwhere"
	cont "in this world,"
	
	para "but this sleepy"
	line "little town will"
	cont "always be home."
	
	para "FLYING-types can"
	line "be as fierce as"
	cont "a raging storm,"
	
	para "or as graceful"
	line "as a spring"
	cont "breeze…"
	
	para "That's why they're"
	line "so fantastic!"
	
	para "…"
	
	para "Now then, <WAIT_S>are you"
	line "ready to earn"
	cont "your wings?"
	done
	
EventideGymWendyTextWin:
	text "So fierce!<WAIT_M>"
	line "So graceful!"
	done
	
EventideGymWendyTextWinRematch:
	text "So fierce!<WAIT_M>"
	line "So graceful!"
	done
	
EventideGymWendyTextLoss:
	text "I'm blown away!"
	done
	
EventideGymWendyTextAfterBattle:
	text "The GALEBADGE"
	line "will allow you"
	cont "to use the HM FLY"
	cont "outside of battle."
	
	para "You can use it to"
	line "soar on your"
	cont "#MON to any"
	cont "town you've visted."
	
	para "You'll need to"
	line "find the HM your-"
	cont "self, though."
	
	para "You should also"
	line "take this."
	done
	
EventideGymWendyTextTMSpeech:
	text "That TM contains"
	line "ROOST."
	
	para "It lets your"
	line "#MON land and"
	cont "rest for a while"
	cont "which will restore"
	cont "half of its HP!"
	
	para "Keep in mind that"
	line "they can be hit by"
	cont "GROUND-type moves"
	cont "while roosting."
	
	para "…"
	
	para "It's important to"
	line "remember your"
	cont "roots no matter"
	cont "how far you go!"
	
	para "The sky is the"
	line "limit for a great"
	cont "TRAINER like you."
	
	para "Now go spread your"
	line "wings!"
	
	para "Come back tomorrow"
	line "if you want a"
	cont "rematch."
	
	para "Good luck out"
	line "there!"
	done
	
EventideGymWendyTextLoop:
	text "It's important to"
	line "remember your"
	cont "roots no matter"
	cont "how far you go!"
	
	para "The sky is the"
	line "limit for a great"
	cont "TRAINER like you."
	
	para "Now go spread your"
	line "wings!"
	
	para "Come back tomorrow"
	line "if you want a"
	cont "rematch."
	
	para "Good luck out"
	line "there!"
	done
	
EventideGymWendyTextBeforeBattle1Rematch:
	text "Hi, <PLAYER>."
	
	para "Do you want a"
	line "rematch?"
	done
	
EventideGymWendyTextBeforeBattle2Rematch:
	text "Are you ready to"
	line "earn your wings?"
	done
	
EventideGymWendyTextNoRematch:
	text "That takes the"
	line "wind outta me…"
	done
	
EventideGymTrainer1:
	generictrainer BIRD_KEEPER, RICKY, EVENT_BEAT_EVENTIDE_GYM_TRAINER_1, .SeenText, .BeatenText

	text "Oh yeah!"
	
	para "You're willing to"
	line "put in the work!"
	done

.SeenText:
	text "Our GYM LEADER is"
	line "just up there."
	
	para "You can't just see"
	line "her that easily,"
	cont "though!"
	
	para "You have to put in"
	line "the work!"
	done

.BeatenText:
	text "Well you showed"
	line "me!"
	done
	
EventideGymTrainer2:
	generictrainer BIRD_KEEPER, VERN, EVENT_BEAT_EVENTIDE_GYM_TRAINER_2, .SeenText, .BeatenText

	text "You got this, kid!"
	done

.SeenText:
	text "I sure hope you're"
	line "prepared for a"
	cont "high-flying"
	cont "defeat!"
	done

.BeatenText:
	text "Darn it!"
	done
	
EventideGymTrainer3:
	generictrainer BIRD_KEEPER, ROY, EVENT_BEAT_EVENTIDE_GYM_TRAINER_3, .SeenText, .BeatenText

	text "No matter which"
	line "color the switch"
	cont "you press is,"

	para "the gray conveyors"
	line "will change too!"
	done

.SeenText:
	text "Have you figured"
	line "out the conveyor"
	cont "belts work?"
	done

.BeatenText:
	text "It's quite"
	line "simple."
	done
	
EventideGymTrainer4:
	generictrainer BIRD_KEEPER, CHANCE, EVENT_BEAT_EVENTIDE_GYM_TRAINER_4, .SeenText, .BeatenText

	text "Gotta head back"
	line "the way you came!"
	done

.SeenText:
	text "Oops!<WAIT_M>"
	line "Wrong turn!"
	
	para "Nothing for you"
	line "this way!"
	done

.BeatenText:
	text "Nothing but a"
	line "win that is!"
	done
	
EventideGymTrainer5:
	generictrainer BIRD_KEEPER, CALEB, EVENT_BEAT_EVENTIDE_GYM_TRAINER_5, .SeenText, .BeatenText

	text "Hit that switch"
	line "and finish this!"
	done

.SeenText:
	text "You might feel"
	line "like you aren't"
	cont "close,"
	
	para "but you're almost"
	line "there now!"
	
	para "Let's do this!"
	done

.BeatenText:
	text "So close!"
	done

EventideGymYesSwitchText:
	text "Who wouldn't?"
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
	
EventideGymGuyText:
	text "Yo!"
	
	para "Champ in making!"
	
	para "This place is"
	line "HUGE!"
	
	para "And look at all"
	line "these airplanes!"
	
	para "I'm sure you can"
	line "guess which type"
	cont "the TRAINERS here"
	cont "specialize in."
	
	para "You can clip a"
	line "FLYING-type's wings"
	cont "with an ELECTRIC"
	cont "or ICE-type move."
	
	para "They'll blow your"
	line "FIGHTING and GRASS"
	cont "types away easily,"
	cont "though."
	
	para "Give it your best"
	line "shot!"
	done
	
EventideGymGuyWinText:
	text "Excellent!"
	
	para "I never doubted"
	line "you for a second!"
	
	para "That's another"
	line "BADGE under your"
	cont "belt!"
	done
