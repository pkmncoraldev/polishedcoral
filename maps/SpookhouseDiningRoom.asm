SpookhouseDiningRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 5 ; warp events
	warp_def 7, 2, 3, SPOOKHOUSE_LIVING_ROOM
	warp_def 7, 3, 3, SPOOKHOUSE_LIVING_ROOM
	warp_def 7, 10, 4, SPOOKHOUSE_LIVING_ROOM
	warp_def 7, 11, 4, SPOOKHOUSE_LIVING_ROOM
	warp_def 2, 2, 1, SPOOKHOUSE_BEDROOM

	db 0 ; coord events

	db 2 ; bg events
	signpost 3, 8, SIGNPOST_READ, SpookHouseRottonFood
	signpost 2, 3, SIGNPOST_READ, SpookHouseRottonFood

	db 3 ; object events
	person_event SPRITE_BALL_CUT_FRUIT, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FloatBallL, EVENT_SPOOKHOUSE_BALL_LEFT_GONE
	person_event SPRITE_BALL_CUT_FRUIT, 3, 4, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FloatBallR, EVENT_SPOOKHOUSE_BALL_RIGHT_GONE
	person_event SPRITE_INVISIBLE,  4,  2, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_SPOOKHOUSE_BLOCKER_GONE

	const_def 1 ; object constants
	const SPOOKHOUSE_FLOATBALL_L
	const SPOOKHOUSE_FLOATBALL_R
	const SPOOKHOUSE_BLOCKER
	
FloatBallL:
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	playsound SFX_SHARPEN
	applymovement SPOOKHOUSE_FLOATBALL_L, Movement_SpookHouseFloatRight
	appear SPOOKHOUSE_FLOATBALL_R
	opentext
	writetext SpookHouseBallFloatText
	waitbutton
	closetext
	disappear SPOOKHOUSE_FLOATBALL_L
	setevent EVENT_SPOOKHOUSE_BALL_LEFT_GONE
	clearevent EVENT_SPOOKHOUSE_BALL_RIGHT_GONE
	end
	
.YouAreFacingDown:
	disappear SPOOKHOUSE_FLOATBALL_L
	disappear SPOOKHOUSE_BLOCKER
	opentext
	verbosegiveitem OLD_KEY
	closetext
	setevent EVENT_SPOOKHOUSE_BLOCKER_GONE
	setevent EVENT_SPOOKHOUSE_BALL_LEFT_GONE
	setevent EVENT_SPOOKHOUSE_BALL_RIGHT_GONE
	setevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	setevent EVENT_SPOOKHOUSE_GOT_BALL
	domaptrigger SPOOKHOUSE_LIVING_ROOM, $1
	end
	
FloatBallR:
	playsound SFX_SHARPEN
	applymovement SPOOKHOUSE_FLOATBALL_R, Movement_SpookHouseFloatLeft
	appear SPOOKHOUSE_FLOATBALL_L
	opentext
	writetext SpookHouseBallFloatText
	waitbutton
	closetext
	disappear SPOOKHOUSE_FLOATBALL_R
	clearevent EVENT_SPOOKHOUSE_BALL_LEFT_GONE
	setevent EVENT_SPOOKHOUSE_BALL_RIGHT_GONE
	end
	
SpookHouseRottonFood:
	jumptext SpookHouseRottonFoodText
	
Movement_SpookHouseFloatBall1:
	fix_facing
	slow_jump_step_right
	step_end
	
Movement_SpookHouseFloatBall2:
	fix_facing
	slow_jump_step_left
	step_end
	
SpookHouseBallFloatText:
	text "It floated out of"
	line "your grasp!"
	done
	
SpookHouseRottonFoodText:
	text "Ew!"
	
	para "A plate of rotten"
	line "food!"
	done
	
Movement_SpookHouseFloatLeft:
	fix_facing
	set_sliding
	slow_jump_step_left
	remove_sliding
	remove_fixed_facing
	step_end
	
Movement_SpookHouseFloatRight:
	fix_facing
	set_sliding
	slow_jump_step_right
	remove_sliding
	remove_fixed_facing
	step_end