ShimmerHouse1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SHIMMER_CITY, 24
	warp_event  3,  7, SHIMMER_CITY, 24

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_PONYTAIL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShimmerHouse1NPC1, -1
	object_event  5,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerHouse1NPC2, -1
	
ShimmerHouse1NPC1:
	jumptextfaceplayer ShimmerHouse1NPC1Text
	
ShimmerHouse1NPC1Text:
	text "The #MON LEAGUE"
	line "TOURNAMENT is"
	cont "coming up!"
	
	para "It only comes once"
	line "every 5 years."
	
	para "Whoever wins is"
	line "recognized as the"
	cont "best TRAINER in"
	cont "the ONWA REGION!"
	
	para "I wonder if the"
	line "current CHAMPION"
	cont "will show up."
	done
	
ShimmerHouse1NPC2:
	jumptextfaceplayer ShimmerHouse1NPC2Text
	
ShimmerHouse1NPC2Text:
	text "The winner of"
	line "the last #MON"
	cont "LEAGUE TOURNAMENT"
	cont "kinda disappeared."
	
	para "He apparently had"
	line "a wife and a kid"
	cont "around your age."
	
	para "He abandoned them"
	line "to go train in"
	cont "the mountians or"
	cont "or something…"
	
	para "His poor family!"
	done
	
