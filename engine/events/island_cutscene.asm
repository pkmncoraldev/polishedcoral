DEF ISLAND_CUTSCENE_PART_2_SPRITES EQU 20
DEF ISLAND_CUTSCENE_PART_2_COVER_SPRITES EQU 11

FlyToIslandCutscene::
	ld hl, rIE
	set LCD_STAT, [hl]
	ldh a, [hSCX]
	push af
	ldh a, [hSCY]
	push af
	
	call ClearBGPalettes
	call ClearSprites
	call DisableLCD
	farcall ClearSpriteAnims
	
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	ld hl, SkyTilemap
	farcall LoadTourneyBracketTilemap
	ld hl, BigPlaneTilemap
	farcall LoadTourneyBracketTilemap2
	
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, IslandCutscenePart2BGPals
	ld de, wUnknBGPals
	ld bc, 3 palettes
	rst CopyBytes
	ld hl, IslandCutscenePart2OBPals
	ld de, wUnknOBPals
	ld bc, 3 palettes
	rst CopyBytes
	farcall IslandCutsceneGetPlayerPal
	pop af
	ldh [rSVBK], a
	
	pop af
	ldh [rVBK], a
	call EnableLCD
	ld de, MUSIC_NONE
	call PlayMusic
	lb bc, BANK(IslandCutscenePart2GFX), $74
	ld hl, IslandCutscenePart2GFX
	ld de, VTiles2 tile $00
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutscenePart2GFX2), 32
	ld hl, IslandCutscenePart2GFX2
	ld de, VTiles0 tile $00
	call DecompressRequest2bpp
	
	ld a, [wPlayerGender]
	cp 0
	jr z, .got_gender
	lb bc, BANK(IslandCutscenePart2CoraGFX), 4
	ld hl, IslandCutscenePart2CoraGFX
	ld de, VTiles0 tile $02
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutscenePart2CoraGFX2), 4
	ld hl, IslandCutscenePart2CoraGFX2
	ld de, VTiles0 tile $12
	call DecompressRequest2bpp
	
.got_gender
	xor a
	ldh [hBGMapMode], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld [wTitleScreenTimerHi], a
	ld [wTitleScreenTimerLo], a
	ld [wJumptableIndex], a
	ld [wIslandPlaneY], a
	ld [wIslandPlaneX], a
	ld [wMagnetTrainDirection], a
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	call ByteFill
	ld hl, wLYOverridesBackup
	ld bc, wLYOverridesBackupEnd - wLYOverridesBackup
	call ByteFill
	ld a, 180
	ldh [hWX], a
	ld a, 129
	ldh [hWY], a
	ld a, $43
	ldh [hLCDCPointer], a
	ld hl, IslandCutscenePart2_Cover_OAM
	ld de, wSprites + 116
	ld bc, ISLAND_CUTSCENE_PART_2_COVER_SPRITES * 4
	call CopyBytes
	ld c, 1
	call FadePalettes
;done loading graphics
	ldh a, [hVBlank]
	push af
	ld a, $3
	ldh [hVBlank], a
	ld de, MUSIC_CYCLING
	call PlayMusic
	
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IslandCutscenePart2_Jumptable
	call IslandCutscenePart2_AnimateSprites
	call IslandCutscenePart2_UpdateLYOverrides
	call PushLYOverrides
	call DelayFrame
	jr .loop
	
.done
	pop af
	ldh [hVBlank], a
	call ClearBGPalettes
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCX], a
	call ClearTileMap

	pop af
	ldh [hSCY], a
	pop af
	ldh [hSCX], a
	ld hl, rIE
	res LCD_STAT, [hl]
	xor a
	ldh [hBGMapMode], a
	ret

IslandCutscenePart2_Jumptable:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .Init
	dw .Part1
	dw .Part2
	dw .Part3
	dw .Part4
	dw .Part5
	dw .Part6
	dw .Part7
	dw .Part8
	dw .End
	
.Init
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ld hl, IslandCutscenePart2_Characters_OAM1
	ld de, wSprites
	ld bc, ISLAND_CUTSCENE_PART_2_SPRITES * 4
	call CopyBytes
.next:
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.Part1
	
	ld a, [wMagnetTrainDirection]
	cp 50
	jr z, .next
	call IslandCutscenePart2_ScrollCloudsFast
	ret
	
.Part2
	ld a, [wMagnetTrainDirection]
	cp 141
	jr z, .next
	call IslandCutscenePart2_ScrollCloudsFast
	call IslandCutscenePart2ScrollSpritesX
	ldh a, [hWX]
	dec a
	ldh [hWX], a
	and 1
	ret z
	call IslandCutscenePart2ScrollSpritesY
	ldh a, [hWY]
	dec a
	ldh [hWY], a
	ret
	
.Part3
	ld a, 100
	ld [wTitleScreenTimerHi], a
	call IslandCutscenePart2ClearSprites
	ld a, [wMagnetTrainDirection]
	cp 9
	jr z, .next
	call IslandCutscenePart2_ScrollClouds
	ld a, [wMagnetTrainDirection]
	and 1
	jr z, .Part3_skip
	call IslandCutscenePart2ScrollSpritesX
	ldh a, [hWX]
	dec a
	ldh [hWX], a
.Part3_skip
	ld a, [wMagnetTrainDirection]
	push af
	cp 3
	call z, .Part3_scroll
	pop af
	cp 7
	jr z, .Part3_scroll
	ret
	
.Part3_scroll
	call IslandCutscenePart2ScrollSpritesY
	ldh a, [hWY]
	dec a
	ldh [hWY], a
	ret
	
.Part4
	ld a, [wMagnetTrainDirection]
	cp 128
	jr z, .next
	call IslandCutscenePart2_ScrollClouds
	and 63
	cp 0
	ret nz
	call IslandCutscenePart2ScrollSpritesX
	ldh a, [hWX]
	dec a
	ldh [hWX], a
	call IslandCutscenePart2ScrollSpritesYDown
	ldh a, [hWY]
	inc a
	ldh [hWY], a
	ret
	
.Part5
	ld a, [wMagnetTrainDirection]
	cp 128
	jp z, .next
	ld a, 32
	ld [wIntroSceneFrameCounter], a
	call IslandCutscenePart2_ScrollClouds
	and 63
	cp 0
	ret nz
	call IslandCutscenePart2ScrollSpritesX
	ldh a, [hWX]
	dec a
	ldh [hWX], a
	call IslandCutscenePart2ScrollSpritesY
	ldh a, [hWY]
	dec a
	ldh [hWY], a
	ret
	
.Part6
	ld a, [wIntroSceneFrameCounter]
	cp 0
	jr z, .Part6_next
	ld b, a
	call IslandCutscenePart2_ScrollClouds
	ld a, [wMagnetTrainDirection]
	cp b
	jr z, .Part6_scroll
	ret
.Part6_scroll
	call IslandCutscenePart2ScrollSpritesX
	ldh a, [hWX]
	dec a
	ldh [hWX], a
	srl b
	ld a, b
	ld [wIntroSceneFrameCounter], a
	xor a
	ld [wMagnetTrainDirection], a
	ret
.Part6_next
	call IslandCutscenePart2ScrollSpritesX
	ldh a, [hWX]
	dec a
	ldh [hWX], a
	jp .next
	
.Part7
;	call DelayFrame
;	jr .Part7
	call IslandCutscenePart2_ScrollCloudsFast
	ldh a, [hWX]
	dec a
	dec a
	cp 5
	jr z, .Part7_next
	ldh [hWX], a
	call IslandCutscenePart2ScrollSpritesX
	call IslandCutscenePart2ScrollSpritesX
	ret
.Part7_next
	ld a, 169
	ld [wTitleScreenTimerHi], a
	ld a, $fe
	ldh [hWX], a
	call IslandCutscenePart2ScrollSpritesX
	jp .next
	
.Part8
	ld a, [wMagnetTrainDirection]
	cp 46
	jp z, .next
	call IslandCutscenePart2_ScrollCloudsFast
	call IslandCutscenePart2ScrollSpritesX
	call IslandCutscenePart2ScrollSpritesX
	ld a, [wTitleScreenTimerHi]
	inc a
	inc a
	ld [wTitleScreenTimerHi], a
	ret
	
.End
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
	
IslandCutscenePart2_UpdateLYOverrides:
	ld hl, wLYOverridesBackup
	ld c, 48
	ld a, [wTitleScreenTimerLo]
	add a
	call .loadloop
	ld hl, wLYOverridesBackup + 48
	ld c, 96
	ld a, [wTitleScreenTimerHi]

.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret
	
IslandCutscenePart2_ScrollClouds:
	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	ret
	
IslandCutscenePart2_ScrollCloudsFast:
	ld a, [wTitleScreenTimerLo]
	dec a
	dec a
	ld [wTitleScreenTimerLo], a
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	ret		
	
IslandCutscenePart2ClearSprites:
	ld hl, wSprites+ 116
	ld b, wSpritesEnd - (wSprites + 116)
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
	
IslandCutscenePart2ScrollSpritesY:
	ld hl, wIslandPlaneY
	ld a, [hl]
	dec a
	ld [hl], a
	ret
	
IslandCutscenePart2ScrollSpritesYDown:
	ld hl, wIslandPlaneY
	ld a, [hl]
	inc a
	ld [hl], a
	ret
	
IslandCutscenePart2ScrollSpritesX:
	ld hl, wIslandPlaneX
	ld a, [hl]
	dec a
	ld [hl], a
	ret
	
IslandCutscenePart2_AnimateSprites:
	ld hl, wCurForm
	ld a, [hl]
	inc a
	ld [hl], a
	and 7
	cp 4
	jr c, .reset
	ld hl, IslandCutscenePart2_Characters_OAM1
	ld de, wSprites
	ld bc, ISLAND_CUTSCENE_PART_2_SPRITES * 4
	call CopyBytes
	jr .scroll
.reset
	ld hl, IslandCutscenePart2_Characters_OAM2
	ld de, wSprites
	ld bc, ISLAND_CUTSCENE_PART_2_SPRITES * 4
	call CopyBytes
.scroll
	ld hl, wSprites
	ld c, ISLAND_CUTSCENE_PART_2_SPRITES
	ld a, [wIslandPlaneY]
	ld b, a
	ld a, [wIslandPlaneX]
	ld d, a
.loop
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

IslandCutscenePart2_Cover_OAM:
	dsprite 11, 0, 1, 0, $1f, $0
	dsprite 12, 0, 1, 0, $1f, $0
	dsprite 13, 0, 1, 0, $1f, $0
	dsprite 14, 0, 1, 0, $1f, $0
	dsprite 11, 0, 2, 0, $1f, $0
	dsprite 12, 0, 2, 0, $1f, $0
	dsprite 13, 0, 2, 0, $1f, $0
	dsprite 14, 0, 2, 0, $1f, $0
	dsprite 11, 0, 3, 0, $1f, $0
	dsprite 12, 0, 3, 0, $1f, $0
	dsprite 13, 0, 3, 0, $1f, $0

IslandCutscenePart2_Characters_OAM1:
;wendy
	dsprite 20, 2, 26, 5, $00, $2
	dsprite 20, 2, 27, 5, $01, $2
	dsprite 21, 2, 26, 5, $10, $2
	dsprite 21, 2, 27, 5, $11, $2
;player
	dsprite 20, 2, 28, 6, $02, $5
	dsprite 20, 2, 29, 6, $03, $5
	dsprite 21, 2, 28, 6, $12, $5
	dsprite 21, 2, 29, 6, $13, $5
;propeller
	dsprite 20, 0, 21, 9, $07, $1
	dsprite 20, 0, 22, 9, $08, $1
	dsprite 21, 0, 21, 9, $17, $1
	dsprite 21, 0, 22, 9, $18, $1
	dsprite 22, 0, 21, 9, $09, $1
	dsprite 22, 0, 22, 9, $0a, $1
	dsprite 23, 0, 21, 9, $19, $1
	dsprite 23, 0, 22, 9, $1a, $1
	dsprite 24, 0, 21, 8, $18, $1 | X_FLIP | Y_FLIP
	dsprite 24, 0, 22, 8, $17, $1 | X_FLIP | Y_FLIP
	dsprite 25, 0, 21, 8, $08, $1 | X_FLIP | Y_FLIP
	dsprite 25, 0, 22, 8, $07, $1 | X_FLIP | Y_FLIP
	
IslandCutscenePart2_Characters_OAM2:
;wendy
	dsprite 20, 2, 26, 5, $00, $2
	dsprite 20, 2, 27, 5, $01, $2
	dsprite 21, 2, 26, 5, $10, $2
	dsprite 21, 2, 27, 5, $0f, $2
;player
	dsprite 20, 2, 28, 6, $04, $5
	dsprite 20, 2, 29, 6, $05, $5
	dsprite 21, 2, 28, 6, $14, $5
	dsprite 21, 2, 29, 6, $15, $5
;propeller
	dsprite 20, 0, 21, 9, $0b, $1
	dsprite 20, 0, 22, 9, $0c, $1
	dsprite 21, 0, 21, 9, $1b, $1
	dsprite 21, 0, 22, 9, $1c, $1
	dsprite 22, 0, 21, 9, $0d, $1
	dsprite 22, 0, 22, 9, $0e, $1
	dsprite 23, 0, 21, 9, $1d, $1
	dsprite 23, 0, 22, 9, $1e, $1
	dsprite 24, 0, 21, 8, $1c, $1 | X_FLIP | Y_FLIP
	dsprite 24, 0, 22, 8, $1b, $1 | X_FLIP | Y_FLIP
	dsprite 25, 0, 21, 8, $0c, $1 | X_FLIP | Y_FLIP
	dsprite 25, 0, 22, 8, $0b, $1 | X_FLIP | Y_FLIP


























	
	
FlyToIslandCutscenePart3::
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
	dsprite 9, 3, 9, 6, $00, $0
	dsprite 9, 3, 10, 6, $01, $0
	
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
	
IslandCutscenePart2GFX:
INCBIN "gfx/island_cutscene/big_plane.2bpp.lz"

IslandCutscenePart2GFX2:
INCBIN "gfx/island_cutscene/wendy.2bpp.lz"

IslandCutscenePart2CoraGFX:
INCBIN "gfx/island_cutscene/cora.2bpp.lz"

IslandCutscenePart2CoraGFX2:
INCBIN "gfx/island_cutscene/cora2.2bpp.lz"

BigPlaneTilemap:
INCBIN "gfx/island_cutscene/big_plane.tilemap"

SkyTilemap:
INCBIN "gfx/island_cutscene/sky.tilemap"
	
IslandCutsceneGFX:
INCBIN "gfx/island_cutscene/island.2bpp.lz"

IslandCutsceneGFX2:
INCBIN "gfx/island_cutscene/plane.2bpp.lz"
	
IslandCutsceneTilemap:
INCBIN "gfx/island_cutscene/island.tilemap"

IslandCutsceneAttrmap:
INCBIN "gfx/island_cutscene/island.attrmap"

IslandCutscenePart2BGPals:
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 00, 20, 29
	RGB 07, 07, 07

	RGB 21, 21, 21
	RGB 00, 20, 29
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07
	
IslandCutscenePart2OBPals:
	RGB 00, 20, 29
	RGB 00, 20, 29
	RGB 00, 20, 29
	RGB 00, 20, 29
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 07, 07, 07
	
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 15, 10, 03
	RGB 00, 00, 00

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
