CoralDevScreen:
;	call ClearTileMap
	call ClearSprites
	xor a
	ldh [rVBK], a
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a
	
	ld de, BusterGFX
	ld hl, VTiles0 tile $00
	lb bc, BANK(BusterGFX), $42
	call Request2bpp
	
;render border 1
	ld hl, Border_OAM1
	ld de, wSprites
	ld bc, 10 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	ld hl, Border_OAM1 + 10 * 4
	ld de, wSprites + 28 * 4
	ld bc, 12 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	call DelayFrame
	
	call SetWhitePals
	
	ld hl, CoralDevScreenPalette1
	ld de, wUnknOBPals
	ld bc, 3 palettes
	ld a, $5
	farcall FarCopyWRAM
	
	ld de, MUSIC_TITLE
	call PlayMusic
	
	ld c, 15
	call FadePalettes
	;205 delay frames
	ld c, 10
	call DelayFrames
	
	ld hl, Buster_OAM0
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 3 * 4
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM1
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 3 * 4
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM2
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 6 * 4
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM3
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 6 * 4
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM4
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 12 * 4
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM5
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 12 * 4
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM6
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 60
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM7
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 60
	call CopyBytes
	call DelayFrame
	
	ld hl, Buster_OAM8
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 60
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, Buster_OAM9
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 60
	call CopyBytes
	ld c, 4
	call DelayFrames
	
	ld hl, Buster_OAM10
	ld de, wSprites + 10 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 60
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	call ClearSprites
	
;render border 2
	ld hl, Border_OAM2
	ld de, wSprites
	ld bc, 6 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	ld hl, Border_OAM2 + 6 * 4
	ld de, wSprites + 24 * 4
	ld bc, 16 * 4	;number of sprites * 4 bytes per sprite
	call CopyBytes
	
	ld hl, Buster_OAM11
	ld de, wSprites + 6 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 60
	call CopyBytes
	
	ld c, 75
	call DelayFrames
	
	ld hl, Buster_OAM12
	ld de, wSprites + 6 * 4	;number of sprites * 4 bytes per sprite
	ld bc, 64
	call CopyBytes
	
	ld hl, CoralDevScreenPalette2
	ld de, wUnknOBPals
	ld bc, 3 palettes
	ld a, $5
	farcall FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld c, 125
	call DelayFrames
	
	call SetWhitePals
	ld c, 15
	call FadePalettes
	ld c, 60
	call DelayFrames
	
	call ClearSprites
	
	ld de, TitleSpritesGFX
	ld hl, VTiles0 tile $00
	lb bc, BANK(TitleSpritesGFX), $63
	call Request2bpp
	
	ret
	
Border_OAM1:
;y pos, x pos, tile, palette
	dsprite  11,  8,  8,  0, $36, $0
	dsprite  11,  8,  9,  0, $37, $0
	dsprite  11,  8, 10,  0, $38, $0
	dsprite  11,  8, 11,  0, $39, $0
	dsprite  11,  8, 12,  0, $3a, $0
	dsprite  11,  8, 13,  0, $3b, $0
	dsprite  10,  8,  9,  0, $41, $2 | Y_FLIP
	dsprite  10,  8, 10,  0, $40, $2 | Y_FLIP
	dsprite  10,  8, 11,  0, $40, $2 | X_FLIP | Y_FLIP
	dsprite  10,  8, 12,  0, $41, $2 | X_FLIP | Y_FLIP
	
	dsprite   7,  8,  9,  0, $3c, $2
	dsprite   7,  8, 10,  0, $3d, $2
	dsprite   7,  8, 11,  0, $3d, $2 | X_FLIP
	dsprite   7,  8, 12,  0, $3c, $2 | X_FLIP
	dsprite   8,  8,  9,  0, $3e, $2
	dsprite   8,  8, 10,  0, $3f, $2
	dsprite   8,  8, 11,  0, $3f, $2 | X_FLIP
	dsprite   8,  8, 12,  0, $3e, $2 | X_FLIP
	dsprite   9,  8,  9,  0, $3e, $2 | Y_FLIP
	dsprite   9,  8, 10,  0, $3f, $2 | Y_FLIP
	dsprite   9,  8, 11,  0, $3f, $2 | X_FLIP | Y_FLIP
	dsprite   9,  8, 12,  0, $3e, $2 | X_FLIP | Y_FLIP
	
	
Border_OAM2:
;y pos, x pos, tile, palette
	dsprite  11,  8,  8,  0, $36, $0
	dsprite  11,  8,  9,  0, $37, $0
	dsprite  11,  8, 10,  0, $38, $0
	dsprite  11,  8, 11,  0, $39, $0
	dsprite  11,  8, 12,  0, $3a, $0
	dsprite  11,  8, 13,  0, $3b, $0
	dsprite   7,  8,  9,  0, $3c, $2
	dsprite   7,  8, 10,  0, $3d, $2
	dsprite   7,  8, 11,  0, $3d, $2 | X_FLIP
	dsprite   7,  8, 12,  0, $3c, $2 | X_FLIP
	dsprite   8,  8,  9,  0, $3e, $2
	dsprite   8,  8, 10,  0, $3f, $2
	dsprite   8,  8, 11,  0, $3f, $2 | X_FLIP
	dsprite   8,  8, 12,  0, $3e, $2 | X_FLIP
	dsprite   9,  8,  9,  0, $3e, $2 | Y_FLIP
	dsprite   9,  8, 10,  0, $3f, $2 | Y_FLIP
	dsprite   9,  8, 11,  0, $3f, $2 | X_FLIP | Y_FLIP
	dsprite   9,  8, 12,  0, $3e, $2 | X_FLIP | Y_FLIP
	dsprite  10,  8,  9,  0, $3c, $2 | Y_FLIP
	dsprite  10,  8, 10,  0, $3d, $2 | Y_FLIP
	dsprite  10,  8, 11,  0, $3d, $2 | X_FLIP | Y_FLIP
	dsprite  10,  8, 12,  0, $3c, $2 | X_FLIP | Y_FLIP
	
Buster_OAM0:
;y pos, x pos, tile, palette
	dsprite  11,  3,  9,  9, $00, $0
	dsprite  11,  3, 10,  9, $01, $0
	dsprite  11,  3, 11,  9, $02, $0
	dsprite  12,  3,  9,  9, $03, $0
	dsprite  12,  3, 10,  9, $04, $0
	dsprite  12,  3, 11,  9, $05, $0
	dsprite  13,  3,  9,  9, $06, $0
	dsprite  13,  3, 10,  9, $07, $0
	dsprite  13,  3, 11,  9, $08, $0
	dsprite  14,  3,  9,  9, $09, $0
	dsprite  14,  3, 10,  9, $0a, $0
	dsprite  14,  3, 11,  9, $0b, $0
	
Buster_OAM1:
;y pos, x pos, tile, palette
	dsprite  10,  7,  9,  8, $00, $0
	dsprite  10,  7, 10,  8, $01, $0
	dsprite  10,  7, 11,  8, $02, $0
	dsprite  11,  7,  9,  8, $03, $0
	dsprite  11,  7, 10,  8, $04, $0
	dsprite  11,  7, 11,  8, $05, $0
	dsprite  12,  7,  9,  8, $06, $0
	dsprite  12,  7, 10,  8, $07, $0
	dsprite  12,  7, 11,  8, $08, $0
	dsprite  13,  7,  9,  8, $09, $0
	dsprite  13,  7, 10,  8, $0a, $0
	dsprite  13,  7, 11,  8, $0b, $0
	
Buster_OAM2:
;y pos, x pos, tile, palette
	dsprite  10,  3,  9,  7, $00, $0
	dsprite  10,  3, 10,  7, $01, $0
	dsprite  10,  3, 11,  7, $02, $0
	dsprite  11,  3,  9,  7, $03, $0
	dsprite  11,  3, 10,  7, $04, $0
	dsprite  11,  3, 11,  7, $05, $0
	dsprite  12,  3,  9,  7, $06, $0
	dsprite  12,  3, 10,  7, $07, $0
	dsprite  12,  3, 11,  7, $08, $0
	dsprite  13,  3,  9,  7, $09, $0
	dsprite  13,  3, 10,  7, $0a, $0
	dsprite  13,  3, 11,  7, $0b, $0
	
Buster_OAM3:
;y pos, x pos, tile, palette
	dsprite   9,  7,  9,  6, $00, $0
	dsprite   9,  7, 10,  6, $01, $0
	dsprite   9,  7, 11,  6, $02, $0
	dsprite  10,  7,  9,  6, $03, $0
	dsprite  10,  7, 10,  6, $04, $0
	dsprite  10,  7, 11,  6, $05, $0
	dsprite  11,  7,  9,  6, $06, $0
	dsprite  11,  7, 10,  6, $07, $0
	dsprite  11,  7, 11,  6, $08, $0
	dsprite  12,  7,  9,  6, $09, $0
	dsprite  12,  7, 10,  6, $0a, $0
	dsprite  12,  7, 11,  6, $0b, $0
	
Buster_OAM4:
;y pos, x pos, tile, palette
	dsprite  11,  1, 10,  6, $12, $1
	dsprite  11,  1, 11,  6, $13, $1
	dsprite  12,  0, 10,  6, $15, $1

	dsprite   9,  3,  9,  5, $00, $0
	dsprite   9,  3, 10,  5, $01, $0
	dsprite   9,  3, 11,  5, $02, $0
	dsprite  10,  3,  9,  5, $03, $0
	dsprite  10,  3, 10,  5, $04, $0
	dsprite  10,  3, 11,  5, $05, $0
	dsprite  11,  3,  9,  5, $06, $0
	dsprite  11,  3, 10,  5, $07, $0
	dsprite  11,  3, 11,  5, $08, $0
	dsprite  12,  3,  9,  5, $09, $0
	dsprite  12,  3, 10,  5, $0a, $0
	dsprite  12,  3, 11,  5, $0b, $0
	
Buster_OAM5:
;y pos, x pos, tile, palette
	dsprite  10,  5, 10,  5, $12, $1
	dsprite  10,  5, 11,  5, $13, $1
	dsprite  11,  5, 10,  5, $15, $1

	dsprite   8,  7,  9,  4, $00, $0
	dsprite   8,  7, 10,  4, $01, $0
	dsprite   8,  7, 11,  4, $02, $0
	dsprite   9,  7,  9,  4, $03, $0
	dsprite   9,  7, 10,  4, $04, $0
	dsprite   9,  7, 11,  4, $05, $0
	dsprite  10,  7,  9,  4, $06, $0
	dsprite  10,  7, 10,  4, $07, $0
	dsprite  10,  7, 11,  4, $08, $0
	dsprite  11,  7,  9,  4, $09, $0
	dsprite  11,  7, 10,  4, $0a, $0
	dsprite  11,  7, 11,  4, $0b, $0
	
Buster_OAM6:
;y pos, x pos, tile, palette
	dsprite  10,  1, 10,  4, $12, $1
	dsprite  10,  1, 11,  4, $13, $1
	dsprite  11,  1, 10,  4, $15, $1

	dsprite   8,  3,  9,  3, $00, $0
	dsprite   8,  3, 10,  3, $01, $0
	dsprite   8,  3, 11,  3, $02, $0
	dsprite   9,  3,  9,  3, $03, $0
	dsprite   9,  3, 10,  3, $04, $0
	dsprite   9,  3, 11,  3, $05, $0
	dsprite  10,  3,  9,  3, $06, $0
	dsprite  10,  3, 10,  3, $07, $0
	dsprite  10,  3, 11,  3, $08, $0
	dsprite  11,  3,  9,  3, $09, $0
	dsprite  11,  3, 10,  3, $0a, $0
	dsprite  11,  3, 11,  3, $0b, $0
	
Buster_OAM7:
;y pos, x pos, tile, palette
	dsprite   9,  7, 10,  4, $12, $1
	dsprite   9,  7, 11,  4, $13, $1
	dsprite  10,  7, 10,  4, $15, $1

	dsprite   8,  1,  9,  3, $00, $0
	dsprite   8,  1, 10,  3, $01, $0
	dsprite   8,  1, 11,  3, $02, $0
	dsprite   9,  1,  9,  3, $03, $0
	dsprite   9,  1, 10,  3, $04, $0
	dsprite   9,  1, 11,  3, $05, $0
	dsprite  10,  1,  9,  3, $06, $0
	dsprite  10,  1, 10,  3, $07, $0
	dsprite  10,  1, 11,  3, $08, $0
	dsprite  11,  1,  9,  3, $09, $0
	dsprite  11,  1, 10,  3, $0a, $0
	dsprite  11,  1, 11,  3, $0b, $0
	
Buster_OAM8:
;y pos, x pos, tile, palette
	dsprite   9,  5, 10,  5, $12, $1
	dsprite   9,  5, 11,  5, $13, $1
	dsprite  10,  5, 10,  5, $15, $1

	dsprite   7,  7,  9,  4, $00, $0
	dsprite   7,  7, 10,  4, $01, $0
	dsprite   7,  7, 11,  4, $02, $0
	dsprite   8,  7,  9,  4, $03, $0
	dsprite   8,  7, 10,  4, $04, $0
	dsprite   8,  7, 11,  4, $05, $0
	dsprite   9,  7,  9,  4, $06, $0
	dsprite   9,  7, 10,  4, $07, $0
	dsprite   9,  7, 11,  4, $08, $0
	dsprite  10,  7,  9,  4, $09, $0
	dsprite  10,  7, 10,  4, $0a, $0
	dsprite  10,  7, 11,  4, $0b, $0
	
Buster_OAM9:
;y pos, x pos, tile, palette
	dsprite   9,  6, 10,  5, $12, $1
	dsprite   9,  6, 11,  5, $13, $1
	dsprite  10,  6, 10,  5, $15, $1

	dsprite   7,  8,  9,  4, $0c, $0
	dsprite   7,  8, 10,  4, $0d, $0
	dsprite   7,  8, 11,  4, $0e, $0
	dsprite   8,  8,  9,  4, $0f, $0
	dsprite   8,  8, 10,  4, $10, $0
	dsprite   8,  8, 11,  4, $11, $0
	dsprite   9,  8,  9,  4, $06, $0
	dsprite   9,  8, 10,  4, $07, $0
	dsprite   9,  8, 11,  4, $08, $0
	dsprite  10,  8,  9,  4, $09, $0
	dsprite  10,  8, 10,  4, $0a, $0
	dsprite  10,  8, 11,  4, $0b, $0
	
Buster_OAM10:
;y pos, x pos, tile, palette
	dsprite   9,  7, 10,  6, $12, $1
	dsprite   9,  7, 11,  6, $13, $1
	dsprite  10,  7, 10,  6, $15, $1

	dsprite   7,  9,  9,  5, $0c, $0
	dsprite   7,  9, 10,  5, $0d, $0
	dsprite   7,  9, 11,  5, $0e, $0
	dsprite   8,  9,  9,  5, $0f, $0
	dsprite   8,  9, 10,  5, $10, $0
	dsprite   8,  9, 11,  5, $11, $0
	dsprite   9,  9,  9,  5, $06, $0
	dsprite   9,  9, 10,  5, $07, $0
	dsprite   9,  9, 11,  5, $08, $0
	dsprite  10,  9,  9,  5, $09, $0
	dsprite  10,  9, 10,  5, $0a, $0
	dsprite  10,  9, 11,  5, $0b, $0
	
Buster_OAM11:
;y pos, x pos, tile, palette
	dsprite   9,  7, 10,  5, $30, $1
	dsprite   9,  7, 11,  5, $31, $1
	dsprite  10,  7, 10,  5, $33, $1

	dsprite   7,  9,  9,  5, $18, $0
	dsprite   7,  9, 10,  5, $19, $0
	dsprite   7,  9, 11,  5, $1a, $0
	dsprite   8,  9,  9,  5, $1b, $0
	dsprite   8,  9, 10,  5, $1c, $0
	dsprite   8,  9, 11,  5, $1d, $0
	dsprite   9,  9,  9,  5, $1e, $0
	dsprite   9,  9, 10,  5, $1f, $0
	dsprite   9,  9, 11,  5, $20, $0
	dsprite  10,  9,  9,  5, $21, $0
	dsprite  10,  9, 10,  5, $22, $0
	dsprite  10,  9, 11,  5, $23, $0
	
Buster_OAM12:
;y pos, x pos, tile, palette
	dsprite   9,  9, 10,  5, $17, $1
	dsprite   9,  7, 11,  4, $32, $1
	dsprite  10,  7, 10,  4, $34, $1
	dsprite  10,  7, 11,  4, $35, $1

	dsprite   7,  9,  9,  5, $24, $0
	dsprite   7,  9, 10,  5, $25, $0
	dsprite   7,  9, 11,  5, $26, $0
	dsprite   8,  9,  9,  5, $27, $0
	dsprite   8,  9, 10,  5, $28, $0
	dsprite   8,  9, 11,  5, $29, $0
	dsprite   9,  9,  9,  5, $2a, $0
	dsprite   9,  9, 10,  5, $2b, $0
	dsprite   9,  9, 11,  5, $2c, $0
	dsprite  10,  9,  9,  5, $2d, $0
	dsprite  10,  9, 10,  5, $2e, $0
	dsprite  10,  9, 11,  5, $2f, $0
	