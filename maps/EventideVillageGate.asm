EventideVillageGate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, EventideVillageGateLittleGirlReappear

	db 4 ; warp events
	warp_def 4, 0, 3, EVENTIDE_FOREST
	warp_def 5, 0, 4, EVENTIDE_FOREST
	warp_def 4, 9, 1, EVENTIDE_VILLAGE
	warp_def 5, 9, 2, EVENTIDE_VILLAGE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EventideVillageGateOfficer, -1

EventideVillageGateLittleGirlReappear:
	checkevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	iftrue .skip
	clearevent EVENT_FOREST_GHOST_GIRL_GONE
	clearevent EVENT_FOREST_GHOST_GIRL_GONE2
	domaptrigger EVENTIDE_FOREST, $0
.skip
	return
	
EventideVillageGateOfficer:
	jumptextfaceplayer EventideVillageGateOfficerText
	
EventideVillageGateOfficerText:
	text "There have been"
	line "reports of a small"
	cont "girl being sighted"
	cont "in the forest,"
	
	para "but we haven't"
	line "seen anything"
	cont "suggesting that's"
	cont "true."
	done