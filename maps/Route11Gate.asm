Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route11GateCallback

	db 4 ; warp events
	warp_event  3,  0, LUSTER_CITY_RESIDENTIAL, 10
	warp_event  4,  0, LUSTER_CITY_RESIDENTIAL, 11
	warp_event  3,  7, ROUTE_11, 1
	warp_event  4,  7, ROUTE_11, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_OFFICER, 7, 3, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11GateEndDemoNPC, -1
	person_event SPRITE_OFFICER, 7, 4, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11GateEndDemoNPC, -1

	const_def 1 ; object constants
	const ROUTE_11_GATE_END_DEMO_NPC1
	const ROUTE_11_GATE_END_DEMO_NPC2

Route11GateCallback:
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	return
	
Route11GateEndDemoNPC:
	faceplayer
	opentext
	writetext Route11GateEndDemoNPCText
	waitbutton
	closetext
	spriteface ROUTE_11_GATE_END_DEMO_NPC1, UP
	spriteface ROUTE_11_GATE_END_DEMO_NPC2, UP
	end
	
Route11GateEndDemoNPCText:
	text "Sorry…"
	
	para "This area isn't"
	line "available in the"
	cont "demo!"
	
	para "Come back in the"
	line "full release!"
	done