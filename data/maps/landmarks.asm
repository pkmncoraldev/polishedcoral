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
	landmark  52,  60, Route3Name
	landmark  52,  52, StarglowCavernName
	landmark  64,  76, StarglowValleyName
	landmark  76,  76, Route4Name
	landmark  76,  68, HuntersThicketName
	landmark  72,  88, Route5Name
	landmark  62, 100, Route6Name
	landmark  52,  92, Route7Name
	landmark  40,  92, LakeOnwaName
	landmark  44,  84, MtOnwaName
	landmark  60, 116, SunbeamIslandName
	landmark  68, 116, SunbeamJungleName
	landmark  52,  76, Route8Name
	landmark  84,  76, EventideForestName
	landmark  92,  76, EventideVillageName
	landmark 100,  72, Route9Name
	landmark 108,  68, DodrioRanchName
	landmark 100,  60, FlickerStationName
	landmark 100,  52, FlickerPassName
	landmark 104,  44, Route10Name
	landmark 100,  36, TwinkleTownName
	landmark 108,  36, FrozenRuinsName
	landmark 136,  64, LusterCityName
	landmark 132,  64, LusterSewersName
	landmark 128,  84, Route11Name
	landmark 124, 100, Route12Name
	landmark 116, 100, AirportName
	landmark  44, 108, Route13Name
	landmark  20, 116, Route14Name
	landmark  36, 124, Route15Name
	
	landmark  84,  60, OldManorName
	landmark 136,  56, LusterStationName
	landmark 136,  56, ResidentialName
	landmark 136,  56, ShoppingName
	landmark 136,  56, BusinessName
	landmark  28,  88, Route1Name
	landmark  60,  40, StarglowDepthsName
	landmark   0,   0, UnkownPassageName
	landmark  36, 116, ConnectingCavernName
	
	landmark  36,  40, Route16Name
	landmark  36,  52, ShimmerName
	landmark  48,  60, Route19Name
	landmark  60,  52, SeasideCaveName
	landmark  52,  72, Route20Name
	landmark  60,  84, RadiantName
	landmark  68,  72, Route21Name
	landmark  68,  60, DuskTurnpikeName
	landmark  80,  52, Route22Name
	landmark 100,  52, CrossroadsName
	landmark   0,   0, Route23Name
	landmark   0,   0, KomoreVillageName
	landmark   0,   0, Route24Name
	landmark   0,   0, Route25Name
	landmark   0,   0, Route26Name
	landmark   0,   0, BrightburgName
	
	landmark  20, 124, BrilloTownName
	landmark  28, 124, Route17Name
	landmark  28, 116, Route18Name
	landmark  28, 108, DesertWastelandName
	
	
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
Route13Name:		   db "ROUTE 13@"
Route14Name:		   db "ROUTE 14@"
Route15Name:		   db "ROUTE 15@"
Route16Name:		   db "ROUTE 16@"
StarglowDepthsName:    db "STARGLOW¯DEPTHS@"
ShimmerName:           db "PORT¯SHIMMER@"
BrilloTownName:	   	   db "PUEBLO¯BRILLO@"
Route17Name:		   db "ROUTE 17@"
Route18Name:		   db "ROUTE 18@"
DesertWastelandName:   db "DESERT¯WASTELAND@"
Route19Name:		   db "ROUTE 19@"
Route20Name:		   db "ROUTE 20@"
RadiantName:	 	   db "RADIANT¯TOWN@"
Route21Name:		   db "ROUTE 21@"
DuskTurnpikeName:	   db "DUSK¯TURNPIKE@"
SeasideCaveName:	   db "SEASIDE¯CAVE@"
Route22Name:		   db "ROUTE 22@"
CrossroadsName: 	   db "CROSSROADS@"
Route23Name:		   db "ROUTE 23@"
KomoreVillageName:	   db "KOMORE¯VILLAGE@"
Route24Name:		   db "ROUTE 24@"
Route25Name:		   db "ROUTE 25@"
Route26Name:		   db "ROUTE 26@"
BrightburgName: 	   db "BRIGHTBURG@"

LusterStationName:	   db "LUSTER¯CITY@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
UnkownPassageName:	   db "UNKNOWN PASSAGE@"
ConnectingCavernName:  db "CONNECTING¯CAVERN@"
GateName:	 	 	   db "UNKNOWN@"
SpecialMapName:        db "?","@"
