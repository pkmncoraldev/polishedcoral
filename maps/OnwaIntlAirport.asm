OnwaIntlAirport_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 25, 42, 3, ROUTE_12_GATE
	warp_def 25, 43, 4, ROUTE_12_GATE
	warp_def 16, 22, 1, ROUTE_1
	warp_def 16, 23, 2, ROUTE_1

	db 10 ; coord events
	xy_trigger 0, 24, 24, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 24, 25, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 24, 26, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 1, 26, 24, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 26, 25, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 26, 26, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 14,  9, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 1, 15,  9, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 2, 16,  9, 0, OnwaIntlAirportInFrontFence, 0, 0
	xy_trigger 2, 17,  9, 0, OnwaIntlAirportInFrontFence, 0, 0

	db 0 ; bg events

	db 1 ; object events
	cuttree_event  9, 16, EVENT_ONWA_INTL_AIRPORT_CUT_TREE

	
Route12MapSignThing::
	dotrigger $0
	clearevent EVENT_AT_AIRPORT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
    end

OnwaIntlAirportMapSignThing::
	dotrigger $1
	setevent EVENT_AT_AIRPORT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
    end
	
OnwaIntlAirportBehindFence:
	changeblock $8, $e, $c3
	changeblock $a, $e, $bd
	changeblock $c, $e, $bd
	changeblock $e, $e, $bd
	changeblock $10, $e, $bd
	changeblock $1c, $e, $bd
	changeblock $8, $10, $ef
	changeblock $a, $10, $e5
	changeblock $c, $10, $f4
	changeblock $e, $10, $f5
	changeblock $10, $10, $e5
	changeblock $1c, $10, $e5
	callasm GenericFinishBridge
	dotrigger $2
	end
	
OnwaIntlAirportInFrontFence:
	changeblock $8, $e, $ed
	changeblock $a, $e, $ec
	changeblock $c, $e, $ec
	changeblock $e, $e, $ec
	changeblock $10, $e, $ec
	changeblock $1c, $e, $ec
	changeblock $8, $10, $eb
	changeblock $a, $10, $05
	changeblock $c, $10, $4c
	changeblock $e, $10, $4e
	changeblock $10, $10, $05
	changeblock $1c, $10, $05
	callasm GenericFinishBridge
	dotrigger $1
	end