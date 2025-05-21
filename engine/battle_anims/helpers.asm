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
	call z, .LoadBallPalette
	cp ANIM_GFX_POKE_BALL_2
	call z, .LoadBallPalette
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

.LoadBallPalette:
	push af
	; save the current WRAM bank
	ldh a, [rSVBK]
	push af
	; switch to the WRAM bank of wCurItem so we can read it
	ld a, BANK(wCurItem)
	ldh [rSVBK], a
	; store the current item in b
	ld a, [wCurItem]
	ld b, a
	; seek for the BallColors entry matching the current item
	ld hl, BallColors
.loop
	ld a, [hli]
	cp b ; did we find the current ball?
	jr z, .done
	cp -1 ; did we reach the end of the list?
	jr z, .done
rept 2 * 2
	inc hl ; skip over the two RGB colors to the next entry
endr
	jr .loop
.done
	; switch to the WRAM bank of wOBPals2 so we can write to it
	ld a, BANK(wOBPals)
	ldh [rSVBK], a
	; load the RGB colors into the middle two colors of PAL_BATTLE_OB_RED
	ld de, wOBPals palette PAL_BATTLE_OB_RED + 2
rept 2 * 2 - 1
	ld a, [hli]
	ld [de], a
	inc de
endr
	ld a, [hl]
	ld [de], a
	; apply the updated colors to the palette RAM
	ld a, $1
	ldh [hCGBPalUpdate], a
	; restore the previous WRAM bank
	pop af
	ldh [rSVBK], a
	; restore the graphics index to be loaded
	pop af
	ret

INCLUDE "data/battle_anims/ball_colors.asm"
