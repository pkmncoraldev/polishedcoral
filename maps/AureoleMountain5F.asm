AureoleMountain5F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AureoleMountain5FCallback

	db 4 ; warp events
	warp_def 27,  7, 2, AUREOLE_MOUNTAIN_4F
	warp_def  9, 15, 3, AUREOLE_MOUNTAIN_5F
	warp_def 29, 25, 2, AUREOLE_MOUNTAIN_5F
	warp_def 31, 27, 3, AUREOLE_MOUNTAIN_OUTSIDE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 16, SIGNPOST_ITEM + STAR_PIECE, EVENT_AUREOLE_MOUNTAIN_5F_HIDDEN_ITEM

	db 0 ; object events


AureoleMountain5FCallback:
	domaptrigger AUREOLE_MOUNTAIN_OUTSIDE, 1
	return