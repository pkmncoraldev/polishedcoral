SunbeamTradeHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 4, SUNBEAM_ISLAND
	warp_def 7, 2, 4, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_COMMAND, trade, TRADE_WITH_PAUL_FOR_PONYTA, -1
