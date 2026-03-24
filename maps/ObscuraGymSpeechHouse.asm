ObscuraGymSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, OBSCURA_CITY, 9
	warp_event  3,  7, OBSCURA_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_BEAUTY,  3,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraGymSpeechHouseNPC1, -1
	person_event SPRITE_FAT_GUY,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraGymSpeechHouseNPC2, -1

	
ObscuraGymSpeechHouseNPC1:
	jumptextfaceplayer ObscuraGymSpeechHouseNPC1Text
	
ObscuraGymSpeechHouseNPC2:
	jumptextfaceplayer ObscuraGymSpeechHouseNPC2Text
	
ObscuraGymSpeechHouseNPC1Text:
	text "ROCKY isn't origi-"
	line "nanlly from here"
	cont "in OBSCURA CITY."
	
	para "He was raised in"
	line "a small town in"
	cont "the mountains."
	done
	
ObscuraGymSpeechHouseNPC2Text:
	text "The MUSEUM here"
	line "is also a GYM."
	
	para "If you're already"
	line "going there for"
	cont "a GYM battle,"
	
	para "you might as well"
	line "see the exhibits!"
	done
