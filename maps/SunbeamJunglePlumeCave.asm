SunbeamJunglePlumeCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 13,  3, 8, SUNBEAM_JUNGLE

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_MISC_OVERHEAD, -2, -2, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 5, 10, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 6, 6, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 13, 3, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 15, 6, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	tmhmball_event 13,  9, TM_GIGA_DRAIN, EVENT_SUNBEAM_JUNGLE_PLUME_CAVE_GIGA_DRAIN
