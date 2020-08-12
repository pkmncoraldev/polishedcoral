LusterPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 3, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 4, 3, LUSTER_CITY_RESIDENTIAL

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	pc_nurse_event  4, 1
