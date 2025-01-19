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
	RGB 31, 31, 31
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
	cp TILESET_CAVE
	jp z, .cave
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
	cp TILESET_GATE
	jp z, .gate
	cp TILESET_HOUSE_1
	jp z, .house1
	cp TILESET_HOUSE_2
	jp z, .house2
	cp TILESET_ORPHANAGE
	jp z, .orphanage
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
	cp TILESET_HIGHWAY
	jp z, .highway
	cp TILESET_DIVE
	jr z, .underwater
	cp TILESET_BAR
	jr z, .bar
	cp TILESET_AUTUMN
	jp z, .autumn
	cp TILESET_GREEN_CAVE
	jp z, .green_cave
	cp TILESET_SOUTH_BUILDINGS
	jp z, .south_buildings
	call DiveSpotMapPals
	jp nc, .do_nothing
	ld hl, DiveSpotsPalette
	call LoadTimeofDayBGPal6
	jp .do_nothing
.green_cave
	ld a, [wMapNumber]
	cp MAP_GREEN_GROTTO_1F
	jr z, .green_cave_cont
	cp MAP_GREEN_GROTTO_B1F
	jr nz, .pink_cave
.green_cave_cont
	ld hl, GreenCavePalette
	jp LoadSevenBGPalettes
.pink_cave
	ld hl, PinkCavePalette
	jp LoadSevenBGPalettes
.bar
	ld hl, BarPalette
	jp LoadSevenBGPalettes
.underwater
	ld hl, UnderwaterPalette
	call LoadSevenBGPalettes
	ld a, [wMapGroup]
	cp GROUP_ROUTE_14_15_UNDERWATER
	ret nz
	ld a, [wMapNumber]
	cp MAP_UNDERWATER_TEMPLE_1
	jr nz, .not_temple
	eventflagcheck EVENT_UNDERWATER_TEMPLE_GREEN
	jr z, .underwater_temple
.not_temple
	cp MAP_ROUTE_14_15_UNDERWATER
	ret nz
	eventflagcheck EVENT_ROUTE_14_15_UNDERWATER_EASTER_EGG
	jr z, .underwater_eyes_dark
	ld hl, UnderwaterEyesPalette + 1 palettes
	jr .underwater_end
.underwater_temple
	ld hl, UnderwaterBrownPalette
	ld de, wUnknBGPals + 2 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
.underwater_eyes_dark
	ld hl, UnderwaterEyesPalette
.underwater_end
	ld de, wUnknBGPals + 1 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.cave
	ld a, [wTimeOfDayPal]
	cp 3
	jr z, .dark
	ld a, [wMapGroup]
	cp GROUP_SEASIDE_CAVE_1F
	jp z, .do_nothing
	cp GROUP_CONNECTING_CAVERN
	jp z, .starglow_cavern
	ld de, wUnknBGPals + 3 palettes
	ld hl, StarglowCavernPalette + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.dark
	ld hl, DarkCavePalette
	jp LoadSevenBGPalettes
	
.mart
	ld a, [wMapGroup]
	cp GROUP_BRILLO_TOWN
	jp nz, .do_nothing
	ld a, [wMapNumber]
	cp MAP_BRILLO_GAME_CORNER
	jp nz, .desert_house
	ld hl, GameCornerPalette
	jp LoadSevenBGPalettes
	
.highway
	ld a, [wMapNumber]
	cp MAP_CROSSROADS
	jr z, .crossroads
	cp MAP_ROUTE_22_TUNNEL
	jr z, .highway_tunnel
	cp MAP_BAR_BACK_ALLEY
	jr z, .back_alley
	ld hl, HighwayPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 3 palettes
	rst AddNTimes
	ld de, wUnknBGPals + 4 palettes
	ld bc, 3 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
.crossroads
	ld hl, CrossroadsPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 4 palettes
	rst AddNTimes
	ld de, wUnknBGPals + 3 palettes
	ld bc, 4 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.back_alley
	ld hl, BarBackAlleyPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 3 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 4 palettes
	ld bc, 3 palettes
	call FarCopyWRAM
	scf
	ret
	
.highway_tunnel
	ld hl, HighwayTunnelPalette
	jp LoadSevenTimeOfDayBGPalettes
	
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
	cp GROUP_DESERT_TEMPLE_1
	jr z, .deserttemple
	cp GROUP_UNDERWATER_TEMPLE_2
	jr z, .underwater_temple_dive
	cp GROUP_DESERT_WASTELAND_OASIS
	jp nz, .nett2_end
	ld a, [wMapNumber]
	cp MAP_BRILLO_TOWN
	jp z, .brillo
	cp MAP_ROUTE_18_NORTH
	jp z, .desert_tent
	cp MAP_DESERT_WASTELAND_OASIS
	jr z, .oasis1
	cp MAP_DESERT_WASTELAND_8
	jr z, .oasis1
	jp .nett2_end
	
.underwater_temple_dive
	ld hl, DiveSpotsPalette
	jp LoadTimeofDayBGPal6
.deserttemple
	ld hl, DesertTemplePalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 2 palettes
	rst AddNTimes
	ld a, $5
	ld de, wUnknBGPals + 2 palettes
	ld bc, 2 palettes
	call FarCopyWRAM
	scf
	ret
	
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
	jp LoadTimeofDayBGPal6
	
.desert_tent
	ld hl, OutsideDesertPalette
	call LoadSevenTimeOfDayBGPalettes
	ld hl, DesertTentPalette
	jp LoadTimeofDayBGPal6
	
.brillo
	ld hl, BrilloWindowPalette
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
	
.desert_house
	ld hl, DesertHousePalette
	jp LoadSevenBGPalettes
	
.house1
	ld a, [wMapGroup]
	cp GROUP_BRILLO_TOWN
	jr z, .desert_house
	cp GROUP_LUSTER_APARTMENT_5_2F
	jp z, .house_1_cont
	cp GROUP_DUSK_TURNPIKE
	jp nz, .do_nothing
.house_1_cont
	ld a, [wMapNumber]
	cp MAP_LUSTER_APARTMENT_5_2F ;same map number as DUSK_HOUSE_2
	jp nz, .do_nothing
	jp .spookhouse
	jp .do_nothing
	
.orphanage
	ld a, [wMapNumber]
	cp MAP_RADIANT_ORPHANAGE_2F
	jr z, .orphanage_beds
	ld de, wUnknBGPals + 6 palettes
	jr .house2_cont
.house2
	ld a, [wMapGroup]
	cp GROUP_TWINKLE_TOWN
	jp nz, .do_nothing
	ld de, wUnknBGPals + 4 palettes
.house2_cont
	ld hl, TwinkleFireplacePalette
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret
	
.orphanage_beds
	ld hl, OrphanageBedsPalette
	jp LoadSevenBGPalettes
	
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
	jp LoadBGPal6
	
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
	cp MAP_ROUTE_10
	jp z, .snowwater
	jp .snow
	
.starglow_cavern
	ld a, [wTimeOfDayPal]
	cp 3
	jp z, .dark
	ld hl, StarglowCavernPalette
	jp LoadSevenBGPalettes
	
.grove
	ld a, [wMapGroup]
	cp GROUP_RADIANT_TOWNSHIP
	jr z, .radiant
	ld a, [wPermission]
	cp INDOOR
	ret z
	ld hl, OutsideGrovePalette
	jp LoadSevenTimeOfDayBGPalettes
	
.radiant
	ld a, [wMapNumber]
	cp MAP_RADIANT_FIELD
	jp nz, .do_nothing
	ld hl, FlowerFieldPalette
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
	
.snowwater
	eventflagcheck EVENT_SNOWSTORM_HAPPENING
	jr nz, .snowstormwater
	ld hl, OutsideSnowWaterPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.snowstormwater
	ld hl, OutsideSnowStormWaterPalette
	jp LoadSevenTimeOfDayBGPalettes
	
.autumn
	ld a, [wMapNumber]
	cp MAP_ROUTE_27
	jr z, .construction2
	cp MAP_ROUTE_26
	jr z, .komore
	cp MAP_KOMORE_VILLAGE
	jr nz, .ranch
.komore
	ld hl, AutumnPalette
	jr .ranch_finish
.construction2
	ld hl, ConstructionPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld de, wUnknBGPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
.ranch
	ld hl, OutsideRanchPalette
	
.ranch_finish
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld de, wUnknBGPals + 2 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
	ret

.spookhouse
	ld a, [wMapGroup]
	cp GROUP_KOMORE_VILLAGE
	jr nz, .spookhouse_cont
	ld a, [wMapNumber]
	cp MAP_KOMORE_COMMUNITY_CENTER_RIGHT
	jr z, .spookhouse_cont
	ld hl, KomoreCommunityCenterPalette
	jp LoadSevenTimeOfDayBGPalettes
.spookhouse_cont
	ld hl, SpookhousePalette
	jp LoadSevenBGPalettes
	
.spookhousetv
	ld hl, SpookhouseTVPalette
	jp LoadSevenBGPalettes
	
.train
	ld hl, TrainPalette
	jp LoadBGPal6
	
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
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld de, wUnknBGPals + 2 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ld a, [wMapNumber]
	cp MAP_ROUTE_11
	jp z, .route11
	ld hl, OutsideSkateparkPalette
	jp LoadTimeofDayBGPal6
.route11
	ld hl, DiveSpotsPalette
	jp LoadTimeofDayBGPal6
	
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
	jp LoadTimeofDayBGPal6
	
.construction
	ld hl, OutsideLusterPalette
	call LoadSevenTimeOfDayBGPalettes
	ld hl, ConstructionPalette
	jp LoadTimeofDayBGPal6
	
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
	
.gate
	ld a, [wMapGroup]
	cp GROUP_FAKE_ROUTE_1
	jr nz, .gate2
	ld hl, FakeRoute1Palette
	jp LoadSevenBGPalettes
.gate2
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp nz, .do_nothing
	ld hl, SunbeamViewPalette
	jp LoadForceSevenTimeOfDayBGPalettes
	
.south_buildings
	ld a, [wMapGroup]
	cp GROUP_OBSCURA_MUSEUM_2F
	jp nz, .do_nothing
	ld hl, MuseumPalette
	jp LoadBGPal6
	jr .do_nothing
	
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
	
DiveSpotMapPals:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_6
	jr z, .route6
	cp GROUP_ROUTE_13
	jr z, .route13
	cp GROUP_ROUTE_14
	jr z, .route14
	xor a
	ret
.route6
	ld a, [wMapNumber]
	cp MAP_ROUTE_6
	jr z, .yes
	cp MAP_ROUTE_6_SOUTH
	jr z, .yes
	xor a
	ret
.route13
	ld a, [wMapNumber]
	cp MAP_ROUTE_13
	jr z, .yes
	xor a
	ret
.route14
	ld a, [wMapNumber]
	cp MAP_ROUTE_14
	jr z, .yes
	cp MAP_ROUTE_15
	jr z, .yes
	xor a
	ret
.yes
	scf
	ret
	
LoadTimeofDayBGPal6:
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	rst AddNTimes
	ld a, $5
LoadBGPal6:
	ld de, wUnknBGPals + 6 palettes
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	scf
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

OrphanageBedsPalette:
INCLUDE "maps/palettes/bgpals/orphanagebeds.pal"

FlowerFieldPalette:
INCLUDE "maps/palettes/bgpals/radiantfield.pal"

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

MuseumPalette::
INCLUDE "maps/palettes/bgpals/museum.pal"

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

FakeRoute1Palette:
INCLUDE "maps/palettes/bgpals/fakeroute1.pal"

OutsideGrovePalette:
INCLUDE "maps/palettes/bgpals/bggrove.pal"

OutsideMountainPalette:
INCLUDE "maps/palettes/bgpals/bgmountain.pal"

OutsideJunglePalette:
INCLUDE "maps/palettes/bgpals/bgjungle.pal"

OutsideSnowPalette:
INCLUDE "maps/palettes/bgpals/bgsnow.pal"

OutsideSnowWaterPalette:
INCLUDE "maps/palettes/bgpals/bgsnowwater.pal"

OutsideSnowStormWaterPalette:
INCLUDE "maps/palettes/bgpals/bgsnowstormwater.pal"

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

HighwayPalette:
INCLUDE "maps/palettes/bgpals/highway.pal"

CrossroadsPalette:
INCLUDE "maps/palettes/bgpals/crossroads.pal"

HighwayTunnelPalette:
INCLUDE "maps/palettes/bgpals/highwaytunnel.pal"

KomoreCommunityCenterPalette:
INCLUDE "maps/palettes/bgpals/communitycenter.pal"

DarkCavePalette:
INCLUDE "maps/palettes/bgpals/darkcave.pal"

DesertTemplePalette:
INCLUDE "maps/palettes/bgpals/deserttemple.pal"

BarBackAlleyPalette:
INCLUDE "maps/palettes/bgpals/backalley.pal"

UnderwaterPalette:
INCLUDE "maps/palettes/bgpals/underwater.pal"

UnderwaterEyesPalette:
INCLUDE "maps/palettes/bgpals/underwatereyes.pal"

BarPalette::
INCLUDE "maps/palettes/bgpals/bar.pal"

GreenCavePalette::
INCLUDE "maps/palettes/bgpals/greencave.pal"

PinkCavePalette::
INCLUDE "maps/palettes/bgpals/pinkcave.pal"

DiveSpotsPalette::
INCLUDE "maps/palettes/bgpals/divespots.pal"

AutumnPalette::
INCLUDE "maps/palettes/bgpals/autumn.pal"

ObscuraYellowPalette::
INCLUDE "maps/palettes/bgpals/obscurayellow.pal"

UnderwaterBrownPalette::
INCLUDE "maps/palettes/bgpals/underwaterbrown.pal"
