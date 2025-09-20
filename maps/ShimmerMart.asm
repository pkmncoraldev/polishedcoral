ShimmerMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, SHIMMER_CITY, 23
	warp_event  2,  7, SHIMMER_CITY, 23

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_SHIMMER
	person_event SPRITE_POKEFAN_M, 2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerMartNpc1, -1
	person_event SPRITE_PONYTAIL, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerMartNpc2, -1

ShimmerMartNpc1:
	jumptextfaceplayer ShimmerMartNpc1Text
	
ShimmerMartNpc1Text:
	text "Yes!<WAIT_S> They sell"
	line "MAX REPEL here!"
	
	para "No more having to"
	line "apply REPEL over"
	cont "and over!"
	done
	
ShimmerMartNpc2:
	jumptextfaceplayer ShimmerMartNpc2Text
	
ShimmerMartNpc2Text:
	text "You know, it's"
	line "pretty nice that"
	cont "you can sell stuff"
	cont "to the #MART."
	
	para "I wonder what they"
	line "do with all the"
	cont "junk they buy!"
	done
