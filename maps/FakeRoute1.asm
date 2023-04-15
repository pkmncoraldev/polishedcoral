FakeRoute1_MapScriptHeader:
FakeRoute2_MapScriptHeader:
	db 2 ; scene scripts
	scene_script FakeRoute1Trigger0
	scene_script FakeRoute1Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, FakeRoute1Callback

	db 0 ; warp events

	db 4 ; coord events
	coord_event 18, 24, 0, FakeRoute1ChangeBlocks
	coord_event 19, 24, 0, FakeRoute1ChangeBlocks
	coord_event 20, 24, 0, FakeRoute1ChangeBlocks
	coord_event 21, 24, 0, FakeRoute1ChangeBlocks

	db 5 ; bg events
	signpost 30, 19, SIGNPOST_IFNOTSET, FakeRoute1DoorSign
	signpost 30, 20, SIGNPOST_IFNOTSET, FakeRoute1DoorSign
	signpost 26, 21, SIGNPOST_JUMPTEXT, FakeRoute1SignText
	signpost 11, 22, SIGNPOST_JUMPTEXT, FakeRoute1DoorSignText
	signpost 17, 15, SIGNPOST_JUMPTEXT, FakeRoute1DoorSignText

	db 0 ; object events


FakeRoute1Trigger0:
	end
	
FakeRoute1Trigger1:
	end
	
FakeRoute1Callback:
	checkscene
	ifequal $0, .end
	ifequal $1, FakeRoute1ChangeBlocks
.end
	return
	
FakeRoute1ChangeBlocks:
	changeblock $12, $1c, $a0
	changeblock $14, $1c, $a0
	changeblock $12, $1e, $a0
	changeblock $14, $1e, $a0
	changeblock $10, $20, $89
	changeblock $12, $20, $92
	changeblock $14, $20, $a0
	setevent EVENT_FAKE_ROUTE_1_CHANGE_BLOCKS
	dotrigger $1
	end
	
FakeRoute1SignText:
	text "ROUTE 1"
	
	para "NORTH:"
	line "ROUTE 1"
	
	para "SOUTH:"
	line "ROUTE 1"
	done
	
FakeRoute1DoorSign:
	dw EVENT_FAKE_ROUTE_1_CHANGE_BLOCKS
	jumptext FakeRoute1DoorSignText
	
	
FakeRoute1DoorSignText:
	text "Blocked…"
	
	para "Better keep"
	line "moving…"
	done
