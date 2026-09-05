TempestIslet_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  4, 26, ROUTE_33_UNDERWATER, 5
	warp_event  5, 26, ROUTE_33_UNDERWATER, 6
	warp_event  4, 27, ROUTE_33_UNDERWATER, 7
	warp_event  5, 27, ROUTE_33_UNDERWATER, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 20, SIGNPOST_JUMPTEXT, TempestIslet_SignText

	db 0 ; object events

TempestIslet_SignText:
	text "TEMPEST ISLET"
	done