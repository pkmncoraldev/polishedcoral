
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