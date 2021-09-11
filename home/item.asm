CheckTossableItem:: ; 2f46
	push hl
	push de
	push bc
	farcall _CheckTossableItem
	jr HomeItem_PopBCDEHL
; 2f53

TossItem:: ; 2f53
	push hl
	push de
	push bc
	farcall _TossItem
	jr HomeItem_PopBCDEHL
; 2f66

ReceiveItem:: ; 2f66
	push hl
	push de
	push bc
	farcall _ReceiveItem
HomeItem_PopBCDEHL:
	pop bc
	pop de
	pop hl
	ret
; 2f79

CheckItem:: ; 2f79
	push hl
	push de
	push bc
	farcall _CheckItem
	jr HomeItem_PopBCDEHL
; 2f8c

CountItem::
	push hl
	push de
	push bc
	farcall _CountItem

	ld a, b
	ld [wBuffer1], a
	ld a, c
	ld [wBuffer2], a

	jr HomeItem_PopBCDEHL

CheckTMHM:: ; d3fb
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wTMsHMs
	call FlagAction
	ret z
	scf
	ret

ReceiveTMHM:: ; d3c4
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	ld b, SET_FLAG
	ld hl, wTMsHMs
	call FlagAction
	scf
	ret
	
CheckClothes:: ; d3fb
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wClothesOwned
	call FlagAction
	ret z
	scf
	ret
	
ReceiveClothes:: ; d3c4
	ld a, [wCurItem]
ReceiveStartingClothes::
	ld e, a
	ld d, 0
	ld b, SET_FLAG
	ld hl, wClothesOwned
	call FlagAction
	scf
	ret
