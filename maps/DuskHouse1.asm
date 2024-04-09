DuskHouse1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, DUSK_TURNPIKE, 13
	warp_event  3,  7, DUSK_TURNPIKE, 13

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_REDS_MOM,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, DuskHouse1NPC, -1


DuskHouse1NPC:
	jumptextfaceplayer DuskHouse1NPCText
	
DuskHouse1NPCText:
	text "If you like wheels"
	line "we've got you set!"
	
	para "Between the bikes"
	line "over at MOOMOO's,"
	cont "the AUTO SHOP,"
	cont "and the HIGHWAY,"
	
	para "DUSK TURNPIKE is"
	line "the place to be!"
	done
	
	