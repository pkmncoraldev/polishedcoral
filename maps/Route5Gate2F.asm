Route5Gate2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  2,  0, 5, ROUTE_5_GATE_1F

	db 0 ; coord events

	db 20 ; bg events
	signpost  6,  4, SIGNPOST_READ, Route5Gate2FBinoculars
	signpost  6,  6, SIGNPOST_READ, Route5Gate2FBinoculars
	signpost  0,  2, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  0,  4, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  0,  5, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  0,  6, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  7,  0, SIGNPOST_READ, Route5Gate2FWindow2
	signpost  7,  2, SIGNPOST_READ, Route5Gate2FWindow2
	signpost  7,  3, SIGNPOST_READ, Route5Gate2FWindow2
	signpost  7,  5, SIGNPOST_READ, Route5Gate2FWindow2
	signpost  7,  7, SIGNPOST_READ, Route5Gate2FWindow2
	signpost  2,  8, SIGNPOST_READ, Route5Gate2FWindow3
	signpost  3,  8, SIGNPOST_READ, Route5Gate2FWindow3
	signpost  4,  8, SIGNPOST_READ, Route5Gate2FWindow3
	signpost  5,  8, SIGNPOST_READ, Route5Gate2FWindow3
	signpost  6,  8, SIGNPOST_READ, Route5Gate2FWindow3
	signpost  3, -1, SIGNPOST_READ, Route5Gate2FWindow4
	signpost  4, -1, SIGNPOST_READ, Route5Gate2FWindow4
	signpost  5, -1, SIGNPOST_READ, Route5Gate2FWindow4
	signpost  6, -1, SIGNPOST_READ, Route5Gate2FWindow4

	db 13 ; object events
	person_event SPRITE_CUTE_GIRL,  5,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route5Gate2FNPC1, -1
	person_event SPRITE_CHILD,  6,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route5Gate2FNPC2, -1
	person_event SPRITE_GRANNY,  1,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route5Gate2FNPC3, -1
	person_event SPRITE_ROCKER,  3,  4, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route5Gate2FNPC4, -1
	object_event  3,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_COMMAND, trade, TRADE_WITH_JAKE_FOR_HERACROSS, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  5,  4, SPRITEMOVEDATA_BINOCULARS_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  5,  6, SPRITEMOVEDATA_BINOCULARS_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SUNBEAM_VIEW,  7,  4, SPRITEMOVEDATA_SUNBEAM_VIEW_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SUNBEAM_VIEW,  7,  3, SPRITEMOVEDATA_SUNBEAM_VIEW_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SUNBEAM_VIEW,  6,  3, SPRITEMOVEDATA_SUNBEAM_VIEW_3, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SUNBEAM_VIEW_CLOUDS,  4,  1, SPRITEMOVEDATA_SUNBEAM_VIEW_4, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SUNBEAM_VIEW_CLOUDS,  3,  6, SPRITEMOVEDATA_SUNBEAM_VIEW_5, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SUNBEAM_VIEW_CLOUDS,  2,  6, SPRITEMOVEDATA_SUNBEAM_VIEW_6, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	
	const_def 1 ; object constants
	const ROUTE_5_GATE_2F_NPC_1
	const ROUTE_5_GATE_2F_NPC_2
	const ROUTE_5_GATE_2F_NPC_3
	const ROUTE_5_GATE_2F_NPC_4
	const ROUTE_5_GATE_2F_NPC_5
	const ROUTE_5_GATE_2F_BINOCULARS_1
	const ROUTE_5_GATE_2F_BINOCULARS_2
	const ROUTE_5_GATE_2F_SUNBEAM_VIEW_1
	const ROUTE_5_GATE_2F_SUNBEAM_VIEW_2
	const ROUTE_5_GATE_2F_SUNBEAM_VIEW_3
	const ROUTE_5_GATE_2F_SUNBEAM_VIEW_4
	const ROUTE_5_GATE_2F_SUNBEAM_VIEW_5
	const ROUTE_5_GATE_2F_SUNBEAM_VIEW_6
	
Route5Gate2FBinoculars:
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	farjumptext WrongSideText
.YouAreFacingDown
	opentext
	special PlaceMoneyTopRight
	writetext Route5Gate2FBinocularsText
	yesorno
	iffalse .end
	checkmoney $0, 1
	if_equal $2, .no_money
	playsound SFX_TRANSACTION
	takemoney $0, 1
	special PlaceMoneyTopRight
	pause 20
	closetext
	pause 10
	opentext
	writetext Route5Gate2FBinocularsText2
	waitbutton
	closetext
	pause 10
	special FadeOutPalettesBlack
	callasm LowVolume
	applyonemovement PLAYER, hide_person
	applyonemovement ROUTE_5_GATE_2F_NPC_1, hide_person
	applyonemovement ROUTE_5_GATE_2F_NPC_2, hide_person
	applyonemovement ROUTE_5_GATE_2F_NPC_3, hide_person
	applyonemovement ROUTE_5_GATE_2F_NPC_4, hide_person
	applyonemovement ROUTE_5_GATE_2F_NPC_5, hide_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_1, hide_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_2, hide_person
	appear ROUTE_5_GATE_2F_SUNBEAM_VIEW_1
	appear ROUTE_5_GATE_2F_SUNBEAM_VIEW_2
	appear ROUTE_5_GATE_2F_SUNBEAM_VIEW_3
	appear ROUTE_5_GATE_2F_SUNBEAM_VIEW_4
	appear ROUTE_5_GATE_2F_SUNBEAM_VIEW_5
	changemap SunbeamView_BlockData
	checktime 1<<NITE
	iftrue .nite
	checktime 1<<DUSK
	iftrue .dusk
	checktime 1<<MORN
	iftrue .morn_dusk
	jump .skip
.dusk
	changemap SunbeamViewDusk_BlockData
.morn_dusk
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_5
	appear ROUTE_5_GATE_2F_SUNBEAM_VIEW_6
	jump .skip
.nite
	changemap SunbeamViewNite_BlockData
.skip
	reloadmappart
	callasm GenericFinishBridge
	loadvar wTimeOfDayPalFlags, $40 | 1
	callasm RTC
	special FadeInPalettes
.loop
	closetext
	pause 10
	waitbuttonsilent
	special FadeOutPalettesBlack
	loadvar wTimeOfDayPalFlags, $40 | 0
	changemap Route5Gate2F_BlockData
	reloadmappart
	callasm GenericFinishBridge
	applyonemovement PLAYER, show_person
	applyonemovement ROUTE_5_GATE_2F_NPC_1, show_person
	applyonemovement ROUTE_5_GATE_2F_NPC_2, show_person
	applyonemovement ROUTE_5_GATE_2F_NPC_3, show_person
	applyonemovement ROUTE_5_GATE_2F_NPC_4, show_person
	applyonemovement ROUTE_5_GATE_2F_NPC_5, show_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_1, show_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_2, show_person
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_1
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_2
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_3
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_4
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_5
	disappear ROUTE_5_GATE_2F_SUNBEAM_VIEW_6
	callasm RTC
	callasm MaxVolume
	special FadeInPalettes
	end
	
.end
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
.no_money
	writetext Route5Gate2FBinocularsNoMoneyText
	waitbutton
	closetext
	end
	
Route5Gate2FWindow1:
	jumptext Route5Gate2FWindow1Text
	
Route5Gate2FWindow2:
	jumptext Route5Gate2FWindow2Text
	
Route5Gate2FWindow3:
	jumptext Route5Gate2FWindow3Text
	
Route5Gate2FWindow4:
	jumptext Route5Gate2FWindow4Text
	
Route5Gate2FNPC1:
	jumptext Route5Gate2FNPC1Text
	
Route5Gate2FNPC2:
	faceplayer
	opentext
	writetext Route5Gate2FNPC2Text
	waitbutton
	closetext
	spriteface ROUTE_5_GATE_2F_NPC_2, DOWN
	end
	
Route5Gate2FNPC3:
	jumptextfaceplayer Route5Gate2FNPC3Text
	
Route5Gate2FNPC4:
	jumptextfaceplayer Route5Gate2FNPC4Text
	
Route5Gate2FWindow1Text:
	text "A nice view of"
	line "ROUTE 5!"
	done
	
Route5Gate2FWindow2Text:
	text "You can almost"
	line "make out SUNBEAM"
	cont "ISLAND through the"
	cont "window…"
	done
	
Route5Gate2FWindow3Text:
	text "Trees as far as"
	line "the eye can see!"
	done
	
Route5Gate2FWindow4Text:
	text "You can see a lake"
	line "and a great big"
	cont "mountain in the"
	cont "distance."
	done
	
Route5Gate2FNPC1Text:
	text "Oh wow!"
	
	para "So THAT's SUNBEAM"
	line "ISLAND!"
	done
	
Route5Gate2FNPC2Text:
	text "Wooooah!"
	
	para "We're so high up!"
	
	para "Looking down out"
	line "of the window is"
	cont "making me dizzy!"
	done
	
Route5Gate2FNPC3Text:
	text "Getting up here"
	line "is a lot of hard"
	cont "work at my age…"
	
	para "But, you can't"
	line "beat this view!"
	done
	
Route5Gate2FNPC4Text:
	text "There are windows"
	line "on every side of"
	cont "this room."
	
	para "I can't decide"
	line "which one to stare"
	cont "out of!"
	done
	
Route5Gate2FBinocularsText:
	text "A pair of"
	line "BINOCULARS are"
	cont "facing out the"
	cont "window!"
	
	para "Put in ¥1?"
	done
	
Route5Gate2FBinocularsText2:
	text "<PLAYER> looked"
	line "through the BINO-"
	cont "CULARS!"
	done
	
Route5Gate2FBinocularsNoMoneyText:
	text "Too rich fo your"
	line "blood!"
	done