SunbeamBoatHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  5,  5, 13, SUNBEAM_ISLAND
	warp_def  5,  4, 13, SUNBEAM_ISLAND
	warp_def  3,  5, 255, SAILBOAT_CUTSCENE

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_FAT_GUY,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamBoatHouseNPC, EVENT_HAVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamBoatHouseSnare, EVENT_SAVED_SUNBEAM
	
SunbeamBoatHouseSnare:
	jumptextfaceplayer SunbeamBoatHouseSnareText
	
SunbeamBoatHouseNPC:
	clearevent EVENT_LAKE_ROCKS_BROWN
	opentext
	writetext SunbeamBoatHouseNPCText2
	special PlaceMoneyTopRight
	yesorno
	iffalse .end
.return
	writetext SunbeamBoatHouseNPCText3
	waitbutton
	closetext
	refreshscreen $0
	special PlaceMoneyTopRight
	
	checkevent EVENT_CAN_GO_TO_DESERT
	iftrue .brillomenu
	checkevent EVENT_CAN_GO_TO_SHIMMER
	iftrue .shimmermenu
	
	loadmenudata SunbeamBoatHouseMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .LakeR
	jump .end
	
.shimmermenu
	loadmenudata SunbeamBoatHouseShimmerMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .LakeR
	if_equal $4, .Shimmer
	jump .end
	
.brillomenu
	loadmenudata SunbeamBoatHouseBrilloMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .LakeR
	if_equal $4, .Shimmer
	if_equal $5, .Brillo
	jump .end
	
.Sunset
	writetext SunbeamBoatHouseNPCText4
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneySunset
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
.SunsetCont
	clearevent EVENT_SUNSET_STRAND
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_SUNSET
	jump .DoBoatEnd
	
.LakeL
	writetext SunbeamBoatHouseNPCText5
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyLakeL
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
.LakeLCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_LAKE_L
	jump .DoBoatEnd
	
.LakeR
	writetext SunbeamBoatHouseNPCText6
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyLakeR
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
.LakeRCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	clearevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_LAKE_R
	jump .DoBoatEnd
	
.Shimmer
	writetext SunbeamBoatHouseNPCText4
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyShimmer
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
.ShimmerCont
	clearevent EVENT_SHIMMER_BOATMAN
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_SHIMMER
	jump .DoBoatEnd
	
.Brillo
	writetext SunbeamBoatHouseNPCText4
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyBrillo
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
.BrilloCont
	clearevent EVENT_BRILLO_BOATMAN
	warpmod 1, SAILBOAT_CUTSCENE
	setevent EVENT_SAILBOAT_LEFT
	setevent EVENT_BOAT_GOING_TO_BRILLO

.DoBoatEnd
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
	
.nomoneySunset
	checkmoney $1, 500
	if_equal $2, .nomoneySunset2
	jump .nomoneynoride
	
.nomoneySunset2
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .SunsetCont
	
.nomoneyLakeL
	checkmoney $1, 500
	if_equal $2, .nomoneyLakeL2
	
.nomoneyLakeL2
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .LakeLCont
	
.nomoneyLakeR
	checkmoney $1, 500
	if_equal $2, .nomoneyLakeR2
	
.nomoneyLakeR2
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .LakeRCont
	
.nomoneyShimmer
	checkmoney $1, 500
	if_equal $2, .nomoneyShimmer2
	
.nomoneyShimmer2
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .ShimmerCont
	
.nomoneyBrillo
	checkmoney $1, 500
	if_equal $2, .nomoneyBrillo2
	
.nomoneyBrillo2
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .BrilloCont
	
.nomoneynoride
	writetext SunbeamBoatHouseNPCTextNoMoney2
	buttonsound
	farwritetext StdBlankText
	pause 6
.end
	writetext SunbeamBoatHouseNPCTextEnd
	waitbutton
	closetext
	end
	
SunbeamBoatHouseMenuData:
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
	db "LAKE ONWA EAST@"
	end
	
SunbeamBoatHouseShimmerMenuData:
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
	db "LAKE ONWA EAST@"
	db "SHIMMER CITY@"
	end
	
SunbeamBoatHouseBrilloMenuData:
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
	db "LAKE ONWA EAST@"
	db "SHIMMER CITY@"
	db "BRILLO TOWN@"
	end
	
SunbeamBoatHouseSnareText:
	text "We're closed!"
	
	para "Don't come back!"
	done
	
SunbeamBoatHouseNPCText1:
	text "Sorry, kid."
	
	para "No boats are"
	line "running for now."
	done
	
SunbeamBoatHouseNPCText2:
	text "Welcome to the"
	line "SUNBEAM ISLAND"
	cont "BOAT HOUSE."
	
	para "We can ferry you"
	line "for ¥500."
	
	para "Would you like a"
	line "ride?"
	done

SunbeamBoatHouseNPCText3:
	text "Where would you"
	line "like to go today?"
	done

SunbeamBoatHouseNPCText4:
	text "Travel to"
	line "SUNSET BAY?"
	done

SunbeamBoatHouseNPCText5:
	text "Travel to the"
	line "WEST end of"
	cont "LAKE ONWA?"
	done

SunbeamBoatHouseNPCText6:
	text "Travel to the"
	line "EAST end of"
	cont "LAKE ONWA?"
	done

SunbeamBoatHouseNPCText7:
	text "Alright."
	
	para "We'll head out"
	line "soon."
	done
	
SunbeamBoatHouseNPCTextEnd:
	text "Come again."
	done
	
SunbeamBoatHouseNPCTextNoMoney:
	text "You don't seem"
	line "to have enough"
	cont "money…"
	
	para "Hmm…"
	
	para "I guess I can"
	line "let you ride for"
	cont "free just this"
	cont "once."
	
	para "We'll head out"
	line "soon."
	done
	
SunbeamBoatHouseNPCTextNoMoney2:
	text "You don't seem"
	line "to have enough"
	cont "money…"
	done
