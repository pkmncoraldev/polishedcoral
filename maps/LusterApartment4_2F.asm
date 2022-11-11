LusterApartment4_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, LUSTER_APARTMENT_4_1F

	db 0 ; coord events

	db 0 ; bg events

	db 12 ; object events
	person_event SPRITE_BURGLAR,  6,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_NPC1, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_DELINQUENT_M,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_NPC2, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_DELINQUENT_F,  5,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_NPC3, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_DELINQUENT_M,  5,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_NPC4, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_DELINQUENT_M,  5,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_NPC5, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_DELINQUENT_F,  3,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_NPC6, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_FRANKIE,  3,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_Frankie, EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	person_event SPRITE_KAGE,  3,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_Brutus, EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	person_event SPRITE_DELINQUENT_M,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_Buneary1, EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	person_event SPRITE_DELINQUENT_M,  6,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_Buneary2, EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	person_event SPRITE_DELINQUENT_M,  5,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_Buneary3, EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	person_event SPRITE_DELINQUENT_F,  5,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment4_2F_Buneary4, EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT

	
	const_def 1 ; object constants
	const LUSTER_APARTMENT_4_2F_NPC1
	const LUSTER_APARTMENT_4_2F_NPC2
	const LUSTER_APARTMENT_4_2F_NPC3
	const LUSTER_APARTMENT_4_2F_NPC4
	const LUSTER_APARTMENT_4_2F_NPC5
	const LUSTER_APARTMENT_4_2F_NPC6
	const LUSTER_APARTMENT_4_2F_FRANKIE
	const LUSTER_APARTMENT_4_2F_BRUTUS
	const LUSTER_APARTMENT_4_2F_BUNEARY1
	const LUSTER_APARTMENT_4_2F_BUNEARY2
	const LUSTER_APARTMENT_4_2F_BUNEARY3
	const LUSTER_APARTMENT_4_2F_BUNEARY4
		
LusterApartment4_2F_Frankie:
	jumptextfaceplayer LusterApartment4_2F_FrankieText
	
LusterApartment4_2F_Brutus:
	jumptextfaceplayer LusterApartment4_2F_BrutusText
		
LusterApartment4_2F_Buneary1:
	faceplayer
	opentext
	writetext LusterApartment4_2F_Buneary1Text
	waitbutton
	closetext
	spriteface LUSTER_APARTMENT_4_2F_BUNEARY1, UP
	end
	
LusterApartment4_2F_Buneary2:
	faceplayer
	opentext
	writetext LusterApartment4_2F_Buneary2Text
	waitbutton
	closetext
	spriteface LUSTER_APARTMENT_4_2F_BUNEARY2, LEFT
	end
	
LusterApartment4_2F_Buneary3:
	jumptextfaceplayer LusterApartment4_2F_Buneary3Text
	
LusterApartment4_2F_Buneary4:
	jumptextfaceplayer LusterApartment4_2F_Buneary4Text
		
LusterApartment4_2F_NPC1:
	faceplayer
	opentext
	writetext LusterApartment4_2F_NPC1Text
	waitbutton
	closetext
	spriteface LUSTER_APARTMENT_4_2F_NPC1, RIGHT
	end
	
LusterApartment4_2F_NPC2:
	faceplayer
	opentext
	writetext LusterApartment4_2F_NPC2Text
	waitbutton
	closetext
	spriteface LUSTER_APARTMENT_4_2F_NPC2, UP
	end
	
LusterApartment4_2F_NPC3:
	jumptextfaceplayer LusterApartment4_2F_NPC3Text
	
LusterApartment4_2F_NPC4:
	jumptextfaceplayer LusterApartment4_2F_NPC4Text
	
LusterApartment4_2F_NPC5:
	faceplayer
	opentext
	writetext LusterApartment4_2F_NPC5Text
	waitbutton
	closetext
	spriteface LUSTER_APARTMENT_4_2F_NPC5, LEFT
	end
	
LusterApartment4_2F_NPC6:
	jumptextfaceplayer LusterApartment4_2F_NPC6Text
	
LusterApartment4_2F_NPC1Text:
	text "I can't believe"
	line "we've been forced"
	cont "to hide out in an"
	cont "old apartment!"
	
	para "What a disgrace!"
	done
	
LusterApartment4_2F_NPC2Text:
	text "What gives?"
	
	para "This piece a' junk"
	line "is busted!"
	done
	
LusterApartment4_2F_NPC3Text:
	text "We lost our old"
	line "hideout…"
	
	para "The boss better"
	line "do somethin',"
	cont "quick!"
	done
	
LusterApartment4_2F_NPC4Text:
	text "Shoo!"
	
	para "The boss won't want"
	line "some kid pokin'"
	cont "around here!"
	done
	
LusterApartment4_2F_NPC5Text:
	text "BUNEARYS…"
	
	para "Ooooooh!"
	
	para "I hate them!"
	done
	
LusterApartment4_2F_NPC6Text:
	text "You sure you're"
	line "in the right"
	cont "place, kid?"
	done
	
LusterApartment4_2F_FrankieText:
	text "I've gotta hand it"
	line "to you, kid."
	
	para "You got us pretty"
	line "good!"
	
	para "Remember though,"
	line "this isn't over."
	
	para "You'll get yours"
	line "someday…"
	
	para "“THE BUNEARY BOYS”"
	line "will rise again!"
	done
	
LusterApartment4_2F_BrutusText:
	text "You!?"
	
	para "What makes you"
	line "think you can show"
	cont "your face here!?"
	done
	
LusterApartment4_2F_Buneary1Text:
	text "Huh?"
	
	para "Those “NIDOKINGS”"
	line "busted up the TV!"
	
	para "It won't even turn"
	line "on!"
	done
	
LusterApartment4_2F_Buneary2Text:
	text "We had it all 'till"
	line "you came along!"
	done
	
LusterApartment4_2F_Buneary3Text:
	text "Get outta my face!"
	
	para "I can't even look"
	line "at you!"
	done
	
LusterApartment4_2F_Buneary4Text:
	text "Back to this old"
	line "piece a' junk"
	cont "apartment…"
	
	para "Someday we'll get"
	line "you back…"
	done
	