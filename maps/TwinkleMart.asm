TwinkleMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 2, TWINKLE_TOWN
	warp_def 7, 3, 2, TWINKLE_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_TWINKLE
	person_event SPRITE_COOL_DUDE, 2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinkleMartNpc1, -1
	person_event SPRITE_REDS_MOM, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TwinkleMartNpc2, -1

TwinkleMartNpc1:
	jumptextfaceplayer TwinkleMartNpc1Text
	
TwinkleMartNpc1Text:
	text "After I'm done"
	line "stocking up, I'm"
	cont "headng into the"
	cont "nearby caves."
	
	para "There's rumors"
	line "of ancient ruins"
	cont "inside!"
	done
	
TwinkleMartNpc2:
	jumptextfaceplayer TwinkleMartNpc2Text
	
TwinkleMartNpc2Text:
	text "Our GYM LEADER,"
	line "CHARLIE, is super"
	cont "hot!"
	
	para "And I'm not just"
	line "talking about his"
	cont "#MON!"
	
	para "Dude's a major"
	line "hunk…"
	done
