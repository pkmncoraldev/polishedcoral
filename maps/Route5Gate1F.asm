Route5Gate1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_def  0, 11, 1, ROUTE_5
	warp_def  0, 12, 2, ROUTE_5
	warp_def  7, 11, 1, ROUTE_6
	warp_def  7, 12, 1, ROUTE_6
	warp_def  2,  0, 1, ROUTE_5_GATE_2F

	db 0 ; coord events

	db 2 ; bg events
	signpost  4,  8, SIGNPOST_READ, Route5Gate1FSign1
	signpost  2,  1, SIGNPOST_READ, Route5Gate1FSign2

	db 6 ; object events
	person_event SPRITE_OFFICER,  3, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19ab0b, -1
	object_event  6,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_REFRESHMENTS, MART_ROUTE_5_GATE, -1
	person_event SPRITE_POKEMANIAC,  7,  3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC1, -1
	person_event SPRITE_CAMPER,  2, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC2, -1
	person_event SPRITE_HIKER,  4, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC3, -1
	object_event  7,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_COMMAND, trade, TRADE_WITH_JAKE_FOR_PINSIR, -1

	const_def 1 ; object constants
	const ROUTE5GATE_OFFICER
	const ROUTE5GATE_CLERK
	const ROUTE5GATE_NPC1
	
OfficerScript_0x19ab0b:
	faceplayer
	opentext
	writetext UnknownText_0x19ab1f
	waitbutton
	closetext
	end

Route5Gate1FNPC1
	faceplayer
	opentext
	writetext Route5Gate1FNPC1Text
	waitbutton
	closetext
	spriteface ROUTE5GATE_NPC1, UP
	end
	
Route5Gate1FNPC2:
	jumptextfaceplayer Route5Gate1FNPC2Text
	
Route5Gate1FNPC3:
	jumptextfaceplayer Route5Gate1FNPC3Text
	
Route5Gate1FNPC4:
	end
	
Route5Gate1FSign1:
	jumptext Route5Gate1FSign1Text
	
Route5Gate1FSign2:
	jumptext Route5Gate1FSign2Text
	
Route5Gate1FPinsir:
	opentext
	writetext Route5Gate1FPinsirText1
	cry PINSIR
	waitsfx
	buttonsound
	writetext Route5Gate1FPinsirText2
	waitbutton
	closetext
	end
	
Route5Gate1FScyther:
	opentext
	writetext Route5Gate1FScytherText1
	cry SCYTHER
	waitsfx
	buttonsound
	writetext Route5Gate1FScytherText2
	waitbutton
	closetext
	end
	
Route5Gate1FPinsirText1:
	text "PINSIR:"
	line "PIN-SAAAH"
	done
	
Route5Gate1FPinsirText2:
	text "It gnashes it's"
	line "teeth!"
	done
	
Route5Gate1FScytherText1:
	text_from_ram wTradeScytherName
	text ":"
	line "SCY-THAAAH!"
	done
	
Route5Gate1FScytherText2:
	text_from_ram wTradeScytherName
	text " looks"
	line "happy to see you!"
	done
	
Route5Gate1FSign1Text:
	text "Refreshments"
	done
	
Route5Gate1FSign2Text:
	text "2ND FLOOR:"
	line "Viewing Platform"
	done
	
Route5Gate1FNPC1Text:
	text "The girl at the"
	line "REFRESHMENTS STALL"
	cont "sure is pretty!"
	
	para "She's kind of an"
	line "airhead, though."
	
	para "She accidentally"
	line "gave me some extra"
	cont "food!"
	done
	
Route5Gate1FNPC2Text:
	text "I sure am glad"
	line "there's a rest stop"
	cont "here."
	
	para "This road is long"
	line "and I'm tired!"
	done
	
Route5Gate1FNPC3Text:
	text "You'd be smart to"
	line "stop and take a"
	cont "break!"
	
	para "Plenty more road"
	line "ahead of ya!"
	done
	
UnknownText_0x19ab1f:
	text "SOUTH of here is"
	line "SUNBEAM ISLAND."

	para "The #MON PROF."
	line "conductes his"
	cont "research on the"
	cont "island."
	done