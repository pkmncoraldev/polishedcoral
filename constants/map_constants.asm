MACRO newgroup
DEF const_value = const_value + 1
	enum_start 1
ENDM

MACRO map_const
DEF GROUP_\1 EQU const_value
	enum MAP_\1
DEF \1_WIDTH  EQU \2
DEF \1_HEIGHT EQU \3
ENDM

DEF GROUP_N_A  EQU -1
DEF MAP_N_A    EQU -1

DEF GROUP_NONE EQU 0
DEF MAP_NONE   EQU 0

; map group ids
	const_def
	newgroup                                                     ;  1

	map_const PLAYER_HOUSE_1F,                             5,  4 ;  1
	map_const PLAYER_HOUSE_2F,                            10, 12 ;  2
	map_const DAYBREAK_GROTTO_1,                           9,  7 ;  3
	map_const DAYBREAK_GROTTO_2,                          10, 11 ;  4
	map_const DAYBREAK_GROTTO_3,                           9, 20 ;  5
	map_const GLINT_GROVE,                                20, 30 ;  6
	map_const GLINT_GROVE_EAST,                           10, 25 ;  7
	map_const GLINT_GROVE_DEEP,							  12, 18 ;  8
	map_const STARGLOW_CAVERN_1F,                         19, 16 ;  9
	map_const STARGLOW_CAVERN_2F,                         14, 13 ; 10
	map_const STARGLOW_CAVERN_3F,                          6,  8 ; 11
	map_const STARGLOW_CAVERN_FOSSIL_ROOM,                 4,  6 ; 12
	map_const MT_ONWA_1F,                       		  29, 14 ; 13
	map_const MT_ONWA_2F,                                 14, 10 ; 14
	map_const MT_ONWA_B1F,								  18, 20 ; 15
	map_const MT_ONWA_B2F,								  23, 15 ; 16
	map_const MT_ONWA_B3F,								  11, 14 ; 17
	map_const MT_ONWA_CLIFF,							  20, 20 ; 18
	map_const MT_ONWA_LOWER_CLIFF,						  13, 12 ; 19
	map_const FLICKER_PASS_1F,							  21, 22 ; 20
	map_const FLICKER_PASS_2F,							  25, 26 ; 21
	map_const LUSTER_SEWERS_B1F,						  15, 12 ; 22
	map_const LUSTER_SEWERS_B2F,						  15, 11 ; 23
	map_const LUSTER_SEWERS_VALVE_ROOM,				      16,  3 ; 24
	map_const LUSTER_SEWERS_THRONE_ROOM,				   6,  7 ; 25
	map_const LUSTER_SEWERS_MUK_ROOM,				  	   6,  6 ; 26
	map_const ICE_CAVE_B1F,								  15,  7 ; 27
	map_const ICE_CAVE_B2F,								  15, 16 ; 28
	map_const ICE_CAVE_B3F,								  16, 16 ; 29
	map_const ICE_TEMPLE_B1F_1,							  14, 11 ; 30
	map_const ICE_TEMPLE_B1F_2,							  14, 10 ; 31
	map_const ICE_TEMPLE_B1F_3,							   4,  4 ; 32
	map_const ICE_TEMPLE_B2F_1,							   8,  6 ; 33
	map_const ICE_TEMPLE_B2F_2,							  13,  7 ; 34
	map_const CONNECTING_CAVERN_ENTRANCE,				  10,  6 ; 35
	map_const ROUTE_6_UNDERWATER_CAVE,					   6,  8 ; 36
	map_const GREEN_GROTTO_1F,							  23, 15 ; 37
	map_const GREEN_GROTTO_B1F,							  20, 13 ; 38
	map_const GREEN_GROTTO_2F,							  15, 12 ; 39

	newgroup                                                     ;  2

	map_const SUNSET_BAY,                                 22, 25 ;  1
	map_const SUNSET_CAPE,                                12, 23 ;  2
	map_const SUNSET_POKECENTER,                    	   6,  4 ;  3
	map_const SUNSET_LIGHTHOUSE,                           5,  5 ;  4
	map_const SUNSET_WATER_GRASS_HOUSE,                    4,  4 ;  5
	map_const SUNSET_GENGAR_HOUSE,                         4,  4 ;  6
	map_const SUNSET_LEGENDS_HOUSE,                        4,  4 ;  7
	map_const SUNSET_CAPTAINS_HOUSE,                       4,  4 ;  8
	map_const SUNSET_CAFE,                  			   4,  4 ;  9
	map_const ROUTE_1_GATE,                          	   4,  4 ; 10
	map_const SAILBOAT_CUTSCENE,						   7,  1 ; 11
	map_const SUNSET_LIGHTHOUSE_BASEMENT,				   4,  5 ; 12
	map_const SUNSET_LIGHTHOUSE_ELEVATOR,				   2,  2 ; 13
	map_const SUNSET_LIGHTHOUSE_TOP,					  10,  5 ; 14

	newgroup                                                     ;  3

	map_const ROUTE_1,                                    14, 17 ;  1
	map_const ROUTE_2,                              	  19, 24 ;  2
	map_const DAYBREAK_VILLAGE,                           13, 10 ;  3
	map_const DAYBREAK_POKEMON_TRAINER_SCHOOL,             4,  8 ;  4
	map_const DAYBREAK_MARCUS_HOUSE,                	   4,  4 ;  5
	map_const DAYBREAK_POKECENTER,                         6,  4 ;  6
	map_const DAYBREAK_ALEX_HOUSE,                     	   4,  4 ;  7
	map_const STARGLOW_CAVERN_DEPTHS,					  18, 10 ;  8

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
	map_const ROUTE_3,                                    28, 16 ; 12
	map_const ROUTE_3_FRIENDSHIP_HOUSE,                    4,  4 ; 13
	map_const ROUTE_8,                                    31, 20 ; 14
	map_const ROUTE_8_ENCOUNTER_HOUSE,                     4,  4 ; 15
	map_const ROUTE_8_GARDEN,                             31, 20 ; 16
	map_const ROUTE_8_GATE,                                4,  4 ; 17
	map_const ROUTE_3_STARGLOW_CAVERN_TOP,				  10, 13 ; 18

	newgroup                                                     ;  5

	map_const ROUTE_3_EAST,                		          22, 16 ;  1
	map_const STARGLOW_VALLEY,                            19, 17 ;  2
	map_const STARGLOW_TOGEPI_HOUSE,                       4,  4 ;  3
	map_const STARGLOW_NO_POKEMON_HOUSE,                   4,  4 ;  4
	map_const STARGLOW_GRANDPA_HOUSE,                      4,  4 ;  5
	map_const STARGLOW_FISHING_GURU_HOUSE,                 4,  4 ;  6
	map_const STARGLOW_POKECENTER,                         6,  4 ;  7
	map_const STARGLOW_MART,							   6,  4 ;  8
	map_const STARGLOW_GYM,                                6, 11 ;  9
	
	map_const HUNTERS_THICKET,                            33, 17 ; 11
	map_const ROUTE_5,                                    18, 28 ; 12
	map_const ROUTE_5_DEEP,                                9,  8 ; 13
	map_const ROUTE_5_GATE_1F,                     		   8,  4 ; 14
	map_const ROUTE_5_GATE_2F,                     		   5,  5 ; 15

	newgroup                                                     ;  6

	map_const ROUTE_6,                                    37, 11 ;  1
	map_const ROUTE_7,                                    20, 12 ;  2
	map_const LAKE_ONWA,                                  33, 26 ;  3
	map_const LAKE_ONWA_BOAT_HOUSE_RIGHT,                  4,  3 ;  4
	map_const LAKE_ONWA_BOAT_HOUSE_LEFT,                   4,  3 ;  5
	map_const LAKE_ONWA_NAME_RATER_HOUSE,                  4,  4 ;  6
	map_const LAKE_ONWA_ITEM_HOUSE,                 	   4,  4 ;  7
	map_const LAKE_ONWA_POKECENTER,						   6,  4 ;  8
	map_const LAKE_ONWA_MART,                              6,  4 ;  9
	map_const ROUTE_6_SOUTH,                              37, 12 ;  10
	
	newgroup                                                     ;  7

	map_const SUNBEAM_ISLAND,                             25, 30 ;  1
	map_const SUNBEAM_BEACH,                              10, 30 ;  2
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
	map_const SUNBEAM_RESERVE,                            25, 11 ; 13
	map_const SUNBEAM_JUNGLE,  			             	  16, 16 ; 14
	map_const SUNBEAM_JUNGLE_CAVE,  			          12,  6 ; 15
	map_const SUNBEAM_JUNGLE_DEEP,  			          20, 17 ; 16
	map_const ROUTE_13,                            		  31, 10 ; 17
	
	newgroup                                                     ;  8
	
	map_const ROUTE_4_EVENTIDE_GATE,					   5,  4 ;  1
	map_const EVENTIDE_FOREST,							  23, 36 ;  2
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
	map_const SPOOKHOUSE_HALLWAY_1,						   5,  2 ; 19
	map_const SPOOKHOUSE_HALLWAY_2,						   5,  2 ; 20
	map_const SPOOKHOUSE_TV_ROOM,						   3,  6 ; 21

	newgroup													 ;  9
	
	map_const EVENTIDE_VILLAGE,							  19, 24 ; 1
	map_const EVENTIDE_GYM_SPEECH_HOUSE,       		       4,  4 ; 2
	map_const EVENTIDE_SOOTHE_BELL_HOUSE,  		       	   4,  4 ; 3
	map_const EVENTIDE_BIKE_SHOP,       		           4,  4 ; 4
	map_const EVENTIDE_POKECENTER,                         6,  4 ; 5
	map_const EVENTIDE_MART,							   6,  4 ; 6
	map_const EVENTIDE_GYM,								  23, 11 ; 7
	map_const ROUTE_9,		 							  21, 40 ; 8
	map_const DODRIO_RANCH_HOUSE,						   4,  4 ; 9
	map_const DODRIO_RANCH_BARN,						   5,  4 ; 10
	map_const DODRIO_RANCH_RACETRACK,					  25, 17 ; 11

	newgroup													 ; 10
	
	map_const FLICKER_STATION,							  19, 20 ; 1
	map_const FLICKER_SOUND_SPEECH_HOUSE,				   4,  4 ; 2
	map_const FLICKER_NAME_SPEECH_HOUSE,				   4,  4 ; 3
	map_const FLICKER_POKECENTER,                          6,  4 ; 4
	map_const FLICKER_MART,								   6,  4 ; 5
	map_const FLICKER_TRAIN_STATION,					   8,  6 ; 6
	map_const FLICKER_PASS_OUTSIDE,						  12,  9 ; 7
	map_const FLICKER_TRAIN_CUTSCENE,					  28,  7 ; 8
	map_const LUSTER_TRAIN_CUTSCENE,					  33,  4 ; 9
	map_const LUSTER_TRAIN_STATION,						  16,  8 ; 10
	map_const FLICKER_TRAIN_GRAVEYARD,					  14, 18 ; 11
	
	newgroup													 ; 11
	
	map_const ROUTE_10,									  29, 26 ; 1
	map_const ROUTE_10_EAST,							  12, 17 ; 2
	map_const ROUTE_10_TENT,							   2,  3 ; 3
	map_const TWINKLE_TOWN,								  26, 28 ; 4
	map_const TWINKLE_ROCK_HOUSE,						   4,  5 ; 5
	map_const TWINKLE_TRADE_HOUSE,						   4,  5 ; 6
	map_const TWINKLE_SNOW_HOUSE,						   4,  5 ; 7
	map_const TWINKLE_POKECENTER,                          6,  4 ; 8
	map_const TWINKLE_MART,								   6,  4 ; 9
	map_const TWINKLE_GYM_ENTRY,						   7,  7 ; 10
	map_const TWINKLE_GYM_BLUE_ROOM,					   7,  9 ; 11
	map_const TWINKLE_GYM_YELLOW_ROOM,					   8, 11 ; 12
	map_const TWINKLE_GYM_RED_ROOM,						  24, 28 ; 13
	map_const ROUTE_10_REST_HOUSE,						   4,  5 ; 14
	map_const ROUTE_10_MOVE_REMINDER_HOUSE,				   4,  5 ; 15
	map_const ROUTE_18_TRAILER,							   3,  2 ; 16
	
	newgroup													 ; 12
	
	map_const TRAIN_CABIN_1,						 	   8,  4 ; 1
	map_const TRAIN_CABIN_2,						  	   8,  4 ; 2
	map_const WEST_TRAIN_CAB,							   3,  2 ; 3
	map_const EAST_TRAIN_CABOOSE,						   2,  2 ; 4
	map_const LUSTER_CITY_BUSINESS,					      25, 24 ; 5
	map_const WEST_TRAIN_CABOOSE,						   2,  2 ; 6
	
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
	map_const LUSTER_MALL,								  21, 15 ; 17
	map_const LUSTER_MALL_POKECENTER,                      6,  4 ; 18
	map_const LUSTER_MALL_ELECTRONICS_SHOP,				   6,  4 ; 19
	map_const LUSTER_MALL_COFFEE_SHOP,					   5,  4 ; 20
	map_const LUSTER_MALL_SKATE_SHOP,					   4,  3 ; 21
	map_const LUSTER_MALL_SKATE_TEST,					  10,  7 ; 22
	map_const LUSTER_MALL_ANTIQUE_SHOP,					   4,  4 ; 23
	map_const LUSTER_MALL_HERB_SHOP,					   4,  3 ; 24
	map_const LUSTER_MALL_STONE_SHOP,					   4,  4 ; 25
	map_const LUSTER_MALL_BALL_SHOP,					   4,  4 ; 26
	map_const LUSTER_MALL_CLOTHES_SHOP,					   6,  4 ; 27
	map_const LUSTER_MALL_FURNITURE,					   6,  6 ; 28
	map_const LUSTER_MALL_BACK_ROOM,					   7,  8 ; 29
	map_const LUSTER_SKYSCRAPER_1_1F,					   5,  4 ; 30
	map_const LUSTER_SKYSCRAPER_1_2F,					   4,  4 ; 31
	map_const LUSTER_SKYSCRAPER_1_3F,					   4,  4 ; 32
	map_const LUSTER_SKYSCRAPER_1_4F,					   4,  4 ; 33
	map_const LUSTER_SKYSCRAPER_1_5F,					   4,  4 ; 34
	map_const LUSTER_SKYSCRAPER_1_ELEVATOR,				   2,  2 ; 35
	map_const LUSTER_SKYSCRAPER_2_1F,					   5,  4 ; 36
	map_const LUSTER_SKYSCRAPER_2_ELEVATOR,				   2,  2 ; 37
	map_const LUSTER_SKYSCRAPER_B1F,					   8,  2 ; 38
	map_const LUSTER_SKYSCRAPER_PORYGON_ROOM,			   3,  6 ; 39
	map_const LUSTER_GYM,								   9, 11 ; 40
	
	newgroup													 ; 14
	
	map_const NETT_BUILDING_1F,							   9,  7 ; 1
	map_const NETT_BUILDING_2F,							   6,  7 ; 2
	map_const NETT_BUILDING_ELEVATOR,					   2,  2 ; 3
	map_const NETT_BUILDING_M_BATHROOM,					   3,  4 ; 4
	map_const NETT_BUILDING_F_BATHROOM,					   3,  4 ; 5
	map_const NETT_BUILDING_STAIRWELL,					   3,  5 ; 6
	map_const NETT_BUILDING_OFFICE,						   5,  5 ; 7
	map_const CONNECTING_CAVERN,						  20, 24 ; 8
	
	newgroup													 ; 15
	map_const SKATEPARK,								  16, 32 ; 2
	map_const ROUTE_12_GATE,							   4,  4 ; 3
	map_const AIRPORT_GATE,								   4,  4 ; 4
	map_const ROUTE_11,									  16, 16 ; 5
	map_const ONWA_INTL_AIRPORT,						  28, 11 ; 6
	map_const AIRPORT_RUNWAY,							  28,  8 ; 7
	map_const AIRPORT,									   7, 11 ; 8
	map_const ROUTE_11_GATE,							   4,  4 ; 9
	
	newgroup													 ; 16
	
	map_const SHIMMER_CITY,					  			  23, 18 ; 1
	map_const SHIMMER_HARBOR,					  		  11, 18 ; 2
	map_const SHIMMER_LAB_LOBBY,			  			   7,  3 ; 3
	map_const SHIMMER_LAB_RESEARCH_ROOM,				   5,  5 ; 4
	map_const SHIMMER_LAB_EXPERIMENTAL_LAB,  			   6,  5 ; 5
	map_const SHIMMER_UNDER_BOARDWALK,		  			   7, 11 ; 6
	map_const SHIMMER_BOAT_HOUSE,                   	   4,  3 ; 7
	map_const SHIMMER_POKECENTER,                    	   6,  4 ; 8
	map_const SHIMMER_MART,                    			   6,  4 ; 9
	map_const SHIMMER_HOUSE_1,							   4,  4 ; 10
	map_const SHIMMER_HOUSE_2,							   4,  4 ; 11
	map_const SHIMMER_CAFE,								   4,  4 ; 12
	map_const ROUTE_14,									  15, 24 ; 13
	map_const ROUTE_15,									  44, 20 ; 14
	map_const ROUTE_4,                                    31, 16 ; 10
	map_const ROUTE_12,									  20, 25 ; 11
	map_const ROUTE_19,									  24, 26 ; 12
	map_const ROUTE_11_2,								  16, 15 ; 13
	map_const ROUTE_32,									  13, 16 ; 14
	
	
	newgroup													 ; 17
	
	map_const BRILLO_TOWN,								  23, 18 ; 1
	map_const ROUTE_18_NORTH,       	           	  	  13, 15 ; 2 HAS TO BE HERE FOR FIRE PAL
	map_const BRILLO_BOAT_HOUSE,                    	   4,  3 ; 3
	map_const BRILLO_ROCK_HOUSE,						   4,  4 ; 4
	map_const BRILLO_TRADE_HOUSE,						   4,  4 ; 5
	map_const BRILLO_LEGEND_SPEECH_HOUSE,				   4,  4 ; 6
	map_const BRILLO_POKECENTER,                    	   6,  4 ; 7
	map_const BRILLO_MART,                    			   5,  4 ; 8
	map_const BRILLO_GAME_CORNER,              			   7,  5 ; 9
	map_const BRILLO_POLICE_STATION,           			  10,  8 ; 10
	map_const ROUTE_17,  		       	           		  24, 17 ; 11
	map_const ROUTE_18,   		      	           		  15, 18 ; 12
	map_const DESERT_WASTELAND_1,              			   9,  9 ; 13
	map_const DESERT_WASTELAND_2,              			   9,  9 ; 14
	map_const DESERT_WASTELAND_3,              			   9,  9 ; 15
	map_const DESERT_WASTELAND_4,              			   9,  9 ; 16
	map_const DESERT_WASTELAND_5,              			   9,  9 ; 17
	map_const DESERT_WASTELAND_6,              			   9,  9 ; 18
	map_const DESERT_WASTELAND_7,              			   9,  9 ; 19
	map_const DESERT_WASTELAND_8,              			   9, 14 ; 20
	map_const DESERT_WASTELAND_9,              			   9,  9 ; 21
	map_const DESERT_WASTELAND_OASIS,          			  11, 11 ; 22
	map_const DESERT_TEMPLE_OUTSIDE,           			  17, 13 ; 23
	map_const BRILLO_POLICE_BACK_ROOM,         			   3,  4 ; 24
	
	newgroup													 ; 18
	
	map_const DESERT_TEMPLE_1,							  11, 19 ; 1
	map_const DESERT_TEMPLE_TOP_LEFT,					   6, 11 ; 2
	map_const DESERT_TEMPLE_TOP_RIGHT,					  18, 14 ; 3
	map_const DESERT_TEMPLE_LOWER_LEFT,					  14, 10 ; 4
	map_const DESERT_TEMPLE_LOWER_RIGHT,				  12, 11 ; 5
	map_const DESERT_TEMPLE_2,							   5,  9 ; 6
	
	newgroup													 ; 19
	
	map_const ROUTE_20,									  10, 16 ; 1
	map_const RADIANT_TOWNSHIP,							  23, 14 ; 2
	map_const RADIANT_FLOWER_SHOP,						   5,  4 ; 3
	map_const RADIANT_ORPHANAGE_1F,						   6,  5 ; 4
	map_const RADIANT_ORPHANAGE_2F,						   8,  4 ; 5
	map_const RADIANT_ORPHANAGE_LEILANIS_ROOM,			   3,  3 ; 6
	map_const RADIANT_GYM,								   5, 10 ; 7
	map_const RADIANT_POKECENTER,                      	   6,  4 ; 8
	map_const RADIANT_MART,                                6,  4 ; 9
	map_const ROUTE_21_GATE,                          	   4,  4 ; 10
	map_const RADIANT_HOUSE,     	             		   4,  4 ; 11
	map_const RADIANT_FIELD,							  19, 15 ; 12
	
	newgroup													 ; 20
	
	map_const ROUTE_21,									  20, 17 ; 1
	map_const DUSK_TURNPIKE,							  18, 19 ; 2
	map_const DUSK_POKECENTER,                      	   6,  4 ; 3
	map_const DUSK_MART,                             	   6,  4 ; 4
	map_const ROUTE_19_DUSK_GATE,						   5,  4 ; 5
	map_const DUSK_HOUSE_1,     	             		   4,  4 ; 6
	map_const DUSK_HOUSE_3,     	             		   4,  4 ; 8
	map_const DUSK_AUTO_LOBBY,							   4,  3 ; 9
	map_const DUSK_AUTO_GARAGE,							   4,  4 ; 10
	map_const ROUTE_22_TUNNEL,							  20, 12 ; 11
	map_const SEASIDE_CAVE_1F,							  12, 19 ; 12
	map_const DUSK_HOUSE_2,     	             		   4,  4 ; 
	map_const SEASIDE_CAVE_B1F,							  13, 21 ; 13
	map_const SEASIDE_CAVE_B2F,							   8, 10 ; 14
	map_const BAR_BACK_ALLEY,							  10,  6 ; 15
	map_const BAR_INSIDE,								   8,  5 ; 16
	map_const CROSSROADS,								  22, 12 ; 17
	map_const ROUTE_22,									   7,  9 ; 18
	
	newgroup													 ; 21
	
	map_const ROUTE_14_15_UNDERWATER,					  36, 18 ; 1
	map_const ROUTE_13_UNDERWATER,						  12, 11 ; 2
	map_const ROUTE_6_UNDERWATER,						  43, 19 ; 3
	map_const CORAL_REEF,								  34, 23 ; 4
	map_const UNDERWATER_TEMPLE_OUTSIDE,				  13, 24 ; 5
	map_const UNDERWATER_TEMPLE_1,						  17, 22 ; 6
	map_const UNDERWATER_TEMPLE_2,						  15, 17 ; 7
	
	newgroup													 ; 22
	
	map_const ROUTE_23,									  21, 30 ; 1
	map_const ROUTE_23_WINDY,							   1,  1 ; 2
	map_const ROUTE_24_NORTH,							  21, 17 ; 3
	map_const ROUTE_24_NORTH_WINDY,						   1,  1 ; 4
	map_const ROUTE_24_SOUTH,							  20, 12 ; 5
	map_const ROUTE_24_SOUTH_WINDY,						   1,  1 ; 6
	map_const KOMORE_VILLAGE,							  18, 13 ; 7
	map_const KOMORE_COMMUNITY_CENTER,					   5,  4 ; 8
	map_const KOMORE_COMMUNITY_CENTER_LEFT,				   3,  4 ; 9
	map_const KOMORE_COMMUNITY_CENTER_MIDDLE,			   3,  4 ; 10
	map_const KOMORE_COMMUNITY_CENTER_RIGHT,			   3,  4 ; 11
	map_const KOMORE_HOUSE_1,							   4,  4 ; 12
	map_const KOMORE_HOUSE_2,							   4,  4 ; 13
	map_const KOMORE_HOUSE_3,							   4,  4 ; 14
	map_const KOMORE_TEA_HOUSE,							   4,  4 ; 15
	map_const KOMORE_POKECENTER,                      	   6,  4 ; 16
	map_const KOMORE_MART,                             	   6,  4 ; 17
	map_const FIGHTING_DOJO,                           	   4,  5 ; 18
	map_const ROUTE_25,									  23, 10 ; 19
	map_const ROUTE_25_WINDY,							   1,  1 ; 20
	map_const ROUTE_26,									  20, 17 ; 21
	map_const ROUTE_26_WINDY,							   1,  1 ; 22
	map_const ROUTE_27,									  28, 19 ; 23
	
	newgroup													 ; 23
	
	map_const BRIGHTBURG,								  17, 13 ; 1
	map_const BRIGHT_POKECENTER,                      	   6,  4 ; 2
	map_const BRIGHT_MART,                             	   6,  4 ; 3
	map_const BRIGHT_HOUSE_1,     	             		   4,  4 ; 4
	map_const BRIGHT_HOUSE_2,     	             		   4,  4 ; 5
	map_const BRIGHT_HOUSE_3,     	             		   4,  4 ; 6
	map_const ROUTE_25_GATE,                          	   4,  4 ; 7
	map_const BRIGHTBURG_GATE,							   5,  4 ; 8
	map_const ROUTE_28,									  20, 38 ; 9
	map_const ROUTE_28_OTTOS_TENT,                     	   2,  3 ; 10
	map_const ROUTE_30,									   7,  5 ; 
	
	newgroup													 ; 24
	map_const OBSCURA_CITY,								  19, 27 ; 1
	map_const OBSCURA_GATE,								   5,  4 ; 2
	map_const OBSCURA_MUSEUM_1F,						  12,  8 ; 3
	map_const OBSCURA_MUSEUM_2F,						  14,  8 ; 4
	map_const OBSCURA_MUSEUM_3F,						   9,  8 ; 5
	map_const OBSCURA_MUSEUM_EMPLOYEE_ROOM,				   7,  7 ; 6
	map_const OBSCURA_GYM,								  15, 12 ; 7
	map_const OBSCURA_MUSEUM_PHOTO,						   4,  2 ; 7
	map_const OBSCURA_FORTUNE_HOUSE,              		   4,  4 ; 8
	map_const OBSCURA_POKECENTER,						   6,  4 ; 9
	map_const OBSCURA_MART,								   6,  4 ; 10
	
	newgroup													 ; 25
	map_const AUREOLE_TOWN,								  20, 23 ; 1
	map_const ROUTE_29,									  38, 12 ; 2
	map_const ROUTE_29_MEADOW,							  18, 10 ; 3
	
	newgroup													 ; 26
	map_const INN_1F,									  13, 12 ; 1
	map_const INN_2F,									  13,  7 ; 2
	map_const INN_3F,									  16,  7 ; 3
	map_const INN_ELEVATOR,								   2,  2 ; 4
	map_const INN_VENT,									  18, 10 ; 5
	map_const ROUTE_23_GATE,                          	   4,  4 ; 6
	
	newgroup													 ; EVO LOCATIONS GROUP
	map_const ICE_CAVE_ICE_ROCK_ROOM,					   5,  5 ; 1
	map_const HUNTERS_THICKET_MOSS_ROCK_ROOM,              7,  7 ; 2
	map_const GLINT_GROVE_UNDERGROUND,					  23, 24 ; 3
	
	newgroup													 ; last
	map_const FAKE_ROUTE_1,                               14, 17 ;  1
	map_const FAKE_ROUTE_2,                               14, 17 ;  2
