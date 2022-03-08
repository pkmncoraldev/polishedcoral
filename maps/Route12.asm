Route12_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	person_event SPRITE_ENGINEER, 22, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12NPC1, -1
	person_event SPRITE_ENGINEER, 27, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ENGINEER, 27, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ENGINEER, 20, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route12NPC2, -1
	object_event 10, 28, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19, 30, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 21, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC, 25, 13, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC, 25, 15, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event 21, 27, SUPER_REPEL, 1, EVENT_ROUTE_12_POKE_BALL

	
Route12NPC1:
	end
	
Route12NPC2:
	end