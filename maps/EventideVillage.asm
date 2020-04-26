EventideVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, EventideVillageFlypointCallback

	db 7 ; warp events
	warp_event  6, 20, EVENTIDE_VILLAGE_GATE, 3
	warp_event  6, 21, EVENTIDE_VILLAGE_GATE, 4
	warp_event 13, 17, EVENTIDE_POKECENTER, 1
	warp_event 23, 25, EVENTIDE_MART, 1
	warp_event 23, 13, EVENTIDE_BIKE_SHOP, 1
	warp_event 13, 25, EVENTIDE_HOUSE_1, 1
	warp_event 35, 13, EVENTIDE_HOUSE_2, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 24, 34, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 25, 34, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 26, 34, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 27, 34, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText

	db 6 ; object events
	person_event SPRITE_HANGAR_PARTS, 30, 28, SPRITEMOVEDATA_HANGAR_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_HANGAR_PARTS, 30, 28, SPRITEMOVEDATA_HANGAR_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_HANGAR_PARTS, 30, 33, SPRITEMOVEDATA_HANGAR_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MILTANK, 30, 21, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	person_event SPRITE_MILTANK, 32, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	person_event SPRITE_MILTANK, 34, 22, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1

EventideVillageFlypointCallback:
	setflag ENGINE_FLYPOINT_EVENTIDE
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
.purple
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	return
	
EventideVillageMiltank:
	opentext
	writetext EventideVillageMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
EventideVillageBiplaneText:
	text "An old biplane."
	
	para "It's obviously been"
	line "used recently."
	done
	
EventideVillageMiltankText:
	text "MILTANK: Mooo!"
	done
	