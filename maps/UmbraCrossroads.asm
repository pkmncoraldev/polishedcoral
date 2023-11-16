UmbraCrossroads_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, UmbraCrossroadsFlyPoint

	db 1 ; warp events
	warp_event 17, 19, UMBRA_CROSSROADS, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events


UmbraCrossroadsFlyPoint:
	setflag ENGINE_FLYPOINT_UMBRA
	return