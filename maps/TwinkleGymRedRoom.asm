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
	writetext Text_ReceivedFourthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOURTHBADGE
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_CHARLIE
	iftrue .GotTMFromCharlie
	setevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_TRAINER
	setevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_LEADER
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	writetext TwinkleGymCharlieTextAfterBattle
	buttonsound
	verbosegivetmhm TM_SUNNY_DAY
	setevent EVENT_GOT_TM_FROM_CHARLIE
	writetext TwinkleGymCharlieTextTMSpeech
	waitbutton
	closetext
	checkevent EVENT_BEAT_WENDY
	iffalse .end
	domaptrigger FLICKER_STATION, 1
.end
	end

.GotTMFromCharlie:
	checkevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_TRAINER_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_LEADER_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1_REMATCH
	iffalse CharlieTextLoop
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2_REMATCH
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
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	ifequal 5, .fivebadges
	ifequal 4, .fourbadges
	loadtrainer CHARLIE, 3
	jump .cont
.fourbadges
	loadtrainer CHARLIE, 4
	jump .cont
.fivebadges
	loadtrainer CHARLIE, 5
	jump .cont
.sixbadges
	loadtrainer CHARLIE, 6
	jump .cont
.sevenbadges
	loadtrainer CHARLIE, 7
	jump .cont
.eightbadges
	loadtrainer CHARLIE, 8
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
	
Text_ReceivedFourthBadge:
	text "<PLAYER> received"
	line "the BURNBADGE."
	done

TwinkleGymCharlieTextBeforeBattle:
	text "CHARLIE: Aha!"
	
	para "You're that kid I"
	line "met on SUNBEAM"
	cont "ISLAND!"
	
	para "How've you been!"
	
	para "So you came to"
	line "test your skills"
	cont "in battle, huh?"
	
	para "Good for you!"
	
	para "Crazy hot GYM for"
	line "such a cold town,"
	cont "huh?"
	
	para "I bet it's not"
	line "what you expected!"
	
	para "But I'm rambling,"
	line "aren't I?"
	
	para "If you think you"
	line "can stand up to"
	cont "my white hot"
	cont "#MON,"
	
	para "then let's get"
	line "this started!"
	done
	
TwinkleGymCharlieTextWin:
	text "You're on fire,"
	line "kid!"
	
	para "I knew you could"
	line "do it!"
	
	para "You've earned the"
	line "BURNBADGE!"
	done
	
TwinkleGymCharlieTextWinRematch:
	text "You're on fire,"
	line "kid!"
	
	para "Another great"
	line "battle!"
	done
	
TwinkleGymCharlieTextLoss:
	text "Tough luck!"
	
	para "Try again, I know"
	line "you have it in ya!"
	done
	
TwinkleGymCharlieTextAfterBattle:
	text "That BADGE shows"
	line "just how tough"
	cont "you are!"
	
	para "It let's you use"
	line "the HM ROCK CLIMB"
	cont "outside of battle."
	
	para "You should also"
	line "take this."
	done
	
TwinkleGymCharlieTextTMSpeech:
	text "That TM contains"
	line "SUNNY DAY."
	
	para "Use it, and the"
	line "sun will shine no"
	cont "matter the"
	cont "weather!"
	
	para "FIRE-type moves"
	line "are boosted in the"
	cont "sun."
	
	para "It's sure to come"
	line "in handy!"
	
	para "…"
	
	para "You may have"
	line "beaten me,"
	
	para "but you still have"
	line "have a long ways"
	cont "to go!"
	
	para "Never lose your"
	line "drive to improve."
	
	para "Never let that"
	line "flame die!"
	
	para "You're welcome back"
	line "anytime you want a"
	cont "rematch!"
	done
	
TwinkleGymCharlieTextLoop:
	text "You may have"
	line "beaten me,"
	
	para "but you still have"
	line "have a long ways"
	cont "to go!"
	
	para "Never lose your"
	line "drive to improve."
	
	para "Never let that"
	line "flame die!"
	
	para "You're welcome back"
	line "anytime you want a"
	cont "rematch!"
	done
	
TwinkleGymCharlieTextBeforeBattle1Rematch:
	text "Haha!"
	
	para "You beat everyone"
	line "else!"
	
	para "That means you"
	line "want a rematch,"
	cont "right?"
	done
	
TwinkleGymCharlieTextBeforeBattle2Rematch:
	text "If you think you"
	line "can stand up to"
	cont "my white hot"
	cont "#MON,"
	
	para "then let's get"
	line "this started!"
	done
	
TwinkleGymCharlieTextNoRematch:
	text "No way!"
	done
