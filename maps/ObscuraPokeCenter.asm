ObscuraPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 6, OBSCURA_CITY
	warp_def 7, 6, 6, OBSCURA_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
