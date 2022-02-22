Airport_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AirportCallback

	db 2 ; warp events
	warp_event  5, 13, ONWA_INTL_AIRPORT, 3
	warp_event  6, 13, ONWA_INTL_AIRPORT, 4

	db 10 ; coord events
	coord_event  4,  1, 0, AirportCoordEvent
	coord_event  4,  2, 0, AirportCoordEvent
	coord_event  4,  3, 0, AirportCoordEvent
	coord_event  4,  4, 0, AirportCoordEvent
	coord_event  4,  5, 0, AirportCoordEvent
	coord_event  4,  9, 0, AirportCoordEvent
	coord_event  4, 10, 0, AirportCoordEvent
	coord_event  4, 11, 0, AirportCoordEvent
	coord_event  4, 12, 0, AirportCoordEvent
	coord_event  4, 13, 0, AirportCoordEvent

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 10, SPRITE_BAGGAGE, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GameConsole, -1


AirportCallback:
	callasm AirportBaggageAsm
	return
	
AirportCoordEvent:
	dotrigger $1
	callasm AirportBaggageAsm
	end
	
AirportBaggageAsm:
	xor a
	ld [wRanchRaceSeconds], a 
	ret