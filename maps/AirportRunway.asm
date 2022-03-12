AirportRunway_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AirportRunwayCallback

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event 17,  7, SIGNPOST_ITEM + NUGGET, EVENT_AIRPORT_HIDDEN_ITEM_1
	bg_event 29,  8, SIGNPOST_ITEM + ELIXIR, EVENT_AIRPORT_HIDDEN_ITEM_2

	db 15 ; object events
	person_event SPRITE_PSYCHIC, 16, 33, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC1, -1
	person_event SPRITE_FAT_GUY, 19, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC2, -1
	person_event SPRITE_POKEFAN_F, 18, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, OnwaIntlAirportNPC5, -1
	tmhmball_event 33, 15, TM_STEEL_WING, EVENT_AIRPORT_POKE_BALL_1
	itemball_event 12,  4, QUICK_POWDER, 1, EVENT_AIRPORT_POKE_BALL_2
	itemball_event 27,  9, EVIOLITE, 1, EVENT_AIRPORT_POKE_BALL_3
	person_event SPRITE_OFFICER,  9, 31, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  4, 16, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER, 10, 17, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  7, 27, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER, 10,  9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_OFFICER,  4,  6, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, OnwaIntlAirportGuard, -1
	person_event SPRITE_CORY_MISC,  7, 17, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 28, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 29, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	
AirportRunwayCallback:
	changeblock $c, $e, $c3
	changeblock $e, $e, $bd
	changeblock $10, $e, $bd
	changeblock $12, $e, $bd
	changeblock $14, $e, $bd
	changeblock $20, $e, $86
	changeblock $c, $10, $ef
	changeblock $e, $10, $e5
	changeblock $10, $10, $f4
	changeblock $12, $10, $f5
	changeblock $14, $10, $e5
	changeblock $20, $10, $e5
	callasm GenericFinishBridge
	setevent EVENT_AIRPORT_FENCE
	return
	
OnwaIntlAirportGuard:
	generictrainer PLAYER_CORY, -1, -1, .SeenText, -1

.SeenText
	text "Hold it!"
	
	para "Are you crazy?"
	
	para "You can't be out"
	line "here!"
	done
