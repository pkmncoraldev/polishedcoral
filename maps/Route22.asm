Route22_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route22Trigger0

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route22Callback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events


Route22Trigger0:
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<DUSK
	iffalse .end
	changeblock -$2, $4, $f2
	changeblock $c, $4, $f2
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock -$2, $4, $f3
	changeblock $c, $4, $f3
	clearflag ENGINE_STREETLIGHTS
	clearflag ENGINE_STREETLIGHTS2
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end

Route22Callback:
	checktime 1<<DUSK
	iftrue .nite
	checktime 1<<NITE
	iffalse .notnite
.nite
	changeblock -$2, $4, $f2
	changeblock $c, $4, $f2
	setflag ENGINE_STREETLIGHTS
.notnite
	return