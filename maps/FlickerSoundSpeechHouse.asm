FlickerSoundSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, FLICKER_STATION, 3
	warp_event  3,  7, FLICKER_STATION, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_POKEFAN_F, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 5, FlickerHouse1NPC1, -1
	person_event SPRITE_POKEFAN_M, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 5, FlickerHouse1NPC2, -1

	const_def 1 ; object constants
	
FlickerHouse1NPC1:
	jumptextfaceplayer FlickerHouse1NPC1Text
	
FlickerHouse1NPC2:
	jumptextfaceplayer FlickerHouse1NPC2Text
	
FlickerHouse1NPC1Text:
	text "Living next to a"
	line "train station is"
	cont "great!"
	
	para "The sound of the"
	line "train whistle just"
	cont "never gets old."
	
	para "Even in the middle"
	line "of the night…"
	
	para "It's just… <WAIT_M>great…"
	done
	
FlickerHouse1NPC2Text:
	text "Things here are so"
	line "quiet that most"
	cont "people don't even"
	cont "have a #MON."
	
	para "Ok, the train"
	line "whistles keep it"
	cont "from being TOO"
	cont "quiet, but you"
	cont "know what I mean…"
	done
