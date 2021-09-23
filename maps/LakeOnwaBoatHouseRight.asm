LakeOnwaBoatHouseRight_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 5, 4, 1, LAKE_ONWA
	warp_def 5, 5, 1, LAKE_ONWA

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
;	checkevent EVENT_CALLED_SPRUCE_CANT_GET_ON_ISLAND
;	iftrue .talkedbeforeandcalled
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
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
	iffalse .skipcallingboat1
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
.skipcallingboat1
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_JUST_TOOK_BOAT
	setevent EVENT_LAKE_BOAT_LEFT
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger LAKE_ONWA, $2
	warpfacing LEFT, LAKE_ONWA, $18, $19
	end
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
	iffalse .skipcallingboat2
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
.skipcallingboat2
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SUNSET_STRAND
	domaptrigger SUNSET_BAY, $3
	warpfacing UP, SUNSET_BAY, 29, 28
	end
	
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
	iffalse .skipcallingboat3
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
.skipcallingboat3
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_ISLAND_BOATMAN
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger SUNBEAM_ISLAND, $1
	warpfacing UP, SUNBEAM_ISLAND, 7, 50
	end
	
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
	iffalse .skipcallingboat4
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
.skipcallingboat4
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SHIMMER_BOATMAN
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger SHIMMER_HARBOR, $1
	warpfacing DOWN, SHIMMER_HARBOR, 15, 8
	end
	
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
	iffalse .skipcallingboat5
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
.skipcallingboat5
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_BRILLO_BOATMAN
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger BRILLO_TOWN, $1
	warpfacing DOWN, BRILLO_TOWN, 17, 24
	end
	
LakeBoatHouseRMenuData:
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
	db 6 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA WEST@"
	db "SUNBEAM ISLAND@"
	db "SHIMMER CITY@"
	db "BRILLO TOWN@"
	end
