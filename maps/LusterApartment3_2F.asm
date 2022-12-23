LusterApartment3_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, LUSTER_APARTMENT_3_1F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_GENTLEMAN,  5,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterApartment3_2F_NPC, -1
	
LusterApartment3_2F_NPC:
	jumptextfaceplayer LusterApartment3_2F_NPC_Text
	
LusterApartment3_2F_NPC_Text:
	text "Not only do #-"
	line "MON hide in the"
	cont "trash, but people"
	cont "throw out some of"
	cont "the best stuff!"
	
	para "Hey, don't look at"
	line "me like that!"
	
	para "See for yourself!"
	done

