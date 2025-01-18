GlintGroveUnderground_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  7, 31, 2, GLINT_GROVE_EAST
	warp_def  5, 43, 3, GLINT_GROVE_UNDERGROUND
	warp_def 40, 31, 2, GLINT_GROVE_UNDERGROUND

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
