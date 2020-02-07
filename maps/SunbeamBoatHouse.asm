SunbeamBoatHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  4, 13, SUNBEAM_ISLAND
	warp_def  5,  5, 13, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_FAT_GUY,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamBoatHouseNPC, -1
	person_event SPRITE_ELDER,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamBoatHouseStrand, EVENT_LEFT_ISLAND

	const_def 1 ; object constants
	const SUNBEAMBOATHOUSENPC1
	const SUNBEAMBOATHOUSENPC2
	
SunbeamBoatHouseNPC:
	checkevent EVENT_LEFT_ISLAND
	iftrue .normal2
	jumptextfaceplayer SunbeamBoatHouseNPCText
	
.normal2
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
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SUNSET_STRAND
	domaptrigger SUNSET_BAY, $4
	warpfacing UP, SUNSET_BAY, $1a, $1d
	end
	
.LakeL
	writetext SunbeamBoatHouseNPCText5
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
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
	
.LakeR
	writetext SunbeamBoatHouseNPCText6
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext SunbeamBoatHouseNPCText7
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_LEFT_GONE
	setevent EVENT_JUST_TOOK_BOAT
	clearevent EVENT_LAKE_BOAT_RIGHT_GONE
	clearevent EVENT_BOAT_BOYS_BEGONE
	domaptrigger LAKE_ONWA, $1
	warpfacing UP, LAKE_ONWA, $27, $20
	end
	
.nomoney
	writetext SunbeamBoatHouseNPCTextNoMoney
	waitbutton
	closetext
	end
	
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
	
SunbeamBoatHouseStrand:
	checkevent EVENT_GOT_POKEFLUTE
	iftrue .lasttripoffisland
	faceplayer
	opentext
	writetext SunbeamBoatHouseStrandText1
	yesorno
	iftrue .yes
	writetext SunbeamBoatHouseStrandTextNo
	waitbutton
	closetext
	spriteface SUNBEAMBOATHOUSENPC2, DOWN
	end
.yes
	writetext SunbeamBoatHouseStrandTextYes
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SUNSET_STRAND
	domaptrigger SUNSET_BAY, $3
	warpfacing UP, SUNSET_BAY, $1a, $1d
	end
	
.lasttripoffisland
	faceplayer
	opentext
	writetext SunbeamBoatHouseStrandText2
	yesorno
	iftrue .yes2
	writetext SunbeamBoatHouseStrandTextNo
	waitbutton
	closetext
	end
.yes2
	writetext SunbeamBoatHouseStrandText3
	waitbutton
	loadmenudata SunbeamBoatHouseStrandMenuData
	verticalmenu
	closewindow
	if_equal $1, .LakeStrand
	if_equal $2, .SunsetStrand
	if_equal $3, .end
.LakeStrand
	writetext SunbeamBoatHouseStrandTextYes
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_LAKE_STRAND
	setevent EVENT_LAKE_BOAT_LEFT_GONE
	clearevent EVENT_LAKE_BOAT_RIGHT_GONE
	domaptrigger LAKE_ONWA, $3
	warpfacing UP, LAKE_ONWA, $27, $20
	end
.SunsetStrand
	writetext SunbeamBoatHouseStrandTextYes
	waitbutton
	closetext
	special FadeOutPalettes
	special Special_FadeOutMusic
	clearevent EVENT_SUNSET_STRAND
	domaptrigger SUNSET_BAY, $5
	warpfacing UP, SUNSET_BAY, $1a, $1d
	end
.end
	writetext SunbeamBoatHouseStrandTextNo
	waitbutton
	closetext
	end

SunbeamBoatHouseStrandMenuData:
	db $40 ; flags
	db 04, 06 ; start coords
	db 11, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "LAKE ONWA@"
	db "SUNSET BAY@"
	db "CANCEL@"
	end
	
SunbeamBoatHouseStrandText2:
	text "Ah, hello,"
	line "<PLAYER>."
	
	para "Did you take care"
	line "of what you came"
	cont "here for?"
	
	para "Ready to leave the"
	line "island?"
	done
	
SunbeamBoatHouseStrandText3:
	text "I could take you"
	line "to SUNSET BAY,"
	
	para "but it might be"
	line "quicker for you"
	cont "if I just took"
	cont "you back to LAKE"
	cont "ONWA."
	
	para "So, which will it"
	line "be?"
	done
	
SunbeamBoatHouseNPCTextEnd:
	text "Come again."
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
	
SunbeamBoatHouseNPCTextNoMoney:
	text "I'm sorry, but I"
	line "can't give you a"
	cont "ride for free."
	done
	
SunbeamBoatHouseNPCText:
	text "Sorry, kid."
	
	para "No boats are"
	line "running for now."
	done
	
SunbeamBoatHouseStrandText1:
	text "Ah, hello,"
	line "<PLAYER>."
	
	para "Would you like a"
	line "ride back to"
	cont "SUNSET BAY?"
	done
	
SunbeamBoatHouseStrandTextYes:
	text "Great!"
	
	para "SUNSET BAY,"
	line "ho!"
	done
	
SunbeamBoatHouseStrandTextNo:
	text "Ok."
	
	para "I'll be here when"
	line "you're ready."
	done