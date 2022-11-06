map_attributes: MACRO
; label, map, border block, connections
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_SecondMapHeader::
	db \3
	db \2_HEIGHT, \2_WIDTH
	db BANK(\1_BlockData)
	dw \1_BlockData
	db BANK(\1_MapScriptHeader)
	dw \1_MapScriptHeader
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: offset of the target map relative to the current map
;    (x offset for east/west, y offset for north/south)

; Calculate tile offsets for source (current) and target maps
_src = 0
_tgt = (\4) + 3
if _tgt < 0
_src = -_tgt
_tgt = 0
endc

if !STRCMP("\1", "north")
_blk = \3_WIDTH * (\3_HEIGHT + -3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif !STRCMP("\1", "south")
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif !STRCMP("\1", "west")
_blk = (\3_WIDTH * _src) + \3_WIDTH + -3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 + -6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif !STRCMP("\1", "east")
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

else
fail "Invalid direction for 'connection'."
endc

	map_id \3
	dw wDecompressScratch + _blk
	dw wOverworldMap + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMap + _win
ENDM


	map_attributes SunsetBay, SUNSET_BAY, $71, SOUTH | EAST
	connection south, Route13, ROUTE_13, 6
	connection east, SunsetCape, SUNSET_CAPE, 1
	
	map_attributes SunsetCape, SUNSET_CAPE, 53, WEST
	connection west, SunsetBay, SUNSET_BAY, -1
	
	map_attributes Route1, ROUTE_1, $71, NORTH
	connection north, DaybreakVillage, DAYBREAK_VILLAGE, 5
	
	map_attributes DaybreakVillage, DAYBREAK_VILLAGE, $71, NORTH | SOUTH
	connection north, Route2, ROUTE_2, -6
	connection south, Route1, ROUTE_1, -5
	
	map_attributes Route2, ROUTE_2, $d4, NORTH | SOUTH
	connection north, GlintCity, GLINT_CITY, -2
	connection south, DaybreakVillage, DAYBREAK_VILLAGE, 6

	map_attributes GlintCity, GLINT_CITY, $d4, NORTH | SOUTH | EAST
	connection north, GlintGroveEntrance, GLINT_GROVE_ENTRANCE, 1
	connection south, Route2, ROUTE_2, 2
	connection east, Route3, ROUTE_3, 0
	
	map_attributes GlintGroveEntrance, GLINT_GROVE_ENTRANCE, $d4, SOUTH
	connection south, GlintCity, GLINT_CITY, -1
	
	map_attributes Route3, ROUTE_3, $d4, SOUTH | WEST | EAST
	connection south, Route8, ROUTE_8, 7
	connection west, GlintCity, GLINT_CITY, 0
	connection east, Route3East, ROUTE_3_EAST, 0
	
	map_attributes Route3East, ROUTE_3_EAST, $d4, SOUTH | WEST
	connection south, StarglowValley, STARGLOW_VALLEY, 10
	connection west, Route3, ROUTE_3, 0
	
	map_attributes StarglowValley, STARGLOW_VALLEY, $d4, NORTH | EAST | WEST
	connection north, Route3East, ROUTE_3_EAST, -10
	connection west, Route8, ROUTE_8, 0
	connection east, Route4, ROUTE_4, 6
	
	map_attributes Route4, ROUTE_4, $d4, NORTH | SOUTH | WEST
	connection north, HuntersThicket, HUNTERS_THICKET, 2
	connection south, Route5, ROUTE_5, -3
	connection west, StarglowValley, STARGLOW_VALLEY, -6
	
	map_attributes HuntersThicket, HUNTERS_THICKET, $d4, SOUTH
	connection south, Route4, ROUTE_4, -2
	
	map_attributes Route5, ROUTE_5, $fb, NORTH
	connection north, Route4, ROUTE_4, 3
	
	map_attributes Route6, ROUTE_6, $30, NORTH | SOUTH
	connection north, Route7, ROUTE_7, 0
	connection south, SunbeamBeach, SUNBEAM_BEACH, 0
	
	map_attributes Route7, ROUTE_7, $30, SOUTH | WEST
	connection south, Route6, ROUTE_6, 0
	connection west, LakeOnwa, LAKE_ONWA, -11
	
	map_attributes Route8, ROUTE_8, $ae, NORTH | SOUTH | EAST
	connection north, Route3, ROUTE_3, -7
	connection south, LakeOnwa, LAKE_ONWA, -5
	connection east, StarglowValley, STARGLOW_VALLEY, 0
	
	map_attributes Route9, ROUTE_9, $d1, NORTH | WEST
	connection north, FlickerStation, FLICKER_STATION, 5
	connection west, EventideVillage, EVENTIDE_VILLAGE, 16
	
	map_attributes Route10, ROUTE_10, 5, NORTH | EAST
	connection north, TwinkleTown, TWINKLE_TOWN, 5
	connection east, Route10East, ROUTE_10_EAST, -1
	
	map_attributes Route10East, ROUTE_10_EAST, 5, WEST
	connection west, Route10, ROUTE_10, 1

	map_attributes EventideVillage, EVENTIDE_VILLAGE, $0d, EAST
	connection east, Route9, ROUTE_9, -16

	map_attributes FlickerStation, FLICKER_STATION, $d1, NORTH | SOUTH | WEST
	connection north, FlickerPassOutside, FLICKER_PASS_OUTSIDE, 7
	connection south, Route9, ROUTE_9, -5
	connection west, FlickerTrainGraveyard, FLICKER_TRAIN_GRAVEYARD, 0
	
	map_attributes FlickerTrainGraveyard, FLICKER_TRAIN_GRAVEYARD, $d1, EAST
	connection east, FlickerStation, FLICKER_STATION, 0
	
	map_attributes FlickerPassOutside, FLICKER_PASS_OUTSIDE, 113, SOUTH
	connection south, FlickerStation, FLICKER_STATION, -7
	
	map_attributes LakeOnwa, LAKE_ONWA, $30, NORTH | EAST
	connection north, Route8, ROUTE_8, 5
	connection east, Route7, ROUTE_7, 11
	
	map_attributes SunbeamIsland, SUNBEAM_ISLAND, $35, WEST
	connection west, SunbeamBeach, SUNBEAM_BEACH, 0
	
	map_attributes SunbeamBeach, SUNBEAM_BEACH, $35, NORTH | WEST | EAST
	connection north, Route6, ROUTE_6, 0
	connection west, Route14, ROUTE_14, 14
	connection east, SunbeamIsland, SUNBEAM_ISLAND, 0
	
	map_attributes EventideForest, EVENTIDE_FOREST, $80, NORTH
	connection north, SpookyForest1, SPOOKY_FOREST_1, 14
	
	map_attributes SpookyForest1, SPOOKY_FOREST_1, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForest2, SPOOKY_FOREST_2, 0
	connection south, EventideForest, EVENTIDE_FOREST, -14
	connection west, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection east, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	
	map_attributes SpookyForest2, SPOOKY_FOREST_2, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection south, SpookyForest1, SPOOKY_FOREST_1, 0
	connection west, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection east, SpookyForest3, SPOOKY_FOREST_3, 0
	
	map_attributes SpookyForest3, SPOOKY_FOREST_3, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection south, SpookyForest4, SPOOKY_FOREST_4, 0
	connection west, SpookyForest2, SPOOKY_FOREST_2, 0
	connection east, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	
	map_attributes SpookyForest4, SPOOKY_FOREST_4, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForest3, SPOOKY_FOREST_3, 0
	connection south, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection west, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection east, SpookyForest5, SPOOKY_FOREST_5, 0
	
	map_attributes SpookyForest5, SPOOKY_FOREST_5, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForest6, SPOOKY_FOREST_6, 0
	connection south, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection west, SpookyForest4, SPOOKY_FOREST_4, 0
	connection east, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	
	map_attributes SpookyForest6, SPOOKY_FOREST_6, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForest7, SPOOKY_FOREST_7, 0
	connection south, SpookyForest5, SPOOKY_FOREST_5, 0
	connection west, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection east, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	
	map_attributes SpookyForest7, SPOOKY_FOREST_7, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection south, SpookyForest6, SPOOKY_FOREST_6, 0
	connection west, SpookyForest8, SPOOKY_FOREST_8, 0
	connection east, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	
	map_attributes SpookyForest8, SPOOKY_FOREST_8, 92, NORTH | SOUTH | WEST | EAST
	connection north, OldManorExterior, OLD_MANOR_EXTERIOR, -4
	connection south, SpookyForestBlank, SPOOKY_FOREST_BLANK, 0
	connection west, SpookyForest9, SPOOKY_FOREST_9, 0
	connection east, SpookyForest7, SPOOKY_FOREST_7, 0
	
	map_attributes SpookyForest9, SPOOKY_FOREST_9, 92, EAST
	connection east, SpookyForest8, SPOOKY_FOREST_8, 0
	
	map_attributes SpookyForestBlank, SPOOKY_FOREST_BLANK, 92, 0
	
	map_attributes SpookyForestEscort, SPOOKY_FOREST_ESCORT, 92, NORTH | SOUTH | WEST | EAST
	connection north, SpookyForestEscort, SPOOKY_FOREST_ESCORT, 0
	connection south, SpookyForestEscort, SPOOKY_FOREST_ESCORT, 0
	connection west, SpookyForestEscort, SPOOKY_FOREST_ESCORT, 0
	connection east, SpookyForestEscort, SPOOKY_FOREST_ESCORT, 0
	
	map_attributes OldManorExterior, OLD_MANOR_EXTERIOR, 92, SOUTH
	connection south, SpookyForest8, SPOOKY_FOREST_8, 4
	
	map_attributes SpookhouseHallway1, SPOOKHOUSE_HALLWAY_1, $00, WEST
	connection west, SpookhouseHallway2, SPOOKHOUSE_HALLWAY_2, 0
	
	map_attributes SpookhouseHallway2, SPOOKHOUSE_HALLWAY_2, $00, WEST | EAST
	connection west, SpookhouseHallway2, SPOOKHOUSE_HALLWAY_2, 0
	connection east, SpookhouseHallway1, SPOOKHOUSE_HALLWAY_1, 0
	
	map_attributes TwinkleTown, TWINKLE_TOWN, 5, SOUTH
	connection south, Route10, ROUTE_10, -5
	
	map_attributes LusterCityResidential, LUSTER_CITY_RESIDENTIAL, 113, EAST
	connection east, LusterCityShopping, LUSTER_CITY_SHOPPING, 0
	
	map_attributes LusterCityShopping, LUSTER_CITY_SHOPPING, 113, WEST | EAST
	connection west, LusterCityResidential, LUSTER_CITY_RESIDENTIAL, 0
	connection east, LusterCityBusiness, LUSTER_CITY_BUSINESS, 6
	
	map_attributes LusterCityBusiness, LUSTER_CITY_BUSINESS, 113, WEST
	connection west, LusterCityShopping, LUSTER_CITY_SHOPPING, -6
	
	map_attributes Route11, ROUTE_11, $02, EAST
	connection east, Skatepark, SKATEPARK, 1
	
	map_attributes Route12, ROUTE_12, $02, NORTH
	connection north, OnwaIntlAirport, ONWA_INTL_AIRPORT, -12
	
	map_attributes OnwaIntlAirport, ONWA_INTL_AIRPORT, $c4, NORTH | SOUTH
	connection north, AirportRunway, AIRPORT_RUNWAY, 0
	connection south, Route12, ROUTE_12, 12
	
	map_attributes AirportRunway, AIRPORT_RUNWAY, $c4, SOUTH
	connection south, OnwaIntlAirport, ONWA_INTL_AIRPORT, 0
	
	map_attributes Skatepark, SKATEPARK, $02, WEST
	connection west, Route11, ROUTE_11, -1
	
	map_attributes Route13, ROUTE_13, $35, NORTH | EAST
	connection north, SunsetBay, SUNSET_BAY, -6
	connection east, Route14, ROUTE_14, 14
	
	map_attributes Route14, ROUTE_14, $35, SOUTH | WEST | EAST
	connection south, ShimmerCity, SHIMMER_CITY, 2
	connection west, Route13, ROUTE_13, -14
	connection east, SunbeamBeach, SUNBEAM_BEACH, -14
	
	map_attributes ShimmerCity, SHIMMER_CITY, $35, NORTH | WEST
	connection north, Route14, ROUTE_14, -2
	connection west, ShimmerHarbor, SHIMMER_HARBOR, 2
	
	map_attributes ShimmerHarbor, SHIMMER_HARBOR, $35, EAST
	connection east, ShimmerCity, SHIMMER_CITY, -2
	
	map_attributes BrilloTown, BRILLO_TOWN, $35, EAST
	connection east, DesertRoute, DESERT_ROUTE, -7
	
	map_attributes DesertRoute, DESERT_ROUTE, $71, NORTH | WEST
	connection north, DesertRouteNorth, DESERT_ROUTE_NORTH, 14
	connection west, BrilloTown, BRILLO_TOWN, 7
	
	map_attributes DesertRouteNorth, DESERT_ROUTE_NORTH, $02, NORTH | SOUTH
	connection north, DesertWasteland1, DESERT_WASTELAND_1, 3
	connection south, DesertRoute, DESERT_ROUTE, -14
	
	map_attributes DesertWasteland1, DESERT_WASTELAND_1, $02, NORTH | SOUTH
	connection north, DesertWasteland2, DESERT_WASTELAND_2, 0
	connection south, DesertRouteNorth, DESERT_ROUTE_NORTH, -3
	
	map_attributes DesertWasteland2, DESERT_WASTELAND_2, $02, SOUTH | WEST
	connection south, DesertWasteland1, DESERT_WASTELAND_1, 0
	connection west, DesertWasteland3, DESERT_WASTELAND_3, 0
	
	map_attributes DesertWasteland3, DESERT_WASTELAND_3, $02, NORTH | EAST
	connection north, DesertWasteland4, DESERT_WASTELAND_4, 0
	connection east, DesertWasteland2, DESERT_WASTELAND_2, 0
	
	map_attributes DesertWasteland4, DESERT_WASTELAND_4, $02, SOUTH | EAST
	connection south, DesertWasteland3, DESERT_WASTELAND_3, 0
	connection east, DesertWasteland5, DESERT_WASTELAND_5, 0
	
	map_attributes DesertWasteland5, DESERT_WASTELAND_5, $02, SOUTH | WEST
	connection south, DesertWasteland6, DESERT_WASTELAND_6, 0
	connection west, DesertWasteland4, DESERT_WASTELAND_4, 0
	
	map_attributes DesertWasteland6, DESERT_WASTELAND_6, $02, NORTH | WEST
	connection north, DesertWasteland5, DESERT_WASTELAND_5, 0
	connection west, DesertWasteland7, DESERT_WASTELAND_7, 0
	
	map_attributes DesertWasteland7, DESERT_WASTELAND_7, $02, SOUTH | EAST
	connection south, DesertWasteland8, DESERT_WASTELAND_8, 0
	connection east, DesertWasteland6, DESERT_WASTELAND_6, 0
	
	map_attributes DesertWasteland8, DESERT_WASTELAND_8, $02, NORTH | SOUTH | WEST
	connection north, DesertWasteland7, DESERT_WASTELAND_7, 0
	connection south, DesertWastelandOasis, DESERT_WASTELAND_OASIS, 1
	connection west, DesertWasteland9, DESERT_WASTELAND_9, 0
	
	map_attributes DesertWasteland9, DESERT_WASTELAND_9, $02, NORTH | EAST
	connection north, DesertTempleOutside, DESERT_TEMPLE_OUTSIDE, 0
	connection east, DesertWasteland8, DESERT_WASTELAND_8, 0
	
	map_attributes DesertWastelandOasis, DESERT_WASTELAND_OASIS, $02, NORTH
	connection north, DesertWasteland8, DESERT_WASTELAND_8, -1
	
	map_attributes DesertTempleOutside, DESERT_TEMPLE_OUTSIDE, $02, SOUTH
	connection south, DesertWasteland9, DESERT_WASTELAND_9, 0
	
	map_attributes DaybreakGrotto1, DAYBREAK_GROTTO_1, $9, 0
	map_attributes DaybreakGrotto2, DAYBREAK_GROTTO_2, $9, 0
	map_attributes DaybreakGrotto3, DAYBREAK_GROTTO_3, $9, 0
	map_attributes GlintGrove, GLINT_GROVE, $11, 0
	map_attributes GlintGroveDeep, GLINT_GROVE_DEEP, $11, 0
	map_attributes StarglowCavern1F, STARGLOW_CAVERN_1F, $9, 0
	map_attributes StarglowCavern2F, STARGLOW_CAVERN_2F, $9, 0
	map_attributes StarglowCavern3F, STARGLOW_CAVERN_3F, $9, 0
	map_attributes StarglowCavernFossilRoom, STARGLOW_CAVERN_FOSSIL_ROOM, $9, 0
	map_attributes MtOnwa1F, MT_ONWA_1F, $09, 0
	map_attributes MtOnwa2F, MT_ONWA_2F, $09, 0
	map_attributes MtOnwaB1F, MT_ONWA_B1F, $09, 0
	map_attributes MtOnwaB2F, MT_ONWA_B2F, $09, 0
	map_attributes MtOnwaB3F, MT_ONWA_B3F, $09, 0
	map_attributes MtOnwaCliff, MT_ONWA_CLIFF, $00, 0
	map_attributes MtOnwaLowerCliff, MT_ONWA_LOWER_CLIFF, $71, 0
	map_attributes FlickerPass1F, FLICKER_PASS_1F, $9, 0
	map_attributes FlickerPass2F, FLICKER_PASS_2F, $9, 0
	map_attributes LusterSewersB1F, LUSTER_SEWERS_B1F, 0, 0
	map_attributes LusterSewersB2F, LUSTER_SEWERS_B2F, 0, 0
	map_attributes LusterSewersValveRoom, LUSTER_SEWERS_VALVE_ROOM, 0, 0
	map_attributes LusterSewersThroneRoom, LUSTER_SEWERS_THRONE_ROOM, 0, 0
	map_attributes LusterSewersMukRoom, LUSTER_SEWERS_MUK_ROOM, 0, 0
	map_attributes IceCaveB1F, ICE_CAVE_B1F, $54, 0
	map_attributes IceCaveB2F, ICE_CAVE_B2F, $54, 0
	map_attributes IceCaveB3F, ICE_CAVE_B3F, $54, 0
	map_attributes IceTempleB1F1, ICE_TEMPLE_B1F_1, 0, 0
	map_attributes IceTempleB1F2, ICE_TEMPLE_B1F_2, 0, 0
	map_attributes IceTempleB1F3, ICE_TEMPLE_B1F_3, 0, 0
	map_attributes IceTempleB2F1, ICE_TEMPLE_B2F_1, 0, 0
	map_attributes IceTempleB2F2, ICE_TEMPLE_B2F_2, 0, 0
	
	map_attributes SunsetPokeCenter, SUNSET_POKECENTER, $0, 0
	map_attributes SunsetLighthouse, SUNSET_LIGHTHOUSE, $0, 0
	map_attributes PlayerHouse1F, PLAYER_HOUSE_1F, $0, 0
	map_attributes PlayerHouse2F, PLAYER_HOUSE_2F, $0, 0
	map_attributes SunsetWaterGrassHouse, SUNSET_WATER_GRASS_HOUSE, $0, 0
	map_attributes SunsetGengarHouse, SUNSET_GENGAR_HOUSE, $0, 0
	map_attributes SunsetLegendsHouse, SUNSET_LEGENDS_HOUSE, $0, 0
	map_attributes SunsetCaptainsHouse, SUNSET_CAPTAINS_HOUSE, $0, 0
	map_attributes SunsetCafe, SUNSET_CAFE, $0, 0
	map_attributes DaybreakPokemonTrainerSchool, DAYBREAK_POKEMON_TRAINER_SCHOOL, $0, 0
	map_attributes DaybreakMarcusHouse, DAYBREAK_MARCUS_HOUSE, $0, 0
	map_attributes DaybreakPokeCenter, DAYBREAK_POKECENTER, $0, 0
	map_attributes DaybreakAlexHouse, DAYBREAK_ALEX_HOUSE, $0, 0
	map_attributes GlintPokeCenter, GLINT_POKECENTER, $0, 0
	map_attributes GlintEvoHouse, GLINT_EVO_HOUSE, $0, 0
	map_attributes GlintRivalHouse, GLINT_RIVAL_HOUSE, $0, 0
	map_attributes GlintApartmentLeft1F, GLINT_APARTMENT_LEFT_1F, $0, 0
	map_attributes GlintApartmentLeft2F, GLINT_APARTMENT_LEFT_2F, $0, 0
	map_attributes GlintApartmentRight1F, GLINT_APARTMENT_RIGHT_1F, $0, 0
	map_attributes GlintApartmentRight2F, GLINT_APARTMENT_RIGHT_2F, $0, 0
	map_attributes GlintMart, GLINT_MART, $0, 0
	map_attributes GlintGym, GLINT_GYM, $0, 0
	map_attributes StarglowTogepiHouse, STARGLOW_TOGEPI_HOUSE, $0, 0
	map_attributes StarglowNoPokemonHouse, STARGLOW_NO_POKEMON_HOUSE, $0, 0
	map_attributes StarglowGrandpaHouse, STARGLOW_GRANDPA_HOUSE, $0, 0
	map_attributes StarglowFishingGuruHouse, STARGLOW_FISHING_GURU_HOUSE, $0, 0
	map_attributes StarglowPokeCenter, STARGLOW_POKECENTER, $0, 0
	map_attributes StarglowMart, STARGLOW_MART, $0, 0
	map_attributes StarglowGym, STARGLOW_GYM, $0, 0
	map_attributes LakeOnwaBoatHouseRight, LAKE_ONWA_BOAT_HOUSE_RIGHT, $0, 0
	map_attributes LakeOnwaNameRaterHouse, LAKE_ONWA_NAME_RATER_HOUSE, $0, 0
	map_attributes LakeOnwaBoatHouseLeft, LAKE_ONWA_BOAT_HOUSE_LEFT, $0, 0
	map_attributes LakeOnwaItemHouse, LAKE_ONWA_ITEM_HOUSE, $0, 0
	map_attributes LakeOnwaPokeCenter, LAKE_ONWA_POKECENTER, $0, 0
	map_attributes Route3FriendshipHouse, ROUTE_3_FRIENDSHIP_HOUSE, $0, 0
	map_attributes Route8Garden, ROUTE_8_GARDEN, $d4, 0
	map_attributes Route8EncounterHouse, ROUTE_8_ENCOUNTER_HOUSE, $0, 0
	map_attributes SunbeamPokeCenter, SUNBEAM_POKECENTER, $0, 0
	map_attributes SunbeamMart, SUNBEAM_MART, $0, 0
	map_attributes SunbeamBoatHouse, SUNBEAM_BOAT_HOUSE, $0, 0
	map_attributes SunbeamSurfShop, SUNBEAM_SURF_SHOP, $0, 0
	map_attributes SunbeamBikiniContest, SUNBEAM_BIKINI_CONTEST, $0, 0
	map_attributes SunbeamDodrioHouse, SUNBEAM_DODRIO_HOUSE, $0, 0
	map_attributes SunbeamOldCouplesHouse, SUNBEAM_OLD_COUPLES_HOUSE, $0, 0
	map_attributes SunbeamSoftSandHouse, SUNBEAM_SOFT_SAND_HOUSE, $0, 0
	map_attributes SunbeamTradeHouse, SUNBEAM_TRADE_HOUSE, $0, 0
	map_attributes SprucesLab, SPRUCES_LAB, $0, 0
	map_attributes SunbeamReserve, SUNBEAM_RESERVE, $35, 0
	map_attributes SunbeamJungle, SUNBEAM_JUNGLE, $07, 0
	map_attributes SunbeamJungleCave, SUNBEAM_JUNGLE_CAVE, $09, 0
	map_attributes SunbeamJungleDeep, SUNBEAM_JUNGLE_DEEP, $07, 0
	map_attributes SpookhouseLivingRoom, SPOOKHOUSE_LIVING_ROOM, $00, 0
	map_attributes SpookhouseDiningRoom, SPOOKHOUSE_DINING_ROOM, $00, 0
	map_attributes SpookhouseBedroom, SPOOKHOUSE_BEDROOM, $00, 0
	map_attributes SpookhouseTVRoom, SPOOKHOUSE_TV_ROOM, $00, 0
	map_attributes EventideGymSpeechHouse, EVENTIDE_GYM_SPEECH_HOUSE, 0, 0
	map_attributes EventideSootheBellHouse, EVENTIDE_SOOTHE_BELL_HOUSE, 0, 0
	map_attributes EventideBikeShop, EVENTIDE_BIKE_SHOP, 0, 0
	map_attributes EventidePokeCenter, EVENTIDE_POKECENTER, 0, 0
	map_attributes EventideMart, EVENTIDE_MART, 0, 0
	map_attributes EventideGym, EVENTIDE_GYM, 0, 0
	map_attributes DodrioRanchHouse, DODRIO_RANCH_HOUSE, $00, 0
	map_attributes DodrioRanchBarn, DODRIO_RANCH_BARN, $00, 0
	map_attributes DodrioRanchRaceTrack, DODRIO_RANCH_RACETRACK, $d1, 0
	map_attributes FlickerSoundSpeechHouse, FLICKER_SOUND_SPEECH_HOUSE, 0, 0
	map_attributes FlickerNameSpeechHouse, FLICKER_NAME_SPEECH_HOUSE, 0, 0
	map_attributes FlickerPokeCenter, FLICKER_POKECENTER, 0, 0
	map_attributes FlickerMart, FLICKER_MART, 0, 0
	map_attributes FlickerTrainStation, FLICKER_TRAIN_STATION, 0, 0
	map_attributes FlickerTrainCutscene, FLICKER_TRAIN_CUTSCENE, 0, 0
	map_attributes LusterTrainStation, LUSTER_TRAIN_STATION, 0, 0
	map_attributes LusterTrainCutscene, LUSTER_TRAIN_CUTSCENE, $66, 0
	map_attributes SailboatCutscene, SAILBOAT_CUTSCENE, $b0, 0
	map_attributes Route10Tent, ROUTE_10_TENT, 0, 0
	map_attributes TwinkleRockHouse, TWINKLE_ROCK_HOUSE, 0, 0
	map_attributes TwinkleTradeHouse, TWINKLE_TRADE_HOUSE, 0, 0
	map_attributes TwinkleSnowHouse, TWINKLE_SNOW_HOUSE, 0, 0
	map_attributes TwinklePokeCenter, TWINKLE_POKECENTER, 0, 0
	map_attributes TwinkleMart, TWINKLE_MART, 0, 0
	map_attributes TwinkleGymEntry, TWINKLE_GYM_ENTRY, 0, 0
	map_attributes TwinkleGymBlueRoom, TWINKLE_GYM_BLUE_ROOM, 0, 0
	map_attributes TwinkleGymYellowRoom, TWINKLE_GYM_YELLOW_ROOM, 0, 0
	map_attributes TwinkleGymRedRoom, TWINKLE_GYM_RED_ROOM, 0, 0
	map_attributes Route10RestHouse, ROUTE_10_REST_HOUSE, 0, 0
	map_attributes Route10MoveReminderHouse, ROUTE_10_MOVE_REMINDER_HOUSE, 0, 0
	map_attributes TrainCabin1, TRAIN_CABIN_1, 0, 0
	map_attributes TrainCabin2, TRAIN_CABIN_2, 0, 0
	map_attributes EastTrainCab, EAST_TRAIN_CAB, 0, 0
	map_attributes EastTrainCaboose, EAST_TRAIN_CABOOSE, 0, 0
	map_attributes LusterApartment1_1F, LUSTER_APARTMENT_1_1F, $0, 0
	map_attributes LusterApartment1_2F, LUSTER_APARTMENT_1_2F, $0, 0
	map_attributes LusterApartment2_1F, LUSTER_APARTMENT_2_1F, $0, 0
	map_attributes LusterApartment2_2F, LUSTER_APARTMENT_2_2F, $0, 0
	map_attributes LusterApartment3_1F, LUSTER_APARTMENT_3_1F, $0, 0
	map_attributes LusterApartment3_2F, LUSTER_APARTMENT_3_2F, $0, 0
	map_attributes LusterApartment4_1F, LUSTER_APARTMENT_4_1F, $0, 0
	map_attributes LusterApartment4_2F, LUSTER_APARTMENT_4_2F, $0, 0
	map_attributes LusterApartment5_1F, LUSTER_APARTMENT_5_1F, $0, 0
	map_attributes LusterApartment5_2F, LUSTER_APARTMENT_5_2F, $0, 0
	map_attributes LusterApartment6_1F, LUSTER_APARTMENT_6_1F, $0, 0
	map_attributes LusterApartment6_2F, LUSTER_APARTMENT_6_2F, $0, 0
	map_attributes LusterPokeCenter, LUSTER_POKECENTER, 0, 0
	map_attributes LusterMart, LUSTER_MART, 0, 0
	map_attributes LusterMall, LUSTER_MALL, 0, 0
	map_attributes LusterMallPokeCenter, LUSTER_MALL_POKECENTER, 0, 0
	map_attributes LusterMallElectronicsShop, LUSTER_MALL_ELECTRONICS_SHOP, 0, 0
	map_attributes LusterMallCoffeeShop, LUSTER_MALL_COFFEE_SHOP, 0, 0
	map_attributes LusterMallSkateShop, LUSTER_MALL_SKATE_SHOP, 0, 0
	map_attributes LusterMallSkateTest, LUSTER_MALL_SKATE_TEST, 0, 0
	map_attributes LusterMallAntiqueShop, LUSTER_MALL_ANTIQUE_SHOP, 0, 0
	map_attributes LusterMallHerbShop, LUSTER_MALL_HERB_SHOP, 0, 0
	map_attributes LusterMallStoneShop, LUSTER_MALL_STONE_SHOP, 0, 0
	map_attributes LusterMallBallShop, LUSTER_MALL_BALL_SHOP, 0, 0
	map_attributes LusterMallClothesShop, LUSTER_MALL_CLOTHES_SHOP, 0, 0
	map_attributes LusterMallBackRoom, LUSTER_MALL_BACK_ROOM, 0, 0
	map_attributes LusterSkyscraper1_1F, LUSTER_SKYSCRAPER_1_1F, 0, 0
	map_attributes LusterSkyscraper1_2F, LUSTER_SKYSCRAPER_1_2F, 0, 0
	map_attributes LusterSkyscraper1_3F, LUSTER_SKYSCRAPER_1_3F, 0, 0
	map_attributes LusterSkyscraper1_Elevator, LUSTER_SKYSCRAPER_1_ELEVATOR, 0, 0
	map_attributes LusterSkyscraper2_1F, LUSTER_SKYSCRAPER_2_1F, 0, 0
	map_attributes LusterSkyscraper2_2F, LUSTER_SKYSCRAPER_2_2F, 0, 0
	map_attributes LusterSkyscraper2_3F, LUSTER_SKYSCRAPER_2_3F, 0, 0
	map_attributes LusterSkyscraper2_Elevator, LUSTER_SKYSCRAPER_2_ELEVATOR, 0, 0
	map_attributes NettBuilding1F, NETT_BUILDING_1F, 0, 0
	map_attributes NettBuilding2F, NETT_BUILDING_2F, 0, 0
	map_attributes NettBuildingElevator, NETT_BUILDING_ELEVATOR, 0, 0
	map_attributes NettBuildingMBathroom, NETT_BUILDING_M_BATHROOM, 0, 0
	map_attributes NettBuildingFBathroom, NETT_BUILDING_F_BATHROOM, 0, 0
	map_attributes NettBuildingStairwell, NETT_BUILDING_STAIRWELL, 0, 0
	map_attributes NettBuildingOffice, NETT_BUILDING_OFFICE, 0, 0
	map_attributes ShimmerLabLobby, SHIMMER_LAB_LOBBY, 0, 0
	map_attributes ShimmerLabResearchRoom, SHIMMER_LAB_RESEARCH_ROOM, 0, 0
	map_attributes ShimmerLabExperimentalLab, SHIMMER_LAB_EXPERIMENTAL_LAB, 0, 0
	map_attributes ShimmerUnderBoardwalk, SHIMMER_UNDER_BOARDWALK, 0, 0
	map_attributes ShimmerBoatHouse, SHIMMER_BOAT_HOUSE, $0, 0
	map_attributes ShimmerPokeCenter, SHIMMER_POKECENTER, $0, 0
	map_attributes ShimmerMart, SHIMMER_MART, $0, 0
	map_attributes ShimmerHouse1, SHIMMER_HOUSE_1, $0, 0
	map_attributes ShimmerHouse2, SHIMMER_HOUSE_2, $0, 0
	map_attributes ShimmerHouse3, SHIMMER_HOUSE_3, $0, 0
	map_attributes BrilloBoatHouse, BRILLO_BOAT_HOUSE, $0, 0
	map_attributes BrilloRockHouse, BRILLO_ROCK_HOUSE, $0, 0
	map_attributes BrilloTradeHouse, BRILLO_TRADE_HOUSE, $0, 0
	map_attributes BrilloLegendSpeechHouse, BRILLO_LEGEND_SPEECH_HOUSE, $0, 0
	map_attributes BrilloPokeCenter, BRILLO_POKECENTER, $0, 0
	map_attributes BrilloMart, BRILLO_MART, $0, 0
	map_attributes BrilloGameCorner, BRILLO_GAME_CORNER, $0, 0
	map_attributes DesertRouteTent, DESERT_ROUTE_TENT, $0, 0
	map_attributes Airport, AIRPORT, $0, 0
	
	map_attributes Route5Deep, ROUTE_5_DEEP, $fb, 0
	map_attributes Route1Gate, ROUTE_1_GATE, $0, 0
	map_attributes Route5Gate1F, ROUTE_5_GATE_1F, $0, 0
	map_attributes Route5Gate2F, ROUTE_5_GATE_2F, $0, 0
	map_attributes Route8Gate, ROUTE_8_GATE, $0, 0
	map_attributes Route4EventideGate, ROUTE_4_EVENTIDE_GATE, $0, 0
	map_attributes EventideVillageGate, EVENTIDE_VILLAGE_GATE, $0, 0
	map_attributes Route11Gate, ROUTE_11_GATE, $0, 0
	map_attributes Route12Gate, ROUTE_12_GATE, $0, 0
