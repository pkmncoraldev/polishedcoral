Route22_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route22Trigger0

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, Route22Callback
	callback MAPCALLBACK_OBJECTS, Route22StartEngine

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_FISHING_GURU,  6, 106, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route22NPC1, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_BEAUTY,  9, 110, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route22NPC2, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_COOL_DUDE,  7, 112, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route22NPC3, EVENT_ROUTE_22_ROADBLOCK_GONE


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
	
Route22StartEngine:
	checkevent EVENT_BIKE_ENGINE_ON
	iftrue .end
	opentext
	writetext Route22StartEngineText
	waitbutton
	closetext
	setevent EVENT_BIKE_ENGINE_ON
	writecode VAR_MOVEMENT, PLAYER_DODRIO
	special MapCallbackSprites_LoadUsedSpritesGFX
.end
	return
	
Route22StartEngineText:
	text "Better kick the"
	line "engine on!"
	done
	
Route22StopEngineText:
	text "Better stop the"
	line "engine for now."
	done
	
Route22NPC1:
	jumptextfaceplayer Route22NPC1Text
	
Route22NPC1Text:
	text "Looks like we got"
	line "ourselves a"
	cont "traffic jam!"
	
	para "I wonder what the"
	line "holdup is."
	done
	
Route22NPC2:
	setevent EVENT_ROUTE_22_TALKED_ABOUT_SNARE
	jumptextfaceplayer Route22NPC2Text
	
Route22NPC2Text:
	text "Did you see the"
	line "guy blocking the"
	cont "detour back the"
	cont "way you came?"
	
	para "Why would he be"
	line "doing that?"
	
	para "What a suspicious"
	line "guy…"
	done
	
Route22NPC3:
	jumptext Route22NPC3Text
	
Route22NPC3Text:
	text "Yes sir, I know"
	line "I'm late for work."
	
	para "I'm stuck in a"
	line "traffic jam!"
	
	para "I know I've already"
	line "used that excuse"
	cont "3 times, but this"
	cont "time it's true!"
	
	para "I mean…<WAIT_S> Oops…"
	done