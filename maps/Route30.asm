Route30_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  4,  4, 3, BRIGHTBURG_GATE
	warp_def  5,  4, 4, BRIGHTBURG_GATE

	db 0 ; coord events

	db 1 ; bg events
	signpost  4,  8, SIGNPOST_JUMPTEXT, Route30SignText

	db 0 ; object events


Route30SignText:
	text "This part of the"
	line "game isn't made"
	cont "yet."
	
	para "There's more to"
	line "play to the SOUTH"
	cont "of town."
	
	para "Sorry!"
	done