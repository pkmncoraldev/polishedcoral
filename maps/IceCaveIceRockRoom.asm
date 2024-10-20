IceCaveIceRockRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  1,  4, 5, ROUTE_10

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4,  4, SIGNPOST_JUMPTEXT, IceCaveIceRockText
	bg_event  5,  4, SIGNPOST_JUMPTEXT, IceCaveIceRockText
	bg_event  4,  5, SIGNPOST_JUMPTEXT, IceCaveIceRockText
	bg_event  5,  5, SIGNPOST_JUMPTEXT, IceCaveIceRockText

	db 0 ; object events
	
	
IceCaveIceRockText:
	text "A rather large,"
	line "ice-covered rock."
	
	para "It's freezing cold!"
	done
