Airport_MapScriptHeader:
	db 2 ; scene scripts
	scene_script AirportTrigger0
	scene_script AirportTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AirportCallback

	db 2 ; warp events
	warp_event  6, 15, ONWA_INTL_AIRPORT, 3
	warp_event  7, 15, ONWA_INTL_AIRPORT, 4

	db 4 ; coord events
	coord_event  7,  9, 0, AirportStopYou
	coord_event  3,  9, 0, AirportStopYou
	coord_event  7,  8, 1, AirportXRay
	coord_event  3,  8, 1, AirportXRay

	db 3 ; bg events
	signpost 13,  4, SIGNPOST_READ, AirportNpc1
	signpost 13,  6, SIGNPOST_READ, AirportNpc3
	signpost 13,  8, SIGNPOST_READ, AirportNpc5

	db 8 ; object events
	person_event SPRITE_RECEPTIONIST, 13,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AirportReceptionist, -1
	person_event SPRITE_RECEPTIONIST,  1,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AirportGateGirl, -1
	person_event SPRITE_RECEPTIONIST,  9,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AirportXRayGirl, -1
	person_event SPRITE_BIRD_KEEPER, 13,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AirportNpc2, -1
	person_event SPRITE_GENTLEMAN, 13,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AirportNpc4, -1
	person_event SPRITE_CUTE_GIRL, 13,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, AirportNpc6, -1
	person_event SPRITE_BEAUTY, 11, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AirportNpc7, -1
	object_event 11,  8, SPRITE_BAGGAGE, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1


	const_def 1 ; object constants
	const AIRPORT_RECEPTIONIST
	const AIRPORT_GATE_GIRL
	const AIRPORT_X_RAY_GIRL
	const AIRPORT_NPC_2
	const AIRPORT_NPC_4
	const AIRPORT_NPC_6
	const AIRPORT_NPC_7
	const AIRPORT_BAGGAGE
	
	
AirportCallback:
	setevent EVENT_AIRPORT_LUGGAGE_1
	clearevent EVENT_AIRPORT_LUGGAGE_2
	clearevent EVENT_AIRPORT_LUGGAGE_3
	clearevent EVENT_AIRPORT_LUGGAGE_4
	clearevent EVENT_AIRPORT_SLOWPOKE
	variablesprite SPRITE_BAGGAGE, SPRITE_ICE_BLOCK
	callasm AirportBaggageAsm
	return
	
AirportTrigger0:
AirportTrigger1:
AirportTrigger2:
	callasm AiportTriggerAsm
	ifequal 1, .change1
	ifequal 2, .change2
	ifequal 3, .change3
	ifequal 4, .change4
	ifequal 5, .change5
	jump .end
.change1
	setevent EVENT_AIRPORT_LUGGAGE_1
	clearevent EVENT_AIRPORT_LUGGAGE_2
	clearevent EVENT_AIRPORT_LUGGAGE_3
	clearevent EVENT_AIRPORT_LUGGAGE_4
	clearevent EVENT_AIRPORT_SLOWPOKE
	special Special_UpdatePalsInstant
	variablesprite SPRITE_BAGGAGE, SPRITE_ICE_BLOCK
	jump .end
.change2
	clearevent EVENT_AIRPORT_LUGGAGE_1
	setevent EVENT_AIRPORT_LUGGAGE_2
	clearevent EVENT_AIRPORT_LUGGAGE_3
	clearevent EVENT_AIRPORT_LUGGAGE_4
	clearevent EVENT_AIRPORT_SLOWPOKE
	special Special_UpdatePalsInstant
	variablesprite SPRITE_BAGGAGE, SPRITE_MALL_SIGN
	jump .end
.change3
	clearevent EVENT_AIRPORT_LUGGAGE_1
	clearevent EVENT_AIRPORT_LUGGAGE_2
	setevent EVENT_AIRPORT_LUGGAGE_3
	clearevent EVENT_AIRPORT_LUGGAGE_4
	clearevent EVENT_AIRPORT_SLOWPOKE
	special Special_UpdatePalsInstant
	variablesprite SPRITE_BAGGAGE, SPRITE_MISC_OVERHEAD
	jump .end
.change4
	clearevent EVENT_AIRPORT_LUGGAGE_1
	clearevent EVENT_AIRPORT_LUGGAGE_2
	clearevent EVENT_AIRPORT_LUGGAGE_3
	setevent EVENT_AIRPORT_LUGGAGE_4
	clearevent EVENT_AIRPORT_SLOWPOKE
	special Special_UpdatePalsInstant
	variablesprite SPRITE_BAGGAGE, SPRITE_VALVE_1
	jump .end
.change5
	clearevent EVENT_AIRPORT_LUGGAGE_1
	clearevent EVENT_AIRPORT_LUGGAGE_2
	clearevent EVENT_AIRPORT_LUGGAGE_3
	clearevent EVENT_AIRPORT_LUGGAGE_4
	setevent EVENT_AIRPORT_SLOWPOKE
	special Special_UpdatePalsInstant
	variablesprite SPRITE_BAGGAGE, SPRITE_VALVE_2
.end
	end
	
AiportTriggerAsm:
	ld a, [wRanchRaceSeconds]
	cp 14
	jr z, .change
	ld a, FALSE
	ld [wScriptVar], a
	ret
.change
	ld a, 15
	ld [wRanchRaceSeconds], a
	call Random
	cp $7f ; 50 percent
	jr c, AiportSwapBaggage1_1
	jr AiportSwapBaggage1_2

AiportSwapBaggage1_1:
	call Random
	cp $7f ; 50 percent
	jr c, AiportSwapBaggage2_1
	jr AiportSwapBaggage2_2

AiportSwapBaggage1_2:
	call Random
	cp $7f ; 50 percent
	jr c, AiportSwapBaggage2_3
	jr AiportSwapBaggage2_4

AiportSwapBaggage2_1:
	ld a, [wCurrentAirportBaggage]
	cp 1
	jr z, AiportTriggerAsm.change
	ld a, 1
	ld [wScriptVar], a
	ld [wCurrentAirportBaggage], a
	ret

AiportSwapBaggage2_2:
	ld a, [wCurrentAirportBaggage]
	cp 2
	jr z, AiportTriggerAsm.change
	ld a, 2
	ld [wScriptVar], a
	ld [wCurrentAirportBaggage], a
	ret
	
AiportSwapBaggage2_3:
	ld a, [wCurrentAirportBaggage]
	cp 3
	jr z, AiportTriggerAsm.change
	ld a, 3
	ld [wScriptVar], a
	ld [wCurrentAirportBaggage], a
	ret
	
AiportSwapBaggage2_4:
	call Random
	cp $19 ; 10 percent
	jr c, AiportSwapBaggage2_5
	ld a, [wCurrentAirportBaggage]
	cp 4
	jr z, AiportTriggerAsm.change
	ld a, 4
	ld [wScriptVar], a
	ld [wCurrentAirportBaggage], a
	ret
	
AiportSwapBaggage2_5:
	ld a, [wCurrentAirportBaggage]
	cp 5
	jr z, AiportTriggerAsm.change
	ld a, 5
	ld [wScriptVar], a
	ld [wCurrentAirportBaggage], a
	ret
	
AirportStopYou:
	setlasttalked AIRPORT_X_RAY_GIRL
	faceplayer
	opentext
	writetext AirportXRayGirlStopYouText
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	spriteface AIRPORT_X_RAY_GIRL, DOWN
	end
	
AirportXRay:
	playsound SFX_PUSH_BUTTON
	end
	
AirportNpc1:
	jumptext AirportNpc1Text
	
AirportNpc2:
	jumptext AirportNpc2Text
	
AirportNpc3:
	jumptext AirportNpc3Text
	
AirportNpc4:
	faceplayer
	opentext
	writetext AirportNpc4Text
	waitbutton
	closetext
	spriteface AIRPORT_NPC_4, LEFT
	end
	
AirportNpc5:
	jumptext AirportNpc5Text
	
AirportNpc6:
	jumptextfaceplayer AirportNpc6Text
	
AirportNpc7:
	faceplayer
	opentext
	writetext AirportNpc7Text
	waitbutton
	closetext
	spriteface AIRPORT_NPC_7, RIGHT
	end
	
AirportReceptionist:
	faceplayer
	opentext
	writetext AirportReceptionistText
	waitbutton
	closetext
	spriteface AIRPORT_RECEPTIONIST, RIGHT
	end
	
AirportGateGirl:
	end
	
AirportXRayGirl:
	faceplayer
	opentext
	writetext AirportXRayGirlStopYouText
	waitbutton
	closetext
	spriteface AIRPORT_X_RAY_GIRL, DOWN
	end
	
AirportXRayGirlStopYouText:
	text "I can't let you"
	line "pass without a"
	cont "ticket."
	
	para "You'll have to wait"
	line "in that line if"
	cont "you want one."
	done
	
AirportReceptionistText:
	text "I'm sorry."
	
	para "If you want a"
	line "ticket,"
	
	para "you'll have to"
	line "wait in line like"
	cont "everyone else."
	done
	
AirportNpc1Text:
	text "How much is a"
	line "ticket?"
	
	para "It used to be"
	line "cheaper!"
	
	para "Can I pay in"
	line "coins?"
	
	para "Can you put me"
	line "on first class?"
	
	para "I want a window"
	line "seat!"
	
	para "…"
	
	para "Blah! Blah!"
	line "Blah!"
	
	para "She just won't"
	line "stop!"
	done
	
AirportNpc2Text:
	text "Come on, lady!"
	
	para "I have places"
	line "to be!"
	done
	
AirportNpc3Text:
	text "Grumble… Grumble…"
	done
	
AirportNpc4Text:
	text "This sure is"
	line "taking a while…"
	done
	
AirportNpc5Text:
	text "Grumble… Grumble…"
	done
	
AirportNpc6Text:
	text "Is this line even"
	line "moving?"
	done
	
AirportNpc7Text:
	text "I don't see my"
	line "bag!"
	
	para "They'd better not"
	line "have lost it!"
	done
	
AirportBaggageAsm:
	xor a
	ld [wRanchRaceSeconds], a
	ld a, 1
	ld [wCurrentAirportBaggage], a
	ret