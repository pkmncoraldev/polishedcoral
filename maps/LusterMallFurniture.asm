LusterMallFurniture_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 11,  6, 24, LUSTER_MALL
	warp_def 11,  7, 25, LUSTER_MALL

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1,  1, SIGNPOST_JUMPTEXT, LusterMallFurnitureDollsText
	bg_event  1,  2, SIGNPOST_JUMPTEXT, LusterMallFurnitureDollsText

	db 9 ; object events
	person_event SPRITE_FAT_GUY,  1,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallFurnitureClerk1, -1
	person_event SPRITE_FAT_GUY,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallFurnitureClerk2, -1
	person_event SPRITE_PONYTAIL,  1,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMallFurnitureClerk3, -1
	object_event  1,  0, SPRITE_MON_ICON, SPRITEMOVEDATA_TILE_DOWN, 0, CLEFAIRY, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  3,  0, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, TEDDIURSA, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_TILE_DOWN, 0, MINCCINO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  0, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, MARILL, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallFurnitureDolls, -1
	person_event SPRITE_COOL_DUDE,  8,  7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallFurnitureNPC1, -1
	person_event SPRITE_TWIN,  4,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallFurnitureNPC2, -1
	
	
LusterMallFurnitureNPC1:
	jumptextfaceplayer LusterMallFurnitureNPC1Text
	
LusterMallFurnitureNPC1Text:
	text "The furniture sold"
	line "here is for your"
	cont "room at home."
	
	para "You can display it"
	line "using the PC in"
	cont "your room."
	done
	
LusterMallFurnitureNPC2:
	jumptextfaceplayer LusterMallFurnitureNPC2Text
	
LusterMallFurnitureNPC2Text:
	text "There are dolls"
	line "that they don't"
	cont "sell here."
	
	para "You can find them"
	line "by exploring the"
	cont "world."
	
	para "See if you can"
	line "find them all!"
	done
	
LusterMallFurnitureDolls:
	jumptext LusterMallFurnitureDollsText
	
LusterMallFurnitureDollsText:
	text "A variety of cute"
	line "#MON dolls."
	done

LusterMallFurnitureClerk1:
	opentext
	writetext LusterMallFurnitureClerk1Text1
	waitbutton
	callasm LusterMallFurnitureClerk1Asm
	writetext LusterMallFurnitureClerk1Text2
	waitbutton
	closetext
	end
	
LusterMallFurnitureClerk1Text1:
	text "Welcome to"
	line "DéCOR de DITTO."
	
	para "What are you in"
	line "the market for?"
	done
	
LusterMallFurnitureClerk1Text2:
	text "Thanks for"
	line "stopping by."
	done
	
LusterMallFurnitureClerk1Asm:
	ld a, MARTTYPE_DECO
	ld c, a
	ld a, MART_LUSTER_MALL_FURNITURE
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
LusterMallFurnitureClerk2:
	opentext
	writetext LusterMallFurnitureClerk2Text1
	waitbutton
	callasm LusterMallFurnitureClerk2Asm
	writetext LusterMallFurnitureClerk2Text2
	waitbutton
	closetext
	end
	
LusterMallFurnitureClerk2Text1:
	text "Hello!"
	
	para "Are you interested"
	line "in some art for"
	cont "your room?"
	done
	
LusterMallFurnitureClerk2Text2:
	text "Thanks for"
	line "taking a look."
	done
	
LusterMallFurnitureClerk2Asm:
	ld a, MARTTYPE_DECO
	ld c, a
	ld a, MART_LUSTER_MALL_POSTERS
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
LusterMallFurnitureClerk3:
	opentext
	writetext LusterMallFurnitureClerk3Text1
	waitbutton
	callasm LusterMallFurnitureClerk3Asm
	writetext LusterMallFurnitureClerk3Text2
	waitbutton
	closetext
	end
	
LusterMallFurnitureClerk3Text1:
	text "Hi there!"
	
	para "Did you come to"
	line "look at the cute"
	cont "dolls?"
	done
	
LusterMallFurnitureClerk3Text2:
	text "Come again, ok?"
	done
	
LusterMallFurnitureClerk3Asm:
	ld a, MARTTYPE_DECO
	ld c, a
	ld a, MART_LUSTER_MALL_DOLLS
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
