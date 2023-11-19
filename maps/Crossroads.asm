Crossroads_MapScriptHeader:
	db 2 ; scene scripts
	scene_script CrossroadsTrigger0
	scene_script CrossroadsTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, CrossroadsFlyPoint
	callback MAPCALLBACK_TILES, CrossroadsCallback

	db 1 ; warp events
	warp_event 29, 11, CROSSROADS, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_MALL_SIGN, 12, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, CrossroadsSign, -1
	

CrossroadsFlyPoint:
	setflag ENGINE_FLYPOINT_CROSSROADS
	return
	
CrossroadsTrigger0:
CrossroadsTrigger1:
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<DUSK
	iffalse .end
	changeblock $14, $0a, $f0
	changeblock $16, $0a, $b6
	changeblock $14, $0c, $c3
	changeblock $16, $0c, $b5
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock $14, $0a, $ec
	changeblock $16, $0a, $01
	changeblock $14, $0c, $01
	changeblock $16, $0c, $01
	clearflag ENGINE_STREETLIGHTS
	clearflag ENGINE_STREETLIGHTS2
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end

CrossroadsCallback:
	checktime 1<<DUSK
	iftrue .dusk
	checktime 1<<NITE
	iffalse .notnite
.dusk
	changeblock $14, $0a, $f0
	changeblock $16, $0a, $b6
	changeblock $14, $0c, $c3
	changeblock $16, $0c, $b5
	setflag ENGINE_STREETLIGHTS
.notnite
	domaptrigger ROUTE_22_TUNNEL, $1
	return

CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle:
	farcall CheckCurrentMapXYTriggers
	ret nc
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapScriptHeaderBank]
	farjp CallScript
	
CrossroadsSign:
	jumptext CrossroadsSignText
	
CrossroadsSignText:
	text "TEXT 1"
	done