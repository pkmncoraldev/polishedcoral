landmark: MACRO
	db \1, \2
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark   0,   0, SunsetBayName
	landmark   0,   0, SunsetCapeName
	landmark   0,   0, Route1Name
	landmark   0,   0, DaybreakVillageName
	landmark   0,   0, Route2Name
	landmark   0,   0, DaybreakGrottoName
	landmark   0,   0, GlintCityName
	landmark   0,   0, GlintGroveName


SunsetBayName:         db "SUNSET¯BAY@"
SunsetCapeName:        db "SUNSET¯CAPE@"
DaybreakVillageName:   db "DAYBREAK¯VILLAGE@"
Route1Name:            db "ROUTE 1@"
Route2Name:            db "ROUTE 2@"
DaybreakGrottoName:    db "DAYBREAK¯GROTTO@"
GlintCityName:   	   db "GLINT¯CITY@"
GlintGroveName:   	   db "GLINT¯GROVE@"
SpecialMapName:        db "?","@"
