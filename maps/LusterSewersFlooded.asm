LusterSewersFlooded_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterSewersFloodedTrigger0
	scene_script LusterSewersFloodedTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, LusterSewersChangeBlocks

	db 2 ; warp events
	warp_def  3,  8, 3, LUSTER_CITY_RESIDENTIAL
	warp_def 19,  3, 1, LUSTER_SEWERS_VALVE_ROOM
	
	db 6 ; coord events
	xy_trigger 0,  4,  5, 0, LusterSewersUnderBridge, 0, 0
	xy_trigger 0, 18, 11, 0, LusterSewersUnderBridge, 0, 0
	xy_trigger 0,  6, 25, 0, LusterSewersUnderBridge, 0, 0
	xy_trigger 1,  3,  5, 0, LusterSewersOverBridge, 0, 0
	xy_trigger 1, 17, 11, 0, LusterSewersOverBridge, 0, 0
	xy_trigger 1,  5, 25, 0, LusterSewersOverBridge, 0, 0

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_PLANK_BRIDGE, 14, 17, SPRITEMOVEDATA_BRIDGE_BOB, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 17, SPRITEMOVEDATA_TILE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1

LusterSewersFloodedTrigger0:
	end
	
LusterSewersFloodedTrigger1:
	end
	
LusterSewersChangeBlocks:
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iffalse .endcallback
	changemap LusterSewersEmpty_BlockData
	reloadmappart
.endcallback
	return
	
LusterSewersUnderBridge:
	changeblock $6, $6, $40
	changeblock $8, $6, $41
	changeblock $6, $8, $44
	changeblock $8, $8, $45
	changeblock $c, $12, $40
	changeblock $e, $12, $43
	changeblock $c, $14, $44
	changeblock $e, $14, $47
	callasm RefreshScreen_BridgeUpdate
	dotrigger $1
	end
	
LusterSewersOverBridge:
	changeblock $6, $6, $1f
	changeblock $8, $6, $22
	changeblock $6, $8, $1e
	changeblock $8, $8, $2b
	changeblock $c, $12, $1f
	changeblock $e, $12, $30
	changeblock $c, $14, $1e
	changeblock $e, $14, $5f
	callasm RefreshScreen_BridgeUpdate
	dotrigger $0
	end