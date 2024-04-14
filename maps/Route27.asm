Route27_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route27Callback

	db 2 ; warp events
	warp_event 39, 33, ROUTE_25_GATE, 1
	warp_event 40, 33, ROUTE_25_GATE, 2

	db 4 ; coord events
	xy_trigger 0, 12,  6, 0, Route27MapSignThing, 0, 0
	xy_trigger 0, 12,  7, 0, Route27MapSignThing, 0, 0
	xy_trigger 1, 11,  6, 0, Route25MapSignThing, 0, 0
	xy_trigger 1, 11,  7, 0, Route25MapSignThing, 0, 0

	db 13 ; bg events
	signpost 12,  9, SIGNPOST_READ, Route27Sign
	signpost 17, 18, SIGNPOST_READ, Route27Logs
	signpost 17, 19, SIGNPOST_READ, Route27Logs
	signpost 22, 19, SIGNPOST_READ, Route27Logs
	signpost 22, 21, SIGNPOST_READ, Route27Logs
	signpost 23, 32, SIGNPOST_READ, Route27Logs
	signpost 23, 33, SIGNPOST_READ, Route27Logs
	signpost 28, 31, SIGNPOST_READ, Route27Logs
	signpost 19, 46, SIGNPOST_READ, Route27Logs
	signpost 19, 47, SIGNPOST_READ, Route27Logs
	signpost 24, 45, SIGNPOST_READ, Route27Logs
	signpost 24, 47, SIGNPOST_READ, Route27Logs
	signpost 30, 41, SIGNPOST_READ, Route27BrightburgSign

	db 3 ; object events
;	person_event SPRITE_LEILANI_CHAIR_2, 12,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 23, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 22, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 25, 43, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1


Route27Callback:
	checkevent EVENT_SET_ROUTE_27
	iftrue .set
	clearevent EVENT_ON_ROUTE_27
	return
.set
	setevent EVENT_ON_ROUTE_27
	return

Route25MapSignThing::
	clearevent EVENT_ON_ROUTE_27
	clearevent EVENT_SET_ROUTE_27
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	callasm Route27FadeToMusicAsm
	dotrigger $0
	end

Route27MapSignThing::
	setevent EVENT_ON_ROUTE_27
	setevent EVENT_SET_ROUTE_27
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	callasm Route27FadeToMusicAsm
	dotrigger $1
	end

Route27FadeToMusicAsm:
	call FadeToMapMusic
	ret

Route27Logs:
	jumptext Route27LogsText
	
Route27LogsText:
	text "Some lumber is"
	line "stacked neatly."
	done

Route27Sign:
	jumptext Route27SignText
	
Route27SignText:
	text "ROUTE 27"
	
	para "NORTH:"
	line "ROUTE 25"
	
	para "WEST:"
	line "ROUTE 26"
	
	para "SOUTHEAST:"
	line "BRIGHTBURG"
	done

Route27BrightburgSign:
	jumptext Route27BrightburgSignText

Route27BrightburgSignText:
	text "ROUTE 25"
	
	para "SOUTH:"
	line "BRIGHTBURG"
	done

BrightCondosSign:
	jumptext BrightCondosSignText
	
BrightCondosSignText:
	text "Coming soon:"
	line "BRIGHTBURG CONDOS"
	
	para "…"
	
	para "A big red “X”"
	line "covers the sign."
	done
	