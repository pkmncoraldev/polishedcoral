
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
	
	xor a
	ld [wPlaceBallsY], a
	ld [wPlaceBallsX], a
	ld [wMoogooTurn], a
	ld a, 4
	ld [wNumHits], a
	
	ld de, MUSIC_DEV_MESSAGE
	call PlayMusic
	
	ld hl, DeveloperMessageCorsolaGFX
	ld de, VTiles0
	call Decompress
	
	ld hl, DeveloperMessageBallGFX
	ld de, VTiles0 + $48 tiles
	call Decompress
	
	ld hl, DeveloperMessageGFX
	ld de, VTiles2
	call Decompress
	ld hl, DeveloperMessageTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld de, DeveloperMessageString1
	hlcoord 2, 2
	call PlaceString
	call _DeveloperMessageAnimate
	
	ld hl, DevMessage_BallOAM
	ld de, wSprites
	ld bc, 16
	call CopyBytes
	
	call EnableLCD
	call ApplyTilemapInVBlank	
	ld hl, DeveloperMessagePalette
	ld de, wUnknBGPals
	ld bc, 5 palettes
	ld a, $5
	call FarCopyWRAM
	ld hl, DeveloperMessageOBPalette
	ld de, wUnknOBPals
	ld bc, 5 palettes
	ld a, $5
	call FarCopyWRAM
	
	ld a, 1
	ld [rVBK], a
	
	ld hl, DeveloperMessageAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
	xor a
	ld [rVBK], a
	
	call ApplyAttrAndTilemapInVBlank
	
	ld c, 15
	call FadePalettes
	call DelayFrame
	
	ld a, [wMoogooTurn]
	inc a
	ld [wMoogooTurn], a
	
.page_1
	call _DeveloperMessageAnimate
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	jr z, .page_1
	
	call _DeveloperMessageAnimatePageTurn1
	ld de, SFX_READ_TEXT
	call PlaySFX
	
	ld a, [wMoogooTurn]
	inc a
	ld [wMoogooTurn], a
	call _DeveloperMessageNextPage
	
.page_2
	call _DeveloperMessageAnimate
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	jr z, .page_2
	
	call _DeveloperMessageAnimatePageTurn1
	ld de, SFX_READ_TEXT
	call PlaySFX
	
	ld a, [wMoogooTurn]
	inc a
	ld [wMoogooTurn], a
	call _DeveloperMessageNextPage
	
.page_3
	call _DeveloperMessageAnimate
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	jr z, .page_3
	
	call _DeveloperMessageAnimatePageTurn1
	ld de, SFX_READ_TEXT
	call PlaySFX
	
	ld a, [wMoogooTurn]
	inc a
	ld [wMoogooTurn], a
	call _DeveloperMessageNextPage
	
	call _DeveloperMessageAnimateEnding
	ld c, 100
	call DelayFrames
	ld c, 31
	call FadeToWhite
	call ClearSprites
	jp ClearTileMap
; 1dd760
	
DeveloperMessageString1:
	db	 "#MON CORAL<LNBRK>"
	db	 "VERSION DEMO 3"
	
	next "This demo goes<LNBRK>"
	db	 "to the 4th GYM<LNBRK>"
	db	 "and beyond!"
	
	next "Most of the game<LNBRK>"
	db	 "has been redone<LNBRK>"
	db	 "since the last<LNBRK>"
	db	 "release, and I<LNBRK>"
	db	 "feel it is<LNBRK>"
	db	 "much better."
	db   "@"
	
DeveloperMessageString2:
	db   "This demo will<LNBRK>"
	db	 "probably be the<LNBRK>"
	db	 "last before the<LNBRK>"
	db	 "full release,<LNBRK>"
	db	 "but that's still<LNBRK>"
	db	 "quite a ways<LNBRK>"
	db	 "away!"
	
	next "Sorry for the<LNBRK>"
	db	 "wait, and thank<LNBRK>"
	db	 "you for your<LNBRK>"
	db	 "patience!"
	db   "@"
	
DeveloperMessageString3:
	db   "Remember that<LNBRK>"
	db	 "some moves and<LNBRK>"
	db	 "mechanics may be<LNBRK>"
	db	 "different than<LNBRK>"
	db	 "in other #MON<LNBRK>"
	db	 "games."
	
	next "You should pay<LNBRK>"
	db	 "attention to<LNBRK>"
	db	 "what NPCs say<LNBRK>"
	db	 "and avoid your<LNBRK>"
	db	 "emulator's<LNBRK>"
	db	 "speedup key!"
	db   "@"
	
DeveloperMessageString4:
	db	 "Thanks for<LNBRK>"
	db	 "playing #MON<LNBRK>"
	db	 "CORAL VERSION!"
	
	next "Have fun!"
	db   "@"
	
_DeveloperMessageNextPage:
	ld hl, DeveloperMessagePalette3
	ld de, wUnknBGPals + 2 palettes
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld hl, DeveloperMessageTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
	ld a, [wMoogooTurn]
	cp 2
	jr z, .page_2
	cp 3
	jr z, .page_3
	ld de, DeveloperMessageString4
	jr .cont
.page_2
	ld de, DeveloperMessageString2
	jr .cont
.page_3
	ld de, DeveloperMessageString3
.cont
	hlcoord 2, 2
	call PlaceString
	
	ld c, 2
	call DelayFrames
	
	ld hl, DeveloperMessagePalette2
	ld de, wUnknBGPals + 2 palettes
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	ld c, 15
	call FadePalettes
	
	ld c, 1
	call DelayFrames
	ld a, [wMoogooTurn]
	cp 4
	ret z
	jp _DeveloperMessageAnimatePageTurn2
	
	
_DeveloperMessageAnimate:
	.loop
	ld a, [wNumHits]
	cp 0
	jr z, .frame_1
	cp 1
	jr z, .frame_1
	cp 2
	jr z, .frame_1
	cp 3
	jr z, .frame_1
	cp 4
;	jr z, .frame_1
;	cp 5
;	jr z, .frame_1
;	cp 6
	jr z, .frame_2
	cp 9
	jr z, .frame_2
.frame_3
	ld hl, DevMessage_OAM3
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	jr .cont
.frame_1
	ld hl, DevMessage_OAM1
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	jr .cont
.frame_2
	ld hl, DevMessage_OAM2
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
.cont
	ld a, [wPlaceBallsY]
	inc a
	ld [wPlaceBallsY], a
	cp $ff
	ret nz
	ld a, [wPlaceBallsX]
	inc a
	ld [wPlaceBallsX], a
	cp 2
	ret nz
	xor a
	ld [wPlaceBallsX], a
	ld a, [wNumHits]
	inc a
	ld [wNumHits], a
	cp 10
	ret nz
	xor a
	ld [wNumHits], a
	ret
	
_DeveloperMessageAnimatePageTurn1:
	xor a
	ld [wPlaceBallsY], a
	ld [wPlaceBallsX], a
	ld a, 9
	ld [wNumHits], a
	ld hl, DevMessage_OAM5
	ld de, wSprites + 16
	ld bc, 64
	jp CopyBytes
	
_DeveloperMessageAnimatePageTurn2:
	xor a
	ld [wPlaceBallsY], a
	ld [wPlaceBallsX], a
	ld a, 9
	ld [wNumHits], a
	ld hl, DevMessage_OAM2
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM6
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM8
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM12
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 24
	call DelayFrames
	
	ld hl, DevMessage_OAM8
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM6
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM5
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 4
	jp DelayFrames
	
_DeveloperMessageAnimateEnding:
	xor a
	ld [wPlaceBallsY], a
	ld [wPlaceBallsX], a
	ld [wNumHits], a
	ld hl, DevMessage_OAM2
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	
	ld c, 2
	call DelayFrames
	ld hl, DevMessage_OAM6
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM8
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 1
	call DelayFrames
	
	ld de, MUSIC_DEV_MESSAGE_END
	call PlayMusic
	ld hl, DevMessage_OAM9
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 1
	call DelayFrames
	
	ld hl, DevMessage_OAM10
	ld de, wSprites + 16
	ld bc, 64
	call CopyBytes
	ld c, 2
	call DelayFrames
	
	ld hl, DevMessage_OAM11
	ld de, wSprites + 16
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
	
;DevMessage_OAM4:
;y pos, x pos, tile, palette
;	dsprite  15,  0, 15,  4, $0c, $0
;	dsprite  15,  0, 16,  4, $0d, $0
;	dsprite  15,  0, 17,  4, $0e, $0
;	dsprite  15,  0, 18,  4, $0f, $0
;	dsprite  16,  0, 15,  4, $1c, $0
;	dsprite  16,  0, 16,  4, $1d, $0
;	dsprite  16,  0, 17,  4, $1e, $0
;	dsprite  16,  0, 18,  4, $1f, $0
;	dsprite  17,  0, 15,  4, $2c, $0
;	dsprite  17,  0, 16,  4, $2d, $0
;	dsprite  17,  0, 17,  4, $2e, $0
;	dsprite  17,  0, 18,  4, $2f, $0
;	dsprite  18,  0, 15,  4, $3c, $0
;	dsprite  18,  0, 16,  4, $3d, $0
;	dsprite  18,  0, 17,  4, $3e, $0
;	dsprite  18,  0, 18,  4, $3f, $0
	
DevMessage_OAM5:
;y pos, x pos, tile, palette
	dsprite  15,  0, 15,  4, $40, $0
	dsprite  15,  0, 16,  4, $41, $0
	dsprite  15,  0, 17,  4, $42, $0
	dsprite  15,  0, 18,  4, $43, $0
	dsprite  16,  0, 15,  4, $50, $0
	dsprite  16,  0, 16,  4, $51, $0
	dsprite  16,  0, 17,  4, $52, $0
	dsprite  16,  0, 18,  4, $53, $0
	dsprite  17,  0, 15,  4, $60, $0
	dsprite  17,  0, 16,  4, $61, $0
	dsprite  17,  0, 17,  4, $62, $0
	dsprite  17,  0, 18,  4, $63, $0
	dsprite  18,  0, 15,  4, $70, $0
	dsprite  18,  0, 16,  4, $71, $0
	dsprite  18,  0, 17,  4, $72, $0
	dsprite  18,  0, 18,  4, $73, $0
	
DevMessage_OAM6:
;y pos, x pos, tile, palette
	dsprite  15,  0, 15,  4, $44, $0
	dsprite  15,  0, 16,  4, $45, $0
	dsprite  15,  0, 17,  4, $46, $0
	dsprite  15,  0, 18,  4, $47, $0
	dsprite  16,  0, 15,  4, $54, $0
	dsprite  16,  0, 16,  4, $55, $0
	dsprite  16,  0, 17,  4, $56, $0
	dsprite  16,  0, 18,  4, $57, $0
	dsprite  17,  0, 15,  4, $64, $0
	dsprite  17,  0, 16,  4, $65, $0
	dsprite  17,  0, 17,  4, $66, $0
	dsprite  17,  0, 18,  4, $67, $0
	dsprite  18,  0, 15,  4, $74, $0
	dsprite  18,  0, 16,  4, $75, $0
	dsprite  18,  0, 17,  4, $76, $0
	dsprite  18,  0, 18,  4, $77, $0
	
;DevMessage_OAM7:
;y pos, x pos, tile, palette
;	dsprite  13,  0, 15,  4, $40, $0
;	dsprite  13,  0, 16,  4, $41, $0
;	dsprite  13,  0, 17,  4, $42, $0
;	dsprite  13,  0, 18,  4, $43, $0
;	dsprite  14,  0, 15,  4, $50, $0
;	dsprite  14,  0, 16,  4, $51, $0
;	dsprite  14,  0, 17,  4, $52, $0
;	dsprite  14,  0, 18,  4, $53, $0
;	dsprite  15,  0, 15,  4, $60, $0
;	dsprite  15,  0, 16,  4, $61, $0
;	dsprite  15,  0, 17,  4, $62, $0
;	dsprite  15,  0, 18,  4, $63, $0
;	dsprite  16,  0, 15,  4, $70, $0
;	dsprite  16,  0, 16,  4, $71, $0
;	dsprite  16,  0, 17,  4, $72, $0
;	dsprite  16,  0, 18,  4, $73, $0
	
DevMessage_OAM8:
;y pos, x pos, tile, palette
	dsprite  14,  4, 15,  4, $44, $0
	dsprite  14,  4, 16,  4, $45, $0
	dsprite  14,  4, 17,  4, $46, $0
	dsprite  14,  4, 18,  4, $47, $0
	dsprite  15,  4, 15,  4, $54, $0
	dsprite  15,  4, 16,  4, $55, $0
	dsprite  15,  4, 17,  4, $56, $0
	dsprite  15,  4, 18,  4, $57, $0
	dsprite  16,  4, 15,  4, $64, $0
	dsprite  16,  4, 16,  4, $65, $0
	dsprite  16,  4, 17,  4, $66, $0
	dsprite  16,  4, 18,  4, $67, $0
	dsprite  17,  4, 15,  4, $74, $0
	dsprite  17,  4, 16,  4, $75, $0
	dsprite  17,  4, 17,  4, $76, $0
	dsprite  17,  4, 18,  4, $77, $0

DevMessage_OAM9:
;y pos, x pos, tile, palette
	dsprite  14,  0, 15,  4, $44, $0
	dsprite  14,  0, 16,  4, $45, $0
	dsprite  14,  0, 17,  4, $46, $0
	dsprite  14,  0, 18,  4, $47, $0
	dsprite  15,  0, 15,  4, $54, $0
	dsprite  15,  0, 16,  4, $55, $0
	dsprite  15,  0, 17,  4, $56, $0
	dsprite  15,  0, 18,  4, $57, $0
	dsprite  16,  0, 15,  4, $64, $0
	dsprite  16,  0, 16,  4, $65, $0
	dsprite  16,  0, 17,  4, $66, $0
	dsprite  16,  0, 18,  4, $67, $0
	dsprite  17,  0, 15,  4, $74, $0
	dsprite  17,  0, 16,  4, $75, $0
	dsprite  17,  0, 17,  4, $76, $0
	dsprite  17,  0, 18,  4, $77, $0

DevMessage_OAM10:
;y pos, x pos, tile, palette
	dsprite  13,  4, 15,  4, $44, $0
	dsprite  13,  4, 16,  4, $45, $0
	dsprite  13,  4, 17,  4, $46, $0
	dsprite  13,  4, 18,  4, $47, $0
	dsprite  14,  4, 15,  4, $54, $0
	dsprite  14,  4, 16,  4, $55, $0
	dsprite  14,  4, 17,  4, $56, $0
	dsprite  14,  4, 18,  4, $57, $0
	dsprite  15,  4, 15,  4, $64, $0
	dsprite  15,  4, 16,  4, $65, $0
	dsprite  15,  4, 17,  4, $66, $0
	dsprite  15,  4, 18,  4, $67, $0
	dsprite  16,  4, 15,  4, $74, $0
	dsprite  16,  4, 16,  4, $75, $0
	dsprite  16,  4, 17,  4, $76, $0
	dsprite  16,  4, 18,  4, $77, $0
	
DevMessage_OAM11:
;y pos, x pos, tile, palette
	dsprite  13,  0, 15,  4, $0c, $0
	dsprite  13,  0, 16,  4, $0d, $0
	dsprite  13,  0, 17,  4, $0e, $0
	dsprite  13,  0, 18,  4, $0f, $0
	dsprite  14,  0, 15,  4, $1c, $0
	dsprite  14,  0, 16,  4, $1d, $0
	dsprite  14,  0, 17,  4, $1e, $0
	dsprite  14,  0, 18,  4, $1f, $0
	dsprite  15,  0, 15,  4, $2c, $0
	dsprite  15,  0, 16,  4, $2d, $0
	dsprite  15,  0, 17,  4, $2e, $0
	dsprite  15,  0, 18,  4, $2f, $0
	dsprite  16,  0, 15,  4, $3c, $0
	dsprite  16,  0, 16,  4, $3d, $0
	dsprite  16,  0, 17,  4, $3e, $0
	dsprite  16,  0, 18,  4, $3f, $0
	
DevMessage_OAM12:
;y pos, x pos, tile, palette
	dsprite  14,  4, 15,  4, $0c, $0
	dsprite  14,  4, 16,  4, $0d, $0
	dsprite  14,  4, 17,  4, $0e, $0
	dsprite  14,  4, 18,  4, $0f, $0
	dsprite  15,  4, 15,  4, $1c, $0
	dsprite  15,  4, 16,  4, $1d, $0
	dsprite  15,  4, 17,  4, $1e, $0
	dsprite  15,  4, 18,  4, $1f, $0
	dsprite  16,  4, 15,  4, $2c, $0
	dsprite  16,  4, 16,  4, $2d, $0
	dsprite  16,  4, 17,  4, $2e, $0
	dsprite  16,  4, 18,  4, $2f, $0
	dsprite  17,  4, 15,  4, $3c, $0
	dsprite  17,  4, 16,  4, $3d, $0
	dsprite  17,  4, 17,  4, $3e, $0
	dsprite  17,  4, 18,  4, $3f, $0

DevMessage_BallOAM:
;y pos, x pos, tile, palette
	dsprite  2,  4, 1,  4, $48, $1
	dsprite  2,  4, 19, 4, $48, $2
	dsprite  18, 4, 1,  4, $48, $3
	dsprite  18, 4, 19, 4, $48, $4
	
DeveloperMessageGFX:
INCBIN "gfx/diploma/devmessage.2bpp.lz"

DeveloperMessageCorsolaGFX:
INCBIN "gfx/diploma/corsola.2bpp.lz"

DeveloperMessageBallGFX:
INCBIN "gfx/diploma/ball.2bpp.lz"

DeveloperMessageTilemap:
INCBIN "gfx/diploma/devmessage.tilemap"

DeveloperMessageAttrmap:
INCBIN "gfx/diploma/devmessage.attrmap"

DeveloperMessagePalette:
	RGB 31, 27, 19
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
	RGB 31, 29, 23
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
DeveloperMessagePalette2:
	RGB 31, 27, 19
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
	RGB 31, 29, 23
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
	RGB 31, 31, 31
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 22, 13, 04
	
DeveloperMessagePalette3:
	RGB 31, 27, 19
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 31, 27, 19

	RGB 31, 29, 23
	RGB 29, 20, 11
	RGB 27, 17, 07
	RGB 31, 29, 23
	
DeveloperMessageOBPalette:
	RGB 31, 31, 00
	RGB 31, 31, 31
	RGB 31, 16, 23
	RGB 17, 00, 12
	
	RGB 31, 31, 00
	RGB 31, 31, 31
	RGB 12, 18, 30
	RGB 00, 08, 12
	
	RGB 31, 31, 00
	RGB 31, 31, 31
	RGB 12, 18, 30
	RGB 00, 08, 12
	
	RGB 31, 31, 00
	RGB 31, 31, 31
	RGB 12, 18, 30
	RGB 00, 08, 12
	
	RGB 31, 31, 00
	RGB 31, 31, 31
	RGB 12, 18, 30
	RGB 00, 08, 12