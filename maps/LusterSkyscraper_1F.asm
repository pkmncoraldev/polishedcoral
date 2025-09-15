LusterSkyscraper_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  2,  7, LUSTER_CITY_BUSINESS, 1
	warp_event  3,  7, LUSTER_CITY_BUSINESS, 2
	warp_event  8,  1, LUSTER_SKYSCRAPER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  2,  5, SIGNPOST_UP, Skyscraper1FSign

	db 3 ; object events
	person_event SPRITE_RECEPTIONIST, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSkyscraper_1F_NPC1, -1
	person_event SPRITE_GENTLEMAN, 2, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterSkyscraper_1F_NPC2, -1
	person_event SPRITE_PONYTAIL, 5, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSkyscraper_1F_NPC3, -1

	const_def 1 ; object constants
	const LUSTER_SKYSCRAPER_1F_NPC_1
	const LUSTER_SKYSCRAPER_1F_NPC_2
	const LUSTER_SKYSCRAPER_1F_NPC_3
	
	
LusterSkyscraper_1F_NPC1:
	jumptextfaceplayer LusterSkyscraper_1F_NPC1Text
	
LusterSkyscraper_1F_NPC1Text:
	text "Welcome to our"
	line "building."
	
	para "Do you have an"
	line "appointment with"
	cont "us today?"
	done
	
LusterSkyscraper_1F_NPC2:
	faceplayer
	opentext
	writetext LusterSkyscraper_1F_NPC2Text
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1F_NPC_2, DOWN
	end
	
LusterSkyscraper_1F_NPC2Text:
	text "I'm just here for"
	line "a meeting."
	
	para "I flew in at the"
	line "ONWA INTL. AIRPORT"
	cont "yesterday."
	done
	
LusterSkyscraper_1F_NPC3:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW
	iftrue .got_item
	writetext LusterSkyscraper_1F_NPC3Text1
	waitbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext LusterSkyscraper_1F_NPC3Text2
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1F_NPC_3, DOWN
	setevent EVENT_GOT_PINK_BOW
	end
.got_item
	writetext LusterSkyscraper_1F_NPC3Text2
	jump .end
.NoRoom
	writetext LusterSkyscraper_1F_NPC3NoRoomText
.end
	waitbutton
	closetext
	spriteface LUSTER_SKYSCRAPER_1F_NPC_3, DOWN
	end
	
LusterSkyscraper_1F_NPC3Text1:
	text "I'm waiting for an"
	line "interview!"
	
	para "I can't wait to get"
	line "a job!"
	
	para "Here, why don't you"
	line "take this?"
	done
	
LusterSkyscraper_1F_NPC3Text2:
	text "Give that to your"
	line "#MON to power"
	cont "their FAIRY-type"
	cont "moves up."
	
	para "I don't need it"
	line "anymore."
	
	para "It's not part of"
	line "the dress code."
	done
	
LusterSkyscraper_1F_NPC3NoRoomText:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	done
	
Skyscraper1FSign:
	jumptext Skyscraper1FSignText
	
Skyscraper2FSign:
	jumptext Skyscraper2FSignText
	
Skyscraper3FSign:
	jumptext Skyscraper3FSignText
	
Skyscraper4FSign:
	jumptext Skyscraper4FSignText
	
Skyscraper5FSign:
	jumptext Skyscraper5FSignText
	
Skyscraper1FSignText:
	text "1st Floor"
	done
	
Skyscraper2FSignText:
	text "2nd Floor"
	done
	
Skyscraper3FSignText:
	text "3rd Floor"
	done
	
Skyscraper4FSignText:
	text "4th Floor"
	done
	
Skyscraper5FSignText:
	text "5th Floor"
	done