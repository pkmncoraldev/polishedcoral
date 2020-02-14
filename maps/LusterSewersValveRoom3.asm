LusterSewersValveRoom3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  3, 3, LUSTER_SEWERS_B2F_FLOODED
	warp_def  5,  4, 3, LUSTER_SEWERS_B2F_FLOODED
	
	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_VALVE_1,  1,  3, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSewersValveRoom3Valve, -1
	person_event SPRITE_VALVE_2,  1,  3, SPRITEMOVEDATA_VALVE, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSewersValveRoom3Valve, -1

	const_def 1 ; object constants
	const LUSTER_SEWERS_VALVE_ROOM_3_VALVE_1
	const LUSTER_SEWERS_VALVE_ROOM_3_VALVE_2

LusterSewersValveRoom3Valve:
	opentext
	writetext LusterSewersValveRoomValveAskTurnText
	yesorno
	iffalse .no
	writetext LusterSewersValveRoomValveTurnText
	waitbutton
	closetext
	pause 3
	disappear LUSTER_SEWERS_VALVE_ROOM_3_VALVE_1
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_3_VALVE_1
	closetext
	pause 14
	closetext
	disappear LUSTER_SEWERS_VALVE_ROOM_3_VALVE_1
	playsound SFX_SQUEAK
	pause 14
	closetext
	appear LUSTER_SEWERS_VALVE_ROOM_3_VALVE_1
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
	iftrue .turnoff
	setevent EVENT_LUSTER_SEWERS_EMPTY
	end
.turnoff
	clearevent EVENT_LUSTER_SEWERS_EMPTY
	end
.no
	writetext LusterSewersValveRoomValveNoText
	waitbutton
	closetext
	end