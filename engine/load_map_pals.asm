LightUpPlayerPal:
	ld a, [wIsNearCampfire]
	bit 0, a
	ret z
	ld a, [wPlayerPalette]
	ld bc, 1 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld a, 1
	and 3
	ld bc, 8 palettes
	call AddNTimes
	farcall LoadPlayerPalettewUnknOBPalsDe
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
LightUpPlayerPalTimeOfDay:
	ld a, [wIsNearCampfire]
	bit 0, a
	ret z
	ld a, [wPlayerPalette]
	ld bc, 1 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	call AddNTimes
	call LoadPlayerPalettewUnknOBPalsDe
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

LoadSingleOBTimeofDayPalLinePal7:
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM

LoadSingleOBPalLinePal7:
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	ret
	
MakeCutFlowerRed::
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

LoadMapPals::
;	farcall LoadSpecialMapPalette
;	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wPermission]
	and 7
	ld e, a
	ld d, 0
	ld hl, .TilesetColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [wTimeOfDayPal]
	and 3
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	; Switch to palettes WRAM bank
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wUnknBGPals
	ld b, 7
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ldh [rSVBK], a

.got_pals
	farcall LoadSpecialMapPalette
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wMapGroup]
	cp GROUP_LAKE_ONWA
	jp z, .rockscheck1
	cp GROUP_ROUTE_3
	jp z, .rockscheck2
	cp GROUP_SUNBEAM_ISLAND
	jp z, .sunbeam
	cp GROUP_SUNSET_BAY
	jp z, .sunset
	cp GROUP_SKATEPARK
	jp z, .skateparkcheck
	cp GROUP_SHIMMER_CITY
	jp z, .shimmer
	cp GROUP_RADIANT_TOWNSHIP
	jp z, .sunflowers
	cp GROUP_ROUTE_29
	jp z, .route_29
.got_pals_cont
	ld a, [wTileset]
	cp TILESET_LAVA_CAVE
	jp z, .rocks
	cp TILESET_CAVE
	jp z, .cave
	cp TILESET_STARGLOW_CAVERN
	jp z, .starglow
	cp TILESET_RANCH
	jp z, .ranch
	cp TILESET_PARK
	jp z, .park
	cp TILESET_AIRPORT
	jp z, .airport
	cp TILESET_SNOW
	jp z, .snow
	cp TILESET_LUSTER
	jp z, .luster
	cp TILESET_MALL_1
	jp z, .lustermall
	cp TILESET_MALL_2
	jp z, .lustermall2
	cp TILESET_SEWER
	jp z, .sewer
	cp TILESET_ICE_CAVE
	jp z, .ice_cave
	cp TILESET_PLAYER_HOUSE
	jp z, .playerhouse
	cp TILESET_PLAYER_ROOM
	jp z, .playerroom
	cp TILESET_JUNGLE
	jp z, .jungle
	cp TILESET_GATE
	jp z, .gate
	cp TILESET_HOUSE_1
	jp z, .house1
	cp TILESET_NETT_BUILDING
	jp z, .nett
	cp TILESET_DESERT
	jp z, .desert
	cp TILESET_MART
	jp z, .mart
	cp TILESET_LAB
	jp z, .lab
	cp TILESET_HIGHWAY
	jp z, .highway
	cp TILESET_HIGHWAY_2
	jp z, .highway2
	cp TILESET_HAUNTED
	jp z, .haunted
	cp TILESET_DIVE
	jp z, .underwater
	cp TILESET_BAR
	jr z, .bar
	cp TILESET_AUTUMN
	jp z, .autumn
	cp TILESET_GROVE
	jr z, .grove
	cp TILESET_SOUTH_BUILDINGS
	jp z, .south_buildings
	cp TILESET_GREEN_CAVE
	jp z, .green_cave
	jp .normal
.green_cave
	ld a, [wMapNumber]
	cp MAP_GLINT_GROVE_DEEP
	jp z, .coffee
	jp .normal
.route_29
	ld a, [wMapNumber]
	cp MAP_ROUTE_29_MEADOW
	jp z, .sailboat
	jp .normal
.grove
	ld a, [wMapNumber]
	cp MAP_GLINT_GROVE_EAST
	jp nz, .normal
	ld a, [wYCoord]
	cp $11
	jp c, .normal
	jp .rocks
.bar
	ld a, [wPlayerPalette]
	cp 4
	jr z, .bar_purple
	ld de, wUnknOBPals + 4 palettes
	jr .bar_cont
.bar_purple
	ld de, wUnknOBPals + 5 palettes
.bar_cont
	ld hl, MapObjectPalsBar
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .bar_one
	cp 2
	jr z, .bar_two
	cp 3
	jr z, .bar_three
	cp 4
	jr z, .bar_four
	cp 5
	jr z, .bar_five
.bar_zero
	ld hl, MapObjectPalsJukebox
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.bar_one
	ld hl, MapObjectPalsJukebox + 1 palettes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.bar_two
	ld hl, MapObjectPalsJukebox + 2 palettes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.bar_three
	ld hl, MapObjectPalsJukebox + 3 palettes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.bar_four
	ld hl, MapObjectPalsJukebox + 4 palettes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.bar_five
	ld hl, MapObjectPalsJukebox + 5 palettes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.underwater
	ld a, [wPlayerPalette]
	cp 4
	jr z, .underwater_purple
	ld hl, MapObjectPalsUnderwater
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jr .underwater_cont
.underwater_purple
	ld hl, MapObjectPalsUnderwaterPurple
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
.underwater_cont
	ld a, [wMapNumber]
	cp MAP_UNDERWATER_TEMPLE_OUTSIDE
	jr z, .underwater_temple
	cp MAP_UNDERWATER_TEMPLE_1
	ret nz
.underwater_temple
	ld hl, MapObjectPalsCoralShards
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.cave
	ld a, [wMapGroup]
	cp GROUP_RIVER_RAPIDS
	jp z, .umbrella
	ld a, [wTimeOfDayPal]
	cp 3
	jp nz, .rockscheck3
.dark
	ld hl, MapObjectPalsDark
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.playerhouse
	ld a, [wMapGroup]
	cp GROUP_TWINKLE_GYM_ENTRY
	jp nz, .normal
	ld a, [wMapNumber]
	cp MAP_TWINKLE_GYM_BLUE_ROOM
	jp z, .blue_room
	cp MAP_TWINKLE_GYM_YELLOW_ROOM
	jp z, .yellow_room
	cp MAP_TWINKLE_GYM_RED_ROOM
	jp z, .red_room
	jp .normal
.mart
	ld a, [wMapGroup]
	cp GROUP_BRILLO_TOWN
	jp nz, .normal
	ld a, [wMapNumber]
	cp MAP_BRILLO_GAME_CORNER
	jp nz, .normal
	call .normal
	ld hl, MapObjectPalsCasino
	call LoadSingleOBPalLinePal7
	call FarCopyWRAM
	ld a, [wPlayerPalette]
	cp 3
	jr z, .casinobrown
	ld hl, MapObjectPalsCasino2
	ld de, wUnknOBPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.casinobrown
	ld hl, MapObjectPalsCasino2
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.desert
	ld a, [wMapGroup]
	cp GROUP_DESERT_TEMPLE_1
	jr z, .desert_cont
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp z, .sandstorm
	ld a, [wMapNumber]
	cp MAP_BRILLO_TOWN
	jp z, .brillo
	cp MAP_ROUTE_18_NORTH
	jp z, .desertfire
	cp MAP_DESERT_WASTELAND_OASIS
	jp z, .oasis
.desert_cont
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsSand
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.brillo
	ld a, [wXCoord]
	cp $1F
	jp c, .sailboat
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsMaractusGraffiti
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.oasis
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, StandardGrassPalette
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.sandstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .desertfire
	ld a, [wTimeOfDayPal]
	and 3
	
	ld bc, 8 palettes
	ld hl, MapObjectPalsSandstorm
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.desertfire
	call LightUpPlayerPal
	
	ld a, 1
	and 3
	ld hl, MapObjectPalsRocks
	call AddNTimes
	call LoadSingleOBPalLinePal7
	call FarCopyWRAM
	
	jp .fire
	
.jungle
	ld a, [wMapNumber]
	cp MAP_SUNBEAM_JUNGLE
	jp nz, .outside
	ld a, [wXCoord]
	cp $11
	jp nc, .normal
	cp $5
	jp c, .normal
	ld a, [wYCoord]
	cp $19
	jp nc, .normal
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsWaterfallCave
	call AddNTimes
.copy_single_pal_to_pal_7
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.nett
	ld a, [wMapGroup]
	cp GROUP_NETT_BUILDING_1F
	ld a, [wMapNumber]
	jp nz, .computer
	cp MAP_NETT_BUILDING_1F
	jr nz, .nett2
	call .normal
	ld hl, MapObjectPalsNett
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
	
.nett2
	eventflagcheck EVENT_NETT_BUILDING_DUNGEON
	jr nz, .nett2_dark
	call .normal
	ld hl, MapObjectPalsNett2
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.nett2_dark
	ld hl, MapObjectPalsNettDark
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.playerroom
	ld hl, MapObjectPalsPlayerRoom
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.south_buildings
	ld a, [wMapGroup]
	cp GROUP_OBSCURA_MUSEUM_3F
	jr nz, .computer
	ld a, [wMapNumber]
	cp MAP_OBSCURA_MUSEUM_2F
	jr z, .standee
	cp MAP_OBSCURA_MUSEUM_PHOTO
	jr z, .standee
	cp MAP_OBSCURA_MUSEUM_3F
	jr z, .museum
.computer
	call .normal
	ld hl, MapObjectPalsComputer
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.museum
	ld hl, MapObjectPalsMuseum
	ld a, [wPlayerPalette]
	cp 4
	jr z, .museum_purple
	ld de, wUnknOBPals + 4 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.museum_purple
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.standee
	ld a, 1
	ld bc, 1 palettes
	ld hl, MapObjectPalsMuseum
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.highway2
	ld a, [wMapNumber]
	cp MAP_ROUTE_32
	jr z, .route_32
	cp MAP_ROUTE_11_2
	jp nz, .highway
	ld a, [wYCoord]
	cp $25
	jp c, .highway
.bone
	call .normal
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsBone
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.route_32
	ld a, [wYCoord]
	cp $21
	jp c, .park
	jp .rocks
	
.gate
	ld a, [wMapGroup]
	cp GROUP_FAKE_ROUTE_1
	jr z, .fake_route_1
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jp nz, .computer
	ld a, [wTimeOfDay]
	and 3
	ld bc, 3 palettes
	ld hl, MapObjectPalsSunbeamView
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 3 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
.fake_route_1
	ld hl, MapObjectPalsFakeRoute1
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.blue_room
	eventflagcheck EVENT_BLUE_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_BLUE_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_BLUE_ROOM_STEAM_3
	jr nz, .steam3
	jr .no_steam
.yellow_room
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_YELLOW_ROOM_STEAM_3
	jr nz, .steam3
	jr .no_steam
.red_room
	eventflagcheck EVENT_RED_ROOM_STEAM_1
	jr nz, .steam1
	eventflagcheck EVENT_RED_ROOM_STEAM_2
	jr nz, .steam2
	eventflagcheck EVENT_RED_ROOM_STEAM_3
	jr nz, .steam3
	jr .no_steam
.steam1
	ld hl, MapObjectPalsTwinkleGym1
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.steam2
	ld hl, MapObjectPalsTwinkleGym2
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.steam3
	ld hl, MapObjectPalsTwinkleGym3
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.no_steam
	ld hl, MapObjectPalsTwinkleGym4
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM

.ice_cave
	ld a, [wPlayerPalette]
	cp 4
	jr z, .ice_cave_purple
	eventflagcheck EVENT_TORCH_LIT
	jr nz, .torch
	ld a, [wTimeOfDayPal]
	jr .ice_cave_cont
.torch
	ld a, 1
.ice_cave_cont
	and 3
	ld bc, 8 palettes
	eventflagcheck EVENT_MAMOSWINE_CUTSCENE
	jr z, .not_mamo
	ld hl, MapObjectPalsIceCave2
	jr .ice_cave_cont2
.not_mamo
	ld hl, MapObjectPalsIceCave
.ice_cave_cont2
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.ice_cave_purple
	eventflagcheck EVENT_TORCH_LIT
	jr nz, .torch_purple
	ld a, [wTimeOfDayPal]
	jr .ice_cave_purple_cont
.torch_purple
	ld a, 1
.ice_cave_purple_cont
	and 3
	ld bc, 8 palettes
	eventflagcheck EVENT_MAMOSWINE_CUTSCENE
	jr z, .not_mamo_purple
	ld hl, MapObjectPalsIceCavePurple2
	jr .ice_cave_purple_cont2
.not_mamo_purple
	ld hl, MapObjectPalsIceCavePurple
.ice_cave_purple_cont2
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

	
.sewer
	ld a, [wMapNumber]
	cp MAP_LUSTER_SEWERS_B1F
	jp z, .rocks
	cp MAP_LUSTER_SEWERS_B2F
	jp z, .rocks
	ld hl, MapObjectPalsSewer
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.sunbeam
	ld a, [wMapNumber]
	cp MAP_SUNBEAM_ISLAND
	jp z, .sailboat
	cp MAP_SUNBEAM_BEACH
	jp z, .umbrella
	cp MAP_ROUTE_13
	jp z, .umbrella
	jp .got_pals_cont
.umbrella
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsUmbrella
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside
.rockscheck1
	ld a, [wMapNumber]
	cp MAP_LAKE_ONWA
	jp nz, .got_pals_cont
	ld a, [wYCoord]
	cp $11
	jp nc, .sailboat
	jr .rocks
.rockscheck2
	ld a, [wMapNumber]
	cp MAP_ROUTE_3
	jp nz, .got_pals_cont
	ld a, [wXCoord]
	cp $24
	jp c, .got_pals_cont
	jr .rocks
.rockscheck3
	ld a, [wMapGroup]
	cp GROUP_CONNECTING_CAVERN
	jp z, .starglow
	cp GROUP_BONE_CAVERN_B1F
	jp z, .starglow
	cp GROUP_DAYBREAK_GROTTO_1
	jr nz, .rocks
.rocks
	ld hl, MapObjectPalsRocks
.rockscont
	call LoadSingleOBTimeofDayPalLinePal7
	ld a, [wPermission]
	cp FOREST
	jp z, .outside
	cp TOWN
	jp z, .outside
	cp ROUTE
	jp z, .outside
	ret
.sunflowers
	ld a, [wTileset]
	cp TILESET_ORPHANAGE
	jp z, .orphanage
	ld a, [wPermission]
	cp INDOOR
	ret z
	ld a, [wMapNumber]
	cp MAP_RADIANT_FIELD
	jr z, .radiant_field
	cp MAP_ROUTE_19
	jp z, .outside_cont
	cp MAP_ROUTE_20
	jp nz, .not_route_20
	ld a, [wYCoord]
	cp $1b
	jp nc, .not_route_20
	ld a, [wXCoord]
	cp $a
	jp nc, .outside_cont
.not_route_20
	ld hl, MapObjectPalsSunflowers
	jr .sunflowers_cont
.radiant_field
	ld hl, MapObjectPalsSunflowers2
.sunflowers_cont
	call LoadSingleOBTimeofDayPalLinePal7
	jp .outside_cont
.starglow
	ld a, [wTimeOfDayPal]
	cp 3
	jp z, .dark
	ld hl, MapObjectPalsStarglow
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.autumn
	ld a, [wMapNumber]
	cp MAP_ROUTE_27
	jr z, .park
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsAutumn + 2
	call AddNTimes
	call LoadSingleOBPalLinePal7
	call FarCopyWRAM
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsAutumn
	call AddNTimes
	ld a, [wPlayerPalette]
	cp 6
	jr z, .autumn_pink
	ld de, wUnknOBPals + 6 palettes
	jr .autumn_got_color
.autumn_pink
	ld de, wUnknOBPals + 5 palettes
.autumn_got_color
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	jp .outside_cont
.ranch
	ld a, [wMapGroup]
	cp GROUP_EVENTIDE_VILLAGE
	jr nz, .ranchcont
	ld a, [wMapNumber]
	cp MAP_ROUTE_9
	jr z, .ranchcont
	cp MAP_DODRIO_RANCH_RACETRACK
	jr z, .park
	cp MAP_FLICKER_PASS_OUTSIDE
	jr z, .ranchcont
	jp .hangar
.ranchcont
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .ranchyellow
.park
.airport
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsRanch
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside
.ranchyellow
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsRanchYellow
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside
.hangar
	ld a, [wTimeOfDayPalFlags]
	and $3F
	cp 1
	jr z, .ranchyellow
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsHangar
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside	
.luster
	call LightUpPlayerPal
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsLuster
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside
.snow
	eventflagcheck EVENT_SNOWSTORM_HAPPENING
	jr nz, .snowstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .snowcont1
	ld a, [wTimeOfDayPal]
	jr .snowcont2
.snowcont1
	ld a, 1
.snowcont2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsSnow
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
.fire
	ld a, [wMapNumber]
	cp MAP_ROUTE_10_EAST
	ret nz
	ld a, [wPlayerPalette]
	cp 3
	jr z, .snowbrown
	ld hl, MapObjectPalsSnowFire
	ld de, wUnknOBPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.snowbrown
	ld hl, MapObjectPalsSnowFire
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.snowstorm
	ld a, [wIsNearCampfire]
	bit 0, a
	jr nz, .snowstormcont1
	ld a, [wTimeOfDayPal]
	jr .snowstormcont2
.snowstormcont1
	ld a, 1
.snowstormcont2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPalsSnowstorm
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld a, [wMapNumber]
	cp MAP_ROUTE_10_EAST
	ret nz
	ld a, [wPlayerPalette]
	cp 3
	jr z, .snowstormbrown
	ld hl, MapObjectPalsSnowstormFire
	ld de, wUnknOBPals + 3 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
.snowstormbrown
	ld hl, MapObjectPalsSnowstormFire
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM

.lustermall
	ld hl, MapObjectPalsLusterMall
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM

	
.lustermall2
	call .normal
	ld a, [wMapNumber]
	cp MAP_LUSTER_MALL_ELECTRONICS_SHOP
	jp z, .computer
	cp MAP_LUSTER_MALL_COFFEE_SHOP
	jr z, .coffee
	ret
.coffee
	ld hl, MapObjectPalsCoffee
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM

	
.skateparkcheck
	ld a, [wMapNumber]
	cp MAP_SKATEPARK
	jp nz, .got_pals_cont
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsSkatepark
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside
.sunset
	ld a, [wMapNumber]
	cp MAP_SUNSET_BAY
	jr z, .sailboat
	cp MAP_SAILBOAT_CUTSCENE
	jr z, .sailboat
	cp MAP_SUNSET_CAPE
	jr z, .lighthouse
	jp .normal
	
.sailboat
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsSailboat
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp .outside
.lighthouse
	ld a, [wXCoord]
	cp $a
	jp nc, .got_pals_cont
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsLighthouse
	call AddNTimes
	jp .copy_single_pal_to_pal_7
.orphanage
	ld a, [wMapNumber]
	cp MAP_RADIANT_ORPHANAGE_1F
	jp z, .rocking_chair
	cp MAP_RADIANT_GYM
	jp z, .rocking_chair
	cp MAP_RADIANT_ORPHANAGE_LEILANIS_ROOM
	jp nz, .normal
	ld hl, MapObjectPalsLeilaniBed
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.rocking_chair
	ld hl, MapObjectPalsLeilaniChair
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.haunted
	ld a, [wMapGroup]
	cp GROUP_KOMORE_COMMUNITY_CENTER
	jr nz, .haunted_cont
	ld a, [wMapNumber]
	cp MAP_KOMORE_COMMUNITY_CENTER
	jp z, .community_center
.haunted_cont
	ld hl, MapObjectPalsSpookhouse
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.highway
	ld a, [wMapNumber]
	cp MAP_BAR_BACK_ALLEY
	jr z, .tunnel
	cp MAP_ROUTE_22_TUNNEL
	jr z, .tunnel
	cp MAP_CROSSROADS
	jp z, .crossroads
	cp MAP_ROUTE_22
	jp z, .billboards1
	cp MAP_ROUTE_22_2
	jp z, .billboards2
	cp MAP_DUSK_TURNPIKE
	jp nz, .normal
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsMoomoo
	call AddNTimes
	call .copy_single_pal_to_pal_7
	jp LightUpPlayerPal
.billboards2
	ld a, [wYCoord]
	cp $11
	jr c, .billboards1_3
	ld a, [wXCoord]
	cp $22
	jr nc, .billboards1_4
	jr .billboards1_2
.billboards1
	ld a, [wXCoord]
	cp $4a
	jr nc, .billboards1_3
	cp $2a
	jr nc, .billboards1_2
;.billboards1_1
	ld hl, MapObjectPalsBillboard1
	jr .billboards_end
.billboards1_2
	ld hl, MapObjectPalsBillboard2
	jr .billboards_end
.billboards1_3
	ld hl, MapObjectPalsBillboard3
	jr .billboards_end
.billboards1_4
	ld hl, MapObjectPalsBillboard4
.billboards_end
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.crossroads
	ld a, 1
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsRocks
	call AddNTimes
	jp .copy_single_pal_to_pal_7
.tunnel
	ld a, 2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	
	ld a, [wPlayerPalette]
	cp 1
	jr nz, .tunnelcont
	ld bc, 17 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals + 5 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
.tunnelcont
	ld a, [wMapNumber]
	cp MAP_BAR_BACK_ALLEY
	jr z, .alley
	jp LightUpPlayerPal
.alley
	ld hl, MapObjectPalsEvilMeowth
	jp .copy_single_pal_to_pal_7
.lab
	call .normal
	eventflagcheck EVENT_AIRPORT_LUGGAGE_2
	jr nz, .luggage2
	eventflagcheck EVENT_AIRPORT_LUGGAGE_3
	jr nz, .luggage3
	eventflagcheck EVENT_AIRPORT_LUGGAGE_4
	jr nz, .luggage4
	eventflagcheck EVENT_AIRPORT_SLOWPOKE
	jr nz, .slowpoke
.luggage1
	ld hl, MapObjectPalsLuggage1
	jr .lab_end
.luggage2
	ld hl, MapObjectPalsLuggage2
	jr .lab_end
.luggage3
	ld hl, MapObjectPalsLuggage3
	jr .lab_end
.luggage4
	ld hl, MapObjectPalsLuggage4
	jr .lab_end
.slowpoke
	ld hl, MapObjectPalsSlowpoke
.lab_end
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.community_center
	ld a, 2
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, wUnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	
	ld a, [wPlayerPalette]
	cp 6
	jr nz, .community_center_pink
	ld de, wUnknOBPals + 4 palettes
	jr .community_center_cont
.community_center_pink
	ld de, wUnknOBPals + 6 palettes
.community_center_cont
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals + 1 palettes
	call AddNTimes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	call LightUpPlayerPalTimeOfDay
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsAutumn + 2
	call AddNTimes
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.shimmer
	ld a, [wMapNumber]
	cp MAP_SHIMMER_CITY
	jp z, .balloon
	cp MAP_SHIMMER_HARBOR
	jp z, .sailboat
	cp MAP_SHIMMER_LAB_EXPERIMENTAL_LAB
	jp z, .fossil_lab
	jp .normal
	
.fossil_lab
	call .normal
	ld hl, MapObjectPalsFossilLab
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM

	
.balloon
	ld a, [wTimeOfDayPal]
	and 3
	ld bc, 1 palettes
	ld hl, MapObjectPalsBalloon
	call AddNTimes
	call LoadSingleOBPalLinePal7
	call FarCopyWRAM
	jp .outside
	
.house1
	ld a, [wMapGroup]
	cp GROUP_OBSCURA_FORTUNE_HOUSE
	jp z, .fortune
	cp GROUP_BRILLO_TOWN
	jp z, .computer
	cp GROUP_DUSK_TURNPIKE
	jp z, .candle
	cp GROUP_LUSTER_CITY_RESIDENTIAL
	jp nz, .normal
.candle
	ld a, [wMapNumber]
	cp MAP_LUSTER_APARTMENT_2_2F
	jp z, .coffee
	ld hl, MapObjectPalsCandle
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
.fortune
	ld a, [wPlayerPalette]
	cp 4
	jr z, .fortune_purple
	ld de, wUnknOBPals + 4 palettes
	jr .fortune_cont
.fortune_purple
	ld de, wUnknOBPals + 5 palettes
.fortune_cont
	ld hl, MapObjectPalsCrystalBall
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ld hl, MapObjectPalsEvilMeowth
	call LoadSingleOBPalLinePal7
	jp FarCopyWRAM
	
.normal
	ld a, [wTileset]
	cp TILESET_SPOOKY
	jr z, .outside
	cp TILESET_DRAGON_SHRINE
	jr z, .outside
	ld a, [wPermission]
	cp FOREST
	jr z, .outside
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr z, .outside
	ld a, [wMapGroup]
	cp GROUP_LUSTER_TRAIN_STATION
	ret nz
	ld a, [wMapNumber]
	cp MAP_LUSTER_TRAIN_STATION
	ret nz
.outside
	farcall DiveSpotMapPals
	ret c
	ld a, [wTileset]
	cp TILESET_GROVE
	ret z
;	cp TILESET_MOUNTAIN
;	ret z
	cp TILESET_JUNGLE
	ret z
	cp TILESET_SNOW
	ret z
	cp TILESET_PARK
	ret z
	cp TILESET_AIRPORT
	ret z
	cp TILESET_DESERT
	ret z
	
.outside_cont
	ld a, [wTimeOfDayPal]
	and 3
	cp DUSK
	jr z, .dusk
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	jr .controof	
.dusk
	ld a, [wMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPalsDusk
	add hl, de
	jr .morn_day
.controof
	ld a, [wTimeOfDayPal]
	and 3
	cp NITE
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, wUnknBGPals + 6 palettes + 2
	ld bc, 4
	ld a, $5
	jp FarCopyWRAM


.TilesetColorsPointers:
	dw .OutdoorColors ; unused
	dw .OutdoorColors ; TOWN
	dw .OutdoorColors ; ROUTE
	dw .IndoorColors ; INDOOR
	dw .DungeonColors ; CAVE
	dw .Perm5Colors ; PERM_5
	dw .IndoorColors ; GATE
	dw .DungeonColors ; DUNGEON
	dw .OutdoorColors ; FOREST

; Valid indices: $00 - $29
.OutdoorColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.IndoorColors:
	db $20, $21, $22, $23, $24, $25, $26, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $07 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07 ; dark

.DungeonColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.Perm5Colors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark
	
TilesetBGPalette:
INCLUDE "maps/palettes/bgpals/bg.pal"

MapObjectPals::
INCLUDE "maps/palettes/obpals/ob.pal"

MapObjectPalsRocks::
INCLUDE "maps/palettes/obpals/obrocks.pal"

MapObjectPalsSunflowers::
INCLUDE "maps/palettes/obpals/obsunflowers.pal"

MapObjectPalsSunflowers2::
INCLUDE "maps/palettes/obpals/obsunflowers2.pal"

MapObjectPalsUmbrella::
INCLUDE "maps/palettes/obpals/obumbrella.pal"

MapObjectPalsStarglow::
INCLUDE "maps/palettes/obpals/obstarglow.pal"

MapObjectPalsIceCave::
INCLUDE "maps/palettes/obpals/obicecave.pal"

MapObjectPalsIceCave2::
INCLUDE "maps/palettes/obpals/obicecave2.pal"

MapObjectPalsIceCavePurple::
INCLUDE "maps/palettes/obpals/obicecavepurple.pal"

MapObjectPalsIceCavePurple2::
INCLUDE "maps/palettes/obpals/obicecavepurple2.pal"

MapObjectPalsTwinkleGym1::
INCLUDE "maps/palettes/obpals/obtwinklegym1.pal"

MapObjectPalsTwinkleGym2::
INCLUDE "maps/palettes/obpals/obtwinklegym2.pal"

MapObjectPalsTwinkleGym3::
INCLUDE "maps/palettes/obpals/obtwinklegym3.pal"

MapObjectPalsTwinkleGym4::
INCLUDE "maps/palettes/obpals/obtwinklegym4.pal"

MapObjectPalsSewer::
INCLUDE "maps/palettes/obpals/obsewer.pal"

MapObjectPalsRanch::
INCLUDE "maps/palettes/obpals/obranch.pal"

MapObjectPalsRanchYellow::
INCLUDE "maps/palettes/obpals/obranchyellow.pal"

MapObjectPalsHangar::
INCLUDE "maps/palettes/obpals/obranchhangar.pal"

MapObjectPalsSnow::
INCLUDE "maps/palettes/obpals/obsnow.pal"

MapObjectPalsSnowFire::
INCLUDE "maps/palettes/obpals/obsnowfire.pal"

MapObjectPalsSnowstorm::
INCLUDE "maps/palettes/obpals/obsnowstorm.pal"

MapObjectPalsSnowstormFire::
INCLUDE "maps/palettes/obpals/obsnowstormfire.pal"

MapObjectPalsSandstorm::
INCLUDE "maps/palettes/obpals/obsandstorm.pal"

MapObjectPalsSailboat::
INCLUDE "maps/palettes/obpals/obsailboat.pal"

MapObjectPalsLighthouse::
INCLUDE "maps/palettes/obpals/oblighthouse.pal"

MapObjectPalsSkatepark::
INCLUDE "maps/palettes/obpals/obskatepark.pal"

MapObjectPalsSunbeamView::
INCLUDE "maps/palettes/obpals/obsunbeamview.pal"

MapObjectPalsLuster::
INCLUDE "maps/palettes/obpals/obluster.pal"

MapObjectPalsLusterMall::
INCLUDE "maps/palettes/obpals/oblustermall.pal"

MapObjectPalsFossilLab::
INCLUDE "maps/palettes/obpals/fossillab.pal"

MapObjectPalsNett::
INCLUDE "maps/palettes/obpals/nett.pal"

MapObjectPalsNett2::
INCLUDE "maps/palettes/obpals/nett2.pal"

MapObjectPalsNettDark::
INCLUDE "maps/palettes/obpals/nettdark.pal"

MapObjectPalsPlayerRoom::
INCLUDE "maps/palettes/obpals/playerroom.pal"

MapObjectPalsComputer::
INCLUDE "maps/palettes/obpals/computer.pal"

MapObjectPalsBone::
INCLUDE "maps/palettes/obpals/bone.pal"

MapObjectPalsMuseum::
INCLUDE "maps/palettes/obpals/museum.pal"

MapObjectPalsCoffee::
INCLUDE "maps/palettes/obpals/coffee.pal"

MapObjectPalsWaterfallCave::
INCLUDE "maps/palettes/obpals/waterfallcave.pal"

MapObjectPalsCandle::
INCLUDE "maps/palettes/obpals/candle.pal"

MapObjectPalsSand::
INCLUDE "maps/palettes/obpals/obsand.pal"

MapObjectPalsMaractusGraffiti::
INCLUDE "maps/palettes/obpals/obmaractusgraffiti.pal"

MapObjectPalsCasino::
INCLUDE "maps/palettes/obpals/casino.pal"

MapObjectPalsCasino2::
INCLUDE "maps/palettes/obpals/casino2.pal"

MapObjectPalsLuggage1::
INCLUDE "maps/palettes/obpals/luggage1.pal"

MapObjectPalsLuggage2::
INCLUDE "maps/palettes/obpals/luggage2.pal"

MapObjectPalsLuggage3::
INCLUDE "maps/palettes/obpals/luggage3.pal"

MapObjectPalsLuggage4::
INCLUDE "maps/palettes/obpals/luggage4.pal"

MapObjectPalsSlowpoke::
INCLUDE "maps/palettes/obpals/slowpoke.pal"

MapObjectPalsBillboard1::
INCLUDE "maps/palettes/obpals/billboard_1.pal"

MapObjectPalsMoomoo::
MapObjectPalsBillboard2::
INCLUDE "maps/palettes/obpals/moomoo.pal"

MapObjectPalsBillboard3::
INCLUDE "maps/palettes/obpals/billboard_3.pal"

MapObjectPalsBillboard4::
INCLUDE "maps/palettes/obpals/billboard_4.pal"

MapObjectPalsDark::
INCLUDE "maps/palettes/obpals/dark.pal"

MapObjectPalsFakeRoute1::
INCLUDE "maps/palettes/obpals/fakeroute1.pal"

MapObjectPalsLeilaniBed::
INCLUDE "maps/palettes/obpals/leilanibed.pal"

MapObjectPalsLeilaniChair::
INCLUDE "maps/palettes/obpals/leilanichair.pal"

MapObjectPalsSpookhouse::
INCLUDE "maps/palettes/obpals/spookhouse.pal"

MapObjectPalsEvilMeowth::
INCLUDE "maps/palettes/obpals/evilmeowth.pal"

MapObjectPalsUnderwater::
INCLUDE "maps/palettes/obpals/underwater.pal"

MapObjectPalsUnderwaterPurple::
INCLUDE "maps/palettes/obpals/underwaterpurple.pal"

MapObjectPalsBar::
INCLUDE "maps/palettes/obpals/bar.pal"

MapObjectPalsJukebox::
INCLUDE "maps/palettes/obpals/jukebox.pal"

MapObjectPalsAutumn::
INCLUDE "maps/palettes/obpals/autumn.pal"

MapObjectPalsBalloon:
INCLUDE "maps/palettes/obpals/obballoon.pal"

MapObjectPalsCoralShards:
INCLUDE "maps/palettes/obpals/coralshards.pal"

MapObjectPalsCrystalBall:
INCLUDE "maps/palettes/obpals/crystalball.pal"

RoofPals::
INCLUDE "maps/palettes/roofpals/roof.pal"

StandardGrassPalette::
INCLUDE "maps/palettes/obpals/grass.pal"

