LusterApartment2_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 5, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 5, LUSTER_CITY_RESIDENTIAL
	warp_def 1, 6, 1, LUSTER_APARTMENT_2_2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SUPER_NERD,  3,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterApartment2_1F_NPC, -1
	
	
LusterApartment2_1F_NPC:
	jumptextfaceplayer LusterApartment2_1F_NPCText1
	
LusterApartment2_1F_NPCText1:
	text "TODO"
	done
