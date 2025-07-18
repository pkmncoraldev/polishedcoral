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
	opentext TEXTBOX_STRAND
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
	clearevent EVENT_LAKE_ROCKS_BROWN
	clearevent EVENT_BRILLO_MARACTUS_GREEN
	checkevent EVENT_CAPTAIN_GIVES_RIDES_TO_ISLAND
	iftrue SunsetCaptainRidetoIsland
	checkevent EVENT_CAN_GET_FIRST_RIDE_TO_ISLAND
	iftrue SunsetCaptainFirstRidetoIsland
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iftrue SunsetCaptain2
	faceplayer
	opentext TEXTBOX_STRAND
	writetext SunsetCaptainText2
	waitbutton
	closetext
	end
	
SunsetCaptain2:
	jumptextfaceplayer SunsetCaptainText3
	
SunsetCaptainFirstRidetoIsland:
	setevent EVENT_CAPTAIN_GIVES_RIDES_TO_ISLAND
	setevent EVENT_PLAYER_HOUSE_MOM_2
	clearevent EVENT_PLAYER_HOUSE_MOM_1
	faceplayer
	opentext TEXTBOX_STRAND
	checkevent EVENT_TALKED_TO_MOM_IN_PERSON_ABOUT_STRAND
	iftrue .ride
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	iffalse .howdidyouknow
.ride
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
	warpfacing DOWN, SUNBEAM_ISLAND, 13, 51
	end
	
SunsetCaptainRidetoIsland:
	faceplayer
	opentext TEXTBOX_STRAND
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
	text "Ah, hello,"
	line "<PLAYER>."
	
	para "Your mother told"
	line "me that you need"
	cont "a ride to SUNBEAM"
	cont "ISLAND."
	
	para "Of course I can"
	line "take you there!"
	
	para "It might be a long"
	line "voyage."
	
	para "You should take"
	line "care of anything"
	cont "you need to before"
	cont "we go."
	
	para "Well, <WAIT_S>are you"
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
	
	para "It might be a long"
	line "voyage."
	
	para "You should take"
	line "care of anything"
	cont "you need to before"
	cont "we go."
	
	para "Well, <WAIT_S>are you"
	line "ready to ship out?"
	done
	
SunsetCaptainRidetoIslandText:
	text "Ah, <WAIT_S>hello,"
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
	text "Oh!<WAIT_S>"
	line "You're late!"
	
	para "ABNER and the"
	line "others went to"
	cont "the lighthouse."
	
	para "We weren't going"
	line "to stand outside"
	cont "on the pier and"
	cont "waste the whole"
	cont "morning."
	
	para "He needed to get"
	line "back to tending"
	cont "the lighthouse."
	
	para "The lighthouse is"
	line "on the cape EAST"
	cont "of town."
	
	para "You'd better get"
	line "going!"
	done
	
SunsetCaptainText1_Day:
	text "Oh!<WAIT_S>"
	line "You're late!"
	
	para "ABNER and the"
	line "others went to"
	cont "the lighthouse."
	
	para "We weren't going"
	line "to stand outside"
	cont "on the pier all"
	cont "day and get"
	cont "sunburned."
	
	para "He needed to get"
	line "back to tending"
	cont "the lighthouse."
	
	para "The lighthouse is"
	line "on the cape EAST"
	cont "of town."
	
	para "You'd better get"
	line "going!"
	done
	
SunsetCaptainText1_Night:
	text "Oh!<WAIT_S>"
	line "You're late!"
	
	para "ABNER and the"
	line "others went to"
	cont "the lighthouse."
	
	para "We weren't going"
	line "to stand outside"
	cont "on the pier all"
	cont "night and freeze."
	
	para "He needed to get"
	line "back to tending"
	cont "the lighthouse."
	
	para "The lighthouse is"
	line "on the cape EAST"
	cont "of town."
	
	para "You'd better get"
	line "going!"
	done
	
SunsetCaptainText2:
	text "What are you"
	line "doing?"
	
	para "The lighthouse is"
	line "on the cape EAST"
	cont "of town."
	
	para "Go get your"
	line "#MON!"
	done 
	
SunsetCaptainText3:
	text "ABNER just showed"
	line "up to SUNSET BAY"
	cont "one day out of"
	cont "the blue."
	
	para "He doesn't talk"
	line "much about his"
	cont "past."
	
	para "All anyone knows"
	line "about his previous"
	cont "life is that he"
	cont "was once a rich"
	cont "and powerful man."
	
	para "He gave it all to"
	line "his son and left"
	cont "that life behind."
	
	para "No one is sure"
	line "why…"
	
	para "Now he lives in"
	line "the lighthouse"
	cont "and keeps it in"
	cont "working order."
	
	para "It's an important"
	line "job for sure."
	
	para "Me?"
	
	para "I'd rather waste my"
	line "days away in this"
	cont "little cabin."
	
	para "Hehe…"
	done
	
SunsetCaptainBoatHouseText1:
	text "Ah,<WAIT_S>"
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