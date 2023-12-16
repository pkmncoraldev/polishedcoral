Route23_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 1 ; warp events
	warp_event 21,  1, ROUTE_21_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost  2, 24, SIGNPOST_JUMPTEXT, Route23SignText
	signpost 10,  5, SIGNPOST_JUMPTEXT, Route23FightingDojoSignText

	db 2 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE


Route23Callback:
	callasm Route23SetUpLeaves
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	return

Route23SetUpLeaves:
	ld a, 1
	ld b, a
	ld a, [wXCoord]
;	add 5
	ld d, a
	ld a, [wYCoord]
	add 10
	ld e, a
	farcall CopyDECoordsToMapObject
	
	ld a, 2
	ld b, a
	ld a, [wXCoord]
;	add 5
	ld d, a
	ld a, [wYCoord]
	add 10
	ld e, a
	farcall CopyDECoordsToMapObject
	
	ld a, 5
	ld [wRanchRaceSeconds], a
	xor a
	ld [wRanchRaceFrames], a
	ret

Route23SignText:
	text "TODO"
	done
	
Route23FightingDojoSignText:
	text "FIGHTING DOJO"
	done
	