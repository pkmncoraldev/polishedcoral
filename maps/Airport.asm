Airport_MapScriptHeader:
	db 2 ; scene scripts
	scene_script AirportTrigger0
	scene_script AirportTrigger0

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AirportCallback

	db 2 ; warp events
	warp_event  5, 15, ONWA_INTL_AIRPORT, 3
	warp_event  6, 15, ONWA_INTL_AIRPORT, 4

	db 4 ; coord events
	coord_event  7,  9, 0, AirportStopYou
	coord_event  3,  9, 0, AirportStopYou
	coord_event  7,  8, 1, AirportXRay
	coord_event  3,  8, 1, AirportXRay

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_RECEPTIONIST,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AirportGateGirl, -1
	person_event SPRITE_RECEPTIONIST,  9,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AirportXRayGirl, -1
	object_event 11,  8, SPRITE_BAGGAGE, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GameConsole, -1


	const_def 1 ; object constants
	const AIRPORT_GATE_GIRL
	const AIRPORT_X_RAY_GIRL
	
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
	
AirportGateGirl:
	end
	
AirportXRayGirl:
	end
	
AirportXRayGirlStopYouText:
	text "Do you have a"
	line "ticket?"
	
	para "I can't let you"
	line "pass without a"
	cont "ticket."
	done
	
AirportBaggageAsm:
	xor a
	ld [wRanchRaceSeconds], a
	ld a, 1
	ld [wCurrentAirportBaggage], a
	ret