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
	newgroup                                                     ; 1

	map_const DAYBREAK_GROTTO_1,                           9,  7 ;  8
	map_const DAYBREAK_GROTTO_2,                           9, 11 ;  9
	map_const GLINT_GROVE,                                29, 30 ;  8
	map_const GLINT_GROVE_DEEP,							   7,  7 ;  ?
	map_const STARGLOW_CAVERN_1F,                         19, 16 ; 23
	map_const STARGLOW_CAVERN_2F,                         14, 13 ; 26
	
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
	map_const GLINT_APARTMENT_LEFT_2F,             		   4,  4 ;  1
	map_const GLINT_APARTMENT_RIGHT_1F,                    4,  4 ;  4
	map_const GLINT_APARTMENT_RIGHT_2F,                    4,  4 ;  2
	map_const GLINT_MART,                                  6,  4 ;  3
	map_const GLINT_GYM,                                   5,  9 ;  5
	map_const GLINT_GROVE_ENTRANCE,                        9,  9 ;  6
	map_const GLINT_CITY,                                 19, 11 ;  7
	map_const GLINT_RIVAL_HOUSE,                  		   4,  4 ;  8
	map_const GLINT_EVO_HOUSE,                             4,  4 ;  9
	map_const ROUTE_3,                                    30, 17 ;  2

	newgroup                                                     ;  5

	map_const ROUTE_3_STARGLOW,                            6,  8 ; 14
	map_const STARGLOW_VALLEY,                            19, 17 ;  6
	map_const STARGLOW_TOGEPI_HOUSE,                       4,  4 ; 29
	map_const STARGLOW_NO_POKEMON_HOUSE,                   4,  4 ; 30
	map_const STARGLOW_GRANDPA_HOUSE,                      4,  4 ; 31
	map_const STARGLOW_FISHING_GURU_HOUSE,                 4,  4 ; 32
	map_const STARGLOW_POKECENTER,                         6,  4 ; 33
	map_const STARGLOW_MART,							   6,  4 ; 34
	map_const STARGLOW_GYM,                                6, 11 ;  3
	map_const ROUTE_4,                                    23, 12 ; 12
	map_const HUNTERS_THICKET,                            15, 12 ; 71
	map_const ROUTE_5,                                    18, 28 ; 12
	map_const ROUTE_5_DEEP,                                8,  8 ;  1
	map_const ROUTE_5_GATE,                     		   4,  4 ;  3

	newgroup                                                     ;  6

	map_const ROUTE_6,                                    37, 18 ;  1
	map_const ROUTE_7,                                    20, 12 ;  1
	map_const LAKE_ONWA,                                  31, 26 ;  1

	newgroup                                                     ;  7


	newgroup                                                     ;  8
	

	newgroup                                                     ;  9


	newgroup                                                     ; 10


	newgroup                                                     ; 11


	newgroup                                                     ; 12


	newgroup                                                     ; 13


	newgroup                                                     ; 14


	newgroup                                                     ; 15


	newgroup                                                     ; 16


	newgroup                                                     ; 17


	newgroup                                                     ; 18


	newgroup                                                     ; 19


	newgroup                                                     ; 20


	newgroup                                                     ; 21


	newgroup                                                     ; 22


	newgroup                                                     ; 23


	newgroup                                                     ; 24
	

	newgroup                                                     ; 25


	newgroup                                                     ; 26
	
	
	newgroup                                                     ; 27


	newgroup                                                     ; 28


	newgroup                                                     ; 29


	newgroup                                                     ; 30


	newgroup                                                     ; 31


	newgroup                                                     ; 32


	newgroup                                                     ; 33


	newgroup                                                     ; 34


	newgroup                                                     ; 35
