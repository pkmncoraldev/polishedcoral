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
	line "TOURNAMENT used"
	cont "to be held every"
	cont "single year!"
	
	para "Recently, fewer"
	line "people are taking"
	cont "#MON training"
	cont "as seriously,"
	
	para "and they've had"
	line "to instead start"
	cont "holding it once"
	cont "every five years."
	done
	
ShimmerHouse1NPC2:
	jumptextfaceplayer ShimmerHouse1NPC2Text
	
ShimmerHouse1NPC2Text:
	text "The winner of"
	line "the last #MON"
	cont "LEAGUE TOURNAMENT"
	cont "kinda disappeared."
	
	para "ANDRE was his"
	line "name."
	
	para "He apparently had"
	line "a wife and a kid"
	cont "around your age,"
	
	para "but he abandoned"
	line "them to go train"
	cont "in solitude…"
	
	para "His poor family!"
	done
	
