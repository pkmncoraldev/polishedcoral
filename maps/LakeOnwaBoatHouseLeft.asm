LakeOnwaBoatHouseLeft_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 5, 4, 2, LAKE_ONWA
	warp_def 5, 5, 2, LAKE_ONWA
	warp_def  3,  4, 255, SAILBOAT_CUTSCENE

	db 0 ; coord events

	db 1 ; bg events
	signpost 1, 7, SIGNPOST_READ, LakeBoat2Trashcan

	db 1 ; object events
	person_event SPRITE_FAT_GUY, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LakeBoatMan2, -1

	const_def 1 ; object constants
	const LAKEBOATMAN2

LakeBoat2Trashcan:
	jumptext LakeBoatTrashcanText
	
LakeBoatMan2:
	opentext
;	jump .normal ;UNCOMMENT FOR TESTING
	checkevent EVENT_SAVED_SUNBEAM
	iftrue .normal
	writetext LakeBoatManText15
	yesorno
	iffalse .end
.doit
	checkevent EVENT_LAKE_BOAT_LEFT
	iftrue .LakeRCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_left
	spriteface LAKEBOATMAN2, DOWN
	setevent EVENT_LAKE_BOAT_LEFT
	opentext
.LakeRCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_JUST_TOOK_BOAT
	clearevent EVENT_LAKE_BOAT_LEFT
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_LAKE_R
	jump .DoBoatEnd
.noride
	writetext LakeBoatManText7
	waitbutton
.end
	writetext LakeBoatManText2
	waitbutton
	closetext
	end
	
.normal
	writetext LakeBoatManText11
	special PlaceMoneyTopRight
	yesorno
	iffalse .end
.return
	writetext LakeBoatManText9
	waitbutton
	closetext
	refreshscreen $0
	special PlaceMoneyTopRight
	
	checkevent EVENT_CAN_GO_TO_DESERT
	iftrue .brillomenu
	checkevent EVENT_CAN_GO_TO_SHIMMER
	iftrue .shimmermenu
	
	loadmenudata LakeBoatHouseLMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeR
	if_equal $3, .Sunbeam
	jump .end
	
.shimmermenu
	loadmenudata LakeBoatHouseLShimmerMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeR
	if_equal $3, .Sunbeam
	if_equal $4, .Shimmer
	jump .end
	
.brillomenu
	loadmenudata LakeBoatHouseLBrilloMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeR
	if_equal $3, .Sunbeam
	if_equal $4, .Shimmer
	if_equal $5, .Brillo
	jump .end
	
.Sunset
	writetext LakeBoatManText12
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .noride
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	checkevent EVENT_LAKE_BOAT_LEFT
	iftrue .SunsetCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_left
	spriteface LAKEBOATMAN2, DOWN
	setevent EVENT_LAKE_BOAT_LEFT
	opentext
.SunsetCont
	clearevent EVENT_SUNSET_STRAND
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_SUNSET
	jump .DoBoatEnd
	
.LakeR
	writetext LakeBoatManText13
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .noride
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	jump .doit
	
.Sunbeam
	writetext LakeBoatManText14
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .noride
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	checkevent EVENT_LAKE_BOAT_LEFT
	iftrue .SunbeamCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_left
	spriteface LAKEBOATMAN2, DOWN
	setevent EVENT_LAKE_BOAT_LEFT
	opentext
.SunbeamCont
	clearevent EVENT_ISLAND_BOATMAN
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_SUNBEAM
	jump .DoBoatEnd
	
.Shimmer
	writetext LakeBoatManText16
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .noride
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	checkevent EVENT_LAKE_BOAT_LEFT
	iftrue .ShimmerCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_left
	spriteface LAKEBOATMAN2, DOWN
	setevent EVENT_LAKE_BOAT_LEFT
	opentext
.ShimmerCont
	clearevent EVENT_SHIMMER_BOATMAN
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_SHIMMER
	jump .DoBoatEnd
	
.Brillo
	writetext LakeBoatManText17
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .noride
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	checkevent EVENT_LAKE_BOAT_LEFT
	iftrue .BrilloCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN2, step_left
	spriteface LAKEBOATMAN2, DOWN
	setevent EVENT_LAKE_BOAT_LEFT
	opentext
.BrilloCont
	clearevent EVENT_BRILLO_BOATMAN
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_BRILLO

.DoBoatEnd
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	applyonemovement PLAYER, hide_person
	changeblock $4, $2, $9b
	special Special_FadeOutMusic
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	setevent EVENT_DONT_SCROLL_OW
	warpcheck
	end
	
	
LakeBoatHouseLMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 3 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA EAST@"
	db "SUNBEAM ISLAND@"
	end
	
LakeBoatHouseLShimmerMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 4 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA EAST@"
	db "SUNBEAM ISLAND@"
	db "SHIMMER CITY@"
	end
	
LakeBoatHouseLBrilloMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 5 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA EAST@"
	db "SUNBEAM ISLAND@"
	db "SHIMMER CITY@"
	db "BRILLO TOWN@"
	end
	
LakeBoatTrashcanText:
	text "It's empty."
	done
	
LakeBoatManText1:
	text "Welcome to the"
	line "LAKE ONWA BOAT"
	cont "HOUSE."
	
	para "I can take you"
	line "across the lake"
	cont "for ¥500."
	
	para "Would you like a"
	line "ride?"
	done
	
LakeBoatManText2:
	text "Come again."
	done
	
LakeBoatManText3:
	text "Alright."
	
	para "We'll head out"
	line "soon."
	done
	
LakeBoatManText4:
	text "Let me just call"
	line "the boat from the"
	cont "other shore."
	done

LakeBoatManText5:
	text "We have a customer"
	line "over here."
	
	para "Bring the boat"
	line "over."
	done

LakeBoatManText6:
	text "You don't have"
	line "enough money?"
	
	para "Really?"
	
	para "Well…"
	
	para "I guess I can let"
	line "you ride for free"
	cont "this one time."
	done
	
LakeBoatManText7:
	text "I'm sorry, but I"
	line "can't give you a"
	cont "ride for free."
	done
	
LakeBoatManText8:
	text "Welcome to the"
	line "LAKE ONWA BOAT"
	cont "HOUSE."
	
	para "Huh?"

	para "You're supposed to"
	line "meet someone on"
	cont "SUNBEAM ISLAND?"
	
	para "Sorry kid."
	
	para "The boats aren't"
	line "running to the"
	cont "island today."
	
	para "The SUNBEAM BOAT"
	line "HOUSE won't give"
	cont "us the 10-4 to"
	cont "ship out for some"
	cont "reason…"
	
	para "Maybe you should"
	line "call the person"
	cont "you were supposed"
	cont "to meet, and let"
	cont "them know."
	done
	
LakeBoatManText9:
	text "Where would you"
	line "like to go today?"
	done
	
LakeBoatManText10:
	text "Sorry kid."
	
	para "The boats aren't"
	line "running to the"
	cont "island today."
	
	para "The SUNBEAM BOAT"
	line "HOUSE won't give"
	cont "us the 10-4 to"
	cont "ship out for some"
	cont "reason…"
	
	para "Maybe you should"
	line "call the person"
	cont "you were supposed"
	cont "to meet, and let"
	cont "them know."
	done
	
LakeBoatManText11:
	text "Welcome to the"
	line "LAKE ONWA BOAT"
	cont "HOUSE."
	
	para "We can ferry you"
	line "for ¥500."
	
	para "Would you like a"
	line "ride?"
	done
	
LakeBoatManText12:
	text "Travel to"
	line "SUNSET BAY?"
	done
	
LakeBoatManText13:
	text "Travel to the"
	line "other side of"
	cont "LAKE ONWA?"
	done
	
LakeBoatManText14:
	text "Travel to"
	line "SUNBEAM ISLAND?"
	done
	
LakeBoatManText15:
	text "Huh?"
	
	para "A ride to the"
	line "other side of the"
	cont "lake?"
	
	para "Sure."
	
	para "I guess that's"
	line "the least I can do"
	cont "since I can't take"
	cont "you to the island…"
	
	para "It's on the house,"
	line "kid!"
	
	para "How 'bout it?"
	done
	
LakeBoatManText16:
	text "Travel to"
	line "SHIMMER CITY?"
	done
	
LakeBoatManText17:
	text "Travel to"
	line "BRILLO TOWN?"
	done
	
Movement_LakeBoatManPhone1:
	step_right
	step_end
	
Movement_LakeBoatManPhone2:
	step_left
	step_end