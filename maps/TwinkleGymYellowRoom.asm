TwinkleGymYellowRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymYellowRoomTrigger0
	scene_script TwinkleGymYellowRoomTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 21,  8, 4, TWINKLE_GYM_ENTRY
	warp_def 21,  9, 4, TWINKLE_GYM_ENTRY

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

	db 0 ; bg events

	db 12 ; object events
	object_event  0, 13, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker1, EVENT_BEAT_CHARLIE
	object_event  0,  7, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker2, EVENT_BEAT_CHARLIE
	object_event 14,  5, SPRITE_SPA_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomWorker3, EVENT_BEAT_CHARLIE
	object_event 14, 13, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomTrainer1, -1
	object_event  0,  5, SPRITE_SPA_TRAINER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomTrainer2, -1
	object_event  9,  9, SPRITE_BATHER_VARIABLE_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomBather1, -1
	object_event  5, 10, SPRITE_BATHER_VARIABLE_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, TwinkleGymYellowRoomBather2, -1
	object_event  4,  8, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  8,  9, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5, 11, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10, 11, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 10, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	
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
	end
.FightDone
	writetext TwinkleGymYellowRoomBather1RegularText
	waitbutton
	closetext
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
	setevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2
	end
.FightDone
	writetext TwinkleGymYellowRoomBather2RegularText
	waitbutton
	closetext
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
	end
.FightDone
	writetext TwinkleGymYellowRoomTrainer1RegularText
	waitbutton
	closetext
	end

TwinkleGymYellowRoomTrainer1RegularText:
	text "REGULAR TEXT"
	done

TwinkleGymYellowRoomTrainer1SeenText:
	text "SEEN TEXT"
	done

TwinkleGymYellowRoomTrainer1BeatenText:
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
	end
.FightDone
	writetext TwinkleGymYellowRoomTrainer2RegularText
	waitbutton
	closetext
	end

TwinkleGymYellowRoomTrainer2RegularText:
	text "REGULAR TEXT"
	done

TwinkleGymYellowRoomTrainer2SeenText:
	text "SEEN TEXT"
	done

TwinkleGymYellowRoomTrainer2BeatenText:
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
	
TwinkleGymYellowRoomBather1RegularText:
	text "NORMAL TEXT"
	done
	
TwinkleGymYellowRoomBather1SeenText:
	text "Surprise!"
	done
	
TwinkleGymYellowRoomBather1BeatenText:
	text "YOU WIN"
	done
	
TwinkleGymYellowRoomBather2RegularText:
	text "NORMAL TEXT"
	done
	
TwinkleGymYellowRoomBather2SeenText:
	text "Surprise!"
	done
	
TwinkleGymYellowRoomBather2BeatenText:
	text "YOU WIN"
	done
	