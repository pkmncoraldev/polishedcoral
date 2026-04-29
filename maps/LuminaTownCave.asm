LuminaTownCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 17, 17, 6, LUMINA_TOWN
	warp_def  3, 21, 7, LUMINA_TOWN
	warp_def 33, 13, 4, AUREOLE_MOUNTAIN_OUTSIDE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	tmhmball_event  2, 17, TM_POWER_GEM, EVENT_TM39
