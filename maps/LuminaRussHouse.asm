LuminaRussHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 5, LUMINA_TOWN
	warp_def 7, 2, 5, LUMINA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaRussHouseRuss, EVENT_RUSS_NOT_HOME
	
LuminaRussHouseRuss:
	end
	
	
