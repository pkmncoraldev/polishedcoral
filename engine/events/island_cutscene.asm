DEF ISLAND_CUTSCENE_PART_1_SPRITES EQU 37
DEF ISLAND_CUTSCENE_PART_1_SHADOW_SPRITES EQU 3
DEF ISLAND_CUTSCENE_PART_1_PLANE_SPRITES EQU 35
DEF ISLAND_CUTSCENE_PART_2_SPRITES EQU 20
DEF ISLAND_CUTSCENE_PART_2_COVER_SPRITES EQU 11

FlyToIslandCutscene::
	call FlyToIslandCutscenePart1
	call FlyToIslandCutscenePart2
	call FlyToIslandCutscenePart3
	ret
	
FlyToIslandCutscenePart1:
	ld hl, rIE
	set LCD_STAT, [hl]
;	ldh a, [hSCX]
;	push af
;	ldh a, [hSCY]
;	push af
	
	call ClearBGPalettes
	call ClearSprites
	call DisableLCD
	farcall ClearSpriteAnims
	
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	ld [wIntroSceneFrameCounter], a
	ld [wJumptableIndex], a
	ld hl, SkyTilemap
	call LoadIslandCutsceneTilemap
	ld hl, BigPlaneTilemap
	call LoadIslandCutsceneTilemap2
	
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, IslandCutscenePart12BGPals
	ld de, wUnknBGPals
	ld bc, 5 palettes
	rst CopyBytes
	ld hl, IslandCutscenePart2OBPals
	ld de, wUnknOBPals
	ld bc, 5 palettes
	rst CopyBytes
	farcall IslandCutsceneGetPlayerPal
	pop af
	ldh [rSVBK], a
	
	pop af
	ldh [rVBK], a
	call EnableLCD
	xor a
	ldh [hBGMapMode], a
	ld de, MUSIC_NONE
	call PlayMusic
	lb bc, BANK(IslandCutscenePart2GFX), $74
	ld hl, IslandCutscenePart2GFX
	ld de, VTiles2 tile $00
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutscenePart2GFX3), $30
	ld hl, IslandCutscenePart2GFX3
	ld de, VTiles2 tile $50
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutscenePart2GFX2), 32
	ld hl, IslandCutscenePart2GFX2
	ld de, VTiles0 tile $00
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutscenePart2CloudSpritesGFX), 8
	ld hl, IslandCutscenePart2CloudSpritesGFX
	ld de, VTiles0 tile $20
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutscenePart1GFX), 48
	ld hl, IslandCutscenePart1GFX
	ld de, VTiles0 tile $40
	call DecompressRequest2bpp
	
	ld a, 112
	ldh [hSCY], a
	
	ld hl, IslandCutscenePart1_Plane_OAM
	ld de, wSprites
	ld bc, ISLAND_CUTSCENE_PART_1_SPRITES * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 1
	call FadePalettes
	
	ld a, 15
	ld [wTitleScreenTimerLo], a
	ld [wTitleScreenTimerHi], a
	
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IslandCutscenePart1_Jumptable
	call DelayFrame
	jr .loop
	
.done
	call ClearBGPalettes
	ret
	
IslandCutscenePart1_Jumptable:
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
	dw .Start
	dw .Part1
	dw .Part2
	dw .Part3
	dw .Part4
	dw .Part5
	dw .Part6
	dw .Part7
	dw .End
	
.Init
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	cp 75
	jr z, .next
	ret
	
.Start
	ld de, MUSIC_CYCLING
	call PlayMusic
	call FlyToIslandCutscenePart1PlaneTakeoffY
	call DelayFrame
;fallthru
.next:
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.Part1
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	cp 50
	jr z, .next
	ld hl, IslandCutscenePart1_Plane_OAM
	ld de, wSprites
	ld bc, ISLAND_CUTSCENE_PART_1_SPRITES * 4	; # of sprites * 4
	call CopyBytes
	ret
.satrtmusic
	ld de, MUSIC_CYCLING
	call PlayMusic
	jr .next
	
.Part2
	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ldh a, [hSCX]
	dec a
	ldh [hSCX], a
	call FlyToIslandCutscenePart1AnimatePropeller1
	ld a, [wTitleScreenTimerHi]
	dec a
	ld [wTitleScreenTimerHi], a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	
	ld a, 6
	ld [wTitleScreenTimerLo], a
	ld [wTitleScreenTimerHi], a
	jr .next
	
.Part3
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	and 1
	jr nz, .Part3_skip
	call FlyToIslandCutscenePart1AnimatePropeller1
	
.Part3_skip
	ldh a, [hSCX]
	dec a
	ldh [hSCX], a
	
	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ldh a, [hSCX]
	dec a
	ldh [hSCX], a
	ld a, [wTitleScreenTimerHi]
	dec a
	ld [wTitleScreenTimerHi], a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ld a, 6
	ld [wTitleScreenTimerLo], a
	ld [wTitleScreenTimerHi], a
	jp .next
	
.Part4
	ldh a, [hSCX]
	sub 2
	ldh [hSCX], a
	call FlyToIslandCutscenePart1AnimatePropeller1
	
	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ldh a, [hSCX]
	dec a
	ldh [hSCX], a
	ld a, [wTitleScreenTimerHi]
	dec a
	ld [wTitleScreenTimerHi], a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ld a, 6
	ld [wTitleScreenTimerLo], a
	ld [wTitleScreenTimerHi], a
	
	ld hl, wSprites + 2
	ld a, $69
	ld [hli], a
	ld a, 1
	ld [hl], a
	
	ld hl, wSprites + 6
	ld a, $6f
	ld [hli], a
	ld a, 1
	ld [hl], a
	
	jp .next
	
.Part5
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	ldh a, [hSCX]
	sub 3
	ldh [hSCX], a
	call FlyToIslandCutscenePart1AnimatePropeller2
	
	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ldh a, [hSCX]
	dec a
	ldh [hSCX], a
	ld a, [wTitleScreenTimerHi]
	dec a
	ld [wTitleScreenTimerHi], a
	ld [wTitleScreenTimerLo], a
	and a
	ret nz
	ld a, 6
	ld [wTitleScreenTimerLo], a
	ld [wTitleScreenTimerHi], a
	jp .next
	
.Part6
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	cp 150
	jp z, .next
	ldh a, [hSCX]
	sub 5
	ldh [hSCX], a
	call FlyToIslandCutscenePart1AnimatePropeller2
	ret
	
.Part7
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	cp 125
	jp z, .next
	ldh a, [hSCX]
	sub 5
	ldh [hSCX], a
	call FlyToIslandCutscenePart1AnimatePropeller2
	call FlyToIslandCutscenePart1PlaneTakeoffX
	ld a, [wMagnetTrainDirection]
	and 1
	ret nz
	call FlyToIslandCutscenePart1PlaneTakeoffY
	call FlyToIslandCutscenePart1ClearShadow
	ret
	
.End
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
	
FlyToIslandCutscenePart1ClearShadow:
	ld hl, wSprites + 78
	ld a, $5f
	ld [hli], a
	ld hl, wSprites + (ISLAND_CUTSCENE_PART_1_PLANE_SPRITES * 4)
	ld c, ISLAND_CUTSCENE_PART_1_SHADOW_SPRITES
	
.loop
	xor a
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret
	
FlyToIslandCutscenePart1PlaneTakeoffX:
	ld hl, wSprites + 1
	ld c, ISLAND_CUTSCENE_PART_1_SPRITES
	jr FlyToIslandCutscenePart1PlaneTakeoff
FlyToIslandCutscenePart1PlaneTakeoffY:
	ld hl, wSprites
	ld c, ISLAND_CUTSCENE_PART_1_PLANE_SPRITES
;fallthru
FlyToIslandCutscenePart1PlaneTakeoff:
	ld a, [hl]
	dec a
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, FlyToIslandCutscenePart1PlaneTakeoff
	ret
	
FlyToIslandCutscenePart1AnimatePropeller1:
	ld a, [wIntroSceneFrameCounter]
	inc a
	ld [wIntroSceneFrameCounter], a
	ld hl, wSprites + 2
	ld c, 2
.loop
	ld a, [wIntroSceneFrameCounter]
	cp 4
	jr nz, .inc
	ld a, [hl]
	sub 3
	jr .cont
.inc
	ld a, [hl]
	inc a
.cont
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ld a, [wIntroSceneFrameCounter]
	cp 4
	ret nz
	xor a
	ld [wIntroSceneFrameCounter], a
	ret
	
FlyToIslandCutscenePart1AnimatePropeller2:
	ld a, [wMagnetTrainDirection]
	and 3
	ret nz
	ld hl, wSprites + 2
	ld c, 2
.loop
	ld a, [hl]
	cp $69
	jr z, .dec
	cp $6f
	jr z, .dec
;.inc
	inc a
	jr .cont
.dec
	dec a
.cont
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret
	
FlyToIslandCutscenePart2:
	ld hl, SkyPlaneTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
	ld hl, SkyPlaneAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	call ApplyAttrAndTilemapInVBlank
	
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, IslandCutscenePart2OBPals
	ld de, wUnknBGPals + 4 palettes
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	
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
	
	ld hl, IslandCutscenePart2_Clouds_OAM
	ld de, wSprites
	ld bc, 8 * 4
	call CopyBytes
	
;done loading graphics
	ldh a, [hVBlank]
	push af
	ld a, $3
	ldh [hVBlank], a
	
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
	ld [wIslandPlaneX], a
	ld [wIslandPlaneY], a
	ld [wJumptableIndex], a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCX], a
	ld hl, wLYOverrides
	ld bc, wLYOverridesEnd - wLYOverrides
	call ByteFill
	ld hl, wLYOverridesBackup
	ld bc, wLYOverridesBackupEnd - wLYOverridesBackup
	call ByteFill
	call ClearTileMap

;	pop af
;	ldh [hSCY], a
;	pop af
;	ldh [hSCX], a
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
	dw .Pal
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
	ld a, 112
	ld [wTitleScreenTimerHi], a
	ld hl, IslandCutscenePart2_Characters_OAM1
	ld de, wSprites + 32
	ld bc, ISLAND_CUTSCENE_PART_2_SPRITES * 4
	call CopyBytes
	call IslandCutscenePart2_ScrollCloudsFast
.next:
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.Pal
	ld c, 1
	call FadePalettes
	jr .next
	
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
	ld a, -20
	ld [wTitleScreenTimerHi], a
	call IslandCutscenePart2ClearSprites
	ld a, [wMagnetTrainDirection]
	cp 9
	jr z, .next
	call IslandCutscenePart2_ScrollCloudsFast
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
	call IslandCutscenePart2_ScrollCloudsFast
	ld a, [wMagnetTrainDirection]
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
	call IslandCutscenePart2_ScrollCloudsFast
	ld a, [wMagnetTrainDirection]
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
	call IslandCutscenePart2_ScrollCloudsFast
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
	ld a, 25
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
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	and 1
	jr nz, .skip

	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
.skip
	call ScrollSpriteClouds
	call ScrollSpriteClouds
	call RandomizeCloudY
	ret
	
IslandCutscenePart2_ScrollCloudsFast:
	ld a, [wTitleScreenTimerLo]
	dec a
	ld [wTitleScreenTimerLo], a
	ld a, [wMagnetTrainDirection]
	inc a
	ld [wMagnetTrainDirection], a
	call ScrollSpriteClouds
	call ScrollSpriteClouds
	call RandomizeCloudY
	ret
	
IslandCutscenePart2ClearSprites:
	ld hl, wSprites + 116
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
	ld de, wSprites + 32
	ld bc, ISLAND_CUTSCENE_PART_2_SPRITES * 4
	call CopyBytes
	jr .scroll
.reset
	ld hl, IslandCutscenePart2_Characters_OAM2
	ld de, wSprites + 32
	ld bc, ISLAND_CUTSCENE_PART_2_SPRITES * 4
	call CopyBytes
.scroll
	ld hl, wSprites + 32
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
	
ScrollSpriteClouds:
	ld hl, wSprites + 1
	ld c, 8
.loop
	ld a, [hl]
	inc a
	inc a
	inc a
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret
	
RandomizeCloudY:
	ld a, [wSprites + 1]
	cp $bd
	ret nc
	cp $b8
	ret c
	ld hl, wSprites
	ld c, 4

	ld a, 3
	call RandomRange
	cp 0
	jr z, .zero
	cp 1
	jr z, .one
;.two
	ld a, $75
	jr .loop
.one
	ld a, $94
	jr .loop
.zero
	ld a, $44
.loop
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ld c, 4
	add 8
.loop2
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop2
	xor a
	ret
	
LoadIslandCutsceneTilemap:
	debgcoord 0, 0
	ld bc, BG_MAP_WIDTH * BG_MAP_HEIGHT
	jr LoadIslandCutsceneTilemap2.copy
LoadIslandCutsceneTilemap2:
	ld de, $9c00
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
	ret
	
IslandCutscenePart1_Plane_OAM:
	dsprite 10, 0, 7, 5, $64, $4
	dsprite 11, 0, 7, 5, $6a, $4

	dsprite 11, 3, 9, 7, $5d, $1
	dsprite 8, 0, 8, 7, $41, $4
	dsprite 8, 0, 9, 7, $42, $4
	dsprite 9, 0, 8, 5, $47, $4
	dsprite 9, 0, 9, 5, $48, $4
	dsprite 9, 0, 10, 5, $49, $4
	dsprite 9, 0, 11, 5, $4a, $4
	dsprite 9, 4, 12, 5, $4b, $1
	dsprite 10, 0, 8, 5, $4d, $1
	dsprite 10, 0, 9, 5, $4e, $4
	dsprite 10, 0, 10, 5, $4f, $4
	dsprite 10, 0, 11, 5, $50, $1
	dsprite 10, 4, 12, 5, $51, $1
	dsprite 10, 0, 13, 5, $40, $4
	dsprite 11, 0, 8, 5, $53, $4
	dsprite 11, 0, 9, 5, $54, $4
	dsprite 11, 0, 10, 5, $55, $4
	dsprite 11, 0, 11, 5, $56, $4
	dsprite 11, 4, 12, 5, $57, $1
	dsprite 11, 0, 13, 5, $46, $1
	dsprite 12, 0, 9, 5, $5a, $4
	dsprite 12, 0, 10, 5, $5b, $4
	dsprite 12, 0, 11, 5, $5c, $4
	dsprite 13, 0, 9, 5, $60, $4
	dsprite 13, 0, 10, 5, $61, $4
	
	dsprite 8, 0, 8, 7, $43, $1
	dsprite 8, 0, 9, 7, $44, $1
	dsprite 9, 0, 8, 5, $45, $1
	dsprite 9, 3, 11, 5, $5e, $1
	dsprite 10, 4, 8, 8, $59, $1
	dsprite 10, 3, 10, 5, $62, $1
	dsprite 10, 0, 13, 5, $52, $1
	dsprite 10, 4, 12, 5, $4c, $1
	dsprite 11, 4, 7, 9, $58, $1
	dsprite 11, 4, 8, 9, $63, $1

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
	
IslandCutscenePart2_Clouds_OAM:
	dsprite 6, 0, 21, 0, $20, $2
	dsprite 6, 0, 22, 0, $21, $2
	dsprite 6, 0, 23, 0, $22, $2
	dsprite 6, 0, 24, 0, $23, $2
	dsprite 7, 0, 21, 0, $24, $2
	dsprite 7, 0, 22, 0, $25, $2
	dsprite 7, 0, 23, 0, $26, $2
	dsprite 7, 0, 24, 0, $27, $2
	
IslandCutscenePart2_Characters_OAM1:
;wendy
	dsprite 20, 2, 26, 5, $00, $3
	dsprite 20, 2, 27, 5, $01, $3
	dsprite 21, 2, 26, 5, $10, $3
	dsprite 21, 2, 27, 5, $11, $3
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
	dsprite 20, 2, 26, 5, $00, $3
	dsprite 20, 2, 27, 5, $01, $3
	dsprite 21, 2, 26, 5, $10, $3
	dsprite 21, 2, 27, 5, $0f, $3
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
	
FlyToIslandCutscenePart3:
	ld hl, IslandCutsceneTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
	ld hl, IslandCutsceneAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	call ApplyAttrAndTilemapInVBlank
	
	lb bc, BANK(IslandCutsceneGFX), $74
	ld hl, IslandCutsceneGFX
	ld de, VTiles2 tile $00
	call DecompressRequest2bpp
	lb bc, BANK(IslandCutsceneGFX), 116
	ld hl, IslandCutsceneGFX2
	ld de, VTiles0 tile $00
	call DecompressRequest2bpp
	
	ld hl, IslandCutscene_City_OAM
	ld de, wSprites + (32 * 4)
	ld bc, 8
	call CopyBytes
	
	ld hl, IslandCutscenePart3_Plane_OAM1
	ld de, wSprites
	ld bc, 32 * 4	; # of sprites * 4
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
	ld c, 1
	call FadePalettes
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IslandCutscenePart3_Jumptable
.skip
	call DelayFrame
	jr .loop
.done
	farcall FadeOutPalettes
	farcall Special_FadeOutMusic
	ld c, 18
	call DelayFrames
	ret
	
IslandCutscenePart3_Jumptable:
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
	dw .End
	
.Init
	ld a, [wMagnetTrainDirection]
	cp 75
	jr z, .next
	inc a
	ld [wMagnetTrainDirection], a
	ret
.next:
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.Part1
	ld a, [wMagnetTrainDirection]
	cp 25
	jr z, .next
	inc a
	ld [wMagnetTrainDirection], a
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
	
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a
	
	ld hl, IslandCutscenePart3_Plane_OAM1
	ld de, wSprites
	ld bc, 32 * 4
	call CopyBytes
	
	ld c, 32
	call IslandCutscenePart3_AnimateSprites
	ret
	
.Part2
	ld a, [wMagnetTrainDirection]
	cp 25
	jr z, .next
	inc a
	ld [wMagnetTrainDirection], a
	and 3
	jr z, .Part2_skip
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
.Part2_skip
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a

	call FlyToIslandCutscenePart3ClearSprites
	ld hl, IslandCutscenePart3_Plane_OAM2
	ld de, wSprites
	ld bc, 25 * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 25
	call IslandCutscenePart3_AnimateSprites
	ret
	
.Part3
	ld a, [wMagnetTrainDirection]
	cp 30
	jr z, .next
	inc a
	ld [wMagnetTrainDirection], a
	and 1
	jr z, .Part3_skip1
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
.Part3_skip1
	ld a, [wMagnetTrainDirection]
	and 3
	jp z, .Part3_skip2
	
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a
.Part3_skip2
	call FlyToIslandCutscenePart3ClearSprites
	ld hl, IslandCutscenePart3_Plane_OAM3
	ld de, wSprites
	ld bc, 18 * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 18
	call IslandCutscenePart3_AnimateSprites
	ret
	
.Part4
	ld a, [wMagnetTrainDirection]
	cp 30
	jp z, .next
	inc a
	ld [wMagnetTrainDirection], a
	and 3
	jp nz, .Part4_skip1
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
.Part4_skip1
	ld a, [wMagnetTrainDirection]
	and 1
	jr z, .Part4_skip2
	
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a
.Part4_skip2
	call FlyToIslandCutscenePart3ClearSprites
	ld hl, IslandCutscenePart3_Plane_OAM4
	ld de, wSprites
	ld bc, 13 * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 13
	call IslandCutscenePart3_AnimateSprites
	ret
	
.Part5
	ld a, [wMagnetTrainDirection]
	cp 35
	jp z, .next
	inc a
	ld [wMagnetTrainDirection], a
	and 7
	jp nz, .Part5_skip1
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
.Part5_skip1
	ld a, [wMagnetTrainDirection]
	and 3
	jr nz, .Part5_skip2
	
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a
.Part5_skip2
	call FlyToIslandCutscenePart3ClearSprites
	ld hl, IslandCutscenePart3_Plane_OAM5
	ld de, wSprites
	ld bc, 6 * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 6
	call IslandCutscenePart3_AnimateSprites
	ret
	
.Part6
	ld a, [wMagnetTrainDirection]
	cp 50
	jp z, .next
	inc a
	ld [wMagnetTrainDirection], a
	and 15
	jp nz, .Part6_skip1
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
.Part6_skip1
	ld a, [wMagnetTrainDirection]
	and 7
	jr nz, .Part6_skip2
	
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a
.Part6_skip2
	call FlyToIslandCutscenePart3ClearSprites
	ld hl, IslandCutscenePart3_Plane_OAM6
	ld de, wSprites
	ld bc, 1 * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 1
	call IslandCutscenePart3_AnimateSprites
	ret
	
.Part7
	ld a, [wMagnetTrainDirection]
	cp 100
	jp z, .next
	inc a
	ld [wMagnetTrainDirection], a
	and 15
	jp nz, .Part7_skip1
	
	ld a, [wIslandPlaneX]
	inc a
	ld [wIslandPlaneX], a
.Part7_skip1
	ld a, [wMagnetTrainDirection]
	and 7
	jr nz, .Part7_skip2
	
	ld a, [wIslandPlaneY]
	inc a
	ld [wIslandPlaneY], a
.Part7_skip2
	call FlyToIslandCutscenePart3ClearSprites
	ld hl, IslandCutscenePart3_Plane_OAM7
	ld de, wSprites
	ld bc, 1 * 4	; # of sprites * 4
	call CopyBytes
	
	ld c, 1
	call IslandCutscenePart3_AnimateSprites
	ret
	
.End
	xor a
	ld [wMagnetTrainDirection], a
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
	
IslandCutscenePart3_AnimateSprites:
	ld hl, wSprites
	ld a, [wIslandPlaneY]
	ld b, a
	ld a, [wIslandPlaneX]
	ld d, a
.loop
	ld a, [hl]
	sub b
	ld [hli], a
	ld a, [hl]
	sub d
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret
	
IslandCutscenePart3_ScrollCity:
	ld hl, wSprites + (32 * 4)
	ld c, 2
.loop
	ld a, [hl]
	inc a
	ld [hli], a
	ld a, [hl]
	inc a
	ld [hli], a
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret
	
FlyToIslandCutscenePart3ClearSprites:
	ld hl, wSprites
	ld b, 32 * 4
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
	
IslandCutscene_City_OAM:
	dsprite 7, 3, 8, 6, $00, $0
	dsprite 7, 3, 9, 6, $01, $0
	
IslandCutscenePart3_Plane_OAM1:
	dsprite 20, 0, 18, 0, $07, $1
	dsprite 20, 0, 19, 0, $08, $1
	dsprite 20, 0, 20, 0, $09, $1
	dsprite 20, 0, 21, 0, $0a, $1
	dsprite 20, 0, 22, 0, $0b, $1
	dsprite 21, 0, 17, 0, $0c, $1
	dsprite 21, 0, 18, 0, $0d, $1
	dsprite 21, 0, 19, 0, $0e, $1
	dsprite 21, 0, 20, 0, $0f, $1
	dsprite 21, 0, 21, 0, $10, $1
	dsprite 21, 0, 22, 0, $11, $1
	dsprite 22, 0, 17, 2, $12, $1
	dsprite 22, 0, 18, 2, $13, $1
	dsprite 22, 0, 19, 2, $14, $1
	dsprite 22, 0, 20, 2, $15, $1
	dsprite 22, 0, 21, 2, $16, $1
	dsprite 22, 0, 22, 2, $17, $1
	dsprite 23, 0, 17, 2, $18, $1
	dsprite 23, 0, 18, 2, $19, $1
	dsprite 23, 0, 19, 2, $1a, $1
	dsprite 23, 0, 20, 2, $1b, $1
	dsprite 23, 0, 21, 2, $1c, $1
	dsprite 23, 0, 22, 2, $1d, $1
	dsprite 21, 3, 17, 0, $06, $2
	dsprite 21, 0, 18, 0, $02, $2
	dsprite 20, 6, 19, 0, $03, $2
	dsprite 20, 3, 20, 0, $04, $2
	dsprite 19, 5, 21, 0, $05, $2
	dsprite 22, 0, 20, 3, $1e, $2
	dsprite 22, 0, 21, 3, $1f, $2
	dsprite 22, 0, 22, 3, $20, $2
	dsprite 23, 0, 20, 3, $21, $2
	
IslandCutscenePart3_Plane_OAM2:
	dsprite 20, 0, 19, 4, $26, $1
	dsprite 20, 0, 20, 4, $27, $1
	dsprite 20, 0, 21, 4, $28, $1
	dsprite 21, 0, 17, 4, $2a, $1
	dsprite 21, 0, 18, 4, $2b, $1
	dsprite 21, 0, 19, 4, $2c, $1
	dsprite 21, 0, 20, 4, $2d, $1
	dsprite 21, 0, 21, 4, $2e, $1
	dsprite 22, 0, 17, 4, $30, $1
	dsprite 22, 0, 18, 4, $31, $1
	dsprite 22, 0, 19, 4, $32, $1
	dsprite 22, 0, 20, 4, $33, $1
	dsprite 22, 0, 21, 4, $34, $1
	dsprite 23, 0, 17, 4, $36, $1
	dsprite 23, 0, 18, 4, $37, $1
	dsprite 23, 0, 19, 4, $38, $1
	dsprite 23, 0, 20, 4, $39, $1
	dsprite 23, 0, 21, 4, $3a, $1
	dsprite 21, 0, 17, 4, $24, $2
	dsprite 21, 0, 18, 4, $25, $2
	dsprite 20, 6, 19, 4, $23, $2
	dsprite 20, 5, 20, 4, $29, $2
	dsprite 21, 6, 19, 9, $2f, $2
	dsprite 22, 1, 20, 11, $3b, $2
	dsprite 22, 5, 19, 9, $35, $2
	
IslandCutscenePart3_Plane_OAM3:
	dsprite 21, 2,  17, 6, $42, $1
	dsprite 20, 4,  18, 6, $3d, $1
	dsprite 20, 4,  19, 6, $3e, $1
	dsprite 20, 4,  20, 6, $3f, $1
	dsprite 21, 4,  18, 6, $43, $1
	dsprite 21, 4,  19, 6, $44, $1
	dsprite 21, 4,  20, 6, $45, $1
	dsprite 22, 2,  17, 6, $48, $1
	dsprite 22, 4,  18, 6, $49, $1
	dsprite 22, 4,  19, 6, $4a, $1
	dsprite 22, 4,  20, 6, $4b, $1
	dsprite 22, 3,  21, 6, $4c, $1
	dsprite 20, 4,  17, 6, $3c, $2
	dsprite 20, 4,  18, 6, $40, $2
	dsprite 20, 4,  19, 6, $41, $2
	dsprite 21, 4,  19, 6, $46, $2
	dsprite 21, 4,  20, 6, $47, $2
	dsprite 22, 4,  19, 6, $4d, $2
	
IslandCutscenePart3_Plane_OAM4:
	dsprite 21, 0,  18, 1, $4e, $1
	dsprite 20, 7,  19, 1, $4f, $1
	dsprite 20, 7,  20, 1, $50, $1
	dsprite 21, 7,  18, 1, $54, $1
	dsprite 21, 7,  19, 1, $55, $1
	dsprite 21, 7,  20, 1, $56, $1
	dsprite 21, 7,  21, 1, $5a, $1
	dsprite 22, 7,  19, 1, $5b, $1
	dsprite 22, 7,  20, 1, $5c, $1
	dsprite 20, 7,  18, 5, $51, $2
	dsprite 20, 7,  19, 5, $52, $2
	dsprite 22, 0,  19, 1, $57, $2
	dsprite 22, 0,  20, 1, $58, $2
	
IslandCutscenePart3_Plane_OAM5:
	dsprite 21, 0,  18, 2, $53, $1
	dsprite 21, 0,  19, 2, $5d, $1
	dsprite 22, 0,  18, 2, $59, $1
	dsprite 22, 0,  19, 2, $5e, $1
	dsprite 20, 6,  18, 7, $51, $2
	dsprite 22, 0,  19, 2, $5f, $2
	
IslandCutscenePart3_Plane_OAM6:
	dsprite 21, 4, 18, 4, $60, $1
	
IslandCutscenePart3_Plane_OAM7:
	dsprite 21, 4, 18, 5, $61, $1
	
IslandCutscenePart1GFX:
INCBIN "gfx/island_cutscene/part1_plane.2bpp.lz"
	
IslandCutscenePart2GFX:
INCBIN "gfx/island_cutscene/big_plane.2bpp.lz"

IslandCutscenePart2GFX2:
INCBIN "gfx/island_cutscene/wendy.2bpp.lz"

IslandCutscenePart2GFX3:
INCBIN "gfx/island_cutscene/clouds.2bpp.lz"

IslandCutscenePart2CoraGFX:
INCBIN "gfx/island_cutscene/cora.2bpp.lz"

IslandCutscenePart2CoraGFX2:
INCBIN "gfx/island_cutscene/cora2.2bpp.lz"

IslandCutscenePart2CloudSpritesGFX:
INCBIN "gfx/island_cutscene/cloud_sprites.2bpp.lz"

BigPlaneTilemap:
INCBIN "gfx/island_cutscene/big_plane.tilemap"

SkyTilemap:
INCBIN "gfx/island_cutscene/sky.tilemap"

SkyPlaneTilemap:
INCBIN "gfx/island_cutscene/sky_plane.tilemap"

SkyPlaneAttrmap:
INCBIN "gfx/island_cutscene/sky_plane.attrmap"
	
IslandCutsceneGFX:
INCBIN "gfx/island_cutscene/island.2bpp.lz"

IslandCutsceneGFX2:
INCBIN "gfx/island_cutscene/plane.2bpp.lz"
	
IslandCutsceneTilemap:
INCBIN "gfx/island_cutscene/island.tilemap"

IslandCutsceneAttrmap:
INCBIN "gfx/island_cutscene/island.attrmap"

IslandCutscenePart12BGPals:
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 22, 31
	RGB 07, 07, 07

	RGB 21, 21, 21
	RGB 13, 22, 31
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07
	
	RGB 28, 30, 30
	RGB 25, 30, 31
	RGB 20, 28, 31
	RGB 13, 22, 31
	
	RGB 27, 31, 27
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07
	
IslandCutscenePart2OBPals:
	RGB 13, 22, 31
	RGB 13, 22, 31
	RGB 13, 22, 31
	RGB 13, 22, 31
	
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 07, 07, 07
	
	RGB 31, 31, 31
	RGB 28, 30, 30
	RGB 25, 30, 31
	RGB 20, 28, 31
	
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 15, 10, 03
	RGB 00, 00, 00
	
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07

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
