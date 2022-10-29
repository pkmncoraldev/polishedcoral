LusterSkyscraper1_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  6,  1, LUSTER_SKYSCRAPER_1_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  5, SIGNPOST_UP, Skyscraper2FSign

	db 7 ; object events
	person_event SPRITE_POKEMANIAC, 7, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_2F_NPC1, -1
	person_event SPRITE_POKEMANIAC, 7, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_2F_NPC2, -1
	object_event  3,  7, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, trade, TRADE_WITH_TABBY_FOR_HOUNDOUR, -1
	person_event SPRITE_SLOWPOKETAIL, 3, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 3, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_1_2F_NPC_1
	const LUSTER_SKYSCRAPER_1_2F_NPC_2
	const LUSTER_SKYSCRAPER_1_2F_TRADE
	
	
LusterSkyscraper1_2F_NPC1:
	faceplayer
	opentext
	writetext LusterSkyscraper1_2F_NPC1Text
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1_2F_NPC_1, UP
	end
	
LusterSkyscraper1_2F_NPC2:
	jumptext LusterSkyscraper_NPCText
;	faceplayer
;	opentext
;	writetext LusterSkyscraper2_2F_NPC2Text
;	waitbutton
;	closetext
;	spriteface LUSTER_SKYSCRAPER_2_2F_NPC_2, UP
;	end
	
LusterSkyscraper_NPCText:
	text "CLICK CLACK CLICK"
	
	para "He's ignoring you…"
	done
	
LusterSkyscraper1_2F_NPC1Text:
	text "I couldn't imagine"
	line "having an office"
	cont "job and being a"
	cont "#MON TRIANER."
	
	para "There's just not"
	line "enough time!"
	done