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
	db -1
