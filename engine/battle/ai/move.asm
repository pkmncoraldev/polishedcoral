AIChooseMove: ; 440ce
; Score each move in wEnemyMonMoves starting from wBuffer1. Lower is better.
; Pick the move with the lowest score.

	; Linking is handled elsewhere
	ld a, [wLinkMode]
	and a
	ret nz

	; No use picking a move if there's no choice.
	farcall CheckEnemyLockedIn
	ret nz

	; Default score is 20, unusable moves are set to 80.
	call SetEnemyTurn
	ld hl, wBuffer1 + 3
	ld a, 4
.unusable_loop
	dec a
	push af
	push hl
	farcall CheckUsableMove
	ld a, 20
	jr z, .unusable_next
	ld a, 80
.unusable_next
	pop hl
	ld [hl], a
	pop af
	dec hl
	and a
	jr nz, .unusable_loop

	ld a, [wBattleType]
	cp BATTLETYPE_LEGENDARY
	jr z, .legendary
	cp BATTLETYPE_SHINY_LEGENDARY
	jr z, .legendary
	; Wildmons choose moves at random
	ld a, [wBattleMode]
	dec a
	jr z, .DecrementScores
	jr .ApplyLayers
.legendary
	ld hl, TrainerClassAttributes + TRNATTR_AI_MOVE_WEIGHTS
	ld a, PLAYER_CORY
	jr .post_legendary
	
; Apply AI scoring layers depending on the trainer class.
.ApplyLayers:
	ld hl, TrainerClassAttributes + TRNATTR_AI_MOVE_WEIGHTS

	; If we have a battle in BattleTower just load the Attributes of the first wTrainerClass (Falkner)
	; so we have always the same AI, regardless of the loaded class of trainer
	ld a, [wInBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower_skip

	ld a, [wTrainerClass]
.post_legendary
	dec a
	ld bc, 7 ; Trainer2AI - Trainer1AI
	rst AddNTimes

.battle_tower_skip
	lb bc, CHECK_FLAG, 0
	push bc
	push hl

.CheckLayer:
	pop hl
	pop bc

	ld a, c
	cp 16 ; up to 16 scoring layers
	
	jr z, .CheckDebugMode

	push bc
	ld d, BANK(TrainerClassAttributes)
	predef FlagPredef
	ld d, c
	pop bc

	inc c
	push bc
	push hl

	ld a, d
	and a
	jr z, .CheckLayer

	ld a, [wOptions1]
	bit DEBUG_MODE, a
	jr z, .skip
	call AIDebug
	
.skip
	ld hl, AIScoringPointers
	dec c
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(AIScoring)
	call FarCall_hl

	jr .CheckLayer

.CheckDebugMode:
	ld a, [wOptions1]
	bit DEBUG_MODE, a
	jr z, .DecrementScores
	call AIDebug
	
; Decrement the scores of all moves one by one until one reaches 0.
.DecrementScores:
	ld hl, wBuffer1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES

.DecrementNextScore:
	; If the enemy has no moves, this will infinite.
	ld a, [de]
	inc de
	and a
	jr z, .DecrementScores

	; We are done whenever a score reaches 0
	dec [hl]
	jr z, .PickLowestScoreMoves

	; If we just decremented the fourth move's score, go back to the first move
	inc hl
	dec c
	jr z, .DecrementScores

	jr .DecrementNextScore

; In order to avoid bias towards the moves located first in memory, increment the scores
; that were decremented one more time than the rest (in case there was a tie).
; This means that the minimum score will be 1.
.PickLowestScoreMoves:
	ld a, c

.move_loop
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .move_loop

	ld hl, wBuffer1
	ld de, wEnemyMonMoves
	ld c, NUM_MOVES

; Give a score of 0 to a blank move
.loop2
	ld a, [de]
	and a
	jr nz, .skip_load
	ld [hl], a

; Disregard the move if its score is not 1
.skip_load
	ld a, [hl]
	dec a
	jr z, .keep
	xor a
	ld [hli], a
	jr .after_toss

.keep
	ld a, [de]
	ld [hli], a
.after_toss
	inc de
	dec c
	jr nz, .loop2

; Randomly choose one of the moves with a score of 1
.ChooseMove:
	ld hl, wBuffer1
	call Random
	and 3
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .ChooseMove

	ld [wCurEnemyMove], a
	ld a, c
	ld [wCurEnemyMoveNum], a
	ret
; 441af


AIScoringPointers: ; 441af
	dw AI_Basic
	dw AI_Setup
	dw AI_Types
	dw AI_Offensive
	dw AI_Smart
	dw AI_Opportunist
	dw AI_Aggressive
	dw AI_Cautious
	dw AI_Status
	dw AI_Risky
	dw AI_None
	dw AI_None
	dw AI_None
	dw AI_None
	dw AI_None
	dw AI_None
; 441cf

AIDebug:
; Prints out an AI score table and delays
	push hl
	push de
	push bc

	; Clear the text display
	hlcoord 1, 13
	push hl
	ld c, 4
	ld a, " "
.clear_loop
	ld b, 18
.clear_row
	ld [hli], a
	dec b
	jr nz, .clear_row
	inc hl
	inc hl
	dec c
	jr nz, .clear_loop

	; Print move names
	pop hl
	ld de, wEnemyMonMoves
	ld c, 4
.move_loop
	push de
	push bc
	ld [hl], "-"
	ld a, [de]
	inc de
	and a
	jr z, .get_score
	ld [wNamedObjectIndexBuffer], a
	push hl
	push de
	farcall CheckMultiMoveSlot2
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	farcall GetMultiMoveSlotName2
	jr .done
.not_multi_move_slot
	pop de
	pop hl
	call GetMoveName
.done
	ld de, wStringBuffer1
	call PlaceString
.get_score
	ld bc, MOVE_NAME_LENGTH
	add hl, bc
	pop bc
	push bc
	ld de, wBuffer1 - 1
	ld a, 5
.score_target
	inc de
	dec a
	cp c
	jr nz, .score_target

	lb bc, 1, 3
	push hl
	call PrintNum
	pop hl
	ld bc, SCREEN_WIDTH - MOVE_NAME_LENGTH
	add hl, bc
	pop bc
	pop de
	inc de
	dec c
	jr nz, .move_loop

	pop bc
	push bc
	hlcoord 18, 13
	ld a, c
	cp 10
	jr c, .numeric
	add "A" - "0" - 10
.numeric
	add "0"
	ld [hl], a

	call ApplyTilemap
;	ld c, 30
;	call DelayFrames
	call ButtonSound
	pop bc
	pop de
	pop hl
	ret
