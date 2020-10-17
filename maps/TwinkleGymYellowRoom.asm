TwinkleGymYellowRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymYellowRoomTrigger0
	scene_script TwinkleGymYellowRoomTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 19, 16, 4, TWINKLE_GYM_ENTRY
	warp_def 19, 17, 4, TWINKLE_GYM_ENTRY

	db 6 ; coord events
	xy_trigger 0, 10, 16, 0, TwinkleGymYellowRoomInPool, 0, 0
	xy_trigger 0, 10, 17, 0, TwinkleGymYellowRoomInPool, 0, 0
	xy_trigger 0,  7, 13, 0, TwinkleGymYellowRoomInPool, 0, 0
	xy_trigger 1, 11, 16, 0, TwinkleGymYellowRoomOutPool, 0, 0
	xy_trigger 1, 11, 17, 0, TwinkleGymYellowRoomOutPool, 0, 0
	xy_trigger 1,  6, 13, 0, TwinkleGymYellowRoomOutPool, 0, 0

	db 0 ; bg events

	db 0 ; object events

TwinkleGymYellowRoomTrigger0:
	end
	
TwinkleGymYellowRoomTrigger1:
	end
	
	
TwinkleGymYellowRoomInPool:
	changeblock $c, $a, $64
	changeblock $e, $a, $65
	changeblock $12, $a, $66
	changeblock $a, $8, $6c
	changeblock $c, $8, $5c
	changeblock $12, $8, $6d
	callasm RefreshScreen_BridgeUpdate
	dotrigger $1
	end
	
TwinkleGymYellowRoomOutPool:
	changeblock $c, $a, $60
	changeblock $e, $a, $5a
	changeblock $12, $a, $62
	changeblock $a, $8, $6a
	changeblock $c, $8, $76
	changeblock $12, $8, $5e
	callasm RefreshScreen_BridgeUpdate
	dotrigger $0
	end