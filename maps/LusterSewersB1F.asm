LusterSewersB1F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersB1FTrigger0
	scene_script LusterSewersB1FTrigger1
	scene_script LusterSewersB1FTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, LusterSewersB1FChangeBlocks

	db 3 ; warp events
	warp_def  3,  8, 1, LUSTER_CITY_RESIDENTIAL
	warp_def 19,  3, 1, LUSTER_SEWERS_VALVE_ROOM
	warp_def  3, 25, 1, LUSTER_SEWERS_B2F
	
	db 6 ; coord events
	xy_trigger 0,  4,  5, 0, LusterSewersB1FUnderBridge, 0, 0
	xy_trigger 0, 18, 11, 0, LusterSewersB1FUnderBridge, 0, 0
	xy_trigger 0,  6, 25, 0, LusterSewersB1FUnderBridge, 0, 0
	xy_trigger 1,  3,  5, 0, LusterSewersB1FOverBridge, 0, 0
	xy_trigger 1, 17, 11, 0, LusterSewersB1FOverBridge, 0, 0
	xy_trigger 1,  5, 25, 0, LusterSewersB1FOverBridge, 0, 0

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_PLANK_BRIDGE, 14, 17, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 17, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 17, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED

LusterSewersB1FTrigger0:
	end
	
LusterSewersB1FTrigger1:
	end
	
LusterSewersB1FTrigger2:
	end
	
LusterSewersB1FChangeBlocks:
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iffalse .endcallback
	changemap LusterSewersB1FEmpty_BlockData
	reloadmappart
	dotrigger $0
	return
.endcallback
	dotrigger $2
	return
	
LusterSewersB1FUnderBridge:
	changeblock $6, $6, $40
	changeblock $6, $8, $44
	changeblock $c, $12, $40
	changeblock $c, $14, $44
	callasm RefreshScreen_BridgeUpdate
	dotrigger $1
	end
	
LusterSewersB1FOverBridge:
	changeblock $6, $6, $1f
	changeblock $6, $8, $1e
	changeblock $c, $12, $1f
	changeblock $c, $14, $1e
	callasm RefreshScreen_BridgeUpdate
	dotrigger $0
	end