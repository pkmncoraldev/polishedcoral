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

	db 4 ; object events
	object_event  4, 14, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomWorker1, EVENT_BEAT_CHARLIE
	object_event  0,  6, SPRITE_BURGLAR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomWorker2, EVENT_BEAT_CHARLIE
	object_event  9,  1, SPRITE_BURGLAR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomWorker3, EVENT_BEAT_CHARLIE
	object_event  4,  5, SPRITE_CORY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	
	const_def 1 ; object constants
	const TWINKLE_GYM_BLUE_ROOM_WORKER_1
	const TWINKLE_GYM_BLUE_ROOM_WORKER_2
	const TWINKLE_GYM_BLUE_ROOM_WORKER_3
	const TWINKLE_GYM_BLUE_ROOM_LEADER

TwinkleGymBlueRoomTrigger0:
	end
	
TwinkleGymBlueRoomTrigger1:
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
	writetext TwinkleGymEntryBetterNotText
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