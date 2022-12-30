LakeOnwaBoatHouseRight_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 5, 4, 1, LAKE_ONWA
	warp_def 5, 5, 1, LAKE_ONWA
	warp_def  3,  4, 255, SAILBOAT_CUTSCENE

	db 0 ; coord events

	db 1 ; bg events
	signpost 1, 7, SIGNPOST_READ, LakeBoat1Trashcan

	db 1 ; object events
	person_event SPRITE_FAT_GUY, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LakeBoatMan1, -1

	const_def 1 ; object constants
	const LAKEBOATMAN1
	
LakeBoat1Trashcan:
	jumptext LakeBoatTrashcanText
	
LakeBoatMan1:
	opentext
	checkevent EVENT_SAVED_SUNBEAM
	iftrue .normal
	checkevent EVENT_CAPTAIN_GIVES_RIDES_TO_ISLAND
	iftrue .talkedbeforeandcalled
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	iftrue .talkedbeforeandcalled
	checkevent EVENT_LAKEHOUSE_SOFTLOCK_PREVENTION
	iftrue .talkedbeforeandcalled
	checkevent EVENT_TALKED_TO_BOAT_MAN_CANT_GET_ON_ISLAND
	iftrue .talkedbefore
	writetext LakeBoatManText8
	setevent EVENT_CAN_CALL_SPRUCE_ABOUT_ISLAND
	setevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	setevent EVENT_TALKED_TO_BOAT_MAN_CANT_GET_ON_ISLAND
	setevent EVENT_CAN_GET_FIRST_RIDE_TO_ISLAND
	clearevent EVENT_PLAYER_HOUSE_MOM_2
	setevent EVENT_PLAYER_HOUSE_MOM_1
	waitbutton
	closetext
	end
.talkedbefore
	writetext LakeBoatManText10
	waitbutton
	closetext
	end
.talkedbeforeandcalled
	writetext LakeBoatManText15
;	special PlaceMoneyTopRight
	yesorno
	iffalse .end
.doit
	checkevent EVENT_LAKE_BOAT_LEFT
	iffalse .LakeLCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_left
	spriteface LAKEBOATMAN1, DOWN
	clearevent EVENT_LAKE_BOAT_LEFT
	opentext
.LakeLCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_JUST_TOOK_BOAT
	setevent EVENT_LAKE_BOAT_LEFT
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_LAKE_L
	jump .DoBoatEnd
.nomoney
	checkevent EVENT_TAKEN_LAKE_BOAT_ONCE
	iftrue .noride
	writetext LakeBoatManText6
	waitbutton
	jump .doit
.noride
	writetext LakeBoatManText7
	waitbutton
.end
	writetext LakeBoatManText2
	waitbutton
	closetext
	end
	
.normal
	opentext
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
	
	loadmenudata LakeBoatHouseRMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .Sunbeam
	jump .end
	
.shimmermenu
	loadmenudata LakeBoatHouseRShimmerMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .Sunbeam
	if_equal $4, .Shimmer
	jump .end
	
.brillomenu
	loadmenudata LakeBoatHouseRBrilloMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
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
	iffalse .SunsetCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_right
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_left
	spriteface LAKEBOATMAN1, DOWN
	clearevent EVENT_LAKE_BOAT_LEFT
	opentext
.SunsetCont
	clearevent EVENT_SUNSET_STRAND
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_SUNSET
	jump .DoBoatEnd
	
.LakeL
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
	iffalse .SunbeamCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_left
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_right
	spriteface LAKEBOATMAN1, DOWN
	clearevent EVENT_LAKE_BOAT_LEFT
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
	iffalse .ShimmerCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_left
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_right
	spriteface LAKEBOATMAN1, DOWN
	clearevent EVENT_LAKE_BOAT_LEFT
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
	iffalse .BrilloCont
	writetext LakeBoatManText4
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_left
	opentext
	writetext LakeBoatManText5
	waitbutton
	closetext
	applyonemovement LAKEBOATMAN1, step_right
	spriteface LAKEBOATMAN1, DOWN
	clearevent EVENT_LAKE_BOAT_LEFT
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
	
LakeBoatHouseRMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 3 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA WEST@"
	db "SUNBEAM ISLAND@"
	end
	
LakeBoatHouseRShimmerMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 4 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA WEST@"
	db "SUNBEAM ISLAND@"
	db "SHIMMER CITY@"
	end
	
LakeBoatHouseRBrilloMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 5 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA WEST@"
	db "SUNBEAM ISLAND@"
	db "SHIMMER CITY@"
	db "BRILLO TOWN@"
	end
