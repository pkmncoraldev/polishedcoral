BrilloBoatHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  5,  5, 1, BRILLO_TOWN
	warp_def  5,  4, 1, BRILLO_TOWN
	warp_def  3,  5, 255, SAILBOAT_CUTSCENE

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_FAT_GUY,  1,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrilloBoatHouseClerk, -1
	person_event SPRITE_SAGE,  3,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloBoatHouseNPC1, -1
	person_event SPRITE_REDS_MOM,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrilloBoatHouseNPC2, -1
	
	const_def 1 ; object constants
	const BRILLO_BOAT_HOUSE_CLERK
	const BRILLO_BOAT_HOUSE_NPC_1
	const BRILLO_BOAT_HOUSE_NPC_2
	
BrilloBoatHouseClerk:
	clearevent EVENT_LAKE_ROCKS_BROWN
	opentext
	writetext BrilloBoatHouseClerkText2
	special PlaceMoneyTopRight
	yesorno
	iffalse .end
.return
	writetext BrilloBoatHouseClerkText3
	waitbutton
	closetext
	refreshscreen $0
	special PlaceMoneyTopRight
	loadmenudata BrilloBoatHouseMenuData
	verticalmenu
	closewindow
	if_equal $1, .Sunset
	if_equal $2, .LakeL
	if_equal $3, .LakeR
	if_equal $4, .Sunbeam
	if_equal $5, .Shimmer
	jump .end
	
.Sunset
	writetext BrilloBoatHouseClerkText4
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneySunset
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext BrilloBoatHouseClerkText7
.SunsetCont
	clearevent EVENT_SUNSET_STRAND
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_SUNSET
	jump .DoBoatEnd
	
.LakeL
	writetext BrilloBoatHouseClerkText5
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyLakeL
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext BrilloBoatHouseClerkText7
.LakeLCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	setevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_LAKE_L
	jump .DoBoatEnd
	
.LakeR
	writetext BrilloBoatHouseClerkText6
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyLakeR
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext BrilloBoatHouseClerkText7
.LakeRCont
	setevent EVENT_TAKEN_LAKE_BOAT_ONCE
	clearevent EVENT_LAKE_BOAT_LEFT
	setevent EVENT_JUST_TOOK_BOAT
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_LAKE_R
	jump .DoBoatEnd
	
.Sunbeam
	writetext BrilloBoatHouseClerkText8
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneySunbeam
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext BrilloBoatHouseClerkText7
.SunbeamCont
	clearevent EVENT_ISLAND_BOATMAN
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_SUNBEAM
	jump .DoBoatEnd
	
.Shimmer
	writetext BrilloBoatHouseClerkText9
	yesorno
	iffalse .return
	checkmoney $0, 500
	if_equal $2, .nomoneyShimmer
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	writetext BrilloBoatHouseClerkText7
.ShimmerCont
	clearevent EVENT_SHIMMER_BOATMAN
	warpmod 2, SAILBOAT_CUTSCENE
	setevent EVENT_BOAT_GOING_TO_SHIMMER

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
	writetext BrilloBoatHouseClerkTextNoMoney
	jump .SunsetCont
	
.nomoneyLakeL
	checkmoney $1, 500
	if_equal $2, .nomoneyLakeL2
	
.nomoneyLakeL2
	writetext BrilloBoatHouseClerkTextNoMoney
	jump .LakeLCont
	
.nomoneyLakeR
	checkmoney $1, 500
	if_equal $2, .nomoneyLakeR2
	
.nomoneyLakeR2
	writetext BrilloBoatHouseClerkTextNoMoney
	jump .LakeRCont
	
.nomoneySunbeam
	checkmoney $1, 500
	if_equal $2, .nomoneySunbeam2
	jump .nomoneynoride
	
.nomoneySunbeam2
	writetext BrilloBoatHouseClerkTextNoMoney
	jump .SunbeamCont
	
.nomoneyShimmer
	checkmoney $1, 500
	if_equal $2, .nomoneyShimmer2
	jump .nomoneynoride
	
.nomoneyShimmer2
	writetext BrilloBoatHouseClerkTextNoMoney
	jump .ShimmerCont
	
.nomoneynoride
	writetext BrilloBoatHouseClerkTextNoMoney2
	buttonsound
	farwritetext StdBlankText
	pause 6
.end
	writetext BrilloBoatHouseClerkTextEnd
	waitbutton
	closetext
	end
	
BrilloBoatHouseMenuData:
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
	db "SHIMMER CITY@"
	end
	
BrilloBoatHouseBrilloMenuData:
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
	db "BRILLO TOWN@"
	end
	
BrilloBoatHouseNPC1:
	jumptextfaceplayer BrilloBoatHouseNPC1Text
	
BrilloBoatHouseNPC2:
	faceplayer
	opentext
	writetext BrilloBoatHouseNPC2Text
	waitbutton
	closetext
	spriteface BRILLO_BOAT_HOUSE_NPC_2, DOWN
	end
	
BrilloBoatHouseClerkText1:
	text "Sorry, kid."
	
	para "No boats are"
	line "running for now."
	done
	
BrilloBoatHouseClerkText2:
	text "Welcome to the"
	line "BRILLO BOAT HOUSE."
	
	para "We can ferry you"
	line "for ¥500."
	
	para "Would you like a"
	line "ride?"
	done

BrilloBoatHouseClerkText3:
	text "Where would you"
	line "like to go today?"
	done

BrilloBoatHouseClerkText4:
	text "Travel to"
	line "SUNSET BAY?"
	done

BrilloBoatHouseClerkText5:
	text "Travel to the"
	line "WEST end of"
	cont "LAKE ONWA?"
	done

BrilloBoatHouseClerkText6:
	text "Travel to the"
	line "EAST end of"
	cont "LAKE ONWA?"
	done

BrilloBoatHouseClerkText7:
	text "Alright."
	
	para "We'll head out"
	line "soon."
	done
	
BrilloBoatHouseClerkText8:
	text "Travel to"
	line "SUNBEAM ISLAND?"
	done
	
BrilloBoatHouseClerkText9:
	text "Travel to"
	line "SHIMMER CITY?"
	done
	
BrilloBoatHouseClerkTextEnd:
	text "Come again."
	done
	
BrilloBoatHouseClerkTextNoMoney:
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
	
BrilloBoatHouseClerkTextNoMoney2:
	text "You don't seem"
	line "to have enough"
	cont "money…"
	done
	
BrilloBoatHouseNPC1Text:
	text "A prickly desert"
	line "#MON."
	
	para "It has the ABILITY"
	line "to DRAIN certain"
	cont "moves and power"
	cont "itself up!"
	
	para "You'd do well to"
	line "remember that if"
	cont "you like fun and"
	cont "games!"
	done
	
BrilloBoatHouseNPC2Text:
	text "The old guy by the"
	line "counter won't stop"
	cont "speaking in"
	cont "riddles!"
	
	para "How annoying…"
	done

	
