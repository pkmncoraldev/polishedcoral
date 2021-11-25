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

	db 1 ; bg events
	bg_event 22,  9, SIGNPOST_ITEM + FULL_RESTORE, EVENT_AIRPORT_HIDDEN_FULL_RESTORE

	db 13 ; object events
	cuttree_event  9, 16, EVENT_ONWA_INTL_AIRPORT_CUT_TREE
	itemball_event 29, 14, SUPER_REPEL, 1, EVENT_AIRPORT_POKE_BALL_1
	itemball_event  8,  4, SUPER_REPEL, 1, EVENT_AIRPORT_POKE_BALL_2
	person_event SPRITE_CORY_MISC,  8, 22, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 23, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 24, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  7, 14, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_OFFICER,  9, 26, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  5, 24, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  6, 13, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER, 10, 14, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  9,  5, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  8,  2, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	

	
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
	
OnwaIntlAirportGuard:
	generictrainer PLAYER_CORY, -1, -1, .SeenText, -1

.SeenText
	text "Hold it!"
	
	para "Are you crazy?"
	
	para "You can't be out"
	line "here!"
	done