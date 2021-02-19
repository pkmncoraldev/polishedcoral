LusterApartment1_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, LUSTER_APARTMENT_1_1F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SUPER_NERD,  6,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment1_2F_NPC, -1

LusterApartment1_2F_NPC:
	jumptextfaceplayer LusterApartment1_2F_NPCText
	
LusterApartment1_2F_NPCText:
	text "I try not to spend"
	line "too much time"
	cont "downstairs."
	
	para "The herbal stuff"
	line "my roommates burn"
	cont "smells terrible!"
	done