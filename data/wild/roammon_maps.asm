; Maps that roaming monsters can be on, and possible maps they can jump to.
; Notably missing are Route 40 and Route 41, which are water routes.

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
	roam_map ROUTE_29, ROUTE_30, ROUTE_46
	roam_map ROUTE_30, ROUTE_29, ROUTE_31
	roam_map ROUTE_31, ROUTE_30, GLINT_GROVE, ROUTE_36
	roam_map GLINT_GROVE, ROUTE_36, ROUTE_31, GLINT_GROVE_ENTRANCE
	roam_map GLINT_GROVE_ENTRANCE, GLINT_GROVE, ROUTE_4
	roam_map ROUTE_4, GLINT_GROVE_ENTRANCE, ROUTE_35
	roam_map ROUTE_35, ROUTE_4, ROUTE_36
	roam_map ROUTE_36, ROUTE_35, ROUTE_31, GLINT_GROVE, ROUTE_37
	roam_map ROUTE_37, ROUTE_36, ROUTE_38, ROUTE_42
	roam_map ROUTE_38, ROUTE_37, ROUTE_39, ROUTE_42
	roam_map ROUTE_39, ROUTE_38
	roam_map ROUTE_42, ROUTE_43, ROUTE_44, ROUTE_37, ROUTE_38
	roam_map ROUTE_43, ROUTE_42, ROUTE_44
	roam_map ROUTE_44, ROUTE_42, ROUTE_43, ROUTE_45
	roam_map ROUTE_45, ROUTE_44, ROUTE_46
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	db -1
