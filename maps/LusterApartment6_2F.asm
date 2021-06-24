LusterApartment6_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, LUSTER_APARTMENT_6_1F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_SUPER_NERD,  6,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterApartment6_2F_NPC1, -1
	person_event SPRITE_FAT_GUY,  5,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterApartment6_2F_NPC2, -1
	
	
LusterApartment6_2F_NPC1:
	jumptextfaceplayer LusterApartment6_2F_NPC1Text
	
LusterApartment6_2F_NPC2:
	jumptextfaceplayer LusterApartment6_2F_NPC2Text

	
LusterApartment6_2F_NPC1Text:
	text "Some #MON"
	line "have strange"
	cont "different forms!"
	
	para "They're still"
	line "clearly the same"
	cont "#MON,"
	
	para "but they're also"
	line "very distinct."
	done
	
LusterApartment6_2F_NPC2Text:
	text "I once saw someone"
	line "with a rainbow"
	cont "colored MUK…"
	
	para "I wonder what that"
	line "was about…"
	done