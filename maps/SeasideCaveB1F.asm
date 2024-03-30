SeasideCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SeasideCaveB1FCallback

	db 4 ; warp events
	warp_event 15,  5, SEASIDE_CAVE_1F, 2
	warp_event 15, 21, SEASIDE_CAVE_1F, 3
	warp_event 13, 33, SEASIDE_CAVE_B2F, 1
	warp_event  9,  1, CONNECTING_CAVERN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

SeasideCaveB1FCallback:
	setevent EVENT_MADE_IT_TO_SOUTH_ONWA
	return
