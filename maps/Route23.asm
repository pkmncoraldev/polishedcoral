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

	db 7 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event  5, 31, SPRITE_LEAVES, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event 16, 32, SPRITE_LEAVES, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event  5, 45, SPRITE_LEAVES, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event  7, 44, SPRITE_LEAVES, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event 26, 16, SPRITE_LEAVES, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event 23, 23, SPRITE_LEAVES, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1


Route23Callback:
	callasm Route23SetUpLeaves
	return

Route23SetUpLeaves:
	ld a, 1
	ld b, a
	ld a, [wXCoord]
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
	