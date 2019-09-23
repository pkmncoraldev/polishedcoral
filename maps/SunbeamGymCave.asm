SunbeamGymCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  5,  3, 3, SUNBEAM_GYM

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	itemball_event  3,  2, RARE_CANDY, 1, EVENT_SUNBEAM_GYM_CAVE_POKEBALL

	const_def 1 ; object constants
	const SUNBEAM_GYM_CAVE_POKEBALL
