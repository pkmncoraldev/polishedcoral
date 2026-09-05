Route33_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 12 ; warp events
	warp_event 36, 18, ROUTE_33_UNDERWATER, 13
	warp_event 37, 18, ROUTE_33_UNDERWATER, 14
	warp_event 36, 19, ROUTE_33_UNDERWATER, 15
	warp_event 37, 19, ROUTE_33_UNDERWATER, 16
	warp_event  2, 28, ROUTE_33_UNDERWATER, 17
	warp_event  3, 28, ROUTE_33_UNDERWATER, 18
	warp_event  2, 29, ROUTE_33_UNDERWATER, 19
	warp_event  3, 29, ROUTE_33_UNDERWATER, 20
	warp_event 14, 36, ROUTE_33_UNDERWATER, 21
	warp_event 15, 36, ROUTE_33_UNDERWATER, 22
	warp_event 14, 37, ROUTE_33_UNDERWATER, 23
	warp_event 15, 37, ROUTE_33_UNDERWATER, 24

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
