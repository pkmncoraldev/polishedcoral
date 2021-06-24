LusterApartment4_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 7, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 7, LUSTER_CITY_RESIDENTIAL
	warp_def 1, 6, 1, LUSTER_APARTMENT_4_2F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_BURGLAR,  3,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterApartment4_1F_NPC1, -1
	person_event SPRITE_BIKINI_2,  3,  1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_1F_NPC2, -1

LusterApartment4_1F_NPC1:
	checkevent EVENT_HELPED_NIDOKINGS
	iftrue .donegangquest
	jumptextfaceplayer LusterApartment4_1F_NPC1Text1
.donegangquest
	jumptextfaceplayer LusterApartment4_1F_NPC1Text2
	
LusterApartment4_1F_NPC2:
	jumptextfaceplayer LusterApartment4_1F_NPC2Text
	
LusterApartment4_1F_NPC1Text1:
	text "A group of punks"
	line "used to hang out"
	cont "upstairs."
	
	para "Recently though, a"
	line "new group moved"
	cont "in."
	
	para "I wonder what"
	line "happened to the"
	cont "other guys…"
	done
	
LusterApartment4_1F_NPC1Text2:
	text "That group of"
	line "punks is back."
	
	para "I wonder where"
	line "they went and who"
	cont "those other guys"
	cont "were…"
	done
	
LusterApartment4_1F_NPC2Text:
	text "What are you"
	line "lookin' at?"
	
	para "You got somethin'"
	line "to say, say it!"
	
	para "…"
	
	para "My clothes?"
	
	para "I think I look"
	line "good!"
	done