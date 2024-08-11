; Maps that roaming monsters can be on, and possible maps they can jump to..

roam_map: MACRO
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
	roam_map ROUTE_2, ROUTE_1, ROUTE_3
	roam_map ROUTE_3, ROUTE_2
	db -1

NUM_ROAMMON_MAPS EQU 3
