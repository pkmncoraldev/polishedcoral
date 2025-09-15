LusterSkyscraperB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 14,  0, LUSTER_SKYSCRAPER_ELEVATOR, 1
	warp_event  4,  1, LUSTER_SKYSCRAPER_PORYGON_ROOM, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost  1,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperB1FDoorText
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterSkyscraperB1FDoorText

	db 1 ; object events
	person_event SPRITE_INVISIBLE,  1, 10, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterSkyscraperB1FDoor, -1


LusterSkyscraperB1FDoor:
	jumptext LusterSkyscraperB1FDoorText

LusterSkyscraperB1FDoorText:
	text "It's locked…"
	done