EventideGymSpeechHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 3, 7, EVENTIDE_VILLAGE, 6
	warp_event 4, 7, EVENTIDE_VILLAGE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_COOL_DUDE,  3,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, EventideGymSpeechHouseNPC1, -1
	person_event SPRITE_BATTLE_GIRL,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EventideGymSpeechHouseNPC2, -1

	
EventideGymSpeechHouseNPC1:
	jumptextfaceplayer EventideGymSpeechHouseNPC1Text
	
EventideGymSpeechHouseNPC2:
	jumptextfaceplayer EventideGymSpeechHouseNPC2Text
	
EventideGymSpeechHouseNPC1Text:
	text "I wish WENDY would"
	line "whisk me away in"
	cont "that plane of"
	cont "hers."
	
	para "We could live"
	line "happily ever"
	cont "after…"
	done
	
EventideGymSpeechHouseNPC2Text:
	text "The GYM LEADER"
	line "here, WENDY, is a"
	cont "well-known pilot!"
	
	para "I wonder why she"
	line "sticks around here"
	cont "when she could fly"
	cont "anywhere."
	
	para "She must love this"
	line "quiet little town!"
	done
