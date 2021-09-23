ShimmerPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, SHIMMER_CITY, 22
	warp_event  5,  7, SHIMMER_CITY, 22

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
