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
	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_CHARLIE
	writetext TwinkleGymCharlieTextTMSpeech
	waitbutton
	closetext
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
	
Text_ReceivedFourthBadge:
	text "<PLAYER> received"
	line "the SAUNABADGE."
	done

TwinkleGymCharlieTextBeforeBattle:
	text "BEFORE BATTLE"
	done
	
TwinkleGymCharlieTextWin:
	text "YOU WIN"
	done
	
TwinkleGymCharlieTextWinRematch:
	text "YOU WIN AGAIN"
	done
	
TwinkleGymCharlieTextLoss:
	text "YOU LOSE"
	done
	
TwinkleGymCharlieTextAfterBattle:
	text "AFTER BATTLE"
	done
	
TwinkleGymCharlieTextTMSpeech:
	text "TM SPEECH"
	done
	
TwinkleGymCharlieTextLoop:
	text "TEXT LOOP"
	done
	
TwinkleGymCharlieTextBeforeBattle1Rematch:
	text "REMATCH?"
	done
	
TwinkleGymCharlieTextBeforeBattle2Rematch:
	text "REMATCH START"
	done
	
TwinkleGymCharlieTextNoRematch:
	text "NO REMATCH"
	done
