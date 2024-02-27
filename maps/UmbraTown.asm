UmbraTown_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, UmbraTownFlyPoint

	db 1 ; warp events
	warp_event 17,  9, PLAYER_HOUSE_2F, 20

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events


UmbraTownFlyPoint:
	setflag ENGINE_FLYPOINT_UMBRA
	return