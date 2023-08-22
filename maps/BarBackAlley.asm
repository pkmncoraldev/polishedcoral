BarBackAlley_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 6 ; warp events
	warp_event  4,  5, DUSK_TURNPIKE, 16
	warp_event  4,  6, DUSK_TURNPIKE, 16
	warp_event  4,  7, DUSK_TURNPIKE, 16
	warp_event 13,  5, DUSK_TURNPIKE, 17
	warp_event 13,  6, DUSK_TURNPIKE, 17
	warp_event 13,  7, DUSK_TURNPIKE, 17

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
