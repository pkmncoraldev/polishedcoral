Route11Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route11GateCallback

	db 4 ; warp events
	warp_event  3,  0, ROUTE_9, 4
	warp_event  4,  0, ROUTE_9, 5
	warp_def  7,  3, 255, ROUTE_11
	warp_def  7,  4, 255, ROUTE_11

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11GateOfficer, -1
	person_event SPRITE_CUTE_GIRL,  4,  5, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11NPCs, EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	person_event SPRITE_POKEMANIAC,  3,  5, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route11NPCs, EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, trade, TRADE_WITH_BILL_FOR_FLITTLE, EVENT_ROUTE_11_BRIDGE_NOT_BUILT

	const_def 1 ; object constants
	const ROUTE_11_GATE_OFFICER

Route11GateCallback:
	checkevent EVENT_ROUTE_11_BRIDGE_BUILT
	iffalse .no_bridge
	warpmod 1, ROUTE_11_2
	return
.no_bridge
	warpmod 1, ROUTE_11
	return
	
Route11GateOfficer:
	checkevent EVENT_ROUTE_11_BRIDGE_BUILT
	iffalse .no_bridge
	jumptextfaceplayer Route11GateOfficerText2
.no_bridge
	jumptext Route11GateOfficerText

Route11GateOfficerText:
	text "Zzz…"
	done
	
Route11GateOfficerText2:
	text "Man, I used to be"
	line "able to catch a"
	cont "nap at work,"
	cont "it was so slow."
	
	para "Not anymore!"
	done
	
Route11NPCs:
	callasm Route11NPCsCheckDialog
	iftrue .done_trade
	applyonemovement 2, turn_step_up
	opentext TEXTBOX_GIRL
	writetext Route11NPCsText1
	waitbutton
	closetext
	pause 5
	applyonemovement 3, turn_step_down
	opentext TEXTBOX_GUY
	writetext Route11NPCsText2
	waitbutton
	closetext
	pause 5
	applyonemovement 2, turn_step_up
	opentext TEXTBOX_GIRL
	writetext Route11NPCsText3
	waitbutton
	closetext
	end
.done_trade
	applyonemovement 2, turn_step_up
	opentext TEXTBOX_GIRL
	writetext Route11NPCsText4
	waitbutton
	closetext
	pause 5
	applyonemovement 3, turn_step_down
	opentext TEXTBOX_GUY
	writetext Route11NPCsText5
	waitbutton
	closetext
	pause 5
	applyonemovement 2, turn_step_up
	opentext TEXTBOX_GIRL
	writetext Route11NPCsText3
	waitbutton
	closetext
	end
	
Route11NPCsText1:
	text "Check out that"
	line "guy over there."
	
	para "What a joke!"
	done
	
Route11NPCsText2:
	text "No kidding!"
	
	para "And look at his"
	line "#MON!"
	
	para "So girly and cute."
	
	para "A guy like that"
	line "will never be cool"
	cont "and mysterious!"
	done
	
Route11NPCsText3:
	text "So true!"
	done
	
Route11NPCsText4:
	text "Is it just me,"
	line "or does that guy"
	cont "over there seem"
	cont "a bit more…"
	
	para "I don't know…"
	
	para "Cool and"
	line "mysterious?"
	done
	
Route11NPCsText5:
	text "You know, I was"
	line "thinking the same"
	cont "thing."
	
	para "And his #MON…"
	
	para "So suave!"
	
	para "A debonaire dude"
	line "like him would"
	cont "never have a cute,"
	cont "girly #MON like"
	cont "FLITTLE!"
	done
	
Route11NPCsCheckDialog:
	ld hl, wTradeFlags
	ld c, TRADE_WITH_BILL_FOR_FLITTLE
	ld b, CHECK_FLAG
	predef FlagPredef
	ld a, c
	and a
	jp nz, .done_trade
	xor a
	ld [wScriptVar], a
	ret
.done_trade
	ld a, 1
	ld [wScriptVar], a
	ret
	