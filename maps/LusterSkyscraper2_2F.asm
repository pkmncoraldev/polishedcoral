LusterSkyscraper2_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  6,  1, LUSTER_SKYSCRAPER_2_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  5, SIGNPOST_UP, Skyscraper2FSign

	db 7 ; object events
	person_event SPRITE_BEAUTY, 5, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_2F_NPC1, -1
	person_event SPRITE_POKEMANIAC, 7, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_2F_NPC2, -1
	person_event SPRITE_POKEMANIAC, 7, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_2F_NPC3, -1
	person_event SPRITE_SLOWPOKETAIL, 3, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 3, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_2_2F_NPC_1
	const LUSTER_SKYSCRAPER_2_2F_NPC_2
	const LUSTER_SKYSCRAPER_2_2F_NPC_3
	
	
LusterSkyscraper2_2F_NPC1:
	faceplayer
	opentext
	writetext LusterSkyscraper2_2F_NPC1Text
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_2_2F_NPC_1, UP
	end
	
LusterSkyscraper2_2F_NPC2:
	jumptext LusterSkyscraper_NPCText
;	faceplayer
;	opentext
;	writetext LusterSkyscraper2_2F_NPC2Text
;	waitbutton
;	closetext
;	spriteface LUSTER_SKYSCRAPER_2_2F_NPC_2, UP
;	end

LusterSkyscraper2_2F_NPC3:
	faceplayer
	opentext
	writetext LusterSkyscraper2_2F_NPC3Text
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_2_2F_NPC_3, UP
	end
	
LusterSkyscraper2_2F_NPC1Text:
	text "I love my job…"
	
	para "Tapping away at a"
	line "keyboard all day"
	cont "is surprisingly"
	cont "fulfilling…"
	done
	
;LusterSkyscraper2_2F_NPC2Text:
;	text "TEXT"
;	done
	
LusterSkyscraper2_2F_NPC3Text:
	text "Not now!"
	
	para "This is important"
	line "work!"
	done
	