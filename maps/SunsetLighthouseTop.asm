SunsetLighthouseTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 17,  0, SUNSET_LIGHTHOUSE_ELEVATOR, 1
	warp_event 15,  3, SUNSET_LIGHTHOUSE_TOP, 3
	warp_event  6,  7, SUNSET_LIGHTHOUSE_TOP, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, AMPHAROS, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SunsetLighthouseTopAmpharos, -1
	person_event SPRITE_WEIRD_TREE,  3,  0, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	tmhmball_event  0,  1, TM_ZAP_CANNON, EVENT_SUNSET_LIGHTHOUSE_ZAP_CANNON


	SunsetLighthouseTopAmpharos:
	end