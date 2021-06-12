TwinkleTown_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleTownTrigger0
	scene_script TwinkleTownTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, TwinkleTownFlypointCallback
	callback MAPCALLBACK_OBJECTS, TwinkleTownStopSnowstorm

	db 7 ; warp events
	warp_def 47, 11, 1, TWINKLE_POKECENTER
	warp_def 41, 17, 1, TWINKLE_MART
	warp_def 31, 17, 1, TWINKLE_ROCK_HOUSE
	warp_def 39,  7, 1, TWINKLE_TRADE_HOUSE
	warp_def 49, 21, 1, TWINKLE_HOUSE_3
	warp_def  5, 34, 1, ICE_CAVE_B1F
	warp_def 21, 10, 1, TWINKLE_GYM_ENTRY

	db 0 ; coord events

	db 4 ; bg events
	signpost 44,  8, SIGNPOST_READ, TwinkleTownSign
	signpost 22, 12, SIGNPOST_READ, TwinkleTownGymSign
	signpost 47, 12, SIGNPOST_READ, TwinkleTownPokeCenterSign
	signpost 41, 18, SIGNPOST_READ, TwinkleTownMartSign

	db 7 ; object events
	object_event  8, 12, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 13, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 13, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 15, 12, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 15, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 16, SPRITE_STEAM, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11, 12, SPRITE_CHARLIE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

TwinkleTownFlypointCallback:
	setflag ENGINE_FLYPOINT_TWINKLE
	return
	
TwinkleTownStopSnowstorm:
	checkevent EVENT_SNOWSTORM_HAPPENING
	iffalse .endcallback
	dotrigger $1
.endcallback
	return
	
TwinkleTownTrigger0:
	end

TwinkleTownTrigger1:
	clearevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger ROUTE_10, $0
	dotrigger $0
	end
	
TwinkleTownSign:
	jumptext TwinkleTownSignText
	
TwinkleTownGymSign:
	jumptext TwinkleTownGymSignText
	
TwinkleTownPokeCenterSign:
	jumpstd pokecentersign
	
TwinkleTownMartSign:
	jumpstd martsign
	
TwinkleTownSignText:
	text "TWINKLE TOWN"
	
	para "A shining beacon"
	line "in the storm."
	done
	
TwinkleTownGymSignText:
	text "TWINKLE TOWN"
	line "#MON GYM"
	cont "LEADER: CHARLIE"

	para "The smokin' hot"
	line "stud."
	done
