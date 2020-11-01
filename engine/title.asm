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
;	ld hl, TitleLogoGFX
;	ld de, VTiles1
;	call Decompress

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
	ld hl, TitleLighthouseGFX
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
	
; Draw Lighthouse
	ld hl, TitleScreenTilemap
	debgcoord 0, 0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
.copy
	ld a, 0
	ldh [rVBK], a
	ld a, [hli]
	ld [de], a
	ld a, 1
	ldh [rVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	
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

; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a

; Restore WRAM bank
	pop af
	ld [rSVBK], a
	
; Reset audio
;	call ChannelsOff
	call EnableLCD
	
	ldh a, [rLCDC]
	res rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a

	ld a, $1
	ld [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
;	ld [hBGMapMode], a

	xor a
	ld [wUnknBGPals palette 0 + 2], a
	ret

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

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.w160.t4.2bpp.lz"
; 10fcee

TitleLighthouseGFX:
INCBIN "gfx/title/lighthouse.2bpp.lz"

TitleSpritesGFX:
INCBIN "gfx/title/title_sprites.2bpp.lz"

TitleScreenTilemap:
; 32x32 (alternating tiles and attributes)
INCBIN "gfx/title/title.bin"
	