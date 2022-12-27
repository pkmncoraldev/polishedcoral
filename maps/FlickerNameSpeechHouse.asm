FlickerNameSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2, 7, FLICKER_STATION, 4
	warp_event  3, 7, FLICKER_STATION, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GRAMPS, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 5, FlickerHouse2NPC1, -1
	person_event SPRITE_REDS_MOM, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 5, FlickerHouse2NPC2, -1

	const_def 1 ; object constants
	
FlickerHouse2NPC1:
	jumptextfaceplayer FlickerHouse2NPC1Text
	
FlickerHouse2NPC2:
	jumptextfaceplayer FlickerHouse2NPC2Text
	
FlickerHouse2NPC1Text:
	text "I used to work the"
	line "railroad as a"
	cont "young man."
	
	para "That was back when"
	line "they first built"
	cont "the station."
	
	para "Since then, this"
	line "little town hasn't"
	cont "gotten any bigger."
	done
	
FlickerHouse2NPC2Text:
	text "FLICKER STATION is"
	line "the name of this"
	cont "town,"
	
	para "but it's also the"
	line "name of the train"
	cont "station."
	
	para "Apparently the"
	line "town was built"
	cont "AROUND the"
	cont "station."
	
	para "I guess that would"
	line "explain the weird"
	cont "name…"
	
	para "Still doesn't"
	line "make it any less"
	cont "confusing in con-"
	cont "versation."
	done
