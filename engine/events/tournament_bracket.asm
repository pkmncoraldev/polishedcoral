DrawTourneyBracket::
	call FadeToMenu
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	ld de, MUSIC_NONE
	call PlayMusic
	lb bc, BANK(TourneyBracketGFX), $0e
	ld de, TourneyBracketGFX
	ld hl, VTiles2 tile $00
	call Request2bpp
	lb bc, BANK(TourneyBracketGFX2), $12
	ld de, TourneyBracketGFX2
	ld hl, VTiles0 tile $40
	call Request2bpp
	xor a
	ldh [hBGMapMode], a
	call FillBracketTilemap
	call FillBracketAttrmap
	call GetTourneyCompetetorSprites
	call GetTourneyCompetetorSpriteColors
	call TourneyRoundWinnersTiles	; ApplyAttrAndTilemapInVBlank is run here
	
; palettes
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, TourneyBracketPals
	ld de, wUnknBGPals
	ld bc, 9 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	farcall FadeInPalettes
.loop
	call UpdateTime
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .debug_round_2
	ldh a, [hJoyLast]
	and B_BUTTON
	jr z, .loop
	farcall FadeOutPalettes
	call EnableSpriteUpdates2
	call CloseSubmenu
	xor a
	ret
.debug_round_2
;	call FillBracketTilemap
;	call FillBracketAttrmap	
;	call GetTourneyCompetetorSpriteColors
	call CalcTourneyRound1Results
	ld de, SFX_TOURNEY_BRACKET_1
	call PlaySFX
	call AnimateTourneyBracketRound1
.loop2
	call UpdateTime
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .debug_round_3
	ldh a, [hJoyLast]
	and B_BUTTON
	jr z, .loop2
	farcall FadeOutPalettes
	call EnableSpriteUpdates2
	call CloseSubmenu
	xor a
	ret
.debug_round_3
;	call FillBracketTilemap
;	call FillBracketAttrmap	
;	call GetTourneyCompetetorSpriteColors
	call CalcTourneyRound2Results
	ld de, SFX_TOURNEY_BRACKET_2
	call PlaySFX
	call AnimateTourneyBracketRound2
.loop3
	call UpdateTime
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .debug_round_4
	ldh a, [hJoyLast]
	and B_BUTTON
	jr z, .loop3
	farcall FadeOutPalettes
	call EnableSpriteUpdates2
	call CloseSubmenu
	xor a
	ret
.debug_round_4
;	call FillBracketTilemap
;	call FillBracketAttrmap	
;	call GetTourneyCompetetorSpriteColors
	call CalcTourneyRound3Results
	ld de, SFX_TOURNEY_BRACKET_3
	call PlaySFX
	call AnimateTourneyBracketRound3
.loop4
	call UpdateTime
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .debug_round_5
	ldh a, [hJoyLast]
	and B_BUTTON
	jr z, .loop4
	farcall FadeOutPalettes
	call EnableSpriteUpdates2
	call CloseSubmenu
	xor a
	ret
.debug_round_5
;	call FillBracketTilemap
;	call FillBracketAttrmap	
;	call GetTourneyCompetetorSpriteColors
	ld de, SFX_TOURNEY_BRACKET_4
	call PlaySFX
	call AnimateTourneyBracketRound4
.loop5
	call UpdateTime
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .debug_round_5
	ldh a, [hJoyLast]
	and B_BUTTON
	jr z, .loop5
	farcall FadeOutPalettes
	call EnableSpriteUpdates2
	call CloseSubmenu
	xor a
	ret
	
TourneyRoundWinnersTiles:
	ld a, [wTourneyRound1Results]
	cp 0
	jp z, .check_round_2
	call TourneyRound1WinnersTiles
.check_round_2
	ld a, [wTourneyRound23Results]
	cp 0
	jp z, .end
	call TourneyRound2WinnersTiles
;.round_3
	ld a, [wTourneyRound23Results]
	and %00000011
	jr z, .end
	call TourneyRound3WinnersTiles
.end
	call ApplyAttrAndTilemapInVBlank
	call ClearSprites
	ret
	
AnimateTourneyBracketRound1:
	ld hl, Tourney_BracketOAMRound1_L_T
	ld de, wSprites
	ld bc, 8
	call CopyBytes
	call LoadTourneyBracketOAMRound1
	ld hl, Tourney_BracketOAMRound1
	ld de, wSprites + 64
	ld bc, 64
	call CopyBytes
	
	ld hl, wSprites + 2
	ld b, 8
	ld c, 2
	call AnimateTourneyBracketTile
	ld b, 8
	ld c, 2
	call AnimateTourneyBracketTile
	ld hl, wSprites + 66
	ld b, 8
	ld c, 2
	call AnimateTourneyBracketTile
	ld b, 8
	ld c, 2
	call AnimateTourneyBracketTile
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
TourneyRound1WinnersTiles:
; replace with tiles
; player has to have won to be here
	ld de, Tourney_BracketTilemapRound1_L_T_1
	hlcoord 3, 3
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
; left side
	ld a, [wTourneyRound1Results]
	ld d, %01000000
	call LoadRound1LTilemap2
	hlcoord 3, 7
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
	ld a, [wTourneyRound1Results]
	ld d, %00100000
	call LoadRound1LTilemap1
	hlcoord 3, 11
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
	ld a, [wTourneyRound1Results]
	ld d, %00010000
	call LoadRound1LTilemap2
	hlcoord 3, 15
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
; right side
	ld a, [wTourneyRound1Results]
	ld d, %00001000
	call LoadRound1RTilemap1
	hlcoord 14, 3
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
	ld a, [wTourneyRound1Results]
	ld d, %00000100
	call LoadRound1RTilemap2
	hlcoord 14, 7
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
	ld a, [wTourneyRound1Results]
	ld d, %00000010
	call LoadRound1RTilemap1
	hlcoord 14, 11
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	
	ld a, [wTourneyRound1Results]
	ld d, %00000001
	call LoadRound1RTilemap2
	hlcoord 14, 15
	lb bc, 2, 3
	call TourneyBracket_CopyToBox
	call ApplyAttrAndTilemapInVBlank
	call ClearSprites
	ret
	
AnimateTourneyBracketRound2:
	ld hl, Tourney_BracketOAMRound2_L_T
	ld de, wSprites
	ld bc, 8
	call CopyBytes
	call LoadTourneyBracketOAMRound2
	ld hl, Tourney_BracketOAMRound2
	ld de, wSprites + 32
	ld bc, 32
	call CopyBytes
	
	ld hl, wSprites + 2
	ld b, 4
	ld c, 2
	call AnimateTourneyBracketTile
	ld b, 4
	ld c, 2
	call AnimateTourneyBracketTile
	ld hl, wSprites + 34
	ld b, 4
	ld c, 2
	call AnimateTourneyBracketTile
	ld b, 4
	ld c, 2
	call AnimateTourneyBracketTile
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
TourneyRound2WinnersTiles:
; replace with tiles
; player has to have won to be here
	ld de, Tourney_BracketTilemapRound2_L_T
	hlcoord 6, 4
	lb bc, 4, 2
	call TourneyBracket_CopyToBox
	
; left side
	ld a, [wTourneyRound23Results]
	ld d, %01000000
	call LoadRound2LTilemap
	hlcoord 6, 12
	lb bc, 4, 2
	call TourneyBracket_CopyToBox
	
; right side
	ld a, [wTourneyRound23Results]
	ld d, %00100000
	call LoadRound2RTilemap1
	hlcoord 12, 4
	lb bc, 4, 2
	call TourneyBracket_CopyToBox
	
	ld a, [wTourneyRound23Results]
	ld d, %00010000
	call LoadRound2RTilemap2
	hlcoord 12, 12
	lb bc, 4, 2
	call TourneyBracket_CopyToBox

	call ApplyAttrAndTilemapInVBlank
	call ClearSprites
	ret
	
AnimateTourneyBracketRound3:
	ld hl, Tourney_BracketOAMRound2_R
	ld de, wSprites
	ld bc, 16
	call CopyBytes
	
	call LoadTourneyBracketOAMRound3
	
	ld hl, wSprites + 2
	ld b, 2
	ld c, 4
	call AnimateTourneyBracketTile
	ld b, 2
	ld c, 4
	call AnimateTourneyBracketTile
	ld b, 2
	ld c, 4
	call AnimateTourneyBracketTile
	ld b, 2
	ld c, 4
	call AnimateTourneyBracketTile
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
TourneyRound3WinnersTiles:
; replace with tiles
; player has to have won to be here
	ld de, Tourney_BracketTilemapRound3_T
	hlcoord 8, 6
	lb bc, 8, 1
	call TourneyBracket_CopyToBox
	ld a, [wTourneyRound23Results]
	ld d, %00000001
	call LoadRound3RTilemap
	hlcoord 11, 6
	lb bc, 8, 1
	call TourneyBracket_CopyToBox
	
	call ApplyAttrAndTilemapInVBlank
	call ClearSprites
	ret
	
AnimateTourneyBracketRound4:
	ld hl, Tourney_BracketOAMRound4
	ld de, wSprites
	ld bc, 12
	call CopyBytes
	
	ld hl, wSprites + 2
	ld b, 1
	ld c, 3
	call AnimateTourneyBracketTile
	ld b, 1
	ld c, 3
	call AnimateTourneyBracketTile
	ld b, 1
	ld c, 3
	call AnimateTourneyBracketTile
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	ret
	
LoadRound1LTilemap1:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound1_L_T_1
	ret nc
	ld de, Tourney_BracketTilemapRound1_L_B_1
	ret
	
LoadRound1LTilemap2:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound1_L_T_2
	ret nc
	ld de, Tourney_BracketTilemapRound1_L_B_2
	ret
	
LoadRound1RTilemap1:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound1_R_T_1
	ret nc
	ld de, Tourney_BracketTilemapRound1_R_B_1
	ret
	
LoadRound1RTilemap2:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound1_R_T_2
	ret nc
	ld de, Tourney_BracketTilemapRound1_R_B_2
	ret
	
LoadRound2LTilemap:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound2_L_T_2
	ret nc
	ld de, Tourney_BracketTilemapRound2_L_B_2
	ret
	
LoadRound2RTilemap1:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound2_R_T_1
	ret nc
	ld de, Tourney_BracketTilemapRound2_R_B_1
	ret
	
LoadRound2RTilemap2:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound2_R_T_2
	ret nc
	ld de, Tourney_BracketTilemapRound2_R_B_2
	ret
	
LoadRound3RTilemap:
	call TourneyFindResultsOfBattle
	ld de, Tourney_BracketTilemapRound3_T
	ret nc
	ld de, Tourney_BracketTilemapRound3_B
	ret
	
LoadTourneyBracketOAMRound1:
; left side
	ld a, [wTourneyRound1Results]
	ld d, %01000000
	call LoadRound1LOAM
	ld de, wSprites + 8
	ld bc, 8
	call CopyBytes
	
	ld a, [wTourneyRound1Results]
	ld d, %00100000
	call LoadRound1LOAM
	ld de, wSprites + 16
	ld bc, 8
	call CopyBytes
	
	ld a, [wTourneyRound1Results]
	ld d, %00010000
	call LoadRound1LOAM
	ld de, wSprites + 24
	ld bc, 8
	call CopyBytes
; right side
	ld a, [wTourneyRound1Results]
	ld d, %00001000
	call LoadRound1ROAM
	ld de, wSprites + 32
	ld bc, 8
	call CopyBytes
	
	ld a, [wTourneyRound1Results]
	ld d, %00000100
	call LoadRound1ROAM
	ld de, wSprites + 40
	ld bc, 8
	call CopyBytes
	
	ld a, [wTourneyRound1Results]
	ld d, %00000010
	call LoadRound1ROAM
	ld de, wSprites + 48
	ld bc, 8
	call CopyBytes
	
	ld a, [wTourneyRound1Results]
	ld d, %00000001
	call LoadRound1ROAM
	ld de, wSprites + 56
	ld bc, 8
	call CopyBytes
; adjust
; left side
	ld hl, wSprites + 8
	ld c, 32
	call TourneyAdjustBracketTiles
	ld hl, wSprites + 16
	ld c, 64
	call TourneyAdjustBracketTiles
	ld hl, wSprites + 24
	ld c, 96
	call TourneyAdjustBracketTiles
; right side
	ld hl, wSprites + 40
	ld c, 32
	call TourneyAdjustBracketTiles
	ld hl, wSprites + 48
	ld c, 64
	call TourneyAdjustBracketTiles
	ld hl, wSprites + 56
	ld c, 96
	call TourneyAdjustBracketTiles
	ret
	
TourneyAdjustBracketTiles:
	ld a, [hl]
	add c
	ld [hl], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	add c
	ld [hl], a
	ret
	
LoadRound1LOAM:
	call TourneyFindResultsOfBattle
	ld hl, Tourney_BracketOAMRound1_L_T
	ret nc
	ld hl, Tourney_BracketOAMRound1_L_B
	ret
	
LoadRound1ROAM:
	call TourneyFindResultsOfBattle
	ld hl, Tourney_BracketOAMRound1_R_T
	ret nc
	ld hl, Tourney_BracketOAMRound1_R_B
	ret
	
LoadTourneyBracketOAMRound2:
; left side
	ld a, [wTourneyRound23Results]
	ld d, %01000000
	call LoadRound2LOAM
	ld de, wSprites + 8
	ld bc, 8
	call CopyBytes
; right side
	ld a, [wTourneyRound23Results]
	ld d, %00100000
	call LoadRound2ROAM
	ld de, wSprites + 16
	ld bc, 8
	call CopyBytes
	
	ld a, [wTourneyRound23Results]
	ld d, %00010000
	call LoadRound2ROAM
	ld de, wSprites + 24
	ld bc, 8
	call CopyBytes
; adjust
; left side
	ld hl, wSprites + 8
	ld c, 64
	call TourneyAdjustBracketTiles
; right side
	ld hl, wSprites + 24
	ld c, 64
	call TourneyAdjustBracketTiles
	ret
	

LoadRound2LOAM:
	call TourneyFindResultsOfBattle
	ld hl, Tourney_BracketOAMRound2_L_T
	ret nc
	ld hl, Tourney_BracketOAMRound2_L_B
	ret
	
LoadRound2ROAM:
	call TourneyFindResultsOfBattle
	ld hl, Tourney_BracketOAMRound2_R_T
	ret nc
	ld hl, Tourney_BracketOAMRound2_R_B
	ret
	
LoadTourneyBracketOAMRound3:
	ld a, [wTourneyRound23Results]
	ld d, %00000001
	call LoadRound3OAM
	ld de, wSprites + 16
	ld bc, 16
	call CopyBytes
	ret
	
LoadRound3OAM:
	call TourneyFindResultsOfBattle
	ld hl, Tourney_BracketOAMRound3_R_T
	ret nc
	ld hl, Tourney_BracketOAMRound3_R_B
	ret
	
TourneyFindResultsOfBattle:
; a = round results
; d = battle mask
; return c if bottom competitor won battle
	and d
	cp 0
	ret z
	scf
	ret
	
AnimateTourneyBracketTile:
; d = frames
; b = # of tiles simultaniously animated
; c = # of oam slots to advance for next simultaniously animated tile
	ld d, 8
.loop1
	push hl
	push bc
.loop2
	ld a, [hl]
	inc a
	ld [hl], a
	dec b
	ld a, b
	cp 0
	jr nz, .inc_then_loop2
	ld c, 3
	call DelayFrames
	pop bc
	dec d
	ld a, d
	cp 0
	pop hl
	jr nz, .loop1
	inc hl
	inc hl
	inc hl
	inc hl
	ret
.inc_then_loop2
	ld a, c
.inner_loop
	inc hl
	inc hl
	inc hl
	inc hl
	dec a
	cp 0
	jr nz, .inner_loop
	jr .loop2
	
CalcTourneyRound1Results:
	ld hl, wTourneyRound1Results
	ld b, %10000000
	call AddRoundResults
	ld de, wTourneyBracket1
	ld a, [de]
	add $80
	ld [de], a
	ld c, 7
	ld de, wTourneyBracket9
.loop2
	ld a, b
	rra
	ld b, a
	call CalcRound1BattleResult
	dec c
	ld a, c
	cp 0
	jr nz, .loop2
	ret
	
CalcTourneyRound2Results:
	ld hl, wTourneyRound23Results
	ld b, %10000000
	call AddRoundResults
	ld de, wTourneyBracket2
	ld a, [de]
	cp $80
	jr c, .top_won_last_round
	ld de, wTourneyBracket9
	ld a, [de]
.top_won_last_round
	add $80
	ld [de], a

	ld de, wTourneyBracket3
	ld b, %01000000
	call CalcRound2BattleResult
	
	ld de, wTourneyBracket5
	ld b, %00100000
	call CalcRound2BattleResult
	
	ld de, wTourneyBracket7
	ld b, %00010000
	call CalcRound2BattleResult
	ret
	
CalcTourneyRound3Results:
	ld hl, wTourneyRound23Results
	ld b, %00000010
	call AddRoundResults
	ld de, wTourneyBracket3
	ld a, [de]
	cp $80
	jr c, .cont
	ld de, wTourneyBracket10
	ld a, [de]
	cp $80
	jr c, .cont
	ld de, wTourneyBracket4
	ld a, [de]
	cp $80
	jr c, .cont
	ld de, wTourneyBracket11
	ld a, [de]
.cont
	add $80
	ld [de], a
	ld de, wTourneyBracket11
	push hl
.loop
	push de
	pop hl
	ld bc, -6
	add hl, bc
	push hl
	pop de
	ld a, [de]
	cp $80
	jr c, .cont2
	push de
	pop hl
	ld bc, 7
	add hl, bc
	push hl
	pop de
	ld a, [de]
	cp $80
	jr nc, .loop
	push de
	pop hl
.cont2
	ld bc, -6
	add hl, bc
	ld a, [hl]
	cp $80
	jr c, .cont3
	ld bc, 7
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .cont2
.cont3
	push hl
	pop bc
; top in de
; bottom in bc
	pop hl
	call Random
	cp 50 percent + 1
	jr nc, .bottom_won
	ld a, [bc]
	add $80
	ld [bc], a
	ret
.bottom_won
	ld a, [de]
	add $80
	ld [de], a
	ld b, %00000001
	call AddRoundResults
	ret
	
CalcRound2BattleResult:
	push hl
	push de
	ld h, d
	ld l, e
	ld a, [hl]
	cp $80
	jr c, .top_won_last_round
	ld de, 7
	add hl, de
.top_won_last_round
	; top winner in hl
	pop de
	inc de
	push hl
	ld h, d
	ld l, e
	ld a, [hl]
	cp $80
	jr c, .top_won_last_round_2
	ld de, 7
	add hl, de
	ld d, h
	ld e, l
.top_won_last_round_2
	; bottom winner in de
	; top winner in hl
	pop hl
	call Random
	cp 50 percent + 1
	jr nc, .bottom_won
	ld a, [de]
	add $80
	ld [de], a
	pop hl
	ret
.bottom_won
	ld a, [hl]
	add $80
	ld [hl], a
	pop hl
	call AddRoundResults
	ret
	
CalcRound1BattleResult:
; rando always loses if they are present, otherwise 50/50 chance.
; also add $80 to the loser's value to track that they lost.
	push hl
	ld h, d
	ld l, e
	xor a
	ld a, [hl]
	cp $80
	ret nc
	and $7f
	cp 16	; first rando trainer
	ld d, h
	ld e, l
	pop hl
	ret nc
	call Random
	cp 50 percent + 1
	jr nc, .bottom_won
	ld a, [de]
	add $80
	ld [de], a
	inc de
	ret
.bottom_won
	push de
	push hl
	ld hl, -7
	add hl, de
	ld a, [hl]
	add $80
	ld [hl], a
	pop hl
	pop de
	inc de
AddRoundResults:
	ld a, [hl]
	add b
	ld [hl], a
	ret
	
FillBracketTilemap:
	ld hl, TourneyBracketTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ret
	
FillBracketAttrmap:
	ld hl, TourneyBracketAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ret

DetermineBracketSize:
	ld a, 8
	ld [wTourneyBracketSize], a
	xor a
	ld e, a
.loop
	push hl
	push bc
	push de
	ld c, a
	call CheckTourneyEvent
	pop de
	pop bc
	pop hl
	jr nc, .skip
	ld a, [wTourneyBracketSize]
	inc a
	ld [wTourneyBracketSize], a
.skip
	inc e
	ld a, e
	cp 8
	jr nz, .loop
	ret

ClearTourneyBracket:
	xor a
	ld bc, 15
	ld hl, wTourneyBracket1
	call ByteFill
	ret

DetermineTourneyBracket::
	call ClearTourneyBracket
; generate initial placeholder bracket of randos
	ld a, 7
	ld b, a
	ld hl, wTourneyBracket9
	ld c, 16
.loop
	ld [hl], c
	inc hl
	inc c
	dec b
	ld a, b
	cp 0
	jr nz, .loop
; generate acutal unique bracket based on whose quests you've completed
	call DetermineBracketSize
	ld hl, wTourneyBracket1
	ld a, [wTourneyBracketSize]
	ld b, a
	push hl
.loop1
	ld a, [wTourneyBracketSize]
	ld d, a
	ld hl, wTourneyBracket1
	ld a, 15
	call RandomRange
	inc a
	push hl
	push bc
	push de
	ld d, a
	push de
	call CheckTourneyOpponentAvailable
	pop de
	ld a, d
	pop de
	pop bc
	pop hl
	jr nc, .loop1
	ld e, a
.loop2
	ld a, [hl]
	cp e
	jr z, .loop1
	inc hl
	dec d
	ld a, d
	cp 0
	jr nz, .loop2
	pop hl
	ld a, e
	ld [hl], a
	inc hl
	push hl
	dec b
	ld a, b
	cp 0
	jr nz, .loop1
	pop hl
	ret
	
CheckTourneyOpponentAvailable:
	cp 9
	ret c
; first 8 are the gym leaders and are always available
	sub 8
	ld c, a
CheckTourneyEvent:
	xor a
	ld b, a
	ld hl, TOURNEY_FLAGS_START
	add hl, bc
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr nz, .good_2_go
;.not_available
	xor a
	ret
.good_2_go
	scf
	ret
	
GetTourneyCompetetorSpriteColors:
	ld a, [wPlayerPalette]
	hlcoord 1, 2, wAttrMap
	call TourneyBracket_FillBox

	ld hl, wTourneyBracket1
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 4, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket2
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 6, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket3
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 10, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket4
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 14, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket5
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 2, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket6
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 6, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket7
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 10, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket8
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 14, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket9
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 8, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket10
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 12, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket11
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 16, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket12
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 4, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket13
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 8, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket14
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 12, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket15
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 16, wAttrMap
	call TourneyBracket_FillBox
	
	ret
	
GetCurTourneyCompetetorSpriteColor:
	ld a, [hl]
	and $7f
	ld e, a
	ld d, 0
	ld hl, TourneyCompetetorSpriteColors
	add hl, de
	ld a, [hl]
	ret
	
TourneyBracket_FillBox:
	lb bc, 2, 2
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
	
TourneyBracket_CopyToBox:
.row
	push bc
	push hl
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
	
GetTourneyCompetetorSprites:
	ld de, VTiles0 tile $04
	call GetTourneyCompetetorSprites2
	ld de, VTiles2 tile $14
	call GetTourneyCompetetorSprites2
	ld de, VTiles2 tile $10
	ld hl, CorySpriteGFX
	lb bc, BANK(CorySpriteGFX), $04
	jp DecompressRequest2bpp

GetTourneyCompetetorSprites2:
	ld a, 15
	ld hl, wTourneyBracket1
	
.loop1
	push af
	push hl
	call GetCurTourneyCompetetorSprite
	pop hl
	ld a, $40
.loop2
	inc de
	dec a
	cp 0
	jr nz, .loop2
	
	inc hl
	pop af
	dec a
	cp 0
	jr nz, .loop1
	ret

GetCurTourneyCompetetorSprite:
	push de
	xor a
	ld a, [hl]
	and $7f
	ld e, a
	ld d, 0
	ld hl, TourneyCompetetorSprites
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	cp -1
	ret z
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld h, d
	ld l, e
	pop de
	push de
	ld c, 4
	call DecompressRequest2bpp
	pop de
	ret

TourneyCompetetorSprites:
	dba InvisibleSpriteGFX
	dba StanleySpriteGFX
	dba RodneySpriteGFX
	dba WendySpriteGFX
	dba CharlieSpriteGFX
	dba PollySpriteGFX
	dba LeilaniSpriteGFX
	dba RockySpriteGFX
	dba DarcySpriteGFX
	dba MinaSpriteGFX
	dba ErikaSpriteGFX
	dba BallCutFruitSpriteGFX
	dba FrankieSpriteGFX
	dba LedianRangerSpriteGFX
	dba SpaWorkerSpriteGFX
	dba MasterSpriteGFX
	dba ColbySpriteGFX
	dba ColbySpriteGFX
	dba ColbySpriteGFX
	dba ColbySpriteGFX
	dba ColbySpriteGFX
	dba ColbySpriteGFX
	dba ColbySpriteGFX
	db -1
	
TourneyCompetetorSpriteColors:
	db PAL_OW_SILVER
	db PAL_OW_BLUE
	db PAL_OW_BLUE
	db PAL_OW_BROWN
	db PAL_OW_RED
	db PAL_OW_PURPLE
	db PAL_OW_GREEN
	db PAL_OW_BROWN
	db PAL_OW_RED
	db PAL_OW_RED
	db PAL_OW_BLUE
	db PAL_OW_RED
	db PAL_OW_BROWN
	db PAL_OW_RED
	db PAL_OW_BLUE
	db PAL_OW_BROWN
	db PAL_OW_SILVER
	db PAL_OW_SILVER
	db PAL_OW_SILVER
	db PAL_OW_SILVER
	db PAL_OW_SILVER
	db PAL_OW_SILVER
	db PAL_OW_SILVER
	db -1

TourneyBracketGFX:
INCBIN "gfx/tourney/tourney.2bpp"

TourneyBracketGFX2:
INCBIN "gfx/tourney/anim_bracket.2bpp"

TourneyBracketTilemap:
INCBIN "gfx/tourney/bracket.tilemap"

TourneyBracketAttrmap:
INCBIN "gfx/tourney/bracket.attrmap"

Tourney_BracketTilemapRound1_L_T_1:
	db $08, $09, $03
	db $00, $0a, $08

Tourney_BracketTilemapRound1_L_T_2:
	db $08, $0b, $08
	db $00, $01, $03

Tourney_BracketTilemapRound1_L_B_1:
	db $00, $01, $03
	db $08, $0b, $08

Tourney_BracketTilemapRound1_L_B_2:
	db $00, $0a, $08
	db $08, $09, $03

Tourney_BracketTilemapRound1_R_T_1:
	db $03, $09, $08
	db $08, $0a, $00

Tourney_BracketTilemapRound1_R_T_2:
	db $08, $0b, $08
	db $03, $01, $00

Tourney_BracketTilemapRound1_R_B_1:
	db $03, $01, $00
	db $08, $0b, $08

Tourney_BracketTilemapRound1_R_B_2:
	db $08, $0a, $00
	db $03, $09, $08
	
Tourney_BracketTilemapRound2_L_T:
	db $09, $03
	db $09, $03
	db $0a, $08
	db $01, $03
	
Tourney_BracketTilemapRound2_L_T_2:
	db $09, $03
	db $0b, $08
	db $01, $03
	db $01, $03
	
Tourney_BracketTilemapRound2_L_B_2:
	db $01, $03
	db $0a, $08
	db $09, $03
	db $09, $03
	
Tourney_BracketTilemapRound2_R_T_1:
	db $03, $09
	db $03, $09
	db $08, $0a
	db $03, $01
	
Tourney_BracketTilemapRound2_R_B_1:
	db $03, $01
	db $03, $01
	db $08, $0b
	db $03, $09

Tourney_BracketTilemapRound2_R_T_2:
	db $03, $09
	db $08, $0b
	db $03, $01
	db $03, $01
	
Tourney_BracketTilemapRound2_R_B_2:
	db $03, $01
	db $08, $0a
	db $03, $09
	db $03, $09
	
Tourney_BracketTilemapRound3_T:
	db $09
	db $09
	db $09
	db $09
	db $02
	db $01
	db $01
	db $01
	
Tourney_BracketTilemapRound3_B:
	db $01
	db $01
	db $01
	db $01
	db $0c
	db $09
	db $09
	db $09
	

Tourney_BracketOAMRound1_L_T:
	;y pos, x pos, tile, palette
	dsprite  5, 0, 4, 0, $40, $0
	dsprite  5, 0, 5, 0, $49, $0
	
Tourney_BracketOAMRound1_L_B:
	;y pos, x pos, tile, palette
	dsprite  6, 0, 4, 0, $40, $0 | Y_FLIP
	dsprite  6, 0, 5, 0, $49, $0 | Y_FLIP
	
Tourney_BracketOAMRound1_R_T:
	;y pos, x pos, tile, palette
	dsprite  5, 0, 17, 0, $40, $0 | X_FLIP
	dsprite  5, 0, 16, 0, $49, $0 | X_FLIP
	
Tourney_BracketOAMRound1_R_B:
	;y pos, x pos, tile, palette
	dsprite  6, 0, 17, 0, $40, $0 | X_FLIP | Y_FLIP
	dsprite  6, 0, 16, 0, $49, $0 | X_FLIP | Y_FLIP
	
Tourney_BracketOAMRound1:
	;y pos, x pos, tile, palette
	dsprite  6, 0, 5, 0, $40, $0
	dsprite  6, 0, 6, 0, $40, $0
	dsprite  9, 0, 5, 0, $40, $0| Y_FLIP
	dsprite  9, 0, 6, 0, $40, $0| Y_FLIP
	dsprite  14, 0, 5, 0, $40, $0
	dsprite  14, 0, 6, 0, $40, $0
	dsprite  17, 0, 5, 0, $40, $0| Y_FLIP
	dsprite  17, 0, 6, 0, $40, $0| Y_FLIP
	
	dsprite  6, 0, 16, 0, $40, $0 | X_FLIP
	dsprite  6, 0, 15, 0, $40, $0 | X_FLIP
	dsprite  9, 0, 16, 0, $40, $0 | X_FLIP | Y_FLIP
	dsprite  9, 0, 15, 0, $40, $0 | X_FLIP | Y_FLIP
	dsprite  14, 0, 16, 0, $40, $0 | X_FLIP
	dsprite  14, 0, 15, 0, $40, $0 | X_FLIP
	dsprite  17, 0, 16, 0, $40, $0 | X_FLIP | Y_FLIP
	dsprite  17, 0, 15, 0, $40, $0 | X_FLIP | Y_FLIP
	
Tourney_BracketOAMRound2_L_T:
	;y pos, x pos, tile, palette
	dsprite  6, 0, 7, 0, $49, $0
	dsprite  7, 0, 7, 0, $49, $0
	
Tourney_BracketOAMRound2_L_B:
	;y pos, x pos, tile, palette
	dsprite  9, 0, 7, 0, $49, $0 | Y_FLIP
	dsprite  8, 0, 7, 0, $49, $0 | Y_FLIP
	
Tourney_BracketOAMRound2_R_T:
	;y pos, x pos, tile, palette
	dsprite  6, 0, 14, 0, $49, $0 | X_FLIP
	dsprite  7, 0, 14, 0, $49, $0 | X_FLIP
	
Tourney_BracketOAMRound2_R_B:
	;y pos, x pos, tile, palette
	dsprite  9, 0, 14, 0, $49, $0 | X_FLIP | Y_FLIP
	dsprite  8, 0, 14, 0, $49, $0 | X_FLIP | Y_FLIP
	
Tourney_BracketOAMRound2:
	;y pos, x pos, tile, palette
	dsprite  8, 0, 7, 0, $40, $0
	dsprite  8, 0, 8, 0, $40, $0
	dsprite 15, 0, 7, 0, $40, $0| Y_FLIP
	dsprite 15, 0, 8, 0, $40, $0| Y_FLIP
	
	dsprite  8, 0, 14, 0, $40, $0 | X_FLIP
	dsprite  8, 0, 13, 0, $40, $0 | X_FLIP
	dsprite 15, 0, 14, 0, $40, $0 | X_FLIP | Y_FLIP
	dsprite 15, 0, 13, 0, $40, $0 | X_FLIP | Y_FLIP
	
Tourney_BracketOAMRound2_R:
	dsprite  8, 0, 9, 0, $49, $0
	dsprite  9, 0, 9, 0, $49, $0
	dsprite 10, 0, 9, 0, $49, $0
	dsprite 11, 0, 9, 0, $49, $0
	
Tourney_BracketOAMRound3_R_T:
	dsprite  8, 0, 12, 0, $49, $0 | X_FLIP
	dsprite  9, 0, 12, 0, $49, $0 | X_FLIP
	dsprite 10, 0, 12, 0, $49, $0 | X_FLIP
	dsprite 11, 0, 12, 0, $49, $0 | X_FLIP
	
Tourney_BracketOAMRound3_R_B:
	dsprite 15, 0, 12, 0, $49, $0 | X_FLIP | Y_FLIP
	dsprite 14, 0, 12, 0, $49, $0 | X_FLIP | Y_FLIP
	dsprite 13, 0, 12, 0, $49, $0 | X_FLIP | Y_FLIP
	dsprite 12, 0, 12, 0, $49, $0 | X_FLIP | Y_FLIP
	
Tourney_BracketOAMRound4:
	dsprite 11, 7, 9, 0, $40, $0
	dsprite 11, 7,10, 0, $40, $0
	dsprite 11, 1,10, 7, $49, $0 | Y_FLIP
	

TourneyBracketPals:
; Red
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 31, 05, 00
	RGB 00, 00, 00

; Blue
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 10, 09, 31
	RGB 00, 00, 00

; Green
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 07, 21, 02
	RGB 00, 00, 00

; Brown
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 15, 10, 03
	RGB 00, 00, 00

; Purple
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 21, 06, 21
	RGB 00, 00, 00

; Teal
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 03, 21, 19
	RGB 00, 00, 00
	
; Pink
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 31, 12, 13
	RGB 00, 00, 00
	
; Silver
	RGB 31, 31, 31
	RGB 26, 26, 26
	RGB 13, 13, 13
	RGB 00, 00, 00
	
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
