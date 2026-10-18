ShimmerPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  7, SHIMMER_CITY, 22
	warp_event  6,  7, SHIMMER_CITY, 22

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_POKEMANIAC,  4, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerPokeCenterNpc1, -1
	person_event SPRITE_CUTE_GIRL,  4,  3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerPokeCenterNpc2, -1
	object_event  9,  6, SPRITE_PONYTAIL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, trade, TRADE_WITH_BEV_FOR_VOLTORB, -1
	
ShimmerPokeCenterNpc1:
	jumptextfaceplayer ShimmerPokeCenterNpc1Text
	
ShimmerPokeCenterNpc1Text:
	text "The lab has a"
	line "hi-tech machine"
	cont "that can bring"
	cont "#MON back from"
	cont "fossils."
	
	para "Awesome!"
	done
	
ShimmerPokeCenterNpc2:
	jumptextfaceplayer ShimmerPokeCenterNpc2Text
	
ShimmerPokeCenterNpc2Text:
	text "PORT SHIMMER has"
	line "no GYM."
	
	para "I think there is"
	line "one in the town"
	cont "to the SOUTHEAST,"
	cont "though."
	done
