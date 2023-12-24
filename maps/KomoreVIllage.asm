KomoreVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, KomoreVillageFlyPoint

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

KomoreVillageFlyPoint:
	setflag ENGINE_FLYPOINT_KOMORE
	return