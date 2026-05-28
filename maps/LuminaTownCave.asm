LuminaTownCave_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LuminaTownCaveCallback

	db 3 ; warp events
	warp_def 17, 21, 6, LUMINA_TOWN
	warp_def  3, 25, 7, LUMINA_TOWN
	warp_def 33, 19, 4, AUREOLE_MOUNTAIN_OUTSIDE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	tmhmball_event  4, 16, TM_POWER_GEM, EVENT_TM39
	
LuminaTownCaveCallback:
	domaptrigger AUREOLE_MOUNTAIN_OUTSIDE, 0
	return
