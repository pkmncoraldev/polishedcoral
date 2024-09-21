ObscuraMuseum1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_def 13,  8, 1, OBSCURA_CITY
	warp_def 13,  9, 2, OBSCURA_CITY
	warp_def  9, 24, 3, OBSCURA_CITY
	warp_def 10, 24, 4, OBSCURA_CITY
	warp_def  0,  4, 1, OBSCURA_MUSEUM_2F

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
