FakeNorthSouthGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, FAKE_ROUTE_1, 2
	warp_event  4,  0, FAKE_ROUTE_1, 2
	warp_event  3,  7, FAKE_SUNSET_CAPE, 1
	warp_event  4,  7, FAKE_SUNSET_CAPE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_SILVER, PERSONTYPE_SCRIPT, 0, FakeNorthSouthGateNPC1, -1
	
FakeNorthSouthGateNPC1:
	jumptextfaceplayer FakeNorthSouthGateNPC1Text
	
FakeNorthSouthGateNPC1Text:
	text "GOOD LUCK ON"
	line "YOUR JOURNEY."
	done
