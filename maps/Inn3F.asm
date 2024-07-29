Inn3F_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Inn3FTrigger0

	db 0 ; callbacks

	db 23 ; warp events
	warp_event  0, 11, INN_2F, 3
	warp_event -1, -1, INN_2F, 4
	warp_event 28, 13, INN_3F, 17
	warp_event 29, 13, INN_3F, 17
	warp_event  3, 11, INN_3F, 9
	warp_event  7, 11, INN_3F, 11
	warp_event 15, 11, INN_3F, 13
	warp_event 19, 11, INN_3F, 15
	warp_event  1,  5, INN_3F, 5
	warp_event  0,  5, INN_3F, 5
	warp_event  7,  5, INN_3F, 6
	warp_event  6,  5, INN_3F, 6
	warp_event 18,  5, INN_3F, 7
	warp_event 19,  5, INN_3F, 7
	warp_event 24,  5, INN_3F, 8
	warp_event 25,  5, INN_3F, 8
	warp_event 21, 11, INN_3F, 3
	warp_event 11, 11, INN_ELEVATOR, 1
	warp_event  0,  2, ROUTE_1, 1
	warp_event  6,  2, ROUTE_1, 1
	warp_event 16,  2, ROUTE_1, 1
	warp_event 22,  2, ROUTE_1, 1
	warp_event 31, 11, INN_VENT, 5

	db 0 ; coord events

	db 18 ; bg events
	signpost 11,  5, SIGNPOST_JUMPTEXT, Inn1FPainting1Text
	signpost 11, 17, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost 11, 18, SIGNPOST_JUMPTEXT, Inn3F301Text
	signpost 11, 14, SIGNPOST_JUMPTEXT, Inn3F302Text
	signpost 11,  8, SIGNPOST_JUMPTEXT, Inn3F303Text
	signpost 11,  4, SIGNPOST_JUMPTEXT, Inn3F304Text
	signpost 13, 30, SIGNPOST_JUMPTEXT, Inn3FWetFloorText
	signpost 11, 29, SIGNPOST_JUMPTEXT, Inn3FShelfText
	signpost 11, 28, SIGNPOST_JUMPTEXT, Inn3FShelfText
	signpost 11, 20, SIGNPOST_JUMPTEXT, Inn3FMaintenanceText
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text

	db 7 ; object events
	person_event SPRITE_FAT_GUY, -1, -1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, EVENT_ALWAYS_SET
	person_event SPRITE_INVISIBLE, 11,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_INVISIBLE, 11, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	
	const_def 1 ; object constants
	const INN_3F_CLERK
	const INN_3F_DOOR_LOCK_1
	const INN_3F_DOOR_LOCK_2
	const INN_3F_DOOR_LOCK_3
	const INN_3F_DOOR_LOCK_4
	const INN_3F_DOOR_LOCK_5
	const INN_3F_DOOR_LOCK_6
	
	
Inn3FTrigger0:
	callasm Inn1FRunningInTheHallsASM
	ifnotequal 0, .running
	end
.running
	disappear INN_3F_CLERK
	callasm Inn3FMoveClerkAsm
	ifequal 2, .right
	appear INN_3F_CLERK
	special Special_StopRunning
	applyonemovement INN_3F_CLERK, big_step_left
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_3F_CLERK, slow_step_right
	disappear INN_3F_CLERK
	callasm Inn1FResertScriptVar
	end
.right
	appear INN_3F_CLERK
	special Special_StopRunning
	applyonemovement INN_3F_CLERK, big_step_right
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_3F_CLERK, slow_step_left
	disappear INN_3F_CLERK
	callasm Inn1FResertScriptVar
	end
	
Inn3FMoveClerkAsm:
	ld a, [wXCoord]
	cp $0b
	jr nc, .right
	ld a, 1
	ld [wScriptVar], a
	ld a, INN_3F_CLERK
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
	ld a, INN_3F_CLERK
	ld b, a
	ld a, [wXCoord]
	sub 5
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
Inn3FMaintenanceText:
	text "MAINTENANCE"
	done
	
Inn3F301Text:
	text "ROOM 301"
	done
	
Inn3F302Text:
	text "ROOM 302"
	done
	
Inn3F303Text:
	text "ROOM 303"
	done
	
Inn3F304Text:
	text "ROOM 304"
	done
	
Inn3FWetFloorText:
	text "CAUTION."
	line "WET FLOOR."
	done
	
Inn3FShelfText:
	text "Tools, cans of"
	line "paint, and other"
	cont "random junk."
	done
