IceCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, IceCaveB1FStopSnowstorm

	db 4 ; warp events
	warp_def 11, 22, 6, TWINKLE_TOWN
	warp_def  5, 21, 2, ICE_CAVE_B2F
	warp_def 11,  4, 2, ROUTE_10_EAST
	warp_def  7,  3, 1, ICE_CAVE_B2F

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_HIKER,  6, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IceCaveB1FNPC1, -1
	person_event SPRITE_HIKER,  5, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IceCaveB1FNPC2, -1
	person_event SPRITE_BALL_CUT_FRUIT,  9, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, IceCaveB1FPokeballRockClimb, EVENT_GOT_HM08_ROCK_CLIMB
	
	
IceCaveB1FStopSnowstorm:
	clearevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger ROUTE_10, $0
	return
	
IceCaveB1FNPC1:
	jumptextfaceplayer IceCaveB1FNPC1Text
	
IceCaveB1FNPC2:
	jumptextfaceplayer IceCaveB1FNPC2Text
	
IceCaveB1FPokeballRockClimb:
	disappear LAST_TALKED
	opentext
	writetext ReceivedRockClimbText1
	waitsfx
	specialsound
	waitbutton
	writetext ReceivedRockClimbText2
	waitbutton
	closetext
	givetmhm HM_ROCK_CLIMB
	setevent EVENT_GOT_HM08_ROCK_CLIMB
	setflag ENGINE_GOT_ROCK_CLIMB
	end

IceCaveB1FNPC1Text:
	text "You could probably"
	line "get up there if"
	cont "your #MON could"
	cont "use ROCK CLIMB!"
	done
	
IceCaveB1FNPC2Text:
	text "Just down this"
	line "ledge is TWINKLE"
	cont "TOWN."
	
	para "I wouldn't hop down"
	line "there if you don't"
	cont "want to hike all"
	cont "the way back up!"
	done
	
ReceivedRockClimbText1:
	text "<PLAYER> found"
	line "HM08 ROCK CLIMB!"
	done
	
ReceivedRockClimbText2:
	text "<PLAYER> put HM08"
	line "in the TM POCKET."
	done