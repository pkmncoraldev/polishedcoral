MirrorMoveCommand:
; mirrormove

	call ClearLastMove

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed

	call CheckUserMove
	jr nz, .use

.failed
	call AnimateFailedMove

	ld hl, MirrorMoveFailedText
	call StdBattleTextBox
	jp EndMoveEffect

.use
	ld a, b
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a

	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l
	
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurMove], a
	push hl
	push de
	farcall CheckMultiMoveSlot
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	pop af
	
	dec a
	call GetMoveData
	push af
	ld a, [hBattleTurn] ; Get user move name information. wStringBuffer1
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
.got_user_species
	ld [wCurPartySpecies], a
	ld a, 1
	ld [wMirrorMoveUsed], a
	pop af
	farcall GetMultiMoveSlotName
	call CopyName1
	ld a, [wEnemyMonSpecies]
	ld [wCurPartySpecies], a
	call CheckUserIsCharging
	jr nz, .done1

	ld a, [wKickCounter]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wKickCounter], a

.done1
	call BattleCommand_movedelay
	jp ResetTurn
	
.not_multi_move_slot
	pop de
	pop hl
	pop af

	dec a
	call GetMoveData
	call GetMoveName
	call CopyName1
	call CheckUserIsCharging
	jr nz, .done2

	ld a, [wKickCounter]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wKickCounter], a

.done2
	call BattleCommand_movedelay
	jp ResetTurn
