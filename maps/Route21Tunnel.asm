Route21Tunnel_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route21TunnelTrigger0
	scene_script Route21TunnelTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route21TunnelCallback

	db 7 ; warp events
	warp_event 38, 13, DUSK_TURNPIKE, 3
	warp_event 38, 14, DUSK_TURNPIKE, 4
	warp_event 38, 15, DUSK_TURNPIKE, 5
	warp_event 38, 16, DUSK_TURNPIKE, 6
	warp_event 38, 17, DUSK_TURNPIKE, 7
	warp_event 19,  3, SEASIDE_CAVE_1F, 4
	warp_event  5, 21, ROUTE_18, 4

	db 82 ; coord events
	xy_trigger 0, 13, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 14, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 15, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 16, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 17, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 15,  4, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15,  5, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16,  4, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16,  5, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 14, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 15, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 14, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 15, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 24, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 25, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 24, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 25, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 34, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 35, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 34, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 35, 0, Route21TunnelLight, 0, 0
	xy_trigger 1, 13,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  2, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  3, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  2, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  3, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  7, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  6, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  7, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  6, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 18,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 18,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 12, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 12, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 14, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 15, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 17, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 17, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 22, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 22, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 24, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 25, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 27, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 27, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 32, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 32, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 34, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 35, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 14, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 15, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 13, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 13, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 14, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 15, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 16, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 16, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 24, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 25, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 23, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 23, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 24, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 25, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 26, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 26, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 36, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 36, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 35, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 34, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 33, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 33, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 34, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 35, 0, Route21TunnelDark, 0, 0

	db 0 ; bg events

	db 0 ; object events


Route21TunnelTrigger0:
	end
	
Route21TunnelTrigger1:
	end

Route21TunnelCallback:
	checkcode VAR_FACING
	if_equal DOWN, .nite
	checktime 1<<NITE
	iftrue .nite
	setflag ENGINE_NEAR_CAMPFIRE
	dotrigger $1
	return
.nite
	clearflag ENGINE_NEAR_CAMPFIRE
	return
	
Route21TunnelLightEntrance:
	checktime 1<<NITE
	iftrue Route21TunnelDark
	setflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $1
.end
	end

Route21TunnelLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
Route21TunnelDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	end