SpookyForest8_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 2 ; coord events
	coord_event  6, 13, 0, SpookyForestReset
	coord_event  7, 13, 0, SpookyForestReset

	db 1 ; bg events
	signpost 7, 10, SIGNPOST_READ, SpookyForest8Sign

	db 0 ; object events
	
SpookyForest8Sign:
	jumptext SpookyForest8SignText
	
SpookyForest8SignText:
	text "To whoever sees"
	line "this:"
	
	para "There's something"
	line "just not right"
	cont "about that house"
	cont "in the clearing"
	cont "to the NORTH."
	
	para "Be careful around"
	line "here."
	done
