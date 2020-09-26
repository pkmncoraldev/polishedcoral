CurseCommand::
	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels

.go

; Curse is different for Ghost-types.

	ld a, [de]
	cp GHOST
	jr z, .ghost
	inc de
	ld a, [de]
	cp GHOST
	jr z, .ghost


; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Raise Attack and Defense, and lower Speed.

	ld a, $1
	ld [wKickCounter], a
	farcall AnimateCurrentMove
	ld b, SPEED
	farcall LowerStat
	farcall SwitchTurn
	farcall BattleCommand_statdownmessage
	farcall ResetMiss
	farcall SwitchTurn
	farcall BattleCommand_attackup
	farcall BattleCommand_statupmessage
	farcall ResetMiss
	farcall BattleCommand_defenseup
	farjp BattleCommand_statupmessage


.ghost

; Cut HP in half and put a curse on the opponent.

	farcall CheckHiddenOpponent
	jr nz, .failed

	farcall CheckSubstituteOpp
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	farcall GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr nz, .failed

	set SUBSTATUS_CURSE, [hl]
	farcall AnimateCurrentMove
	ld hl, GetHalfMaxHP
	farcall CallBattleCore
	ld hl, SubtractHPFromUser
	farcall CallBattleCore
	farcall UpdateUserInParty
	ld hl, PutACurseText
	farjp StdBattleTextBox

.failed
	farcall AnimateFailedMove
	farjp PrintButItFailed


.cantraise

; Can't raise either stat.

	ld b, MULTIPLE_STATS + 1
	farcall GetStatName
	farcall AnimateFailedMove
	ld hl, WontRiseAnymoreText
	farjp StdBattleTextBox
