LusterTrainCutscene_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterTrainCutsceneTrigger0
	scene_script LusterTrainCutsceneTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  2, ROUTE_1, 1
	warp_event 60,  2, LUSTER_TRAIN_STATION, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	
LusterTrainCutsceneTrigger0:
	callasm LusterTrainThing
	applymovement PLAYER, Movement_LusterTrainArrives
	special FadeOutPalettes
	warpcheck
	end
	
LusterTrainCutsceneTrigger1:
	end
	
Movement_LusterTrainArrives:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
	
LusterTrainThing:
	ld hl, rIE
	set LCD_STAT, [hl]
	ld a, 7
	ld [hWX], a
	ld a, 64
	ld [hWY], a
	ld a, 1
	ld [hLCDTrain], a
	hlcoord 0, 8
	decoord 0, 0
	ld bc, 4 * BG_MAP_WIDTH
	call CopyBytes
	hlcoord 0, 8, wAttrMap
	decoord 0, 0, wAttrMap
	ld bc, 4 * BG_MAP_WIDTH
	call CopyBytes
	farcall HDMATransfer_OnlyTopFourRows
	ret
	
LusterTrainThing2:
	ld hl, rIE
    res LCD_STAT, [hl]
    xor a
    ld [hLCDTrain], a
    ld a, $B0
    ld [hWY], a
	ld a, 7
    ld [hWX], a
	ret
