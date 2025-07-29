Route11_2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  3, 23, 3, ROUTE_11_GATE

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_COOLTRAINER_M,  9, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_1_2, -1
	person_event SPRITE_COOLTRAINER_F, 18, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_2_2, -1
	person_event SPRITE_ENGINEER, 21, 11, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11NPC2, -1
	object_event 10, 21, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11Machoke, -1
	itemball_event 20, 17, MAX_REPEL, 1, EVENT_ROUTE_11_POKE_BALL_1
	tapeball_event 21, 27, MUSIC_GENTLEMAN_ENCOUNTER, 2, EVENT_MUSIC_GENTLEMAN_ENCOUNTER
