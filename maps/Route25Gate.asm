Route25Gate_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route25GateTrigger0
	scene_script Route25GateTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route25GateCallback

	db 4 ; warp events
	warp_event  3,  0, ROUTE_27, 1
	warp_event  4,  0, ROUTE_27, 2
	warp_event  3,  7, BRIGHTBURG, 8
	warp_event  4,  7, BRIGHTBURG, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	
	
Route25GateCallback:
	setevent EVENT_SET_ROUTE_27
	clearevent EVENT_ON_ROUTE_27
	return
	
Route25GateTrigger0:
	end
	
Route25GateTrigger1:
	disappear 1
	dotrigger $0
	end