RadiantTownship_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantTownshipCallback

	db 0 ; warp events

	db 0 ; coord events

	db 19 ; bg events
	signpost 13, 12, SIGNPOST_READ, RadiantTownshipSign
	signpost 14, 21, SIGNPOST_READ, RadiantTownshipGymSign
	signpost  6, 33, SIGNPOST_READ, RadiantTownshipRoute18Sign
	signpost  6,  2, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  6,  3, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  2, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  3, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 12, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 13, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 18, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 19, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 24, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 25, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 26, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 27, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 32, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 33, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  7,  6, SIGNPOST_READ, RadiantTownshipPokeCenterSign
	signpost 15,  6, SIGNPOST_READ, RadiantTownshipMartSign

	db 14 ; object events
	person_event SPRITE_CASINO, 10,  2, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 10,  3, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 13, 23, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 13, 24, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 13, 25, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 18, 26, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 18, 27, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_BROWN
	person_event SPRITE_CASINO, 10,  2, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CASINO, 10,  3, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CASINO, 13, 23, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CASINO, 13, 24, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CASINO, 13, 25, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CASINO, 18, 26, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CASINO, 18, 27, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL

RadiantTownshipCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 3, .brown
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
.brown
	setevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return

RadiantTownshipSign:
	jumptext RadiantTownshipSignText
	
RadiantTownshipGymSign:
	jumptext RadiantTownshipGymSignText
	
RadiantTownshipRoute18Sign:
	jumptext RadiantTownshipRoute18SignText
	
RadiantTownshipSolarPanel:
	jumptext RadiantTownshipSolarPanelText
	
RadiantTownshipPokeCenterSign:
	jumpstd pokecentersign
	
RadiantTownshipMartSign:
	jumpstd martsign
	
RadiantTownshipSignText:
	text "RADIANT TOWNSHIP"
	
	para "A little community"
	line "among the flowers."
	done
	
RadiantTownshipGymSignText:
	text "RADIANT TOWNSHIP"
	line "#MON GYM"
	cont "LEADER: LEILANI"
	
	para "The ferocious"
	line "flower."
	done
	
RadiantTownshipRoute18SignText:
	text "NORTH:"
	line "ROUTE 18"
	done
	
RadiantTownshipSolarPanelText:
	text "A reflective"
	line "solar panel."
	
	para "Shiny!"
	done