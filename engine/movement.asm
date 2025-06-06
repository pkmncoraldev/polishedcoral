MovementPointers:
	dw Movement_turn_head_down        ; 00
	dw Movement_turn_head_up          ; 01
	dw Movement_turn_head_left        ; 02
	dw Movement_turn_head_right       ; 03
	dw Movement_turn_step_down        ; 04
	dw Movement_turn_step_up          ; 05
	dw Movement_turn_step_left        ; 06
	dw Movement_turn_step_right       ; 07
	dw Movement_slow_step_down        ; 08
	dw Movement_slow_step_up          ; 09
	dw Movement_slow_step_left        ; 0a
	dw Movement_slow_step_right       ; 0b
	dw Movement_step_down             ; 0c
	dw Movement_step_up               ; 0d
	dw Movement_step_left             ; 0e
	dw Movement_step_right            ; 0f
	dw Movement_big_step_down         ; 10
	dw Movement_big_step_up           ; 11
	dw Movement_big_step_left         ; 12
	dw Movement_big_step_right        ; 13
	dw Movement_slow_slide_step_down  ; 14
	dw Movement_slow_slide_step_up    ; 15
	dw Movement_slow_slide_step_left  ; 16
	dw Movement_slow_slide_step_right ; 17
	dw Movement_slide_step_down       ; 18
	dw Movement_slide_step_up         ; 19
	dw Movement_slide_step_left       ; 1a
	dw Movement_slide_step_right      ; 1b
	dw Movement_fast_slide_step_down  ; 1c
	dw Movement_fast_slide_step_up    ; 1d
	dw Movement_fast_slide_step_left  ; 1e
	dw Movement_fast_slide_step_right ; 1f
	dw Movement_turn_away_down        ; 20
	dw Movement_turn_away_up          ; 21
	dw Movement_turn_away_left        ; 22
	dw Movement_turn_away_right       ; 23
	dw Movement_turn_in_down          ; 24
	dw Movement_turn_in_up            ; 25
	dw Movement_turn_in_left          ; 26
	dw Movement_turn_in_right         ; 27
	dw Movement_turn_waterfall_down   ; 28
	dw Movement_turn_waterfall_up     ; 29
	dw Movement_turn_waterfall_left   ; 2a
	dw Movement_turn_waterfall_right  ; 2b
	dw Movement_slow_jump_step_down   ; 2c
	dw Movement_slow_jump_step_up     ; 2d
	dw Movement_slow_jump_step_left   ; 2e
	dw Movement_slow_jump_step_right  ; 2f
	dw Movement_jump_step_down        ; 30
	dw Movement_jump_step_up          ; 31
	dw Movement_jump_step_left        ; 32
	dw Movement_jump_step_right       ; 33
	dw Movement_fast_jump_step_down   ; 34
	dw Movement_fast_jump_step_up     ; 35
	dw Movement_fast_jump_step_left   ; 36
	dw Movement_fast_jump_step_right  ; 37
	dw Movement_remove_sliding        ; 38
	dw Movement_set_sliding           ; 39
	dw Movement_remove_fixed_facing   ; 3a
	dw Movement_fix_facing            ; 3b
	dw Movement_show_person           ; 3c
	dw Movement_hide_person           ; 3d
	dw Movement_step_sleep_1          ; 3e
	dw Movement_step_sleep_2          ; 3f
	dw Movement_step_sleep_3          ; 40
	dw Movement_step_sleep_4          ; 41
	dw Movement_step_sleep_5          ; 42
	dw Movement_step_sleep_6          ; 43
	dw Movement_step_sleep_7          ; 44
	dw Movement_step_sleep_8          ; 45
	dw Movement_step_sleep            ; 46
	dw Movement_step_end              ; 47
	dw Movement_step_resume           ; 48
	dw Movement_remove_person         ; 49
	dw Movement_step_loop             ; 4a
	dw Movement_4b                    ; 4b
	dw Movement_teleport_from         ; 4c
	dw Movement_teleport_to           ; 4d
	dw Movement_skyfall               ; 4e
	dw Movement_step_dig              ; 4f
	dw Movement_step_bump             ; 50
	dw Movement_fish_got_bite         ; 51
	dw Movement_fish_cast_rod         ; 52
	dw Movement_hide_emote            ; 53
	dw Movement_show_emote            ; 54
	dw Movement_step_shake            ; 55
	dw Movement_tree_shake            ; 56
	dw Movement_rock_smash            ; 57
	dw Movement_return_dig            ; 58
	dw Movement_skyfall_top           ; 59
	dw Movement_player_walk_step_down ; 5a
	dw Movement_player_walk_step_up   ; 5b
	dw Movement_player_walk_step_left ; 5c
	dw Movement_player_walk_step_right; 5d
	dw Movement_player_run_step_down  ; 5e
	dw Movement_player_run_step_up    ; 5f
	dw Movement_player_run_step_left  ; 60
	dw Movement_player_run_step_right ; 61
	dw Movement_run_step_down         ; 62
	dw Movement_run_step_up           ; 63
	dw Movement_run_step_left         ; 64
	dw Movement_run_step_right        ; 65
	dw Movement_fast_step_down        ; 66
	dw Movement_fast_step_up          ; 67
	dw Movement_fast_step_left        ; 68
	dw Movement_fast_step_right       ; 69
	dw Movement_pippi_run_step_down   ; 6a
	dw Movement_pippi_run_step_up     ; 6b
	dw Movement_pippi_run_step_left   ; 6c
	dw Movement_pippi_run_step_right  ; 6d
	dw Movement_pippi_fast_step_down  ; 6f
	dw Movement_pippi_fast_step_up    ; 70
	dw Movement_pippi_fast_step_left  ; 71
	dw Movement_pippi_fast_step_right ; 72
	dw Movement_skateboard_step_down  ; 73
	dw Movement_skateboard_step_up    ; 74
	dw Movement_skateboard_step_left  ; 75
	dw Movement_skateboard_step_right ; 76
	dw Movement_skateboard_slow_step_down  ; 77
	dw Movement_skateboard_slow_step_up    ; 78
	dw Movement_skateboard_slow_step_left  ; 79
	dw Movement_skateboard_slow_step_right ; 7a
	dw Movement_muk_up		;7b
	dw Movement_muk_down	;7c
	dw Movement_muk_sleep	;7d
	dw Movement_dealer_down
	dw Movement_dealer_left
	dw Movement_dealer_right
	dw Movement_jump_in_place
	
Movement_jump_in_place:
    ld a, STEP_TYPE_NONE << 2
    jp JumpStep2

Movement_teleport_from: ; 5129
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TELEPORT_FROM
	ret
; 5130

Movement_teleport_to: ; 5130
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TELEPORT_TO
	ret
; 5137

Movement_skyfall: ; 5137
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SKYFALL
	ret
; 513e

Movement_skyfall_top: ; 513e
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SKYFALL_TOP
	ret
; 5145

Movement_step_dig: ; 5145
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 516a

Movement_return_dig: ; 516a
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_RETURN_DIG
	ret
; 5189

Movement_fish_got_bite: ; 5189
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_FISHING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_GOT_BITE
	ret
; 5196

Movement_rock_smash: ; 5196
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_ROCK_SMASH
	ret
; 51ab

Movement_fish_cast_rod: ; 51ab
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_FISHING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 51b8

Movement_step_loop: ; 51b8
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hl], $0
	jp ContinueReadingMovement
; 51c1

Movement_step_resume:
Movement_step_end:
	call RestoreDefaultMovement
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hl], $0

	ld hl, wVramState
	res 7, [hl]

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 51fd

Movement_remove_person: ; 51fd
	call DeleteMapObject
	ld hl, wObjectFollow_Leader
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr nz, .not_leading
	ld [hl], -1

.not_leading
	ld hl, wVramState
	res 7, [hl]
	ret
; 5210

Movement_4b: ; 5210
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04

	ld hl, wVramState
	res 7, [hl]
	ret
	
Movement_dealer_down:
	ld a, PERSON_ACTION_DEALER_DOWN
	push af
	call EndSpriteMovement
	pop af
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ld hl, wVramState
	res 7, [hl]
	ret
	
Movement_dealer_left:
	ld a, PERSON_ACTION_DEALER_LEFT
	push af
	call EndSpriteMovement
	pop af
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ld hl, wVramState
	res 7, [hl]
	ret
	
Movement_dealer_right:
	ld a, PERSON_ACTION_DEALER_RIGHT
	push af
	call EndSpriteMovement
	pop af
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ld hl, wVramState
	res 7, [hl]
	ret

Movement_step_sleep_1: ; 5222
	ld a, 1
	jr Movement_step_sleep_common

Movement_step_sleep_2: ; 5226
	ld a, 2
	jr Movement_step_sleep_common

Movement_step_sleep_3: ; 522a
	ld a, 3
	jr Movement_step_sleep_common

Movement_step_sleep_4: ; 522e
	ld a, 4
	jr Movement_step_sleep_common

Movement_step_sleep_5: ; 5232
	ld a, 5
	jr Movement_step_sleep_common

Movement_step_sleep_6: ; 5236
	ld a, 6
	jr Movement_step_sleep_common

Movement_step_sleep_7: ; 523a
	ld a, 7
	jr Movement_step_sleep_common

Movement_step_sleep_8: ; 523e
	ld a, 8
	jr Movement_step_sleep_common

Movement_step_sleep: ; 5242
; parameters:
;	duration (DecimalParam)
	call JumpMovementPointer
	; fallthrough

Movement_step_sleep_common: ; 5247
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 525f

Movement_muk_sleep: ; 5242
; parameters:
;	duration (DecimalParam)
;	call JumpMovementPointer
	ld a, 1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BIG_MUK

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

Movement_step_bump: ; 525f
	ld a, 1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_BUMP

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BUMP

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5279

Movement_tree_shake: ; 5279
	ld a, 24
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_WEIRD_TREE

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5293

Movement_remove_sliding: ; 5293
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res SLIDING, [hl]
	jp ContinueReadingMovement
; 529c

Movement_set_sliding: ; 529c
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set SLIDING, [hl]
	jp ContinueReadingMovement
; 52a5

Movement_remove_fixed_facing: ; 52a5
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res FIXED_FACING, [hl]
	jp ContinueReadingMovement
; 52ae

Movement_fix_facing: ; 52ae
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set FIXED_FACING, [hl]
	jp ContinueReadingMovement
; 52b7

Movement_show_person: ; 52b7
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res INVISIBLE, [hl]
	jp ContinueReadingMovement
; 52c0

Movement_hide_person: ; 52c0
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set INVISIBLE, [hl]
	jp ContinueReadingMovement
; 52c9

Movement_hide_emote: ; 52c9
	call DespawnEmote
	jp ContinueReadingMovement
; 52cf

Movement_show_emote: ; 52cf
	call SpawnEmote
	jp ContinueReadingMovement
; 52d5

Movement_step_shake: ; 52d5
; parameters:
;	displacement (DecimalParam)

	call JumpMovementPointer
	call ShakeScreen
	jp ContinueReadingMovement
; 52de

Movement_turn_head_down: ; 52de
	ld a, OW_DOWN
	jr TurnHead

Movement_turn_head_up: ; 52e2
	ld a, OW_UP
	jr TurnHead

Movement_turn_head_left: ; 52e6
	ld a, OW_LEFT
	jr TurnHead

Movement_turn_head_right: ; 52ea
	ld a, OW_RIGHT
	; fallthrough

TurnHead: ; 52ee
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5300

Movement_slow_step_down:
	ld a, STEP_TYPE_SLOW << 2 | DOWN
	jp Movement_do_step

Movement_slow_step_up:
	ld a, STEP_TYPE_SLOW << 2 | UP
	jp Movement_do_step

Movement_slow_step_left:
	ld a, STEP_TYPE_SLOW << 2 | LEFT
	jp Movement_do_step

Movement_slow_step_right:
	ld a, STEP_TYPE_SLOW << 2 | RIGHT
	jp Movement_do_step

Movement_step_down:
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp Movement_do_step

Movement_step_up:
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp Movement_do_step

Movement_step_left:
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp Movement_do_step

Movement_step_right:
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp Movement_do_step

Movement_fast_step_down:
	ld a, STEP_TYPE_FAST << 2 | DOWN
	jp Movement_do_step

Movement_fast_step_up:
	ld a, STEP_TYPE_FAST << 2 | UP
	jp Movement_do_step

Movement_fast_step_left:
	ld a, STEP_TYPE_FAST << 2 | LEFT
	jp Movement_do_step

Movement_fast_step_right:
	ld a, STEP_TYPE_FAST << 2 | RIGHT
	jp Movement_do_step

Movement_pippi_run_step_down:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
;	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | DOWN  ; STEP_TYPE_MEDIUM
	jp Movement_do_run

Movement_pippi_run_step_up:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
;	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | UP    ; STEP_TYPE_MEDIUM
	jp Movement_do_run

Movement_pippi_run_step_left:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
;	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | LEFT  ; STEP_TYPE_MEDIUM
	jp Movement_do_run

Movement_pippi_run_step_right:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
;	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | RIGHT ; STEP_TYPE_MEDIUM
	jp Movement_do_run
	
Movement_pippi_fast_step_down:
	ld a, STEP_TYPE_SUPER_FAST << 2 | DOWN
	jp Movement_do_run
	
Movement_pippi_fast_step_up:
	ld a, STEP_TYPE_SUPER_FAST << 2 | UP
	jp Movement_do_run
	
Movement_pippi_fast_step_left:
	ld a, STEP_TYPE_SUPER_FAST << 2 | LEFT
	jp Movement_do_run
	
Movement_pippi_fast_step_right:
	ld a, STEP_TYPE_SUPER_FAST << 2 | RIGHT
	jp Movement_do_run
	
Movement_skateboard_step_down:
	ld a, STEP_TYPE_FAST << 2 | DOWN
	jp Movement_do_skateboard

Movement_skateboard_step_up:
	ld a, STEP_TYPE_FAST << 2 | UP
	jp Movement_do_skateboard

Movement_skateboard_step_left:
	ld a, STEP_TYPE_FAST << 2 | LEFT
	jp Movement_do_skateboard

Movement_skateboard_step_right:
	ld a, STEP_TYPE_FAST << 2 | RIGHT
	jp Movement_do_skateboard
	
Movement_skateboard_slow_step_down:
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp Movement_do_skateboard

Movement_skateboard_slow_step_up:
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp Movement_do_skateboard

Movement_skateboard_slow_step_left:
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp Movement_do_skateboard

Movement_skateboard_slow_step_right:
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp Movement_do_skateboard
	
Movement_muk_up:
	ld a, STEP_TYPE_SLOW << 2 | UP
	jp MukStep
	
Movement_muk_down:
	ld a, STEP_TYPE_SLOW << 2 | DOWN
	jp MukStep2
		
Movement_big_step_down:
	ld a, STEP_TYPE_SUPER_FAST << 2 | DOWN
	jr Movement_do_step

Movement_big_step_up:
	ld a, STEP_TYPE_SUPER_FAST << 2 | UP
	jr Movement_do_step

Movement_big_step_left:
	ld a, STEP_TYPE_SUPER_FAST << 2 | LEFT
	jr Movement_do_step

Movement_big_step_right:
	ld a, STEP_TYPE_SUPER_FAST << 2 | RIGHT
Movement_do_step:
	ld d, PERSON_ACTION_STEP
Movement_normal_step:
	jp NormalStep

Movement_player_walk_step_down:
	push bc
	ld a, [wWalkingTile]
	cp COLL_STAIRS
	jr z, .skip
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .skip
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
.skip
	pop bc
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp Movement_do_step

Movement_player_walk_step_up:
	push bc
	ld a, [wPlayerStandingTile]
	cp COLL_STAIRS
	jr z, .skip
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .skip
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
.skip
	pop bc
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp Movement_do_step

Movement_player_walk_step_left:
	push bc
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .skip
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
.skip
	pop bc
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp Movement_do_step

Movement_player_walk_step_right:
	push bc
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .skip
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
.skip
	pop bc
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp Movement_do_step
	
Movement_player_run_step_down:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | DOWN  ; STEP_TYPE_MEDIUM
	jp Movement_do_step

Movement_player_run_step_up:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | UP    ; STEP_TYPE_MEDIUM
	jp Movement_do_step

Movement_player_run_step_left:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | LEFT  ; STEP_TYPE_MEDIUM
	jp Movement_do_step

Movement_player_run_step_right:
	push bc
	ld a, PLAYER_RUN
	ld [wPlayerState], a
	pop bc
	ld a, STEP_TYPE_MEDIUM << 2 | RIGHT ; STEP_TYPE_MEDIUM
	jp Movement_do_step
	
Movement_run_step_down:
	ld a, STEP_TYPE_MEDIUM << 2 | DOWN  ; STEP_TYPE_MEDIUM
	jp Movement_do_run

Movement_run_step_up:
	ld a, STEP_TYPE_MEDIUM << 2 | UP    ; STEP_TYPE_MEDIUM
	jp Movement_do_run

Movement_run_step_left:
	ld a, STEP_TYPE_MEDIUM << 2 | LEFT  ; STEP_TYPE_MEDIUM
	jp Movement_do_run

Movement_run_step_right:
	ld a, STEP_TYPE_MEDIUM << 2 | RIGHT ; STEP_TYPE_MEDIUM
Movement_do_run:
	ld d, PERSON_ACTION_RUN
	jp Movement_normal_step
	
Movement_do_skateboard:
	ld d, PERSON_ACTION_SKATEBOARD
	jp Movement_normal_step

Movement_turn_away_down: ; 533c
	ld a, STEP_TYPE_SLOW << 2 | DOWN
	jp TurningStep
; 5341

Movement_turn_away_up: ; 5341
	ld a, STEP_TYPE_SLOW << 2 | UP
	jp TurningStep
; 5346

Movement_turn_away_left: ; 5346
	ld a, STEP_TYPE_SLOW << 2 | LEFT
	jp TurningStep
; 534b

Movement_turn_away_right: ; 534b
	ld a, STEP_TYPE_SLOW << 2 | RIGHT
	jp TurningStep
; 5350

Movement_turn_in_down: ; 5350
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp TurningStep
; 5355

Movement_turn_in_up: ; 5355
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp TurningStep
; 535a

Movement_turn_in_left: ; 535a
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp TurningStep
; 535f

Movement_turn_in_right: ; 535f
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp TurningStep
; 5364

Movement_turn_waterfall_down: ; 5364
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp TurningStep
; 5369

Movement_turn_waterfall_up: ; 5369
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp TurningStep
; 536e

Movement_turn_waterfall_left: ; 536e
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp TurningStep
; 5373

Movement_turn_waterfall_right: ; 5373
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp TurningStep
; 5378


Movement_slow_slide_step_down: ; 5378
	ld a, STEP_TYPE_SLOW << 2 | DOWN
	jp SlideStep
; 537d

Movement_slow_slide_step_up: ; 537d
	ld a, STEP_TYPE_SLOW << 2 | UP
	jp SlideStep
; 5382

Movement_slow_slide_step_left: ; 5382
	ld a, STEP_TYPE_SLOW << 2 | LEFT
	jp SlideStep
; 5387

Movement_slow_slide_step_right: ; 5387
	ld a, STEP_TYPE_SLOW << 2 | RIGHT
	jp SlideStep
; 538c

Movement_slide_step_down: ; 538c
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp SlideStep
; 5391

Movement_slide_step_up: ; 5391
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp SlideStep
; 5396

Movement_slide_step_left: ; 5396
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp SlideStep
; 539b

Movement_slide_step_right: ; 539b
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp SlideStep
; 53a0

Movement_fast_slide_step_down: ; 53a0
	ld a, STEP_TYPE_FAST << 2 | DOWN
	jp SlideStep
; 53a5

Movement_fast_slide_step_up: ; 53a5
	ld a, STEP_TYPE_FAST << 2 | UP
	jp SlideStep
; 53aa

Movement_fast_slide_step_left: ; 53aa
	ld a, STEP_TYPE_FAST << 2 | LEFT
	jp SlideStep
; 53af

Movement_fast_slide_step_right: ; 53af
	ld a, STEP_TYPE_FAST << 2 | RIGHT
	jp SlideStep
; 53b4

Movement_slow_jump_step_down: ; 53b4
	ld a, STEP_TYPE_SLOW << 2 | DOWN
	jp JumpStep
; 53b9

Movement_slow_jump_step_up: ; 53b9
	ld a, STEP_TYPE_SLOW << 2 | UP
	jp JumpStep
; 53be

Movement_slow_jump_step_left: ; 53be
	ld a, STEP_TYPE_SLOW << 2 | LEFT
	jp JumpStep
; 53c3

Movement_slow_jump_step_right: ; 53c3
	ld a, STEP_TYPE_SLOW << 2 | RIGHT
	jp JumpStep
; 53c8

Movement_jump_step_down: ; 53c8
	ld a, STEP_TYPE_NORMAL << 2 | DOWN
	jp JumpStep
; 53cd

Movement_jump_step_up: ; 53cd
	ld a, STEP_TYPE_NORMAL << 2 | UP
	jp JumpStep
; 53d2

Movement_jump_step_left: ; 53d2
	ld a, STEP_TYPE_NORMAL << 2 | LEFT
	jp JumpStep
; 53d7

Movement_jump_step_right: ; 53d7
	ld a, STEP_TYPE_NORMAL << 2 | RIGHT
	jp JumpStep
; 53dc

Movement_fast_jump_step_down: ; 53dc
	ld a, STEP_TYPE_SUPER_FAST << 2 | DOWN
	jp JumpStep
; 53e1

Movement_fast_jump_step_up: ; 53e1
	ld a, STEP_TYPE_SUPER_FAST << 2 | UP
	jp JumpStep
; 53e6

Movement_fast_jump_step_left: ; 53e6
	ld a, STEP_TYPE_SUPER_FAST << 2 | LEFT
	jp JumpStep
; 53eb

Movement_fast_jump_step_right: ; 53eb
	ld a, STEP_TYPE_SUPER_FAST << 2 | RIGHT
	jp JumpStep
; 53f0


Movement_turn_step_down: ; 53f0
	ld a, OW_DOWN
	jr TurnStep

Movement_turn_step_up: ; 53f4
	ld a, OW_UP
	jr TurnStep

Movement_turn_step_left: ; 53f8
	ld a, OW_LEFT
	jr TurnStep

Movement_turn_step_right: ; 53fc
	ld a, OW_RIGHT
	; fallthrough

TurnStep: ; 5400
	ld hl, OBJECT_29 ; new facing
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_HALF_STEP
	ret
; 5412

NormalStep: ; 5412
	push de
	call InitStep
	call UpdateTallGrassFlags
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP
	pop de
	ld [hl], d

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE, [hl]
	jr nz, .skip_effect

	ld a, [wMapGroup]
	cp GROUP_FAKE_ROUTE_1
	jr z, .skip_effect

	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	cp COLL_LONG_GRASS
	jr z, .shake_grass
	cp COLL_TALL_GRASS
	jr z, .shake_grass
	cp COLL_SAND
	jr z, .shake_grass
	cp COLL_SEAWEED
	jr z, .shake_grass
	cp COLL_LEAVES
	jr z, .shake_grass
	cp COLL_FLOWERS
	jr z, .shake_flower
	cp COLL_FLOWERS_LEDGE_DOWN
	jr z, .shake_flower
	cp COLL_PUDDLE
	jr nz, .skip_effect
	call SplashPuddle
	jr .skip_effect

;.check_bathing
;	ld a, [wPlayerState]
;	cp PLAYER_BATHING
;	jr nz, .skip_effect
;	call SplashPuddle2
;	jr .skip_effect
	
.shake_grass
	ld a, [wTileset]
	cp TILESET_SNOW
	jr z, .snow
	call ShakeGrass
	jr .skip_effect
.shake_flower
	call ShakeFlower
	jr .skip_effect
.snow
	call ShakeSnow

.skip_effect
	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret
; 5446

TurningStep: ; 5446
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN

	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret
; 5468


SlideStep: ; 5468
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret
; 548a

MukStep: ; 5468
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BIG_MUK_2

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret
	
MukStep2: ; 5468
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BIG_MUK_3

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret
	
MukStep3: ; 5468
	ld a, 1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BIG_MUK

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

JumpStep: ; 548a
	call InitStep
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], $0

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP

.cont
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD, [hl]

	call SpawnShadow

	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_JUMP
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_JUMP
	ret

JumpStep2: ; 548a
	call InitStep
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], $0

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD, [hl]

	call SpawnShadow

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_JUMP
	ret