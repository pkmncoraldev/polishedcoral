IceCaveB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 25, 25, 4, ICE_CAVE_B1F
	warp_def  3,  9, 2, ICE_CAVE_B1F
	warp_def 14,  4, 1, ICE_CAVE_B3F

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
