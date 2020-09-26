QuiverDanceCommand::
	ld de, wBattleMonType1
	ld bc, wPlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wEnemyMonType1
	ld bc, wEnemyStatLevels

.go

; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise

; Special Defense
	inc bc
	inc bc
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr c, .raise
	
; Speed
	ld bc, wPlayerStatLevels
	inc bc
	inc bc
	ld a, [bc]
	cp MAX_STAT_LEVEL
	jr nc, .cantraise

.raise

; Raise Attack and Defense, and lower Speed.

	ld a, $1
	ld [wKickCounter], a
	farcall AnimateCurrentMove
	farcall BattleCommand_lowersub
	farcall BattleCommand_specialattackup
	farcall BattleCommand_statupmessage
	farcall ResetMiss
	farcall BattleCommand_specialdefenseup
	farcall BattleCommand_statupmessage
	farcall ResetMiss
	farcall BattleCommand_speedup
	farcall BattleCommand_raisesub
	farjp BattleCommand_statupmessage


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
