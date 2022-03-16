DaybreakGrotto3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  5,  5, DAYBREAK_GROTTO_2, 3
	warp_event  5,  3, DAYBREAK_GROTTO_3, 3
	warp_event  3, 15, DAYBREAK_GROTTO_3, 2
	warp_event  7, 37, SUNSET_CAPE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
