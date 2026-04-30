TwinkleGymYellowRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymYellowRoomTrigger0
	scene_script TwinkleGymYellowRoomTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, TwinkleGymYellowRoomCallback

	db 2 ; warp events
	warp_def 21,  6, 4, TWINKLE_GYM_ENTRY
	warp_def 21,  7, 4, TWINKLE_GYM_ENTRY

	db 12 ; coord events
	xy_trigger 0,  8,  5, 0, TwinkleGymYellowRoomPoolScript, 0, 0
	xy_trigger 0, 11,  8, 0, TwinkleGymYellowRoomPoolScript, 0, 0
	xy_trigger 1, 12,  8, 0, TwinkleGymYellowRoomPool2Script, 0, 0
	xy_trigger 1,  7,  5, 0, TwinkleGymYellowRoomPool2Script, 0, 0
	xy_trigger 1, 10,  9, 0, TwinkleGymYellowRoomBather1Script, 0, 0
	xy_trigger 1,  9,  8, 0, TwinkleGymYellowRoomBather1Script, 0, 0
	xy_trigger 1,  8,  9, 0, TwinkleGymYellowRoomBather1Script, 0, 0
	xy_trigger 1,  9, 10, 0, TwinkleGymYellowRoomBather1Script, 0, 0
	xy_trigger 1, 11,  5, 0, TwinkleGymYellowRoomBather2Script, 0, 0
	xy_trigger 1, 10,  4, 0, TwinkleGymYellowRoomBather2Script, 0, 0
	xy_trigger 1,  9,  5, 0, TwinkleGymYellowRoomBather2Script, 0, 0
	xy_trigger 1, 10,  6, 0, TwinkleGymYellowRoomBather2Script, 0, 0

	db 2 ; bg events
	signpost  3,  6, SIGNPOST_IFNOTSET, TwinkleGymYellowRoomDoor
	signpost  3,  7, SIGNPOST_IFNOTSET, TwinkleGymYellowRoomDoor

	db 12 ; object events
	object_event  0, 13, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker1, EVENT_BEAT_CHARLIE
	object_event  0,  7, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker2, EVENT_BEAT_CHARLIE
	object_event 14,  5, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker3, EVENT_BEAT_CHARLIE
	object_event 14, 13, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomTrainer1, -1
	object_event  0,  5, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomTrainer2, -1
	object_event  9,  9, SPRITE_BATHER_VARIABLE_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomBather1, -1
	object_event  5, 10, SPRITE_BATHER_VARIABLE_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomBather2, -1
	object_event  6,  1, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomLeader, -1
	object_event  5, 11, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9, 10, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  8, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  1, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	
	const_def 1 ; object constants
	const TWINKLE_GYM_YELLOW_ROOM_WORKER_1
	const TWINKLE_GYM_YELLOW_ROOM_WORKER_2
	const TWINKLE_GYM_YELLOW_ROOM_WORKER_3
	const TWINKLE_GYM_YELLOW_ROOM_TRAINER_1
	const TWINKLE_GYM_YELLOW_ROOM_TRAINER_2
	const TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	const TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	const TWINKLE_GYM_YELLOW_ROOM_LEADER

TwinkleGymYellowRoomTrigger0:
	end
	
TwinkleGymYellowRoomTrigger1:
	end

TwinkleGymYellowRoomCallback:
	checkevent EVENT_TWINKLE_GYM_YELLOW_ROOM_GLASS
	iffalse .no_door
	changeblock $6, $2, $77
.no_door
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	iffalse .check2ndbather
	changeblock $8, $8, $64
.check2ndbather
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	iffalse .end
	changeblock $4, $a, $65
.end
	return

TwinkleGymYellowRoomPoolScript:
	callasm TwinkleGymYellowRoomPoolAsm
	dotrigger $1
	end
	
TwinkleGymYellowRoomPool2Script:
	callasm TwinkleGymYellowRoomPool2Asm
	dotrigger $0
	end
	
TwinkleGymYellowRoomPoolAsm:
	ld a, PLAYER_BATHING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
TwinkleGymYellowRoomPool2Asm:
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
TwinkleGymYellowRoomLeader:
	opentext
	checkevent EVENT_CAN_GET_RED_KEY
	iftrue .end
	writetext TwinkleGymBlueRoomLeaderText1
	waitbutton
	closetext
	winlosstext TwinkleGymBlueRoomLeaderWinText, 0
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_LEADER
	loadtrainer SPA_TRAINER, MAC
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
.end
	writetext TwinkleGymBlueRoomLeaderText2
	waitbutton
	closetext
	setevent EVENT_CAN_GET_RED_KEY
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER
	end
	
TwinkleGymYellowRoomDoor:
	dw EVENT_TWINKLE_GYM_YELLOW_ROOM_GLASS
	opentext
	writetext TwinkleGymBlueRoomDoorText1
	yesorno
	iffalse .no
	writetext TwinkleGymBlueRoomDoorText2
	pause 20
	closetext
	pause 20
	checkevent EVENT_YELLOW_ROOM_STEAM_3
	iffalse .unlockdoor
	opentext
	writetext TwinkleGymBlueRoomDoorText3
	waitbutton
	closetext
	end
.unlockdoor
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_YELLOW_ROOM_LEADER, DOWN
	showemote EMOTE_SHOCK, TWINKLE_GYM_YELLOW_ROOM_LEADER, 15
	wait 5
	applymovement TWINKLE_GYM_YELLOW_ROOM_LEADER, Movement_TwinkleGymYellowRoomLeader
	spriteface TWINKLE_GYM_YELLOW_ROOM_LEADER, DOWN
	changeblock $6, $2, $77
	setevent EVENT_TWINKLE_GYM_YELLOW_ROOM_GLASS
	pause 7
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
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
	
TwinkleGymYellowRoomBather1Script:
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	iftrue .end
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	showemote EMOTE_SHOCK, TWINKLE_GYM_YELLOW_ROOM_BATHER_1,  30
	pause 5
	special Special_UpdatePalsInstant
	changeblock $8, $8, $64
	callasm RTC
	callasm GenericFinishBridge
	spriteface TWINKLE_GYM_YELLOW_ROOM_BATHER_1, LEFT
	pause 2
	spriteface TWINKLE_GYM_YELLOW_ROOM_BATHER_1, UP
	pause 20
	variablesprite SPRITE_BATHER_VARIABLE_1, SPRITE_BATHER_2
	spriteface TWINKLE_GYM_YELLOW_ROOM_BATHER_1, DOWN
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 20
	faceplayer
	opentext
	writetext TwinkleGymYellowRoomBather1SeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomBather1BeatenText, 0
	loadtrainer SPA_TRAINER_F, LAURA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	changeblock $8, $8, $64
	callasm GenericFinishBridge
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1
.end
	end
	
TwinkleGymYellowRoomBather2Script:
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	iftrue .end
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	showemote EMOTE_SHOCK, TWINKLE_GYM_YELLOW_ROOM_BATHER_2,  30
	pause 5
	special Special_UpdatePalsInstant
	changeblock $4, $a, $65
	callasm RTC
	callasm GenericFinishBridge
	spriteface TWINKLE_GYM_YELLOW_ROOM_BATHER_2, LEFT
	pause 2
	spriteface TWINKLE_GYM_YELLOW_ROOM_BATHER_2, UP
	pause 20
	variablesprite SPRITE_BATHER_VARIABLE_2, SPRITE_BATHER_2
	spriteface TWINKLE_GYM_YELLOW_ROOM_BATHER_2, DOWN
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 20
	faceplayer
	opentext
	writetext TwinkleGymYellowRoomBather2SeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomBather2BeatenText, 0
	loadtrainer SPA_TRAINER_F, BETTY
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	changeblock $4, $a, $65
	callasm GenericFinishBridge
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
.end
	end
	
TwinkleGymYellowRoomBather1:
	jumptextfaceplayer TwinkleGymYellowRoomBather1RegularText
	
TwinkleGymYellowRoomBather2:
	jumptextfaceplayer TwinkleGymYellowRoomBather2RegularText
	
TwinkleGymYellowRoomTrainer1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext TwinkleGymYellowRoomTrainer1SeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomTrainer1BeatenText, 0
.return
	loadtrainer SPA_TRAINER, CHUCK
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1
	end
.FightDone
	writetext TwinkleGymYellowRoomTrainer1RegularText
	waitbutton
	closetext
	end

TwinkleGymYellowRoomTrainer1RegularText:
	text "I got burned…"
	
	para "You're good."
	done

TwinkleGymYellowRoomTrainer1SeenText:
	text "Battle! <WAIT_S>Battle!"
	
	para "I'll burn you down,"
	line "kid!"
	done

TwinkleGymYellowRoomTrainer1BeatenText:
	text "Ah!<WAIT_M>"
	line "It burns!"
	done
	
TwinkleGymYellowRoomTrainer2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2
	iftrue .FightDone
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext TwinkleGymYellowRoomTrainer2SeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomTrainer2BeatenText, 0
	loadtrainer SPA_TRAINER, SEYMOUR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2
	end
.FightDone
	writetext TwinkleGymYellowRoomTrainer2RegularText
	waitbutton
	closetext
	end

TwinkleGymYellowRoomTrainer2RegularText:
	text "What a hot"
	line "battle!"
	done

TwinkleGymYellowRoomTrainer2SeenText:
	text "Battle time!"
	
	para "Let's do this!"
	done

TwinkleGymYellowRoomTrainer2BeatenText:
	text "Well that's <WAIT_S>that!"
	done
	
TwinkleGymYellowRoomWorker1:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_GYM_YELLOW_ROOM_WORKER_1
	iftrue .alreadydone
	setevent EVENT_TWINKLE_GYM_YELLOW_ROOM_WORKER_1
	jump TwinkleGymYellowRoomWorker
.alreadydone
	writetext TwinkleGymBlueRoomWorkerText2
	waitbutton
	closetext
	end
	
TwinkleGymYellowRoomWorker2:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_GYM_YELLOW_ROOM_WORKER_2
	iftrue .alreadydone
	setevent EVENT_TWINKLE_GYM_YELLOW_ROOM_WORKER_2
	jump TwinkleGymYellowRoomWorker
.alreadydone
	writetext TwinkleGymBlueRoomWorkerText2
	waitbutton
	closetext
	end
	
TwinkleGymYellowRoomWorker3:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_GYM_YELLOW_ROOM_WORKER_3
	iftrue .alreadydone
	setevent EVENT_TWINKLE_GYM_YELLOW_ROOM_WORKER_3
	jump TwinkleGymYellowRoomWorker
.alreadydone
	writetext TwinkleGymBlueRoomWorkerText2
	waitbutton
	closetext
	end
	
TwinkleGymYellowRoomWorker:
	writetext TwinkleGymBlueRoomWorkerText1
	waitbutton
	closetext
	checkevent EVENT_YELLOW_ROOM_STEAM_1
	iftrue .steam1
	checkevent EVENT_YELLOW_ROOM_STEAM_2
	iftrue .steam2
	clearevent EVENT_YELLOW_ROOM_STEAM_3
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
.steam1
	clearevent EVENT_YELLOW_ROOM_STEAM_1
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
.steam2
	clearevent EVENT_YELLOW_ROOM_STEAM_2
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
	
Movement_TwinkleGymYellowRoomLeader:
	step_down
	step_right
	step_end
	
TwinkleGymYellowRoomBather1RegularText:
	text "I love jumping out"
	line "to scare people!"
	done
	
TwinkleGymYellowRoomBather1SeenText:
	text "Surprise!"
	
	para "Weren't expecting"
	line "that, were ya?"
	done
	
TwinkleGymYellowRoomBather1BeatenText:
	text "Did I get you?"
	done
	
TwinkleGymYellowRoomBather2RegularText:
	text "You're in the bath"
	line "in your regular"
	cont "clothes?"
	
	para "What a freak!"
	done
	
TwinkleGymYellowRoomBather2SeenText:
	text "Isn't this bath"
	line "so nice?"
	
	para "Splish <WAIT_S>splash!"
	done
	
TwinkleGymYellowRoomBather2BeatenText:
	text "Ah, <WAIT_S>who cares?"
	
	para "This is too nice!"
	done
	