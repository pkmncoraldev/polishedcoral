FruitTreeScript:: ; 44000
	opentext
	writetext FruitBearingTreeText
	buttonsound
	farwritetext StdBlankText
	pause 6
	callasm TryResetFruitTrees
	copybytetovar wCurFruit
	callasm CheckFruitTree
	iffalse PickBerryScript
	writetext NothingHereText
	buttonsound
	farwritetext StdBlankText
	pause 6
	checkitem MULCH
	iffalse_endtext
	writetext WantToUseMulchText
	yesorno
	iffalse_endtext
	takeitem MULCH
	copybytetovar wCurFruit
	callasm FertilizedFruitTree
	jumpopenedtext UsedMulchText

PickBerryScript:
	copybytetovar wCurFruit
	itemtotext $0, $0
	writetext HeyItsFruitText
	copybytetovar wCurFruit
	giveitem ITEM_FROM_MEM
	iffalse .packisfull
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext ObtainedFruitText
	callasm PickedFruitTree
	specialsound
	itemnotify
	closetext
	end

.packisfull
	buttonsound
	farwritetext StdBlankText
	pause 6
	jumpopenedtext FruitPackIsFullText
; 44041

TryResetFruitTrees: ; 4404c
	ld hl, wDailyFlags
	bit 4, [hl] ; ENGINE_ALL_FRUIT_TREES
	ret nz
	xor a
	ld hl, wFruitTreeFlags
rept (NUM_FRUIT_TREES + 7) / 8 - 1
	ld [hli], a
endr
	ld [hl], a
	ld hl, wDailyFlags
	set 4, [hl] ; ENGINE_ALL_FRUIT_TREES
	ret
; 44078

CheckFruitTree: ; 44055
	ld b, CHECK_FLAG
	call GetFruitTreeFlag
	ld a, c
	ld [wScriptVar], a
	ret
; 4405f

PickedFruitTree: ; 4405f
	ld b, SET_FLAG
	jr GetFruitTreeFlag
; 4406a

FertilizedFruitTree:
	ld b, RESET_FLAG
GetFruitTreeFlag: ; 44078
	push hl
	push de
	ld a, [wCurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, wFruitTreeFlags
	call FlagAction
	pop de
	pop hl
	ret
; 4408a

;GetFruitTreeCount:
;	ld a, 3
;	call RandomRange
;	inc a
;	ld [wScriptVar], a
;	ret

FruitBearingTreeText: ; 440b5
	text_jump _FruitBearingTreeText
	db "@"
; 440ba

HeyItsFruitText: ; 440ba
	text_jump _HeyItsFruitText
	db "@"
; 440bf

ObtainedFruitText: ; 440bf
	text_jump _ObtainedFruitText
	db "@"
; 440c4

FruitPackIsFullText: ; 440c4
	text_jump _FruitPackIsFullText
	db "@"
; 440c9

NoApricornBoxText:
	text_jump _NoApricornBoxText
	db "@"

ApricornBoxIsFullText:
	text_jump _ApricornBoxIsFullText
	db "@"

PutAwayTheApricornText:
	text_jump _PutAwayTheApricornText
	db "@"

NothingHereText: ; 440c9
	text_jump _NothingHereText
	db "@"
; 440ce

WantToUseMulchText:
	text_jump _WantToUseMulchText
	db "@"

UsedMulchText:
	text_jump _UsedMulchText
	db "@"
