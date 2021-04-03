BattleCommand_lockon:
; lockon

	call CheckSubstituteOpp
	jr nz, .fail

	ld a, [wAttackMissed]
	and a
	jr nz, .fail

	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	set SUBSTATUS_LOCK_ON, [hl]
	
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	ld hl, MindReaderUsers
	ld de, 1
	call IsInArray
	jr nc, .not_mind_reader
	ld a, $1
	jr .got_kick_counter
.not_mind_reader
	xor a
.got_kick_counter
	
	ld [wKickCounter], a
	
	call AnimateCurrentMove

	ld hl, TookAimText
	jp StdBattleTextBox

.fail
	call AnimateFailedMove
	jp PrintDidntAffect

MindReaderUsers:
	db SHROOMISH
	db BRELOOM
	db POLIWAG
	db POLIWHIRL
	db POLIWRATH
	db POLITOED
	db -1