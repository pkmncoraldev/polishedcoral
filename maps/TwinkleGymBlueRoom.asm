TwinkleGymBlueRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymBlueRoomTrigger0
	scene_script TwinkleGymBlueRoomTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17,  4, 3, TWINKLE_GYM_ENTRY
	warp_def 17,  5, 3, TWINKLE_GYM_ENTRY

	db 3 ; coord events
	xy_trigger 0, 14,  3, 0, TwinkleGymBlueRoomWorker1Script1, 0, 0
	xy_trigger 0, 14,  5, 0, TwinkleGymBlueRoomWorker1Script2, 0, 0
	xy_trigger 0, 14,  6, 0, TwinkleGymBlueRoomWorker1Script3, 0, 0

	db 2 ; bg events
	signpost  3,  4, SIGNPOST_IFNOTSET, TwinkleGymBlueRoomDoor
	signpost  3,  5, SIGNPOST_IFNOTSET, TwinkleGymBlueRoomDoor

	db 5 ; object events
	object_event  4, 14, SPRITE_SPA_WORKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomWorker1, EVENT_BEAT_CHARLIE
	object_event  0,  6, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomWorker2, EVENT_BEAT_CHARLIE
	object_event 13,  1, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomWorker3, EVENT_BEAT_CHARLIE
	object_event  9,  1, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomTrainer, -1
	object_event  4,  5, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomLeader, -1

	
	const_def 1 ; object constants
	const TWINKLE_GYM_BLUE_ROOM_WORKER_1
	const TWINKLE_GYM_BLUE_ROOM_WORKER_2
	const TWINKLE_GYM_BLUE_ROOM_WORKER_3
	const TWINKLE_GYM_BLUE_ROOM_TRAINER
	const TWINKLE_GYM_BLUE_ROOM_LEADER

TwinkleGymBlueRoomTrigger0:
	end
	
TwinkleGymBlueRoomTrigger1:
	end
	
TwinkleGymBlueRoomTrainer:
	faceplayer
	opentext
	checkevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_TRAINER
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext TwinkleGymBlueRoomTrainerSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymBlueRoomTrainerBeatenText, 0
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
	loadtrainer SPA_TRAINER, SHAYMUS_3
	jump .cont
.fourbadges
	loadtrainer SPA_TRAINER, SHAYMUS_4
	jump .cont
.fivebadges
	loadtrainer SPA_TRAINER, SHAYMUS_5
	jump .cont
.sixbadges
	loadtrainer SPA_TRAINER, SHAYMUS_6
	jump .cont
.sevenbadges
	loadtrainer SPA_TRAINER, SHAYMUS_7
	jump .cont
.eightbadges
	loadtrainer SPA_TRAINER, SHAYMUS_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_TRAINER
	end
.FightDone
	writetext TwinkleGymBlueRoomTrainerRegularText
	waitbutton
	closetext
	end

TwinkleGymBlueRoomTrainerRegularText:
	text "REGULAR TEXT"
	done

TwinkleGymBlueRoomTrainerSeenText:
	text "SEEN TEXT"
	done

TwinkleGymBlueRoomTrainerBeatenText:
	text "YOU WIN"
	done
	
TwinkleGymBlueRoomLeader:
	opentext
	checkevent EVENT_CAN_GET_YELLOW_KEY
	iftrue .end
	writetext TwinkleGymBlueRoomLeaderText1
	waitbutton
	closetext
	winlosstext TwinkleGymBlueRoomLeaderWinText, 0
	setlasttalked TWINKLE_GYM_BLUE_ROOM_LEADER
	loadtrainer SPA_TRAINER, DENNIS_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
.end
	writetext TwinkleGymBlueRoomLeaderText2
	waitbutton
	closetext
	setevent EVENT_CAN_GET_YELLOW_KEY
	end
	
TwinkleGymBlueRoomDoor:
	dw EVENT_TWINKLE_GYM_BLUE_ROOM_GLASS
	opentext
	writetext TwinkleGymBlueRoomDoorText1
	yesorno
	iffalse .no
	writetext TwinkleGymBlueRoomDoorText2
	pause 20
	closetext
	pause 20
	checkevent EVENT_BLUE_ROOM_STEAM_3
	iffalse .unlockdoor
	opentext
	writetext TwinkleGymBlueRoomDoorText3
	waitbutton
	closetext
	end
.unlockdoor
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_BLUE_ROOM_LEADER, UP
	showemote EMOTE_SHOCK, TWINKLE_GYM_BLUE_ROOM_LEADER, 15
	wait 5
	applymovement TWINKLE_GYM_BLUE_ROOM_LEADER, Movement_TwinkleGymBlueRoomLeader
	spriteface TWINKLE_GYM_BLUE_ROOM_LEADER, UP
	changeblock $4, $2, $77
	setevent EVENT_TWINKLE_GYM_BLUE_ROOM_GLASS
	pause 7
	playsound SFX_WALL_OPEN
	callasm RefreshScreen_BridgeUpdate
	pause 14
	opentext
	writetext TwinkleGymEntryUnlockDoorText
	waitbutton
	closetext
	end
.no
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
TwinkleGymBlueRoomWorker1Script1:
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_BLUE_ROOM_WORKER_1, LEFT
	showemote EMOTE_SHOCK, TWINKLE_GYM_BLUE_ROOM_WORKER_1, 15
	spriteface PLAYER, RIGHT
	jump TwinkleGymBlueRoomWorker1
	
TwinkleGymBlueRoomWorker1Script2:
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_BLUE_ROOM_WORKER_1, RIGHT
	showemote EMOTE_SHOCK, TWINKLE_GYM_BLUE_ROOM_WORKER_1, 15
	spriteface PLAYER, LEFT
	jump TwinkleGymBlueRoomWorker1
	
TwinkleGymBlueRoomWorker1Script3:
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_BLUE_ROOM_WORKER_1, RIGHT
	showemote EMOTE_SHOCK, TWINKLE_GYM_BLUE_ROOM_WORKER_1, 15
	applyonemovement TWINKLE_GYM_BLUE_ROOM_WORKER_1, step_right
	spriteface PLAYER, LEFT
	
TwinkleGymBlueRoomWorker1:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_GYM_BLUE_ROOM_WORKER_1
	iftrue .alreadydone
	setevent EVENT_TWINKLE_GYM_BLUE_ROOM_WORKER_1
	writetext TwinkleGymBlueRoomWorker1Text
	waitbutton
	closetext
	clearevent EVENT_BLUE_ROOM_STEAM_1
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
.alreadydone
	writetext TwinkleGymBlueRoomWorkerText2
	waitbutton
	closetext
	end
	
TwinkleGymBlueRoomWorker2:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_GYM_BLUE_ROOM_WORKER_2
	iftrue .alreadydone
	setevent EVENT_TWINKLE_GYM_BLUE_ROOM_WORKER_2
	writetext TwinkleGymBlueRoomWorkerText1
	waitbutton
	closetext
	checkevent EVENT_BLUE_ROOM_STEAM_2
	iftrue .steam2
	clearevent EVENT_BLUE_ROOM_STEAM_3
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
.steam2
	clearevent EVENT_BLUE_ROOM_STEAM_2
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
.alreadydone
	writetext TwinkleGymBlueRoomWorkerText2
	waitbutton
	closetext
	end
	
TwinkleGymBlueRoomWorker3:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_GYM_BLUE_ROOM_WORKER_3
	iftrue .alreadydone
	setevent EVENT_TWINKLE_GYM_BLUE_ROOM_WORKER_3
	writetext TwinkleGymBlueRoomWorkerText1
	waitbutton
	closetext
	checkevent EVENT_BLUE_ROOM_STEAM_2
	iftrue .steam2
	clearevent EVENT_BLUE_ROOM_STEAM_3
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
.steam2
	clearevent EVENT_BLUE_ROOM_STEAM_2
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
.alreadydone
	writetext TwinkleGymBlueRoomWorkerText2
	waitbutton
	closetext
	end
	
TwinkleGymBlueRoomLeaderText1:
	text "What's up?"
	
	para "A GYM LEADER?"
	
	para "No GYM LEADER"
	line "here."
	
	para "They must have"
	line "sent you to the"
	cont "wrong room."
	
	para "I could go for a"
	line "battle, though!"
	done
	
TwinkleGymBlueRoomLeaderText2:
	text "Sorry about the"
	line "confusion."
	
	para "You should talk to"
	line "the lady at the"
	cont "front desk."
	
	para "She can probably"
	line "clear it up for"
	cont "you."
	done
	
TwinkleGymBlueRoomLeaderWinText:
	text "Good stuff!"
	done
	
TwinkleGymBlueRoomWorker1Text:
	text "Heya kid."
	
	para "Can you see me?"
	
	para "It's pretty steamy"
	line "in here, huh?"
	
	para "If you wanna see"
	line "better,"
	
	para "you'll have to find"
	line "the workers like"
	cont "me around."
	
	para "They'll turn the"
	line "steam down a bit"
	cont "for you."
	
	para "I'll do that now."
	done
	
TwinkleGymBlueRoomWorkerText1:
	text "Heya kid."
	
	para "Let me turn the"
	line "steam down a bit."
	done
	
TwinkleGymBlueRoomWorkerText2:
	text "Good luck!"
	done
	
TwinkleGymBlueRoomDoorText1:
	text "A private room."
	
	para "There's someone"
	line "inside!"
	
	para "Wave at them?"
	done
	
TwinkleGymBlueRoomDoorText2:
	text "<PLAYER> waved!"
	done
	
TwinkleGymBlueRoomDoorText3:
	text "It's no use!"
	
	para "They can't see"
	line "through the"
	cont "steam…"
	done
	
Movement_TwinkleGymBlueRoomLeader:
	step_up
	step_right
	step_end
	
TwinkleGymBlueRoomDebug1:
	clearevent EVENT_BLUE_ROOM_STEAM_1
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
	
TwinkleGymBlueRoomDebug2:
	clearevent EVENT_BLUE_ROOM_STEAM_2
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
	
TwinkleGymBlueRoomDebug3:
	clearevent EVENT_BLUE_ROOM_STEAM_3
	loadvar wTimeOfDayPalFlags, $40 | 1
	end