FlickerSoundSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, FLICKER_STATION, 3
	warp_event  3,  7, FLICKER_STATION, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 5, FlickerHouse1NPC, -1

	const_def 1 ; object constants
	
FlickerHouse1NPC:
	jumptextfaceplayer FlickerHouse1NPCText
	
FlickerHouse1NPCText:
	text "Living next to a"
	line "train station is"
	cont "great!"
	
	para "The sound of the"
	line "train whistle just"
	cont "never gets old."
	
	para "Even in the middle"
	line "of the night…"
	
	para "It's just… great…"
	done
