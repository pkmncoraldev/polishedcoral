RiverRapids_MapScriptHeader:
	db 2 ; scene scripts
	scene_script RiverRapidsTrigger0
	scene_script RiverRapidsTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  4, 12, 1, RIVER_RAPIDS
	warp_def 86, 13, 1, RIVER_RAPIDS_ENTRANCE

	db 16 ; coord events
	coord_event 12,  9, -1, RiverRapidsRockLeft
	coord_event 12, 19, -1, RiverRapidsRockLeft
	coord_event 13, 19, -1, RiverRapidsRockRight
	coord_event 16, 27, -1, RiverRapidsRockLeft
	coord_event 17, 27, -1, RiverRapidsRockRight
	coord_event  6, 43, -1, RiverRapidsRockLeft
	coord_event  7, 43, -1, RiverRapidsRockRight
	coord_event 10, 55, -1, RiverRapidsRockLeft
	coord_event 11, 55, -1, RiverRapidsRockRight
	coord_event 12, 67, -1, RiverRapidsRockLeft
	coord_event 13, 67, -1, RiverRapidsRockRight
	coord_event 10, 30, -1, RiverRapidsRockUp
	coord_event 10, 31, -1, RiverRapidsRockDown
	coord_event 18, 50, -1, RiverRapidsRockUp
	coord_event 18, 51, -1, RiverRapidsRockDown
	coord_event 12, 80, -1, RiverRapidsEnd

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_INVISIBLE,  4, 12, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


RiverRapidsTrigger0:
	loadvar wButtonPressedFrameCooldownActive, 1
	opentext
	farwritetext TextCountdown3
	playsound SFX_TALLY
	pause 25
	farwritetext TextCountdown2
	playsound SFX_TALLY
	pause 25
	farwritetext TextCountdown1
	playsound SFX_TALLY
	pause 25
	farwritetext TextCountdownGo
	playsound SFX_THROW_BALL
	pause 25
	closetext
	playmusic MUSIC_DODRIO_RACE
	setevent EVENT_TIMER_ACTIVE
	setevent EVENT_RIVER_RAPIDS
	dotrigger $1
	end
	
RiverRapidsTrigger1:
	end
	
RiverRapidsEnd:
	clearevent EVENT_TIMER_ACTIVE
	playmusic MUSIC_NONE
	playsound SFX_FINISH_RIVER_RAPIDS
	loadvar wCenteredObject, 1
	applymovement PLAYER, Movement_RiverRapidsFinish
	loadvar wCenteredObject, PLAYER
	waitsfx
	pause 10
	loadvar wButtonPressedFrameCooldownActive, 0
	loadvar wButtonPressedFrameCooldown, 0
	loadvar wSpinning, 0
	warpcheck
	end

RiverRapidsRockLeft:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_LEFT, .left3
	if_equal D_RIGHT, .right3
	if_equal D_LEFT + 1, .left2
	if_equal D_RIGHT + 1, .right2
	callasm RiverRapidsCheckJoyDownAsm
	if_equal D_LEFT, .left
	if_equal D_RIGHT, .right
	playsound SFX_EGG_BOMB
	earthquake 50
	applyonemovement PLAYER, turn_away_left
	end
.left
	checkcode VAR_MONJUSTCAUGHT
	iftrue .left2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applyonemovement PLAYER, turn_away_left
	end
.left2
	playsound SFX_GRASS_RUSTLE
	applyonemovement PLAYER, turn_away_left
	end
.left3
	playsound SFX_TWINKLE
	applyonemovement PLAYER, turn_in_left
	end
.right
	checkcode VAR_MONJUSTCAUGHT
	iftrue .right2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applymovement PLAYER, Movement_RiverRapidsRockRight
	end
.right2
	playsound SFX_GRASS_RUSTLE
	applymovement PLAYER, Movement_RiverRapidsRockRight
	end
.right3
	playsound SFX_TWINKLE
	applymovement PLAYER, Movement_RiverRapidsRockRight2
	end
	
RiverRapidsRockRight:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_LEFT, .left3
	if_equal D_RIGHT, .right3
	if_equal D_LEFT + 1, .left2
	if_equal D_RIGHT + 1, .right2
	callasm RiverRapidsCheckJoyDownAsm
	if_equal D_LEFT, .left
	if_equal D_RIGHT, .right
	playsound SFX_EGG_BOMB
	earthquake 50
	applyonemovement PLAYER, turn_away_right
	end
.left
	checkcode VAR_MONJUSTCAUGHT
	iftrue .left2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applymovement PLAYER, Movement_RiverRapidsRockLeft
	end
.left2
	playsound SFX_GRASS_RUSTLE
	applymovement PLAYER, Movement_RiverRapidsRockLeft
	end
.left3
	playsound SFX_TWINKLE
	applymovement PLAYER, Movement_RiverRapidsRockLeft2
	end
.right
	checkcode VAR_MONJUSTCAUGHT
	iftrue .right2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applyonemovement PLAYER, turn_away_right
	end
.right2
	playsound SFX_GRASS_RUSTLE
	applyonemovement PLAYER, turn_away_right
	end
.right3
	playsound SFX_TWINKLE
	applyonemovement PLAYER, turn_in_right
	end
	
RiverRapidsRockUp:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_UP, .up3
	if_equal D_DOWN, .down3
	if_equal D_UP + 1, .up2
	if_equal D_DOWN + 1, .down2
	callasm RiverRapidsCheckJoyDownAsm
	if_equal D_UP, .up
	if_equal D_DOWN, .down
	playsound SFX_EGG_BOMB
	earthquake 50
	applyonemovement PLAYER, turn_away_up
	end
.up
	checkcode VAR_MONJUSTCAUGHT
	iftrue .up2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applyonemovement PLAYER, turn_away_up
	end
.up2
	playsound SFX_GRASS_RUSTLE
	applyonemovement PLAYER, turn_away_up
	end
.up3
	playsound SFX_TWINKLE
	applyonemovement PLAYER, turn_in_up
	end
.down
	checkcode VAR_MONJUSTCAUGHT
	iftrue .down2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applymovement PLAYER, Movement_RiverRapidsRockDown
	end
.down2
	playsound SFX_GRASS_RUSTLE
	applymovement PLAYER, Movement_RiverRapidsRockDown
	end
.down3
	playsound SFX_TWINKLE
	applymovement PLAYER, Movement_RiverRapidsRockDown2
	end
	
RiverRapidsRockDown:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_UP, .up3
	if_equal D_DOWN, .down3
	if_equal D_UP + 1, .up2
	if_equal D_DOWN + 1, .down2
	callasm RiverRapidsCheckJoyDownAsm
	if_equal D_UP, .up
	if_equal D_DOWN, .down
	playsound SFX_EGG_BOMB
	earthquake 50
	applyonemovement PLAYER, turn_away_down
	end
.up
	checkcode VAR_MONJUSTCAUGHT
	iftrue .up2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applymovement PLAYER, Movement_RiverRapidsRockUp
	end
.up2
	playsound SFX_GRASS_RUSTLE
	applymovement PLAYER, Movement_RiverRapidsRockUp
	end
.up3
	playsound SFX_TWINKLE
	applymovement PLAYER, Movement_RiverRapidsRockUp2
	end
.down
	checkcode VAR_MONJUSTCAUGHT
	iftrue .down2
	playsound SFX_RAZOR_WIND
	earthquake 6
	applyonemovement PLAYER, turn_away_down
	end
.down2
	playsound SFX_GRASS_RUSTLE
	applyonemovement PLAYER, turn_away_down
	end
.down3
	playsound SFX_TWINKLE
	applyonemovement PLAYER, turn_in_down
	end
	
Movement_RiverRapidsRockRight:
	turn_away_right
	turn_away_right
	step_end
	
Movement_RiverRapidsRockLeft:
	turn_away_left
	turn_away_left
	step_end
	
Movement_RiverRapidsRockUp:
	turn_away_up
	turn_away_up
	step_end
	
Movement_RiverRapidsRockDown:
	turn_away_down
	turn_away_down
	step_end
	
Movement_RiverRapidsRockRight2:
	turn_in_right
	turn_in_right
	step_end
	
Movement_RiverRapidsRockLeft2:
	turn_in_left
	turn_in_left
	step_end
	
Movement_RiverRapidsRockUp2:
	turn_in_up
	turn_in_up
	step_end
	
Movement_RiverRapidsRockDown2:
	turn_in_down
	turn_in_down
	step_end
	
Movement_RiverRapidsFinish:
	turn_in_down
	turn_in_down
	turn_in_down
	turn_in_down
	turn_in_down
	fast_step_down
	fast_step_right
	step_end
	
RiverRapidsCheckJoyPressedAsm:
	ld a, [wButtonPressedFrameCooldown]
	and $f
	cp 0
	jr z, .end
	cp 6
	jr c, .slow
.perfect
	ld a, [wButtonPressedFrameCooldown]
	and $f0
	jr .end
.slow
	cp 0
	jr z, .end
	ld a, [wButtonPressedFrameCooldown]
	and $f0
	add 1
.end
	ld [wScriptVar], a
	ret
	
RiverRapidsCheckJoyDownAsm:
	ld hl, hJoyDown
	ld a, [hl]
	ld [wScriptVar], a
	ret
