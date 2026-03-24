ObscuraMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 7, OBSCURA_CITY
	warp_def 7, 3, 7, OBSCURA_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 3; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_OBSCURA
	person_event SPRITE_SUPER_NERD,  6,  8, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMartNPC1, -1
	person_event SPRITE_POKEFAN_M,  3,  6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraMartNPC2, -1
	
	
ObscuraMartNPC1:
	jumptextfaceplayer ObscuraMartNPC1Text
	
ObscuraMartNPC1Text:
	text "I'm totally hooked"
	line "on the ROCK CANDY"
	cont "they sell at the"
	cont "MUSEUM."
	
	para "Too bad they're"
	line "always sold out"
	cont "when I visit!"
	done
	
ObscuraMartNPC2:
	jumptextfaceplayer ObscuraMartNPC2Text
	
ObscuraMartNPC2Text:
	text "Have you heard of"
	line "the LEDIAN RANGER?"
	
	para "He's some kind of"
	line "superhero I guess."
	
	para "My kid is a big"
	line "fan, but I don't"
	cont "get it…"
	done
	
