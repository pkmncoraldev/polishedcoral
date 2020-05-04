SpookyForest2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 4 ; coord events
	coord_event  0,  6, 0, SpookyForestReset
	coord_event  0,  7, 0, SpookyForestReset
	coord_event  6,  0, 0, SpookyForestReset
	coord_event  7,  0, 0, SpookyForestReset

	db 0 ; bg events

	db 0 ; object events
