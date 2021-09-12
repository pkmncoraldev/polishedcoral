LusterMallElectronicsShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  6, 7, LUSTER_MALL
	warp_def  7,  7, 8, LUSTER_MALL

	db 0 ; coord events

	db 11 ; bg events
	bg_event  5,  1, SIGNPOST_READ, LusterMallElectronicsShop_Poster
	bg_event  7,  1, SIGNPOST_READ, LusterMallElectronicsShop_Shelf
	bg_event  2,  3, SIGNPOST_READ, LusterMallElectronicsShop_TV
	bg_event  3,  3, SIGNPOST_READ, LusterMallElectronicsShop_TV
	bg_event  4,  7, SIGNPOST_READ, LusterMallElectronicsShop_TV
	bg_event  4,  3, SIGNPOST_READ, LusterMallElectronicsShop_TV2
	bg_event  3,  7, SIGNPOST_READ, LusterMallElectronicsShop_TV2
	bg_event  3,  5, SIGNPOST_READ, LusterMallElectronicsShop_N64
	bg_event  4,  5, SIGNPOST_READ, LusterMallElectronicsShop_N64
	bg_event  1,  7, SIGNPOST_READ, LusterMallElectronicsShop_N64
	bg_event  2,  7, SIGNPOST_READ, LusterMallElectronicsShop_N64

	db 9 ; object events
	object_event  2,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_Snes, -1
	object_event  2,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_Snes, -1
	object_event  1,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_Snes, -1
	object_event  1,  5, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_Snes, -1
	person_event SPRITE_CHILD,  6,  1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_NPC1, -1
	person_event SPRITE_SUPER_NERD,  5,  0, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_NPC2, -1
	person_event SPRITE_CUTE_GIRL,  2,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallElectronicsShop_NPC3, -1
	object_event  9,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, pokemart, MARTTYPE_ELECTRONICS, MART_LUSTER_MALL_ELECTRONICS_TM, -1
	object_event  9,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, pokemart, MARTTYPE_TM, MART_LUSTER_MALL_ELECTRONICS, -1

	const_def 1 ; object constants
	const LUSTER_MALL_ELECTRONICS_SNES1
	const LUSTER_MALL_ELECTRONICS_SNES2
	const LUSTER_MALL_ELECTRONICS_SNES3
	const LUSTER_MALL_ELECTRONICS_SNES4
	const LUSTER_MALL_ELECTRONICS_NPC1
	const LUSTER_MALL_ELECTRONICS_NPC2
	const LUSTER_MALL_ELECTRONICS_NPC3
	const LUSTER_MALL_ELECTRONICS_CLERK
	const LUSTER_MALL_ELECTRONICS_CLERK2
	
	
LusterMallElectronicsShop_NPC1:
	jumptextfaceplayer LusterMallElectronicsShop_NPC1Text

LusterMallElectronicsShop_NPC2:
	jumptextfaceplayer LusterMallElectronicsShop_NPC2Text

LusterMallElectronicsShop_NPC3:
	faceplayer
	opentext
	writetext LusterMallElectronicsShop_NPC3Text
	waitbutton
	closetext
	spriteface LUSTER_MALL_ELECTRONICS_NPC3, UP
	end
	
LusterMallElectronicsShop_Poster:
	jumptext LusterMallElectronicsShop_PosterText
	
LusterMallElectronicsShop_Shelf:
	jumptext LusterMallElectronicsShop_ShelfText
	
LusterMallElectronicsShop_TV:
	jumptext LusterMallElectronicsShop_TVText
	
LusterMallElectronicsShop_TV2:
	jumptext LusterMallElectronicsShop_TV2Text

LusterMallElectronicsShop_Snes:
	jumptext LusterMallElectronicsShop_SnesText
	
LusterMallElectronicsShop_N64:
	jumptext LusterMallElectronicsShop_N64Text

LusterMallElectronicsShop_NPC1Text:
	text "I can't afford an"
	line "N64,"
	
	para "so I'm stuck with"
	line "my old SNES…"
	done
	
LusterMallElectronicsShop_NPC2Text:
	text "This store has so"
	line "much cool stuff!"
	
	para "I bet anyone"
	line "can find something"
	cont "they want here!"
	done
	
LusterMallElectronicsShop_NPC3Text:
	text "Wait!"
	
	para "These are TMs,"
	line "not music CDs!"
	done
	
LusterMallElectronicsShop_PosterText:
	text "NEW!"
	
	para "Teach your #MON"
	line "new moves!"
	
	para "TMs now on sale!"
	done
	
LusterMallElectronicsShop_ShelfText:
	text "It's filled with"
	line "different TMs."
	done
	
LusterMallElectronicsShop_TVText:
	text "A big screen TV."
	
	para "Fancy!"
	done
	
LusterMallElectronicsShop_TV2Text:
	text "A smaller TV for"
	line "kids."
	done
	
LusterMallElectronicsShop_SnesText:
	text "It's an SNES."
	
	para "It has tons of"
	line "classic games!"
	done
	
LusterMallElectronicsShop_N64Text:
	text "It's an N64."
	
	para "This baby has all"
	line "the hot new games!"
	done