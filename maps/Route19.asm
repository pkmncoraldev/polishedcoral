Route19_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route19Trigger0
	scene_script Route19Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route19Callback

	db 7 ; warp events
	warp_event  8, 26, ROUTE_17, 1
	warp_event  8, 27, ROUTE_17, 2
	warp_event  7, 13, ROUTE_19_TUNNEL, 1
	warp_event  7, 14, ROUTE_19_TUNNEL, 2
	warp_event  7, 15, ROUTE_19_TUNNEL, 3
	warp_event  7, 16, ROUTE_19_TUNNEL, 4
	warp_event  7, 17, ROUTE_19_TUNNEL, 5

	db 0 ; coord events

	db 7 ; bg events
	signpost 21, 31, SIGNPOST_JUMPTEXT, Route19BrokenCar
	signpost 21, 32, SIGNPOST_JUMPTEXT, Route19BrokenCar
	signpost 20, 23, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 20, 33, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 22, 30, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 23, 30, SIGNPOST_JUMPTEXT, Route19Tire
	signpost 24, 29, SIGNPOST_JUMPTEXT, Route19Tire
	

	db 1 ; object events
	person_event SPRITE_PLANK_BRIDGE,  5, 20, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


Route19Trigger0:
Route19Trigger1:
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<NITE
	iffalse .end
	changeblock $22, $0a, $5b
	changeblock $2c, $0a, $5b
	changeblock $0c, $0c, $a1
	changeblock $18, $0c, $a1
	changeblock $22, $0c, $a1
	changeblock $2c, $0c, $a1
	changeblock $0c, $0e, $a2
	changeblock $18, $0e, $a2
	changeblock $22, $0e, $a2
	changeblock $2c, $0e, $a2
	changeblock $0c, $10, $a4
	changeblock $18, $10, $a4
	changeblock $22, $10, $a4
	changeblock $2c, $10, $a4
	changeblock $1c, $0c, $f2
	changeblock $16, $14, $f6
	changeblock $16, $16, $fa
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm Route19StreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock $22, $0a, $a8
	changeblock $2c, $0a, $5b
	changeblock $0c, $0c, $a9
	changeblock $18, $0c, $a9
	changeblock $22, $0c, $a9
	changeblock $2c, $0c, $a9
	changeblock $0c, $0e, $4e
	changeblock $18, $0e, $20
	changeblock $22, $0e, $20
	changeblock $2c, $0e, $4e
	changeblock $0c, $10, $aa
	changeblock $18, $10, $aa
	changeblock $22, $10, $aa
	changeblock $2c, $10, $aa
	changeblock $1c, $0c, $f3
	changeblock $16, $14, $85
	changeblock $16, $16, $89
	clearflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm Route19StreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end

Route19Callback:
	checktime 1<<NITE
	iffalse .notnite
	changeblock $22, $0a, $5b
	changeblock $2c, $0a, $5b
	changeblock $0c, $0c, $a1
	changeblock $18, $0c, $a1
	changeblock $22, $0c, $a1
	changeblock $2c, $0c, $a1
	changeblock $0c, $0e, $a2
	changeblock $18, $0e, $a2
	changeblock $22, $0e, $a2
	changeblock $2c, $0e, $a2
	changeblock $0c, $10, $a4
	changeblock $18, $10, $a4
	changeblock $22, $10, $a4
	changeblock $2c, $10, $a4
	changeblock $1c, $0c, $f2
	changeblock $16, $14, $f6
	changeblock $16, $16, $fa
	setflag ENGINE_STREETLIGHTS
.notnite
	return

Route19StreetlightPaletteUpdateThingMoreWordsExtraLongStyle:
	farcall CheckCurrentMapXYTriggers
	ret nc
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapScriptHeaderBank]
	farjp CallScript

Route19BrokenCar:
	text "A broken down car."
	done
	
Route19Tire:
	text "Tires are stacked"
	line "around randomly."
	done