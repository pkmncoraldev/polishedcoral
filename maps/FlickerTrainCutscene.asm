FlickerTrainCutscene_MapScriptHeader:
	db 2 ; scene scripts
	scene_script FlickerTrainCutsceneTrigger0
	scene_script FlickerTrainCutsceneTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  4,  8, FLICKER_TRAIN_STATION, 5

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
	end
	
FlickerTrainCutsceneTrigger1:
	applymovement PLAYER, Movement_FlickerStation3Girls2
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
	warpfacing LEFT, EAST_TRAIN_CABIN_1, $7, $2
	end
