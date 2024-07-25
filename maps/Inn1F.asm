Inn1F_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Inn1FTrigger0

	db 0 ; callbacks

	db 17 ; warp events
	warp_event 13, 23, CROSSROADS, 1
	warp_event 14, 23, CROSSROADS, 2
	warp_event -1, -1, INN_2F, 1
	warp_event 23, 11, INN_2F, 2
	warp_event  5, 11, INN_1F, 9
	warp_event  9, 11, INN_1F, 11
	warp_event 17, 11, INN_1F, 13
	warp_event 21, 11, INN_1F, 15
	warp_event  0,  5, INN_1F, 5
	warp_event  1,  5, INN_1F, 5
	warp_event  6,  5, INN_1F, 6
	warp_event  7,  5, INN_1F, 6
	warp_event 18,  5, INN_1F, 7
	warp_event 19,  5, INN_1F, 7
	warp_event 24,  5, INN_1F, 8
	warp_event 25,  5, INN_1F, 8
	warp_event 13, 11, INN_ELEVATOR, 1

	db 0 ; coord events

	db 11 ; bg events
	signpost 20,  7, SIGNPOST_JUMPTEXT, Inn1FLaptopText
	signpost 15, 12, SIGNPOST_JUMPTEXT, Inn1FWetFloorText
	signpost 11,  7, SIGNPOST_JUMPTEXT, Inn1FPainting1Text
	signpost 11, 19, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost 20, 11, SIGNPOST_JUMPTEXT, Inn1FStatueText
	signpost 16,  6, SIGNPOST_JUMPTEXT, Inn1FWhiteboardText
	signpost 16, 17, SIGNPOST_READ, Inn1FLemonWater
	signpost 11, 20, SIGNPOST_JUMPTEXT, Inn1F101Text
	signpost 11, 16, SIGNPOST_JUMPTEXT, Inn1F102Text
	signpost 11, 10, SIGNPOST_JUMPTEXT, Inn1F103Text
	signpost 11,  6, SIGNPOST_JUMPTEXT, Inn1F104Text

	db 10 ; object events
	person_event SPRITE_MINA_GROUND, 17,  8, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND, 17,  9, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND, 17, 10, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND, 17, 11, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FAT_GUY, 19, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, -1
	person_event SPRITE_INVISIBLE, 11,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_INVISIBLE, 11, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1

	const_def 1 ; object constants
	const INN_1F_WALL_1
	const INN_1F_WALL_2
	const INN_1F_WALL_3
	const INN_1F_WALL_4
	const INN_1F_CLERK
	const INN_1F_DOOR_LOCK_1
	const INN_1F_DOOR_LOCK_2
	const INN_1F_DOOR_LOCK_3
	const INN_1F_DOOR_LOCK_4
	const INN_1F_DOOR_LOCK_5
	
Inn1FTrigger0:
	callasm Inn1FRunningInTheHallsASM
	ifequal 1, .hall
	ifequal 2, .lobby
	end
.hall
	disappear INN_1F_CLERK
	callasm Inn1FMoveClerkAsm
	ifequal 2, .right
	appear INN_1F_CLERK
	special Special_StopRunning
	applyonemovement INN_1F_CLERK, step_left
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, step_right
	disappear INN_1F_CLERK
	callasm Inn1FResertScriptVar
	moveperson INN_1F_CLERK, $0a, $13
	appear INN_1F_CLERK
	end
.right
	appear INN_1F_CLERK
	special Special_StopRunning
	applyonemovement INN_1F_CLERK, step_right
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, step_left
	disappear INN_1F_CLERK
	callasm Inn1FResertScriptVar
	moveperson INN_1F_CLERK, $0a, $13
	appear INN_1F_CLERK
	end
.lobby
	setlasttalked INN_1F_CLERK
	faceplayer
	opentext
	writetext Inn1FNoRunningLobbyText
	waitbutton
	closetext
	spriteface INN_1F_CLERK, RIGHT
	callasm Inn1FResertScriptVar
	end
	
Inn1FNoRunningHallsText:
	text "Hey!"
	
	para "No running in"
	line "the halls!"
	done
	
Inn1FNoRunningLobbyText:
	text "Hey!"
	
	para "No running in"
	line "the lobby!"
	done
	
Inn1FMoveClerkAsm:
	ld a, [wXCoord]
	cp $0b
	jr nc, .right
	ld a, 1
	ld [wScriptVar], a
	ld a, INN_1F_CLERK
	ld b, a
	ld a, [wXCoord]
	add 6
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
.right
	ld a, 2
	ld [wScriptVar], a
	ld a, INN_1F_CLERK
	ld b, a
	ld a, [wXCoord]
	sub 5
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
Inn1FResertScriptVar:
	xor a
	ld [wScriptVar], a
	ret
	
Inn1FRunningInTheHallsASM:
	ld a, [wPlayerState]
	cp PLAYER_RUN
	ret nz
	ld a, [wYCoord]
	cp $0e
	jr nc, .bottom
	cp $6
	jr nc, .middle
	ret
.middle
	ld a, 1
	ld [wScriptVar], a
	ret
.bottom
	ld a, 2
	ld [wScriptVar], a
	ret
	
Inn1FLockedDoor:
	jumptext Inn1FLockedDoorText
	
Inn1FLockedDoorText:
	text "It's locked."
	done
	
Inn1FLockedElevator:
	jumptext Inn1FLockedElevatorText
	
Inn1FLockedElevatorText:
	text "It isn't running"
	line "at the moment."
	
	para "Better take the"
	line "stairs."
	done
	
Inn1FLemonWater:
	opentext
	writetext Inn1FLemonWaterText1
	yesorno
	iffalse .no
	callasm Inn1FResertScriptVar
	writetext Inn1FLemonWaterTextYes
	waitbutton
	closetext
	pause 20
	opentext
	special Special_DotDotDot
	closetext
	pause 20
	opentext
	writetext Inn1FLemonWaterText2
	waitbutton
	closetext
	end
.no
	writetext Inn1FLemonWaterNo
	waitbutton
	closetext
	end
	
Inn1FLemonWaterText1:
	text "A water cooler"
	line "filled with lemon"
	cont "water."
	
	para "Small plastic cups"
	line "sit beside it."
	
	para "Take some?"
	done
	
Inn1FLemonWaterText2:
	text "Tastes kinda"
	line "funky…"
	
	para "Better stick to"
	line "FRESH WATER…"
	done
	
Inn1FLemonWaterTextYes:
	text "Who wouldn't?"
	done
	
Inn1FLemonWaterNo:
	text "Better not…"
	done
	
Inn1F101Text:
	text "ROOM 101"
	done
	
Inn1F102Text:
	text "ROOM 102"
	done
	
Inn1F103Text:
	text "ROOM 103"
	done
	
Inn1F104Text:
	text "ROOM 104"
	done
	
Inn1FWhiteboardText:
	text "A whiteboard."
	
	para "Someone has drawn"
	line "a cute picture"
	cont "themed after the"
	cont "current month."
	
	para "It's somehow way"
	line "more charming than"
	cont "any of the art in"
	cont "the halls."
	done
	
Inn1FStatueText:
	text "An oddly detailed"
	line "statue of a"
	cont "#MON you don't"
	cont "recognize."
	done
	
Inn1FPainting1Text:
	text "A painting of a"
	line "#MON you don't"
	cont "recognize."
	done
	
Inn1FPainting2Text:
	text "A boring landscape"
	line "painting."
	
	para "It's plain and"
	line "inoffensive."
	done
	
Inn1FLaptopText:
	text "Raw assembly code."
	
	para "Map and scripting"
	line "files."
	
	para "A seemingly never-"
	line "ending to-do list."
	
	para "…"
	
	para "Looks like someone"
	line "is making a game!"
	done
	
Inn1FWetFloorText:
	text "CAUTION."
	line "WET FLOOR."
	
	para "…<WAIT_M>The floor isn't"
	line "even wet…"
	done
	
	
Inn1FClerk:
	end
