FlickerTrainCutscene_MapScriptHeader:
	db 2 ; scene scripts
	scene_script FlickerTrainCutsceneTrigger0
	scene_script FlickerTrainCutsceneTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  8, FLICKER_TRAIN_STATION, 3
	warp_event 47,  5, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_CHILD,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FlickerStationNPC3, -1
	person_event SPRITE_SCHOOLGIRL,  2,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FlickerStationNPC4, -1
	person_event SPRITE_OFFICER,  8,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	const_def 1 ; object constants
	const FLICKER_TRAIN_CUTSCENE_NPC1
	const FLICKER_TRAIN_CUTSCENE_NPC2
	const FLICKER_TRAIN_CUTSCENE_NPC3
	
FlickerTrainCutsceneTrigger0:
	applymovement PLAYER, Movement_FlickerTrainGraveyard3Girls2
	playsound SFX_ENTER_DOOR
	applyonemovement PLAYER, hide_person
	waitsfx
	applymovement FLICKER_TRAIN_CUTSCENE_NPC3, Movement_FlickerStationOfficer
	spriteface FLICKER_TRAIN_CUTSCENE_NPC3, DOWN
	opentext
	writetext FlickerStationAllAboardText
	waitbutton
	closetext
	applyonemovement FLICKER_TRAIN_CUTSCENE_NPC3, step_up
	playsound SFX_ENTER_DOOR
	applyonemovement FLICKER_TRAIN_CUTSCENE_NPC3, hide_person
	waitsfx
	pause 20
	special Special_FadeOutMusic
	pause 20	
	applymovement PLAYER, Movement_FlickerStationTrainCamera
	pause 20
	spriteface FLICKER_TRAIN_CUTSCENE_NPC1, RIGHT
	pause 10
	spriteface FLICKER_TRAIN_CUTSCENE_NPC2, LEFT
	playmusic MUSIC_TRAIN_STARTUP
	pause 10
	spriteface FLICKER_TRAIN_CUTSCENE_NPC1, DOWN
	pause 10
	spriteface FLICKER_TRAIN_CUTSCENE_NPC2, DOWN
	callasm FlickerStationTrainThing
	pause 20
	earthquake 5
	pause 5
	applymovement PLAYER, Movement_FlickerStationTrainLeaves
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	dotrigger $2
	callasm FlickerStationPlayerSeatAsm
	warpfacing LEFT, TRAIN_CABIN_1, $7, $2
	end
	
FlickerTrainCutsceneTrigger1:
	callasm FlickerStationTrainThing
	playmusic MUSIC_NONE
	applymovement PLAYER, Movement_FlickerStationTrainArrives
	pause 5
	earthquake 5
	pause 35
	opentext
	writetext FlickerTrainCutsceneArriveText
	waitbutton
	callasm LusterTrainThing2
	closetext
	applymovement PLAYER, Movement_FlickerStationTrainArrives2
	pause 15
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, show_person
	applyonemovement PLAYER, step_down
	pause 10
	applyonemovement PLAYER, step_down
	warpcheck
	dotrigger $2
	end
	
FlickerStationTrainThing:
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

FlickerTrainCutsceneArriveText:
	text "We've arrived at"
	line "FLICKER STATION!"
	
	para "Please watch your"
	line "step as you exit"
	cont "the train."
	done
	
Movement_FlickerStationTrainLeaves:
	slow_step_right
	slow_step_right
	step_right
	step_right
	step_right
	step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
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
	
Movement_FlickerStationTrainArrives:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end
	
Movement_FlickerStationTrainArrives2:
	slow_step_left
	slow_step_down
	step_end
	