Route29_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 2 ; coord events
	coord_event 23, 14, 0, Route29MinaSetup
	coord_event 24, 14, 1, Route29GrassSetup

	db 0 ; bg events

	db 4 ; object events
	strengthboulder_event 68, 24, -1
	person_event SPRITE_GENERAL_VARIABLE_1, 10, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route29Mina, -1
	person_event SPRITE_DISGUISEMAN,  8, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route29Easel, -1
	person_event SPRITE_LEAVES,  8, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route29Easel, -1

Route29MinaSetup:
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA_GROUND
	variablesprite SPRITE_DISGUISEMAN, SPRITE_VALVE_1
	setevent EVENT_ROUTE_29_PAINTING_COLORS
	special Special_UpdatePalsInstant
	dotrigger $1
	end

Route29GrassSetup:
	clearevent EVENT_ROUTE_29_PAINTING_COLORS
	special Special_UpdatePalsInstant
	dotrigger $0
	end

Route29Mina:
	end
	
Route29Easel:
	jumptext Route29EaselText
	
Route29EaselText:
	text "MINA's easel."
	done