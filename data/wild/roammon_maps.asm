; Maps that roaming monsters can be on, and possible maps they can jump to..

MACRO roam_map
	map_id \1
	db _NARG - 1
rept _NARG +- 1
	map_id \2
	shift
endr
	db 0
ENDM

RoamMaps:
	roam_map ROUTE_1, ROUTE_2
	roam_map ROUTE_2, ROUTE_1, ROUTE_3, GLINT_GROVE
	roam_map GLINT_GROVE, ROUTE_2, ROUTE_3
	roam_map ROUTE_3, ROUTE_2, GLINT_GROVE, ROUTE_3_EAST, ROUTE_8
	roam_map ROUTE_3_EAST, ROUTE_3, ROUTE_4, ROUTE_8
	roam_map ROUTE_4, ROUTE_3_EAST, HUNTERS_THICKET, EVENTIDE_FOREST, ROUTE_5
	roam_map ROUTE_5, ROUTE_4, ROUTE_6
	roam_map ROUTE_6, ROUTE_5, ROUTE_7
	roam_map ROUTE_7, ROUTE_6, ROUTE_8
	roam_map HUNTERS_THICKET, ROUTE_4
	roam_map EVENTIDE_FOREST, ROUTE_4, ROUTE_9
	roam_map ROUTE_9, EVENTIDE_FOREST, ROUTE_11, ROUTE_10
	roam_map ROUTE_11, ROUTE_9
	roam_map ROUTE_10, ROUTE_9
	roam_map ROUTE_19, ROUTE_20, ROUTE_21
	roam_map ROUTE_20, ROUTE_19, ROUTE_21
	roam_map ROUTE_21, ROUTE_19, ROUTE_20, ROUTE_23
	roam_map ROUTE_23, ROUTE_24_SOUTH, ROUTE_24_NORTH, ROUTE_25, ROUTE_26
	roam_map ROUTE_24_SOUTH, ROUTE_24_NORTH, ROUTE_23
	roam_map ROUTE_24_NORTH, ROUTE_24_SOUTH, ROUTE_23
	roam_map ROUTE_25, ROUTE_23, ROUTE_27
	roam_map ROUTE_26, ROUTE_23, ROUTE_27
	roam_map ROUTE_27, ROUTE_25, ROUTE_26, ROUTE_28
	roam_map ROUTE_28, ROUTE_27, ROUTE_29
	roam_map ROUTE_29, ROUTE_28
	db -1
	
PossibleRoamMaps:
	map_id ROUTE_1
	map_id ROUTE_2
	map_id GLINT_GROVE
	map_id ROUTE_3
	map_id ROUTE_3_EAST
	map_id ROUTE_4
	map_id ROUTE_5
	map_id ROUTE_6
	map_id ROUTE_7
	map_id HUNTERS_THICKET
	map_id EVENTIDE_FOREST
	map_id ROUTE_9
	map_id ROUTE_11
	map_id ROUTE_10
	map_id ROUTE_19
	map_id ROUTE_20
	map_id ROUTE_21
	map_id ROUTE_23
	map_id ROUTE_24_SOUTH
	map_id ROUTE_24_NORTH
	map_id ROUTE_25
	map_id ROUTE_26
	map_id ROUTE_27
	map_id ROUTE_28
	map_id ROUTE_29
	db -1

DEF NUM_ROAMMON_MAPS EQU 25
