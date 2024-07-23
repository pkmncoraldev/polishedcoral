Inn2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 17 ; warp events
	warp_event  1, 11, INN_1F, 3
	warp_event 22, 11, INN_1F, 4
	warp_event  0, 11, INN_3F, 1
	warp_event 21, 11, INN_3F, 2
	warp_event  3, 11, INN_2F, 9
	warp_event  7, 11, INN_2F, 11
	warp_event 15, 11, INN_2F, 13
	warp_event 19, 11, INN_2F, 15
	warp_event  0,  5, INN_2F, 5
	warp_event  1,  5, INN_2F, 5
	warp_event  6,  5, INN_2F, 6
	warp_event  7,  5, INN_2F, 6
	warp_event 18,  5, INN_2F, 7
	warp_event 19,  5, INN_2F, 7
	warp_event 24,  5, INN_2F, 8
	warp_event 25,  5, INN_2F, 8
	warp_event 11, 11, INN_ELEVATOR, 1

	db 0 ; coord events

	db 10 ; bg events
	signpost 11,  5, SIGNPOST_JUMPTEXT, Inn1FPainting1Text
	signpost 11, 17, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost 11, 18, SIGNPOST_JUMPTEXT, Inn2F201Text
	signpost 11, 14, SIGNPOST_JUMPTEXT, Inn2F202Text
	signpost 11,  8, SIGNPOST_JUMPTEXT, Inn2F203Text
	signpost 11,  4, SIGNPOST_JUMPTEXT, Inn2F204Text

	db 5 ; object events
	person_event SPRITE_INVISIBLE, 11,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_INVISIBLE, 11, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	
	
Inn2F201Text:
	text "ROOM 201"
	done
	
Inn2F202Text:
	text "ROOM 202"
	done
	
Inn2F203Text:
	text "ROOM 203"
	done
	
Inn2F204Text:
	text "ROOM 204"
	done
