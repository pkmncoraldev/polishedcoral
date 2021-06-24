TwinkleTradeHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  1, 4, TWINKLE_TOWN
	warp_def  9,  2, 4, TWINKLE_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, trade, TRADE_WITH_ALICE_FOR_GLIGAR, -1
	person_event SPRITE_CUTE_GIRL, 3, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinkleTradeHouseNpc2, -1

TwinkleTradeHouseNpc2:
	jumptextfaceplayer TwinkleTradeHouseNpc2Text
	
TwinkleTradeHouseNpc2Text:
	text "Sometimes a held"
	line "item can cause"
	cont "certain #MON"
	cont "to evolve."
	
	para "For example, I've"
	line "heard that a RAZOR"
	cont "FANG might cause"
	cont "GLIGAR to evolve"
	cont "at certain times"
	cont "of day."
	done