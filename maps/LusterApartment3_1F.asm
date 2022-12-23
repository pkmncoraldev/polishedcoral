LusterApartment3_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 6, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 6, LUSTER_CITY_RESIDENTIAL
	warp_def 1, 6, 1, LUSTER_APARTMENT_3_2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_CUTE_GIRL,  3,  1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment3_1F_NPC, -1


LusterApartment3_1F_NPC:
	jumptextfaceplayer LusterApartment3_1F_NPC_Text
	
	
LusterApartment3_1F_NPC_Text:
	text "There are so many"
	line "MEOWTH around!"
	
	para "I make sure to"
	line "leave food out so"
	cont "they stay healthy."
	done
