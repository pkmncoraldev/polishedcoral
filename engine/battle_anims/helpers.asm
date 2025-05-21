ReinitBattleAnimFrameset: ; ce7bf (33:67bf)
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], -1
	ret

; ce83c

GetBattleAnimOAMPointer: ; ce83c
	ld l, a
	ld h, 0
	ld de, BattleAnimOAMData
	add hl, hl
	add hl, hl
	add hl, de
	ret

; ce846

LoadBattleAnimObj: ; ce846 (33:6846)
	push hl
	cp ANIM_GFX_POKE_BALL
	call z, FarLoadBallPalette
	cp ANIM_GFX_POKE_BALL_2
	call z, FarLoadBallPalette
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, AnimObjGFX
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	push bc
	call DecompressRequest2bpp
	pop bc
	ret

FarLoadBallPalette:
	farcall LoadBallPalette
	ret
