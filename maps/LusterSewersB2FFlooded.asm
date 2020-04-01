LusterSewersB2FFlooded_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersB2FFloodedTrigger0
	scene_script LusterSewersB2FFloodedTrigger1
	scene_script LusterSewersB2FFloodedTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, LusterSewersB2FChangeBlocks

	db 3 ; warp events
	warp_def  7, 14, 3, LUSTER_SEWERS_B1F_FLOODED
	warp_def  1, 15, 3, LUSTER_SEWERS_VALVE_ROOM
	warp_def  9, 27, 5, LUSTER_SEWERS_VALVE_ROOM

	db 8 ; coord events
	xy_trigger 0,  5, 13, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 15, 16, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 13, 29, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 17,  9, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 1,  3, 13, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 13, 16, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 11, 29, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 15,  9, 0, LusterSewersB2FOverBridge, 0, 0

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_PLANK_BRIDGE,  4, 15, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5, 15, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5, 15, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_PLANK_BRIDGE, 14, 16, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 16, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 16, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED

LusterSewersB2FFloodedTrigger0:
	end
	
LusterSewersB2FFloodedTrigger1:
	end
	
LusterSewersB2FFloodedTrigger2:
	end
	
LusterSewersB2FChangeBlocks:
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iffalse .endcallback
	changemap LusterSewersB2FEmpty_BlockData
	reloadmappart
	dotrigger $0
	return
.endcallback
	dotrigger $2
	return
	
LusterSewersB2FUnderBridge:
	changeblock $12, $12, $40
	changeblock $12, $14, $44
	changeblock $18, $12, $40
	changeblock $18, $14, $44
	callasm RefreshScreen_BridgeUpdate
	dotrigger $1
	end
	
LusterSewersB2FOverBridge:
	changeblock $12, $12, $1f
	changeblock $12, $14, $1e
	changeblock $18, $12, $1f
	changeblock $18, $14, $1e
	callasm RefreshScreen_BridgeUpdate
	dotrigger $0
	end