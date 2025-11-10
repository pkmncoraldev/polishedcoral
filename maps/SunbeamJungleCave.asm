SunbeamJungleCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17,  4, 3, SUNBEAM_JUNGLE
	warp_def  3, 16, 1, SUNBEAM_JUNGLE_DEEP

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	itemball_event 10,  8, ULTRA_BALL, 1, EVENT_SUNBEAM_CAVE_ITEM
