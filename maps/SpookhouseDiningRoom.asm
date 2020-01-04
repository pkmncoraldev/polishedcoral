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

	db 3 ; bg events
	signpost 1, 0, SIGNPOST_READ, SpookHouseDeadLight
	signpost 3, 8, SIGNPOST_READ, SpookHouseRottonFood
	signpost 2, 3, SIGNPOST_READ, SpookHouseRottonFood

	db 1 ; object events
	person_event SPRITE_BALL_CUT_FRUIT, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FloatBall, EVENT_SPOOKHOUSE_GOT_BALL


	const_def 1 ; object constants
	const SPOOKHOUSE_FLOATBALL
	
FloatBall:
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
;	killsfx
	playsound SFX_SHARPEN
	checkevent EVENT_SPOOKHOUSE_BALL_WILL_MOVE_LEFT
	iftrue .left
	applymovement SPOOKHOUSE_FLOATBALL, Movement_SpookHouseFloatRight
	opentext
	writetext SpookHouseBallFloatText
	waitbutton
	closetext
	setevent EVENT_SPOOKHOUSE_BALL_WILL_MOVE_LEFT
	end
	
.left:
	applymovement SPOOKHOUSE_FLOATBALL, Movement_SpookHouseFloatLeft
	opentext
	writetext SpookHouseBallFloatText
	waitbutton
	closetext
	clearevent EVENT_SPOOKHOUSE_BALL_WILL_MOVE_LEFT
	end
	
.YouAreFacingDown:
	disappear SPOOKHOUSE_FLOATBALL
	opentext
	verbosegiveitem OLD_KEY
	closetext
	setevent EVENT_SPOOKHOUSE_GOT_BALL
	setevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	domaptrigger SPOOKHOUSE_LIVING_ROOM, $1
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