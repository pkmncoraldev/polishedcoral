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
	person_event SPRITE_MISC_BAGGAGE,  4,  7, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Luggage, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_VALVE_1,  3,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Easel2, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_LEAVES,  3,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Easel, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_LEAVES,  5,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Easel, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_LEAVES,  2,  6, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Luggage, EVENT_MINA_APARTMENT_EMPTY
	person_event SPRITE_MINA,  6,  4, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterApartment2_2F_Mina, EVENT_MINA_NOT_AT_HOME


LusterApartment2_2FCallback:
	checkevent EVENT_MINA_APARTMENT_EMPTY
	iftrue .empty
	changemap LusterApartmentMina_BlockData
	checkevent EVENT_DAILY_MINA_PAINTING_DONE
	iffalse .empty
	moveperson 2, -5, -5
.empty
	return
	
LusterApartment2_2F_Mina:
	faceplayer
	opentext TEXTBOX_MINA
	checkevent EVENT_GOT_LUCKY_EGG
	iftrue .already_got_lucky_egg
	writetext LusterApartment2_2F_MinaText1
	waitbutton
	changetextboxspeaker
	verbosegiveitem LUCKY_EGG
	iffalse .no_room
	setevent EVENT_GOT_LUCKY_EGG
	changetextboxspeaker TEXTBOX_MINA
	writetext LusterApartment2_2F_MinaText2
	yesorno
	iffalse .painting_no
	jump .do_painting
.already_got_lucky_egg
	checkevent EVENT_DAILY_MINA_PAINTING_DONE
	iftrue .done_painting_today
	writetext LusterApartment2_2F_MinaText6
	yesorno
	iffalse .painting_no
.do_painting
	writetext LusterApartment2_2F_MinaText7
	waitbutton
	changetextboxspeaker
	callasm LusterApartment2_2FMinaAsm
	iffalse .painting_no
	changetextboxspeaker TEXTBOX_MINA
	writetext LusterApartment2_2F_MinaText3
	waitbutton
	closetext
	pause 10
	special FadeOutPalettesBlack
	setevent EVENT_DAILY_MINA_PAINTING_DONE
	warp_stealth UP, LUSTER_APARTMENT_2_2F, 4, 5
	disappear 6
	moveperson 6, 4, 4
	appear 6
	spriteface 6, UP
	pause 20
	opentext
	writetext LusterApartment2_2F_PaintText
	farwritetext StdBlankText
	pause 6
	writetext LusterApartment2_2F_PaintText2
	playsound SFX_LEVEL_UP
	waitsfx
	closetext
	pause 20
	callasm LoadMapPals
	special FadeInPalettes
	
	pause 10
	applyonemovement 6, turn_step_down
	applyonemovement 6, remove_fixed_facing
	opentext TEXTBOX_MINA
	writetext LusterApartment2_2F_MinaText4
	waitbutton
	changetextboxspeaker
	setevent EVENT_DECO_POSTER_8
	writetext GiveMinasPaintingText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayMinasPaintingText
	waitbutton
	changetextboxspeaker TEXTBOX_MINA
	writetext LusterApartment2_2F_MinaText5
	waitbutton
	closetext
	end
.done_painting_today
	writetext LusterApartment2_2F_MinaText5
	waitbutton
	closetext
	end
.no_room
	changetextboxspeaker TEXTBOX_MINA
	writetext LusterApartment2_2F_NoRoomText
	waitbutton
	closetext
	end
.painting_no
	changetextboxspeaker TEXTBOX_MINA
	writetext LusterApartment2_2F_NoText
	waitbutton
	closetext
	end
	
GiveMinasPaintingText:
	text "<PLAYER> received"
	line "MINA's PAINTING!"
	done
	
PutAwayMinasPaintingText:
	text "MINA's PAINTING was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
LusterApartment2_2F_PaintText:
	text "A few lines here…"
	
	para "A splash of color"
	line "there…"
	
	para "1…<WAIT_M><WAIT_S> 2…<WAIT_M><WAIT_S> 3…<WAIT_L>"
	line "A<WAIT_S>a<WAIT_S>a<WAIT_S>a<WAIT_S>and…<WAIT_L>"
	done
	
LusterApartment2_2F_PaintText2:
	text "Done!"
	done
	
LusterApartment2_2F_MinaText1:
	text "Oh, <PLAYER>!"
	
	para "You came for that"
	line "visit after all!"
	
	para "You know, I've "
	line "traveled all over"
	cont "ONWA looking for"
	cont "inspiration,"
	
	para "and it seems like"
	line "wherever I went,"
	cont "you were there!"
	
	para "This whole trip"
	line "wouldn't have been"
	cont "the same if I had"
	cont "never met you."
	
	para "So thank you,"
	line "<PLAYER>."
	
	para "I want you to have"
	line "this as a token of"
	cont "our friendship."
	done
	
LusterApartment2_2F_MinaText2:
	text "Let your #MON"
	line "hold that, and"
	cont "it'll earn bonus"
	cont "experience points."
	
	para "It's super handy!"
	
	para "…"
	
	para "Oh!"
	
	para "While you're here,"
	line "why don't I paint"
	cont "you something?"
	
	para "How about one of"
	line "your #MON?"
	done
	
LusterApartment2_2F_MinaText3:
	text "Ok!<WAIT_S>"
	line "I'll get started!"
	done
	
LusterApartment2_2F_MinaText4:
	text "Here you go!"
	
	para "I think it turned"
	line "out great!"
	done
	
LusterApartment2_2F_MinaText5:
	text "Thanks for"
	line "stopping by!"
	
	para "Come back tomorrow"
	line "and I'll paint for"
	cont "you again!"
	done
	
LusterApartment2_2F_MinaText6:
	text "Oh, <PLAYER>!"
	
	para "Make yourself at"
	line "home."
	
	para "While you're here,"
	line "why don't I paint"
	cont "you something?"
	
	para "How about one of"
	line "your #MON?"
	done
	done
	
LusterApartment2_2F_MinaText7:
	text "Who should I"
	line "paint?"
	done
	
LusterApartment2_2F_NoRoomText:
	text "Oh! You're carrying"
	line "too much!"
	
	para "Make some room and"
	line "come back later."
	done
	
LusterApartment2_2F_NoText:
	text "No?<WAIT_S>"
	line "Aww… Ok."
	
	para "Maybe next time."
	done
	
LusterApartment2_2FMinaAsm:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wMinaPaintingMonSpecies], a
	
	ld a, [wCurForm]
	ld [wMinaPaintingMonForm], a
	
	ld hl, wPartyMonNicknames
	ld a, PARTYMON
	ld [wMonType], a
	ld a, [wCurPartyMon]
	call GetNick
	ld hl, wMinaPaintingMonNick
	call CopyName2
	farcall GetShininess
;	ld a, b
	ld [wMinaPaintingMonShiny], a
	
	ld a, TRUE
	ld [wScriptVar], a
	ret
.cancel
	ld a, FALSE
	ld [wScriptVar], a
	ret
	
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
	checkevent EVENT_DONE_MT_ONWA_MINA
	iftrue .mt_onwa
	writetext LusterApartment2_2FJournalTextCliff
	jump .cont6
.mt_onwa
	writetext LusterApartment2_2FJournalTextCliffDone
.cont6
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_ROUTE_10_MINA
	iftrue .route_10
	writetext LusterApartment2_2FJournalTextSnow
	jump .cont1
.route_10
	writetext LusterApartment2_2FJournalTextSnowDone
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
	checkevent EVENT_DONE_ROUTE_31_MINA
	iftrue .route_29
	writetext LusterApartment2_2FJournalTextField
	jump .cont4
.route_29
	writetext LusterApartment2_2FJournalTextFieldDone
.cont4
	waitbutton
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_DONE_ROUTE_6_MINA
	iftrue .route_6
	writetext LusterApartment2_2FJournalTextIsland
	jump .cont5
.route_6
	writetext LusterApartment2_2FJournalTextIslandDone
.cont5
	waitbutton
	closetext
	setevent EVENT_READ_MINAS_JOURNAL
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_JOURNAL
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_6
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_11
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_RADIANT_FIELD
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_31
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_10
	end
.no
	writetext LusterApartment2_2FJournalNo
	waitbutton
	closetext
	end
	
LoadCheckMarkAsm:
	farjp _LoadCheckMark
	
LusterApartment2_2FJournalText1:
	text "A diary."
	
	para "Read it?"
	done
	
LusterApartment2_2FJournalText2:
	text "Who wouldn't?"
	
	para "…"
	
	para "★MINA's JOURNAL★"
	line "!NOT! a diary!"
	
	para "♥List of spots to"
	line "visit in ONWA♥"
	
	para "✓A pretty pink"
	line "grove."
	done
	
LusterApartment2_2FJournalTextCliff:
	text "-A gorgeous view"
	line "from a cliff on"
	cont "a tall mountain."
	done
	
LusterApartment2_2FJournalTextCliffDone:
	text "✓A gorgeous view"
	line "from a cliff on"
	cont "a tall mountain."
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
	line "to the SOUTH."
	done
	
LusterApartment2_2FJournalTextFieldDone:
	text "✓A quiet field far"
	line "to the SOUTH."
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
	