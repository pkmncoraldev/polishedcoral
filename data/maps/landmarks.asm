landmark: MACRO
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark  20, 100, SunsetBayName
	landmark  28, 100, SunsetCapeName
	landmark  28, 108, LighthouseName
	landmark  28,  92, Route1Name
	landmark  28,  84, DaybreakVillageName
	landmark  28,  72, Route2Name
	landmark  36,  84, DaybreakGrottoName
	landmark  28,  60, GlintCityName
	landmark  28,  52, GlintGroveName
	landmark  48,  60, Route3Name
	landmark  60,  52, StarglowCavernName
	landmark  60,  68, StarglowValleyName
	landmark  72,  68, Route4Name
	landmark  68,  60, HuntersThicketName
	landmark  68,  84, Route5Name
	landmark  60, 100, Route6Name
	landmark  52,  92, Route7Name
	landmark  44,  92, LakeOnwaName
	landmark  44,  84, MtOnwaName
	landmark  68, 124, SunbeamIslandName
	landmark  52,  76, Route8Name
	landmark  84,  68, EventideForestName
	landmark  84,  52, OldManorName
	landmark  92,  68, EventideVillageName
	landmark 100,  64, Route9Name
	landmark 108,  60, DodrioRanchName
	landmark 100,  52, FlickerStationName
	landmark 100,  44, FlickerPassName
	landmark 108,  36, Route10Name
	landmark 108,  28, TwinkleTownName
	landmark 132,  52, LusterCityName
	landmark 132,  52, LusterSewersName
	landmark 132,  52, ResidentialName
	landmark 132,  52, ShoppingName
	landmark 132,  52, BusinessName
	landmark -16, -16, GateName


SunsetBayName:         db "SUNSET BAY@"
SunsetCapeName:        db "SUNSET CAPE@"
LighthouseName:		   db "SUNSET¯LIGHTHOUSE@"
DaybreakVillageName:   db "DAYBREAK¯VILLAGE@"
Route1Name:            db "ROUTE 1@"
Route2Name:            db "ROUTE 2@"
DaybreakGrottoName:    db "DAYBREAK¯GROTTO@"
GlintCityName:   	   db "GLINT CITY@"
GlintGroveName:   	   db "GLINT GROVE@"
Route3Name:            db "ROUTE 3@"
StarglowCavernName:	   db "STARGLOW¯CAVERN@"
StarglowValleyName:	   db "STARGLOW¯VALLEY@"
Route4Name:            db "ROUTE 4@"
HuntersThicketName:	   db "HUNTERS¯THICKET@"
Route5Name:            db "ROUTE 5@"
Route6Name:            db "ROUTE 6@"
Route7Name:            db "ROUTE 7@"
LakeOnwaName:          db "LAKE ONWA@"
MtOnwaName:			   db "MT. ONWA@"
SunbeamIslandName:	   db "SUNBEAM¯ISLAND@"
Route8Name:  		   db "ROUTE 8@"
EventideForestName:	   db "EVENTIDE¯FOREST@"
OldManorName:		   db "OLD MANOR@"
EventideVillageName:   db "EVENTIDE¯VILLAGE@"
Route9Name:			   db "ROUTE 9@"
DodrioRanchName:	   db "DODRIO¯RANCH@"
FlickerStationName:	   db "FLICKER¯STATION@"
FlickerPassName:	   db "FLICKER¯PASS@"
Route10Name:		   db "ROUTE 10@"
TwinkleTownName: 	   db "TWINKLE¯TOWN@"
LusterCityName:		   db "LUSTER CITY@"
LusterSewersName:	   db "LUSTER¯SEWERS@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
GateName:	 	 	   db "UNKOWN@"
SpecialMapName:        db "?","@"
