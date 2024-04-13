Route25South_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 39, 33, ROUTE_25_GATE, 1
	warp_event 40, 33, ROUTE_25_GATE, 2

	db 0 ; coord events

	db 12 ; bg events
	signpost 17, 18, SIGNPOST_READ, Route25SouthLogs
	signpost 17, 19, SIGNPOST_READ, Route25SouthLogs
	signpost 22, 19, SIGNPOST_READ, Route25SouthLogs
	signpost 22, 21, SIGNPOST_READ, Route25SouthLogs
	signpost 23, 32, SIGNPOST_READ, Route25SouthLogs
	signpost 23, 33, SIGNPOST_READ, Route25SouthLogs
	signpost 28, 31, SIGNPOST_READ, Route25SouthLogs
	signpost 19, 46, SIGNPOST_READ, Route25SouthLogs
	signpost 19, 47, SIGNPOST_READ, Route25SouthLogs
	signpost 24, 45, SIGNPOST_READ, Route25SouthLogs
	signpost 24, 47, SIGNPOST_READ, Route25SouthLogs
	signpost 30, 41, SIGNPOST_READ, Route25SouthBrightburgSign

	db 4 ; object events
	person_event SPRITE_LEILANI_CHAIR_2, 12,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 23, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 22, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 25, 43, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
;	person_event SPRITE_LEILANI_CHAIR_2, 12,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSignGuy, -1


Route25SouthLogs:
	jumptext Route25SouthLogsText
	
Route25SouthLogsText:
	text "Some lumber is"
	line "stacked neatly."
	done

Route25SouthBrightburgSign:
	jumptext Route25SouthBrightburgSignText

Route25SouthBrightburgSignText:
	text "ROUTE 25"
	
	para "SOUTH:"
	line "BRIGHTBURG"
	done

BrightCondosSign:
	jumptext BrightCondosSignText
	
BrightCondosSignText:
	text "Coming soon:"
	line "BRIGHTBURG CONDOS"
	
	para "…"
	
	para "A big red “X”"
	line "covers the sign."
	done
	