TwinkleGymYellowRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymYellowRoomTrigger0
	scene_script TwinkleGymYellowRoomTrigger1

	db 0 ; callbacks

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

	db 14 ; object events
	object_event  0, 13, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker1, EVENT_BEAT_CHARLIE
	object_event  0,  7, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker2, EVENT_BEAT_CHARLIE
	object_event 14,  5, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker3, EVENT_BEAT_CHARLIE
	object_event 14, 13, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomTrainer1, -1
	object_event  0,  5, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomTrainer2, -1
	object_event  9,  9, SPRITE_BATHER_VARIABLE_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomBather1, -1
	object_event  5, 10, SPRITE_BATHER_VARIABLE_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomBather2, -1
	object_event  6,  1, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomLeader, -1
	object_event  4,  8, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  9, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5, 11, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, 11, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 10, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
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
	iftrue .checkrematch
	writetext TwinkleGymYellowRoomLeaderText1
.return
	waitbutton
	closetext
	winlosstext TwinkleGymYellowRoomLeaderWinText, 0
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_LEADER
	checkcode VAR_BADGES
	ifequal 4, .fourbadges
	ifequal 5, .fivebadges
	ifequal 6, .sixbadges
	ifequal 7, .sevenbadges
	ifequal 8, .eightbadges
	loadtrainer SPA_TRAINER_F, MAC_3
	jump .cont
.fourbadges
	loadtrainer SPA_TRAINER_F, MAC_4
	jump .cont
.fivebadges
	loadtrainer SPA_TRAINER_F, MAC_5
	jump .cont
.sixbadges
	loadtrainer SPA_TRAINER_F, MAC_6
	jump .cont
.sevenbadges
	loadtrainer SPA_TRAINER_F, MAC_7
	jump .cont
.eightbadges
	loadtrainer SPA_TRAINER_F, MAC_8
.cont
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
.checkrematch
	checkevent EVENT_BEAT_CHARLIE
	iffalse .end
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER_REMATCH
	iftrue .end2
	writetext TwinkleGymYellowRoomLeaderRematchText1
	jump .return
.end
	writetext TwinkleGymYellowRoomLeaderText2
	waitbutton
	closetext
	setevent EVENT_CAN_GET_RED_KEY
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER
	end
.end2
	writetext TwinkleGymYellowRoomLeaderRematchText2
	waitbutton
	closetext
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER_REMATCH
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
	callasm RefreshScreen_BridgeUpdate
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
.return
	checkcode VAR_BADGES
	ifequal 4, .fourbadges
	ifequal 5, .fivebadges
	ifequal 6, .sixbadges
	ifequal 7, .sevenbadges
	ifequal 8, .eightbadges
	loadtrainer SPA_TRAINER_F, LAURA_3
	jump .cont
.fourbadges
	loadtrainer SPA_TRAINER_F, LAURA_4
	jump .cont
.fivebadges
	loadtrainer SPA_TRAINER_F, LAURA_5
	jump .cont
.sixbadges
	loadtrainer SPA_TRAINER_F, LAURA_6
	jump .cont
.sevenbadges
	loadtrainer SPA_TRAINER_F, LAURA_7
	jump .cont
.eightbadges
	loadtrainer SPA_TRAINER_F, LAURA_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	checkevent EVENT_BEAT_CHARLIE
	iffalse .end
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1_REMATCH
	end
.checkrematch
	checkevent EVENT_BEAT_CHARLIE
	iffalse .end
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1_REMATCH
	iftrue .end
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_BATHER_1
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	showemote EMOTE_SHOCK, TWINKLE_GYM_YELLOW_ROOM_BATHER_1,  30
	pause 5
	special Special_UpdatePalsInstant
	changeblock $8, $8, $64
	callasm RTC
	callasm RefreshScreen_BridgeUpdate
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
	writetext TwinkleGymYellowRoomBather1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomBather1RematchBeatenText, 0
	jump .return
.end
	end
	
TwinkleGymYellowRoomBather2Script:
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	iftrue .checkrematch
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	showemote EMOTE_SHOCK, TWINKLE_GYM_YELLOW_ROOM_BATHER_2,  30
	pause 5
	special Special_UpdatePalsInstant
	changeblock $4, $a, $65
	callasm RTC
	callasm RefreshScreen_BridgeUpdate
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
.return
	checkcode VAR_BADGES
	ifequal 4, .fourbadges
	ifequal 5, .fivebadges
	ifequal 6, .sixbadges
	ifequal 7, .sevenbadges
	ifequal 8, .eightbadges
	loadtrainer SPA_TRAINER_F, BETTY_3
	jump .cont
.fourbadges
	loadtrainer SPA_TRAINER_F, BETTY_4
	jump .cont
.fivebadges
	loadtrainer SPA_TRAINER_F, BETTY_5
	jump .cont
.sixbadges
	loadtrainer SPA_TRAINER_F, BETTY_6
	jump .cont
.sevenbadges
	loadtrainer SPA_TRAINER_F, BETTY_7
	jump .cont
.eightbadges
	loadtrainer SPA_TRAINER_F, BETTY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	checkevent EVENT_BEAT_CHARLIE
	iffalse .end
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2_REMATCH
	end
.checkrematch
	checkevent EVENT_BEAT_CHARLIE
	iffalse .end
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2_REMATCH
	iftrue .end
	setlasttalked TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	showemote EMOTE_SHOCK, TWINKLE_GYM_YELLOW_ROOM_BATHER_2,  30
	pause 5
	special Special_UpdatePalsInstant
	changeblock $4, $a, $65
	callasm RTC
	callasm RefreshScreen_BridgeUpdate
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
	writetext TwinkleGymYellowRoomBather2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomBather2RematchBeatenText, 0
	jump .return
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
	checkcode VAR_BADGES
	ifequal 4, .fourbadges
	ifequal 5, .fivebadges
	ifequal 6, .sixbadges
	ifequal 7, .sevenbadges
	ifequal 8, .eightbadges
	loadtrainer SPA_TRAINER, CHUCK_3
	jump .cont
.fourbadges
	loadtrainer SPA_TRAINER, CHUCK_4
	jump .cont
.fivebadges
	loadtrainer SPA_TRAINER, CHUCK_5
	jump .cont
.sixbadges
	loadtrainer SPA_TRAINER, CHUCK_6
	jump .cont
.sevenbadges
	loadtrainer SPA_TRAINER, CHUCK_7
	jump .cont
.eightbadges
	loadtrainer SPA_TRAINER, CHUCK_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1
	checkevent EVENT_BEAT_CHARLIE
	iffalse .skip
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1_REMATCH
	jump .skip
.FightDone
	checkevent EVENT_BEAT_CHARLIE
	iffalse .skip
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1_REMATCH
	iffalse .rematch
.skip
	writetext TwinkleGymYellowRoomTrainer1RegularText
	waitbutton
	closetext
	end
.rematch
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext TwinkleGymYellowRoomTrainer1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomTrainer1RematchBeatenText, 0
	jump .return

TwinkleGymYellowRoomTrainer1RegularText:
	text "REGULAR TEXT"
	done

TwinkleGymYellowRoomTrainer1SeenText:
	text "SEEN TEXT"
	done
	
TwinkleGymYellowRoomTrainer1RematchSeenText:
	text "SEEN TEXT"
	done

TwinkleGymYellowRoomTrainer1BeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomTrainer1RematchBeatenText:
	text "YOU WIN"
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
.return
	checkcode VAR_BADGES
	ifequal 4, .fourbadges
	ifequal 5, .fivebadges
	ifequal 6, .sixbadges
	ifequal 7, .sevenbadges
	ifequal 8, .eightbadges
	loadtrainer SPA_TRAINER, SEYMOUR_3
	jump .cont
.fourbadges
	loadtrainer SPA_TRAINER, SEYMOUR_4
	jump .cont
.fivebadges
	loadtrainer SPA_TRAINER, SEYMOUR_5
	jump .cont
.sixbadges
	loadtrainer SPA_TRAINER, SEYMOUR_6
	jump .cont
.sevenbadges
	loadtrainer SPA_TRAINER, SEYMOUR_7
	jump .cont
.eightbadges
	loadtrainer SPA_TRAINER, SEYMOUR_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2
	checkevent EVENT_BEAT_CHARLIE
	iffalse .skip
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2_REMATCH
	jump .skip
.FightDone
	checkevent EVENT_BEAT_CHARLIE
	iffalse .skip
	checkevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2_REMATCH
	iffalse .rematch
.skip
	writetext TwinkleGymYellowRoomTrainer2RegularText
	waitbutton
	closetext
	end
.rematch
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext TwinkleGymYellowRoomTrainer2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext TwinkleGymYellowRoomTrainer2RematchBeatenText, 0
	jump .return

TwinkleGymYellowRoomTrainer2RegularText:
	text "REGULAR TEXT"
	done

TwinkleGymYellowRoomTrainer2SeenText:
	text "SEEN TEXT"
	done
	
TwinkleGymYellowRoomTrainer2RematchSeenText:
	text "SEEN TEXT"
	done

TwinkleGymYellowRoomTrainer2BeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomTrainer2RematchBeatenText:
	text "YOU WIN"
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
	text "NORMAL TEXT"
	done
	
TwinkleGymYellowRoomBather1SeenText:
	text "Surprise!"
	done
	
TwinkleGymYellowRoomBather1RematchSeenText:
	text "Surprise!"
	done
	
TwinkleGymYellowRoomBather1BeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomBather1RematchBeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomBather2RegularText:
	text "NORMAL TEXT"
	done
	
TwinkleGymYellowRoomBather2SeenText:
	text "Surprise!"
	done
	
TwinkleGymYellowRoomBather2RematchSeenText:
	text "Surprise!"
	done
	
TwinkleGymYellowRoomBather2BeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomBather2RematchBeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomLeaderText1:
	text "TEXT 1"
	done
	
TwinkleGymYellowRoomLeaderRematchText1:
	text "TEXT 1"
	done
	
TwinkleGymYellowRoomLeaderText2:
	text "TEXT 2"
	done
	
TwinkleGymYellowRoomLeaderRematchText2:
	text "TEXT 2"
	done
	
TwinkleGymYellowRoomLeaderWinText:
	text "YOU WIN"
	done
	