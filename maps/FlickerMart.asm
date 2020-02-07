FlickerMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, FLICKER_STATION, 2
	warp_event  3,  7, FLICKER_STATION, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_FLICKER
	person_event SPRITE_COOL_DUDE, 6, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerMartNPC1, -1

FlickerMartNPC1:
	jumptextfaceplayer FlickerMartNPC1Text
	
FlickerMartNPC1Text:
	text "I've heard that"
	line "when the trains"
	cont "aren't running,"
	
	para "some people try to"
	line "walk the tracks."
	
	para "Seems really"
	line "dangerous."
	done
