BrilloLegendSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRILLO_TOWN, 4
	warp_event  3,  7, BRILLO_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BrilloLegendSpeechHouseNPC1, -1
	object_event  5,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloLegendSpeechHouseNPC2, -1
	
	
BrilloLegendSpeechHouseNPC1:
	jumptextfaceplayer BrilloLegendSpeechHouseNPC1Text
	
BrilloLegendSpeechHouseNPC2:
	jumptextfaceplayer BrilloLegendSpeechHouseNPC2Text
	
BrilloLegendSpeechHouseNPC1Text:
	text "The wasteland to"
	line "the NORTHEAST is"
	cont "known for intense"
	cont "sandstorms."
	
	para "Anyone who gets"
	line "caught in one is"
	cont "said to be lost"
	cont "forever…"
	done
	
BrilloLegendSpeechHouseNPC2Text:
	text "We have plenty of"
	line "myths and legends"
	cont "around here."
	
	para "The mainland has"
	line "its fair share,"
	cont "too."
	
	para "Have you heard of"
	line "the DRAGON STONE?"
	
	para "They say it can"
	line "summon a great"
	cont "#MON the size"
	cont "of a mountain!"
	done