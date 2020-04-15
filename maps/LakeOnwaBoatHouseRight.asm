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
	checkevent EVENT_LEFT_ISLAND
	iftrue .normal2
	checkevent EVENT_CAPTAIN_GIVES_RIDES_TO_ISLAND
	iftrue .normal
	checkevent EVENT_CALLED_SPRUCE_CANT_GET_ON_ISLAND
	iftrue .talkedbeforeandcalled
	checkevent EVENT_TALKED_TO_MOM_ABOUT_PASS
	iftrue .talkedbeforeandcalled
	checkevent EVENT_TALKED_TO_BOAT_MAN_CANT_GET_ON_ISLAND
	iftrue .talkedbefore
	writetext LakeBoatManText8
	setevent EVENT_CAN_GET_PASS_FROM_MOM
	setevent EVENT_TALKED_TO_BOAT_MAN_CANT_GET_ON_ISLAND
	waitbutton
	closetext
	end
.talkedbefore
	writetext LakeBoatManText10
	jump .cont
.talkedbeforeandcalled
	writetext LakeBoatManText15
	jump .cont
.normal
	opentext
	writetext LakeBoatManText1
.cont
	special PlaceMoneyTopRight
	yesorno
	iffalse .end
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
.doit
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_RIGHT_GONE
	setevent EVENT_JUST_TOOK_BOAT
	clearevent EVENT_LAKE_BOAT_LEFT_GONE
	clearevent EVENT_BOAT_BOYS_BEGONE
	domaptrigger LAKE_ONWA, $2
	warpfacing UP, LAKE_ONWA, $18, $1a
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
	
.normal2
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
	loadmenudata LakeBoatHouseRMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .Sunbeam
	if_equal $4, .end
	
.Sunset
	writetext LakeBoatManText12
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SUNSET_STRAND
	domaptrigger SUNSET_BAY, $4
	warpfacing UP, SUNSET_BAY, $1a, $1d
	end
	
.LakeL
	writetext LakeBoatManText13
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	jump .doit
	
.Sunbeam
	writetext LakeBoatManText14
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext LakeBoatManText3
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_ISLAND_STRAND
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger SUNBEAM_ISLAND, $1
	warpfacing UP, SUNBEAM_ISLAND, $8, $31
	end
	
LakeBoatHouseRMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 4 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA WEST@"
	db "SUNBEAM ISLAND@"
	db "CANCEL@"
	end
