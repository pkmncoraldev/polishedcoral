DoPlayerMovement:: ; 80000wWalkingDirection
	call .GetDPad
	ld a, movement_step_sleep_1
	ld [wMovementAnimation], a
	call .TranslateIntoMovement
	ld c, a
	ld a, [wMovementAnimation]
	ld [wPlayerNextMovement], a
	ret	
	
.GetDPad:

	ld a, [hJoyDown]
	ld [wCurInput], a

; Standing downhill instead moves down.

	ld hl, wOWState
	bit OWSTATE_BIKING_DOWNHILL, [hl]
	ret z

	ld c, a
	and D_PAD
	ret nz
	
;	and B_BUTTON
;	ret nz

	ld a, c
	or D_DOWN
	ld [wCurInput], a
	ret
; 8002d

.TranslateIntoMovement:
	ld a, [wPlayerState]
	and a ; cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_RUN
	jr z, .Running
	cp PLAYER_SKATEBOARD
	jp z, .Skating
	cp PLAYER_SKATEBOARD_MOVING
	jp z, .Skating
	cp PLAYER_SURF
	jp z, .Surf
	cp PLAYER_SURF_PIKA
	jp z, .Surf
	cp PLAYER_SURF_LAVA
	jp z, .Surf
	cp PLAYER_DODRIO
	jr z, .Normal
	cp PLAYER_SLIP
	jp z, .Ice
	cp PLAYER_SITTING
	jp z, .Standing
	cp PLAYER_SKATEBOARD_FALLING
	jp z, .SkateboardFalling
.Normal:
	xor a
	ld [wPlayerRunning], a
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	jp .NotMoving
	
.Running:
	ld a, [wWalkingDirection]
	cp STANDING
	jr nz, .Runningcont
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
.Runningcont
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	ld a, [wPlayerRunning]
	cp 1
	jr z, .Runningcont2
	ld a, 1
	ld [wPlayerRunning], a
	call ReplaceKrisSprite ; UpdateSprites
.Runningcont2
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	jp .NotMoving
	
.Skating:
	ld a, [wPlayerStandingTile]
	ld hl, SkateboardTiles
	ld de, 1
	call IsInArray
	jr nc, .SkatingOffRoad
	xor a
	ld [wSkateboardOffRoad], a
	ld a, [wLastWalkingDirection]
	cp STANDING
	jr z, .SkatingStanding
	ld a, [wSkateboardSpeed]
	cp 0
	jr z, .SkatingPush
	ld a, [wSkateboardPush]
	cp 0
	jr z, .Skatingcont
	
	push bc
	ld a, PLAYER_SKATEBOARD_MOVING
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ld a, 5
	ld [wSkateboardSteps], a
.Skatingcont
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryOllie
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	jp .NotMoving
	
.SkatingOffRoad
	ld a, 1
	ld [wSkateboardOffRoad], a
.SkatingStanding
	xor a
	ld [wSkateboardSteps], a
	ld [wSkateboardPush], a
	ld [wSkateboardMoving], a
	ld [wSkateboardGrinding], a
.SkatingPush
	ld a, 3
	ld [wSkateboardSpeed], a
	push bc
	ld a, PLAYER_SKATEBOARD
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	jr .Skatingcont

.SkateboardFalling
	xor a
	ld [wSkateboardSteps], a
	ld [wSkateboardPush], a
	ld [wSkateboardMoving], a
	ld [wSkateboardSpeed], a
	ld [wSkateboardOllie], a
	ld a, [wSkateboardGrinding]
	cp 0
	jr z, .start_fall
	cp 60
	jr z, .get_up
	ld a, [wSkateboardGrinding]
	inc a
	ld [wSkateboardGrinding], a
	call .StandInPlace
	scf
	ret
.get_up
	ld a, PLAYER_SKATEBOARD
	ld [wPlayerState], a
	call ReplaceKrisSprite
	xor a
	ld [wSkateboardGrinding], a
	scf
	ret
.start_fall
	ld de, SFX_SUBMISSION
	call PlaySFX
	ld a, 1
	ld [wSkateboardGrinding], a
	call GetFacingTileCoord
	call GetTileCollision
	cp LANDTILE
	jr z, .slide_fall
	xor a
	scf
	ret
.slide_fall
	ld a, [wLastWalkingDirection]
	ld [wWalkingDirection], a
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret
	
.Surf:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TrySurf
	ret c
	jr .NotMoving
	
.Ice:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .HitWall
	call .BumpSound
.HitWall:
	call .StandInPlace
	xor a
	ret
	
.NotMoving:
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
;	ld a, [wEngineBuffer4]
;	and a
;	jr nz, .CantMove
	call .BumpSound
;.CantMove:
	call ._WalkInPlace
	xor a
	ret

.Standing:
	call .StandInPlace
	xor a
	ret
; 800b7

.CheckTile: ; 800b7
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [wPlayerStandingTile]
	ld c, a
	cp COLL_WHIRLPOOL
	jr nz, .not_whirlpool
	ld a, 3
	scf
	ret

.not_whirlpool
	and $f0
	cp $30 ; moving water
	jr z, .water
	cp $70 ; warps
	jr z, .warps
	jr .no_walk

.water
	ld a, c
	and 3
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [wWalkingDirection], a
	ld a, STEP_WALK
	jr .finish

.water_table
	db RIGHT
	db LEFT
	db UP
	db DOWN

.warps
	ld a, c
	cp COLL_AWNING
	jr z, .up
	cp COLL_DOOR
	jr z, .down
	cp COLL_STAIRCASE
	jr z, .down
	cp COLL_CAVE
	jr nz, .no_walk

.down
	xor a ; DOWN
	jr .set_direction
.up
	ld a, UP
.set_direction
	ld [wWalkingDirection], a
	jr .continue_walk

.no_walk
	xor a
	ret

.continue_walk
	ld a, STEP_WALK
.finish
	call .DoStep
	ld a, 5
	scf
	ret
; 80147

.CheckTurning: ; 80147
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wPlayerTurningDirection]
	cp 0
	jr nz, .not_turning
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_turning

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr z, .not_turning

	ld a, STEP_TURN
	call .DoStep
	ld a, 2
	scf
	ret

.not_turning
	xor a
	ret
; 8016b

.TryStep: ; 8016b
	ld a, [wTileset]
	cp TILESET_TRAIN
	jp nz, .not_sitting

	ld a, [wSnareFlags]
	bit 0, a ; Team Snare in Starglow Valley. Reusing this flag for convenience.
	jr z, .not_sitting
	ret
	
.not_sitting
; Surfing actually calls .TrySurf directly instead of passing through here.
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jp z, .TrySurf
	cp PLAYER_SURF_PIKA
	jp z, .TrySurf

	ld a, [wPlayerStandingTile]
	cp COLL_CONVEYOR_UP
	jp z, .conveyorup
	cp COLL_CONVEYOR_DOWN
	jp z, .conveyordown
	cp COLL_CONVEYOR_LEFT
	jp z, .conveyorleft
	cp COLL_CONVEYOR_RIGHT
	jp z, .conveyorright
	cp COLL_GRIND
	jp z, .grind
	call .CheckWalkable
	jr c, .wall
	jr .contreturn
	
.wall
	eventflagset EVENT_YOU_CHEATED
	
.contreturn
	call .CheckLandPerms
	jp c, .bump

	call .CheckNPC
	and a
	jp z, .bump
	cp 2
	jp z, .bump

	ld a, [wPlayerState]
	cp PLAYER_DODRIO
	jp z, .fast
	
;	cp PLAYER_SKATEBOARD_GRINDING
;	jp z, .stop_grinding
	
	ld a, [wSpinning]
	and a
	jp nz, .spin

	ld a, [wPlayerStandingTile]
	cp COLL_ICE
	jp z, .ice
	
	call .SnowCheck
	jp z, .DoNotRun

	call .RunCheck
	jp z, .run
	jp .DoNotRun

.conveyorup
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .conveyorup_bike_gear_check
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
.conveyorup_return
	ld a, [wMapMusic]
	cp MUSIC_LUSTER_CITY
	jr nz, .conveyorup_notinmall
	
	eventflagset EVENT_ON_ESCALATOR
	
	ld a, [wWalkingDirection]
	cp DOWN
	jr z, .conveyorup_down_bike
	jr .conveyorup_cont

.conveyorup_notinmall
	ld a, [wWalkingDirection]
	cp UP
	jr z, .conveyorup_up
	
.conveyorup_cont
	ld a, UP
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	

.conveyorup_up
	ld a, STEP_FAST
	call .DoStep
	scf
	ret

.conveyorup_bike_gear_check
	call CheckBikeGear
	jr nz, .conveyorup_return
	
.conveyorup_bike
	ld a, [wWalkingDirection]
	cp UP
	jr z, .conveyorup_up_bike
	cp DOWN
	jr z, .conveyorup_down_bike
	ld a, UP
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	

.conveyorup_up_bike
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.conveyorup_down_bike
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret

.conveyordown
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .conveyordown_bike_gear_check
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
.conveyordown_return
	ld a, [wMapMusic]
	cp MUSIC_LUSTER_CITY
	jr nz, .conveyordown_notinmall
	
	eventflagset EVENT_ON_ESCALATOR
	
	ld a, [wWalkingDirection]
	cp UP
	jr z, .conveyordown_up_bike
	jr .conveyordown_cont

.conveyordown_notinmall
	ld a, [wWalkingDirection]
	cp DOWN
	jr z, .conveyordown_down

.conveyordown_cont
	ld a, DOWN
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	
	
.conveyordown_down
	ld a, STEP_FAST
	call .DoStep
	scf
	ret

.conveyordown_bike_gear_check
	call CheckBikeGear
	jr nz, .conveyordown_return
	
.conveyordown_bike
	ld a, [wWalkingDirection]
	cp DOWN
	jr z, .conveyordown_down_bike
	cp UP
	jr z, .conveyordown_up_bike
	ld a, DOWN
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	

.conveyordown_down_bike
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret
	
.conveyordown_up_bike
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret

.conveyorleft
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .conveyorleft_bike_gear_check
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
.conveyorleft_return
	ld a, [wWalkingDirection]
	cp LEFT
	jr z, .conveyorleft_left
	ld a, LEFT
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	
	
.conveyorleft_left
	ld a, STEP_FAST
	call .DoStep
	scf
	ret

.conveyorleft_bike_gear_check
	call CheckBikeGear
	jr nz, .conveyorleft_return
	
.conveyorleft_bike
	ld a, [wWalkingDirection]
	cp LEFT
	jr z, .conveyorleft_left_bike
	cp RIGHT
	jr z, .conveyorleft_right_bike
	ld a, LEFT
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	

.conveyorleft_left_bike
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.conveyorleft_right_bike
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret

.conveyorright
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr z, .conveyorright_bike_gear_check
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
.conveyorright_return
	ld a, [wWalkingDirection]
	cp RIGHT
	jr z, .conveyorright_right
	ld a, RIGHT
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	
	
.conveyorright_right
	ld a, STEP_FAST
	call .DoStep
	scf
	ret

.conveyorright_bike_gear_check
	call CheckBikeGear
	jr nz, .conveyorright_return
	
.conveyorright_bike
	ld a, [wWalkingDirection]
	cp RIGHT
	jr z, .conveyorright_right_bike
	cp LEFT
	jr z, .conveyorright_left_bike
	ld a, RIGHT
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret	

.conveyorright_right_bike
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.conveyorright_left_bike
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret

.nobike
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jp nz, .contreturn
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	ret
	
.grind
	call GetFacingTileCoord
	call GetTileCollision
	cp LANDTILE
	jr z, .stop_grinding
	ld a, [wPlayerState]
	cp PLAYER_SKATEBOARD_GRINDING
	jr z, .grindcont
	ld de, SFX_GRIND
	call PlaySFX
	ld a, PLAYER_SKATEBOARD_GRINDING
	ld [wPlayerState], a
	call ReplaceKrisSprite
.grindcont
	ld a, 1
	ld [wSkateboardGrinding], a
	ld a, [wLastWalkingDirection]
	ld [wWalkingDirection], a
	ld a, STEP_SLIDE
	call .DoStep
	scf
	ret
	
.stop_grinding
	ld a, [wSkateboardGrinding]
	cp 0
	jr z, .stop_grinding_fall
	ld a, [wLastWalkingDirection]
	ld [wWalkingDirection], a
	ld a, PLAYER_SKATEBOARD
	ld [wPlayerState], a
	call ReplaceKrisSprite
	xor a
	ld [wSkateboardGrinding], a
	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, 7
	scf
	ret
.stop_grinding_fall
	ld a, [wLastWalkingDirection]
	ld [wWalkingDirection], a
	ld a, PLAYER_SKATEBOARD_FALLING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ld de, SFX_BEAT_UP
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, 7
	scf
	ret
	
.DoNotRun
; Downhill riding is slower when not moving down.
	call .BikeCheck
	jp nz, .not_bike
	
	call .SnowCheck
	jr z, .bikeslowstep
	
.DoNotRun2
	ld hl, wOWState
	bit OWSTATE_BIKING_DOWNHILL, [hl]
	jr z, .checkbikegear

	ld a, [wWalkingDirection]
	cp DOWN
	jr z, .fast

	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.bikeslowstep
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret
	
.checkbikegear
	call CheckBikeGear
	jr z, .fast
	ld a, STEP_FAST
	call .DoStep
	scf
	ret
	
.fast
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.not_bike
	call .SkateboardCheck
	jp nz, .walk
	
	ld a, [wSkateboardOffRoad]
	cp 1
	jr z, .offroadslow
	ld a, [wSkateboardMoving]
	cp 0
	jr z, .walk
	ld a, [wSkateboardSpeed]
	cp 1
	jr z, .skateboard_push

	ld a, STEP_SKATEBOARD
	call .DoStep
	scf
	ret
.skateboard_push
	ld a, STEP_SKATEBOARD_PUSH
	call .DoStep
	scf
	ret
	
.walk
;	call .TVRoomCheck
;	jr z, .slowwalk
	
	call .SnowCheck
	jr z, .slowwalk

.walkcont
	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.ice
	ld a, STEP_ICE
	call .DoStep
	scf
	ret
	
.offroadslow
	xor a
	ld [wSkateboardOllie], a
	jr .slow
	
.slowwalk
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
.slow
	ld a, STEP_SLOW
	call .DoStep
	scf
	ret
	
.run
	ld a, STEP_RUN
	call .DoStep
;   Trainer faces player -- not a current feature
;	push af
;	ld a, [wWalkingDirection]
;	cp STANDING
;	jr z, .skip_trainer
;	call CheckTrainerRun
;.skip_trainer
;	pop af
	scf
	ret

.spin
	ld de, SFX_SQUEAK
	call PlaySFX
	ld a, STEP_SPIN
	call .DoStep
	scf
	ret

.bump
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .contbump
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
.contbump
	cp PLAYER_SKATEBOARD_MOVING
	jr nz, .contbump2
	ld a, PLAYER_SKATEBOARD
	ld [wPlayerState], a
	call ReplaceKrisSprite
.contbump2
	xor a
	ld [wSkateboardSteps], a
	ld [wSkateboardPush], a
	ld [wSkateboardMoving], a
	ld [wSkateboardSpeed], a
	ld [wSkateboardOllie], a
	ld [wSkateboardGrinding], a
	ld [wSpinning], a
	ret
; 801c0

.TrySurf: ; 801c0

	call .CheckNPC
	and a
	jr z, .surf_bump
	cp 2
	jr z, .surf_bump

	call .CheckSurfPerms
	jr c, .surf_bump

	and a
	jr nz, .ExitWater

	ld a, [wOWState]
	set OWSTATE_SURF, a
	ld [wOWState], a
	ld a, STEP_SURF
	call .DoStep
	scf
	ret

.ExitWater:
	call .GetOutOfWater
	call PlayMapMusic
	ld a, STEP_SLOW
	call .DoStep
	ld a, 6
	scf
	ret

.surf_bump
	xor a
	ret
; 801f3

.TryJump: ; 801f3
	call .CheckNPCFarAhead
	and a
	jr z, .bump
	cp 2
	jr z, .bump
	
	ld a, [wPlayerStandingTile]
	ld e, a
	and $f0
	cp $a0 ; ledge
	jr nz, .DontJump

	ld a, e
	and 15
	ld e, a
	ld d, 0
	ld hl, .data_8021e
	add hl, de
	ld a, [wFacingDirection]
	and [hl]
	jr z, .DontJump

.DoJump
	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	xor a
	ld [wSkateboardOllie], a
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .DoJumpCont
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
.DoJumpCont
	ld a, STEP_LEDGE
	call .DoStep
	ld a, 7
	scf
	ret
.DontOllieSound
	ld de, SFX_EGG_CRACK
	call PlaySFX
.DontOllie
	xor a
	ld [wSkateboardOllie], a
.DontJump:
	xor a
	ret
	
.TryOllie: ; 801f3
	ld a, [wSkateboardOllie]
	cp 2
	jr nz, .DontJump
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .DontOllie
	call .CheckNPCFarAhead
	and a
	jr z, .DontOllieSound
	cp 2
	jr z, .DontOllieSound
	call .CheckLandPermsFarAhead
	jr c, .DontOllieSound
	call .CheckNoJumpTile
	jr nc, .DontOllieSound
	ld a, [wPlayerStandingTile]
	ld hl, SkateboardTiles
	ld de, 1
	call IsInArray
	jr nc, .DontOllieSound
	farcall CheckFacingEdgeofMap
	jr nc, .DontOllieSound
	ld a, [wLastWalkingDirection]
	ld [wWalkingDirection], a
	xor a
	ld [wPlayerStandingTile], a
	jr .DoJump

.data_8021e
	db FACE_RIGHT
	db FACE_LEFT
	db FACE_UP
	db FACE_DOWN
	db FACE_RIGHT | FACE_DOWN
	db FACE_DOWN | FACE_LEFT
	db FACE_UP | FACE_RIGHT
	db FACE_UP | FACE_LEFT
	db FACE_RIGHT
	db FACE_LEFT
	db FACE_UP
	db FACE_DOWN
	db FACE_RIGHT | FACE_DOWN
	db FACE_DOWN | FACE_LEFT
	db FACE_UP | FACE_RIGHT
	db FACE_UP | FACE_LEFT
; 80226

.CheckWarp: ; 80226

	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_warp
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [wPlayerStandingTile]
	cp [hl]
	jr nz, .not_warp

	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_warp

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr nz, .not_warp
	call WarpCheck
	jr nc, .not_warp

	call .StandInPlace
	scf
	ld a, 1
	ret

.not_warp
	xor a
	ret

.EdgeWarps:
	db COLL_WARP_CARPET_DOWN
	db COLL_WARP_CARPET_UP
	db COLL_WARP_CARPET_LEFT
	db COLL_WARP_CARPET_RIGHT
; 8025f

.DoStep:
	ld e, a
	ld d, 0
	
	ld a, [wPlayerGender]
	cp PIPPI
	jr nz, .DoStepNotPippi
	ld hl, .StepsPippi
	jr .DoStepCont
	
.DoStepNotPippi
 	ld hl, .Steps
.DoStepCont
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wWalkingDirection]
	ld e, a
	cp STANDING
	jp z, .StandInPlace

	add hl, de
	ld a, [hl]
	ld [wMovementAnimation], a

	ld hl, .InPlace
	add hl, de
	ld a, [hl]
	ld [wPlayerTurningDirection], a

	ld a, [wPlayerState]
	cp PLAYER_SKATEBOARD
	jr nz, .DoStepEnd
	
	ld a, 2
	ld [wSkateboardPush], a
	
	ld a, 1
	ld [wSkateboardMoving], a
	
.DoStepEnd
	ld a, 4
	ret

.Steps:
	dw .SlowStep ; x0.5
	dw .NormalStep ; x1
	dw .FastStep ; x4
	dw .Run ; x2, doubles animation speed
	dw .JumpStep
	dw .FastSlideStep
	dw .TurningStep
	dw .BackJumpStep
	dw .InPlace
	dw .SpinStep
	dw .Fast ; x2
	dw .SurfStep
	dw .SlideStep
	dw .SkateboardStep
	dw .SkateboardPushStep
	
.StepsPippi:
	dw .SlowStep ; x0.5
	dw .NormalStep ; x1
	dw .PippiFast ; x4
	dw .PippiRun ; x2, doubles animation speed
	dw .JumpStep
	dw .FastSlideStep
	dw .TurningStep
	dw .BackJumpStep
	dw .InPlace
	dw .SpinStep
	dw .Fast ; x2
	dw .SurfStep
	dw .SlideStep
	dw .SkateboardStep
	dw .SkateboardPushStep

.SlowStep:
	slow_step_down
	slow_step_up
	slow_step_left
	slow_step_right
.NormalStep:
	player_walk_step_down
	player_walk_step_up
	player_walk_step_left
	player_walk_step_right
.FastStep:
	big_step_down
	big_step_up
	big_step_left
	big_step_right
.Run
	player_run_step_down
	player_run_step_up
	player_run_step_left
	player_run_step_right
.PippiFast
	pippi_fast_step_down
	pippi_fast_step_up
	pippi_fast_step_left
	pippi_fast_step_right
.PippiRun
	pippi_run_step_down
	pippi_run_step_up
	pippi_run_step_left
	pippi_run_step_right
.JumpStep:
	jump_step_down
	jump_step_up
	jump_step_left
	jump_step_right
.FastSlideStep:
	fast_slide_step_down
	fast_slide_step_up
	fast_slide_step_left
	fast_slide_step_right
.BackJumpStep:
	jump_step_up
	jump_step_down
	jump_step_right
	jump_step_left
.TurningStep:
	turn_step_down
	turn_step_up
	turn_step_left
	turn_step_right
.InPlace:
	db $80 + movement_turn_head_down
	db $80 + movement_turn_head_up
	db $80 + movement_turn_head_left
	db $80 + movement_turn_head_right
.SpinStep
	turn_in_down
	turn_in_up
	turn_in_left
	turn_in_right
.Fast
	fast_step_down
	fast_step_up
	fast_step_left
	fast_step_right
.SurfStep
	step_down
	step_up
	step_left
	step_right
.SlideStep:
	slide_step_down
	slide_step_up
	slide_step_left
	slide_step_right
.SkateboardStep
	skateboard_step_down
	skateboard_step_up
	skateboard_step_left
	skateboard_step_right
.SkateboardPushStep
	skateboard_slow_step_down
	skateboard_slow_step_up
	skateboard_slow_step_left
	skateboard_slow_step_right

.StandInPlace: ; 802b3
	ld a, movement_step_sleep_1
	ld [wMovementAnimation], a
	xor a
	ld [wPlayerTurningDirection], a
	ret
; 802bf

._WalkInPlace: ; 802bf
	ld a, movement_step_bump
	ld [wMovementAnimation], a
	xor a
	ld [wPlayerTurningDirection], a
	ret
; 802cb

.CheckForced: ; 802cb
; When sliding on ice, input is forced to remain in the same direction.

	call CheckSpinning
	jr z, .not_spinning
	dec a
	jr .force

.not_spinning
	call CheckStandingOnIce
	ret nc

	ld a, [wPlayerTurningDirection]
	cp 0
	ret z

.force
	and 3
	ld e, a
	ld d, 0
	ld hl, .forced_dpad
	add hl, de
	ld a, [wCurInput]
	and BUTTONS
	or [hl]
	ld [wCurInput], a
	ret

.forced_dpad
	db D_DOWN, D_UP, D_LEFT, D_RIGHT
; 802ec

.GetAction: ; 802ec
; Poll player input and update movement info.

	ld hl, .table
	ld de, .table2 - .table1
	ld a, [wCurInput]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
; Standing
	jr .update

.d_down 	add hl, de
.d_up   	add hl, de
.d_left 	add hl, de
.d_right	add hl, de

.update
	ld a, [wWalkingDirection]
	ld [wLastWalkingDirection], a
	ld a, [hli]
	ld [wWalkingDirection], a
	ld a, [hli]
	ld [wFacingDirection], a
	ld a, [hli]
	ld [wWalkingX], a
	ld a, [hli]
	ld [wWalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [wWalkingTile], a
	ret

.table
; struct:
;	walk direction
;	facing
;	x movement
;	y movement
;	tile collision pointer
.table1
	db STANDING, FACE_CURRENT, 0, 0
	dw wPlayerStandingTile
.table2
	db RIGHT, FACE_RIGHT,  1,  0
	dw wTileRight
	db LEFT,  FACE_LEFT,  -1,  0
	dw wTileLeft
	db UP,    FACE_UP,     0, -1
	dw wTileUp
	db DOWN,  FACE_DOWN,   0,  1
	dw wTileDown
; 80341

.CheckNPC: ; 80341
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front
	ld hl, wHaveFollower
	bit 0, [hl] ; ENGINE_BIKE_GEAR
	jr nz, .is_npc ;set
	xor a
	ld [hMapObjectIndexBuffer], a
; Load the next X coordinate into d
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	farcall IsNPCAtCoord
	jr nc, .is_npc
	call .CheckStrengthBoulder
	jr c, .no_bump

	xor a
	ret

.is_npc
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret
; 8036f

.CheckNPCFarAhead: ; 80341
; Returns 0 if there is an NPC 2 spaces in front that you can't move
; Returns 1 if there is no NPC 2 spaces in front
	ld hl, wHaveFollower
	bit 0, [hl] ; ENGINE_BIKE_GEAR
	jr nz, .is_npc ;set
	xor a
	ld [hMapObjectIndexBuffer], a
	
	ld a, [wFacingDirection]
	cp FACE_UP
	jr z, .CheckNPCFarAheadUp
	cp FACE_DOWN
	jr z, .CheckNPCFarAheadDown
	cp FACE_LEFT
	jr z, .CheckNPCFarAheadLeft
	
.CheckNPCFarAheadRight
; Load the next X coordinate into d
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	inc a
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
	jr .CheckNPCFarAheadEnd
	
.CheckNPCFarAheadUp
; Load the next X coordinate into d
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	dec a
	ld e, a
	jr .CheckNPCFarAheadEnd
	
.CheckNPCFarAheadDown
; Load the next X coordinate into d
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	inc a
	ld e, a
	jr .CheckNPCFarAheadEnd
	
.CheckNPCFarAheadLeft
; Load the next X coordinate into d
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	dec a
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerStandingMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
	
.CheckNPCFarAheadEnd:
; Find an object struct with coordinates equal to d,e
	farcall IsNPCAtCoord
	jr nc, .is_npc

	xor a
	ret

.CheckStrengthBoulder: ; 8036f

	ld hl, wOWState
	bit OWSTATE_STRENGTH, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .not_boulder

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 6, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 2, [hl]

	ld a, [wWalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and $fc
	or d
	ld [hl], a

	scf
	ret

.not_boulder
	xor a
	ret
; 8039e

.CheckLandPerms: ; 8039e
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [wWalkingTile]
	call .CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable:
	scf
	ret
; 803b4

.CheckLandPermsFarAhead:: ; 8039e
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotWalkable
	ld a, [wPlayerFacing]
	cp $04
	jr z, .CheckLandPermsFarAheadUp
	cp $00
	jr z, .CheckLandPermsFarAheadDown
	cp $08
	jr z, .CheckLandPermsFarAheadLeft
	cp $0c
	jr z, .CheckLandPermsFarAheadRight
	jr .NotWalkable
.CheckLandPermsFarAheadUp
	ld a, [wTileUpFar]
	cp COLL_GRIND
	jr z, .CheckLandPermsFarAheadEnd
	call .CheckWalkable
	jr c, .NotWalkable
	jr .CheckLandPermsFarAheadEnd
.CheckLandPermsFarAheadDown
	ld a, [wTileDownFar]
	cp COLL_GRIND
	jr z, .CheckLandPermsFarAheadEnd
	call .CheckWalkable
	jr c, .NotWalkable
	jr .CheckLandPermsFarAheadEnd
.CheckLandPermsFarAheadLeft
	ld a, [wTileLeftFar]
	cp COLL_GRIND
	jr z, .CheckLandPermsFarAheadEnd
	call .CheckWalkable
	jr c, .NotWalkable
	jr .CheckLandPermsFarAheadEnd
.CheckLandPermsFarAheadRight
	ld a, [wTileRightFar]
	cp COLL_GRIND
	jr z, .CheckLandPermsFarAheadEnd
	call .CheckWalkable
	jr c, .NotWalkable
.CheckLandPermsFarAheadEnd:
	xor a
	ret

.CheckSurfPerms: ; 803b4
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [wWalkingTile]
	call .CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable:
	scf
	ret
; 803ca

.BikeCheck: ; 803ca

	ld a, [wPlayerState]
	cp PLAYER_BIKE
	ret z
	cp PLAYER_SLIP
	ret
	
.SkateboardCheck: ; 803ca

	ld a, [wPlayerState]
	cp PLAYER_SKATEBOARD_MOVING
	ret z
	cp PLAYER_SKATEBOARD
	ret
	
;.TVRoomCheck
;	ld a, [wTileset]
;	cp TILESET_HAUNTED_TV
;	ret nz
;	eventflagcheck EVENT_SPOOKHOUSE_GHOSTBEGONE
;	ret nz
	
;	ld a, [wWalkingDirection]
;	cp UP
;	ret
	
.SnowCheck:
	ld a, [wTileset]
	cp TILESET_SNOW
	ret nz
	ld a, [wWalkingDirection]
	cp UP
	jr z, .snowupcheck
	cp DOWN
	jr z, .snowdowncheck
	cp LEFT
	jr z, .snowleftcheck
	cp RIGHT
	jr z, .snowrightcheck
.snowupcheck
	ld a, [wTileUp]
	jr .snowcheckcont
.snowdowncheck
	ld a, [wTileDown]
	jr .snowcheckcont
.snowleftcheck
	ld a, [wTileLeft]
	jr .snowcheckcont
.snowrightcheck
	ld a, [wTileRight]
.snowcheckcont
	cp COLL_TALL_GRASS
	ret
; 803d3

; Routine by Victoria Lacroix
; https://github.com/VictoriaLacroix/pokecrystal/commit/ed7f525d642cb02e84e856f2e506d2a6425d95db
.RunCheck:
	ld hl, wHaveFollower
	bit 0, [hl] ; ENGINE_BIKE_GEAR
	ret nz ;set
	ld a, [wWalkingDirection]
	cp STANDING
	ret z
	ld a, [wPlayerState]
	and a ; cp PLAYER_NORMAL
	jr nz, .checkifalreadyrunning
	jr .continueruncheck
.checkifalreadyrunning
	cp PLAYER_RUN
	ret nz
.continueruncheck
	ld a, [hJoypadDown]
	and B_BUTTON
	cp B_BUTTON
	ret

.CheckWalkable: ; 803d3
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTileCollision
	and a ; cp LANDTILE
	ret z
	scf
	ret
; 803da

.CheckNoJumpTile: ; 803d3
; Return 0 if tile a is land. Otherwise, return carry.

	ld a, [wWalkingTile]
;	call GetTileCollision
	cp COLL_NO_OLLIE
	jr z, .CheckNoJumpTileNope
	cp COLL_CAVE
	jr z, .CheckNoJumpTileNope
	cp COLL_ROCK_CLIMB
	jr z, .CheckNoJumpTileNope
	scf
	ret
.CheckNoJumpTileNope
	xor a
	ret
	
.CheckSurfable: ; 803da
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTileCollision
	cp WATERTILE
	jr z, .Water

; Can walk back onto land from water.
	and a ; cp LANDTILE
	jr z, .Land

	jr .Neither

.Water:
	xor a
	ret

.Land:
	ld a, 1
	and a
	ret

.Neither:
	scf
	ret
; 803ee

.BumpSound: ; 803ee
	eventflagcheck EVENT_SPOOKHOUSE_DARK
	ret nz
	ld a, [wTileset]
	cp TILESET_SNOW
	jr nz, .not_on_snowstorm_map
	eventflagcheck EVENT_SNOWSTORM_HAPPENING
	jr nz, .snowstorm
.not_on_snowstorm_map
	call CheckSFX
	ret c
	ld de, SFX_BUMP
	jp PlaySFX
; 803f9

.snowstorm
	ld a, [wCurSFX]
	cp SFX_SNOWSTORM_INTRO
	jr z, .skip
	cp SFX_SNOWSTORM
	jr z, .skip
	call CheckSFX
	ret c
.skip
	ld de, SFX_BUMP_SNOWSTORM
	jp PlaySFX

.GetOutOfWater: ; 803f9
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ret
; 80404

CheckStandingOnIce:: ; 80404
	ld a, [wPlayerTurningDirection]
	cp 0
	jr z, .not_ice
	cp $f0
	jr z, .not_ice
	ld a, [wPlayerStandingTile]
	cp COLL_ICE
	jr z, .ice
	ld a, [wPlayerState]
	cp PLAYER_SLIP
	jr nz, .not_ice

.ice
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .endice
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
.endice
	scf
	ret

.not_ice
	and a
	ret
; 80422

CheckSpinning::
	ld a, [wPlayerStandingTile]
	call CheckSpinTile
	jr z, .start_spin
	cp COLL_STOP_SPIN
	jr z, .stop_spin
	ld a, [wSpinning]
	and a
	ret

.start_spin
	ld a, c
	inc a
	ld [wSpinning], a
	and a
	ret

.stop_spin
	xor a
	ld [wSpinning], a
	ret

StopPlayerForEvent:: ; 80422
	ld hl, wPlayerNextMovement
	ld a, movement_step_sleep_1
	cp [hl]
	ret z

	ld [hl], a
	xor a
	ld [wPlayerTurningDirection], a
	ret
; 80430

CheckBikeGear::
	ld hl, wBikeGear
	bit 0, [hl] ; ENGINE_BIKE_GEAR
	ret nz
	ld a, 1
	ret
	
SkateboardTiles::
	db COLL_SKATE
	db COLL_SKATE_LEDGE_RIGHT
	db COLL_SKATE_LEDGE_LEFT
	db COLL_SKATE_LEDGE_UP
	db COLL_SKATE_LEDGE_DOWN
	db COLL_SKATE_LEDGE_DOWN_RIGHT
	db COLL_SKATE_LEDGE_DOWN_LEFT
	db COLL_SKATE_LEDGE_UP_RIGHT
	db COLL_SKATE_LEDGE_UP_LEFT
	db COLL_WARP_CARPET_RIGHT
	db COLL_WARP_CARPET_LEFT
	db COLL_WARP_CARPET_UP
	db COLL_WARP_CARPET_DOWN
	db COLL_GRIND
	db -1
