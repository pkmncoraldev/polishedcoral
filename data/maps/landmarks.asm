MACRO landmark
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark  44,  92, SunsetBayName
	landmark  52, 100, SunsetCapeName
	landmark  52,  88, Route1Name
	landmark  52,  76, DaybreakVillageName
	landmark  52,  64, Route2Name
	landmark  64,  68, MtOnwaName
	landmark  52,  52, GlintCityName
	landmark  52,  44, GlintGroveName
	landmark  76,  52, Route3Name
	landmark  76,  44, StarglowCavernName
	landmark  92,  68, StarglowValleyName
	landmark 108,  68, Route4Name
	landmark 108,  60, HuntersThicketName
	landmark 100,  80, Route5Name
	landmark  92,  92, Route6Name
	landmark  84,  84, Route7Name
	landmark  60,  84, LakeOnwaName
	landmark  84, 116, SunbeamIslandName
	landmark  92, 116, SunbeamJungleName
	landmark  76,  68, Route8Name
	landmark 116,  76, EventideForestName
	landmark 124,  84, EventideVillageName
	landmark 132,  84, Route9Name
	landmark 124, 108, Route11Name
	landmark 140,  76, DodrioRanchName
	landmark 132,  60, FlickerStationName
	landmark 132,  52, FlickerPassName
	landmark 136,  44, Route10Name
	landmark 132,  36, TwinkleTownName
	landmark 140,  36, FrozenRuinsName
	landmark  24,  48, LusterCityName
	landmark  20,  44, LusterSewersName
	landmark  20,  68, Route12Name
	landmark  28,  68, SkateparkName
	landmark  20,  84, AirportName
	landmark  68, 100, Route13Name
	landmark  44, 108, Route14Name
	landmark  64, 116, Route15Name
	landmark  84, 104, Route16Name
	
	landmark 120,  68, OldManorName
	landmark  24,  48, LusterStationName
	landmark  24,  48, ResidentialName
	landmark  24,  48, ShoppingName
	landmark  24,  48, BusinessName
	landmark  52,  88, Route1_2Name
	landmark  88,  44, StarglowDepthsName
	landmark -16, -16, UnkownPassageName
	landmark -16, -16, ConnectingCavernName
	
	landmark  36,  44, ShimmerName
	landmark  44,  52, Route19Name
	landmark  60,  52, SeasideCaveName
	landmark  52,  76, Route20Name
	landmark  60,  84, RadiantName
	landmark  68,  76, Route21Name
	landmark  68,  60, DuskTurnpikeName
	landmark  80,  52, Route22Name
	landmark 100,  52, CrossroadsName
	landmark 100,  72, Route23Name
	landmark 100,  92, KomoreVillageName
	landmark  84,  84, Route24Name
	landmark 116,  72, Route25Name
	landmark 108,  88, Route26Name
	landmark 116,  88, Route27Name
	landmark 116, 100, BrightburgName
	landmark 116, 112, Route28Name
	landmark 108, 116, GreenGrottoName
	landmark 104, 124, Route29Name
	landmark  92, 124, ObscuraCityName
	landmark 132,  96, Route30Name
	landmark   0,   0, Route32Name
	landmark 140,  68, AureoleTownName
	
	landmark  20, 124, BrilloTownName
	landmark  32, 124, Route17Name
	landmark  36, 120, Route18Name
	landmark  36, 108, DesertWastelandName
	
	
	landmark -16, -16, GateName
	landmark -16, -16, DiveName


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
HuntersThicketName:	   db "HUNTER'S¯THICKET@"
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
AirportName:		   db "INTL.¯AIRPORT@"
Route13Name:		   db "ROUTE 13@"
Route14Name:		   db "ROUTE 14@"
Route15Name:		   db "ROUTE 15@"
Route16Name:		   db "ROUTE 16@"
Route1_2Name:		   db "ROUTE 1?@"
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
Route29Name:		   db "ROUTE 29@"
GreenGrottoName:	   db "GREEN¯GROTTO@"
ObscuraCityName:	   db "OBSCURA¯CITY@"
Route30Name:		   db "ROUTE 30@"
Route32Name:		   db "ROUTE 32@"
AureoleTownName:	   db "AUREOLE¯TOWN@"

LusterStationName:	   db "LUSTER¯CITY@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
UnkownPassageName:	   db "UNKNOWN¯PASSAGE@"
ConnectingCavernName:  db "CONNECTING¯CAVERN@"
GateName:	 	 	   db "UNKNOWN@"
DiveName:	 	 	   db "UNDERWATER@"
SpecialMapName:        db "?","@"
