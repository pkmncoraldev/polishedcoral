Inn3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 18 ; warp events
	warp_event  0, 11, INN_2F, 3
	warp_event 21, 11, INN_2F, 4
	warp_event 30, 13, INN_3F, 17
	warp_event 31, 13, INN_3F, 17
	warp_event  3, 11, INN_3F, 9
	warp_event  7, 11, INN_3F, 11
	warp_event 15, 11, INN_3F, 13
	warp_event 19, 11, INN_3F, 15
	warp_event  0,  5, INN_3F, 5
	warp_event  1,  5, INN_3F, 5
	warp_event  6,  5, INN_3F, 6
	warp_event  7,  5, INN_3F, 6
	warp_event 18,  5, INN_3F, 7
	warp_event 19,  5, INN_3F, 7
	warp_event 24,  5, INN_3F, 8
	warp_event 25,  5, INN_3F, 8
	warp_event 23, 11, INN_3F, 3
	warp_event 11, 11, INN_ELEVATOR, 1

	db 0 ; coord events

	db 14 ; bg events
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
	signpost 13, 32, SIGNPOST_JUMPTEXT, Inn3FWetFloorText
	signpost 11, 31, SIGNPOST_JUMPTEXT, Inn3FShelfText
	signpost 11, 30, SIGNPOST_JUMPTEXT, Inn3FShelfText
	signpost 11, 22, SIGNPOST_JUMPTEXT, Inn3FMaintenanceText

	db 5 ; object events
	person_event SPRITE_INVISIBLE, 11,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_INVISIBLE, 11, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	
	
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
