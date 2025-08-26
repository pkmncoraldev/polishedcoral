OldManorExterior_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 9, 14, 1, SPOOKHOUSE_LIVING_ROOM
	warp_def 9, 15, 2, SPOOKHOUSE_LIVING_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	tapeball_event  3,  4, MUSIC_EVENTIDE, 1, EVENT_MUSIC_EVENTIDE
	person_event SPRITE_INVISIBLE,  9, 14, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, OldManorExteriorLockedDoor, EVENT_SPOOKHOUSE_NOT_LOCKED
	person_event SPRITE_INVISIBLE,  9, 15, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, OldManorExteriorLockedDoor, EVENT_SPOOKHOUSE_NOT_LOCKED
	itemball_event 14, 11, CLEANSE_TAG, 1, EVENT_CLEANSE_TAG_GONE
	
OldManorExteriorLockedDoor:
	jumptext OldManorExteriorLockedDoorText
	
OldManorExteriorLockedDoorText:
	text "It's locked tight."
	
	para "It looks like it"
	line "hasn't been opened"
	cont "in years…"
	done
