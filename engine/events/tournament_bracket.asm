DrawTourneyBracket::
	call FadeToMenu
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	lb bc, BANK(TourneyBracketGFX), $08
	ld de, TourneyBracketGFX
	ld hl, VTiles2 tile $00
	call Request2bpp
	xor a
	ldh [hBGMapMode], a
	call FillBracketTilemap
	call FillBracketAttrmap	
	
	
	call GetTourneyCompetetorSprites
	call GetTourneyCompetetorSpriteColors
	
	call ApplyAttrAndTilemapInVBlank
	
; palettes
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, TourneyBracketPals
	ld de, wUnknBGPals
	ld bc, 8 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	farcall FadeInPalettes
.loop
	call UpdateTime
	call JoyTextDelay
	ldh a, [hJoyLast]
	and B_BUTTON
	jr z, .loop
	farcall FadeOutPalettes
	call EnableSpriteUpdates2
	call CloseSubmenu
	xor a
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
	ld hl, wTourneyBracket1
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 3, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket2
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 5, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket3
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 9, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket4
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 13, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket5
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 1, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket6
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 5, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket7
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 9, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket8
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 13, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket9
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 7, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket10
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 11, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket11
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 1, 15, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket12
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 3, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket13
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 7, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket14
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 11, wAttrMap
	call TourneyBracket_FillBox
	
	ld hl, wTourneyBracket15
	call GetCurTourneyCompetetorSpriteColor
	hlcoord 17, 15, wAttrMap
	call TourneyBracket_FillBox
	
	ret
	
GetCurTourneyCompetetorSpriteColor:
	ld a, [hl]
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

TourneyBracketTilemap:
INCBIN "gfx/tourney/bracket.tilemap"

TourneyBracketAttrmap:
INCBIN "gfx/tourney/bracket.attrmap"

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
	RGB 20, 31, 11
	RGB 02, 26, 07
	RGB 00, 14, 05
	RGB 07, 07, 07
