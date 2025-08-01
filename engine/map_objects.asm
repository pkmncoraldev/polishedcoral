INCLUDE "data/sprites/facings.asm"
INCLUDE "data/sprites/map_objects.asm"

DeleteMapObject:: ; 4357
	push bc
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	push af
	ld h, b
	ld l, c
	ld bc, OBJECT_STRUCT_LENGTH
	xor a
	call ByteFill
	pop af
	cp -1
	jr z, .ok
	bit 7, a
	jr nz, .ok
	call GetMapObject
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld [hl], -1
.ok
	pop bc
	ret

HandleCurNPCStep:
	call .CheckObjectStillVisible
	ret c
	call .HandleStepType
	jp .HandleObjectAction

.CheckObjectStillVisible
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 6, [hl]
	ldh a, [hMapObjectIndexBuffer]
	and a
	jr nz, .notPlayer
; hardcode for crossing over connections
	ld a, [wYCoord]
	inc a
	jr z, .yes
	ld a, [wXCoord]
	inc a
	jr z, .yes
.notPlayer
	ld a, [wXCoord]
	ld e, a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .ok
	ld a, [wYCoord]
	ld e, a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .ok
	jr .yes

.ok
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 6, [hl]
	ld a, [wXCoord]
	ld e, a
	ld hl, OBJECT_INIT_X
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok2
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .ok2
	ld a, [wYCoord]
	ld e, a
	ld hl, OBJECT_INIT_Y
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok2
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .ok2
.yes
	and a
	ret

.ok2
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 1, [hl]
	jr nz, .yes2
	call DeleteMapObject
	scf
	ret

.yes2
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 6, [hl]
	and a
	ret

.HandleStepType
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .null_step_type
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OBJECT_DISABLE_STEP_TYPE, [hl]
	ret nz
	cp STEP_TYPE_SLEEP
	jr z, .map_object_movement_pattern
	jr .do_step_type

.null_step_type
	call ObjectMovementReset
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OBJECT_DISABLE_STEP_TYPE, [hl]
	ret nz
.map_object_movement_pattern
	call MapObjectMovementPattern
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	cp STEP_TYPE_SLEEP
	ret z
.do_step_type
	ld hl, StepTypesJumptable
	rst JumpTable
	ret

.HandleObjectAction
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE, [hl]
	jp nz, SetFacingStanding
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 6, [hl]
	jp nz, SetFacingStanding
	bit OBJECT_DISABLE_STEP_TYPE, [hl]
	jr nz, asm_4448
	ld de, Pointers445f ; use first column
	jr asm_444d

HandleMapObjectAction_Stationary:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE, [hl]
	jp nz, SetFacingStanding
asm_4448: ; use second column
	ld de, Pointers445f + 2
	; fallthrough

asm_444d:
	; call [4 * wObjectStructs[ObjInd, OBJECT_ACTION] + de]
	ld hl, OBJECT_ACTION
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

INCLUDE "engine/map_object_action.asm"

CopyNextCoordsTileToStandingCoordsTile:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld [hl], a
	call SetTallGrassFlags
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ret

CopyCurCoordsToNextCoords:
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld [hl], a
	ret

UpdateTallGrassFlags:
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OVERHEAD, [hl]
	jr z, .ok
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call SetTallGrassFlags
.ok
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	ret

SetTallGrassFlags: ; 4661
	ld hl, OBJECT_FLAGS2
	add hl, bc
	cp COLL_OVERHEAD
	jr z, .set
	cp COLL_LONG_GRASS
	jr z, .set
	cp COLL_TALL_GRASS
	jr z, .set
	cp COLL_FLOWERS
	jr z, .set
	cp COLL_FLOWERS_LEDGE_DOWN
	jr z, .set
	cp COLL_SEAWEED
	jr z, .set
	cp COLL_LEAVES
	jr z, .set
	res OVERHEAD, [hl]
	ret

.set
	set OVERHEAD, [hl]
	ret

EndSpriteMovement:
	xor a
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a ; OBJECT_30
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

InitStep:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit FIXED_FACING, [hl]
	jr nz, GetNextTile
	add a
	add a
	and %00001100
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
GetNextTile:
	call GetStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld a, d
	call GetStepVectorSign
	ld hl, OBJECT_MAP_X
	add hl, bc
	add [hl]
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, e
	call GetStepVectorSign
	ld hl, OBJECT_MAP_Y
	add hl, bc
	add [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld [hl], a
	ld e, a
	push bc
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	ret

AddStepVector:
	call GetStepVector
	jr nc, .notSlowStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %1
	jr nz, .gotDelta
	lb de, 0, 0
	jr .gotDelta
.notSlowStep
	cp 10 ; hardcoded duration of medium step
	jr nz, .gotDelta
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	cp 2 ; 2 is forced to a delta of 2 so that the deltas sum to 16
	jr z, .getNewDelta
	and %1 ; even duration means delta of 1
	jr z, .gotDelta
	; ld a, [hl]
	; cp 7 ; 7 and 1 are forced to 1 so that the deltas sum to 16
	; jr z, .gotDelta
	; dec a
	; jr z, .gotDelta
; otherwise, adjust delta
.getNewDelta
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %11
	add a
	add a
	add (StepVectors_FastStepType & $ff)
	ld l, a
	ld h, (StepVectors_FastStepType >> 8)
	jr nc, .noCarry
	inc h
.noCarry
	ld a, [hli]
	ld d, a
	ld e, [hl]
.gotDelta
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ret

GetStepVector:
; Return (x, y, duration, speed) in (d, e, a, h).
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00011111
	add a
	add a
	ld l, a
	ld h, 0
	ld de, StepVectors
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	push af
	push hl
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp (STEP_TYPE_SLOW << 2 | RIGHT) + 1
	jr c, .slowStep
	pop hl
	pop af
	and a
	ret
.slowStep
	pop hl
	pop af
	scf
	ret

StepVectors:
; x,  y, duration, speed
	; slow
	db  0,  1, 32, 1
	db  0, -1, 32, 1
	db -1,  0, 32, 1
	db  1,  0, 32, 1
	; normal
	db  0,  1, 16, 1
	db  0, -1, 16, 1
	db -1,  0, 16, 1
	db  1,  0, 16, 1
	; super fast/bike
	db  0,  4,  4, 4
	db  0, -4,  4, 4
	db -4,  0,  4, 4
	db  4,  0,  4, 4
	; fast/skateboard
StepVectors_FastStepType:
	db  0,  2,  8, 2
	db  0, -2,  8, 2
	db -2,  0,  8, 2
	db  2,  0,  8, 2
	; medium/running shoes
	; speed makes no sense here
	db  0,  1, 10, 2
	db  0, -1, 10, 2
	db -1,  0, 10, 2
	db  1,  0, 10, 2
	;no movement
    db  0,  0,  4, 4
    db  0,  0,  4, 4
    db  0,  0,  4, 4
    db  0,  0,  4, 4


GetStepVectorSign:
	add a
	ret z  ; 0 or 128
	ld a, 1
	ret nc ; 1 - 127
	ld a, -1
	ret    ; 129 - 255

UpdatePlayerStep:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00000011
	ld [wPlayerStepDirection], a
	call AddStepVector
	ld a, [wPlayerStepVectorX]
	add d
	ld [wPlayerStepVectorX], a
	ld a, [wPlayerStepVectorY]
	add e
	ld [wPlayerStepVectorY], a
	ld hl, wPlayerStepFlags
	set 5, [hl]
	ret

RestoreDefaultMovement:
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .ok
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	pop bc
	ret

.ok
	ld a, SPRITEMOVEFN_STANDING
	ret

IncrementObjectMovementByteIndex:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	inc [hl]
	ret

DecrementObjectMovementByteIndex:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	dec [hl]
	ret

MovementAnonymousJumptable:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

ClearObjectStructField28:
	ld hl, OBJECT_28
	add hl, bc
	ld [hl], 0
	ret

IncrementObjectStructField28:
	ld hl, OBJECT_28
	add hl, bc
	inc [hl]
	ret

Object28AnonymousJumptable:
	ld hl, OBJECT_28
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

ObjectMovementReset:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	push bc
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	call CopyNextCoordsTileToStandingCoordsTile
	call EndSpriteMovement
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

MapObjectMovementPattern:
	call ClearObjectStructField28
	call GetSpriteMovementFunction
	ld a, [hl]
	ld hl, .Pointers
	rst JumpTable
	ret

.Pointers:
	dw .Null_00                      ; SPRITEMOVEFN_00
	dw .RandomWalkY                  ; SPRITEMOVEFN_RANDOM_WALK_Y
	dw .RandomWalkX                  ; SPRITEMOVEFN_RANDOM_WALK_X
	dw .RandomWalkXY                 ; SPRITEMOVEFN_RANDOM_WALK_XY
	dw .RandomSpin1                  ; SPRITEMOVEFN_SLOW_RANDOM_SPIN
	dw .RandomSpin2                  ; SPRITEMOVEFN_FAST_RANDOM_SPIN
	dw .Standing                     ; SPRITEMOVEFN_STANDING
	dw .ObeyDPad                     ; SPRITEMOVEFN_OBEY_DPAD
	dw .Follow                       ; SPRITEMOVEFN_FOLLOW
	dw .Script                       ; SPRITEMOVEFN_SCRIPTED
	dw .Strength                     ; SPRITEMOVEFN_STRENGTH
	dw .FollowNotExact               ; SPRITEMOVEFN_FOLLOWNOTEXACT
	dw .MovementShadow               ; SPRITEMOVEFN_SHADOW
	dw .MovementEmote                ; SPRITEMOVEFN_EMOTE
	dw .MovementBigStanding          ; SPRITEMOVEFN_BIG_SNORLAX
	dw .MovementBouncing             ; SPRITEMOVEFN_BOUNCE
	dw .MovementScreenShake          ; SPRITEMOVEFN_SCREENSHAKE
	dw .MovementSpinClockwise        ; SPRITEMOVEFN_SPIN_CLOCKWISE
	dw .MovementSpinCounterclockwise ; SPRITEMOVEFN_SPIN_COUNTERCLOCKWISE
	dw .MovementBoulderDust          ; SPRITEMOVEFN_BOULDERDUST
	dw .MovementShakingGrass         ; SPRITEMOVEFN_GRASS
	dw .MovementSplashingPuddle      ; SPRITEMOVEFN_PUDDLE
	dw .MovementCutTree              ; SPRITEMOVEFN_CUT_TREE
	dw .MovementBigGyarados          ; SPRITEMOVEFN_BIG_GYARADOS
	dw .StandingFlip                 ; SPRITEMOVEFN_STANDING_FLIP
	dw .MovementTileDown   			 ; SPRITEMOVEFN_TILE_DOWN
	dw .MovementTileUp     			 ; SPRITEMOVEFN_TILE_UP
	dw .MovementTileLeft   			 ; SPRITEMOVEFN_TILE_LEFT
	dw .MovementTileRight  			 ; SPRITEMOVEFN_TILE_RIGHT
	dw .MovementArchTree             ; SPRITEMOVEFN_ARCH_TREE
	dw .MovementSailboatTop          ; SPRITEMOVEFN_SAILBOAT_TOP
	dw .MovementSailboatBottom       ; SPRITEMOVEFN_SAILBOAT_BOTTOM
	dw .MovementUmbrellaLeft ; 17
	dw .MovementUmbrellaRight ; 18
	dw .MovementBoatBob
	dw .MovementValve
	dw .MovementMallSign1
	dw .MovementMallSign2
	dw .MovementMallSign3
	dw .MovementMallSign4
	dw .MovementHangarLeft
	dw .MovementHangarRight
	dw .MovementLighthouse1
	dw .MovementLighthouse2
	dw .MovementLighthouse3
	dw .MovementHalfpipe1
	dw .MovementHalfpipe2
	dw .MovementTopHalf
	dw .MovementBottomHalf
	dw .MovementSunbeamView1
	dw .MovementSunbeamView2
	dw .MovementSunbeamView3
	dw .MovementSunbeamView4
	dw .MovementSunbeamView5
	dw .MovementSunbeamView6
	dw .MovementBather             ; SPRITEMOVEFN_BATHER
	dw .MovementSpinSteam ; SPRITEMOVEFN_SPIN_STEAM
	dw .MovementIceSkater ; SPRITEMOVEFN_ICESKATER
	dw .MovementCandle             ; SPRITEMOVEFN_CANDLE
	dw .MovementWalkInPlace             ; SPRITEMOVEFN_WALK_IN_PLACE
	dw .MovementBigMuk
	dw .MovementBigMuk2
	dw .MovementBigMuk3
	dw .MovementStall
	dw .MovementBinoculars1
	dw .MovementBinoculars2
	dw .MovementBalloons1
	dw .MovementBalloons2
	dw .MovementFossilMachine
	dw .MovementPCSign
	dw .MovementCardTable1
	dw .MovementCardTable2
	dw .MovementCardTable3
	dw .MovementCardTable4
	dw .MovementDealerDown
	dw .MovementDealerLeft
	dw .MovementDealerRight
	dw .MovementSailboatTopRight          ; SPRITEMOVEFN_SAILBOAT_TOP_RIGHT
	dw .MovementBaggage		; SPRITEMOVEFN_BAGGAGE
	dw .MovementCasino1
	dw .MovementCasino2
	dw .MovementShakingFlower
	dw .MovementTileUpDown            ; SPRITEMOVEFN_TILE_UP_DOWN
	dw .NoRender
	dw .MovementTileHalfwayLeft
	dw .MovementTileHalfwayRight
	dw .MovementCursola
	dw .MovementLemonade
	dw .MovementTrackPlayer

.RandomWalkY:
	call Random
	ldh a, [hRandomAdd]
	and %00000001
	jp .RandomWalkContinue

.RandomWalkX:
	call Random
	ldh a, [hRandomAdd]
	and %00000001
	or  %00000010
	jp .RandomWalkContinue

.RandomWalkXY:
	call Random
	ldh a, [hRandomAdd]
	and %00000011
	jp .RandomWalkContinue

.MovementBaggage:
	ld a, [wTileset]
	cp TILESET_LAB
	jp z, .baggage
	cp TILESET_DIVE
	jr z, .bubbles
	cp TILESET_AUTUMN
	jr z, .leaf
;shadow
	ld a, [wPlayerSpriteX]
	ld [wObject1SpriteX], a
	ld a, [wPlayerSpriteY]
	add $f
	ld [wObject1SpriteY], a
	ld a, [wPlayerStandingMapX]
	ld [wObject1StandingMapX], a
	ld a, [wPlayerStandingMapY]
	ld [wObject1StandingMapY], a
	ret
.bubbles:
	ld a, [wRanchRaceSeconds]
	cp 5
	jr z, .bubble_five
	ld a, 1
	ld [wRanchRaceFrames], a
	ld a, [wPlayerStandingMapX]
	ld [wObject1StandingMapX], a
	xor a
	ld [wObject1Flags + 1], a
	jp .return
.bubble_five
	xor a
	ld [wRanchRaceSeconds], a
	ld [wRanchRaceFrames], a
	ld a, [wPlayerSpriteX]
	ld [wObject1SpriteX], a
	ld a, [wPlayerSpriteY]
	ld [wObject1SpriteY], a
	ld a, [wPlayerStandingMapX]
	ld [wObject1StandingMapX], a
	ld [wObject1LastMapX], a
	ld a, [wPlayerStandingMapY]
	ld [wObject1StandingMapY], a
	ld a, [wPlayerStandingMapY]
	ld [wObject1LastMapY], a
	ret
	
.leaf
	farjp MovementLeaf
	
.baggage:
	ld a, [wRanchRaceSeconds]
	cp 0
	jr z, .zero
	cp 4
	jr z, .four
	cp 6
	jr z, .six
	cp 10
	jr z, .ten
	cp 12
	jr z, .twelve
	cp 13
	jr z, .thirteen
	cp 15
	jr z, .fifteen
.return
	ld a, [wRanchRaceSeconds]
	inc a
	ld [wRanchRaceSeconds], a
	ld a, [wRanchRaceFrames]
	and %00000011
	call InitStep
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret
.zero
	ld a, 0
	ld [wRanchRaceFrames], a
	jr .return
.four
.twelve
	ld a, 3
	ld [wRanchRaceFrames], a
	jr .return
.six
	ld a, 1
	ld [wRanchRaceFrames], a
	jr .return
.ten
.thirteen
	ld a, 2
	ld [wRanchRaceFrames], a
	jr .return
.fifteen
	ld a, 0
	ld [wRanchRaceSeconds], a
	ld [wRanchRaceFrames], a
	jr .return
	
.RandomSpin1:
	call Random
	ldh a, [hRandomAdd]
	and %00001100
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	jp RandomStepDuration_Slow

.RandomSpin2:
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %00001100
	ld d, a
	call Random
	ldh a, [hRandomAdd]
	and %00001100
	cp d
	jr nz, .keep
	xor %00001100
.keep
	ld [hl], a
	jp RandomStepDuration_Fast

.Standing:
	call CopyCurCoordsToNextCoords
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_05
.Null_00:
	ret
	
.NoRender:
	call CopyCurCoordsToNextCoords
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_NO_RENDER
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_05
	ret

.ObeyDPad:
.Movement0d:
	ld hl, Function5000
	jp HandleMovementData

.Follow:
	ld hl, GetFollowerNextMovementByte
	jp HandleMovementData

.Script:
	ld hl, GetMovementByte
	jp HandleMovementData

.Strength:
	call MovementAnonymousJumptable
	dw .Strength_Start
	dw .Strength_Stop

.Strength_Start:
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	cp COLL_HOLE
	jr z, .on_pit
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 2, [hl]
	res 2, [hl]
	jr z, .ok
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and %00000011
	call InitStep
	call Function6ec1
	jr c, .ok2
	ld de, SFX_STRENGTH
	call PlaySFX
	call SpawnStrengthBoulderDust
	call UpdateTallGrassFlags
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_0F
	ret

.ok2
	call CopyCurCoordsToNextCoords
.ok
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

.on_pit
	call IncrementObjectMovementByteIndex
.Strength_Stop:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

.FollowNotExact:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .standing
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .equal
	jr c, .less
	ld a, 3
	jr .done

.less
	ld a, 2
	jr .done

.equal
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr z, .standing
	jr c, .less2
	xor a
	jr .done

.less2
	ld a, 1
.done
	ld d, a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00011100
	or d
	pop bc
	jp NormalStep

.standing
	pop bc
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ret

.MovementTrackPlayer
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	sub 4
	ld e, a
	ld a, [wXCoord]
	cp e
	jr z, .down
	cp e
	jr nc, .right
	ld a, OW_LEFT
	jr .cont
.right
	ld a, OW_RIGHT
	jr .cont
.down
	ld a, OW_DOWN
.cont
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	ret

.MovementBigStanding:
	ld a, PERSON_ACTION_BIG_SNORLAX
	jp ._ActionA_StepType04

.MovementBouncing:
	ld a, PERSON_ACTION_BOUNCE
	jp ._ActionA_StepType04
	
.MovementBigGyarados:
	ld a, PERSON_ACTION_BIG_GYARADOS
	jp ._ActionA_StepType04

.MovementTileDown:
	ld a, PERSON_ACTION_TILE_DOWN
	jp ._ActionA_StepType04
	
.MovementTileUp:
	ld a, PERSON_ACTION_TILE_UP
	jp ._ActionA_StepType04
	
.MovementTileLeft:
	ld a, PERSON_ACTION_TILE_LEFT
	jp ._ActionA_StepType04
	
.MovementTileRight:
	ld a, PERSON_ACTION_TILE_RIGHT
	jp ._ActionA_StepType04

.MovementMallSign1:
	ld a, PERSON_ACTION_MALL_SIGN_1
	jp ._ActionA_StepType04
	
.MovementMallSign2:
	ld a, PERSON_ACTION_MALL_SIGN_2
	jp ._ActionA_StepType04
	
.MovementMallSign3:
	ld a, PERSON_ACTION_MALL_SIGN_3
	jp ._ActionA_StepType04
	
.MovementMallSign4:
	ld a, PERSON_ACTION_MALL_SIGN_4
	jp ._ActionA_StepType04
	
.MovementHangarLeft:
	ld a, PERSON_ACTION_HANGAR_LEFT
	jp ._ActionA_StepType04
	
.MovementHangarRight:
	ld a, PERSON_ACTION_HANGAR_RIGHT
	jp ._ActionA_StepType04
	
.MovementLighthouse1:
	ld a, PERSON_ACTION_LIGHTHOUSE_1
	jp ._ActionA_StepType04
	
.MovementLighthouse2:
	ld a, PERSON_ACTION_LIGHTHOUSE_2
	jp ._ActionA_StepType04
	
.MovementLighthouse3:
	ld a, PERSON_ACTION_LIGHTHOUSE_3
	jp ._ActionA_StepType04
	
.MovementHalfpipe1:
	ld a, PERSON_ACTION_HALFPIPE_1
	jp ._ActionA_StepType04
	
.MovementHalfpipe2:
	ld a, PERSON_ACTION_HALFPIPE_2
	jp ._ActionA_StepType04
	
.MovementTopHalf:
	ld a, PERSON_ACTION_TOP_HALF
	jp ._ActionA_StepType04
	
.MovementBottomHalf:
	ld a, PERSON_ACTION_BOTTOM_HALF
	jp ._ActionA_StepType04
	
.MovementSunbeamView1:
	ld a, PERSON_ACTION_SUNBEAM_VIEW_1
	jp ._ActionA_StepType04
	
.MovementSunbeamView2:
	ld a, PERSON_ACTION_SUNBEAM_VIEW_2
	jp ._ActionA_StepType04
	
.MovementSunbeamView3:
	ld a, PERSON_ACTION_SUNBEAM_VIEW_3
	jp ._ActionA_StepType04
	
.MovementSunbeamView4:
	ld a, PERSON_ACTION_SUNBEAM_VIEW_4
	jp ._ActionA_StepType04
	
.MovementSunbeamView5:
	ld a, PERSON_ACTION_SUNBEAM_VIEW_5
	jp ._ActionA_StepType04
	
.MovementSunbeamView6:
	ld a, PERSON_ACTION_SUNBEAM_VIEW_6
	jp ._ActionA_StepType04
	
.MovementBather
	ld a, PERSON_ACTION_BATHER
	jp ._ActionA_StepType04
	
.MovementCutTree:
	ld a, PERSON_ACTION_CUT_TREE
	jp ._ActionA_StepType04

.MovementArchTree:
	ld a, PERSON_ACTION_ARCH_TREE
	jp ._ActionA_StepType04

.MovementSailboatTop:
	ld a, PERSON_ACTION_SAILBOAT_TOP
	jp ._ActionA_StepType04

.MovementSailboatBottom:
	ld a, PERSON_ACTION_SAILBOAT_BOTTOM
	jp ._ActionA_StepType04
	
.MovementSailboatTopRight:
	ld a, PERSON_ACTION_SAILBOAT_TOP_RIGHT
	jp ._ActionA_StepType04
	
.MovementCandle:
	ld a, PERSON_ACTION_CANDLE
	jp ._ActionA_StepType04
	
.MovementCursola
	ld a, PERSON_ACTION_CURSOLA
	jp ._ActionA_StepType04
	
.MovementTileUpDown:
	ld a, PERSON_ACTION_TILE_UP_DOWN
	jp ._ActionA_StepType04
	
.MovementWalkInPlace:
	ld a, PERSON_ACTION_WALK_IN_PLACE
	jp ._ActionA_StepType04
	
.MovementBigMuk:
	ld a, PERSON_ACTION_BIG_MUK
	jp ._ActionA_StepType04
	
.MovementBigMuk2:
	ld a, PERSON_ACTION_BIG_MUK_2
	jp ._ActionA_StepType04
	
.MovementBigMuk3:
	ld a, PERSON_ACTION_BIG_MUK_3
	jr ._ActionA_StepType04
	
.MovementStall:
	ld a, PERSON_ACTION_STALL
	jr ._ActionA_StepType04
	
.MovementBinoculars1:
	ld a, PERSON_ACTION_BINOCULARS_1
	jr ._ActionA_StepType04
	
.MovementBinoculars2:
	ld a, PERSON_ACTION_BINOCULARS_2
	jr ._ActionA_StepType04
	
.MovementBalloons1:
	ld a, PERSON_ACTION_BALLOONS_1
	jr ._ActionA_StepType04
	
.MovementBalloons2:
	ld a, PERSON_ACTION_BALLOONS_2
	jr ._ActionA_StepType04
	
.MovementFossilMachine:
	ld a, PERSON_ACTION_FOSSIL_MACHINE
	jr ._ActionA_StepType04
	
.MovementPCSign:
	ld a, PERSON_ACTION_PC_SIGN
	jr ._ActionA_StepType04
	
.MovementCardTable1
	ld a, PERSON_ACTION_CARD_TABLE_1
	jr ._ActionA_StepType04
	
.MovementCardTable2
	ld a, PERSON_ACTION_CARD_TABLE_2
	jr ._ActionA_StepType04
	
.MovementCardTable3
	ld a, PERSON_ACTION_CARD_TABLE_3
	jr ._ActionA_StepType04
	
.MovementCardTable4
	ld a, PERSON_ACTION_CARD_TABLE_4
	jr ._ActionA_StepType04
	
.MovementLemonade
	ld a, PERSON_ACTION_LEMONADE
	jr ._ActionA_StepType04
	
.MovementDealerDown
	ld a, PERSON_ACTION_DEALER_DOWN
	jr ._ActionA_StepType04
	
.MovementDealerLeft
	ld a, PERSON_ACTION_DEALER_LEFT
	jr ._ActionA_StepType04
	
.MovementDealerRight
	ld a, PERSON_ACTION_DEALER_RIGHT
	jr ._ActionA_StepType04
	
.MovementTileHalfwayLeft
	ld a, PERSON_ACTION_TILE_HALFWAY_LEFT
	jr ._ActionA_StepType04
	
.MovementTileHalfwayRight
	ld a, PERSON_ACTION_TILE_HALFWAY_RIGHT
	jr ._ActionA_StepType04
	
.MovementCasino1:
	ld a, PERSON_ACTION_CASINO_1
	jp ._ActionA_StepType04
	
.MovementCasino2:
	ld a, PERSON_ACTION_CASINO_2
	jp ._ActionA_StepType04
	
.MovementUmbrellaLeft:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_UMBRELLA_LEFT
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementUmbrellaRight:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_UMBRELLA_RIGHT
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.StandingFlip:
	ld a, PERSON_ACTION_STAND_FLIP
._ActionA_StepType04
	push af
	call EndSpriteMovement
	pop af
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret
	
.MovementBoatBob
	ld a, PERSON_ACTION_BOAT_BOB
	jr ._ActionA_StepType04

.MovementValve:
	ld a, PERSON_ACTION_VALVE
	jr ._ActionA_StepType04
	
.MovementSpinCounterclockwise:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnLeft

.MovementSpinClockwise:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnRight
	
.MovementSpinSteam:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnSteam
	
.MovementIceSkater:
	call MovementAnonymousJumptable
	dw .MovementSpinInitFast
	dw .MovementSpinRepeatFast
	dw .MovementSpinTurnIceSkater

.MovementSpinInit:
	call EndSpriteMovement
	call IncrementObjectMovementByteIndex
.MovementSpinRepeat:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld a, $10
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	jp IncrementObjectMovementByteIndex
	
.MovementSpinInitFast:
	call EndSpriteMovement
	call IncrementObjectMovementByteIndex
.MovementSpinRepeatFast:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld a, $8
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	jp IncrementObjectMovementByteIndex

.MovementSpinTurnLeft:
	ld de, .DirectionData_Counterclockwise
	call .MovementSpinNextFacing
	jr .MovementSpinCounterclockwise

.DirectionData_Counterclockwise: ; 49c0
	db OW_RIGHT, OW_LEFT, OW_DOWN, OW_UP

.MovementSpinTurnRight:
	ld de, .DirectionData_Clockwise
	call .MovementSpinNextFacing
	jr .MovementSpinClockwise

.DirectionData_Clockwise: ; 49cc
	db OW_LEFT, OW_RIGHT, OW_UP, OW_DOWN
	
.MovementSpinTurnIceSkater:
	ld de, .DirectionData_Clockwise
	call .MovementSpinNextFacing
	jr .MovementIceSkater
	
.MovementSpinTurnSteam:
	ld de, .DirectionData_Steam
	call .MovementSpinNextFacing
	jr .MovementSpinSteam

.DirectionData_Steam: ; 49c0
	db OW_UP ; next state for OW_DOWN
    db OW_LEFT ; next state for OW_UP
    db OW_DOWN ; next state for OW_LEFT
    db OW_DOWN ; next state for OW_RIGHT

.MovementSpinNextFacing:
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %00001100
	rrca
	rrca
	push hl
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	jp DecrementObjectMovementByteIndex

.MovementShadow:
	call ._MovementShadow_Grass_Puddle_Dust_Emote
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SHADOW
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	inc a
	add a
	add 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	and 3
	ld d, 1 * 8 + 6
	cp DOWN
	jr z, .ok_13
	cp UP
	jr z, .ok_13
	ld d, 1 * 8 + 4
.ok_13
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], d
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.MovementEmote:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Puddle_Dust_Emote
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_EMOTE
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], -2 * 8
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.MovementBoulderDust:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Puddle_Dust_Emote
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BOULDER_DUST
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	inc a
	add a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	and %00000011
	ld e, a
	ld d, 0
	ld hl, .data_4a81
	add hl, de
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], d
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], e
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.data_4a81
	;   x,  y
	db  0, -4
	db  0,  8
	db  6,  2
	db -6,  2

.MovementShakingGrass:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Puddle_Dust_Emote
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_GRASS_SHAKE
	jr ._MovementGrass_Puddle_End

.MovementShakingFlower:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Puddle_Dust_Emote
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_FLOWER_SHAKE
	jr ._MovementGrass_Puddle_End

.MovementSplashingPuddle:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Puddle_Dust_Emote
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_PUDDLE_SPLASH
._MovementGrass_Puddle_End:
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	add -1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

._MovementShadow_Grass_Puddle_Dust_Emote:
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld d, b
	ld e, c
	pop bc
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.MovementScreenShake:
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_00
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	call ._MovementScreenShake
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], e
	ld hl, OBJECT_30
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_14
	ret

._MovementScreenShake:
	ld d, a
	and %00111111
	add a
	ld e, a
	ld a, d
	rlca
	rlca
	and %00000011
	ld d, a
	inc d
	ld a, 1
.loop
	dec d
	ret z
	add a
	jr .loop

.RandomWalkContinue:
	call InitStep
	call Function6ec1 ; check whether the object can move in that direction
	jr c, .NewDuration
	call UpdateTallGrassFlags
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP
	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .load_6
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_07
	ret

.load_6
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret

.NewDuration:
	call EndSpriteMovement
	call CopyCurCoordsToNextCoords
RandomStepDuration_Slow: ; 4b1d
	call Random
	ldh a, [hRandomAdd]
	and $fe
	jr SetRandomStepDuration
; 4b26

RandomStepDuration_Fast: ; 4b26
	call Random
	ldh a, [hRandomAdd]
	and $3e
SetRandomStepDuration: ; 4b2d
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	ret
; 4b45

StepTypesJumptable: ; 4b45
; These pointers use OBJECT_STEP_TYPE. See constants/sprite_constants.asm
	dw ObjectMovementReset      ; STEP_TYPE_00
	dw MapObjectMovementPattern ; STEP_TYPE_SLEEP
	dw NPCStep                  ; STEP_TYPE_NPC_WALK
	dw StepType03               ; STEP_TYPE_03
	dw StepType04               ; STEP_TYPE_04
	dw StepType05               ; STEP_TYPE_05
	dw PlayerStep               ; STEP_TYPE_PLAYER_WALK
	dw StepType07               ; STEP_TYPE_07
	dw NPCJump                  ; STEP_TYPE_NPC_JUMP
	dw PlayerJump               ; STEP_TYPE_PLAYER_JUMP
	dw PlayerOrNPCTurnStep      ; STEP_TYPE_HALF_STEP
	dw StepTypeBump             ; STEP_TYPE_BUMP
	dw TeleportFrom             ; STEP_TYPE_TELEPORT_FROM
	dw TeleportTo               ; STEP_TYPE_TELEPORT_TO
	dw Skyfall                  ; STEP_TYPE_SKYFALL
	dw StepType0f               ; STEP_TYPE_0F
	dw GotBiteStep              ; STEP_TYPE_GOT_BITE
	dw RockSmashStep            ; STEP_TYPE_ROCK_SMASH
	dw ReturnDigStep            ; STEP_TYPE_RETURN_DIG
	dw StepTypeTrackingObject   ; STEP_TYPE_TRACKING_OBJECT
	dw StepType14               ; STEP_TYPE_14
	dw SkyfallTop               ; STEP_TYPE_SKYFALL_TOP
; 4b79

WaitStep_InPlace: ; 4b79
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4b86

NPCJump: ; 4b86
	call Object28AnonymousJumptable
; anonymous dw
	dw .Jump
	dw .Land

.Jump:
	call AddStepVector
	call UpdateJumpPosition
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	call GetNextTile
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD, [hl]
	jp IncrementObjectStructField28

.Land:
	call AddStepVector
	call UpdateJumpPosition
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4bbf

PlayerJump: ; 4bbf
	call Object28AnonymousJumptable
; anonymous dw
	dw .initjump
	dw .stepjump
	dw .initland
	dw .stepland

.initjump
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
.stepjump
	call UpdateJumpPosition
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD, [hl]
	ld hl, wPlayerStepFlags
	set 6, [hl]
	set 4, [hl]
	jp IncrementObjectStructField28

.initland
	call GetNextTile
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
.stepland
	call UpdateJumpPosition
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set 6, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4c18

TeleportFrom: ; 4c18
	call Object28AnonymousJumptable
; anonymous dw
	dw .InitSpin
	dw .DoSpin
	dw .InitSpinRise
	dw .DoSpinRise
; 4c23

.InitSpin:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	call IncrementObjectStructField28
.DoSpin:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	jp IncrementObjectStructField28

.InitSpinRise:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], $10
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD, [hl]
	call IncrementObjectStructField28
.DoSpinRise:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_31
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4c89

TeleportTo: ; 4c89
	call Object28AnonymousJumptable
; anonymous dw
	dw .InitWait
	dw .DoWait
	dw .InitDescent
	dw .DoDescent
	dw .InitFinalSpin
	dw .DoFinalSpin
	dw .FinishStep
; 4c9a

.InitWait:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_00
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	jp IncrementObjectStructField28
; 4caa

.DoWait:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.InitDescent:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	jp IncrementObjectStructField28
; 4cc9

.DoDescent:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_31
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.InitFinalSpin:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	jp IncrementObjectStructField28
; 4cf5

.DoFinalSpin:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
.FinishStep:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4d14

Skyfall: ; 4d14
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Step
	dw .Fall
	dw .Finish
; 4d1f

.Init:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_00
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField28
.Step:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField28
.Fall:
	ld hl, OBJECT_31
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.Finish:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4d7e

GotBiteStep: ; 4d7e
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run
; 4d85

.Init:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 8
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	call IncrementObjectStructField28
.Run:
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld a, [hl]
	xor 1
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4daf

RockSmashStep: ; 4daf
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %00000001
	ld a, PERSON_ACTION_STAND
	jr z, .yes
	ld a, PERSON_ACTION_00
.yes
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	jp WaitStep_InPlace
; 4db5

ReturnDigStep: ; 4dc8
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %00000001
	ld a, PERSON_ACTION_SPIN
	jr z, .yes
	ld a, PERSON_ACTION_SPIN_FLICKER
.yes
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	jp WaitStep_InPlace
; 4ddd

StepType03: ; 4ddd
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4df0

StepTypeBump: ; 4dff
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4e0c

StepType05: ; 4e0c
	call Object28AnonymousJumptable
; anonymous dw
	dw .Reset
	dw StepType04

.Reset:
	call RestoreDefaultMovement
	call GetInitialFacing
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField28
StepType04: ; 4e21
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 4e2b

NPCStep: ; 4e2b
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4e47

StepType07: ; 4e47
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	jp RandomStepDuration_Slow
; 4e56

PlayerStep: ; 4e56
; AnimateStep?
	call Object28AnonymousJumptable
; anonymous dw
	dw .init
	dw .step

.init
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
.step
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set 6, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4e83

PlayerOrNPCTurnStep:
	call Object28AnonymousJumptable
; anonymous dw
	dw .init1
	dw .step1
	dw .init2
	dw .step2

.init1
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	ld [hl], 4
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, TURNING_SPEED
	ld [hl], a
	call IncrementObjectStructField28
.step1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.init2
	ld hl, OBJECT_29 ; new facing
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, TURNING_SPEED
	ld [hl], a
	call IncrementObjectStructField28
.step2
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

StepType0f: ; 4ecd
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	push bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld b, a
	farcall CopyDECoordsToMapObject
	pop bc
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 2, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4f04

StepTypeTrackingObject: ; 4f04
	ld hl, OBJECT_29
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .nope
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
.nope
	jp DeleteMapObject
; 4f33

StepType14: ; 4f33
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	xor a
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField28
.Run:
	ld hl, OBJECT_29
	add hl, bc
	ld d, [hl]
	ld a, [wPlayerStepVectorY]
	sub d
	ld [wPlayerStepVectorY], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	jr z, .ok
.return
	ld a, [hl]
	call .GetSign
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, [wPlayerStepVectorY]
	add d
	ld [wPlayerStepVectorY], a
	ret

.ok
	push bc
	push hl
	push de
	eventflagcheck EVENT_TEMPLE_RUMBLING
	pop de
	pop hl
	pop bc
	jr nz, .return
	jp DeleteMapObject

.GetSign:
	ld hl, OBJECT_30
	add hl, bc
	and 1
	ld a, [hl]
	ret z
	cpl
	inc a
	ret
; 4f77

SkyfallTop: ; 4f83
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SKYFALL
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField28

.Run:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], $60
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4fb2

UpdateJumpPosition: ; 4fd5
	call GetStepVector
	push af
	ld a, h
	ld hl, OBJECT_31
	add hl, bc
	ld e, [hl]
	add e
	ld [hl], a
	pop af
	cp 32 ; is duration slow jump?
	jr nz, .not_slow_jump
	srl e
.not_slow_jump
	srl e
	ld d, 0
	ld hl, .y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.y ; 4ff0
	db  -4,  -6,  -8, -10, -11, -12, -12, -12
	db -11, -10,  -9,  -8,  -6,  -4,   0,   0
; 5000

Function5000: ; unscripted?
; copy [wPlayerNextMovement] to [wPlayerMovement]
	ld a, [wPlayerNextMovement]
	ld hl, wPlayerMovement
	ld [hl], a
; load [wPlayerNextMovement] with movement_step_sleep_1
	ld a, movement_step_sleep_1
	ld [wPlayerNextMovement], a
; recover the previous value of [wPlayerNextMovement]
	ld a, [hl]
	ret
; 500e

GetMovementByte:
	ld hl, wMovementDataPointer
	jp _GetMovementByte
; 5015

_GetMovementPerson: ; 5037
	ld hl, GetMovementPerson
	jp HandleMovementData
; 503d

GetMovementPerson: ; 503d
	ld a, [wMovementPerson]
	ret
; 5041

HandleMovementData: ; 5041
	call .StorePointer
.loop
	xor a
	ld [wMovementByteWasControlSwitch], a
	call JumpMovementPointer
	call DoMovementFunction
	ld a, [wMovementByteWasControlSwitch]
	and a
	jr nz, .loop
	ret

.StorePointer:
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ret
; 505e

JumpMovementPointer: ; 505e
	ld hl, wMovementPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 5065

ContinueReadingMovement: ; 5065
	ld a, 1
	ld [wMovementByteWasControlSwitch], a
	ret
; 506b

DoMovementFunction: ; 506b
	push af
	call ApplyMovementToFollower
	pop af
	ld hl, MovementPointers
	rst JumpTable
	ret
; 5075

INCLUDE "engine/movement.asm"
; 54b8

ApplyMovementToFollower: ; 54b8
	ld e, a
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	ld a, [wObjectFollow_Leader]
	ld d, a
	ldh a, [hMapObjectIndexBuffer]
	cp d
	ret nz
	ld a, e
	cp movement_step_sleep_1
	ret z
	cp movement_step_end
	ret z
	cp movement_step_bump
	ret z
	cp movement_turn_step_right + 1
	ret c
	push af
	ld hl, wFollowerMovementQueueLength
	inc [hl]
	ld e, [hl]
	ld d, 0
	ld hl, wFollowMovementQueue
	add hl, de
	pop af
	ld [hl], a
	ret
; 54e6

GetFollowerNextMovementByte: ; 54e6
	ld hl, wFollowerMovementQueueLength
	ld a, [hl]
	and a
	jr z, .done
	cp -1
	jr z, .done
	dec [hl]
	ld e, a
	ld d, 0
	ld hl, wFollowMovementQueue
	add hl, de
	inc e
	ld a, -1
.loop
	ld d, [hl]
	ld [hld], a
	ld a, d
	dec e
	jr nz, .loop
	ret

.done
	call .CancelFollowIfLeaderMissing
	ret c
	ld a, movement_step_sleep_1
	ret

.CancelFollowIfLeaderMissing:
	ld a, [wObjectFollow_Leader]
	cp -1
	jr z, .nope
	push bc
	call GetObjectStruct
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	pop bc
	and a
	jr z, .nope
	and a
	ret

.nope
	ld a, -1
	ld [wObjectFollow_Follower], a
	ld a, movement_step_end
	scf
	ret
; 5529

SpawnShadow: ; 5529
	push bc
	ld de, .ShadowObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.ShadowObject:
	; vtile, palette, movement
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_SHADOW
; 5538
SpawnStrengthBoulderDust: ; 5538
	push bc
	ld de, .BoulderDustObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.BoulderDustObject:
	db $80, PAL_OW_BROWN, SPRITEMOVEDATA_BOULDERDUST
; 5547

SpawnEmote: ; 5547
	push bc
	ld de, .EmoteObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.EmoteObject:
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_EMOTE
; 5556

ShakeGrass: ; 5556
	push bc
	ld de, .data_5562
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.data_5562
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_GRASS
; 5565

ShakeFlower:
	push bc
	ld de, .data_5562
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.data_5562
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_FLOWER

ShakeSnow:
	push bc
	ld de, .snow_data
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.snow_data
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_GRASS

SplashPuddle:
	push bc
	ld de, .puddle_data
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.puddle_data
	db $80, PAL_OW_BLUE, SPRITEMOVEDATA_PUDDLE
; 5565

SplashPuddle2:
	push bc
	ld de, .puddle_data2
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.puddle_data2
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_PUDDLE

ShakeScreenOnce::
	push bc
	push af
	ld de, .ScreenShakeObject
	call CopyTempObjectData
	pop af
	ld a, 2
	ld [wTempObjectCopyRange], a
	call InitTempObject
	pop bc
	ret
	
.ScreenShakeObject:
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_SCREENSHAKE

ShakeScreen::
	push bc
	push af
	ld de, .ScreenShakeObject
	call CopyTempObjectData
	pop af
	ld [wTempObjectCopyRange], a
	call InitTempObject
	pop bc
	ret

.ScreenShakeObject:
	db $80, PAL_OW_SILVER, SPRITEMOVEDATA_SCREENSHAKE

DespawnEmote: ; 5579
	push bc
	ldh a, [hMapObjectIndexBuffer]
	ld c, a
	call .DeleteEmote
	pop bc
	ret

.DeleteEmote:
	ld de, wObjectStructs
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af
	ld hl, OBJECT_FLAGS1
	add hl, de
	bit EMOTE_OBJECT, [hl]
	jr z, .next
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	push bc
	xor a
	ld bc, OBJECT_STRUCT_LENGTH
	call ByteFill
	pop bc
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop af
	dec a
	jr nz, .loop
	ret
; 55ac

InitTempObject: ; 55ac
	call FindFirstEmptyObjectStruct
	ret nc
	ld d, h
	ld e, l
	farjp CopyTempObjectToObjectStruct
; 55b9

CopyTempObjectData: ; 55b9
; load into wTempObjectCopy:
; -1, -1, [de], [de + 1], [de + 2], [hMapObjectIndexBuffer], [NextMapX], [NextMapY], -1
; This spawns the object at the same place as whichever object is loaded into bc.
	ld hl, wTempObjectCopyMapObjectIndex
	ld [hl], -1
	inc hl
	ld [hl], -1
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ldh a, [hMapObjectIndexBuffer]
	ld [hli], a
	push hl
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], -1
	ret
; 55e0

UpdateMapObjectDataAndSprites:: ; 55e0
	ld a, [wVramState]
	bit 0, a
	ret z
	ld bc, wObjectStructs
	xor a
.loop
	ldh [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .ok
	call UpdateCurObjectData
.ok
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 5602

BattleStart_HideAllSpritesExceptBattleParticipants: ; 5602, called at battle start
	call MaskAllObjectStructs ; clear sprites
	ld a, PLAYER
	call RespawnObject ; respawn player
	ld a, [wBattleScriptFlags]
	bit 7, a
	jr z, .ok
	ldh a, [hLastTalked]
	and a
	jr z, .ok
	call RespawnObject ; respawn opponent
.ok
	jp _UpdateSprites
	

ReturnFromFly_SpawnOnlyPlayer: ; 561d
	call MaskAllObjectStructs ; clear sprites
	ld a, PLAYER
	call RespawnObject ; respawn player
	jp _UpdateSprites
; 5629

RespawnObject: ; 5629
	cp NUM_OBJECTS
	ret nc
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	ret z
	cp NUM_OBJECT_STRUCTS
	ret nc
	call GetObjectStruct
	call DoesObjectHaveASprite
	ret z
	call IsObjectOnScreen
	jr c, SetFacing_Standing
	call HandleMapObjectAction_Stationary
	xor a
	ret
; 5645

MaskAllObjectStructs: ; 5645
	xor a
	ld bc, wObjectStructs
.loop
	ldh [hMapObjectIndexBuffer], a
	call SetFacing_Standing
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 565c

UpdateCurObjectData: ; 565c
	ld a, [wPokePic]
	cp 0
	jr z, .not_pokepic
	push bc
	call CheckCurSpriteCoveredByTextBox
	pop bc
.not_pokepic
	jr c, SetFacing_Standing
	call IsObjectOnScreen
	jr c, SetFacing_Standing
	push bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	call UpdateTallGrassFlags
	call HandleMapObjectAction_Stationary
	xor a
	ret
; 5673

SetFacing_Standing: ; 5680
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], STANDING
	scf
	ret
; 5688

IsObjectOnScreen: ; 56a3
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	inc d
	inc e
	ld a, [wXCoord]
	cp d
	jr z, .equal_x
	jr nc, .nope
	add SCREEN_WIDTH / 2 + 1
	cp d
	jr c, .nope
.equal_x
	ld a, [wYCoord]
	cp e
	jr z, .equal_y
	jr nc, .nope
	add SCREEN_HEIGHT / 2 + 1
	cp e
	jr c, .nope
.equal_y
	xor a
	ret

.nope
	scf
	ret
; 56cd

CheckCurSpriteCoveredByTextBox: ; 56cd
; x coord
	ld a, [wPlayerBGMapOffsetX]
	ld d, a
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	add [hl]
	add d
	cp -2 * 8
	jr nc, .ok1
	cp SCREEN_WIDTH * 8
	jp nc, .nope
.ok1
	and %00000111
	ld d, 2
	cp 4
	jr c, .ok2
	ld d, 3
.ok2
	ld a, [hl]
	srl a
	srl a
	srl a
	cp SCREEN_WIDTH
	jr c, .ok3
	sub BG_MAP_WIDTH
.ok3
	ldh [hCurSpriteXCoord], a
; y coord
	ld a, [wPlayerBGMapOffsetY]
	ld e, a
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	add [hl]
	add e
	cp -2 * 8
	jr nc, .ok4
	cp SCREEN_HEIGHT * 8
	jr nc, .nope
.ok4
	and %00000111
	ld e, 2
	cp 4
	jr c, .ok5
	ld e, 3
.ok5
	ld a, [hl]
	srl a
	srl a
	srl a
	cp SCREEN_HEIGHT
	jr c, .ok6
	sub BG_MAP_HEIGHT
.ok6
	ldh [hCurSpriteYCoord], a
	; priority check
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit OAM_PRIORITY, [hl]
	jr z, .ok7
	ld a, d
	add 2
	ld d, a
	ld a, e
	add 2
	ld e, a
.ok7
	ld a, d
	ldh [hCurSpriteXPixel], a
.loop
	ldh a, [hCurSpriteXPixel]
	ld d, a
	ldh a, [hUsedSpriteTile]
	add e
	dec a
	cp SCREEN_HEIGHT
	jr nc, .ok9
	ld b, a
.next
	ldh a, [hUsedSpriteIndex]
	add d
	dec a
	cp SCREEN_WIDTH
	jr nc, .ok8
	ld c, a
	push bc
	call Coord2Attr
	pop bc
	bit OAM_TILE_BANK, [hl] ; show sprites standing on tiles $1:00-FF
	jr nz, .ok8
	push bc
	call Coord2Tile
	pop bc
	ld a, [hl]
	cp $7f ; hide sprites standing on tiles $0:7F-FF
	jr nc, .nope
.ok8
	dec d
	jr nz, .next
.ok9
	dec e
	jr nz, .loop
	and a
	ret

.nope
	scf
	ret
; 576a

HandleNPCStep::
	call .ResetStepVector
	xor a
	ld bc, wObjectStructs
.loop
	ldh [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	call nz, HandleCurNPCStep
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

.ResetStepVector
	xor a
	ld [wPlayerStepVectorX], a
	ld [wPlayerStepVectorY], a
	ld a, [wPlayerStepFlags]
	bit 6, a
	ld a, $0
	ld [wPlayerStepFlags], a
	ret nz
	dec a
	ld [wPlayerStepDirection], a
	ret

RefreshPlayerSprite: ; 579d
	call ReplaceKrisSprite
	ld a, movement_step_sleep_1
	ld [wPlayerNextMovement], a
	ld [wPlayerMovement], a
	xor a
	ld [wPlayerTurningDirection], a
	ld [wPlayerObjectStepFrame], a
	call .TryResetPlayerAction
	farcall CheckWarpFacingDown
	call c, SpawnInFacingDown
	jp .SpawnInCustomFacing
; 57bc

.TryResetPlayerAction: ; 57bc
	ld hl, wPlayerSpriteSetupFlags
	bit 7, [hl]
	ret z
	xor a
	ld [wPlayerAction], a
	ret
; 57ca

.SpawnInCustomFacing: ; 57ca
	ld hl, wPlayerSpriteSetupFlags
	bit 5, [hl]
	ret z
	ld a, [wPlayerSpriteSetupFlags]
	and 3
	add a
	add a
	jr ContinueSpawnFacing
; 57d9

SpawnInFacingDown: ; 57d9
	xor a
ContinueSpawnFacing: ; 57db
	ld bc, wPlayerStruct
	jp SetSpriteDirection
; 57e2

SetCopycatPalette:
	ld bc, wObject1Struct
	jr SetSpritePalette

SetPlayerPalette:: ; 57e2
	ld bc, wPlayerStruct
SetSpritePalette:
	and %10000000
	ret z
	ld a, d
	swap a
	and OAM_PALETTE
	ld d, a
	ld hl, OBJECT_PALETTE
	add hl, bc
	ld a, [hl]
	and $ff ^ OAM_PALETTE
	or d
	ld [hl], a
	ret
; 5803

StartFollow:: ; 5803
	push bc
	ld a, b
	call SetLeaderIfVisible
	pop bc
	ret c
	ld a, c
	call SetFollowerIfVisible
	farjp QueueFollowerFirstStep
; 5815

SetLeaderIfVisible: ; 5815
	call CheckObjectVisibility
	ret c
	ldh a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Leader], a
	ret
; 581f

SetFollowerIfVisible: ; 582c
	push af
	call ResetFollower
	pop af
	call CheckObjectVisibility
	ret c
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], SPRITEMOVEDATA_FOLLOWING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ldh a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Follower], a
	ret
; 5847

StopFollow:: ; 581f
	ld a, -1
	ld [wObjectFollow_Leader], a
	; fallthrough
ResetFollower: ; 5847
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	call GetObjectStruct
	call Function58e3
	ld a, -1
	ld [wObjectFollow_Follower], a
	ret
; 585c

SetFlagsForMovement_1:: ; 585c
	ld a, c
	call CheckObjectVisibility
	ret c
	push bc
	call Function587a
	pop bc
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 5, [hl]
	xor a
	ret
; 586e

Function587a: ; 587a
	ld bc, wObjectStructs
	xor a
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 5, [hl]
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 5897

SetFlagsForMovement_2:: ; 5897
	ld a, [wObjectFollow_Leader]
	cp -1
	ret z
	push bc
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	pop bc
	cp c
	ret nz
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	call GetObjectStruct
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 5, [hl]
	ret
; 58b9

ReleaseAllMapObjects:: ; 58b9
	push bc
	ld bc, wObjectStructs
	xor a
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 5, [hl]
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	pop bc
	ret
; 58d8

Function58e3: ; 58e3
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, Function5903
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	pop bc
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ret
; 5903

Function5903: ; 5903
	call GetSpriteDirection
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .standing_movefns
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ret

.standing_movefns
	db SPRITEMOVEDATA_STANDING_DOWN
	db SPRITEMOVEDATA_STANDING_UP
	db SPRITEMOVEDATA_STANDING_LEFT
	db SPRITEMOVEDATA_STANDING_RIGHT
; 5920
_UpdateSprites:: ; 5920
	ld a, [wVramState]
	bit 0, a
	ret z
	xor a
	ldh [hUsedSpriteIndex], a
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call InitSprites
	call .fill
	pop af
	ldh [hOAMUpdate], a
	ret

.fill
	ld a, [wVramState]
	bit 1, a
	ld b, wSpritesEnd % $100
	jr z, .ok
	ld b, 28 * 4
.ok
	ldh a, [hUsedSpriteIndex]
	cp b
	ret nc
	ld l, a
	ld h, wSprites / $100
	ld de, 4
	ld a, b
	ld c, SCREEN_HEIGHT_PX + 16
.loop
	ld [hl], c
	add hl, de
	cp l
	jr nz, .loop
	ret
; 5958

ApplyBGMapAnchorToObjects: ; 5958
	push hl
	push de
	push bc
	ld a, [wPlayerBGMapOffsetX]
	ld d, a
	ld a, [wPlayerBGMapOffsetY]
	ld e, a
	ld bc, wObjectStructs
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .skip
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
.skip
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	dec a
	jr nz, .loop
	xor a
	ld [wPlayerBGMapOffsetX], a
	ld [wPlayerBGMapOffsetY], a
	pop bc
	pop de
	pop hl
	ret
; 5991

InitSprites: ; 5991
DEF PRIORITY_LOW  EQU $10
DEF PRIORITY_NORM EQU $20
DEF PRIORITY_HIGH EQU $30
	call .DeterminePriorities
	ld c, PRIORITY_HIGH
	call .InitSpritesByPriority
	ld c, PRIORITY_NORM
	call .InitSpritesByPriority
	ld c, PRIORITY_LOW
	jp .InitSpritesByPriority

.DeterminePriorities:
	xor a
	ld hl, wMovementPointer
	ld bc, NUM_OBJECT_STRUCTS
	call ByteFill
	ld d, 0
	ld bc, wObjectStructs
	ld hl, wMovementPointer
.loop
	push hl
	call DoesObjectHaveASprite
	jr z, .skip
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .skip
; Define the sprite priority.
	ld e, PRIORITY_LOW
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 0, [hl]
	jr nz, .add
	ld e, PRIORITY_NORM
	bit 1, [hl]
	jr z, .add
	ld e, PRIORITY_HIGH
	jr .add

.skip
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .next

.add
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld a, d
	or e
	ld [hli], a
.next
	inc d
	ld a, d
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

.InitSpritesByPriority:
	ld hl, wMovementPointer
.next_sprite
	ld a, [hli]
	ld d, a
	and $f0
	ret z
	cp c
	jr nz, .next_sprite
	push bc
	push hl
	ld a, d
	and $f
	call .GetObjectStructPointer
	call .InitSprite
	pop hl
	pop bc
	jr .next_sprite

.InitSprite:
	ld hl, OBJECT_SPRITE_TILE
	add hl, bc
	ld a, [hl]
	and %01111111
	ldh [hCurSpriteTile], a
	xor a
	bit 7, [hl]
	jr nz, .skip1
	or %00001000
.skip1
	ld hl, OBJECT_FLAGS2
	add hl, bc
	ld e, [hl]
	bit 7, e
	jr z, .skip2
	or %10000000
.skip2
	bit 4, e
	jr z, .skip3
	or %00010000
.skip3
	ld hl, OBJECT_PALETTE
	add hl, bc
	ld d, a
	ld a, [hl]
	cp PAL_OW_SILVER
	jr z, .skip5
.skip6
	and %00000111
	or d
	ld d, a
	xor a
	bit OVERHEAD, e
	jr z, .skip4
	or %10000000
	jr .skip4
.skip5
	eventflagcheck EVENT_PLAYER_CUTSCENE_SILVER
	jr nz, .skip6
	ld a, [wPlayerPalette]
	jr .skip6
.skip4
	ldh [hCurSpriteOAMFlags], a
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	add [hl]
	add 8
	ld e, a
	ld a, [wPlayerBGMapOffsetX]
	add e
	ldh [hCurSpriteXPixel], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	add [hl]
	add 12
	ld e, a
	ld a, [wPlayerBGMapOffsetY]
	add e
	ldh [hCurSpriteYPixel], a
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	cp STANDING
	jp z, .done
	cp NUM_FACINGS
	jp nc, .done
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, Facings
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hUsedSpriteIndex]
	ld c, a
	ld b, wSprites / $100
	ld a, [hli]
	ldh [hUsedSpriteTile], a
	add c
	cp wSpritesEnd % $100
	jr nc, .full
.addsprite
	ldh a, [hCurSpriteYPixel]
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ldh a, [hCurSpriteXPixel]
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld e, [hl]
	inc hl
	ldh a, [hCurSpriteTile]
	bit 2, e
	jr z, .nope1
	xor a
.nope1
	add [hl]
	inc hl
	ld [bc], a

	ld a, d
	and %00001000
	jr z, .vram0
	ld a, [bc]
	cp $80
	jr c, .standing
	sub $40
	ld [bc], a
.standing
.vram0

	inc c
	ld a, e
	bit 1, a
	jr z, .nope2
	ldh a, [hCurSpriteOAMFlags]
	or e
.nope2
	and %11110000
	or d
	ld [bc], a
	inc c
	ldh a, [hUsedSpriteTile]
	dec a
	ldh [hUsedSpriteTile], a
	jr nz, .addsprite
	ld a, c
	ldh [hUsedSpriteIndex], a
.done
	xor a
	ret

.full
	scf
	ret

.GetObjectStructPointer:
	ld c, a
	ld b, 0
	ld hl, .Addresses
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

.Addresses: ; 5ace
	dw wPlayerStruct
	dw wObject1Struct
	dw wObject2Struct
	dw wObject3Struct
	dw wObject4Struct
	dw wObject5Struct
	dw wObject6Struct
	dw wObject7Struct
	dw wObject8Struct
	dw wObject9Struct
	dw wObject10Struct
	dw wObject11Struct
	dw wObject12Struct
; 5ae8
