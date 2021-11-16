OnwaIntlAirport_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 23, 38, 3, ROUTE_12_GATE
	warp_def 23, 39, 4, ROUTE_12_GATE
	warp_def 16, 18, 1, ROUTE_1
	warp_def 16, 19, 2, ROUTE_1

	db 10 ; coord events
	xy_trigger 0, 22, 20, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 22, 21, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 0, 22, 22, 0, OnwaIntlAirportMapSignThing, 0, 0
	xy_trigger 1, 24, 20, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 24, 21, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 24, 22, 0, Route12MapSignThing, 0, 0
	xy_trigger 1, 12,  5, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 1, 13,  5, 0, OnwaIntlAirportBehindFence, 0, 0
	xy_trigger 2, 14,  5, 0, OnwaIntlAirportInFrontFence, 0, 0
	xy_trigger 2, 15,  5, 0, OnwaIntlAirportInFrontFence, 0, 0

	db 0 ; bg events

	db 1 ; object events
	cuttree_event  5, 14, EVENT_ONWA_INTL_AIRPORT_CUT_TREE

	
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
	changeblock $4, $c, $c3
	changeblock $6, $c, $bd
	changeblock $8, $c, $bd
	changeblock $a, $c, $bd
	changeblock $c, $c, $bd
	changeblock $18, $c, $bd
	changeblock $4, $e, $ef
	changeblock $6, $e, $e5
	changeblock $8, $e, $f4
	changeblock $a, $e, $f5
	changeblock $c, $e, $e5
	changeblock $18, $e, $e5
	callasm GenericFinishBridge
	dotrigger $1
	end
	
OnwaIntlAirportInFrontFence:
	changeblock $4, $c, $ed
	changeblock $6, $c, $ec
	changeblock $8, $c, $ec
	changeblock $a, $c, $ec
	changeblock $c, $c, $ec
	changeblock $18, $c, $ec
	changeblock $4, $e, $eb
	changeblock $6, $e, $05
	changeblock $8, $e, $4c
	changeblock $a, $e, $4e
	changeblock $c, $e, $05
	changeblock $18, $e, $05
	callasm GenericFinishBridge
	dotrigger $0
	end