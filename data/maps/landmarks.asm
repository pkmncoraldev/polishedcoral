MACRO landmark
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
	landmark   0,   0, SpecialMapName
	landmark  44, 100, SunsetBayName
	landmark  52, 108, SunsetCapeName
	landmark  52,  96, Route1Name
	landmark  52,  84, DaybreakVillageName
	landmark  52,  72, Route2Name
	landmark  60,  76, MtOnwaName
	landmark  52,  60, GlintCityName
	landmark  52,  52, GlintGroveName
	landmark  76,  60, Route3Name
	landmark  76,  52, StarglowCavernName
	landmark  92,  76, StarglowValleyName
	landmark 108,  76, Route4Name
	landmark 108,  68, HuntersThicketName
	landmark 100,  88, Route5Name
	landmark  92, 100, Route6Name
	landmark  84,  92, Route7Name
	landmark  60,  92, LakeOnwaName
	landmark  84, 124, SunbeamIslandName
	landmark  92, 124, SunbeamJungleName
	landmark  76,  76, Route8Name
	landmark 116,  84, EventideForestName
	landmark 132, 100, Route9Name
	landmark 116, 108, EventideVillageName
	landmark 132, 124, Route11Name
	landmark 140,  92, DodrioRanchName
	landmark 132,  76, FlickerStationName
	landmark 132,  68, FlickerPassName
	landmark 136,  48, Route10Name
	landmark 132,  36, TwinkleTownName
	landmark 140,  36, IcicleCavernName
	landmark  24,  40, LusterCityName
	landmark  20,  36, LusterSewersName
	landmark  20,  64, Route12Name
	landmark  28,  60, SkateparkName
	landmark  20,  76, AirportName
	landmark  68, 108, Route13Name
	landmark  44, 116, Route14Name
	landmark  60, 124, Route15Name
	landmark  84, 112, Route16Name
	
	landmark 120,  88, OldManorName
	landmark 136,  32, FrozenRuinsName
	landmark  24,  40, LusterStationName
	landmark  24,  40, ResidentialName
	landmark  24,  40, ShoppingName
	landmark  24,  40, BusinessName
	landmark -16, -16, SunsetBay_2Name
	landmark -16, -16, SunsetCape_2Name
	landmark -16, -16, Route1_2Name
	landmark  84,  44, StarglowDepthsName
	landmark -16, -16, UnkownPassageName
	landmark  60, 132, ConnectingCavernName
	landmark -16, -16, TrainName
	
	landmark  28,  44, ShimmerName
	landmark  36,  52, Route19Name
	landmark  44,  44, SeasideCaveName
	landmark  44,  64, Route20Name
	landmark  52,  76, RadiantName
	landmark  52,  84, RadiantMeadowName
	landmark  60,  64, Route21Name
	landmark  60,  52, DuskTurnpikeName
	landmark  84,  52, Route22Name
	landmark 108,  52, CrossroadsName
	landmark 108,  36, Route23Name
	landmark 120,  52, Route24Name
	landmark 124,  44, BoneCavernName
	landmark 108,  72, Route25Name
	landmark 108,  92, KomoreVillageName
	landmark  92,  84, Route26Name
	landmark 124,  72, Route27Name
	landmark 116,  88, Route28Name
	landmark 124,  88, Route29Name
	landmark 124, 100, BrightburgName
	landmark 124, 112, Route30Name
	landmark 116, 116, GreenGrottoName
	landmark 104, 116, Route31Name
	landmark  92, 116, ObscuraCityName
	landmark 140,  96, Route32Name
	landmark 140,  68, AureoleMountainName
	landmark 140,  52, LuminaTownName
	
	landmark 108,  36, Route11Name
	
	landmark 108, 108, BrilloTownName
	landmark 124, 108, Route17Name
	landmark 132,  96, Route18Name
	landmark 132,  84, DesertWastelandName
	landmark 0, 0, BeaconAtollName
	
	
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
IcicleCavernName:	   db "ICICLE¯CAVERN@"
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
SunsetBay_2Name:       db "SUNSET BAY?@"
SunsetCape_2Name:      db "SUNSET¯CAPE?@"
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
RadiantMeadowName:	   db "RADIANT¯MEADOW@"
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
Route31Name:		   db "ROUTE 31@"
Route32Name:		   db "ROUTE 32@"
BoneCavernName:	   	   db "BONE¯CAVERNS@"
AureoleMountainName:   db "AUREOLE¯MOUNTAIN@"
LuminaTownName:	   	   db "LUMINA¯TOWN@"
BeaconAtollName:	   db "BEACON¯ATOLL@" 	   	

LusterStationName:	   db "LUSTER¯CITY@"
ResidentialName:	   db "HOUSING¯DISTRICT@"
ShoppingName:		   db "SHOPPING¯DISTRICT@"
BusinessName:	 	   db "BUSINESS¯DISTRICT@"
UnkownPassageName:	   db "UNKNOWN¯PASSAGE@"
ConnectingCavernName:  db "CONNECTING¯CAVERN@"
GateName:	 	 	   db "UNKNOWN@"
DiveName:	 	 	   db "UNDERWATER@"
TrainName:	 	 	   db "TRAIN¯CARRAGE@"
SpecialMapName:        db "?","@"
