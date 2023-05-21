Route19_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 17, 29, ROUTE_19_GATE, 3
	warp_event 18, 29, ROUTE_19_GATE, 4

	db 0 ; coord events

	db 0 ; bg events
	
	db 0 ; object events
	