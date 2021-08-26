NettBuildingStairwell_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  4,  9, NETT_BUILDING_1F, 3
	warp_event  5,  9, NETT_BUILDING_1F, 3
	warp_event  1,  7, ROUTE_1, 1
	warp_event  2,  7, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
