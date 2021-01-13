LusterCityBusiness_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BusinessCallback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 24, 14, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_POKEMANIAC, 26, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster3NPC1, -1
	person_event SPRITE_SUPER_NERD, 29, 28, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC2, -1

	
BusinessCallback:
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	setevent EVENT_IN_BUSINESS_DISTRICT
	return
	
Luster3NPC1:
	jumptextfaceplayer Luster3NPC1Text
	
Luster3NPC1Text:
	text "TEXT 1"
	done
	
Luster3NPC2:
	jumptextfaceplayer Luster3NPC2Text
	
Luster3NPC2Text:
	text "TEXT 2"
	done
