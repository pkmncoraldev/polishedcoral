FlyToIslandCutscene::
	call FadeToMenu
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	
	ld hl, IslandCutsceneTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
	ld hl, IslandCutsceneAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	call ApplyAttrAndTilemapInVBlank
	
	ld de, MUSIC_NONE
	call PlayMusic
	lb bc, BANK(IslandCutsceneGFX), $74
	ld hl, IslandCutsceneGFX
	ld de, VTiles2 tile $00
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutsceneGFX), 36
	ld hl, IslandCutsceneGFX2
	ld de, VTiles0 tile $00
	call DecompressRequest2bpp
	
	ld hl, IslandCutscene_City_OAM
	ld de, wSprites
	ld bc, 8
	call CopyBytes
	
	ld hl, IslandCutscene_Plane_OAM
	ld de, wSprites + 8
	ld bc, 128
	call CopyBytes
	
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, IslandCutscenePals
	ld de, wUnknBGPals
	ld bc, 11 palettes
	rst CopyBytes
	
	pop af
	ldh [rSVBK], a
	farcall FadeInPalettes
	call WaitPressAorB_BlinkCursor
	ret
	
IslandCutscene_City_OAM:
	dsprite 9, 0, 10, 0, $00, $0
	dsprite 9, 0, 11, 0, $01, $0
	
IslandCutscene_Plane_OAM:
	dsprite 2, 0, 11, 0, $07, $1
	dsprite 2, 0, 12, 0, $08, $1
	dsprite 2, 0, 13, 0, $09, $1
	dsprite 2, 0, 14, 0, $0a, $1
	dsprite 2, 0, 15, 0, $0b, $1
	dsprite 3, 0, 10, 0, $0c, $1
	dsprite 3, 0, 11, 0, $0d, $1
	dsprite 3, 0, 12, 0, $0e, $1
	dsprite 3, 0, 13, 0, $0f, $1
	dsprite 3, 0, 14, 0, $10, $1
	dsprite 3, 0, 15, 0, $11, $1
	dsprite 4, 0, 10, 2, $12, $1
	dsprite 4, 0, 11, 2, $13, $1
	dsprite 4, 0, 12, 2, $14, $1
	dsprite 4, 0, 13, 2, $15, $1
	dsprite 4, 0, 14, 2, $16, $1
	dsprite 4, 0, 15, 2, $17, $1
	dsprite 5, 0, 10, 2, $18, $1
	dsprite 5, 0, 11, 2, $19, $1
	dsprite 5, 0, 12, 2, $1a, $1
	dsprite 5, 0, 13, 2, $1b, $1
	dsprite 5, 0, 14, 2, $1c, $1
	dsprite 5, 0, 15, 2, $1d, $1
	
	dsprite 3, 3, 10, 0, $06, $2
	dsprite 3, 0, 11, 0, $02, $2
	dsprite 2, 6, 12, 0, $03, $2
	dsprite 2, 3, 13, 0, $04, $2
	dsprite 1, 5, 14, 0, $05, $2
	
	dsprite 4, 0, 13, 3, $1e, $2
	dsprite 4, 0, 14, 3, $1f, $2
	dsprite 4, 0, 15, 3, $20, $2
	dsprite 5, 0, 13, 3, $21, $2
	
IslandCutsceneGFX:
INCBIN "gfx/island_cutscene/island.2bpp.lz"

IslandCutsceneGFX2:
INCBIN "gfx/island_cutscene/plane.2bpp.lz"
	
IslandCutsceneTilemap:
INCBIN "gfx/island_cutscene/island.tilemap"

IslandCutsceneAttrmap:
INCBIN "gfx/island_cutscene/island.attrmap"

IslandCutscenePals:
	RGB 24, 30, 12
	RGB 11, 26, 29
	RGB 08, 26, 07
	RGB 09, 09, 31

	RGB 24, 30, 12
	RGB 11, 26, 29
	RGB 08, 26, 07
	RGB 03, 21, 02

	RGB 24, 30, 12
	RGB 08, 26, 07
	RGB 03, 21, 02
	RGB 09, 09, 31

	RGB 03, 21, 02
	RGB 16, 11, 07
	RGB 09, 09, 31
	RGB 10, 07, 04

	RGB 21, 15, 11
	RGB 03, 21, 02
	RGB 16, 11, 07
	RGB 10, 07, 04

	RGB 21, 15, 11
	RGB 16, 11, 07
	RGB 09, 09, 31
	RGB 10, 07, 04
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 20, 23, 22
	RGB 19, 18, 20
	RGB 12, 14, 13
	
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
