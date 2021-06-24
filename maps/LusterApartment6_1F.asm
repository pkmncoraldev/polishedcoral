LusterApartment6_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 9, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 9, LUSTER_CITY_RESIDENTIAL
	warp_def 1, 6, 1, LUSTER_APARTMENT_6_2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, trade, TRADE_WITH_EMY_FOR_SCRAGGY, -1
