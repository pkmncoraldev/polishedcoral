SunbeamBlueWaterHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 8, SUNBEAM_ISLAND
	warp_def 7, 3, 8, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_REDS_MOM, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse2NPC1, -1
	person_event SPRITE_POKEFAN_M, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse2NPC2, -1

	const_def 1 ; object constants
	const SUNBEAM_BLUE_WATER_HOUSE_NPC1
	const SUNBEAM_BLUE_WATER_HOUSE_NPC2
	
SunbeamIslandHouse2NPC1:
	jumptextfaceplayer SunbeamIslandHouse2NPC1Text
	
SunbeamIslandHouse2NPC2:
	jumptextfaceplayer SunbeamIslandHouse2NPC2Text

SunbeamIslandHouse2NPC1Text:
	text "SUNBEAM ISLAND is"
	line "known for it's"
	cont "sunny skies and"
	cont "bright blue water."
	
	para "GRASS TYPE #MON"
	line "thrive in this"
	cont "island's sunny"
	cont "weather!"
	done
	
SunbeamIslandHouse2NPC2Text:
	text "Our GYM LEADER,"
	line "LEILANI, is just"
	cont "as strong as she"
	cont "is beautiful!"
	
	para "Hehehe…"
	done