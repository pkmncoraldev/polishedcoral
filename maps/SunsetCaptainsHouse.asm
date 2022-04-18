SunsetCaptainsHouse_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SunsetCaptainsHouseTrigger0
	scene_script SunsetCaptainsHouseTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, SUNSET_BAY, 4
	warp_event  3,  7, SUNSET_BAY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, SIGNPOST_JUMPSTD, radio2

	db 1 ; object events
	object_event  5,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunsetCaptain, -1

	const_def 1 ; object constants
	const SUNSET_CAPTAINS_HOUSE_CAPTAIN
	
SunsetCaptainsHouseTrigger0:
	priorityjump SunsetCaptainsHouseTrigger0Event
	end
	
SunsetCaptainsHouseTrigger1:
	end

SunsetCaptainsHouseTrigger0Event:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface SUNSET_CAPTAINS_HOUSE_CAPTAIN, DOWN
	showemote EMOTE_SHOCK, SUNSET_CAPTAINS_HOUSE_CAPTAIN, 15
	pause 7
	applymovement SUNSET_CAPTAINS_HOUSE_CAPTAIN, SunsetCaptainMovement
	spriteface SUNSET_CAPTAINS_HOUSE_CAPTAIN, DOWN
	opentext
	checktime 1<<MORN
	iftrue .morn
	checktime 1<<DAY
	iftrue .day
	writetext SunsetCaptainText1_Night
.cont:
	waitbutton
	closetext
	applymovement SUNSET_CAPTAINS_HOUSE_CAPTAIN, SunsetCaptainMovementReturn
	spriteface SUNSET_CAPTAINS_HOUSE_CAPTAIN, LEFT
	dotrigger $1
	domaptrigger SUNSET_BAY, $1
	setevent EVENT_TALKED_TO_MAN_IN_SHACK
	end
	
.morn:
	writetext SunsetCaptainText1_Morn
	jump .cont
	
.day:
	writetext SunsetCaptainText1_Day
	jump .cont
	
SunsetCaptain:
;	jump .captaingivesallrides ;UNCOMMENT FOR TESTING
	clearevent EVENT_LAKE_ROCKS_BROWN
	checkevent EVENT_SAVED_SUNBEAM
	iftrue .captaingivesallrides
	checkevent EVENT_CAPTAIN_GIVES_RIDES_TO_ISLAND
	iftrue SunsetCaptainRidetoIsland
	checkevent EVENT_CAN_GET_FIRST_RIDE_TO_ISLAND
	iftrue SunsetCaptainFirstRidetoIsland
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iftrue SunsetCaptain2
	faceplayer
	opentext
	writetext SunsetCaptainText2
	waitbutton
	closetext
	end
	
.captaingivesallrides
	faceplayer
	opentext
	writetext SunsetCaptainBoatHouseText1
	yesorno
	iffalse .end
.return
	writetext SunsetCaptainBoatHouseText2
	waitbutton
	closetext
	refreshscreen $0
	loadmenudata SunsetCaptainBoatHouseMenuData
	verticalmenu
	closewindow
	if_equal $1, .LakeL
	if_equal $2, .LakeR
	if_equal $3, .Sunbeam
	if_equal $4, .end
	
.LakeL
	writetext SunsetCaptainBoatHouseText3
	yesorno
	iffalse .return
	writetext SunsetCaptainBoatHouseText4
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	domaptrigger LAKE_ONWA, $4
	warpfacing LEFT, LAKE_ONWA, $18, $19
	end
	
.LakeR
	writetext SunsetCaptainBoatHouseText5
	yesorno
	iffalse .return
	writetext SunsetCaptainBoatHouseText4
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	clearevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	domaptrigger LAKE_ONWA, $3
	warpfacing RIGHT, LAKE_ONWA, $27, $1f
	end
	
.Sunbeam
	writetext SunsetCaptainBoatHouseText6
	yesorno
	iffalse .return
	writetext SunsetCaptainRidetoIslandTextYes
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_ISLAND_BOATMAN
	setevent EVENT_ISLAND_STRAND
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	domaptrigger SUNBEAM_ISLAND, $5
	warpfacing DOWN, SUNBEAM_ISLAND, 13, 49
	end
	
.end
	writetext SunsetCaptainRidetoIslandTextNo
	waitbutton
	closetext
	end
	
SunsetCaptainBoatHouseMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 4 ; items
	db "LAKE ONWA WEST@"
	db "LAKE ONWA EAST@"
	db "SUNBEAM ISLAND@"
	db "CANCEL@"
	end
	
SunsetCaptain2:
	jumptextfaceplayer SunsetCaptainText3
	
SunsetCaptainFirstRidetoIsland:
	setevent EVENT_PLAYER_HOUSE_MOM_2
	clearevent EVENT_PLAYER_HOUSE_MOM_1
	faceplayer
	opentext
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	iffalse .howdidyouknow
	writetext SunsetCaptainFirstRidetoIslandText1
	jump CaptainGoToIsland
.howdidyouknow
	writetext SunsetCaptainFirstRidetoIslandText2
CaptainGoToIsland:
	yesorno
	iftrue .yes
	writetext SunsetCaptainRidetoIslandTextNo
	waitbutton
	closetext
	end
.yes
	setevent EVENT_FIRST_TRIP_TO_ISLAND
	setevent EVENT_CAPTAIN_GIVES_RIDES_TO_ISLAND
	clearevent EVENT_CAN_GET_FIRST_RIDE_TO_ISLAND
	clearevent EVENT_CALLED_SPRUCE_CANT_GET_ON_ISLAND
	clearevent EVENT_CAN_CALL_SPRUCE_ABOUT_ISLAND
	clearevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	clearevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	clearevent EVENT_TALKED_TO_MOM_IN_PERSON_ABOUT_STRAND
	clearevent EVENT_ISLAND_BOATMAN
	setevent EVENT_ISLAND_STRAND
	writetext SunsetCaptainRidetoIslandTextYes
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	domaptrigger SUNBEAM_ISLAND, $0
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	warpfacing DOWN, SUNBEAM_ISLAND, 13, 49
	end
	
SunsetCaptainRidetoIsland:
	faceplayer
	opentext
	writetext SunsetCaptainRidetoIslandText
	jump CaptainGoToIsland
	
	
SunsetCaptainMovement:
	step_down
	step_down
	step_left
	step_end
	
SunsetCaptainMovementReturn:
	step_right
	step_up
	step_up
	step_end


SunsetCaptainFirstRidetoIslandText1:
	text "CAP'N STRAND: Ah,"
	line "hello,"
	cont "<PLAYER>."
	
	para "Your mother told"
	line "me that you need"
	cont "a ride to SUNBEAM"
	cont "ISLAND."
	
	para "Of course I can"
	line "take you there!"
	
	para "It's no trouble at"
	line "all!"
	
	para "Well, are you"
	line "ready to ship out?"
	done
	
SunsetCaptainFirstRidetoIslandText2:
	text "Ah, <PLAYER>!"
	
	para "What are you doing"
	line "here?"
	
	para "What's that?"
	
	para "A ride to SUNBEAM"
	line "ISLAND?"
	
	para "I wish you had"
	line "called."
	
	para "Anyway…"
	
	para "Of course I can"
	line "take you there!"
	
	para "It's no trouble at"
	line "all!"
	
	para "Well, are you"
	line "ready to ship out?"
	done
	
SunsetCaptainRidetoIslandText:
	text "Ah, hello,"
	line "<PLAYER>."
	
	para "Would you like a"
	line "ride to SUNBEAM"
	cont "ISLAND?"
	done
	
SunsetCaptainRidetoIslandTextYes:
	text "Great!"
	
	para "SUNBEAM ISLAND,"
	line "ho!"
	done
	
SunsetCaptainRidetoIslandTextNo:
	text "Ok."
	
	para "I'll be here when"
	line "you're ready."
	done
	
SunsetCaptainText1_Morn:
	text "CAP'N STRAND: Oh!"
	
	para "You're late!"
	
	para "My brother ABNER"
	line "took the #MON"
	cont "to the lighthouse."
	
	para "We weren't going"
	line "to stand outside"
	cont "on the pier and"
	cont "waste the whole"
	cont "morning."
	
	para "He needed to get"
	line "back to tending"
	cont "the lighthouse."
	
	para "To get there just"
	line "leave town and"
	cont "head south."
	done
	
SunsetCaptainText1_Day:
	text "CAP'N STRAND: Oh!"
	
	para "You're late!"
	
	para "My brother ABNER"
	line "took the #MON"
	cont "to the lighthouse."
	
	para "We weren't going"
	line "to stand outside"
	cont "on the pier all"
	cont "day and get"
	cont "sunburned."
	
	para "He needed to get"
	line "back to tending"
	cont "the lighthouse."
	
	para "To get there just"
	line "leave town and"
	cont "head south."
	done
	
SunsetCaptainText1_Night:
	text "CAP'N STRAND: Oh!"
	
	para "You're late!"
	
	para "My brother ABNER"
	line "took the #MON"
	cont "to the lighthouse."
	
	para "We weren't going"
	line "to stand outside"
	cont "on the pier all"
	cont "night and freeze."
	
	para "He needed to get"
	line "back to tending"
	cont "the lighthouse."
	
	para "To get there just"
	line "leave town and"
	cont "head south."
	done
	
SunsetCaptainText2:
	text "What are you"
	line "doing?"
	
	para "The lighthouse"
	line "is east of town"
	
	para "Go get your"
	line "#MON!"
	done 
	
SunsetCaptainText3:
	text "My brother and"
	line "I used to be"
	cont "ship captains."
	
	para "Nowadays, he runs"
	line "the lighthouse."
	
	para "It's an important"
	line "job for sure."
	
	para "Me?"
	
	para "I'd rather waste my"
	line "days away in this"
	cont "little cabin."
	
	para "Hehe…"
	done
	
SunsetCaptainBoatHouseText1:
	text "Ah,"
	line "<PLAYER>."
	
	para "What brings you"
	line "by?"
	
	para "Do you need a ride"
	line "somewhere?"
	done
	
SunsetCaptainBoatHouseText2:
	text "Where to?"
	done
	
SunsetCaptainBoatHouseText3:
	text "Travel to the"
	line "WEST end of"
	cont "LAKE ONWA?"
	done
	
SunsetCaptainBoatHouseText4:
	text "Great!"
	
	para "LAKE ONWA, ho!"
	done
	
SunsetCaptainBoatHouseText5:
	text "Travel to the"
	line "EAST end of"
	cont "LAKE ONWA?"
	done
	
SunsetCaptainBoatHouseText6:
	text "Travel to"
	line "SUNBEAM ISLAND?"
	done