LusterSkyscraper1_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  2,  7, LUSTER_CITY_BUSINESS, 1
	warp_event  3,  7, LUSTER_CITY_BUSINESS, 2
	warp_event  8,  1, LUSTER_SKYSCRAPER_1_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  2,  5, SIGNPOST_UP, Skyscraper1FSign

	db 3 ; object events
	person_event SPRITE_RECEPTIONIST, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_1F_NPC1, -1
	person_event SPRITE_GENTLEMAN, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_1F_NPC2, -1
	person_event SPRITE_POKEFAN_M, 2, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterSkyscraper1_1F_NPC3, -1

	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_1_1F_NPC_1
	const LUSTER_SKYSCRAPER_1_1F_NPC_2
	const LUSTER_SKYSCRAPER_1_1F_NPC_3
	
	
LusterSkyscraper1_1F_NPC1:
	jumptextfaceplayer LusterSkyscraper1_1F_NPC1Text
	
LusterSkyscraper1_1F_NPC2:
	faceplayer
	opentext
	writetext LusterSkyscraper1_1F_NPC2Text
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1_1F_NPC_2, DOWN
	end
	
LusterSkyscraper1_1F_NPC3:
	jumptextfaceplayer LusterSkyscraper1_1F_NPC3Text
	
LusterSkyscraper1_1F_NPC1Text:
	text "Welcome to our"
	line "building."
	
	para "Do you have an"
	line "appointment with"
	cont "us today?"
	done
	
LusterSkyscraper1_1F_NPC2Text:
	text "I'm just here for"
	line "a meeting."
	
	para "I flew in at the"
	line "ONWA INTL. AIRPORT"
	cont "yesterday."
	done
	
LusterSkyscraper1_1F_NPC3Text:
	text "Man, these"
	line "buildings are"
	cont "huge."
	
	para "So many floors…"
	
	para "Which one do I"
	line "work on again?"
	done
	
Skyscraper1FSign:
	jumptext Skyscraper1FSignText
	
Skyscraper2FSign:
	jumptext Skyscraper2FSignText
	
Skyscraper3FSign:
	jumptext Skyscraper3FSignText
	
Skyscraper1FSignText:
	text "1st Floor"
	done
	
Skyscraper2FSignText:
	text "2nd Floor"
	done
	
Skyscraper3FSignText:
	text "3rd Floor"
	done