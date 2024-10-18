CoralReef_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route14_15UnderwaterCallback

	db 4 ; warp events
	warp_event  6, 32, ROUTE_15, 44
	warp_event  7, 32, ROUTE_15, 45
	warp_event  6, 33, ROUTE_15, 46
	warp_event  7, 33, ROUTE_15, 47

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	itemball_event 40, 10, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_1
	itemball_event 19, 31, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_2
	itemball_event 58, 28, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_3
	itemball_event 40, 29, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_4
	itemball_event 62, 16, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_5
	itemball_event 30, 22, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_6
	itemball_event 31,  5, CORAL_SHARD, 1, EVENT_CORAL_REEF_CORAL_SHARD_7
