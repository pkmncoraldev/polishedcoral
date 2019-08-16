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
	
	spawn N_A,                        -1, -1
