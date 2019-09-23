SpookyForest8_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

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
	
	para "about that house"
	line "in the clearing"
	cont "to the NORTH."
	
	para "Be careful around"
	line "here."
	done
