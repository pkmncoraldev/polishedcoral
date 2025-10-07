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
	person_event SPRITE_GAMEBOY_KID,  6,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerPokeCenterNpc2, -1
	person_event SPRITE_CUTE_GIRL,  4,  3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerPokeCenterNpc3, -1
	
ShimmerPokeCenterNpc1:
	jumptextfaceplayer ShimmerPokeCenterNpc1Text
	
ShimmerPokeCenterNpc1Text:
	text "The lab has a"
	line "hi-tech machine"
	cont "that can bring"
	cont "#MON back from"
	cont "fossils."
	
	para "How cool is that?"
	done
	
ShimmerPokeCenterNpc2:
	faceplayer
	opentext
	writetext ShimmerPokeCenterNpc2Text
	waitbutton
	closetext
	spriteface 4, DOWN
	end
	
ShimmerPokeCenterNpc2Text:
	text "Some people like"
	line "to look up all the"
	cont "stats, info, and"
	
	para "techniques in a"
	line "game before they"
	cont "even play it!"
	
	para "Where's the fun"
	line "in that, huh?"
	done
	
ShimmerPokeCenterNpc3:
	jumptextfaceplayer ShimmerPokeCenterNpc3Text
	
ShimmerPokeCenterNpc3Text:
	text "SOUTH ONWA isn't as"
	line "big as NORTH ONWA,"
	cont "but there's plenty"
	cont "to see and do!"
	done
