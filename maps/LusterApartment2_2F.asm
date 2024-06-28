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
	closetext
	setevent EVENT_READ_MINAS_JOURNAL
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
	line "visit in ONWA:★"
	
	para "✓A pretty pink"
	line "grove."
	
	para "-A little island"
	line "in the bright"
	cont "sunshine."
	
	para "-A newly built"
	line "bridge."
	
	para "-A place where"
	line "sunflowers grow."
	
	para "-A quiet field far"
	line "to the SOUTHEAST."
	
	para "-A hill in a"
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
	done
	