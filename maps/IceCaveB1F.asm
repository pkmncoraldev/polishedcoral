IceCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, IceCaveB1FStopSnowstorm

	db 4 ; warp events
	warp_def 11, 22, 6, TWINKLE_TOWN
	warp_def  3, 21, 2, ICE_CAVE_B2F
	warp_def 11,  4, 2, ROUTE_10_EAST
	warp_def  7,  3, 1, ICE_CAVE_B2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_HIKER,  6, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IceCaveB1FNPC, -1
	
IceCaveB1FStopSnowstorm:
	clearevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger ROUTE_10, $0
	return
	
IceCaveB1FNPC:
	jumptextfaceplayer IceCaveB1FNPCText

IceCaveB1FNPCText:
	text "You could probably"
	line "get up there if"
	cont "your #MON could"
	cont "use ROCK CLIMB!"
	done