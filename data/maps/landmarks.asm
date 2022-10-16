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
	landmark  36,  76, DaybreakGrottoName
	landmark  28,  60, GlintCityName
	landmark  28,  52, GlintGroveName
	landmark  42,  60, Route3Name
	landmark  52,  52, StarglowCavernName
	landmark  64,  76, StarglowValleyName
	landmark  78,  76, Route4Name
	landmark  76,  68, HuntersThicketName
	landmark  72,  88, Route5Name
	landmark  62, 100, Route6Name
	landmark  52,  92, Route7Name
	landmark  40,  92, LakeOnwaName
	landmark  44,  84, MtOnwaName
	landmark  60, 124, SunbeamIslandName
	landmark  68, 124, SunbeamJungleName
	landmark  52,  76, Route8Name
	landmark  84,  84, EventideForestName
	landmark  92,  80, OldManorName
	landmark  92,  92, EventideVillageName
	landmark 100,  88, Route9Name
	landmark 108,  84, DodrioRanchName
	landmark 100,  76, FlickerStationName
	landmark 100,  68, FlickerPassName
	landmark 120,  44, Route10Name
	landmark 116,  36, TwinkleTownName
	landmark 124,  28, FrozenRuinsName
	landmark 136,  80, LusterCityName
	landmark 132,  80, LusterSewersName
	landmark 132,  92, Route11Name
	landmark   0,   0, Route12Name
	landmark   0,   0, AirportName
	landmark   0,   0, Route13Name
	landmark   0,   0, Route14Name
	landmark   0,   0, ShimmerName
	landmark   0,   0, BrilloTownName
	landmark   0,   0, DesertRouteName
	
	landmark 136,  80, LusterStationName
	landmark 136,  80, ResidentialName
	landmark 136,  80, ShoppingName
	landmark 136,  80, BusinessName
	landmark -16, -16, GateName


SunsetBayName:         db "SUNSET BAY@"
SunsetCapeName:        db "SUNSET¯CAPE@"
LighthouseName:		   db "SUNSET¯LIGHTHOUSE@"
DaybreakVillageName:   db "DAYBREAK¯VILLAGE@"
Route1Name:            db "ROUTE 1@"
Route2Name:            db "ROUTE 2@"
DaybreakGrottoName:    db "DAYBREAK¯GROTTO@"
GlintCityName:   	   db "GLINT CITY@"
GlintGroveName:   	   db "GLINT¯GROVE@"
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
SunbeamJungleName:	   db "SUNBEAM¯JUNGLE@"
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
FrozenRuinsName: 	   db "FROZEN¯RUINS@"
LusterCityName:		   db "LUSTER¯CITY@"
LusterSewersName:	   db "LUSTER¯SEWERS@"
Route11Name:		   db "SKATEPARK@" ;"ROUTE 11@"
Route12Name:		   db "ROUTE 12@"
AirportName:		   db "ONWA INTL.¯AIRPORT@"
Route13Name:		   db "ROUTE 13@"
Route14Name:		   db "ROUTE 14@"
ShimmerName:           db "SHIMMER¯CITY@"
BrilloTownName:	   	   db "BRILLO¯TOWN@"
DesertRouteName:	   db "DESERT¯ROUTE@"

LusterStationName:	   db "LUSTER¯CITY@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
GateName:	 	 	   db "UNKNOWN@"
SpecialMapName:        db "?","@"
