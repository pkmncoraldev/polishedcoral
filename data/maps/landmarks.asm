landmark: MACRO
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark  44, 100, SunsetBayName
	landmark  52, 108, SunsetCapeName
	landmark  52,  92, Route1Name
	landmark  52,  84, DaybreakVillageName
	landmark  52,  72, Route2Name
	landmark  60,  76, MtOnwaName
	landmark  52,  60, GlintCityName
	landmark  52,  52, GlintGroveName
	landmark  76,  60, Route3Name
	landmark  76,  52, StarglowCavernName
	landmark  92,  76, StarglowValleyName
	landmark 104,  76, Route4Name
	landmark 108,  68, HuntersThicketName
	landmark 100,  88, Route5Name
	landmark  88, 100, Route6Name
	landmark  76,  92, Route7Name
	landmark  60,  92, LakeOnwaName
	landmark  84, 116, SunbeamIslandName
	landmark  92, 116, SunbeamJungleName
	landmark  76,  76, Route8Name
	landmark 116,  76, EventideForestName
	landmark 124,  84, EventideVillageName
	landmark 132,  84, Route9Name
	landmark 132, 100, Route11Name
	landmark 140,  76, DodrioRanchName
	landmark 132,  60, FlickerStationName
	landmark 132,  52, FlickerPassName
	landmark 136,  44, Route10Name
	landmark 132,  36, TwinkleTownName
	landmark 140,  36, FrozenRuinsName
	landmark  24,  56, LusterCityName
	landmark  20,  56, LusterSewersName
	landmark  20,  72, Route12Name
	landmark  28,  76, SkateparkName
	landmark  20,  84, AirportName
	landmark  68, 108, Route13Name
	landmark  44, 116, Route14Name
	landmark  64, 124, Route15Name
	
	landmark 116,  68, OldManorName
	landmark  24,  56, LusterStationName
	landmark  24,  56, ResidentialName
	landmark  24,  56, ShoppingName
	landmark  24,  56, BusinessName
	landmark  52,  92, Route1Name
	landmark  92,  76, StarglowDepthsName
	landmark   0,   0, UnkownPassageName
	landmark   7,  14, ConnectingCavernName
	
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
	landmark   0,   0, Route27Name
	landmark   0,   0, BrightburgName
	landmark   0,   0, Route28Name
	
	landmark  20, 124, BrilloTownName
	landmark  28, 124, Route17Name
	landmark  28, 116, Route18Name
	landmark  28, 108, DesertWastelandName
	
	
	landmark -16, -16, GateName


SunsetBayName:         db "SUNSET BAY@"
SunsetCapeName:        db "SUNSET¯CAPE@"
DaybreakVillageName:   db "DAYBREAK¯VILLAGE@"
Route1Name:            db "ROUTE 1@"
Route2Name:            db "ROUTE 2@"
MtOnwaName:			   db "MT. ONWA@"
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
SkateparkName:		   db "SKATEPARK@"
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
Route27Name:		   db "ROUTE 27@"
BrightburgName: 	   db "BRIGHTBURG@"
Route28Name:		   db "ROUTE 28@"

LusterStationName:	   db "LUSTER¯CITY@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
UnkownPassageName:	   db "UNKNOWN PASSAGE@"
ConnectingCavernName:  db "CONNECTING¯CAVERN@"
GateName:	 	 	   db "UNKNOWN@"
SpecialMapName:        db "?","@"
