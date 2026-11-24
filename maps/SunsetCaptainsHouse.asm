SunsetCaptainsHouse_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SunsetCaptainsHouseTrigger0
	scene_script SunsetCaptainsHouseTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, SUNSET_BAY, 4
	warp_event  3,  7, SUNSET_BAY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, SIGNPOST_JUMPSTD, radio2

	db 0 ; object events
	
SunsetCaptainsHouseTrigger0:
	end
	
SunsetCaptainsHouseTrigger1:
	end

