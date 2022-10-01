
_Diploma: ; 1dd702
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, DiplomaGFX
	ld de, VTiles2
	call Decompress
	ld hl, DiplomaTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld de, .PlayerString
	hlcoord 2, 5
	call PlaceString
	ld de, wPlayerName
	hlcoord 9, 5
	call PlaceString
	ld de, .DiplomaString
	hlcoord 2, 8
	call PlaceString
	call EnableLCD
	call ApplyTilemapInVBlank
	ld b, CGB_DIPLOMA
	call GetCGBLayout
	call SetPalettes
	call DelayFrame
	jp WaitPressAorB_BlinkCursor
; 1dd760

.PlayerString:
	db "Player@"

.DiplomaString:
	db   "This certifies"
	next "that you have"
	next "completed the"
	next "new #dex."
	next "Congratulations!"
	db   "@"
; 1dd7ae

DiplomaGFX: ; 1dd805
INCBIN "gfx/diploma/diploma.2bpp.lz"

DiplomaTilemap: ; 1ddc4b
INCBIN "gfx/diploma/diploma.tilemap"

_PippiScreen:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, PippiScreenGFX
	ld de, VTiles2
	call Decompress
	ld hl, PippiScreenGFX2
	ld de, VTiles1
	call Decompress
	ld hl, PippiScreenTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	call EnableLCD
	call ApplyTilemapInVBlank
	ld b, CGB_PIPPI_SCREEN
	call GetCGBLayout
	call SetPalettes
	call DelayFrame
	ld de, MUSIC_LASS_ENCOUNTER
	call PlayMusic
	jp WaitPressAorB_BlinkCursor
	
PippiScreenGFX: ; 1dd805
INCBIN "gfx/diploma/pippiscreen.2bpp.lz"

PippiScreenGFX2: ; 1dd805
INCBIN "gfx/diploma/pippiscreen2.2bpp.lz"

PippiScreenTilemap: ; 1ddc4b
INCBIN "gfx/diploma/pippiscreen.tilemap"

_WarnScreen:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, WarnScreenGFX
	ld de, VTiles2
	call Decompress
	ld hl, WarnScreenTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	call EnableLCD
	jp ApplyTilemapInVBlank
	
WarnScreenGFX: ; 1dd805
INCBIN "gfx/diploma/warn.2bpp.lz"

WarnScreenTilemap: ; 1ddc4b
INCBIN "gfx/diploma/warn.tilemap"

_DeveloperMessage:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	
	ld de, MUSIC_DEV_MESSAGE
	call PlayMusic
	
	ld hl, DeveloperMessageCorsolaGFX
	ld de, VTiles0
	call Decompress
	
	ld hl, DeveloperMessageGFX
	ld de, VTiles2
	call Decompress
	ld hl, DeveloperMessageTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld de, .String1
	hlcoord 2, 2
	call PlaceString
	call _DeveloperMessageAnimate
	call EnableLCD
	call ApplyTilemapInVBlank	
	ld hl, DeveloperMessagePalette
	ld de, wUnknBGPals
	ld bc, 4 palettes
	ld a, $5
	call FarCopyWRAM
	ld hl, DeveloperMessageCorsolaPalette
	ld de, wUnknOBPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
;the following is mad ugly, but idc im evil
	ld a, 1
	ld [rVBK], a
	
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, 0
	call ByteFill
	
	hlcoord 0, 0, wAttrMap
	ld bc, 1 * 1
	ld a, 1
	call ByteFill
	
	hlcoord 0, 17, wAttrMap
	ld bc, 1 * 1
	ld a, 1
	call ByteFill
	
	hlcoord 19, 0, wAttrMap
	ld bc, 1 * 1
	ld a, 1
	call ByteFill
	
	hlcoord 19, 17, wAttrMap
	ld bc, 1 * 1
	ld a, 1
	call ByteFill
	
	hlcoord 0, 2, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 0, 4, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 0, 6, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 0, 8, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 0, 10, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 0, 12, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 0, 14, wAttrMap
	ld bc, 1 * SCREEN_WIDTH
	ld a, 2
	call ByteFill
	
	hlcoord 1, 2, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	hlcoord 1, 4, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	hlcoord 1, 6, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	hlcoord 1, 8, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	hlcoord 1, 10, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	hlcoord 1, 12, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	hlcoord 1, 14, wAttrMap
	ld bc, 1 * 18
	ld a, 3
	call ByteFill
	
	xor a
	ld [rVBK], a
	
	call ApplyAttrAndTilemapInVBlank
	
	ld c, 15
	call FadePalettes
	call DelayFrame
	
	xor a
	ld [wPlaceBallsY], a
	ld [wPlaceBallsX], a


.page_1
	call _DeveloperMessageAnimate
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	jr z, .page_1
	
	call _DeveloperMessageAnimatePageTurn
	ld de, SFX_READ_TEXT
	call PlaySFX
	
	ld hl, DeveloperMessagePalette3
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld hl, DeveloperMessageTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld de, .String2
	hlcoord 2, 2
	call PlaceString
	
	ld c, 2
	call DelayFrames
	
	ld hl, DeveloperMessagePalette2
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld c, 1
	call DelayFrames
	
.page_2
	call _DeveloperMessageAnimate
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	jr z, .page_2
	
	call _DeveloperMessageAnimatePageTurn
	ld de, SFX_READ_TEXT
	call PlaySFX
	
	ld hl, DeveloperMessagePalette3
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld hl, DeveloperMessageTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld de, .String3
	hlcoord 2, 2
	call PlaceString
	
	ld c, 2
	call DelayFrames
	
	ld hl, DeveloperMessagePalette2
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld c, 1
	call DelayFrames
	
.page_3
	call _DeveloperMessageAnimate
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	jr z, .page_3
	
	ld de, MUSIC_DEV_MESSAGE_END
	call PlayMusic
	ld c, 31
	call FadeToBlack
	call ClearTileMap
	ret
; 1dd760
	
.String1:
	db   "Page 1"
	next "This is the"
	next "first page."
	next "Words, Words,"
	next "many words!"
	db   "@"
	
.String2:
	db   "Page 2"
	next "Page 2"
	next "Page 2"
	next "Page 2"
	next "Page 2"
	db   "@"
	
.String3:
	db   "Page 3"
	next "Page 3"
	next "Page 3"
	next "Page 3"
	next "Page 3"
	db   "@"
	
_DeveloperMessageAnimate:
	.loop
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .frame_1
	cp 1
	jr z, .frame_1
	cp 2
	jr z, .frame_1
	cp 6
	jr z, .frame_3
	cp 7
	jr z, .frame_3
	cp 8
	jr z, .frame_3
.frame_2
	ld hl, DevMessage_OAM2
	ld de, wSprites
	ld bc, 64
	call CopyBytes
	jr .cont
.frame_1
	ld hl, DevMessage_OAM1
	ld de, wSprites
	ld bc, 64
	call CopyBytes
	jr .cont
.frame_3
	ld hl, DevMessage_OAM3
	ld de, wSprites
	ld bc, 64
	call CopyBytes
.cont
	ld a, [wPlaceBallsY]
	inc a
	ld [wPlaceBallsY], a
	cp $ff
	jr nz, .dont_inc
	ld a, [wPlaceBallsX]
	inc a
	ld [wPlaceBallsX], a
	cp 12
	jr nz, .dont_reset
	xor a
	ld [wPlaceBallsX], a
.dont_inc
.dont_reset
	ret
	
_DeveloperMessageAnimatePageTurn:
	xor a
	ld [wPlaceBallsY], a
	ld [wPlaceBallsX], a
	ld hl, DevMessage_OAM4
	ld de, wSprites
	ld bc, 64
	jp CopyBytes
	
DevMessage_OAM1:
;y pos, x pos, tile, palette
	dsprite  15,  0, 15,  4, $00, $0
	dsprite  15,  0, 16,  4, $01, $0
	dsprite  15,  0, 17,  4, $02, $0
	dsprite  15,  0, 18,  4, $03, $0
	dsprite  16,  0, 15,  4, $10, $0
	dsprite  16,  0, 16,  4, $11, $0
	dsprite  16,  0, 17,  4, $12, $0
	dsprite  16,  0, 18,  4, $13, $0
	dsprite  17,  0, 15,  4, $20, $0
	dsprite  17,  0, 16,  4, $21, $0
	dsprite  17,  0, 17,  4, $22, $0
	dsprite  17,  0, 18,  4, $23, $0
	dsprite  18,  0, 15,  4, $30, $0
	dsprite  18,  0, 16,  4, $31, $0
	dsprite  18,  0, 17,  4, $32, $0
	dsprite  18,  0, 18,  4, $33, $0
	
DevMessage_OAM2:
;y pos, x pos, tile, palette
	dsprite  15,  0, 15,  4, $04, $0
	dsprite  15,  0, 16,  4, $05, $0
	dsprite  15,  0, 17,  4, $06, $0
	dsprite  15,  0, 18,  4, $07, $0
	dsprite  16,  0, 15,  4, $14, $0
	dsprite  16,  0, 16,  4, $15, $0
	dsprite  16,  0, 17,  4, $16, $0
	dsprite  16,  0, 18,  4, $17, $0
	dsprite  17,  0, 15,  4, $24, $0
	dsprite  17,  0, 16,  4, $25, $0
	dsprite  17,  0, 17,  4, $26, $0
	dsprite  17,  0, 18,  4, $27, $0
	dsprite  18,  0, 15,  4, $34, $0
	dsprite  18,  0, 16,  4, $35, $0
	dsprite  18,  0, 17,  4, $36, $0
	dsprite  18,  0, 18,  4, $37, $0
	
DevMessage_OAM3:
;y pos, x pos, tile, palette
	dsprite  15,  0, 15,  4, $08, $0
	dsprite  15,  0, 16,  4, $09, $0
	dsprite  15,  0, 17,  4, $0a, $0
	dsprite  15,  0, 18,  4, $0b, $0
	dsprite  16,  0, 15,  4, $18, $0
	dsprite  16,  0, 16,  4, $19, $0
	dsprite  16,  0, 17,  4, $1a, $0
	dsprite  16,  0, 18,  4, $1b, $0
	dsprite  17,  0, 15,  4, $28, $0
	dsprite  17,  0, 16,  4, $29, $0
	dsprite  17,  0, 17,  4, $2a, $0
	dsprite  17,  0, 18,  4, $2b, $0
	dsprite  18,  0, 15,  4, $38, $0
	dsprite  18,  0, 16,  4, $39, $0
	dsprite  18,  0, 17,  4, $3a, $0
	dsprite  18,  0, 18,  4, $3b, $0
	
DevMessage_OAM4:
;y pos, x pos, tile, palette
	dsprite  15,  0, 15,  4, $0c, $0
	dsprite  15,  0, 16,  4, $0d, $0
	dsprite  15,  0, 17,  4, $0e, $0
	dsprite  15,  0, 18,  4, $0f, $0
	dsprite  16,  0, 15,  4, $1c, $0
	dsprite  16,  0, 16,  4, $1d, $0
	dsprite  16,  0, 17,  4, $1e, $0
	dsprite  16,  0, 18,  4, $1f, $0
	dsprite  17,  0, 15,  4, $2c, $0
	dsprite  17,  0, 16,  4, $2d, $0
	dsprite  17,  0, 17,  4, $2e, $0
	dsprite  17,  0, 18,  4, $2f, $0
	dsprite  18,  0, 15,  4, $3c, $0
	dsprite  18,  0, 16,  4, $3d, $0
	dsprite  18,  0, 17,  4, $3e, $0
	dsprite  18,  0, 18,  4, $3f, $0
	
DeveloperMessageGFX: ; 1dd805
INCBIN "gfx/diploma/devmessage.2bpp.lz"

DeveloperMessageCorsolaGFX: ; 1dd805
INCBIN "gfx/diploma/corsola.2bpp.lz"

DeveloperMessageTilemap: ; 1ddc4b
INCBIN "gfx/diploma/devmessage.tilemap"

DeveloperMessagePalette:
	RGB 31, 27, 19
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
	RGB 31, 31, 31
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04

DeveloperMessagePalette2:
	RGB 31, 29, 23
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
	RGB 31, 29, 23
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
DeveloperMessagePalette3:
	RGB 31, 29, 23
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 31, 29, 23
	
DeveloperMessageCorsolaPalette:
	RGB 31, 31, 00
	RGB 31, 31, 31
	RGB 31, 11, 31
	RGB 00, 00, 00