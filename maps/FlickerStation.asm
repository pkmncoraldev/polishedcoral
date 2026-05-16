FlickerStation_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, FlickerStationFlypointCallback
	callback MAPCALLBACK_TILES, FlickerStationCallback

	db 7 ; warp events
	warp_def 29, 11, 1, FLICKER_POKECENTER
	warp_def 15,  7, 2, FLICKER_MART
	warp_def 15, 15, 1, FLICKER_SOUND_SPEECH_HOUSE
	warp_def 15, 23, 1, FLICKER_NAME_SPEECH_HOUSE
	warp_def 29, 21, 1, FLICKER_TRAIN_STATION
	warp_def 29, 22, 2, FLICKER_TRAIN_STATION
	warp_def  7, 22, 1, FLICKER_PASS_1F
	

	db 0 ; coord events

	db 3 ; bg events
	signpost 29, 12, SIGNPOST_READ, FlickerCenterSign
	signpost 15,  8, SIGNPOST_READ, FlickerMartSign
	signpost 32, 12, SIGNPOST_READ, FlickerSign

	db 9 ; object events
	person_event SPRITE_OFFICER, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationCop, EVENT_GOT_BIKE
	person_event SPRITE_FAT_GUY, 33, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 31, 13, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerStationNPC2, -1
	person_event SPRITE_CHILD, 18, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC3, -1
	person_event SPRITE_SCHOOLGIRL, 18, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC4, -1
	person_event SPRITE_YOUNGSTER, 16, 10, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC5, -1
	person_event SPRITE_COOL_DUDE, 27, 16, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, FlickerStationNPC6, -1
	person_event SPRITE_HIKER, 13, 20, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC7, -1
	itemball_event 20, 10, TRAIN_TICKET, 1, EVENT_FLICKER_STATION_TRAIN_TICKET


	const_def 1 ; object constants
	const FLICKER_STATION_COP
	const FLICKER_STATION_NPC1
	const FLICKER_STATION_NPC2
	const FLICKER_STATION_NPC3
	const FLICKER_STATION_NPC4
	const FLICKER_STATION_NPC5
	const FLICKER_STATION_NPC6
	const FLICKER_STATION_NPC7
	
FlickerStationPlayerSeatAsm:
	ld hl, rIE
    res LCD_STAT, [hl]
    xor a
    ldh [hLCDTrain], a
    ld a, $B0
    ldh [hWY], a
	ld a, 7
    ldh [hWX], a
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
	
FlickerStationCop:
	faceplayer
	opentext
	writetext FlickerStationCopText
	waitbutton
	closetext
	spriteface FLICKER_STATION_COP, DOWN
	end
	
FlickerStationCopText:
	text "I'm sorry, but I"
	line "can't let you pass."
	
	para "We've had a report"
	line "that a child from"
	cont "EVENTIDE VILLAGE"
	cont "has gone missing."
	
	para "Once he is home"
	line "safe and sound, "
	cont "travel will be"
	cont "allowed again."
	done
	
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
	text "There's a group of"
	line "punks that hang"
	cont "out at the old"
	cont "train depot and"
	cont "cause problems."
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
	
	para "Trains, <WAIT_S>trains,<WAIT_S>"
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
	
Movement_FlickerStationOfficer:
	step_left
	step_up
	step_end
	
Movement_FlickerStationTrainCamera:
	slow_step_up
	slow_step_right
	step_end
