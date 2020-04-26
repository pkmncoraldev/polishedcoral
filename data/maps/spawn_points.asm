spawn: MACRO
; map, y, x
	map_id \1
	db \2, \3
ENDM

SpawnPoints: ; 0x152ab
	spawn PLAYER_HOUSE_2F,              3,  3
	spawn SUNSET_BAY,                  25, 10
	spawn DAYBREAK_VILLAGE,            13,  8
	spawn GLINT_CITY,                  27, 16
	spawn STARGLOW_VALLEY,			   17, 18
	spawn LAKE_ONWA,					1,  1
	spawn SUNBEAM_ISLAND,				1,  1
	spawn EVENTIDE_VILLAGE,				1,  1
	spawn FLICKER_STATION,				1,  1
	spawn TWINKLE_TOWN,					1,  1
	spawn LUSTER_CITY_RESIDENTIAL,		1,  1
	
	spawn N_A,                        -1, -1
