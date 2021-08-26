LusterSewersValveRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 6 ; warp events
	warp_def  5,  3, 2, LUSTER_SEWERS_B1F
	warp_def  5,  4, 2, LUSTER_SEWERS_B1F
	warp_def  5, 15, 2, LUSTER_SEWERS_B2F
	warp_def  5, 16, 2, LUSTER_SEWERS_B2F
	warp_def  5, 27, 4, LUSTER_SEWERS_B1F
	warp_def  5, 28, 4, LUSTER_SEWERS_B1F
	
	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_VALVE_1,  1,  3, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSewersValveRoomValve1, -1
	person_event SPRITE_VALVE_2,  1,  3, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_VALVE_1,  1, 15, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSewersValveRoomValve2, -1
	person_event SPRITE_VALVE_2,  1, 15, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_VALVE_1,  1, 27, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSewersValveRoomValve3, -1
	person_event SPRITE_VALVE_2,  1, 27, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1

	const_def 1 ; object constants
	const LUSTER_SEWERS_VALVE_ROOM_VALVE_1
	const LUSTER_SEWERS_VALVE_ROOM_VALVE_2
	const LUSTER_SEWERS_VALVE_ROOM_VALVE_3
	const LUSTER_SEWERS_VALVE_ROOM_VALVE_4
	const LUSTER_SEWERS_VALVE_ROOM_VALVE_5
	const LUSTER_SEWERS_VALVE_ROOM_VALVE_6
	
LusterSewersValveRoomValve1:
	opentext
	writetext LusterSewersValveRoomValveAskTurnText
	yesorno
	iffalse LusterSewersValveRoomValveNo
	writetext LusterSewersValveRoomValveTurnText
	waitbutton
	closetext
	pause 3
	disappear LUSTER_SEWERS_VALVE_ROOM_VALVE_1
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_VALVE_1
	closetext
	pause 14
	closetext
	disappear LUSTER_SEWERS_VALVE_ROOM_VALVE_1
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_VALVE_1
	closetext
	pause 7
	closetext
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 15
	opentext
	writetext LusterSewersValveRoomWaterRushText
	waitbutton
	closetext
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iftrue LusterSewersValveRoomValveTurnOff
	setevent EVENT_LUSTER_SEWERS_EMPTY
	clearevent EVENT_LUSTER_SEWERS_FLOODED
	end
	
LusterSewersValveRoomValve2:
	opentext
	writetext LusterSewersValveRoomValveAskTurnText
	yesorno
	iffalse LusterSewersValveRoomValveNo
	writetext LusterSewersValveRoomValveTurnText
	waitbutton
	closetext
	pause 3
	disappear LUSTER_SEWERS_VALVE_ROOM_VALVE_3
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_VALVE_3
	closetext
	pause 14
	closetext
	disappear LUSTER_SEWERS_VALVE_ROOM_VALVE_3
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_VALVE_3
	closetext
	pause 7
	closetext
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 15
	opentext
	writetext LusterSewersValveRoomWaterRushText
	waitbutton
	closetext
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iftrue LusterSewersValveRoomValveTurnOff
	setevent EVENT_LUSTER_SEWERS_EMPTY
	clearevent EVENT_LUSTER_SEWERS_FLOODED
	end
	
LusterSewersValveRoomValve3:
	opentext
	writetext LusterSewersValveRoomValveAskTurnText
	yesorno
	iffalse LusterSewersValveRoomValveNo
	writetext LusterSewersValveRoomValveTurnText
	waitbutton
	closetext
	pause 3
	disappear LUSTER_SEWERS_VALVE_ROOM_VALVE_5
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_VALVE_5
	closetext
	pause 14
	closetext
	disappear LUSTER_SEWERS_VALVE_ROOM_VALVE_5
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_VALVE_5
	closetext
	pause 7
	closetext
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 15
	opentext
	writetext LusterSewersValveRoomWaterRushText
	waitbutton
	closetext
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iftrue LusterSewersValveRoomValveTurnOff
	setevent EVENT_LUSTER_SEWERS_EMPTY
	clearevent EVENT_LUSTER_SEWERS_FLOODED
	end
	
LusterSewersValveRoomValveTurnOff:
	clearevent EVENT_LUSTER_SEWERS_EMPTY
	setevent EVENT_LUSTER_SEWERS_FLOODED
	end
LusterSewersValveRoomValveNo:
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
LusterSewersValveRoomValveAskTurnText:
	text "Some kind of"
	line "valve."
	
	para "Try turning it?"
	done
	
LusterSewersValveRoomValveTurnText:
	text "<PLAYER> turned"
	line "the VALVE."
	done
	
LusterSewersValveRoomWaterRushText:
	text "The sound of"
	line "rushing water was"
	cont "heard from the"
	cont "other room."
	done