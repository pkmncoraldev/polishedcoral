Route26_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 2 ; warp events
	warp_def 15, 10, 1, KOMORE_COMMUNITY_CENTER
	warp_def 15, 11, 2, KOMORE_COMMUNITY_CENTER

	db 0 ; coord events

	db 1 ; bg events
	signpost 16,  9, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign

	db 2 ; object events
	object_event -2, 28, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -2, 28, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
