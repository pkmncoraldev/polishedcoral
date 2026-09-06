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
	lb bc, BANK(IslandCutsceneGFX), $2
	ld hl, IslandCutsceneGFX2
	ld de, VTiles0 tile $00
	call DecompressRequest2bpp
	
	ld hl, IslandCutscene_City_OAM
	ld de, wSprites
	ld bc, 8
	call CopyBytes
	
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, IslandCutscenePals
	ld de, wUnknBGPals
	ld bc, 9 palettes
	rst CopyBytes
	
	pop af
	ldh [rSVBK], a
	farcall FadeInPalettes
	call WaitPressAorB_BlinkCursor
	ret
	
IslandCutscene_City_OAM:
	dsprite 9, 4, 10, 0, $00, $0
	dsprite 9, 4, 11, 0, $01, $0
	
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
