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
	object_event  2,  3, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetWaterGrassHouseNPC1, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunsetWaterGrassHouseNPC2, -1
	
SunsetWaterGrassHouseNPC1:
	jumptextfaceplayer SunsetWaterGrassHouseNPC1Text
	
SunsetWaterGrassHouseNPC2:
	jumptextfaceplayer SunsetWaterGrassHouseNPC2Text

	
SunsetWaterGrassHouseNPC1Text:
	text "CAP'N ABNER lives"
	line "in the LIGHTHOUSE"
	cont "on SUNSET CAPE."
	
	para "Keeping that thing"
	line "in working order"
	cont "is an important"
	cont "job, for sure."
	
	para "Not something I"
	line "would want to do!"
	done
	
SunsetWaterGrassHouseNPC2Text:
	text "ABNER just showed"
	line "up to SUNSET BAY"
	cont "one day out of"
	cont "the blue."
	
	para "All anyone knows"
	line "about his past is"
	cont "that he was once"
	cont "a rich and power-"
	cont "ful man."
	
	para "No one is sure"
	line "why he left that"
	cont "life behind…"
	done
