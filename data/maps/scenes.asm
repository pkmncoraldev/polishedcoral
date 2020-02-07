scene_var: MACRO
; db group, map
; dw address
	map_id \1
	dw \2
ENDM

MapTriggers::
	scene_var PLAYER_HOUSE_1F,                        wPlayerHouse1FTrigger
	scene_var PLAYER_HOUSE_2F,                        wPlayerHouse2FTrigger
	scene_var SUNSET_BAY,     	                      wSunsetBayTrigger
	scene_var SUNSET_CAPTAINS_HOUSE,     	          wSunsetCaptainsHouseTrigger
	scene_var SUNSET_LIGHTHOUSE,     	       	      wSunsetLighthouseTrigger
	scene_var ROUTE_1_GATE,							  wRoute1GateTrigger
	scene_var DAYBREAK_VILLAGE,						  wDaybreakVillageTrigger
	scene_var GLINT_GROVE_ENTRANCE,					  wGlintGroveEntranceTrigger
	scene_var GLINT_GROVE,							  wGlintGroveTrigger
	scene_var GLINT_APARTMENT_LEFT_2F,				  wGlintApartmentLeft2FTrigger
	scene_var GLINT_GYM,							  wGlintGymTrigger
	scene_var STARGLOW_CAVERN_1F,					  wStarglowCavern1FTrigger
	scene_var STARGLOW_VALLEY,						  wStarglowValleyTrigger
	scene_var STARGLOW_TOGEPI_HOUSE,				  wStarglowTogepiHouseTrigger
	scene_var STARGLOW_POKECENTER,					  wStarglowPokeCenterTrigger
	scene_var ROUTE_6,							  	  wRoute6Trigger
	scene_var LAKE_ONWA,							  wLakeOnwaTrigger
	scene_var SUNBEAM_ISLAND,						  wSunbeamIslandTrigger
	scene_var SUNBEAM_SURF_SHOP,					  wSunbeamSurfShopTrigger
	scene_var SUNBEAM_BIKINI_CONTEST,				  wSunbeamBikiniContestTrigger
	scene_var SPRUCES_LAB,							  wSprucesLabTrigger
	scene_var EVENTIDE_FOREST,						  wEventideForestTrigger
	scene_var SPOOKHOUSE_LIVING_ROOM,				  wSpookhouseLivingRoomTrigger
	scene_var SPOOKHOUSE_HALLWAY_1,					  wSpookhouseHallway1Trigger
	scene_var SPOOKHOUSE_HALLWAY_2,					  wSpookhouseHallway2Trigger
	scene_var SPOOKHOUSE_HALLWAY_3,					  wSpookhouseHallway3Trigger
	scene_var SPOOKHOUSE_TV_ROOM,					  wSpookhouseTVRoomTrigger
	scene_var ROUTE_9,								  wRoute9Trigger
	scene_var DODRIO_RANCH_RACETRACK,				  wDodrioRanchRaceTrackTrigger
	scene_var FLICKER_STATION,						  wFlickerStationTrigger
	scene_var FLICKER_PASS_2F,						  wFlickerPass2FTrigger
	scene_var FLICKER_TRAIN_CUTSCENE,				  wFlickerTrainCutsceneTrigger
	scene_var ROUTE_10,								  wRoute10Trigger
	scene_var ROUTE_10_EAST,						  wRoute10EastTrigger
	scene_var TWINKLE_TOWN,							  wTwinkleTownTrigger
	scene_var EAST_TRAIN_CABIN_1,					  wEastTrainCabin1Trigger
	scene_var EAST_TRAIN_CABOOSE,					  wEastTrainCabooseTrigger
	db -1
