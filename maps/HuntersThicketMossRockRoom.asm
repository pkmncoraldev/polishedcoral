HuntersThicketMossRockRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event -3, -1, SIGNPOST_JUMPTEXT, HuntersThicketMossRockText
	bg_event  5,  6, SIGNPOST_JUMPTEXT, HuntersThicketMossRockText
	bg_event -3, -1, SIGNPOST_JUMPTEXT, HuntersThicketMossRockText
	bg_event -3, -1, SIGNPOST_JUMPTEXT, HuntersThicketMossRockText

	db 0 ; object events
	
	
HuntersThicketMossRockText:
	text "A rather large,"
	line "moss-covered rock."
	
	para "It's cool to the"
	line "touch."
	done
