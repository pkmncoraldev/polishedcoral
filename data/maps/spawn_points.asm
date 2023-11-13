spawn: MACRO
; map, y, x
	map_id \1
	db \2, \3
ENDM

SpawnPoints: ; 0x152ab
	spawn PLAYER_HOUSE_2F,              4,  3
	spawn SUNSET_BAY,                  25,  8
	spawn DAYBREAK_VILLAGE,            13,  8
	spawn GLINT_CITY,                  27, 16
	spawn STARGLOW_VALLEY,			   17, 18
	spawn LAKE_ONWA,				   17, 18
	spawn SUNBEAM_ISLAND,			   17, 36
	spawn EVENTIDE_VILLAGE,			   13, 18
	spawn FLICKER_STATION,			    9, 30
	spawn TWINKLE_TOWN,				   11, 48
	spawn LUSTER_CITY_RESIDENTIAL,	   17, 26
	spawn SHIMMER_CITY,                33, 16
	spawn BRILLO_TOWN,				   22, 12
	spawn RADIANT_TOWNSHIP,             5,  8
	spawn DUSK_TURNPIKE,			   23, 32
	
	spawn STARGLOW_CAVERN_DEPTHS,	   16, 15
	spawn FAKE_ROUTE_1,   		       20, 29
	
	spawn N_A,                        -1, -1 ; SPAWN_LASTFLYPOINT
	spawn N_A,                        -1, -1 ; SPAWN_KANTO
