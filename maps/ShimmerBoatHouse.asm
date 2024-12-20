ShimmerBoatHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ShimmerBoatHouseCallback

	db 3 ; warp events
	warp_def  5,  5, 1, SHIMMER_HARBOR
	warp_def  5,  4, 1, SHIMMER_HARBOR
	warp_def  3,  5, 255, SAILBOAT_CUTSCENE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_FAT_GUY,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerBoatHouseNPC, -1
	
	
ShimmerBoatHouseCallback:
	checkevent EVENT_SHIMMER_BOAT_GUY_AT_WORK
	iftrue .end
	moveperson 1, -5, -5
.end
	return
	
ShimmerBoatHouseNPC:
	clearevent EVENT_LAKE_ROCKS_BROWN
	clearevent EVENT_BRILLO_MARACTUS_GREEN
	checkevent EVENT_CAN_GO_TO_DESERT
	iffalse .desert_first_time
	opentext
	writetext ShimmerBoatHouseNPCText2
	special PlaceMoneyTopRight
	yesorno
	iffalse .end
.return
	writetext ShimmerBoatHouseNPCText3
	waitbutton
	closetext
	refreshscreen $0
	special PlaceMoneyTopRight
	
	loadmenudata ShimmerBoatHouseBrilloMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .LakeR
	if_equal $4, .Sunbeam
	if_equal $5, .Brillo
	jump .end
	
.Sunset
	writetext ShimmerBoatHouseNPCText4
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneySunset
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext ShimmerBoatHouseNPCText7
.SunsetCont
	clearevent EVENT_SUNSET_STRAND
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_SUNSET
	jump .DoBoatEnd
	
.LakeL
	writetext ShimmerBoatHouseNPCText5
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyLakeL
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext ShimmerBoatHouseNPCText7
.LakeLCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_LAKE_L
	jump .DoBoatEnd
	
.LakeR
	writetext ShimmerBoatHouseNPCText6
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyLakeR
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext ShimmerBoatHouseNPCText7
.LakeRCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	clearevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_LAKE_R
	jump .DoBoatEnd
	
.Sunbeam
	writetext ShimmerBoatHouseNPCText8
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneySunbeam
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext ShimmerBoatHouseNPCText7
.SunbeamCont
	clearevent EVENT_ISLAND_BOATMAN
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_SUNBEAM
	jump .DoBoatEnd
	
.Brillo
	writetext ShimmerBoatHouseNPCText9
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyBrillo
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext ShimmerBoatHouseNPCText7
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
	writetext ShimmerBoatHouseNPCTextNoMoney
	jump .SunsetCont
	
.nomoneyLakeL
	checkmoney $1, 500
	if_equal $2, .nomoneyLakeL2
	
.nomoneyLakeL2
	writetext ShimmerBoatHouseNPCTextNoMoney
	jump .LakeLCont
	
.nomoneyLakeR
	checkmoney $1, 500
	if_equal $2, .nomoneyLakeR2
	
.nomoneyLakeR2
	writetext ShimmerBoatHouseNPCTextNoMoney
	jump .LakeRCont
	
.nomoneySunbeam
	checkmoney $1, 500
	if_equal $2, .nomoneySunbeam2
	jump .nomoneynoride
	
.nomoneySunbeam2
	writetext ShimmerBoatHouseNPCTextNoMoney
	jump .SunbeamCont
	
.nomoneyBrillo
	checkmoney $1, 500
	if_equal $2, .nomoneyBrillo2
	jump .nomoneynoride
	
.nomoneyBrillo2
	writetext ShimmerBoatHouseNPCTextNoMoney
	jump .BrilloCont
	
.nomoneynoride
	writetext ShimmerBoatHouseNPCTextNoMoney2
	buttonsound
	farwritetext StdBlankText
	pause 6
.end
	writetext ShimmerBoatHouseNPCTextEnd
	waitbutton
	closetext
	end
.desert_first_time
	opentext
	writetext ShimmerBoatHouseNPCTextDesertFirstTime
	yesorno
	iffalse .desert_no
	writetext ShimmerBoatHouseNPCText7
	setevent EVENT_CAN_GO_TO_DESERT
	jump .BrilloCont
	
.desert_no
	writetext ShimmerBoatHouseNPCTextDesertFirstTimeno
	waitbutton
	closetext
	end
	
ShimmerBoatHouseMenuData:
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
	db "SUNBEAM ISLAND@"
	end
	
ShimmerBoatHouseBrilloMenuData:
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
	db "SUNBEAM ISLAND@"
	db "PUEBLO BRILLO@"
	end
	
ShimmerBoatHouseNPCTextDesertFirstTime:
	text "Ah, <WAIT_S>you made it."
	
	para "You ready to go?"
	done
	
ShimmerBoatHouseNPCTextDesertFirstTimeno:
	text "Just let me know"
	line "when you're ready."
	done
	
ShimmerBoatHouseNPCText1:
	text "Sorry, kid."
	
	para "No boats are"
	line "running for now."
	done
	
ShimmerBoatHouseNPCText2:
	text "Welcome to the"
	line "PORT SHIMMER"
	cont "BOAT HOUSE."
	
	para "We can ferry you"
	line "for ¥500."
	
	para "Would you like a"
	line "ride?"
	done

ShimmerBoatHouseNPCText3:
	text "Where would you"
	line "like to go today?"
	done

ShimmerBoatHouseNPCText4:
	text "Travel to"
	line "SUNSET BAY?"
	done

ShimmerBoatHouseNPCText5:
	text "Travel to the"
	line "WEST end of"
	cont "LAKE ONWA?"
	done

ShimmerBoatHouseNPCText6:
	text "Travel to the"
	line "EAST end of"
	cont "LAKE ONWA?"
	done

ShimmerBoatHouseNPCText7:
	text "Alright."
	
	para "We'll head out."
	done
	
ShimmerBoatHouseNPCText8:
	text "Travel to"
	line "SUNBEAM ISLAND?"
	done
	
ShimmerBoatHouseNPCText9:
	text "Travel to"
	line "PUEBLO BRILLO?"
	done
	
ShimmerBoatHouseNPCTextEnd:
	text "Come again."
	done
	
ShimmerBoatHouseNPCTextNoMoney:
	text "You don't seem"
	line "to have enough"
	cont "money…"
	
	para "Hmm…"
	
	para "I guess I can"
	line "let you ride for"
	cont "free just this"
	cont "once."
	
	para "We'll head out."
	done
	
ShimmerBoatHouseNPCTextNoMoney2:
	text "You don't seem"
	line "to have enough"
	cont "money…"
	done
