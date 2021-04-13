SunbeamJungleCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  4, 3, SUNBEAM_JUNGLE
	warp_def  5, 14, 1, SUNBEAM_JUNGLE_DEEP

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	tmhmball_event  3, 6, TM_THUNDERPUNCH, EVENT_SUNBEAM_JUNGLE_CAVE_THUNDERPUNCH

	const_def 1 ; object constants
	const SUNBEAM_JUNGLE_CAVE_POKEBALL
