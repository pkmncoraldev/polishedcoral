Route3Starglow_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 5, 6, 2, STARGLOW_CAVERN_1F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 7, 6, SIGNPOST_JUMPTEXT, Route3SignText

	db 0 ; object events
	
Route3SignText:
	text "STARGLOW CAVERN"
	
	para "SOUTH:"
	line "STARGLOW VALLEY"
	done