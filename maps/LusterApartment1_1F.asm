LusterApartment1_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 4, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 4, LUSTER_CITY_RESIDENTIAL
	warp_def 1, 6, 1, LUSTER_APARTMENT_1_2F

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_AROMA_LADY,  3,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterApartment1_1F_NPC1, -1
	person_event SPRITE_PSYCHIC,  3,  1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterApartment1_1F_NPC2, -1
	object_event 2, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SNUBBULL, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, LusterApartment1_1F_NPC3, -1

LusterApartment1_1F_NPC1:
	jumptextfaceplayer LusterApartment1_1F_NPC1Text
	
LusterApartment1_1F_NPC2:
	jumptextfaceplayer LusterApartment1_1F_NPC2Text
	
LusterApartment1_1F_NPC3:
	opentext
	writetext LusterApartment1_1F_NPC3Text1
	cry SNUBBULL
	waitsfx
	buttonsound
	writetext LusterApartment1_1F_NPC3Text2
	waitbutton
	closetext
	end
	
LusterApartment1_1F_NPC1Text:
	text "We love the herbal"
	line "medicine from the"
	cont "WEEPIN' BELL at"
	cont "the mall!"
	
	para "It's all natural"
	line "and not full of"
	cont "preservatives"
	cont "like the medicine"
	cont "from the #MART!"
	done
	
LusterApartment1_1F_NPC2Text:
	text "People say #MON"
	line "don't like herbal"
	cont "medicine,"
	
	para "but our little"
	line "guy seems to LOVE"
	cont "them!"
	done
	
LusterApartment1_1F_NPC3Text1:
	text "SNUBBULL: Snub…"
	done
	
LusterApartment1_1F_NPC3Text2:
	text "It looks"
	line "miserable…"
	done