Route5Gate2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  2,  0, 5, ROUTE_5_GATE_1F

	db 0 ; coord events

	db 7 ; bg events
	signpost  5,  4, SIGNPOST_READ, Route5Gate2FBinoculars
	signpost  0,  3, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  0,  4, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  0,  5, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  0,  6, SIGNPOST_READ, Route5Gate2FWindow1
	signpost  6,  3, SIGNPOST_READ, Route5Gate2FWindow2
	signpost  6,  5, SIGNPOST_READ, Route5Gate2FWindow2

	db 3 ; object events
	person_event SPRITE_CUTE_GIRL,  4,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route5Gate2FNPC1, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  4,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  4,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	
	const_def 1 ; object constants
	const ROUTE_5_GATE_2F_NPC_1
	const ROUTE_5_GATE_2F_BINOCULARS_1
	const ROUTE_5_GATE_2F_BINOCULARS_2
	
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
	special Special_FadeBlackQuickly
	applyonemovement PLAYER, hide_person
	applyonemovement ROUTE_5_GATE_2F_NPC_1, hide_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_1, hide_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_2, hide_person
	changemap SunbeamView_BlockData
	reloadmappart
	callasm RefreshScreen_BridgeUpdate
	special Special_FadeInQuickly
	pause 40
	opentext
	writetext Route5Gate2FBinocularsSunbeamText
	waitbutton
.loop
	closetext
	pause 10
	waitbutton
	opentext
	writetext Route5Gate2FBinocularsQuitText
	yesorno
	iffalse .loop
	closetext
	special Special_FadeBlackQuickly
	changemap Route5Gate2F_BlockData
	reloadmappart
	callasm RefreshScreen_BridgeUpdate
	applyonemovement PLAYER, show_person
	applyonemovement ROUTE_5_GATE_2F_NPC_1, show_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_1, show_person
	applyonemovement ROUTE_5_GATE_2F_BINOCULARS_2, show_person
	special Special_FadeInQuickly
	end
	
.end
	writetext Route5Gate2FBinocularsNoText
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
	
Route5Gate2FNPC1:
	jumptext Route5Gate2FNPC1Text
	
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
	
Route5Gate2FNPC1Text:
	text "Oh wow!"
	
	para "So THAT's SUNBEAM"
	line "ISLAND!"
	done
	
Route5Gate2FBinocularsSunbeamText:
	text "Hey!"
	
	para "There's SUNBEAM"
	line "ISLAND!"
	done
	
Route5Gate2FBinocularsQuitText:
	text "Stop looking?"
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
	
Route5Gate2FBinocularsNoText:
	text "Better not…"
	done
	
Route5Gate2FBinocularsNoMoneyText:
	text "Too rich fo your"
	line "blood!"
	done