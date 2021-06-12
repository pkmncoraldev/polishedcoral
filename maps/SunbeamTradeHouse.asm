SunbeamTradeHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 4, SUNBEAM_ISLAND
	warp_def 7, 2, 4, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, trade, TRADE_WITH_PAUL_FOR_EXEGGCUTE, -1
	person_event SPRITE_REDS_MOM, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamTradeHouseNpc2, -1

	const_def 1 ; object constants
	
SunbeamTradeHouseNpc1:
	jumptextfaceplayer SunbeamTradeHouseNpc1Text
	
SunbeamTradeHouseNpc2:
	jumptextfaceplayer SunbeamTradeHouseNpc2Text

SunbeamTradeHouseNpc1Text:
	text "UNFINISHED"

	para "I caught that"
	line "EXEGGCUTE on a"
	cont "little island off"
	cont "the coast."

	para "EXEGGCUTE caught"
	line "around here are"
	cont "known to evolve"
	cont "into a taller form"
	cont "than usual."
	
	para "Some say it's their"
	line "natural form!"
	done

SunbeamTradeHouseNpc2Text:
	text "SUNBEAM ISLAND is"
	line "known for it's"
	cont "sunny skies and"
	cont "bright blue water."
	
	para "GRASS TYPE #MON"
	line "thrive in this"
	cont "island's sunny"
	cont "weather!"
	done