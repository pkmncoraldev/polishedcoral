MimicCommand::
; mimic

	farcall ClearLastMove
	farcall BattleCommand_movedelay
	ld a, [wAttackMissed]
	and a
	jp nz, .fail
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld hl, wEnemyMonMoves
.player_turn
	farcall CheckHiddenOpponent
	jp nz, .fail
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	farcall GetBattleVar
	and a
	jp z, .fail
	cp STRUGGLE
	jr z, .fail
	ld b, a
	ld c, NUM_MOVES
.check_already_knows_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .check_already_knows_move
	dec hl
.find_mimic
	ld a, [hld]
	cp MIMIC
	jr nz, .find_mimic
	inc hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	farcall GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndexBuffer], a
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], 5
	
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurMove], a
	push hl
	push de
	farcall CheckMultiMoveSlot
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	farcall GetMultiMoveSlotName
	farcall CopyName1
	
	
	ld a, [hBattleTurn] ; Get user move name information. wStringBuffer1
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
.got_user_species2
	ld [wCurPartySpecies], a
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurMove], a
	farcall GetMultiMoveSlotName
	
	jr .done	
.not_multi_move_slot
	pop de
	pop hl
	farcall GetMoveName
	farcall AnimateCurrentMove
	ld hl, MimicLearnedMoveText
	jp StdBattleTextBox
.done
	farcall AnimateCurrentMove
	ld hl, MimicLearnedMoveText
	farcall StdBattleTextBox
	
	ld hl, wStringBuffer1
	ld a, [hli]
	ld b, a
	ld hl, wStringBuffer2
	ld a, [hli]
	cp b
	ret z
	
	ld hl, SketchedText2
	jp StdBattleTextBox

.fail
	farjp FailMimic
