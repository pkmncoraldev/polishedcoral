LusterSkyscraper2_3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  6,  1, LUSTER_SKYSCRAPER_2_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  5, SIGNPOST_UP, Skyscraper3FSign

	db 7 ; object events
	person_event SPRITE_POKEMANIAC, 5, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_3F_NPC1, -1
	person_event SPRITE_POKEMANIAC, 7, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_3F_NPC2, -1
	person_event SPRITE_POKEMANIAC, 7, 0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_3F_NPC3, -1
	person_event SPRITE_SLOWPOKETAIL, 3, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 3, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL, 5, 0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_2_3F_NPC_1
	const LUSTER_SKYSCRAPER_2_3F_NPC_2
	const LUSTER_SKYSCRAPER_2_3F_NPC_3
	
	
LusterSkyscraper2_3F_NPC1:
	jumptext LusterSkyscraper_NPCText
;	faceplayer
;	opentext
;	writetext LusterSkyscraper2_3F_NPC1Text
;	waitbutton
;	closetext
;	spriteface LUSTER_SKYSCRAPER_2_3F_NPC_1, UP
;	end
	
LusterSkyscraper2_3F_NPC2:
	faceplayer
	opentext
	checkevent EVENT_GOT_ENERGYPOWDER_IN_SKYSCRAPER
	iftrue .got_item
	writetext LusterSkyscraper2_3F_NPC2Text1
	waitbutton
	verbosegiveitem ENERGYPOWDER
	iffalse .NoRoom
	setevent EVENT_GOT_ENERGYPOWDER_IN_SKYSCRAPER
.got_item
	writetext LusterSkyscraper2_3F_NPC2Text2
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_2_3F_NPC_2, UP
	end
.NoRoom
	writetext LusterSkyscraper2_3F_NPC2Text3
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_2_3F_NPC_2, UP
	end
	
LusterSkyscraper2_3F_NPC3:
	jumptext LusterSkyscraper_NPCText
;	faceplayer
;	opentext
;	writetext LusterSkyscraper2_3F_NPC3Text
;	waitbutton
;	closetext
;	spriteface LUSTER_SKYSCRAPER_2_3F_NPC_3, UP
;	end
	
;LusterSkyscraper2_3F_NPC1Text:
;	text "TEXT"
;	done
	
LusterSkyscraper2_3F_NPC2Text1:
	text "I tell ya, this"
	line "job is way too"
	cont "fast-paced, kid!"
	
	para "I wouldn't be able"
	line "too keep up if I"
	cont "didn't have my"
	cont "secret weapon."
	
	para "Here, take some!"
	done
	
LusterSkyscraper2_3F_NPC2Text2:
	text "That stuff has"
	line "gotten me through"
	cont "some long nights!"
	done
	
LusterSkyscraper2_3F_NPC2Text3:
	text "Oops!"
	
	para "You have no room!"
	
	para "Back to work!"
	done
	
;LusterSkyscraper2_3F_NPC3Text:
;	text "TEXT"
;	done
