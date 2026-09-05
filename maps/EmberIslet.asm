EmberIslet_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event 16, 22, ROUTE_33_UNDERWATER, 9
	warp_event 17, 22, ROUTE_33_UNDERWATER, 10
	warp_event 16, 23, ROUTE_33_UNDERWATER, 11
	warp_event 17, 23, ROUTE_33_UNDERWATER, 12

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 20, SIGNPOST_JUMPTEXT, EmberIslet_SignText

	db 0 ; object events
	
EmberIslet_SignText:
	text "EMBER ISLET"
	done
