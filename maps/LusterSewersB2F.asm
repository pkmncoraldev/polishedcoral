LusterSewersB2F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersB2FTrigger0
	scene_script LusterSewersB2FTrigger1
	scene_script LusterSewersB2FTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, LusterSewersB2FChangeBlocks

	db 4 ; warp events
	warp_def  7, 14, 3, LUSTER_SEWERS_B1F
	warp_def  1, 15, 3, LUSTER_SEWERS_VALVE_ROOM
	warp_def 15, 16, 5, LUSTER_SEWERS_B1F
	warp_def 13,  9, 1, LUSTER_SEWERS_THRONE_ROOM
	

	db 8 ; coord events
	xy_trigger 0,  5, 13, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 13, 17, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 11, 29, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 17,  9, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 1,  3, 13, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 11, 17, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1,  9, 29, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 15,  9, 0, LusterSewersB2FOverBridge, 0, 0

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_PLANK_BRIDGE,  4, 15, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5, 15, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5, 15, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_PLANK_BRIDGE,  0,  0, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  1,  0, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  1,  0, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED

LusterSewersB2FTrigger0:
	end
	
LusterSewersB2FTrigger1:
	end
	
LusterSewersB2FTrigger2:
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
	changeblock $12, $10, $40
	changeblock $12, $12, $44
	changeblock $18, $10, $40
	changeblock $18, $12, $44
	callasm RefreshScreen_BridgeUpdate
	dotrigger $1
	end
	
LusterSewersB2FOverBridge:
	changeblock $12, $10, $1f
	changeblock $12, $12, $1e
	changeblock $18, $10, $1f
	changeblock $18, $12, $1e
	callasm RefreshScreen_BridgeUpdate
	dotrigger $0
	end