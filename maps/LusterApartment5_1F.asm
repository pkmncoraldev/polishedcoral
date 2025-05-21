LusterApartment5_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 8, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 8, LUSTER_CITY_RESIDENTIAL
	warp_def 1, 6, 1, LUSTER_APARTMENT_5_2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_PONYTAIL,  3,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterApartment5_1F_NPC, -1

LusterApartment5_1F_NPC:
	jumptextfaceplayer LusterApartment5_1F_NPCText
	
LusterApartment5_1F_NPCText:
	text "Gah!"
	
	para "My roommate is a"
	line "total weirdo!"
	
	para "She thinks her"
	line "and her friends"
	cont "are witches or"
	cont "something."
	
	para "She's always trying"
	line "to cast curses and"
	cont "hexes on me!"
	
	para "I have GOT to find"
	line "a new place…"
	done