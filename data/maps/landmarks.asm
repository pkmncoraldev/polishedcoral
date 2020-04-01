landmark: MACRO
	db \1, \2
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark  28, 116, SunsetBayName
	landmark  36, 116, SunsetCapeName
	landmark  36, 124, LighthouseName
	landmark  36, 109, Route1Name
	landmark  36, 100, DaybreakVillageName
	landmark  36,  88, Route2Name
	landmark  44,  92, DaybreakGrottoName
	landmark  36,  76, GlintCityName
	landmark  36,  68, GlintGroveName
	landmark  52,  76, Route3Name
	landmark  68,  68, StarglowCavernName
	landmark  68,  84, StarglowValleyName
	landmark   0,   0, Route4Name
	landmark   0,   0, HuntersThicketName
	landmark   0,   0, Route5Name
	landmark   0,   0, Route6Name
	landmark   0,   0, Route7Name
	landmark   0,   0, LakeOnwaName
	landmark   0,   0, MtOnwaName
	landmark   0,   0, Route8Name
	landmark   0,   0, SunbeamIslandName
	landmark   0,   0, EventideForestName
	landmark   0,   0, OldManorName
	landmark   0,   0, Route9Name
	landmark   0,   0, DodrioRanchName
	landmark   0,   0, FlickerStationName
	landmark   0,   0, FlickerPassName
	landmark   0,   0, Route10Name
	landmark   0,   0, TwinkleTownName
	landmark   0,   0, LusterCityName
	landmark   0,   0, LusterSewersName
	landmark   0,   0, ResidentialName
	landmark   0,   0, ShoppingName
	landmark   0,   0, BusinessName


SunsetBayName:         db "SUNSET¯BAY@"
SunsetCapeName:        db "SUNSET¯CAPE@"
LighthouseName:		   db "SUNSET¯LIGHTHOUSE@"
DaybreakVillageName:   db "DAYBREAK¯VILLAGE@"
Route1Name:            db "ROUTE 1@"
Route2Name:            db "ROUTE 2@"
DaybreakGrottoName:    db "DAYBREAK¯GROTTO@"
GlintCityName:   	   db "GLINT¯CITY@"
GlintGroveName:   	   db "GLINT¯GROVE@"
Route3Name:            db "ROUTE 3@"
StarglowCavernName:	   db "STARGLOW¯CAVERN@"
StarglowValleyName:	   db "STARGLOW¯VALLEY@"
Route4Name:            db "ROUTE 4@"
HuntersThicketName:	   db "HUNTERS¯THICKET@"
Route5Name:            db "ROUTE 5@"
Route6Name:            db "ROUTE 6@"
Route7Name:            db "ROUTE 7@"
LakeOnwaName:          db "LAKE¯ONWA@"
MtOnwaName:			   db "MT. ONWA@"
Route8Name:  		   db "ROUTE 8@"
SunbeamIslandName:	   db "SUNBEAM¯ISLAND@"
EventideForestName:	   db "EVENTIDE¯FOREST@"
OldManorName:		   db "OLD MANOR@"
Route9Name:			   db "ROUTE 9@"
DodrioRanchName:	   db "DODRIO¯RANCH@"
FlickerStationName:	   db "FLICKER¯STATION@"
FlickerPassName:	   db "FLICKER¯PASS@"
Route10Name:		   db "ROUTE 10@"
TwinkleTownName: 	   db "TWINKLE¯TOWN@"
LusterCityName:		   db "LUSTER¯CITY@"
LusterSewersName:	   db "LUSTER¯SEWERS@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
SpecialMapName:        db "?","@"
