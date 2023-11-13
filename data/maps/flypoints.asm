flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; spawn point, landmark
	const_def
	flypoint SUNSET,			SUNSET_BAY
	flypoint DAYBREAK,			DAYBREAK_VILLAGE
	flypoint GLINT,				GLINT_CITY
	flypoint STARGLOW,			STARGLOW_VALLEY
	flypoint LAKE,				LAKE_ONWA
	flypoint SUNBEAM,			SUNBEAM_ISLAND
	flypoint EVENTIDE,			EVENTIDE_VILLAGE
	flypoint FLICKER,			FLICKER_STATION
	flypoint TWINKLE,			TWINKLE_TOWN
	flypoint LUSTER,			LUSTER_CITY
	
SOUTH_ONWA_FLYPOINT EQU const_value
	
	flypoint SHIMMER,			SHIMMER_CITY
	flypoint BRILLO,			BRILLO_TOWN
	flypoint RADIANT,			RADIANT_TOWNSHIP
	flypoint DUSK,				DUSK_TURNPIKE
	
	flypoint LASTFLYPOINT,		SHIMMER_CITY
	db -1
