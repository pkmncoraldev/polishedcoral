CottonGuardCommand::
	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels

.go

; If no stats can be increased, don't.

; Defense
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Raise Defense 3 times.

	farcall AnimateCurrentMove
	farcall BattleCommand_lowersub
	farcall ResetMiss
	farcall BattleCommand_defenseup
	farcall BattleCommand_defenseup
	farcall BattleCommand_defenseup
	farcall BattleCommand_raisesub
	ld hl, BattleText_RoseDrastically
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
