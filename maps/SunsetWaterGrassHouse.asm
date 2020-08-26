SunsetWaterGrassHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SUNSET_BAY, 5
	warp_event  3,  7, SUNSET_BAY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, SIGNPOST_JUMPSTD, magazinebookshelf
	bg_event  1,  1, SIGNPOST_JUMPSTD, magazinebookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetWaterGrassHouseNPC1, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunsetWaterGrassHouseNPC2, -1
	
SunsetWaterGrassHouseNPC1:
	jumptextfaceplayer SunsetWaterGrassHouseNPC1Text
	
SunsetWaterGrassHouseNPC2:
	jumptextfaceplayer SunsetWaterGrassHouseNPC2Text

	
SunsetWaterGrassHouseNPC1Text:
	text "I prefer WATER"
	line "#MON,"
	
	para "but you'll be more"
	line "successful with a"
	cont "balanced team."
	done
	
SunsetWaterGrassHouseNPC2Text:
	text "Do you like GRASS"
	line "#MON?"
	
	para "I love them, but"
	line "I just wish they"
	cont "didn't have so many"
	cont "weaknesses."
	done
