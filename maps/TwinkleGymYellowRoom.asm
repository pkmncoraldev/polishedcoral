TwinkleGymYellowRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymYellowRoomTrigger0
	scene_script TwinkleGymYellowRoomTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 21,  6, 4, TWINKLE_GYM_ENTRY
	warp_def 21,  7, 4, TWINKLE_GYM_ENTRY

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

TwinkleGymYellowRoomTrigger0:
	end
	
TwinkleGymYellowRoomTrigger1:
	end
