DesertWasteland1_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertWastelandTrigger0
	scene_script DesertWastelandTrigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 36 ; coord events
	coord_event  3,  2, 1, DesertWastelandReset
	coord_event  3,  3, 1, DesertWastelandReset
	coord_event  3,  4, 1, DesertWastelandReset
	coord_event  3,  5, 1, DesertWastelandReset
	coord_event  3,  6, 1, DesertWastelandReset
	coord_event  3,  7, 1, DesertWastelandReset
	coord_event  3,  8, 1, DesertWastelandReset
	coord_event  3,  9, 1, DesertWastelandReset
	coord_event  3, 10, 1, DesertWastelandReset
	coord_event  3, 11, 1, DesertWastelandReset
	coord_event  3, 12, 1, DesertWastelandReset
	coord_event  3, 13, 1, DesertWastelandReset
	coord_event  3, 14, 1, DesertWastelandReset
	coord_event  3, 15, 1, DesertWastelandReset
	coord_event 14,  2, 1, DesertWastelandReset
	coord_event 14,  3, 1, DesertWastelandReset
	coord_event 14,  4, 1, DesertWastelandReset
	coord_event 14,  5, 1, DesertWastelandReset
	coord_event 14,  6, 1, DesertWastelandReset
	coord_event 14,  7, 1, DesertWastelandReset
	coord_event 14,  8, 1, DesertWastelandReset
	coord_event 14,  9, 1, DesertWastelandReset
	coord_event 14, 10, 1, DesertWastelandReset
	coord_event 14, 11, 1, DesertWastelandReset
	coord_event 14, 12, 1, DesertWastelandReset
	coord_event 14, 13, 1, DesertWastelandReset
	coord_event 14, 14, 1, DesertWastelandReset
	coord_event 14, 15, 1, DesertWastelandReset
	coord_event 14,  0, 1, DesertWastelandReset
	coord_event 14,  1, 1, DesertWastelandReset
	coord_event  3,  0, 1, DesertWastelandReset
	coord_event  3,  1, 1, DesertWastelandReset
	coord_event 14, 17, 1, DesertWastelandReset
	coord_event 14, 16, 1, DesertWastelandReset
	coord_event  3, 17, 1, DesertWastelandReset
	coord_event  3, 16, 1, DesertWastelandReset

	db 0 ; bg events

	db 0 ; object events

	
DesertWastelandTrigger0:
	setevent EVENT_SANDSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 1
	domaptrigger DESERT_ROUTE_NORTH, $2
	playsound SFX_SNOWSTORM_INTRO
	dotrigger $1
	end
	
DesertWastelandTrigger1:
	callasm DesertRouteSfxAsm
	end
	
DesertRouteSfxAsm:
	farcall CheckSFX
	ret c
	ld de, SFX_SNOWSTORM
	farcall PlaySFX
	ret
	
DesertWastelandReset:
	special Special_FadeBlackQuickly
	callasm KillSFX
	loadvar wTimeOfDayPalFlags, $40 | 0
	playsound SFX_PERISH_SONG
	waitsfx
	pause 5
	special FadeOutPalettes
	special Special_StopRunning
	warp2 DOWN, DESERT_ROUTE_NORTH, $c, $0
	end
	