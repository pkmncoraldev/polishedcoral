LusterApartment2_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterApartment2_2FCallback

	db 1 ; warp events
	warp_def 1, 1, 3, LUSTER_APARTMENT_2_1F

	db 0 ; coord events

	db 4 ; bg events
	signpost  2,  6, SIGNPOST_IFNOTSET, LusterApartment2_2FPainting
	signpost  5,  7, SIGNPOST_IFNOTSET, LusterApartment2_2FJournal
	signpost  3,  7, SIGNPOST_IFNOTSET, LusterApartment2_2FShelf
	signpost  7,  6, SIGNPOST_IFNOTSET, LusterApartment2_2FFlowers

	db 6 ; object events
	person_event SPRITE_MISC_BAGGAGE,  4,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Luggage, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_VALVE_1,  3,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Easel2, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_LEAVES,  3,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Easel, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_LEAVES,  5,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Easel, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_LEAVES,  2,  6, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Luggage, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_MINA,  6,  4, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Mina, EVENT_MINA_NOT_AT_HOME


LusterApartment2_2FCallback:
	checkevent EVENT_MINA_APARTMENT_EMPTY
	iftrue .empty
	changemap LusterApartmentMina_BlockData
.empty
	return
	
LusterApartment2_2F_Mina:
	jumptextfaceplayer LusterApartment2_2F_MinaText
	
LusterApartment2_2F_MinaText:
	text "Hi, <PLAYER>."
	done
	
LusterApartment2_2FJournal:
	dw EVENT_MINA_APARTMENT_EMPTY
	checkevent EVENT_READ_MINAS_JOURNAL
	iftrue .read
	opentext
	writetext LusterApartment2_2FJournalText1
	jump .cont
.read
	opentext
	writetext LusterApartment2_2FJournalText3
.cont
	yesorno
	iffalse .no
	callasm LoadCheckMarkAsm
	writetext LusterApartment2_2FJournalText2
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_ROUTE_6_MINA
	iftrue .route_6
	writetext LusterApartment2_2FJournalTextIsland
	jump .cont1
.route_6
	writetext LusterApartment2_2FJournalTextIslandDone
.cont1
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_ROUTE_11_MINA
	iftrue .route_11
	writetext LusterApartment2_2FJournalTextBridge
	jump .cont2
.route_11
	writetext LusterApartment2_2FJournalTextBridgeDone
.cont2
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_RADIANT_FIELD_MINA
	iftrue .radiant
	writetext LusterApartment2_2FJournalTextSunflowers
	jump .cont3
.radiant
	writetext LusterApartment2_2FJournalTextSunflowersDone
.cont3
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_ROUTE_29_MINA
	iftrue .route_29
	writetext LusterApartment2_2FJournalTextField
	jump .cont4
.route_29
	writetext LusterApartment2_2FJournalTextFieldDone
.cont4
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_ROUTE_10_MINA
	iftrue .route_10
	writetext LusterApartment2_2FJournalTextSnow
	jump .cont5
.route_10
	writetext LusterApartment2_2FJournalTextSnowDone
.cont5
	waitbutton
	closetext
	setevent EVENT_READ_MINAS_JOURNAL
	checkevent EVENT_MINA_QUEST_ACTIVATED
	iftrue .end
	domaptrigger ROUTE_6_SOUTH, $1
	clearevent EVENT_ROUTE_6_MINA_GONE
	clearevent EVENT_ROUTE_11_MINA_GONE
	clearevent EVENT_RADIANT_FIELD_MINA_GONE
	clearevent EVENT_ROUTE_29_MINA_GONE
	clearevent EVENT_ROUTE_10_MINA_GONE
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_JOURNAL
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_6
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_11
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_RADIANT_FIELD
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_29
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_10
	setevent EVENT_MINA_QUEST_ACTIVATED
.end
	end
.no
	writetext LusterApartment2_2FJournalNo
	waitbutton
	closetext
	end
	
LoadCheckMarkAsm:
	farcall MakeCheckMarkGreen
	farjp _LoadCheckMark
	
LusterApartment2_2FJournalText1:
	text "A diary."
	
	para "Read it?"
	done
	
LusterApartment2_2FJournalText2:
	text "Who wouldn't?"
	
	para "…"
	
	para "♥MINA's JOURNAL♥"
	line "!!NOT!! a diary!"
	
	para "★List of spots to"
	line "visit in ONWA★"
	
	para "✓A pretty pink"
	line "grove."
	done
	
LusterApartment2_2FJournalTextIsland:
	text "-A little island"
	line "in the sea NORTH"
	cont "of SUNBEAM ISLAND."
	done
	
LusterApartment2_2FJournalTextIslandDone:
	text "✓A little island"
	line "in the sea NORTH"
	cont "of SUNBEAM ISLAND."
	done
	
LusterApartment2_2FJournalTextBridge:
	text "-A newly built"
	line "bridge."
	done
	
LusterApartment2_2FJournalTextBridgeDone:
	text "✓A newly built"
	line "bridge."
	done
	
LusterApartment2_2FJournalTextSunflowers:
	text "-A place where"
	line "sunflowers grow."
	done
	
LusterApartment2_2FJournalTextSunflowersDone:
	text "✓A place where"
	line "sunflowers grow."
	done
	
LusterApartment2_2FJournalTextField:
	text "-A quiet field far"
	line "to the SOUTHEAST."
	done
	
LusterApartment2_2FJournalTextFieldDone:
	text "✓A quiet field far"
	line "to the SOUTHEAST."
	done
	
LusterApartment2_2FJournalTextSnow:
	text "-A hill in a"
	line "snowy tundra."
	done
	
LusterApartment2_2FJournalTextSnowDone:
	text "✓A hill in a"
	line "snowy tundra."
	done
	
LusterApartment2_2FJournalText3:
	text "A journal,"
	line "not a diary."
	
	para "Read it?"
	done
	
LusterApartment2_2FJournalNo:
	text "Better not…"
	done
	
LusterApartment2_2F_Easel:
	jumptext LusterApartment2_2F_EaselText
	
LusterApartment2_2F_Easel2:
	jumptext LusterApartment2_2F_Easel2Text
	
LusterApartment2_2FPainting:
	dw EVENT_MINA_APARTMENT_EMPTY
	jumptext LusterApartment2_2FPaintingText
	
LusterApartment2_2F_Luggage:
	jumptext LusterApartment2_2F_LuggageText
	
LusterApartment2_2FShelf:
	dw EVENT_MINA_APARTMENT_EMPTY
	jumptext LusterApartment2_2FShelfText
	
LusterApartment2_2FFlowers:
	dw EVENT_MINA_APARTMENT_EMPTY
	jumptext LusterApartment2_2FFlowersText
	
LusterApartment2_2FPaintingText:
	text "“SMEARGLE"
	line "in Love”."
	done
	
LusterApartment2_2F_LuggageText:
	text "A neatly packed"
	line "suitcase."
	done
	
LusterApartment2_2F_EaselText:
	text "An empty easel."
	done
	
LusterApartment2_2F_Easel2Text:
	text "A blank canvas."
	done
	
LusterApartment2_2FShelfText:
	text "A shelf stocked"
	line "with art supplies."
	done
	
LusterApartment2_2FFlowersText:
	text "Some pretty"
	line "flowers."
	
	para "Almost as pretty"
	line "as MOM's back home."
	
	para "Almost…"
	done
	