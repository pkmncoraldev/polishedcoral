FlickerMossRockRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  7,  5, 1, FLICKER_TRAIN_GRAVEYARD

	db 0 ; coord events

	db 4 ; bg events
	bg_event -3, -3, SIGNPOST_JUMPTEXT, FlickerMossRockText
	bg_event  5,  4, SIGNPOST_JUMPTEXT, FlickerMossRockText
	bg_event -3, -3, SIGNPOST_JUMPTEXT, FlickerMossRockText
	bg_event -3, -3, SIGNPOST_JUMPTEXT, FlickerMossRockText

	db 0 ; object events
	
	
FlickerMossRockText:
	text "A rather large,"
	line "moss-covered rock."
	
	para "It's cool to the"
	line "touch."
	done
