TwinkleGymRedRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17, 10, 5, TWINKLE_GYM_ENTRY
	warp_def 17, 11, 6, TWINKLE_GYM_ENTRY

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  8, 12, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 13, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 13, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 12, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 15, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 16, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 12, SPRITE_CHARLIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymCharlie, -1
	
	
	const_def 1 ; object constants
	const TWINKLEGYM_CHARLIE
	
TwinkleGymCharlie:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHARLIE
	iftrue .FightDone
	writetext TwinkleGymCharlieTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymCharlieTextWin, TwinkleGymCharlieTextLoss
	loadtrainer CHARLIE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHARLIE
	clearevent EVENT_HAVENT_BEAT_CHARLIE
	opentext
	writetext Text_ReceivedForthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FORTHBADGE
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_CHARLIE
	iftrue .GotTMFromCharlie
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1
	setevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2
	writetext TwinkleGymCharlieTextAfterBattle
	buttonsound
	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_CHARLIE
	writetext TwinkleGymCharlieTextTMSpeech
	waitbutton
	closetext
	end

.GotTMFromCharlie:
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_3_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_4_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_5_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_6_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_7_REMATCH
	iftrue TwinkleGymCharlieRematch
CharlieTextLoop:
	writetext TwinkleGymCharlieTextLoop
	waitbutton
	closetext
	end
	
TwinkleGymCharlieRematch:
	checkevent EVENT_BEAT_CHARLIE_REMATCH
	iftrue CharlieTextLoop
	writetext TwinkleGymCharlieTextBeforeBattle1Rematch
	yesorno
	iffalse .end
	writetext TwinkleGymCharlieTextBeforeBattle2Rematch
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymCharlieTextWinRematch, TwinkleGymCharlieTextLoss
	checkcode VAR_BADGES
	ifequal 4, .fourbadges
	ifequal 5, .fivebadges
	ifequal 6, .sixbadges
	ifequal 7, .sevenbadges
	ifequal 8, .eightbadges
	loadtrainer CHARLIE, 1;3
	jump .cont
.fourbadges
	loadtrainer CHARLIE, 1;4
	jump .cont
.fivebadges
	loadtrainer CHARLIE, 1;5
	jump .cont
.sixbadges
	loadtrainer CHARLIE, 1;6
	jump .cont
.sevenbadges
	loadtrainer CHARLIE, 1;7
	jump .cont
.eightbadges
	loadtrainer CHARLIE, 1;8
.cont
	startbattle
	reloadmapafterbattle
	opentext
	writetext TwinkleGymCharlieTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_CHARLIE_REMATCH
	end
.end
	writetext TwinkleGymCharlieTextNoRematch
	waitbutton
	closetext
	end
	
Text_ReceivedThridBadge:
	text "<PLAYER> received"
	line "the SAUNABADGE."
	done

TwinkleGymCharlieTextBeforeBattle:
	text "Hello."
	
	para "You must be a"
	line "challenger."
	
	para "I'm CHARLIE, the"
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
	cont "as a spring"
	cont "breeze…"
	
	para "That's why they're"
	line "so fantastic!"
	
	para "…"
	
	para "Now then,"
	
	para "are you ready to"
	line "earn your wings?"
	done
	
TwinkleGymCharlieTextWin:
	text "So fierce!"
	line "So graceful!"
	done
	
TwinkleGymCharlieTextWinRematch:
	text "So fierce!"
	line "So graceful!"
	done
	
TwinkleGymCharlieTextLoss:
	text "Blown away!"
	done
	
TwinkleGymCharlieTextAfterBattle:
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
	
TwinkleGymCharlieTextTMSpeech:
	text "That TM contains"
	line "ROOST."
	
	para "It let's your"
	line "#MON land and"
	cont "rest for a while"
	cont "which will restore"
	cont "half of it's HP!"
	
	para "Keep in mind that"
	line "they can be hit by"
	cont "GROUND-type moves"
	cont "while roosting."
	
	para "…"
	
	para "It's important to"
	line "remember your roots"
	cont "no matter how far"
	cont "you go!"
	
	para "The sky is the"
	line "limit for a great"
	cont "TRAINER like you."
	
	para "Now go spread your"
	line "wings and soar on"
	cont "the wind!"
	
	para "Good luck out"
	line "there!"
	done
	
TwinkleGymCharlieTextLoop:
	text "It's important to"
	line "remember your roots"
	cont "no matter how far"
	cont "you go!"
	
	para "The sky is the"
	line "limit for a great"
	cont "TRAINER like you."
	
	para "Now go spread your"
	line "wings and soar on"
	cont "the wind!"
	
	para "Good luck out"
	line "there!"
	done
	
TwinkleGymCharlieTextBeforeBattle1Rematch:
	text "You beat everyone"
	line "else?"
	
	para "Do you want a"
	line "rematch?"
	done
	
TwinkleGymCharlieTextBeforeBattle2Rematch:
	text "Are you ready to"
	line "earn your wings?"
	done
	
TwinkleGymCharlieTextNoRematch:
	text "That takes the"
	line "wind outta me…"
	done
