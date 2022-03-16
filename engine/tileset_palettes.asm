LoadBlindingFlashPalette:: ; 49409
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, BlindingFlashPalette
	ld bc, 1 palettes
	jp FarCopyWRAM
; 49418

LoadRouteSignPalette::
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, RouteSignPalette
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
	
LoadCaveSignPalette::
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, CaveSignPalette
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
	
LoadForestSignPalette::
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, ForestSignPalette
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
	
LoadRegularTextboxPalette::
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, RegularTextboxPalette
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

BlindingFlashPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc
; 49420

RouteSignPalette::
if !DEF(MONOCHROME)
	RGB 31, 00, 31
	RGB 00, 15, 09
	RGB 00, 00, 00
	RGB 31, 31, 31
else
	MONOCHROME_RGB_FOUR
endc

CaveSignPalette::
if !DEF(MONOCHROME)
	RGB 31, 00, 31
	RGB 27, 23, 20
	RGB 15, 10, 07
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc

ForestSignPalette::
if !DEF(MONOCHROME)
	RGB 31, 31, 00
	RGB 31, 28, 18
	RGB 14, 09, 00
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc

RegularTextboxPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc

LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]
	cp TILESET_STARGLOW_CAVERN
	jp z, .starglow_cavern
	cp TILESET_GROVE
	jp z, .grove
	cp TILESET_MOUNTAIN
	jp z, .mountain
	cp TILESET_JUNGLE
	jp z, .jungle
	cp TILESET_SNOW
	jp z, .checktent
	cp TILESET_RANCH
	jp z, .ranch
	cp TILESET_HAUNTED
	jp z, .spookhouse
	cp TILESET_HAUNTED_TV
	jp z, .spookhousetv
	cp TILESET_TRAIN
	jp z, .train
	cp TILESET_LUSTER
	jp z, .luster
	cp TILESET_PARK
	jp z, .park
	cp TILESET_AIRPORT
	jp z, .airport
	cp TILESET_MALL_1
	jp z, .mall
	cp TILESET_MALL_2
	jp z, .mall
	cp TILESET_SEWER
	jp z, .sewer
	cp TILESET_ICE_CAVE
	jp z, .ice_cave
	cp TILESET_PLAYER_HOUSE
	jp z, .playerhouse
	cp TILESET_PLAYER_ROOM
	jp z, .playerroom
	cp TILESET_GATE
	jp z, .gate
	cp TILESET_HOUSE_1
	jp z, .house1
	cp TILESET_HOUSE_2
	jp z, .house2
	cp TILESET_NETT_BUILDING
	jp z, .nett
	cp TILESET_SHIMMER
	jp z, .shimmer
	cp TILESET_LAB
	jp z, .lab
	cp TILESET_DESERT
	jp z, .desert
	cp TILESET_MART
	jp z, .mart
	jp .do_nothing
	
.mart
	ld a, [wMapGroup]
	cp GROUP_BRILLO_TOWN
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_BRILLO_GAME_CORNER
	jp nz, .desert_house
	ld hl, GameCornerPalette
	jp LoadSevenBGPalettes
	
.desert
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp z, .sandstorm
	ld hl, OutsideDesertPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 7 palettes
	call FarCopyWRAM
	ld a, [wMapGroup]
	cp GROUP_DESERT_WASTELAND_OASIS
	jp nz, .nett2_end
	ld a, [wMapNumber]
	cp MAP_BRILLO_TOWN
	jp z, .brillo
	cp MAP_DESERT_ROUTE_NORTH
	jp z, .desert_tent
	cp MAP_DESERT_WASTELAND_OASIS
	jr z, .oasis1
	cp MAP_DESERT_WASTELAND_8
	jr z, .oasis1
	jp .nett2_end
	
.sandstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .desert_tent
	ld hl, OutsideSandstormPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 7 palettes
	call FarCopyWRAM
	ld a, [wMapGroup]
	cp GROUP_DESERT_WASTELAND_OASIS
	jp nz, .nett2_end
	ld a, [wMapNumber]
	cp MAP_DESERT_WASTELAND_OASIS
	jr z, .oasis2
	cp MAP_DESERT_WASTELAND_8
	jr z, .oasis2
	jp .nett2_end
	
.oasis1
	ld hl, OasisPalette1
	jr .oasis_cont
.oasis2
	ld hl, OasisPalette2
.oasis_cont
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.desert_tent
	ld hl, OutsideDesertPalette
	call LoadSevenTimeOfDayBGPalettes
	ld hl, DesertTentPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.brillo
	ld hl, BrilloWindowPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.desert_house
	ld hl, DesertHousePalette
	jp LoadSevenBGPalettes
	
.house1
	ld a, [wMapGroup]
	cp GROUP_BRILLO_TOWN
	jr z, .desert_house
	cp GROUP_LUSTER_APARTMENT_5_2F
	jp nz, .house1_nope
	ld a, [wMapNumber]
	cp MAP_LUSTER_APARTMENT_5_2F
	jp nz, .house1_nope
	jp .spookhouse
.house1_nope
	jp .do_nothing
	
.house2
	ld a, [wMapGroup]
	cp GROUP_TWINKLE_TOWN
	jp nz, .do_nothing
	ld hl, TwinkleFireplacePalette
	ld de, wUnknBGPals + 4 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.lab
	ld a, [wMapGroup]
	cp GROUP_LUSTER_TRAIN_STATION
	jr z, .luster_train
	ld a, [wMapGroup]
	cp GROUP_SHIMMER_CITY
	jr z, .fossil_lab
	ld a, [wMapGroup]
	cp GROUP_AIRPORT
	jp nz, .do_nothing
	ld hl, AirportPalette
	ld de, wUnknBGPals + 4 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
.fossil_lab
	ld hl, FossilLabPalette
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.luster_train
	ld a, [wMapNumber]
	cp MAP_LUSTER_TRAIN_STATION
	jp nz, .do_nothing
	ld hl, LusterTrainPalette
	ld de, wUnknBGPals + 2 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.shimmer
	ld a, [wMapGroup]
	cp GROUP_SHIMMER_CITY
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_SHIMMER_UNDER_BOARDWALK
	jp nz, .do_nothing
	ld hl, BoardwalkPalette
	ld de, wUnknBGPals + 1 palettes
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.nett
	ld a, [wMapGroup]
	cp GROUP_NETT_BUILDING_1F
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_NETT_BUILDING_1F
	jp nz, .nett2
	ld hl, NettPalette
	ld de, wUnknBGPals + 4 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.nett2
	eventflagcheck EVENT_NETT_BUILDING_DUNGEON
	jr nz, .nett2_dark
	ld hl, Nett2Palette
	ld de, wUnknBGPals + 4 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld a, [wMapNumber]
	cp MAP_NETT_BUILDING_OFFICE
	jr nz, .nett2_end
	ld hl, Nett3Palette
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
.nett2_end
	scf
	ret
	
.nett2_dark
	ld hl, NettDarkPalette
	jp LoadSevenBGPalettes
	
.checktent
	ld a, [wMapNumber]
	cp MAP_ROUTE_10_EAST
	jp z, .snowtent
	jp .snow
	
.starglow_cavern
	ld hl, StarglowCavernPalette
	jp LoadSevenBGPalettes
	
.grove
	ld a, [wPermission]
	cp INDOOR
	ret z
	ld hl, OutsideGrovePalette
	jp LoadSevenTimeOfDayBGPalettes
	
.mountain
	ld hl, OutsideMountainPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.jungle
	ld hl, OutsideJunglePalette
	jp LoadSevenTimeOfDayBGPalettes
	
.snow
	eventflagcheck EVENT_SNOWSTORM_HAPPENING
	jr nz, .snowstorm
	ld hl, OutsideSnowPalette
	jp LoadSevenTimeOfDayBGPalettes

.snowstorm
	ld hl, OutsideSnowStormPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.snowtent
	eventflagcheck EVENT_SNOWSTORM_HAPPENING
	jr nz, .snowstormtent
	ld hl, OutsideSnowTentPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.snowstormtent
	ld hl, OutsideSnowStormTentPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.ranch
	ld hl, OutsideRanchPalette
	jp LoadSevenTimeOfDayBGPalettes

.spookhouse
	ld hl, SpookhousePalette
	jp LoadSevenBGPalettes
	
.spookhousetv
	ld hl, SpookhouseTVPalette
	jp LoadSevenBGPalettes
	
.train
	ld hl, TrainPalette
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.luster
	ld a, [wMapNumber]
	cp MAP_LUSTER_CITY_BUSINESS
	jp z, .lusterbusiness
	ld hl, OutsideLusterPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.lusterbusiness
	ld hl, OutsideLusterBusinessPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.park
	ld hl, OutsideRanchPalette
	call LoadSevenTimeOfDayBGPalettes
	ld hl, OutsideSkateparkPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.airport
	ld a, [wMapNumber]
	cp MAP_ONWA_INTL_AIRPORT
	jp z, .airport_cont
	cp MAP_AIRPORT_RUNWAY
	jp nz, .construction
.airport_cont
	ld hl, OutsideLusterPalette
	call LoadSevenTimeOfDayBGPalettes
	ld hl, AirportFencePalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.construction
	ld hl, OutsideLusterPalette
	call LoadSevenTimeOfDayBGPalettes
	ld hl, ConstructionPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.mall
	ld hl, MallPalette
	jp LoadSevenBGPalettes
	
.sewer
	ld hl, LusterSewerPalette
	call LoadSevenBGPalettes
	ld a, [wMapNumber]
	cp MAP_LUSTER_SEWERS_MUK_ROOM
	jr z, .muk_room
	eventflagcheck EVENT_CLEARED_LUSTER_SEWERS
	ret z
.sewer_return
	ld hl, LusterSewerPalette + 7 palettes
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.muk_room
	eventflagcheck EVENT_LUSTER_SEWERS_BEAT_MUK
	ret z
	jr .sewer_return
	
.ice_cave
	eventflagcheck EVENT_TORCH_LIT
	jr nz, .torch
	ld hl, IceCavePalette
	jp LoadSevenBGPalettes

.torch
	ld hl, IceCaveTorchPalette
	jp LoadSevenBGPalettes
	
.playerroom
	ld hl, PlayerRoomFloorPalette
	jp LoadSevenBGPalettes
	
.gate
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp nz, .do_nothing
	ld hl, SunbeamViewPalette
	jp LoadForceSevenTimeOfDayBGPalettes
	
.playerhouse
	ld a, [wMapGroup]
	cp GROUP_TWINKLE_GYM_ENTRY
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_TWINKLE_GYM_BLUE_ROOM
	jr z, .blue_room
	cp MAP_TWINKLE_GYM_YELLOW_ROOM
	jr z, .yellow_room
	cp MAP_TWINKLE_GYM_RED_ROOM
	jr z, .red_room
	jr .do_nothing
.blue_room
	eventflagcheck EVENT_BLUE_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_BLUE_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_BLUE_ROOM_STEAM_3
	jr nz, .steam3
	ld hl, TwinkleGym4Palette
	jp LoadSevenBGPalettes
.yellow_room
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_3
	jr nz, .steam3
	ld hl, TwinkleGym4Palette
	jp LoadSevenBGPalettes
.red_room
	eventflagcheck EVENT_RED_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_RED_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_RED_ROOM_STEAM_3
	jr nz, .steam3
	ld hl, TwinkleGym4Palette
	jp LoadSevenBGPalettes
.steam1
	ld hl, TwinkleGym1Palette
	jp LoadSevenBGPalettes
.steam2
	ld hl, TwinkleGym2Palette
	jp LoadSevenBGPalettes
.steam3
	ld hl, TwinkleGym3Palette
	jp LoadSevenBGPalettes
	
.do_nothing
	and a
	ret
	
LoadSevenBGPalettes: ; 494f2
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 7 palettes
	call FarCopyWRAM
	scf
	ret
	
LoadSevenTimeOfDayBGPalettes:
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 7 palettes
	call FarCopyWRAM
	scf
	ret
	
LoadForceSevenTimeOfDayBGPalettes:
	ld a, [wTimeOfDay]
	and 3
	ld bc, 8 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 7 palettes
	call FarCopyWRAM
	scf
	ret
	
MartBluePalette:
if !DEF(MONOCHROME)
	RGB 20, 27, 28
	RGB 06, 22, 25
	RGB 04, 17, 19
	RGB 07, 07, 07
else
	MONOCHROME_RGB_FOUR
endc

LinkTrade_Layout_FillBox: ; 49336
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 49346

InitLinkTradePalMap: ; 49856
	hlcoord 0, 0, wAttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, wAttrMap
	ldcoord_a 0, 14, wAttrMap
	hlcoord 2, 0, wAttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTrade_Layout_FillBox
	hlcoord 2, 8, wAttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTrade_Layout_FillBox
	hlcoord 0, 16, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, wAttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LoadLinkTradePalette: ; 49811
	ret

LoadSpecialMapOBPalette:
	ret

GameCornerPalette:
INCLUDE "maps/palettes/bgpals/gamecorner.pal"
	
DesertHousePalette:
INCLUDE "maps/palettes/bgpals/deserthouse.pal"
	
StarglowCavernPalette:
INCLUDE "maps/palettes/bgpals/starglow_cavern.pal"

SpookhousePalette:
INCLUDE "maps/palettes/bgpals/spookhouse.pal"

SpookhouseTVPalette:
INCLUDE "maps/palettes/bgpals/spookhousetv.pal"

TrainPalette:
INCLUDE "maps/palettes/bgpals/train.pal"

FossilLabPalette:
INCLUDE "maps/palettes/bgpals/fossillab.pal"

AirportPalette:
INCLUDE "maps/palettes/bgpals/airport.pal"

TwinkleFireplacePalette:
INCLUDE "maps/palettes/bgpals/twinklefireplace.pal"

BoardwalkPalette:
INCLUDE "maps/palettes/bgpals/boardwalk.pal"

NettPalette:
INCLUDE "maps/palettes/bgpals/nett.pal"

Nett2Palette:
INCLUDE "maps/palettes/bgpals/nett2.pal"

Nett3Palette:
INCLUDE "maps/palettes/bgpals/nett3.pal"

NettDarkPalette:
INCLUDE "maps/palettes/bgpals/nettdark.pal"

MallPalette:
INCLUDE "maps/palettes/bgpals/lustermall.pal"

LusterSewerPalette:
INCLUDE "maps/palettes/bgpals/lustersewer.pal"

IceCavePalette:
INCLUDE "maps/palettes/bgpals/icecave.pal"

IceCaveTorchPalette:
INCLUDE "maps/palettes/bgpals/icecavetorch.pal"

TwinkleGym1Palette:
INCLUDE "maps/palettes/bgpals/twinklegym1.pal"

TwinkleGym2Palette:
INCLUDE "maps/palettes/bgpals/twinklegym2.pal"

TwinkleGym3Palette:
INCLUDE "maps/palettes/bgpals/twinklegym3.pal"

TwinkleGym4Palette:
INCLUDE "maps/palettes/bgpals/twinklegym4.pal"

PlayerRoomFloorPalette:
INCLUDE "maps/palettes/bgpals/playerroom.pal"

OutsideGrovePalette:
INCLUDE "maps/palettes/bgpals/bggrove.pal"

OutsideMountainPalette:
INCLUDE "maps/palettes/bgpals/bgmountain.pal"

OutsideJunglePalette:
INCLUDE "maps/palettes/bgpals/bgjungle.pal"

OutsideSnowPalette:
INCLUDE "maps/palettes/bgpals/bgsnow.pal"

OutsideSnowTentPalette:
INCLUDE "maps/palettes/bgpals/bgsnowtent.pal"

OutsideSnowStormPalette:
INCLUDE "maps/palettes/bgpals/bgsnowstorm.pal"

OutsideSandstormPalette:
INCLUDE "maps/palettes/bgpals/bgsandstorm.pal"

OutsideSnowStormTentPalette:
INCLUDE "maps/palettes/bgpals/bgsnowstormtent.pal"

OutsideRanchPalette:
INCLUDE "maps/palettes/bgpals/bgranch.pal"

OutsideLusterPalette:
INCLUDE "maps/palettes/bgpals/bgluster.pal"

OutsideLusterBusinessPalette:
INCLUDE "maps/palettes/bgpals/bglusterbusiness.pal"

OutsideSkateparkPalette:
INCLUDE "maps/palettes/bgpals/bgskatepark.pal"

OutsideDesertPalette:
INCLUDE "maps/palettes/bgpals/bgdesert.pal"

SunbeamViewPalette:
INCLUDE "maps/palettes/bgpals/sunbeamview.pal"

LusterTrainPalette:
INCLUDE "maps/palettes/bgpals/lustertrain.pal"

DesertTentPalette:
INCLUDE "maps/palettes/bgpals/deserttent.pal"

OasisPalette1:
INCLUDE "maps/palettes/bgpals/oasis1.pal"

OasisPalette2:
INCLUDE "maps/palettes/bgpals/oasis2.pal"

BrilloWindowPalette:
INCLUDE "maps/palettes/bgpals/brillo.pal"

AirportFencePalette:
INCLUDE "maps/palettes/bgpals/airportfence.pal"

ConstructionPalette:
INCLUDE "maps/palettes/bgpals/construction.pal"

