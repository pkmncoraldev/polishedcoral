LoadBallPalette:
	push af
	; save the current WRAM bank
	ld a, [rSVBK]
	push af
	; switch to the WRAM bank of wCurItem so we can read it
	ld a, BANK(wCurItem)
	ld [rSVBK], a
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
	ld [rSVBK], a
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
	ld [rSVBK], a
	; restore the graphics index to be loaded
	pop af
	ret

; colors of balls thrown in battle
BallColors:
	db POKE_BALL
	RGB 31,19,24, 30,10,06
	db GREAT_BALL
	RGB 08,12,31, 01,04,31
	db ULTRA_BALL
	RGB 31,31,07, 31,16,01
	db MASTER_BALL
	RGB 24,20,26, 20,06,20
	db SAFARI_BALL
	RGB 21,21,09, 06,15,10
	
	db LEVEL_BALL
	RGB 31,31,07, 07,07,07
	db LURE_BALL
	RGB 30,12,08, 08,12,31
	db MOON_BALL
	RGB 31,31,07, 08,12,31
	db FRIEND_BALL
	RGB 30,10,06, 05,14,00
	db FAST_BALL
	RGB 31,31,00, 31,07,00
	db HEAVY_BALL
	RGB 06,15,31, 07,07,07
	db LOVE_BALL
	RGB 31,22,29, 31,12,20
	db PARK_BALL
	RGB 00,00,00, 00,00,00
	
	db REPEAT_BALL
	RGB 31,31,31, 30,10,06
	db TIMER_BALL
	RGB 31,31,31, 10,10,10
	db NEST_BALL
	RGB 31,31,31, 07,19,00
	db NET_BALL
	RGB 31,31,31, 06,15,31
	
	db DIVE_BALL
	RGB 27,27,31, 08,12,31
	db LUXURY_BALL
	RGB 30,16,04, 07,07,07
	db QUICK_BALL
	RGB 31,31,07, 06,15,31
	db DUSK_BALL
	RGB 30,10,06, 05,11,05
	db HEAL_BALL
	RGB 31,19,24, 10,17,24
	db PREMIER_BALL
	RGB 29,29,29, 30,10,06
	db CHERISH_BALL
	RGB 30,10,06, 07,07,07
	db -1 ; end
	RGB 31,31,31, 16,16,16

