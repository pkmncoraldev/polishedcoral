GlintGroveNorth_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 22, 10, 3, GLINT_GROVE
	warp_def 22, 11, 4, GLINT_GROVE
	warp_def 13,  6, 1, GLINT_GROVE_DEEP

	db 0 ; coord events

	db 1 ; bg events
	signpost  7,  2, SIGNPOST_IFNOTSET, GlintGroveSecret

	db 1 ; object events
	itemball_event  4, 12, REPEL, 1, EVENT_GLINT_GROVE_NORTH_POKE_BALL
