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
	map_const MT_ONWA_1F,                       		  14, 13 ;  7
	map_const MT_ONWA_2F,                                 17, 14 ;  8
	map_const MT_ONWA_B1F,								  18, 20 ;  9
	map_const MT_ONWA_B2F,								  23, 15 ; 10
	map_const MT_ONWA_B3F,								  11, 14 ; 11
	map_const MT_ONWA_CLIFF,							  20, 20 ; 12
	map_const MT_ONWA_LOWER_CLIFF,						  13, 12 ; 13
	map_const FLICKER_PASS_1F,							  21, 18 ; 14
	map_const FLICKER_PASS_2F,							  25, 26 ; 15
	map_const LUSTER_SEWERS_FLOODED,					  14, 12 ; 16
	map_const LUSTER_SEWERS_EMPTY,						  14, 12 ; 17
	map_const LUSTER_SEWERS_VALVE_ROOM,					   4,  3 ; 18

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
	map_const ROUTE_3,                                    30, 17 ; 12

	newgroup                                                     ;  5

	map_const ROUTE_3_STARGLOW,                            6,  8 ;  1
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
	map_const SUNBEAM_BLUE_WATER_HOUSE,               	   4,  4 ; 10
	map_const SUNBEAM_TRADE_HOUSE,						   4,  4 ; 11
	map_const SPRUCES_LAB, 								   5,  4 ; 12
	map_const SUNBEAM_GYM,  			             	  16, 16 ; 13
	map_const SUNBEAM_GYM_CAVE,  			               3,  4 ; 14
	
	newgroup                                                     ;  8
	
	map_const ROUTE_4_EVENTIDE_GATE,					   5,  4 ;  1
	map_const EVENTIDE_FOREST,							  30, 24 ;  2
	map_const ROUTE_9_EVENTIDE_GATE,					   5,  4 ;  3
	map_const SPOOKY_FOREST_1, 							   8,  8 ;  4
	map_const SPOOKY_FOREST_2, 							   8,  8 ;  5
	map_const SPOOKY_FOREST_3, 							   8,  8 ;  6
	map_const SPOOKY_FOREST_4, 							   8,  8 ;  7
	map_const SPOOKY_FOREST_5, 							   8,  8 ;  8
	map_const SPOOKY_FOREST_6, 							   8,  8 ;  9
	map_const SPOOKY_FOREST_7, 							   8,  8 ; 10
	map_const SPOOKY_FOREST_8, 							   8,  8 ; 11
	map_const SPOOKY_FOREST_9, 							   8,  8 ; 12
	map_const OLD_MANOR_EXTERIOR,						  15, 11 ; 13
	map_const SPOOKHOUSE_LIVING_ROOM,					   5,  6 ; 14
	map_const SPOOKHOUSE_DINING_ROOM,					   7,  4 ; 15
	map_const SPOOKHOUSE_BEDROOM,						   6,  4 ; 16
	map_const SPOOKHOUSE_HALLWAY_1,						  21,  2 ; 17
	map_const SPOOKHOUSE_HALLWAY_2,						  21,  2 ; 18
	map_const SPOOKHOUSE_HALLWAY_3,						  21,  2 ; 19
	map_const SPOOKHOUSE_TV_ROOM,						   3,  5 ; 20

	newgroup													 ;  9
	
	map_const ROUTE_9,		 							  19, 18 ; 1
	map_const DODRIO_RANCH_HOUSE,						   4,  4 ; 2
	map_const DODRIO_RANCH_BARN,						   7,  4 ; 3
	map_const DODRIO_RANCH_RACETRACK,					  25, 17 ; 4

	newgroup													 ; 10
	
	map_const FLICKER_STATION,							  36, 18 ; 1
	map_const FLICKER_SOUND_SPEECH_HOUSE,				   4,  4 ; 2
	map_const FLICKER_NAME_SPEECH_HOUSE,				   4,  4 ; 3
	map_const FLICKER_POKECENTER,                          6,  4 ; 4
	map_const FLICKER_MART,								   6,  4 ; 5
	map_const FLICKER_TRAIN_STATION,					   8,  6 ; 6
	map_const FLICKER_PASS_OUTSIDE,						  12,  9 ; 7
	map_const FLICKER_TRAIN_CUTSCENE,					  27,  7 ; 8
	map_const LUSTER_CITY_BUSINESS,					      24, 24 ; 9
	
	newgroup													 ; 11
	
	map_const ROUTE_10,									  28, 26 ; 1
	map_const ROUTE_10_EAST,							  12, 14 ; 2
	map_const ROUTE_10_TENT,							   2,  3 ; 3
	map_const TWINKLE_TOWN,								  24, 28 ; 4
	
	newgroup													 ; 12
	
	map_const EAST_TRAIN_CABIN_1,						   8,  4 ; 1
	map_const EAST_TRAIN_CABIN_2,						   8,  4 ; 2
	map_const EAST_TRAIN_CABIN_3,						   8,  4 ; 3
	map_const EAST_TRAIN_CABOOSE,						   2,  2 ; 4
	
	newgroup													 ; 13
	
	map_const LUSTER_CITY_RESIDENTIAL,					  15, 30 ; 1
	map_const LUSTER_CITY_SHOPPING,					      12, 30 ; 2
	
