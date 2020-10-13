newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

map_const: MACRO
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH  EQU \2
\1_HEIGHT EQU \3
ENDM

GROUP_N_A  EQU -1
MAP_N_A    EQU -1

GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map group ids
	const_def
	newgroup                                                     ;  1

	map_const DAYBREAK_GROTTO_1,                           9,  7 ;  1
	map_const DAYBREAK_GROTTO_2,                           9, 11 ;  2
	map_const GLINT_GROVE,                                29, 30 ;  3
	map_const GLINT_GROVE_DEEP,							   7,  7 ;  4
	map_const STARGLOW_CAVERN_1F,                         19, 16 ;  5
	map_const STARGLOW_CAVERN_2F,                         14, 13 ;  6
	map_const STARGLOW_CAVERN_3F,                          4,  8 ;  7
	map_const STARGLOW_CAVERN_FOSSIL_ROOM,                 4,  6 ;  8
	map_const MT_ONWA_1F,                       		  14, 13 ;  9
	map_const MT_ONWA_2F,                                 17, 14 ; 10
	map_const MT_ONWA_B1F,								  18, 20 ; 11
	map_const MT_ONWA_B2F,								  23, 15 ; 12
	map_const MT_ONWA_B3F,								  11, 14 ; 13
	map_const MT_ONWA_CLIFF,							  20, 20 ; 14
	map_const MT_ONWA_LOWER_CLIFF,						  13, 12 ; 15
	map_const FLICKER_PASS_1F,							  21, 22 ; 16
	map_const FLICKER_PASS_2F,							  25, 26 ; 17
	map_const LUSTER_SEWERS_B1F,						  15, 12 ; 18
	map_const LUSTER_SEWERS_B2F,						  15, 12 ; 19
	map_const LUSTER_SEWERS_VALVE_ROOM,				      16,  3 ; 20
	map_const ICE_CAVE_B1F,								  15,  7 ; 21
	map_const ICE_CAVE_B2F,								  15, 16 ; 22
	map_const ICE_CAVE_B3F,								  16, 16 ; 23
	map_const ICE_TEMPLE_B1F_1,							  14, 11 ; 24
	map_const ICE_TEMPLE_B1F_2,							  14, 10 ; 25
	map_const ICE_TEMPLE_B1F_3,							   4, 4  ; 26
	map_const ICE_TEMPLE_B2F_1,							   8, 6  ; 27
	map_const ICE_TEMPLE_B2F_2,							  13, 7  ; 27

	newgroup                                                     ;  2

	map_const SUNSET_BAY,                                 22, 19 ;  1
	map_const SUNSET_CAPE,                                13, 19 ;  2
	map_const SUNSET_POKECENTER,                    	   6,  4 ;  3
	map_const SUNSET_LIGHTHOUSE,                           5,  5 ;  4
	map_const PLAYER_HOUSE_1F,                             5,  4 ;  5
	map_const PLAYER_HOUSE_2F,                            10, 12 ;  6
	map_const SUNSET_WATER_GRASS_HOUSE,                    4,  4 ;  7
	map_const SUNSET_GENGAR_HOUSE,                         4,  4 ;  8
	map_const SUNSET_LEGENDS_HOUSE,                        4,  4 ;  9
	map_const SUNSET_CAPTAINS_HOUSE,                       4,  4 ; 10
	map_const SUNSET_CAFE,                  			   4,  4 ; 11
	map_const ROUTE_1_GATE,                          	   4,  4 ; 12

	newgroup                                                     ;  3

	map_const ROUTE_1,                                    14, 17 ;  1
	map_const ROUTE_2,                              	  19, 24 ;  2
	map_const DAYBREAK_VILLAGE,                           13, 10 ;  3
	map_const DAYBREAK_POKEMON_TRAINER_SCHOOL,             4,  8 ;  4
	map_const DAYBREAK_MARCUS_HOUSE,                	   4,  4 ;  5
	map_const DAYBREAK_POKECENTER,                         6,  4 ;  6
	map_const DAYBREAK_ALEX_HOUSE,                     	   4,  4 ;  7

	newgroup                                                     ;  4

	map_const GLINT_POKECENTER,                       	   6,  4 ;  1
	map_const GLINT_APARTMENT_LEFT_1F,                     4,  4 ;  2
	map_const GLINT_APARTMENT_LEFT_2F,             		   4,  4 ;  3
	map_const GLINT_APARTMENT_RIGHT_1F,                    4,  4 ;  4
	map_const GLINT_APARTMENT_RIGHT_2F,                    4,  4 ;  5
	map_const GLINT_MART,                                  6,  4 ;  6
	map_const GLINT_GYM,                                   5,  9 ;  7
	map_const GLINT_GROVE_ENTRANCE,                        9,  9 ;  8
	map_const GLINT_CITY,                                 19, 11 ;  9
	map_const GLINT_RIVAL_HOUSE,                  		   4,  4 ; 10
	map_const GLINT_EVO_HOUSE,                             4,  4 ; 11
	map_const ROUTE_3,                                    27, 16 ; 12
	map_const ROUTE_3_EAST,                		          14, 10 ; 13
	map_const ROUTE_8,                                    30, 20 ; 14
	map_const ROUTE_8_ENCOUNTER_HOUSE,                     4,  4 ; 15
	map_const ROUTE_8_GARDEN,                             30, 20 ; 16
	map_const ROUTE_8_GATE,                                4,  4 ; 17

	newgroup                                                     ;  5

	map_const ROUTE_3_STARGLOW,                            8, 10 ;  1
	map_const STARGLOW_VALLEY,                            19, 17 ;  2
	map_const STARGLOW_TOGEPI_HOUSE,                       4,  4 ;  3
	map_const STARGLOW_NO_POKEMON_HOUSE,                   4,  4 ;  4
	map_const STARGLOW_GRANDPA_HOUSE,                      4,  4 ;  5
	map_const STARGLOW_FISHING_GURU_HOUSE,                 4,  4 ;  6
	map_const STARGLOW_POKECENTER,                         6,  4 ;  7
	map_const STARGLOW_MART,							   6,  4 ;  8
	map_const STARGLOW_GYM,                                6, 11 ;  9
	map_const ROUTE_4,                                    23, 12 ; 10
	map_const HUNTERS_THICKET,                            15, 12 ; 11
	map_const ROUTE_5,                                    18, 28 ; 12
	map_const ROUTE_5_DEEP,                                8,  8 ; 13
	map_const ROUTE_5_GATE,                     		   4,  4 ; 14

	newgroup                                                     ;  6

	map_const ROUTE_6,                                    37, 19 ;  1
	map_const ROUTE_7,                                    20, 12 ;  2
	map_const LAKE_ONWA,                                  31, 26 ;  3
	map_const LAKE_ONWA_BOAT_HOUSE_RIGHT,                  4,  3 ;  4
	map_const LAKE_ONWA_BOAT_HOUSE_LEFT,                   4,  3 ;  5
	map_const LAKE_ONWA_NAME_RATER_HOUSE,                  4,  4 ;  6
	map_const LAKE_ONWA_ITEM_HOUSE,                 	   4,  4 ;  7
	map_const LAKE_ONWA_POKECENTER,						   6,  4 ;  8
	
	newgroup                                                     ;  7

	map_const SUNBEAM_ISLAND,                             25, 29 ;  1
	map_const SUNBEAM_BEACH,                               8, 29 ;  2
	map_const SUNBEAM_POKECENTER,                          6,  4 ;  3
	map_const SUNBEAM_MART,								   6,  4 ;  4
	map_const SUNBEAM_BOAT_HOUSE,                   	   4,  3 ;  5
	map_const SUNBEAM_SURF_SHOP,						   4,  4 ;  6
	map_const SUNBEAM_BIKINI_CONTEST,					   6,  5 ;  7
	map_const SUNBEAM_DODRIO_HOUSE,               		   4,  4 ;  8
	map_const SUNBEAM_OLD_COUPLES_HOUSE,               	   4,  4 ;  9
	map_const SUNBEAM_SOFT_SAND_HOUSE,               	   4,  4 ; 10
	map_const SUNBEAM_TRADE_HOUSE,						   4,  4 ; 11
	map_const SPRUCES_LAB, 								   5,  4 ; 12
	map_const SUNBEAM_RESERVE,                            25, 10 ; 13
	map_const SUNBEAM_JUNGLE,  			             	  16, 16 ; 14
	map_const SUNBEAM_JUNGLE_CAVE,  			           4,  4 ; 15
	
	newgroup                                                     ;  8
	
	map_const ROUTE_4_EVENTIDE_GATE,					   5,  4 ;  1
	map_const EVENTIDE_FOREST,							  30, 24 ;  2
	map_const EVENTIDE_VILLAGE_GATE,					   5,  4 ;  3
	map_const SPOOKY_FOREST_1, 							   8,  8 ;  4
	map_const SPOOKY_FOREST_2, 							   8,  8 ;  5
	map_const SPOOKY_FOREST_3, 							   8,  8 ;  6
	map_const SPOOKY_FOREST_4, 							   8,  8 ;  7
	map_const SPOOKY_FOREST_5, 							   8,  8 ;  8
	map_const SPOOKY_FOREST_6, 							   8,  8 ;  9
	map_const SPOOKY_FOREST_7, 							   8,  8 ; 10
	map_const SPOOKY_FOREST_8, 							   8,  8 ; 11
	map_const SPOOKY_FOREST_9, 							   8,  8 ; 12
	map_const SPOOKY_FOREST_BLANK,						   8,  8 ; 13
	map_const SPOOKY_FOREST_ESCORT,						  24, 16 ; 14
	map_const OLD_MANOR_EXTERIOR,						  15, 11 ; 15
	map_const SPOOKHOUSE_LIVING_ROOM,					   5,  6 ; 16
	map_const SPOOKHOUSE_DINING_ROOM,					   7,  4 ; 17
	map_const SPOOKHOUSE_BEDROOM,						   6,  4 ; 18
	map_const SPOOKHOUSE_HALLWAY_1,						  21,  2 ; 19
	map_const SPOOKHOUSE_HALLWAY_2,						  21,  2 ; 20
	map_const SPOOKHOUSE_HALLWAY_3,						  21,  2 ; 21
	map_const SPOOKHOUSE_TV_ROOM,						   3,  5 ; 22

	newgroup													 ;  9
	
	map_const EVENTIDE_VILLAGE,							  20, 23 ; 1
	map_const EVENTIDE_GYM_SPEECH_HOUSE,       		       4,  4 ; 2
	map_const EVENTIDE_SOOTHE_BELL_HOUSE,  		       	   4,  4 ; 3
	map_const EVENTIDE_BIKE_SHOP,       		           4,  4 ; 4
	map_const EVENTIDE_POKECENTER,                         6,  4 ; 5
	map_const EVENTIDE_MART,							   6,  4 ; 6
	map_const EVENTIDE_GYM,								  23, 11 ; 7
	map_const ROUTE_9,		 							  19, 28 ; 8
	map_const DODRIO_RANCH_HOUSE,						   4,  4 ; 9
	map_const DODRIO_RANCH_BARN,						   7,  4 ; 10
	map_const DODRIO_RANCH_RACETRACK,					  25, 16 ; 11

	newgroup													 ; 10
	
	map_const FLICKER_STATION,							  36, 18 ; 1
	map_const FLICKER_SOUND_SPEECH_HOUSE,				   4,  4 ; 2
	map_const FLICKER_NAME_SPEECH_HOUSE,				   4,  4 ; 3
	map_const FLICKER_POKECENTER,                          6,  4 ; 4
	map_const FLICKER_MART,								   6,  4 ; 5
	map_const FLICKER_TRAIN_STATION,					   8,  6 ; 6
	map_const FLICKER_PASS_OUTSIDE,						  12,  9 ; 7
	map_const FLICKER_TRAIN_CUTSCENE,					  27,  7 ; 8
	map_const LUSTER_TRAIN_CUTSCENE,					  33,  4 ; 9
	map_const LUSTER_CITY_BUSINESS,					      24, 24 ; 10
	
	newgroup													 ; 11
	
	map_const ROUTE_10,									  29, 26 ; 1
	map_const ROUTE_10_EAST,							  12, 14 ; 2
	map_const ROUTE_10_TENT,							   2,  3 ; 3
	map_const TWINKLE_TOWN,								  24, 28 ; 4
	map_const TWINKLE_ROCK_HOUSE,						   4,  4 ; 5
	map_const TWINKLE_HOUSE_2,							   4,  4 ; 6
	map_const TWINKLE_HOUSE_3,							   4,  4 ; 7
	map_const TWINKLE_POKECENTER,                          6,  4 ; 8
	map_const TWINKLE_MART,								   6,  4 ; 9
	map_const TWINKLE_GYM_ENTRY,						   7,  7 ; 10
	map_const TWINKLE_GYM_BLUE_ROOM,					   5,  9 ; 11
	map_const TWINKLE_GYM_YELLOW_ROOM,					   3,  3 ; 12
	map_const TWINKLE_GYM_RED_ROOM,						   3,  3 ; 13
	
	newgroup													 ; 12
	
	map_const EAST_TRAIN_CABIN_1,						   8,  4 ; 1
	map_const EAST_TRAIN_CABIN_2,						   8,  4 ; 2
	map_const EAST_TRAIN_CAB,							   3,  2 ; 3
	map_const EAST_TRAIN_CABOOSE,						   2,  2 ; 4
	
	newgroup													 ; 13
	
	map_const LUSTER_CITY_RESIDENTIAL,					  14, 30 ; 1
	map_const LUSTER_CITY_SHOPPING,					      15, 30 ; 2
	map_const LUSTER_APARTMENT_1_1F,             	       4,  4 ; 3
	map_const LUSTER_APARTMENT_1_2F,             	       4,  4 ; 4
	map_const LUSTER_APARTMENT_2_1F,             	       4,  4 ; 5
	map_const LUSTER_APARTMENT_2_2F,             	       4,  4 ; 6
	map_const LUSTER_APARTMENT_3_1F,             	       4,  4 ; 7
	map_const LUSTER_APARTMENT_3_2F,             	       4,  4 ; 8
	map_const LUSTER_APARTMENT_4_1F,             	       4,  4 ; 9
	map_const LUSTER_APARTMENT_4_2F,             	       4,  4 ; 10
	map_const LUSTER_APARTMENT_5_1F,             	       4,  4 ; 11
	map_const LUSTER_APARTMENT_5_2F,             	       4,  4 ; 12
	map_const LUSTER_APARTMENT_6_1F,             	       4,  4 ; 13
	map_const LUSTER_APARTMENT_6_2F,             	       4,  4 ; 14
	map_const LUSTER_POKECENTER,                           6,  4 ; 15
	map_const LUSTER_MART,								   6,  4 ; 16
	map_const LUSTER_MALL,								  17, 13 ; 17
	map_const LUSTER_MALL_POKECENTER,                      6,  4 ; 18
	map_const LUSTER_MALL_ELECTRONICS_SHOP,				   5,  3 ; 19
	map_const LUSTER_MALL_COFFEE_SHOP,					   5,  4 ; 20
	map_const LUSTER_MALL_SKATE_SHOP,					   4,  3 ; 21
	map_const LUSTER_MALL_ANTIQUE_SHOP,					   4,  4 ; 22
	map_const LUSTER_MALL_HERB_SHOP,					   4,  3 ; 23
	map_const LUSTER_MALL_STONE_SHOP,					   4,  4 ; 24
	map_const LUSTER_MALL_BALL_SHOP,					   4,  4 ; 25
	map_const LUSTER_MALL_CLOTHES_SHOP,					   6,  4 ; 26
	
