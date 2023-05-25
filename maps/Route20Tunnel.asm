Route20Tunnel_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route20TunnelTrigger0
	scene_script Route20TunnelTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route20TunnelCallback

	db 6 ; warp events
	warp_event 28, 13, DUSK_TURNPIKE, 3
	warp_event 28, 14, DUSK_TURNPIKE, 4
	warp_event 28, 15, DUSK_TURNPIKE, 5
	warp_event 28, 16, DUSK_TURNPIKE, 6
	warp_event 28, 17, DUSK_TURNPIKE, 7
	warp_event  9,  3, SEASIDE_CAVE_1F, 4

	db 62 ; coord events
	xy_trigger 0, 13, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 14, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 15, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 16, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 17, 28, 0, Route20TunnelLightEntrance, 0, 0
	xy_trigger 0, 15,  4, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 15,  5, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 16,  4, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 16,  5, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 15, 14, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 15, 15, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 16, 14, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 16, 15, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 15, 24, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 15, 25, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 16, 24, 0, Route20TunnelLight, 0, 0
	xy_trigger 0, 16, 25, 0, Route20TunnelLight, 0, 0
	xy_trigger 1, 16,  2, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15,  2, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13,  4, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13,  5, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15,  7, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16,  7, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 12, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 12, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 14, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 15, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 17, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 17, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 22, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 22, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 24, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 25, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 13, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17, 27, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14,  4, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14,  5, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15,  3, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16,  3, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17,  4, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17,  5, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16,  6, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15,  6, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 14, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 15, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 13, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 13, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17, 14, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17, 15, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 16, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 16, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 26, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 26, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 25, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 14, 24, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 15, 23, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 16, 23, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17, 24, 0, Route20TunnelDark, 0, 0
	xy_trigger 1, 17, 25, 0, Route20TunnelDark, 0, 0

	db 0 ; bg events

	db 0 ; object events


Route20TunnelTrigger0:
	end
	
Route20TunnelTrigger1:
	end

Route20TunnelCallback:
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