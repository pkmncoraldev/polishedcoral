
_AnimateTileset:: ; fc000
; Iterate over a given pointer array of
; animation functions (one per frame).

; Typically in wra1, vra0

	ld a, [wTilesetAnim]
	ld e, a
	ld a, [wTilesetAnim + 1]
	ld d, a

	ld a, [hTileAnimFrame]
	ld l, a
	inc a
	ld [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de.
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl
; fc01b

Tileset00Anim::
TilesetPlayerRoomAnim::
TilesetPlayerHouseAnim::
TilesetHouse1Anim::
TilesetPokeCenterAnim::
TilesetCafeAnim::
TilesetLighthouseAnim::
TilesetGateAnim::
TilesetLabAnim::
TilesetMartAnim::
TilesetLibraryAnim::
TilesetSnowAnim::
TilesetMall2Anim::
TilesetIceCaveAnim::
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetMall1Anim::
	dw VTiles2 tile $08, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileUp2
	dw VTiles2 tile $08, WriteTileFromBuffer
	dw VTiles2 tile $09, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown2
	dw VTiles2 tile $09, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation
	
TilesetHouse2Anim::
	dw VTiles2 tile $6c, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown2
	dw VTiles2 tile $6c, WriteTileFromBuffer
	dw VTiles2 tile $6d, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRight2
	dw VTiles2 tile $6d, WriteTileFromBuffer
	dw NULL,  AnimateConveyorTile
	dw NULL,  DoneTileAnimation

TilesetSewerAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetTrainAnim::
	dw VTiles2 tile $0, WriteTileToBuffer
;	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
;	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $0, WriteTileFromBuffer
	dw TrainWindowFrames, AnimateWaterfallTiles
	dw NULL,  DoneTileAnimation
	
TilesetGlintAnim::
TilesetStarglowAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw WaterfallFrames, AnimateWaterfallTiles
    dw Waterfall2Frames, AnimateWaterfallTiles
    dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw ShorelineFrames3,  AnimateWaterfallTiles
	dw ShorelineFrames,  AnimateWaterfallTiles
	dw ShorelineFrames2,  AnimateWaterfallTiles
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetGroveAnim::
TilesetMountainAnim::
TilesetSpookyAnim::
TilesetRanchAnim::
TilesetLusterAnim::
TilesetParkAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
	
	
TilesetJungleAnim::
    dw VTiles2 tile $14, WriteTileToBuffer
    dw NULL,  WaitTileAnimation
    dw wTileAnimBuffer, ScrollTileRightLeft
    dw NULL,  WaitTileAnimation
    dw VTiles2 tile $14, WriteTileFromBuffer
    dw NULL,  AnimateFlowerTile
    dw NULL,  AnimateFlowerTile2
    dw WaterfallPriorityFrames, AnimateWaterfallTiles
    dw Waterfall2PriorityFrames, AnimateWaterfallTiles
    dw Waterfall3Frames, AnimateWaterfallTiles
    dw Waterfall4Frames, AnimateWaterfallTiles
    dw Waterfall5Frames, AnimateWaterfallTiles
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  WaitTileAnimation
    dw NULL,  DoneTileAnimation
	
TilesetCaveAnim::
	dw NULL,  LavaAnim2
	dw NULL,  WaitTileAnimation
	dw WaterfallFrames, AnimateWaterfallTiles
	dw Waterfall2Frames, AnimateWaterfallTiles
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw NULL,  LavaAnim1
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation

TilesetStarglowCavernAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  TileAnimationPalette
	dw NULL,  TileAnimationPaletteStarglow
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $40, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $40, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation

TilesetHauntedAnim::
	dw NULL,  FlickeringLightbulbPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetHauntedTVAnim::
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  TileAnimationPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  FlickeringTVPalette
	dw NULL,  DoneTileAnimation

DoneTileAnimation: ; fc2fb
; Reset the animation command loop.
	xor a
	ld [hTileAnimFrame], a

WaitTileAnimation: ; fc2fe
; Do nothing this frame.
	ret
; fc2ff

StandingTileFrame8: ; fc2ff
	ld a, [wTileAnimationTimer]
	inc a
	and a, 7
	ld [wTileAnimationTimer], a
	ret
; fc309


ScrollTileRightLeft: ; fc309
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and 7
	ld [wTileAnimationTimer], a
	and 4
	jr nz, ScrollTileRight
	jr ScrollTileLeft
; fc318

ScrollTileRight2: ; fc309
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and 7
	ld [wTileAnimationTimer], a
	and 4
	jr nz, ScrollTileRight
	jr ScrollTileRight

ScrollTileUpDown: ; fc318
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and 7
	ld [wTileAnimationTimer], a
	and 4
	jr nz, ScrollTileDown
	jr ScrollTileUp
; fc327

ScrollTileDown2: ; fc318
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and 7
	ld [wTileAnimationTimer], a
	and 4
	jr nz, ScrollTileDown
	jr ScrollTileDown
	
ScrollTileUp2: ; fc318
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and 7
	ld [wTileAnimationTimer], a
	and 4
	jr nz, ScrollTileUp
	jr ScrollTileUp

ScrollTileLeft: ; fc327
	ld h, d
	ld l, e
	ld c, 4
.loop
	rept 4
	ld a, [hl]
	rlca
	ld [hli], a
	endr
	dec c
	jr nz, .loop
	ret
; fc33b

ScrollTileRight: ; fc33b
	ld h, d
	ld l, e
	ld c, 4
.loop
	rept 4
	ld a, [hl]
	rrca
	ld [hli], a
	endr
	dec c
	jr nz, .loop
	ret
; fc34f

ScrollTileUp: ; fc34f
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, $e
	add hl, bc
	ld a, 4
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret
; fc36a

ScrollTileDown: ; fc36a
	ld h, d
	ld l, e
	ld de, $e
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, 4
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret
; fc387


AnimateFountain: ; fc387
	ld hl, sp+0
	ld b, h
	ld c, l
	ld hl, .frames
	ld a, [wTileAnimationTimer]
	and 7
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame1

.frame1 INCBIN "gfx/tilesets/fountain/1.2bpp"
.frame2 INCBIN "gfx/tilesets/fountain/2.2bpp"
.frame3 INCBIN "gfx/tilesets/fountain/3.2bpp"
.frame4 INCBIN "gfx/tilesets/fountain/4.2bpp"
.frame5 INCBIN "gfx/tilesets/fountain/5.2bpp"
; fc402

AnimateTopofWaterfall:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld hl, .frames
	ld a, [wTileAnimationTimer]
	and 1
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	dw .frame1
	dw .frame2

.frame1 INCBIN "gfx/tilesets/waterfall/6.2bpp"
.frame2 INCBIN "gfx/tilesets/waterfall/7.2bpp"


AnimateWaterTile: ; fc402
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and 3 << 1

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add WaterTileFrames % $100
	ld l, a
	ld a, 0
	adc WaterTileFrames / $100
	ld h, a

; Stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile
; fc41c

WaterTileFrames: ; fc41c
	INCBIN "gfx/tilesets/water/water.2bpp"
; fc45c


ForestTreeLeftAnimation: ; fc45c
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit 2, a
	jr nz, .asm_fc46c
	ld hl, ForestTreeLeftFrames
	jr .asm_fc47d

.asm_fc46c
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a

.asm_fc47d
	ld sp, hl
	ld hl, VTiles2 tile $0c
	jp WriteTile
; fc484


ForestTreeLeftFrames: ; fc484
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"
; fc4a4

ForestTreeRightFrames: ; fc4a4
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"
; fc4c4


ForestTreeRightAnimation: ; fc4c4
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit 2, a
	jr nz, .asm_fc4d4
	ld hl, ForestTreeRightFrames
	jr .asm_fc4eb

.asm_fc4d4
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc4eb
	ld sp, hl
	ld hl, VTiles2 tile $0f
	jp WriteTile
; fc4f2


ForestTreeLeftAnimation2: ; fc4f2
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit 2, a
	jr nz, .asm_fc502
	ld hl, ForestTreeLeftFrames
	jr .asm_fc515

.asm_fc502
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a

.asm_fc515
	ld sp, hl
	ld hl, VTiles2 tile $0c
	jp WriteTile
; fc51c


ForestTreeRightAnimation2: ; fc51c
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit 2, a
	jr nz, .asm_fc52c
	ld hl, ForestTreeRightFrames
	jr .asm_fc545

.asm_fc52c
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add ForestTreeLeftFrames % $100
	ld l, a
	ld a, 0
	adc ForestTreeLeftFrames / $100
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc545
	ld sp, hl
	ld hl, VTiles2 tile $0f
	jp WriteTile
; fc54c


GetForestTreeFrame: ; fc54c
; Return 0 if a is even, or 2 if odd.
	and a
	jr z, .even
	cp 1
	jr z, .odd
	cp 2
	jr z, .even
	cp 3
	jr z, .odd
	cp 4
	jr z, .even
	cp 5
	jr z, .odd
	cp 6
	jr z, .even
.odd
	ld a, 2
	scf
	ret
.even
	xor a
	ret
; fc56d


AnimateFlowerTile: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [wTileAnimationTimer]
	and 1 << 1
	ld e, a

; CGB has different color mappings for flowers.
	ld a, [hCGB]
	and 1

	add e
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, FlowerTileFrames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 + $30 ; tile 4

	jp WriteTile
; fc58c

FlowerTileFrames: ; fc58c
	INCBIN "gfx/tilesets/flower/dmg_1.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_1.2bpp"
	INCBIN "gfx/tilesets/flower/dmg_2.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_2.2bpp"
; fc5cc

AnimateFlowerTile2: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [wTileAnimationTimer]
	and 1 << 1
	ld e, a

; CGB has different color mappings for flowers.
	ld a, [hCGB]
	and 1

	add e
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, FlowerTileFrames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 tile $54

	jp WriteTile
; fc58c

AnimateConveyorTile: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [wTileAnimationTimer]
	and 1 << 1
	ld e, a

; CGB has different color mappings for flowers.
	ld a, [hCGB]
	and 1

	add e
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, ConveyorTileFrames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 + $30 ; tile 4

	jp WriteTile
; fc58c

ConveyorTileFrames: ; fc58c
	INCBIN "gfx/tilesets/conveyor/1.2bpp"
	INCBIN "gfx/tilesets/conveyor/1.2bpp"
	INCBIN "gfx/tilesets/conveyor/2.2bpp"
	INCBIN "gfx/tilesets/conveyor/2.2bpp"

AnimateWaterfallTiles: ; fc56d
; Draw two waterfall tiles for the current frame in VRAM tile at de.
; based on AnimateWhirlpoolTiles, but with 8 frames

; Struct:
;     VRAM address
;    Address of the first tile

; Does two tiles at a time.

; Save sp in bc (see WriteTile).
    ld hl, sp+$0
    ld b, h
    ld c, l

; de = VRAM address
    ld l, e
    ld h, d
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
; Tile address is now at hl.

; Get the tile for this frame.
	ld a, [wTileAnimationTimer]
    and %111 ; 8 frames x2
    swap a  ; * 16 bytes per tile
    sla a   ; * 2 tiles

    add [hl]
    inc hl
    ld h, [hl]
    ld l, a
    ld a, 0
    adc h
    ld h, a

; Stack now points to the desired frame.
    ld sp, hl

    ld l, e
    ld h, d

    jp WriteTwoTiles
	
TrainWindowFrames: dw VTiles2 tile $28, TrainWindowTiles

TrainWindowTiles: INCBIN "gfx/tilesets/trainwindows/1.2bpp"
	
WaterfallFrames: dw VTiles2 tile $30, WaterfallTiles

WaterfallTiles: INCBIN "gfx/tilesets/waterfall/1.2bpp"

Waterfall2Frames: dw VTiles2 tile $32, Waterfall2Tiles

Waterfall2Tiles: INCBIN "gfx/tilesets/waterfall/2.2bpp"

Waterfall3Frames: dw VTiles2 tile $34, Waterfall3Tiles

Waterfall3Tiles: INCBIN "gfx/tilesets/waterfall/3.2bpp"

Waterfall4Frames: dw VTiles2 tile $36, Waterfall4Tiles

Waterfall4Tiles: INCBIN "gfx/tilesets/waterfall/4.2bpp"

Waterfall5Frames: dw VTiles2 tile $38, Waterfall5Tiles

Waterfall5Tiles: INCBIN "gfx/tilesets/waterfall/5.2bpp"

WaterfallPriorityFrames: dw VTiles2 tile $30, WaterfallPriorityTiles

WaterfallPriorityTiles: INCBIN "gfx/tilesets/waterfall/priority/1.2bpp"

Waterfall2PriorityFrames: dw VTiles2 tile $32, Waterfall2PriorityTiles

Waterfall2PriorityTiles: INCBIN "gfx/tilesets/waterfall/priority/2.2bpp"

ShorelineFrames: dw VTiles2 tile $28, ShorelineTiles

ShorelineTiles: INCBIN "gfx/tilesets/shoreline/shore.2bpp"

ShorelineFrames2: dw VTiles2 tile $18, ShorelineTiles2

ShorelineTiles2: INCBIN "gfx/tilesets/shoreline/shore2.2bpp"

ShorelineFrames3: dw VTiles2 tile $24, ShorelineTiles3

ShorelineTiles3: INCBIN "gfx/tilesets/shoreline/shore3.2bpp"
; fc5cc

	
WriteTwoTiles:
; Write two 8x8 tile ($20 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 8
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr
	jp _FinishWritingSecondTile
	
	
SafariFountainAnim1: ; fc5cc
; Splash in the bottom-right corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and 6
	srl a
	inc a
	inc a
	and 3
	swap a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, VTiles2 tile $5b
	jp WriteTile
; fc5eb


SafariFountainAnim2: ; fc5eb
; Splash in the top-left corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and 6
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, VTiles2 tile $38
	jp WriteTile
; fc605


SafariFountainFrames: ; fc605
	INCBIN "gfx/tilesets/safari/1.2bpp"
	INCBIN "gfx/tilesets/safari/2.2bpp"
	INCBIN "gfx/tilesets/safari/3.2bpp"
	INCBIN "gfx/tilesets/safari/4.2bpp"
; fc645

LavaAnim1: ; fc5cc
; Splash in the bottom-right corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and 6
	srl a
	inc a
	inc a
	and 3
	swap a
	ld e, a
	ld d, 0
	ld hl, LavaFrames
	add hl, de
	ld sp, hl
	ld hl, VTiles2 tile $42
	jp WriteTile
; fc5eb


LavaAnim2: ; fc5eb
; Splash in the top-left corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and 6
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, LavaFrames
	add hl, de
	ld sp, hl
	ld hl, VTiles2 tile $43
	jp WriteTile
; fc605


LavaFrames: ; fc605
	INCBIN "gfx/tilesets/safari/1.2bpp"
	INCBIN "gfx/tilesets/safari/2.2bpp"
	INCBIN "gfx/tilesets/safari/3.2bpp"
	INCBIN "gfx/tilesets/safari/4.2bpp"

AnimateSproutPillarTile: ; fc645
; Read from struct at de:
; 	Destination (VRAM)
;	Address of the first tile in the frame array

	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]
	and 7

; Get frame index a
	ld hl, .frames
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

; Destination
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Add the frame index to the starting address
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jr WriteTile

.frames
	db $00, $10, $20, $30, $40, $30, $20, $10
; fc673


StandingTileFrame: ; fc673
	ld hl, wTileAnimationTimer
	inc [hl]
	ret
; fc678


AnimateWhirlpoolTile: ; fc678
; Update whirlpool tile using struct at de.

; Struct:
; 	VRAM address
;	Address of the first tile

; Only does one of 4 tiles at a time.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; de = VRAM address
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; Tile address is now at hl.

; Get the tile for this frame.
	ld a, [wTileAnimationTimer]
	and %11 ; 4 frames x2
	swap a  ; * 16 bytes per tile

	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; Stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jr WriteTile
; fc696


WriteTileFromBuffer: ; fc696
; Write tiledata at wTileAnimBuffer to de.
; wTileAnimBuffer is loaded to sp for WriteTile.

	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, wTileAnimBuffer
	ld sp, hl

	ld h, d
	ld l, e
	jr WriteTile
; fc6a2


WriteTileToBuffer: ; fc6a2
; Write tiledata de to wTileAnimBuffer.
; de is loaded to sp for WriteTile.

	ld hl, sp+0
	ld b, h
	ld c, l

	ld h, d
	ld l, e
	ld sp, hl

	ld hl, wTileAnimBuffer

	; fallthrough

WriteTile: ; fc6ac
; Write one 8x8 tile ($10 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

_FinishWritingSecondTile:
rept 7
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; restore sp
	ld h, b
	ld l, c
	ld sp, hl
	ret
; fc6d7

TileAnimationPaletteStarglow: ; fc6d7
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ld a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
;	and 1 ; odd
	ret nz

; Ready for BGPD input...
	ld a, %10010100 ; auto increment, index $18 (pal 3 color 0)
	ld [rBGPI], a

	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a

; Update color 0 in order 0 1 2 1

	ld a, l
	and %111 ; frames 0 2 4 6 8 10 12

	cp 5
	jr z, .color0

	cp 6
	jr z, .color2
	
	cp 7
	jr z, .color3


.color1
	ld hl, wUnknBGPals + $14 ; pal 3 color 1
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end

.color0
	ld hl, wUnknBGPals + $04 ; pal 3 color 0
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end

.color3
	ld hl, wUnknBGPals + $02 ; pal 3 color 0
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end
	
.color2
	ld hl, wUnknBGPals + $32 ; pal 3 color 2
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

.end
	pop af
	ld [rSVBK], a
	ret
; fc71e

TileAnimationPalette: ; fc6d7
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ld a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...
	ld a, %10011000 ; auto increment, index $18 (pal 3 color 0)
	ld [rBGPI], a

	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a

; Update color 0 in order 0 1 2 1

	ld a, l
	and %110 ; frames 0 2 4 6

	jr z, .color0

	cp 4
	jr z, .color2

.color1
	ld hl, wUnknBGPals + $1a ; pal 3 color 1
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end

.color0
	ld hl, wUnknBGPals + $18 ; pal 3 color 0
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a
	jr .end

.color2
	ld hl, wUnknBGPals + $1c ; pal 3 color 2
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

.end
	pop af
	ld [rSVBK], a
	ret
; fc71e


FlickeringCaveEntrancePalette: ; fc71e
; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ld a, [rBGP]
	cp %11100100
	ret nz
; We only want to be here if we're in a dark cave.
	ld a, [wTimeOfDayPalset]
	cp $ff ; 3,3,3,3
	ret nz

	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ld [rBGPI], a
	ld a, [hVBlankCounter]
	and %00000010
	jr nz, .bit1set
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	jr .okay

.bit1set
	ld hl, wUnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

	pop af
	ld [rSVBK], a
	ret
; fc750

FlickeringTVPalette: ; fc71e
; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ld a, [rBGP]
	cp %11100100
	ret nz
; We only want to be here if we're in a dark cave.
;	ld a, [wTimeOfDayPalset]
;	cp $ff ; 3,3,3,3
;	ret nz

	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ld [rBGPI], a
	ld a, [hVBlankCounter]
	and %00000010
	jr nz, .bit1set
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	jr .okay

.bit1set
	ld hl, wUnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

	pop af
	ld [rSVBK], a
	ret
; fc750

FlickeringLightbulbPalette:
; No palette changes on DMG.
	ld a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ld a, [rBGP]
	cp %11100100
	ret nz

	ld a, [hVBlankCounter]
	and %00000100
	ret nz
	
	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ld [rBGPI], a
	call Random
	cp $cf ; 75 percent
	jr c, .on
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	jr .okay

.on
	ld hl, wUnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

	pop af
	ld [rSVBK], a
	ret

SproutPillarTilePointer1:  dw VTiles2 tile $2d, SproutPillarTile1
SproutPillarTilePointer2:  dw VTiles2 tile $2f, SproutPillarTile2
SproutPillarTilePointer3:  dw VTiles2 tile $3d, SproutPillarTile3
SproutPillarTilePointer4:  dw VTiles2 tile $3f, SproutPillarTile4
SproutPillarTilePointer5:  dw VTiles2 tile $3c, SproutPillarTile5
SproutPillarTilePointer6:  dw VTiles2 tile $2c, SproutPillarTile6
SproutPillarTilePointer7:  dw VTiles2 tile $4d, SproutPillarTile7
SproutPillarTilePointer8:  dw VTiles2 tile $4f, SproutPillarTile8
SproutPillarTilePointer9:  dw VTiles2 tile $5d, SproutPillarTile9
SproutPillarTilePointer10: dw VTiles2 tile $5f, SproutPillarTile10

SproutPillarTile1:  INCBIN "gfx/tilesets/sprout-pillar/1.2bpp"
SproutPillarTile2:  INCBIN "gfx/tilesets/sprout-pillar/2.2bpp"
SproutPillarTile3:  INCBIN "gfx/tilesets/sprout-pillar/3.2bpp"
SproutPillarTile4:  INCBIN "gfx/tilesets/sprout-pillar/4.2bpp"
SproutPillarTile5:  INCBIN "gfx/tilesets/sprout-pillar/5.2bpp"
SproutPillarTile6:  INCBIN "gfx/tilesets/sprout-pillar/6.2bpp"
SproutPillarTile7:  INCBIN "gfx/tilesets/sprout-pillar/7.2bpp"
SproutPillarTile8:  INCBIN "gfx/tilesets/sprout-pillar/8.2bpp"
SproutPillarTile9:  INCBIN "gfx/tilesets/sprout-pillar/9.2bpp"
SproutPillarTile10: INCBIN "gfx/tilesets/sprout-pillar/10.2bpp"
; fca98


WhirlpoolFrames1: dw VTiles2 tile $32, WhirlpoolTiles1
WhirlpoolFrames2: dw VTiles2 tile $33, WhirlpoolTiles2
WhirlpoolFrames3: dw VTiles2 tile $42, WhirlpoolTiles3
WhirlpoolFrames4: dw VTiles2 tile $43, WhirlpoolTiles4
; fcaa8

WhirlpoolTiles1: INCBIN "gfx/tilesets/whirlpool/1.2bpp"
WhirlpoolTiles2: INCBIN "gfx/tilesets/whirlpool/2.2bpp"
WhirlpoolTiles3: INCBIN "gfx/tilesets/whirlpool/3.2bpp"
WhirlpoolTiles4: INCBIN "gfx/tilesets/whirlpool/4.2bpp"
; fcba8
