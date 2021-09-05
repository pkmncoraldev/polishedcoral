NettBuilding2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  2, 11, NETT_BUILDING_ELEVATOR, 1
	warp_event  9, 11, ROUTE_1, 1
	warp_event  5,  1, NETT_BUILDING_OFFICE, 1
	warp_event  6,  1, NETT_BUILDING_OFFICE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
