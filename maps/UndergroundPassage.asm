UndergroundPassage_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, UndergroundPassageChangeBlocks

	db 4; warp events
	warp_event 31,  2, DAYBREAK_GROTTO_3, 7
	warp_event 25,  3, UNDERGROUND_PASSAGE, 3
	warp_event  9,  7, UNDERGROUND_PASSAGE, 2
	warp_event 29, 43, SEASIDE_CAVE_B1F, 4

	db 2 ; coord events
	xy_trigger 1, 22, 30, 0, UndergroundPassageUnderBridge, 0, 0
	xy_trigger 0, 20, 30, 0, UndergroundPassageOverBridge, 0, 0

	db 0 ; bg events

	db 0 ; object events


UndergroundPassageChangeBlocks:
	checkscene
	ifequal $1, .end
	ifequal $0, .changeblocks
	dotrigger $0
.end
	return
.changeblocks
	changeblock $1e, $e, $fc
	changeblock $1e, $10, $fd
	return
	
UndergroundPassageUnderBridge:
	changeblock $1e, $e, $fc
	changeblock $1e, $10, $fd
	callasm GenericFinishBridge
	dotrigger $0
	end
	
UndergroundPassageOverBridge:
	changeblock $1e, $e, $f8
	changeblock $1e, $10, $f9
	callasm GenericFinishBridge
	dotrigger $1
	end