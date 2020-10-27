_TitleScreen: ; 10ed67

	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimerLo
	ld [hl], a  ; wTitleScreenTimerHi

; Turn LCD off
	call DisableLCD

	ld a, $90
	ld [hWY], a
	
; VRAM bank 1
	ld a, 1
	ld [rVBK], a


; Decompress background
	ld hl, TitleLighthouseGFX
	ld de, VTiles1
	call Decompress

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, SCREEN_WIDTH * BG_MAP_WIDTH
	xor a
	call ByteFill


; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, VBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 1 ; palette
	call ByteFill


; BG Map 0:

; Apply logo gradient:
; line 0
	hlbgcoord 0, 0
	ld bc, BG_MAP_WIDTH
	ld a, 7
	call ByteFill
; line 1
	hlbgcoord 0, 1
	ld bc, BG_MAP_WIDTH
	ld a, 1
	call ByteFill
; line 2
	hlbgcoord 0, 2
	ld bc, BG_MAP_WIDTH
	ld a, 2
	call ByteFill
; line 3
	hlbgcoord 0, 3
	ld bc, BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; line 4
	hlbgcoord 0, 4
	ld bc, BG_MAP_WIDTH
	ld a, 4
	call ByteFill
; line 5
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 5
	call ByteFill
; lines 6-7
	hlbgcoord 0, 6
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	call ByteFill


; Suicune gfx
	hlbgcoord 0, 8
	ld bc, 11 * BG_MAP_WIDTH ; the rest of the screen
	ld a, 8
	call ByteFill
	
	
; Back to VRAM bank 0
	xor a
	ld [rVBK], a
	
; Decompress logo
	ld hl, TitleLogoGFX
	ld de, VTiles1
	call Decompress
	
	ld hl, TitleSpritesGFX
	ld de, VTiles0
	call Decompress
	
; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	call ByteFill
	
	call DrawOffScreenTitleBackground
	
; Draw logo
	hlcoord 0, 1
	lb bc, 7, SCREEN_WIDTH
	lb de, $80, SCREEN_WIDTH
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 0, 0, VBGMap1
	lb bc, 1, 9
	lb de, $0c, 0
	call DrawTitleGraphic
	
; Draw Lighthouse
	hlcoord 0, 10
	lb bc, 7, SCREEN_WIDTH
	lb de, $80, SCREEN_WIDTH
	call DrawTitleGraphic
	
	hlcoord 0, 17
	lb bc, 1, 11
	lb de, $29, SCREEN_WIDTH
	call DrawTitleGraphic
	
	hlcoord 11, 17
	lb bc, 1, 9
	lb de, $3d, SCREEN_WIDTH
	call DrawTitleGraphic
	
; Initialize running Suicune?
;	ld d, $80
;	call LoadSuicuneFrame

; Initialize background crystal
;	call InitializeBackground

; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a

; Restore WRAM bank
	pop af
	ld [rSVBK], a

	ld hl, UnusedTitleFG_OAM
	ld de, wSprites
	ld bc, 24
	call CopyBytes
	
; Reset audio
;	call ChannelsOff
	call EnableLCD
	
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a

	ld a, $1
	ld [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ld [hBGMapMode], a

	xor a
	ld [wUnknBGPals palette 0 + 2], a
	
; Play starting sound effect
;	call SFXChannelsOff
;	ld de, SFX_TITLE_SCREEN_ENTRANCE
;	call PlaySFX
	ret
; 10eea7

;SuicuneFrameIterator: ; 10eea7
;	ld hl, wUnknBGPals palette 0 + 2
;	ld a, [hl]
;	ld c, a
;	inc [hl]

; Only do this once every eight frames
;	and (1 << 3) - 1
;	ret nz

;	ld a, c
;	and 3 << 3
;	sla a
;	swap a
;	ld e, a
;	ld d, $0
;	ld hl, .Frames
;	add hl, de
;	ld d, [hl]
;	xor a
;	ld [hBGMapMode], a
;	call LoadSuicuneFrame
;	ld a, $1
;	ld [hBGMapMode], a
;	ld [hBGMapHalf], a
;	ret
; 10eece

;.Frames: ; 10eece
;	db $80 ; VTiles4 tile $00
;	db $88 ; VTiles4 tile $08
;	db $00 ; VTiles5 tile $00
;	db $08 ; VTiles5 tile $08
; 10eed2


LoadSuicuneFrame: ; 10eed2
	hlcoord 0, 8
	ld b, 6
.bgrows
	ld c, 20
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH; - 8
	add l
	ld l, a
	ld a, 0 ; not xor a; preserve carry flag
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10eeef

DrawTitleGraphic: ; 10eeef
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10ef06

InitializeBackground: ; 10ef06
	ld hl, wSprites
	lb de, $0, $0
	ld c, 5
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret
; 10ef1c

.InitColumn: ; 10ef1c
	lb bc, $40, $1
.loop2
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	add $8
	ld b, a
	ld a, e
	ld [hli], a
	inc e
	inc e
	ld a, $80
	ld [hli], a
	dec c
	jr nz, .loop2
	ret
; 10ef32


AnimateTitleCrystal: ; 10ef32
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, wSprites
	ld a, [hl]
	cp 6 + $10
	ret z

; Move all 30 parts of the crystal down by 2
	ld c, 30
.loop
	ld a, [hl]
	add 2
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop

	ret
; 10ef46

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.w160.t4.2bpp.lz"
; 10fcee

TitleLighthouseGFX:
INCBIN "gfx/title/lighthouse.2bpp.lz"

TitleSpritesGFX:
INCBIN "gfx/title/title_sprites.2bpp.lz"

DrawOffScreenTitleBackground:
	hlbgcoord 20, 10
	ld bc, 1 * 1
	ld a, $0c
	call ByteFill
	hlbgcoord 21, 10
	ld bc, 1 * 1
	ld a, $0d
	call ByteFill
	hlbgcoord 22, 10
	ld bc, 1 * 1
	ld a, $0e
	call ByteFill
	hlbgcoord 23, 10
	ld bc, 1 * 1
	ld a, $0f
	call ByteFill
	
	hlbgcoord 20, 11
	ld bc, 1 * 1
	ld a, $20
	call ByteFill
	hlbgcoord 21, 11
	ld bc, 1 * 1
	ld a, $21
	call ByteFill
	hlbgcoord 22, 11
	ld bc, 1 * 1
	ld a, $22
	call ByteFill
	hlbgcoord 23, 11
	ld bc, 1 * 1
	ld a, $23
	call ByteFill
	hlbgcoord 27, 11
	ld bc, 1 * 1
	ld a, $27
	call ByteFill
	hlbgcoord 28, 11
	ld bc, 1 * 1
	ld a, $28
	call ByteFill
	
	hlbgcoord 20, 12
	ld bc, 1 * 1
	ld a, $34
	call ByteFill
	hlbgcoord 21, 12
	ld bc, 1 * 1
	ld a, $35
	call ByteFill
	hlbgcoord 22, 12
	ld bc, 1 * 1
	ld a, $36
	call ByteFill
	hlbgcoord 23, 12
	ld bc, 1 * 1
	ld a, $37
	call ByteFill
	hlbgcoord 24, 12
	ld bc, 1 * 1
	ld a, $38
	call ByteFill
	hlbgcoord 25, 12
	ld bc, 1 * 1
	ld a, $39
	call ByteFill
	hlbgcoord 26, 12
	ld bc, 1 * 1
	ld a, $3a
	call ByteFill
	hlbgcoord 27, 12
	ld bc, 1 * 1
	ld a, $3b
	call ByteFill
	hlbgcoord 28, 12
	ld bc, 1 * 1
	ld a, $3c
	call ByteFill
	
	hlbgcoord 20, 13
	ld bc, 1 * 1
	ld a, $48
	call ByteFill
	hlbgcoord 21, 13
	ld bc, 1 * 1
	ld a, $49
	call ByteFill
	hlbgcoord 22, 13
	ld bc, 1 * 1
	ld a, $4a
	call ByteFill
	hlbgcoord 23, 13
	ld bc, 1 * 1
	ld a, $4b
	call ByteFill
	hlbgcoord 24, 13
	ld bc, 1 * 1
	ld a, $4c
	call ByteFill
	hlbgcoord 25, 13
	ld bc, 1 * 1
	ld a, $4d
	call ByteFill
	hlbgcoord 26, 13
	ld bc, 1 * 1
	ld a, $4e
	call ByteFill
	hlbgcoord 27, 13
	ld bc, 1 * 1
	ld a, $4f
	call ByteFill
	hlbgcoord 28, 13
	ld bc, 1 * 1
	ld a, $50
	call ByteFill
	
	hlbgcoord 20, 14
	ld bc, 1 * 1
	ld a, $5c
	call ByteFill
	hlbgcoord 21, 14
	ld bc, 1 * 1
	ld a, $5d
	call ByteFill
	hlbgcoord 22, 14
	ld bc, 1 * 1
	ld a, $5e
	call ByteFill
	hlbgcoord 23, 14
	ld bc, 1 * 1
	ld a, $5f
	call ByteFill
	hlbgcoord 24, 14
	ld bc, 1 * 1
	ld a, $60
	call ByteFill
	hlbgcoord 25, 14
	ld bc, 1 * 1
	ld a, $61
	call ByteFill
	hlbgcoord 26, 14
	ld bc, 1 * 1
	ld a, $62
	call ByteFill
	hlbgcoord 27, 14
	ld bc, 1 * 1
	ld a, $63
	call ByteFill
	hlbgcoord 28, 14
	ld bc, 1 * 1
	ld a, $64
	call ByteFill
	
	hlbgcoord 20, 15
	ld bc, 1 * 1
	ld a, $70
	call ByteFill
	hlbgcoord 21, 15
	ld bc, 1 * 1
	ld a, $71
	call ByteFill
	hlbgcoord 22, 15
	ld bc, 1 * 1
	ld a, $72
	call ByteFill
	hlbgcoord 23, 15
	ld bc, 1 * 1
	ld a, $73
	call ByteFill
	hlbgcoord 24, 15
	ld bc, 1 * 1
	ld a, $74
	call ByteFill
	hlbgcoord 25, 15
	ld bc, 1 * 1
	ld a, $75
	call ByteFill
	hlbgcoord 26, 15
	ld bc, 1 * 1
	ld a, $76
	call ByteFill
	hlbgcoord 27, 15
	ld bc, 1 * 1
	ld a, $77
	call ByteFill
	hlbgcoord 28, 15
	ld bc, 1 * 1
	ld a, $78
	call ByteFill
	
	hlbgcoord 20, 16
	ld bc, 1 * 1
	ld a, $15
	call ByteFill
	hlbgcoord 21, 16
	ld bc, 1 * 1
	ld a, $16
	call ByteFill
	hlbgcoord 22, 16
	ld bc, 1 * 1
	ld a, $17
	call ByteFill
	hlbgcoord 23, 16
	ld bc, 1 * 1
	ld a, $18
	call ByteFill
	hlbgcoord 24, 16
	ld bc, 1 * 1
	ld a, $19
	call ByteFill
	hlbgcoord 25, 16
	ld bc, 1 * 1
	ld a, $1a
	call ByteFill
	hlbgcoord 26, 16
	ld bc, 1 * 1
	ld a, $1b
	call ByteFill
	hlbgcoord 27, 16
	ld bc, 1 * 1
	ld a, $1c
	call ByteFill
	hlbgcoord 28, 16
	ld bc, 1 * 1
	ld a, $1d
	call ByteFill
	
	hlbgcoord 20, 17
	ld bc, 1 * 1
	ld a, $51
	call ByteFill
	hlbgcoord 21, 17
	ld bc, 1 * 1
	ld a, $52
	call ByteFill
	hlbgcoord 22, 17
	ld bc, 1 * 1
	ld a, $53
	call ByteFill
	hlbgcoord 23, 17
	ld bc, 1 * 1
	ld a, $54
	call ByteFill
	hlbgcoord 24, 17
	ld bc, 1 * 1
	ld a, $55
	call ByteFill
	hlbgcoord 25, 17
	ld bc, 1 * 1
	ld a, $56
	call ByteFill
	hlbgcoord 26, 17
	ld bc, 1 * 1
	ld a, $57
	call ByteFill
	hlbgcoord 27, 17
	ld bc, 1 * 1
	ld a, $58
	call ByteFill
	hlbgcoord 28, 17
	ld bc, 1 * 1
	ld a, $59
	call ByteFill
	ret

UnusedTitleFG_OAM:
	dsprite 12,  0,  3,  2, $00, 1
	dsprite 13,  0,  3,  2, $02, 1
	dsprite 14,  0,  3,  2, $04, 1
	dsprite 12,  0,  4,  2, $01, 1
	dsprite 13,  0,  4,  2, $03, 1
	dsprite 14,  0,  4,  2, $05, 1
	