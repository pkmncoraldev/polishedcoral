SunbeamBoatHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  5, 13, SUNBEAM_ISLAND
	warp_def  5,  4, 13, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_FAT_GUY,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamBoatHouseNPC, EVENT_HAVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamBoatHouseSnare, EVENT_SAVED_SUNBEAM
	
SunbeamBoatHouseSnare:
	jumptextfaceplayer SunbeamBoatHouseSnareText
	
SunbeamBoatHouseNPC:
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
	loadmenudata SunbeamBoatHouseMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .LakeR
	if_equal $4, .end
	
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
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SUNSET_STRAND
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger SUNSET_BAY, $3
	warpfacing DOWN, SUNSET_BAY, 29, 28
	end
	
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
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger LAKE_ONWA, $2
	warpfacing LEFT, LAKE_ONWA, $18, $19
	end
	
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
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	clearevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_FAT_GUY
	domaptrigger LAKE_ONWA, $1
	warpfacing RIGHT, LAKE_ONWA, $27, $1f
	end
	
.nomoneySunset
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .SunsetCont
	
.nomoneyLakeL
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .LakeLCont
	
.nomoneyLakeR
	writetext SunbeamBoatHouseNPCTextNoMoney
	jump .LakeRCont
	
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
	db $81 ; flags
	db 4 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA WEST@"
	db "LAKE ONWA EAST@"
	db "CANCEL@"
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
	line "WEST end to"
	cont "LAKE ONWA?"
	done

SunbeamBoatHouseNPCText6:
	text "Travel to the"
	line "EAST end to"
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
