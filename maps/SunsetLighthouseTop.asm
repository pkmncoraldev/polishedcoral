SunsetLighthouseTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 15,  0, SUNSET_LIGHTHOUSE_ELEVATOR, 1
	warp_event 13,  3, SUNSET_LIGHTHOUSE_TOP, 3
	warp_event  4,  5, SUNSET_LIGHTHOUSE_TOP, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
