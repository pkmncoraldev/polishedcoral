BattleCommand_metronome:
	call ClearLastMove
	call CheckUserIsCharging
	jr nz, .asm_3742b

	ld a, [wKickCounter]
	push af
	call BattleCommand_lowersub
	pop af
	ld [wKickCounter], a

.asm_3742b
	call LoadMoveAnim

.GetMove:
	call BattleRandom
	cp STRUGGLE
	jr z, .GetMove

; None of the moves in MetronomeExcepts.
	push af
	ld de, 1
	ld hl, MetronomeExcepts
	call IsInArray
	pop bc
	jr c, .GetMove

; No moves the user already has.
	ld a, b
	call CheckUserMove
	jr z, .GetMove


	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], b
	call UpdateMoveData
	jp ResetTurn

MetronomeExcepts:
	db NO_MOVE
	db DESTINY_BOND
	db ENDURE
	db METRONOME
	db PROTECT
	db SKETCH
	db SNORE
	db TRANSFORM_SPLASH
	db SWEET_KISS
	db -1
