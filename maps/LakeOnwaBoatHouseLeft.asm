LakeOnwaBoatHouseLeft_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 5, 4, 2, LAKE_ONWA
	warp_def 5, 5, 2, LAKE_ONWA

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
	setevent EVENT_LAKE_BOAT_LEFT_GONE
	setevent EVENT_JUST_TOOK_BOAT
	clearevent EVENT_LAKE_BOAT_RIGHT_GONE
	clearevent EVENT_BOAT_BOYS_BEGONE
	domaptrigger LAKE_ONWA, $1
	warpfacing UP, LAKE_ONWA, $27, $20
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
	loadmenudata LakeBoatHouseLMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeR
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
	
.LakeR
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
	domaptrigger SUNBEAM_ISLAND, $3
	warpfacing UP, SUNBEAM_ISLAND, $8, $31
	end
	
LakeBoatHouseLMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 4 ; items
	db "SUNSET BAY@"
	db "LAKE ONWA EAST@"
	db "SUNBEAM ISLAND@"
	db "CANCEL@"
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
	
	para "The best I can"
	line "do is give you"
	
	para "a ride to the"
	line "other side of"
	cont "the lake."
	
	para "Maybe you could"
	line "call someone for"
	cont "some help…"
	done
	
LakeBoatManText9:
	text "Where would you"
	line "like to go today?"
	done
	
LakeBoatManText10:
	text "Welcome to the"
	line "LAKE ONWA BOAT"
	cont "HOUSE."

	para "Sorry kid."
	
	para "The boats aren't"
	line "running to the"
	cont "island today."
	
	para "Maybe you could"
	line "call someone for"
	cont "some help…"
	
	para "The best I can"
	line "do is give you"
	
	para "a ride to the"
	line "other side of the"
	cont "lake."
	
	para "Would you like a"
	line "ride for ¥500?"
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
	cont "LAKE OWNA?"
	done
	
LakeBoatManText14:
	text "Travel to"
	line "SUNBEAM ISLAND?"
	done
	
LakeBoatManText15:
	text "Welcome to the"
	line "LAKE ONWA BOAT"
	cont "HOUSE."

	para "Sorry kid."
	
	para "The boats aren't"
	line "running to the"
	cont "island today."
	
	para "The best I can"
	line "do is give you"
	
	para "a ride to the"
	line "other side of the"
	cont "lake."
	
	para "Would you like a"
	line "ride for ¥500?"
	done
	
Movement_LakeBoatManPhone1:
	step_right
	step_end
	
Movement_LakeBoatManPhone2:
	step_left
	step_end