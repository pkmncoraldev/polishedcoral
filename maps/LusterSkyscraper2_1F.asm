LusterSkyscraper2_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  2,  7, LUSTER_CITY_BUSINESS, 3
	warp_event  3,  7, LUSTER_CITY_BUSINESS, 4
	warp_event  8,  1, LUSTER_SKYSCRAPER_2_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  2,  5, SIGNPOST_UP, Skyscraper1FSign

	db 3 ; object events
	person_event SPRITE_RECEPTIONIST, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_1F_NPC1, -1
	person_event SPRITE_BATTLE_GIRL, 5, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_1F_NPC2, -1
	person_event SPRITE_POKEMANIAC, 7, 5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper2_1F_NPC3, -1
	
	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_2_1F_NPC_1
	const LUSTER_SKYSCRAPER_2_1F_NPC_2
	const LUSTER_SKYSCRAPER_2_1F_NPC_3
	
	
LusterSkyscraper2_1F_NPC1:
	jumptextfaceplayer LusterSkyscraper1_1F_NPC1Text

LusterSkyscraper2_1F_NPC2:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW
	iftrue .got_item
	writetext LusterSkyscraper2_1F_NPC2Text1
	waitbutton
	verbosegiveitem PINK_BOW
	writetext LusterSkyscraper2_1F_NPC2Text2
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_2_1F_NPC_2, DOWN
	setevent EVENT_GOT_PINK_BOW
	end
.got_item
	writetext LusterSkyscraper2_1F_NPC2Text2
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_2_1F_NPC_2, DOWN
	end
	
LusterSkyscraper2_1F_NPC3:
	jumptextfaceplayer LusterSkyscraper2_1F_NPC3Text
	
LusterSkyscraper2_1F_NPC2Text1:
	text "I'm waiting for an"
	line "interview!"
	
	para "I can't wait to get"
	line "a job!"
	
	para "Here, why don't you"
	line "take this?"
	done
	
LusterSkyscraper2_1F_NPC2Text2:
	text "Give that to your"
	line "#MON to power"
	cont "their FAIRY-type"
	cont "moves up."
	
	para "I don't need it"
	line "anymore."
	
	para "It's not part of"
	line "the dress code…"
	done
	
LusterSkyscraper2_1F_NPC3Text:
	text "Do you work here?"
	
	para "You don't look like"
	line "you work here."
	done