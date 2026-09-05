BorealIslet_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event 10, 26, ROUTE_33_UNDERWATER, 1
	warp_event 11, 26, ROUTE_33_UNDERWATER, 2
	warp_event 10, 27, ROUTE_33_UNDERWATER, 3
	warp_event 11, 27, ROUTE_33_UNDERWATER, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 20, SIGNPOST_JUMPTEXT, BorealIslet_SignText

	db 0 ; object events

BorealIslet_SignText:
	text "BOREAL ISLET"
	done