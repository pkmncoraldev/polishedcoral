treemon_map: macro
	map_id \1
	db  \2 ; treemon set
endm

TreeMonMaps:
	treemon_map SUNSET_BAY, 0
	db -1

RockMonMaps:
	treemon_map SUNSET_BAY, 6
	db -1
	
PetalMonMaps:
	treemon_map GLINT_GROVE, 7
	db -1
