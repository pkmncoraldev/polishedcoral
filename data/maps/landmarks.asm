landmark: MACRO
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark  20,  92, SunsetBayName
	landmark  28,  92, SunsetCapeName
	landmark  28, 100, LighthouseName
	landmark  28,  88, Route1Name
	landmark  28,  76, DaybreakVillageName
	landmark  28,  64, Route2Name
	landmark  36,  68, DaybreakGrottoName
	landmark  28,  52, GlintCityName
	landmark  28,  44, GlintGroveName
	landmark  52,  52, Route3Name
	landmark  52,  44, StarglowCavernName
	landmark  64,  68, StarglowValleyName
	landmark  76,  68, Route4Name
	landmark  76,  60, HuntersThicketName
	landmark  72,  80, Route5Name
	landmark  62,  92, Route6Name
	landmark  52,  84, Route7Name
	landmark  40,  84, LakeOnwaName
	landmark  44,  76, MtOnwaName
	landmark  60, 116, SunbeamIslandName
	landmark  68, 116, SunbeamJungleName
	landmark  52,  68, Route8Name
	landmark  84,  68, EventideForestName
	landmark  92,  68, EventideVillageName
	landmark 100,  64, Route9Name
	landmark 108,  60, DodrioRanchName
	landmark 100,  52, FlickerStationName
	landmark 100,  44, FlickerPassName
	landmark 100,  36, Route10Name
	landmark 100,  28, TwinkleTownName
	landmark 108,  28, FrozenRuinsName
	landmark 136,  56, LusterCityName
	landmark 132,  56, LusterSewersName
	landmark 132,  76, Route11Name
	landmark 124,  92, Route12Name
	landmark 116,  84, AirportName
	landmark  40, 108, NewWaterRouteName
	landmark  20, 116, Route13Name
	landmark  36, 124, Route14Name
	
	landmark  84,  60, OldManorName
	landmark 136,  56, LusterStationName
	landmark 136,  56, ResidentialName
	landmark 136,  56, ShoppingName
	landmark 136,  56, BusinessName
	landmark  28,  88, Route1Name
	landmark  60,  40, StarglowDepthsName
	landmark   0,   0, UnkownPassageName
	landmark  36, 116, UnderwaterCavernName
	
	landmark  28,  32, Route15Name
	landmark  28,  44, ShimmerName
	landmark  12, 132, BrilloTownName
	landmark  20, 132, Route16Name
	landmark  20, 124, Route17Name
	landmark  20, 116, DesertWastelandName
	landmark  44,  52, Route18Name
	landmark  52,  44, SeasideCaveName
	landmark  44,  68, Route19Name
	landmark  52,  76, RadiantName
	landmark  60,  68, Route20Name
	landmark  60,  48, DuskTurnpikeName
	landmark  76,  44, Route21Name
	
	
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
Route11Name:		   db "ROUTE 11@"
Route12Name:		   db "ROUTE 12@"
AirportName:		   db "ONWA INTL.¯AIRPORT@"
NewWaterRouteName:		db "UNFINISHED@"
Route13Name:		   db "ROUTE 13@"
Route14Name:		   db "ROUTE 14@"
Route15Name:		   db "ROUTE 15@"
StarglowDepthsName:    db "STARGLOW¯DEPTHS@"
ShimmerName:           db "PORT¯SHIMMER@"
BrilloTownName:	   	   db "BRILLO¯TOWN@"
Route16Name:		   db "ROUTE 16@"
Route17Name:		   db "ROUTE 17@"
DesertWastelandName:   db "DESERT¯WASTELAND@"
Route18Name:		   db "ROUTE 18@"
Route19Name:		   db "ROUTE 19@"
RadiantName:	 	   db "RADIANT¯TOWNSHIP@"
Route20Name:		   db "ROUTE 20@"
DuskTurnpikeName:	   db "DUSK¯TURNPIKE@"
SeasideCaveName:	   db "SEASIDE¯CAVE@"
Route21Name:		   db "ROUTE 21@"

LusterStationName:	   db "LUSTER¯CITY@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
UnkownPassageName:	   db "UNKNOWN PASSAGE@"
UnderwaterCavernName:  db "UNDERWATER¯CAVERN@"
GateName:	 	 	   db "UNKNOWN@"
SpecialMapName:        db "?","@"
