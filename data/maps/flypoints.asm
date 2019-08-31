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
	flypoint LASTFLYPOINT,		SUNSET_BAY
KANTO_FLYPOINT EQU const_value
	
	flypoint KANTO,      CINNABAR_LAB
	db -1
