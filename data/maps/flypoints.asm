flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
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
	
	flypoint LASTFLYPOINT,		SUNSET_BAY
KANTO_FLYPOINT EQU const_value
	
	flypoint KANTO,      CINNABAR_LAB
	db -1
