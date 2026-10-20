TwinkleGymRedRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17, 14, 5, TWINKLE_GYM_ENTRY
	warp_def 17, 15, 6, TWINKLE_GYM_ENTRY

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 12, 12, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 18, 13, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, 13, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19, 12, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 15, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 18, 16, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 12, SPRITE_CHARLIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymCharlie, -1
	
	
	const_def 1 ; object constants
	const TWINKLEGYM_CHARLIE
	
TwinkleGymCharlie:
	faceplayer
	opentext TEXTBOX_CHARLIE
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
	changetextboxspeaker TEXTBOX_CHARLIE
	
.FightDone:	
	checkevent EVENT_TM11
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
	changetextboxspeaker
	verbosegivetmhm TM_SUNNY_DAY
	setevent EVENT_TM11
	changetextboxspeaker TEXTBOX_CHARLIE
	writetext TwinkleGymCharlieTextTMSpeech
	waitbutton
	closetext
	variablesprite SPRITE_BATHER_VARIABLE_1, SPRITE_BATHER_2
	variablesprite SPRITE_BATHER_VARIABLE_2, SPRITE_BATHER_2
	end

.GotTMFromCharlie:
	writetext TwinkleGymCharlieTextLoop
	waitbutton
	closetext
	end
	
Text_ReceivedFourthBadge:
	text "<PLAYER> received"
	line "the BURNBADGE."
	done

TwinkleGymCharlieTextBeforeBattle:
	text "Aha!"
	
	para "You're that kid I"
	line "met on SUNBEAM"
	cont "ISLAND!"
	
	para "How've you been!"
	
	para "So you came to"
	line "test your skills"
	cont "in battle, <WAIT_S>huh?"
	
	para "Good for you!"
	
	para "Crazy hot GYM for"
	line "such a cold town,<WAIT_S>"
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
	
TwinkleGymCharlieTextLoss:
	text "Tough luck!"
	
	para "Try again, I know"
	line "you have it in ya!"
	done
	
TwinkleGymCharlieTextAfterBattle:
	text "That BADGE shows"
	line "just how tough"
	cont "you are!"
	
	para "It lets you use"
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
	done
