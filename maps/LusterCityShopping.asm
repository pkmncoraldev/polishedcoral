LusterCityShopping_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 12 ; object events
	person_event SPRITE_LASS, 36,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster2NPC1, -1
	person_event SPRITE_COOLTRAINER_F, 36,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster2NPC2, -1
	person_event SPRITE_BUG_CATCHER, 36,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster2NPC3, -1
	person_event SPRITE_LASS, 46,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2NPC4, -1
	person_event SPRITE_COOLTRAINER_F, 34, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster2NPC5, -1
	person_event SPRITE_YOUNGSTER, 34, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Luster2NPC6, -1
	person_event SPRITE_FISHER, 40,  9, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster2NPC7, -1
	person_event SPRITE_YOUNGSTER, 29, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2NPC8, -1
	person_event SPRITE_MALL_SIGN, 31,  9, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MALL_SIGN, 31, 10, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MALL_SIGN_2, 44,  1, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Luster2MallSign, -1
	person_event SPRITE_MALL_SIGN_2, 44,  2, SPRITEMOVEDATA_POKECOM_NEWS, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	const_def 1 ; object constants
	const LUSTER2NPC1
	const LUSTER2NPC2
	const LUSTER2NPC3
	const LUSTER2NPC4
	const LUSTER2NPC5
	const LUSTER2NPC6
	const LUSTER2NPC7
	const LUSTER2NPC8

Luster2NPC1:
	faceplayer
	opentext
	writetext Luster2NPC1Text
	waitbutton
	closetext
	spriteface LUSTER2NPC1, LEFT
	end

Luster2NPC2:
	faceplayer
	opentext
	writetext Luster2NPC2Text
	waitbutton
	closetext
	spriteface LUSTER2NPC2, RIGHT
	end

Luster2NPC3:
	faceplayer
	opentext
	writetext Luster2NPC3Text
	waitbutton
	closetext
	spriteface LUSTER2NPC3, LEFT
	end
	
Luster2NPC4:
	faceplayer
	opentext
	writetext Luster2NPC4Text
	waitbutton
	closetext
	spriteface LUSTER2NPC4, UP
	end
	
Luster2NPC5:
	faceplayer
	opentext
	writetext Luster2NPC5Text
	waitbutton
	closetext
	spriteface LUSTER2NPC5, DOWN
	end
	
Luster2NPC6:
	faceplayer
	opentext
	writetext Luster2NPC6Text
	waitbutton
	closetext
	spriteface LUSTER2NPC6, DOWN
	end
	
Luster2NPC7:
	faceplayer
	opentext
	writetext Luster2NPC7Text
	waitbutton
	closetext
	spriteface LUSTER2NPC7, LEFT
	end
	
Luster2NPC8:
	faceplayer
	opentext
	writetext Luster2NPC8Text
	waitbutton
	closetext
	spriteface LUSTER2NPC8, UP
	end
	
Luster2MallSign:
	end
	
Luster2NPC1Text:
	text "I love coming to"
	line "the SHOPPING MALL!"
	
	para "My MOM always"
	line "makes me bring my"
	cont "little brother"
	cont "along, though…"
	done
	
Luster2NPC2Text:
	text "Why'd she have to"
	line "bring her kid"
	cont "brother along?"
	
	para "He's so annoying!"
	done
	
Luster2NPC3Text:
	text "My big sister is"
	line "taking me to the"
	cont "SHOPPING MALL!"
	
	para "YAY!"
	done
	
Luster2NPC4Text:
	text "This is the only"
	line "place in this city"
	cont "that I could des-"
	cont "cribe as pretty."
	
	para "Well, there is the"
	line "park, I guess."
	
	para "But, that place is"
	line "always so crowded."
	done
	
Luster2NPC5Text:
	text "Ehehehe!"
	
	para "I can't wait to"
	line "buy my boyfriend"
	cont "all sorts of cute"
	cont "outfits!"
	done
	
Luster2NPC6Text:
	text "Help me!"
	
	para "She dragged me"
	line "along with her…"
	done
	
Luster2NPC7Text:
	text "I locked my keys"
	line "in my car!"
	
	para "Today is not my"
	line "day…"
	done
	
Luster2NPC8Text:
	text "Only employees are"
	line "allowed behind the"
	cont "SHOPPING MALL."
	
	para "I wonder what goes"
	line "on back there…"
	done
