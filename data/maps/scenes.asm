scene_var: MACRO
; db group, map
; dw address
	map_id \1
	dw \2
ENDM

MapTriggers::
	scene_var PLAYER_HOUSE_1F,                        wPlayerHouse1FTrigger
	scene_var SUNSET_BAY,     	                      wSunsetBayTrigger
	scene_var SUNSET_CAPTAINS_HOUSE,     	          wSunsetCaptainsHouseTrigger
	scene_var SUNSET_LIGHTHOUSE,     	       	      wSunsetLighthouseTrigger
	scene_var ROUTE_1_GATE,							  wRoute1GateTrigger
	scene_var DAYBREAK_VILLAGE,						  wDaybreakVillageTrigger
	scene_var GLINT_GROVE_ENTRANCE,					  wGlintGroveEntranceTrigger
	scene_var GLINT_GROVE,							  wGlintGroveTrigger
	scene_var GLINT_APARTMENT_LEFT_2F,				  wGlintApartmentLeft2FTrigger
	scene_var GLINT_GYM,							  wGlintGymTrigger
	scene_var STARGLOW_CAVERN_1F,					  wStarglowCavern1F
	scene_var STARGLOW_VALLEY,						  wStarglowValley
	scene_var STARGLOW_TOGEPI_HOUSE,				  wStarglowTogepiHouse
	scene_var STARGLOW_POKECENTER,					  wStarglowPokeCenter
	scene_var ROUTE_6,							  	  wRoute6Trigger
	scene_var LAKE_ONWA,							  wLakeOnwaTrigger
	scene_var SUNBEAM_ISLAND,						  wSunbeamIslandTrigger
	db -1
