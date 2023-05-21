Route20Tunnel_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route20TunnelTrigger0
	scene_script Route20TunnelTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route20TunnelCallback

	db 5 ; warp events
	warp_event 28, 11, HIGHWAY_TOWN, 3
	warp_event 28, 12, HIGHWAY_TOWN, 4
	warp_event 28, 13, HIGHWAY_TOWN, 5
	warp_event 28, 14, HIGHWAY_TOWN, 6
	warp_event 28, 15, HIGHWAY_TOWN, 7

	db 62 ; coord events
	xy_trigger 0, 11, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 12, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 13, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 14, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 15, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 13,  4, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 13,  5, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 14,  4, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 14,  5, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 13, 14, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 13, 15, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 14, 14, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 14, 15, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 13, 24, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 13, 25, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 14, 24, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 14, 25, 0, Route20TunnelLight, 0, 0
	xy_trigger 1, 14,  2, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13,  2, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11,  4, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11,  5, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13,  7, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14,  7, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 12, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 12, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11, 14, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11, 15, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 17, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 17, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 22, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 22, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11, 24, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11, 25, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 11, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12,  4, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12,  5, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13,  3, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14,  3, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15,  4, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15,  5, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14,  6, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13,  6, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12, 14, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12, 15, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 13, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 13, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 14, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 15, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 16, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 16, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 26, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 26, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12, 25, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 12, 24, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 23, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 23, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 24, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 25, 0, Route20TunnelDark, 0, 0

	db 0 ; bg events

	db 0 ; object events


Route20TunnelTrigger0:
	end
	
Route20TunnelTrigger1:
	end

Route20TunnelCallback:
	checktime 1<<NITE
	iftrue .nite
	setflag ENGINE_NEAR_CAMPFIRE
	dotrigger $1
	return
.nite
	clearflag ENGINE_NEAR_CAMPFIRE
	return
	
Route20TunnelLightEntrance:
	checktime 1<<NITE
	iftrue Route20TunnelDark
	setflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $1
.end
	end

Route20TunnelLight:
	setflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	end
	
Route20TunnelDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	end