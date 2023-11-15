Route19DuskGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 4, 0, 1, ROUTE_19
	warp_def 5, 0, 2, ROUTE_19
	warp_def 4, 9, 1, DUSK_TURNPIKE
	warp_def 5, 9, 2, DUSK_TURNPIKE

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	