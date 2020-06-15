LusterTrainCutscene_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterTrainCutsceneTrigger0
	scene_script LusterTrainCutsceneTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 5, 3, ROUTE_1, 1
	warp_event 60,  3, LUSTER_CITY_SHOPPING, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_GENTLEMAN,  7, 54, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


	const_def 1 ; object constants
	const LUSTER_TRAIN_CUTSCENE_NPC

LusterTrainCutsceneTrigger0:
	callasm LusterTrainThing
	applymovement PLAYER, Movement_LusterTrainArrives
	special FadeOutPalettes
	applyonemovement PLAYER, show_person
	callasm LusterTrainThing2
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
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
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
