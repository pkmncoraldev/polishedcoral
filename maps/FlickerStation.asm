FlickerStation_MapScriptHeader:
	db 2 ; scene scripts
	scene_script FlickerStationTrigger0
	scene_script FlickerStationTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, FlickerStationFlypointCallback
	callback MAPCALLBACK_TILES, FlickerStationCallback

	db 7 ; warp events
	warp_def 29,  9, 1, FLICKER_POKECENTER
	warp_def 15,  7, 1, FLICKER_MART
	warp_def 15, 15, 1, FLICKER_SOUND_SPEECH_HOUSE
	warp_def 15, 25, 1, FLICKER_NAME_SPEECH_HOUSE
	warp_def 29, 23, 1, FLICKER_TRAIN_STATION
	warp_def 29, 24, 2, FLICKER_TRAIN_STATION
	warp_def  7, 23, 1, FLICKER_PASS_1F
	

	db 2 ; coord events
	xy_trigger 1, 33, 22, 0, FlickerStationSnare1, 0, 0
	xy_trigger 1, 33, 23, 0, FlickerStationSnare2, 0, 0

	db 3 ; bg events
	signpost 29, 10, SIGNPOST_READ, FlickerCenterSign
	signpost 15,  8, SIGNPOST_READ, FlickerMartSign
	signpost 35, 12, SIGNPOST_READ, FlickerSign

	db 10 ; object events
	person_event SPRITE_FAT_GUY, 30, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 31, 12, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationNPC2, -1
	person_event SPRITE_CHILD, 18, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC3, -1
	person_event SPRITE_SCHOOLGIRL, 18, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC4, -1
	person_event SPRITE_YOUNGSTER, 16, 10, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC5, -1
	person_event SPRITE_COOL_DUDE, 35, 27, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, FlickerStationNPC6, -1
	person_event SPRITE_HIKER, 13, 20, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC7, -1
	person_event SPRITE_SNARE, 35, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	itemball_event 22, 34, TRAIN_TICKET, 1, EVENT_FLICKER_STATION_TRAIN_TICKET
	itemball_event 13, 10, MAX_REVIVE, 1, EVENT_FLICKER_STATION_POKEBALL


	const_def 1 ; object constants
	const FLICKER_STATION_NPC1
	const FLICKER_STATION_NPC2
	const FLICKER_STATION_NPC3
	const FLICKER_STATION_NPC4
	const FLICKER_STATION_NPC5
	const FLICKER_STATION_NPC6
	const FLICKER_STATION_NPC7
	const FLICKER_STATION_SNARE
	const FLICKER_STATION_DROPPED_ITEM
	
FlickerStationTrigger0:
	end
	
FlickerStationTrigger1:
	end
	
FlickerStationPlayerSeatAsm:
	ld hl, rIE
    res LCD_STAT, [hl]
    xor a
    ld [hLCDTrain], a
    ld a, $B0
    ld [hWY], a
	ld a, 7
    ld [hWX], a
	ld a, PLAYER_SITTING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
FlickerStationFlypointCallback:
	setflag ENGINE_FLYPOINT_FLICKER
	return
	
FlickerStationCallback:
	checkevent EVENT_BEAT_TRAINGRAVEYARD_TRAINER_2
	iffalse .end
	setevent EVENT_FLICKER_STATION_GIRL_STEP_ASIDE
.end
	return
	
FlickerStationSnare2:
	moveperson FLICKER_STATION_SNARE, $12, $23
	moveperson FLICKER_STATION_DROPPED_ITEM, $17, $22
	
FlickerStationSnare1:
	special Special_StopRunning
	opentext
	writetext FlickerStationSnareText1
	waitbutton
	closetext
	appear FLICKER_STATION_SNARE
	applymovement FLICKER_STATION_SNARE, Movement_FlickerStationSnare1
	callasm FlickerStationFallOverAsm
	spriteface PLAYER, UP
	playsound SFX_BEAT_UP
	applyonemovement PLAYER, jump_step_up
	playsound SFX_SUBMISSION
	applyonemovement PLAYER, slow_step_up
	appear FLICKER_STATION_DROPPED_ITEM
	applymovement FLICKER_STATION_SNARE, Movement_FlickerStationSnare2
	spriteface FLICKER_STATION_SNARE, LEFT
	opentext
	writetext FlickerStationSnareText2
	waitbutton
	closetext
	applymovement FLICKER_STATION_SNARE, Movement_FlickerStationSnare3
	playsound SFX_EXIT_BUILDING
	disappear FLICKER_STATION_SNARE
	waitsfx
	pause 10
	special Special_ForcePlayerStateNormal
	dotrigger $0
	clearevent EVENT_FLICKER_TRAIN_STATION_SNARE
	end
	
FlickerStationFallOverAsm:
	ld a, PLAYER_FALLING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
FlickerSign:
	jumptext FlickerSignText
	
FlickerCenterSign:
	jumpstd pokecentersign

FlickerMartSign:
	jumpstd martsign
	
FlickerStationNPC1:
	faceplayer
	opentext
	writetext FlickerStationNPC1Text
	waitbutton
	spriteface FLICKER_STATION_NPC1, DOWN
	closetext
	end
	
FlickerStationNPC2:
	jumptextfaceplayer FlickerStationNPC2Text
	
FlickerStationNPC3:
	faceplayer
	opentext
	writetext FlickerStationNPC3Text
	waitbutton
	spriteface FLICKER_STATION_NPC3, DOWN
	closetext
	end
	
FlickerStationNPC4:
	faceplayer
	opentext
	writetext FlickerStationNPC4Text
	waitbutton
	spriteface FLICKER_STATION_NPC4, DOWN
	closetext
	end
	
FlickerStationNPC5:
	jumptextfaceplayer FlickerStationNPC5Text
	
FlickerStationNPC6:
	jumptextfaceplayer FlickerStationNPC6Text
	
FlickerStationNPC7:
	jumptextfaceplayer FlickerStationNPC7Text
		
FlickerTrainDoorText:
	text "It's shut tight."
	done
	
FlickerSignText:
	text "FLICKER STATION"
	
	para "The charming por-"
	line "tal to prosperity."
	done
	
FlickerStationNPC6Text:
	text "The train station"
	line "recently reopened."
	
	para "It was closed for"
	line "renovations."
	
	para "How inconvenient!"
	done
	
FlickerStationNPC1Text:
	text "This town may"
	line "seem sleepy, but"
	cont "the trains here"
	cont "are no joke."
	
	para "They're seriously"
	line "fast!"
	done
	
FlickerStationNPC2Text:
	text "The train here"
	line "runs to LUSTER"
	cont "CITY."
	
	para "This little town"
	line "is kinda like a"
	cont "gateway to the"
	cont "biggest city in"
	cont "ONWA!"
	done
	
FlickerStationNPC3Text:
	text "Woah!"

	para "Look at the"
	line "trains!"
	
	para "So cool!"
	done
	
FlickerStationNPC4Text:
	text "All he talks about"
	line "is trains…"
	
	para "Trains, trains,"
	line "trains!"
	
	para "I hate trains!"
	done
	
FlickerStationNPC5Text:
	text "I'm so tired of"
	line "dirt roads."
	
	para "I keep getting"
	line "gravel in my"
	cont "shoes."
	
	para "I just want to go"
	line "to the city!"
	done
	
FlickerStationNPC7Text:
	text "That cave leads"
	line "up higher in the"
	cont "mountains."
	
	para "It gets pretty"
	line "chilly up there,"
	cont "so be prepared."
	done
	
FlickerStationAllAboardText:
	text "All aboard!"
	
	para "Train heading to"
	line "LUSTER CITY is"
	cont "now departing!"
	done
	
FlickerStationSnareText1:
	text "OUTTA MY WAY!"
	done
	
FlickerStationSnareText2:
	text "Sorry kid, but"
	line "I'm late!"
	done
	
Movement_FlickerStationOfficer:
	step_left
	step_up
	step_end
	
Movement_FlickerStationTrainCamera:
	slow_step_up
	slow_step_right
	step_end
	
Movement_FlickerStationSnare1:
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_up
	step_end
	
Movement_FlickerStationSnare2:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	step_up
	run_step_up
	run_step_right
	run_step_up
	step_end
	
Movement_FlickerStationSnare3:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	step_end
	