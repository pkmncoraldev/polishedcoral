IceCaveB3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 13, 25, 3, ICE_CAVE_B2F
	warp_def  3, 25, 1, ICE_CAVE_B4F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	itemball_event 10, 13, ULTRA_BALL, 1, EVENT_ICE_CAVE_ULTRA_BALL
