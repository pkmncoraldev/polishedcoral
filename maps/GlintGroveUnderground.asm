GlintGroveUnderground_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  7, 31, 2, GLINT_GROVE_EAST
	warp_def  5, 43, 3, GLINT_GROVE_UNDERGROUND
	warp_def 40, 31, 2, GLINT_GROVE_UNDERGROUND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_CLEFAIRY_WALK,  5, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundTest, -1
	person_event SPRITE_CLEFAIRY_WALK,  5, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundTest, -1
	
	
	const_def 1 ; object constants
	const GLINT_GROVE_UNDERGROUND_TEST_1
	const GLINT_GROVE_UNDERGROUND_TEST_2
	
GlintGroveUndergroundTest:
	follow GLINT_GROVE_UNDERGROUND_TEST_1, GLINT_GROVE_UNDERGROUND_TEST_2
	applyonemovement GLINT_GROVE_UNDERGROUND_TEST_1, step_left
	pause 10
	applymovement GLINT_GROVE_UNDERGROUND_TEST_1, GlintGroveUndergroundTestMovement3
	disappear GLINT_GROVE_UNDERGROUND_TEST_1
	stopfollow
	applyonemovement GLINT_GROVE_UNDERGROUND_TEST_2, remove_fixed_facing
	pause 5
	applyonemovement GLINT_GROVE_UNDERGROUND_TEST_2, turn_step_down
	applyonemovement GLINT_GROVE_UNDERGROUND_TEST_2, remove_fixed_facing
	pause 10
	cry CLEFAIRY
	waitsfx
	pause 5
	applyonemovement GLINT_GROVE_UNDERGROUND_TEST_2, slow_jump_step_right
	disappear GLINT_GROVE_UNDERGROUND_TEST_2
	end

	cry CLEFAIRY
	pause 10
	applymovement GLINT_GROVE_UNDERGROUND_TEST_1, GlintGroveUndergroundTestMovement
	playsound SFX_JUMP_OVER_LEDGE
	applymovement GLINT_GROVE_UNDERGROUND_TEST_1, GlintGroveUndergroundTestMovement2
	disappear GLINT_GROVE_UNDERGROUND_TEST_1
	end


GlintGroveUndergroundTestMovement:
	step_down
	step_end
GlintGroveUndergroundTestMovement2:
	jump_step_up
	turn_step_down
	step_sleep 75
	jump_step_right
	step_end
	
GlintGroveUndergroundTestMovement3:
	slow_jump_step_down
	slow_jump_step_right
	slow_jump_step_up
	slow_jump_step_left
	slow_jump_step_down
	slow_jump_step_right
	slow_jump_step_up
	slow_jump_step_left
	step_up
	slow_jump_step_up
	slow_jump_step_right
	step_end