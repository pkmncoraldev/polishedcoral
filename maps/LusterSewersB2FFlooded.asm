LusterSewersB2FFlooded_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersB2FFloodedTrigger0
	scene_script LusterSewersB2FFloodedTrigger1
	scene_script LusterSewersB2FFloodedTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, LusterSewersB2FChangeBlocks

	db 3 ; warp events
	warp_def  7,  4, 3, LUSTER_SEWERS_B1F_FLOODED
	warp_def  1,  5, 1, LUSTER_SEWERS_VALVE_ROOM_2
	warp_def  9, 17, 1, LUSTER_SEWERS_VALVE_ROOM_3

	db 8 ; coord events
	xy_trigger 0,  5,  3, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 15,  6, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 13, 19, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 17,  1, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 1,  3,  3, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 13,  6, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 11, 19, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 15,  1, 0, LusterSewersB2FOverBridge, 0, 0

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_PLANK_BRIDGE,  4,  5, SPRITEMOVEDATA_BRIDGE_BOB, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5,  5, SPRITEMOVEDATA_TILE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_PLANK_BRIDGE, 14,  6, SPRITEMOVEDATA_BRIDGE_BOB, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15,  6, SPRITEMOVEDATA_TILE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1

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
	changeblock $8, $12, $40
	changeblock $8, $14, $44
	changeblock $e, $12, $40
	changeblock $e, $14, $44
	callasm RefreshScreen_BridgeUpdate
	dotrigger $1
	end
	
LusterSewersB2FOverBridge:
	changeblock $8, $12, $1f
	changeblock $8, $14, $1e
	changeblock $e, $12, $1f
	changeblock $e, $14, $1e
	callasm RefreshScreen_BridgeUpdate
	dotrigger $0
	end