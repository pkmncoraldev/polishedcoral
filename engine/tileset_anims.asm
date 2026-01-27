
_AnimateTileset:: ; fc000
; Iterate over a given pointer array of
; animation functions (one per frame).

; Typically in wra1, vra0

	ld a, [wTilesetAnim]
	ld e, a
	ld a, [wTilesetAnim + 1]
	ld d, a

	ldh a, [hTileAnimFrame]
	ld l, a
	inc a
	ldh [hTileAnimFrame], a

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
TilesetPokeCenterAnim::
TilesetLibraryAnim::
TilesetMall2Anim::
TilesetIceCaveAnim::
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetSnowAnim::
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
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
	dw NULL,  DoneTileAnimation
	
TilesetBarAnim::
	dw NULL,  JukeboxColors
	dw NULL,  WaitTileAnimation
	dw NULL,  FlickeringSignPalette
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
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetDiveAnim::
	dw NULL,  StandingTileFrame
	dw SeaweedFrames, AnimateWaterfallTiles
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
	
TilesetDragonShrineAnim::
	dw NULL,  StandingTileFrame
	dw CandleFrames, AnimateWaterfallTiles
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
	
TilesetLighthouseAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw FanFrames, AnimateWaterfallTiles2
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
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetOrphanageAnim::
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw TwinkleFireplaceFrames, AnimateWaterfallTiles
	dw NULL,  WaitTileAnimationOrphanage
	dw NULL,  WaitTileAnimation
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
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetHouse1Anim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileSailboat
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation
	
TilesetMartAnim::
	dw NULL,  StandingTileFrame
	dw NULL,  TileAnimationPaletteCasino
	dw CasinoSignFrames, AnimateWaterfallTiles3
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
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetNettBuildingAnim::
	dw PokeballSculptureFrames, AnimateWaterfallTiles2
	dw PokeballSculptureFrames2, AnimateWaterfallTiles2
	dw NULL,  StandingTileFrame8
	dw NewtonFrames, AnimateNewtonTiles
	dw ClockFrames, AnimateWaterfallTiles
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetGateAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw VTiles2 tile $23, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $23, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw SunbeamViewWaterFrames, AnimateWaterfallTiles2
	dw SunbeamViewWaterFrames2, AnimateWaterfallTiles2
	dw SunbeamViewSmokeFrames, AnimateWaterfallTiles2
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
TilesetLabAnim::
	dw VTiles2 tile $6c, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown2
	dw VTiles2 tile $6c, WriteTileFromBuffer
	dw VTiles2 tile $6d, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRight2
	dw VTiles2 tile $6d, WriteTileFromBuffer
	dw NULL,  AnimateConveyorTile
	dw TwinkleFireplaceFrames, AnimateWaterfallTiles
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
	dw TrainWindowFrames2, AnimateWaterfallTiles
	dw NULL,  DoneTileAnimation
	
TilesetSunsetAnim::
	dw VTiles2 tile $00, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $00, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw WaterfallFrames, AnimateWaterfallTiles
	dw Waterfall2Frames, AnimateWaterfallTiles
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw NULL,  WaitTileAnimation
	dw ShorelineFrames,  AnimateWaterfallTiles2
	dw VTiles2 tile $38, ScrollTileDown
	dw VTiles2 tile $28, ScrollTileRight
	dw VTiles2 tile $38, ScrollTileDown
	dw VTiles2 tile $28, ScrollTileRight
	dw NULL,  DoneTileAnimation
	
TilesetHighwayAnim::
TilesetHighway2Anim::
TilesetGroveAnim::
	dw VTiles2 tile $00, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $00, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw AmublanceFrames, AnimateWaterfallTiles
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetGlintAnim::
TilesetStarglowAnim::
TilesetSouthTownsAnim::
	dw VTiles2 tile $1c, ScrollTileDown
	dw VTiles2 tile $00, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $00, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $1c, ScrollTileDown
	dw WaterfallFrames, AnimateWaterfallTiles
	dw Waterfall2Frames, AnimateWaterfallTiles
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $1c, ScrollTileDown
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetAutumnAnim::
	dw VTiles2 tile $00, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $00, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw WaterfallFrames, AnimateWaterfallTiles
	dw Waterfall2Frames, AnimateWaterfallTiles
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw TreeWindFrames, AnimateTreeTiles
	dw NULL,  WaitTileAnimation
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetDesertAnim::
	dw VTiles2 tile $00, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $00, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw FlagFrames, AnimateWaterfallTiles
	dw FlagFrames2, AnimateWaterfallTiles
	dw NULL,  WaitTileAnimation
	dw DesertLightFrames, AnimateWaterfallTiles
	dw NULL,  WaitTileAnimation
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetShimmerAnim::
	dw VTiles2 tile $00, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $00, WriteTileFromBuffer
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw WaterfallFrames, AnimateWaterfallTiles
	dw Waterfall2Frames, AnimateWaterfallTiles
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw NULL,  WaitTileAnimation
	dw ShorelineFrames,  AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
	
TilesetPlayerHouseAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw RippleFrames, AnimateWaterfallTiles
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
	
TilesetMountainAnim::
TilesetSpookyAnim::
TilesetParkAnim::
TilesetAirportAnim::
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
	dw WaterFrames, AnimateWaterfallTiles2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
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
	
TilesetLusterAnim::
TilesetRanchAnim::
TilesetSouthBuildingsAnim::
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
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
	dw VTiles2 tile $40, ScrollTileDown
	dw WaterfallPriorityFrames, AnimateWaterfallTiles2
	dw WaterfallPriority2Frames, AnimateWaterfallTiles2
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw Waterfall4Frames, AnimateWaterfallTiles
	dw Waterfall5Frames, AnimateWaterfallTiles
	dw VTiles2 tile $40, ScrollTileDown
	dw NULL,  DoneTileAnimation
	
TilesetCaveAnim::
TilesetLavaCaveAnim::
TilesetGreenCaveAnim::
	dw VTiles2 tile $5e, ScrollTileDown
	dw VTiles2 tile $5f, ScrollTileRight
	dw NULL,  LavaAnim2
	dw WaterfallFrames, AnimateWaterfallTiles
	dw Waterfall2Frames, AnimateWaterfallTiles
	dw Waterfall3Frames, AnimateWaterfallTiles
	dw VTiles2 tile $36, AnimateTopofWaterfall
	dw VTiles2 tile $5e, ScrollTileDown
	dw VTiles2 tile $5f, ScrollTileRight
	dw NULL,  LavaAnim1
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  WaitTileAnimation
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw VTiles2 tile $5e, ScrollTileDown
	dw VTiles2 tile $5f, ScrollTileRight
	dw NULL,  AnimateFlowerTile
	dw ShorelineFrames,  AnimateWaterfallTiles2
	dw CaveWaterFrames, AnimateWaterfallTiles2
	dw NULL,  DoneTileAnimation

TilesetStarglowCavernAnim::
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw CaveWaterFrames, AnimateWaterfallTiles2
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
	ldh [hTileAnimFrame], a

WaitTileAnimation: ; fc2fe
; Do nothing this frame.
	ret

WaitTileAnimationOrphanage:
	ld a, [wMapNumber]
	cp MAP_RADIANT_GYM
	ret z
	xor a
	ldh [hTileAnimFrame], a
	ret

JukeboxColors:
	eventflagcheck EVENT_BAR_FIGHT_DONE
	ret z
	ld a, [wTileAnimationTimer]
	inc a
	and 7
	ld [wTileAnimationTimer], a
	cp 7
	ret nz
.try_again
	ld a, [wPlaceBallsY]
	ld b, a
	ld a, 6
	call RandomRange
	cp b
	jr z, .try_again
	ld [wPlaceBallsY], a
	cp 1
	jr z, .one
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	cp 5
	jr z, .five
	jr .zero
.one
	ld a, $40 | 1
	ld [wTimeOfDayPalFlags], a
;	farcall Special_UpdatePalsInstant
	ret
.two
	ld a, $40 | 2
	ld [wTimeOfDayPalFlags], a
;	farcall Special_UpdatePalsInstant
	ret
.three
	ld a, $40 | 3
	ld [wTimeOfDayPalFlags], a
;	farcall Special_UpdatePalsInstant
	ret
.four
	ld a, $40 | 4
	ld [wTimeOfDayPalFlags], a
;	farcall Special_UpdatePalsInstant
	ret
.five
	ld a, $40 | 5
	ld [wTimeOfDayPalFlags], a
;	farcall Special_UpdatePalsInstant
	ret
.reset
	xor a
	ld [wPlaceBallsY], a
.zero
	ld a, $40 | 0
	ld [wTimeOfDayPalFlags], a
;	farcall Special_UpdatePalsInstant
	ret

StandingTileFrame8: ; fc2ff
	ld a, [wMapNumber]
	cp MAP_NETT_BUILDING_OFFICE
	jr z, .not_8
	ld a, [wTileAnimationTimer]
	cp 7
	jr nz, .not_8
	ld a, [wPlaceBallsY]
	cp 7
	jr z, .is_8
	inc a
	and a, 7
	ld [wPlaceBallsY], a
	ret
.not_8
	ld a, [wTileAnimationTimer]
	inc a
	and a, 7
	ld [wTileAnimationTimer], a
	ret
.is_8
	xor a
	ld [wTileAnimationTimer], a
	ld [wPlaceBallsY], a
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

ScrollTileSailboat:
	eventflagcheck EVENT_SAILBOAT_LEFT
	jr nz, ScrollTileRight
	
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


AnimateFlowerTile: ; fc56d
	ld a, [wSkateparkComboTimer]
	cp 0
	jr z, .skip_score
	dec a
	cp 0
	jr nz, .skip_score
	farcall AddSkateparkScore
.skip_score
	ld [wSkateparkComboTimer], a
	eventflagcheck EVENT_TIMER_ACTIVE
	jr nz, .timer
	eventflagcheck EVENT_OBSCURA_QUIZ_ACTIVE
	jr z, .skip	
;.display
	ld a, [wCurrentAirportBaggage]
	ld b, a
	ld a, [wRanchRaceSeconds]
	cp QUIZ_TIME_LIMIT + 1
	jr z, .skip
	ld c, a
	ld a, QUIZ_TIME_LIMIT
	sub c
	ld [wCurrentAirportBaggage], a
	cp b
	jr z, .timer
	and 1 ; odd
	jr z, .odd_sfx
	ld de, SFX_UNKNOWN_61
	jr .display_cont
.odd_sfx
	ld de, SFX_SWITCH_POCKETS
.display_cont
	call PlaySFX
.timer
	ld hl, wRanchRaceFrames
	ld a, [hl]
	inc a
	
	cp 3 ; frames/second
	jr nc, .second
	
	ld [hl], a
	jr .skip
	
.second
	xor a
	ld [hl], a
	
; +1 second
	ld hl, wRanchRaceSeconds
	ld a, [hl]
	cp 60
	jr z, .minute
	inc a	
	ld [hl], a
	jr .skip

.minute
	xor a
	ld [hl], a
	
; +1 minute
	ld hl, wRanchRaceMinutes
	ld a, [hl]
	cp 99
	jr z, .skip
	inc a	
	ld [hl], a
.skip

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
;	ldh a, [hCGB]
	ld a, [wMapGroup]
	cp GROUP_FAKE_ROUTE_1
	jr nz, .dmg
	xor a
	jr .cont
.dmg
	ld a, 1
.cont
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
	ldh a, [hCGB]
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
	
AnimateNewtonTiles:
	ld a, [wMapNumber]
	cp MAP_NETT_BUILDING_OFFICE
	jr nz, AnimateWaterfallTiles
	eventflagcheck EVENT_NEWTON_OFF
	jr nz, AnimateWaterfallTiles
	ld a, [wTileAnimationTimer]
	cp 1
	jr z, .sound
	cp 5
	jr z, .sound
	jr AnimateWaterfallTiles
.sound
	ld de, SFX_NEWTON
	jp PlaySFX
	
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
	
AnimateTreeTiles:
	ld hl, wDailyFlags2
	bit 7, [hl] ; ENGINE_WINDY_DAY
	ret z
	
	ld a, [wMapNumber]
	cp MAP_ROUTE_27
	jr z, .stop
	
	ld a, [wTreeAnimationFrame]
	cp 0
	jr nz, .dec
	ld a, 1
	ld [wTreeAnimationFrame], a
	jr AnimateWaterfallTiles2
.stop
	ld a, [wTreeAnimationFrame]
	cp 2
	ret z
	ld a, 2
	ld [wTreeAnimationFrame], a
	xor a
	ld [wTileAnimationTimer], a
	jr AnimateWaterfallTiles2
.dec
	xor a
	ld [wTreeAnimationFrame], a
	
AnimateWaterfallTiles2: ; fc56d
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
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 2
; do 'hl += a * 32' twice to get 'hl += a * 64'
; (16 bytes per tiles * 4 tiles = 64 bytes)
	ld a, [wTileAnimationTimer]
	and %111 ; 8 frames x2
	rrca ; rotating 3 right equals
	rrca ; rotating 5 left, which
	rrca ; multiplies by 2**5 = 32
	; hl += a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
endr

; Stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteFourTiles
	
AnimateWaterfallTiles3: ; fc56d
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
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 2
; do 'hl += a * 32' twice to get 'hl += a * 64'
; (16 bytes per tiles * 4 tiles = 64 bytes)
	ld a, [wTileAnimationTimer]
	and %1 ; 2 frames x2
	rrca ; rotating 3 right equals
	rrca ; rotating 5 left, which
	rrca ; multiplies by 2**5 = 32
	; hl += a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
endr

; Stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteFourTiles
	
AmublanceFrames:dw VTiles2 tile $08, AmublanceTiles

AmublanceTiles: INCBIN "gfx/tilesets/ambulance/1.2bpp"
	
	
CasinoSignFrames: dw VTiles2 tile $02, CasinoSignTiles

CasinoSignTiles: INCBIN "gfx/tilesets/casino/sign.2bpp"
	
TrainWindowFrames: dw VTiles2 tile $28, TrainWindowTiles

TrainWindowTiles: INCBIN "gfx/tilesets/trainwindows/1.2bpp"

TrainWindowFrames2: dw VTiles2 tile $38, TrainWindowTiles2

TrainWindowTiles2: INCBIN "gfx/tilesets/trainwindows/2.2bpp"
	
RippleFrames: dw VTiles2 tile $7d, RippleTiles

RippleTiles: INCBIN "gfx/tilesets/water/ripple.2bpp"
	
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

WaterfallPriority2Frames: dw VTiles2 tile $6c, Waterfall2PriorityTiles

Waterfall2PriorityTiles: INCBIN "gfx/tilesets/waterfall/priority/2.2bpp"

ShorelineFrames: dw VTiles2 tile $17, ShorelineTiles

ShorelineTiles: INCBIN "gfx/tilesets/shoreline/shore.2bpp"

SunbeamViewWaterFrames: dw VTiles2 tile $4e, SunbeamViewWaterTiles

SunbeamViewWaterTiles: INCBIN "gfx/tilesets/water/sunbeam_view.2bpp"

SunbeamViewWaterFrames2: dw VTiles2 tile $6c, SunbeamViewWaterTiles2

SunbeamViewWaterTiles2: INCBIN "gfx/tilesets/water/sunbeam_view2.2bpp"

SunbeamViewSmokeFrames: dw VTiles2 tile $48, SunbeamViewSmokeTiles

SunbeamViewSmokeTiles: INCBIN "gfx/tilesets/water/sunbeam_view3.2bpp"

PokeballSculptureFrames: dw VTiles2 tile $2c, PokeballSculptureTiles

PokeballSculptureTiles: INCBIN "gfx/tilesets/sculpture/1.2bpp"

PokeballSculptureFrames2: dw VTiles2 tile $3c, PokeballSculptureTiles2

PokeballSculptureTiles2: INCBIN "gfx/tilesets/sculpture/2.2bpp"

NewtonFrames: dw VTiles2 tile $0a, NewtonTiles

NewtonTiles: INCBIN "gfx/tilesets/newton/1.2bpp"

ClockFrames: dw VTiles2 tile $1a, ClockTiles

ClockTiles: INCBIN "gfx/tilesets/newton/2.2bpp"

FlagFrames: dw VTiles2 tile $30, FlagTiles

FlagTiles: INCBIN "gfx/tilesets/flag/1.2bpp"

FlagFrames2: dw VTiles2 tile $32, FlagTiles2

FlagTiles2: INCBIN "gfx/tilesets/flag/2.2bpp"

TwinkleFireplaceFrames: dw VTiles2 tile $48, TwinkleFireplaceTiles

TwinkleFireplaceTiles: INCBIN "gfx/tilesets/fireplace/1.2bpp"

FanFrames: dw VTiles2 tile $24, FanTiles

FanTiles: INCBIN "gfx/tilesets/fan/1.2bpp"

DesertLightFrames: dw VTiles2 tile $34, DesertLightTiles

DesertLightTiles: INCBIN "gfx/tilesets/desertlight/1.2bpp"

CaveWaterFrames: dw VTiles2 tile $01, WaterTiles

WaterFrames: dw VTiles2 tile $13, WaterTiles

WaterTiles: INCBIN "gfx/tilesets/water/water.2bpp"

SeaweedFrames: dw VTiles2 tile $12, SeaweedTiles

SeaweedTiles: INCBIN "gfx/tilesets/water/seaweed.2bpp"

TreeWindFrames: dw VTiles2 tile $7b, TreeWindTiles

TreeWindTiles: INCBIN "gfx/tilesets/forest-tree/1.2bpp"

CandleFrames: dw VTiles2 tile $62, CandleTiles

CandleTiles: INCBIN "gfx/tilesets/candles/1.2bpp"

	
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
	
	
WriteThreeTiles:

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 16
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr
	jp _FinishWritingSecondTile
	
WriteFourTiles:

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 24
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
	db $00, $10, $20, $30, $40, $50, $60, $70
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
	ld a, [wTimeOfDayPal]
	cp 3
	ret z

; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ldh a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
;	and 1 ; odd
	ret nz

; Ready for BGPD input...
	ld a, %10010100 ; auto increment, index $18 (pal 3 color 0)
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a

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
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wUnknBGPals + $04 ; pal 3 color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color3
	ld hl, wUnknBGPals + $02 ; pal 3 color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end
	
.color2
	ld hl, wUnknBGPals + $32 ; pal 3 color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret
; fc71e

TileAnimationPalette: ; fc6d7
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ldh a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...
	ld a, %10011000 ; auto increment, index $18 (pal 3 color 0)
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a

; Update color 0 in order 0 1 2 1

	ld a, l
	and %110 ; frames 0 2 4 6

	jr z, .color0

	cp 4
	jr z, .color2

.color1
	ld hl, wUnknBGPals + $1a ; pal 3 color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wUnknBGPals + $18 ; pal 3 color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color2
	ld hl, wUnknBGPals + $1c ; pal 3 color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret
; fc71e


FlickeringCaveEntrancePalette: ; fc71e
; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ldh a, [rBGP]
	cp %11100100
	ret nz
; We only want to be here if we're in a dark cave.
	ld a, [wTimeOfDayPalset]
	cp $ff ; 3,3,3,3
	ret nz

	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ldh [rBGPI], a
	ldh a, [hVBlankCounter]
	and %00000010
	jr nz, .bit1set
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	jr .okay

.bit1set
	ld hl, wUnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret
; fc750

FlickeringTVPalette: ; fc71e
; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ldh a, [rBGP]
	cp %11100100
	ret nz
; We only want to be here if we're in a dark cave.
;	ld a, [wTimeOfDayPalset]
;	cp $ff ; 3,3,3,3
;	ret nz

	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ldh [rBGPI], a
	ldh a, [hVBlankCounter]
	and %00000010
	jr nz, .bit1set
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	jr .okay

.bit1set
	ld hl, wUnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret
; fc750

FlickeringLightbulbPalette:
; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ldh a, [rBGP]
	cp %11100100
	ret nz

	ldh a, [hVBlankCounter]
	and %00000100
	ret nz
	
	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ldh [rBGPI], a
	call Random
	cp $cf ; 75 percent
	jr c, .on
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	jr .okay

.on
	ld hl, wUnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret
	
FlickeringSignPalette:
; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ldh a, [rBGP]
	cp %11100100
	ret nz

	ldh a, [hVBlankCounter]
	and %00000100
	ret nz
	
	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ldh [rBGPI], a
	call Random
	cp 75 percent
	jr nc, .on
	ld hl, wUnknBGPals + $20 ; pal 4 color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	ld a, %10100010 ; auto-increment, index $20 (pal 4 color 1)
	ldh [rBGPI], a
	ld hl, wUnknBGPals + $22 ; pal 4 color 0
	jr .okay

.on
	ld hl, wUnknBGPals + $24 ; pal 4 color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	ld a, %10100010 ; auto-increment, index $20 (pal 4 color 1)
	ldh [rBGPI], a
	ld hl, wUnknBGPals + $26 ; pal 4 color 2

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret
	
TileAnimationPaletteCasino: ; fc6d7
	ld a, [wMapGroup]
	cp GROUP_BRILLO_MART
	ret nz

; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ldh a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...
	ld a, %10010000 ; auto increment, index $18 (pal 3 color 0)
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ldh [rSVBK], a

; Update color 0 in order 0 1 2 1

	ld a, l
	and %110 ; frames 0 2 4 6

	jr z, .color0

	cp 4
	jr z, .color0
	
.color1
	ld hl, wUnknBGPals + $0e ; pal 3 color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wUnknBGPals + $10 ; pal 3 color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret

SproutPillarTilePointer1:  dw VTiles2 tile $2c, SproutPillarTile1
SproutPillarTilePointer2:  dw VTiles2 tile $2d, SproutPillarTile1
SproutPillarTilePointer3:  dw VTiles2 tile $2e, SproutPillarTile1
SproutPillarTilePointer4:  dw VTiles2 tile $2f, SproutPillarTile1
SproutPillarTilePointer5:  dw VTiles2 tile $3c, SproutPillarTile1
SproutPillarTilePointer6:  dw VTiles2 tile $3d, SproutPillarTile1
SproutPillarTilePointer7:  dw VTiles2 tile $3e, SproutPillarTile1
SproutPillarTilePointer8:  dw VTiles2 tile $3f, SproutPillarTile1
SproutPillarTilePointer9:  dw VTiles2 tile $7f, SproutPillarTile9
SproutPillarTilePointer10: dw VTiles2 tile $7f, SproutPillarTile10

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
