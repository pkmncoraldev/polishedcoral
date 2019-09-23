Route4EventideGate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route4EventideGateLittleGirlReappear

	db 4 ; warp events
	warp_def 4, 0, 1, ROUTE_4
	warp_def 5, 0, 2, ROUTE_4
	warp_def 4, 9, 1, EVENTIDE_FOREST
	warp_def 5, 9, 2, EVENTIDE_FOREST

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route4GateOfficer, -1

Route4EventideGateLittleGirlReappear:
	checkevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	iftrue .skip
	clearevent EVENT_FOREST_GHOST_GIRL_GONE
	clearevent EVENT_FOREST_GHOST_GIRL_GONE2
	domaptrigger EVENTIDE_FOREST, $0
.skip
	return
	
Route4GateOfficer:
	jumptextfaceplayer Route4GateOfficerText
	
Route4GateOfficerText:
	text "EVENTIDE¯FOREST"
	line "isn't very well"
	cont "lit."
	
	para "It should be safe,"
	line "but stay aware"
	cont "just in case."
	done