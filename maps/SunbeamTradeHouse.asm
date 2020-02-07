SunbeamTradeHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 4, SUNBEAM_ISLAND
	warp_def 7, 3, 4, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_POKEFAN_M, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunbeamTradeHouseNpc, -1

	const_def 1 ; object constants
	const SUNBEAM_TRADE_HOUSE_NPC
	
SunbeamTradeHouseNpc:
	jumptextfaceplayer SunbeamTradeHouseNpcText

SunbeamTradeHouseNpcText:
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