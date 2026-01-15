Route6UnderwaterCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  5, 12, ROUTE_6_UNDERWATER, 75
	warp_event  6, 12, ROUTE_6_UNDERWATER, 76
	warp_event  5, 13, ROUTE_6_UNDERWATER, 77
	warp_event  6, 13, ROUTE_6_UNDERWATER, 78

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LAPRAS, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route6UnderwaterCaveLapras, EVENT_ROUTE_6_UNDERWATER_CAVE_LAPRAS_GONE

	const_def 1 ; object constants
	const ROUTE_6_UNDERWATER_CAVE_LAPRAS

Route6UnderwaterCaveLapras:
	opentext TEXTBOX_POKEMON, LAPRAS
	writetext Route6UnderwaterCaveLaprasText
	cry LAPRAS
	waitbutton
	closetext
	waitsfx
	loadwildmon LAPRAS, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, .lose
	disappear ROUTE_6_UNDERWATER_CAVE_LAPRAS
	reloadmapafterbattle
	setevent EVENT_ROUTE_6_UNDERWATER_CAVE_LAPRAS_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal LAPRAS, .CaughtLapras
	opentext
	writetext Route6UnderwaterCaveLaprasTextGone
	waitbutton
	closetext
.CaughtLapras
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	setevent EVENT_UNIQUE_ENCOUNTER_LAPRAS_BOSS
	end
.lose
	clearevent EVENT_ROUTE_6_UNDERWATER_CAVE_LAPRAS_GONE
	reloadmapafterbattle
	end
	
Route6UnderwaterCaveLaprasText:
	text "ROOOAAGH!"
	done
	
Route6UnderwaterCaveLaprasTextGone:
	text "LAPRAS fled"
	line "into the water…"
	done
