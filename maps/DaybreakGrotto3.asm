DaybreakGrotto3_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DaybreakGrotto3Callback

	db 8 ; warp events
	warp_event 13,  5, DAYBREAK_GROTTO_1, 3
	warp_event 13,  3, DAYBREAK_GROTTO_3, 3
	warp_event  9, 15, DAYBREAK_GROTTO_3, 2
	warp_event 13, 37, SUNSET_CAPE, 3
	warp_event  3,  4, DAYBREAK_GROTTO_3, 6
	warp_event  5, 55, DAYBREAK_GROTTO_3, 5
	warp_event  5,  1, CONNECTING_CAVERN, 1
	warp_event  3, 49, SUNSET_LIGHTHOUSE_BASEMENT, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12, 14, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText
	bg_event 12, 15, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText
	bg_event 12, 31, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText
	bg_event 13, 31, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText

	db 0 ; object events

DaybreakGrotto3Callback:
	clearevent EVENT_CAPE_LIGHTHOUSE_COLORS
	domaptrigger SUNSET_CAPE, $0
	return

DaybreakGrotto3CurrentText:
	text "The current here"
	line "is super fast!"
	done