DaybreakGrotto3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  5,  5, DAYBREAK_GROTTO_1, 3
	warp_event  5,  3, DAYBREAK_GROTTO_3, 3
	warp_event  3, 15, DAYBREAK_GROTTO_3, 2
	warp_event  7, 37, SUNSET_CAPE, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  6, 14, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText
	bg_event  6, 15, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText
	bg_event  6, 31, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText
	bg_event  7, 31, SIGNPOST_JUMPTEXT, DaybreakGrotto3CurrentText

	db 0 ; object events


DaybreakGrotto3CurrentText:
	text "The current here"
	line "is super fast!"
	done