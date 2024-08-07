ShimmerCity_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, ShimmerCityFlyPoint
	callback MAPCALLBACK_TILES, ShimmerCityCallback

	db 27 ; warp events
	warp_event  4, 25, SHIMMER_LAB_LOBBY, 1
	warp_event  5, 25, SHIMMER_LAB_LOBBY, 2
	warp_event  7, 15, SHIMMER_UNDER_BOARDWALK, 4
	warp_event  7, 14, SHIMMER_UNDER_BOARDWALK, 2
	warp_event  7, 11, SHIMMER_UNDER_BOARDWALK, 9
	warp_event  7, 10, SHIMMER_UNDER_BOARDWALK, 7
	warp_event  8,  8, SHIMMER_UNDER_BOARDWALK, 14
	warp_event  8,  7, SHIMMER_UNDER_BOARDWALK, 13
	warp_event  8,  6, SHIMMER_UNDER_BOARDWALK, 12
	warp_event  7,  3, SHIMMER_UNDER_BOARDWALK, 37
	warp_event  6,  3, SHIMMER_UNDER_BOARDWALK, 20
	warp_event  4,  3, SHIMMER_UNDER_BOARDWALK, 18
	warp_event  3,  3, SHIMMER_UNDER_BOARDWALK, 17
	warp_event  2,  3, SHIMMER_UNDER_BOARDWALK, 10
	warp_event  1,  6, SHIMMER_UNDER_BOARDWALK, 33
	warp_event  1,  7, SHIMMER_UNDER_BOARDWALK, 34
	warp_event  1,  8, SHIMMER_UNDER_BOARDWALK, 35
	warp_event  2, 10, SHIMMER_UNDER_BOARDWALK, 28
	warp_event  2, 11, SHIMMER_UNDER_BOARDWALK, 30
	warp_event  2, 14, SHIMMER_UNDER_BOARDWALK, 23
	warp_event  2, 15, SHIMMER_UNDER_BOARDWALK, 25
	warp_event 33, 15, SHIMMER_POKECENTER, 1
	warp_event 37, 23, SHIMMER_MART, 1
	warp_event 13, 23, SHIMMER_HOUSE_1, 1
	warp_event 21, 23, SHIMMER_HOUSE_2, 1
	warp_event 23, 13, SHIMMER_CAFE, 1
	warp_event  5,  3, SHIMMER_UNDER_BOARDWALK, 19

	db 0 ; coord events

	db 10 ; bg events
	bg_event 14, 15, SIGNPOST_ITEM + BIG_NUGGET, EVENT_SHIMMER_CITY_HIDDEN_ITEM
	signpost 14, 15, SIGNPOST_LEFT, ShimmerCityFishMarket
	signpost 17, 15, SIGNPOST_LEFT, ShimmerCityBerryMarket
	signpost 18, 20, SIGNPOST_READ, ShimmerCitySign
	signpost 14, 22, SIGNPOST_READ, ShimmerCafeSign
	signpost 26,  3, SIGNPOST_READ, ShimmerLabSign
	signpost 14, 36, SIGNPOST_READ, ShimmerFlowers
	signpost 15, 36, SIGNPOST_READ, ShimmerFlowers
	signpost  9, 23, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_CITY_HIDDEN_BOTTLE_CAP_1
	signpost 13, 10, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_CITY_HIDDEN_BOTTLE_CAP_2

	db 11 ; object events
	person_event SPRITE_FISHING_GURU, 14, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc1, -1
	person_event SPRITE_POKEFAN_F, 17, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc2, -1
	person_event SPRITE_REDS_MOM, 16, 19, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc3, -1
	person_event SPRITE_CHILD, 19, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc4, -1
	person_event SPRITE_FAT_GUY, 18, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc5, -1
	person_event SPRITE_PONYTAIL, 10, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc6, -1
	person_event SPRITE_BALLOONS, 15, 16, SPRITEMOVEDATA_BALLOONS_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BALLOONS, 12, 16, SPRITEMOVEDATA_BALLOONS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX, 15, 15, SPRITEMOVEDATA_STALL, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  3,  3, SPRITEMOVEDATA_BINOCULARS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  3,  6, SPRITEMOVEDATA_BINOCULARS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	
	const_def 1 ; object constants
	const SHIIMER_CITY_NPC_1
	const SHIIMER_CITY_NPC_2
	const SHIIMER_CITY_NPC_3
	const SHIIMER_CITY_NPC_4
	const SHIIMER_CITY_NPC_5
	const SHIIMER_CITY_NPC_6
	
	
ShimmerCityFlyPoint:
	setflag ENGINE_FLYPOINT_SHIMMER
	setevent EVENT_CAN_GO_TO_SHIMMER
	setevent EVENT_MADE_IT_TO_SOUTH_ONWA
	clearevent EVENT_HAVENT_MADE_IT_TO_SOUTH_ONWA
	return
	
ShimmerCityCallback:
	setevent EVENT_HARBOR_BINOCULAR_COLORS
	domaptrigger SHIMMER_HARBOR, $0
	return
	
ShimmerCitySign:
	jumptext ShimmerCitySignText
	
ShimmerCafeSign:
	jumptext ShimmerCafeSignText
	
ShimmerMarketSign:
	jumptext ShimmerMarketSignText
	
ShimmerLabSign:
	jumptext ShimmerLabSignText
	
ShimmerFlowers:
	jumptext ShimmerFlowersText
	
ShimmerCityFishMarket:
	callasm ShimmerCityFishMarketAsm
	end
	
ShimmerCityFishMarketAsm:
	farcall Script_opentext
	ld a, MARTTYPE_FISH_MARKET
	ld c, a
	ld a, MART_SHIMMER_FISH_MARKET
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	farjp Script_endtext

	
ShimmerCityBerryMarket:
	callasm ShimmerCityBerryMarketAsm
	end
	
ShimmerCityBerryMarketAsm:
	farcall Script_opentext
	ld a, MARTTYPE_BERRY_MARKET
	ld c, a
	ld a, MART_SHIMMER_BERRY_MARKET
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	farjp Script_endtext
	
ShimmerCityNpc1:
	faceplayer
	opentext
	writetext ShimmerCityNpc1Text
	waitbutton
	closetext
	spriteface SHIIMER_CITY_NPC_1, RIGHT
	end
	
ShimmerCityNpc2:
	faceplayer
	opentext
	writetext ShimmerCityNpc2Text
	waitbutton
	closetext
	spriteface SHIIMER_CITY_NPC_2, RIGHT
	end
	
ShimmerCityNpc3:
	jumptextfaceplayer ShimmerCityNpc3Text
	
ShimmerCityNpc4:
	checkevent EVENT_GAVE_KID_HORSEA
	iftrue .gavehorsea
	faceplayer
	opentext
	writetext ShimmerCityNpc4Text1
	yesorno
	iffalse .cancel
	callasm ShimmerCityHorseaKidAsm
	ifequal 3, .cancel
	iffalse .no
	checkcode VAR_PARTYCOUNT
	ifequal $1, .lastmon
	writetext ShimmerCityNpc4Text2
	yesorno
	iffalse .cancel
	writetext ShimmerCityNpc4Text3
	waitbutton
	writetext ShimmerCityNpc4Text4
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	writetext ShimmerCityNpc4Text5
	waitbutton
	closetext
	setevent EVENT_GAVE_KID_HORSEA
	end
.cancel
	writetext ShimmerCityNpc4Text6
	waitbutton
	closetext
	end
.no
	writetext ShimmerCityNpc4Text7
	waitbutton
	closetext
	end
.gavehorsea
	jumptextfaceplayer ShimmerCityNpc4Text8
.lastmon
	writetext ShimmerCityNpc4Text9
	waitbutton
	closetext
	end
	
ShimmerCityNpc5:
	faceplayer
	opentext
	writetext ShimmerCityNpc5Text
	waitbutton
	closetext
	spriteface SHIIMER_CITY_NPC_5, DOWN
	end
	
ShimmerCityNpc6:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .lost_girl
	jumptextfaceplayer ShimmerCityNpc6Text1
.lost_girl
	jumptextfaceplayer ShimmerCityNpc6Text2
	
ShimmerCityHorseaKidAsm:
	farcall SelectTradeOrDaycareMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp BULBASAUR ;TODO
	jr z, .yes
	ld a, FALSE
	ld [wScriptVar], a
	ret
.cancel
	ld a, 3
	ld [wScriptVar], a
	ret
.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret
	
ShimmerCitySignText:
	text "PORT SHIMMER"
	
	para "The gateway to"
	line "SOUTHERN ONWA."
	done
	
ShimmerCafeSignText:
	text "SHIMMER CAFE"
	done
	
ShimmerMarketSignText:
	text "FARMER'S MARKET"
	done
	
ShimmerLabSignText:
	text "PORT SHIMMER"
	line "RESEARCH LAB"
	done
	
ShimmerFlowersText:
	text "Some flowers."
	
	para "They remind you"
	line "of home…"
	done
	
ShimmerCityNpc1Text:
	text "Woah!"
	
	para "Nothing back here,"
	line "kid."
	done
	
ShimmerCityNpc2Text:
	text "Oh dear…"
	
	para "If you want to buy"
	line "some berries,"
	
	para "go to the front of"
	line "the stall."
	done
	
ShimmerCityNpc3Text:
	text "Smell that?"
	
	para "I just love the"
	line "salty sea air!"
	done
	
ShimmerCityNpc4Text1:
	text "I really wanna buy"
	line "a HORSEA from the"
	cont "man at that stall,"
	
	para "but I don't have"
	line "any money."
	
	para "Sigh…"
	
	para "Do you have a"
	line "HORSEA?"
	done
	
ShimmerCityNpc4Text2:
	text "HORSEA!"
	
	para "Can I really have"
	line "it?"
	done
	
ShimmerCityNpc4Text3:
	text "Oh thank you!<WAIT_M>"
	line "Thank you!"
	done
	
ShimmerCityNpc4Text4:
	text "<PLAYER> handed"
	line "over HORSEA."
	done
	
ShimmerCityNpc4Text5:
	text "I'll take really"
	line "good care of it,"
	cont "I promise!"
	done
	
ShimmerCityNpc4Text6:
	text "Aww…"
	done
	
ShimmerCityNpc4Text7:
	text "Hey!"
	
	para "That's not HORSEA!"
	done
	
ShimmerCityNpc4Text8:
	text "Thank you!<WAIT_M>"
	line "Thank you!"
	
	para "I love my HORSEA!"
	done
	
ShimmerCityNpc4Text9:
	text "Thanks, but I can't"
	line "take your only"
	cont "#MON."
	done
	
ShimmerCityNpc5Text:
	text "The guy at the"
	line "blue stall buys"
	cont "and sells #MON."
	
	para "I'm sure he takes"
	line "good care of them."
	
	para "…<WAIT_M>Right?"
	done
	
ShimmerCityNpc6Text1:
	text "Did you come from"
	line "up NORTH?"
	
	para "Well, welcome to"
	line "SOUTH ONWA!"
	
	para "Take a look at"
	line "your map!"
	done
	
ShimmerCityNpc6Text2:
	text "I saw a little"
	line "girl playing under"
	cont "the boardwalk."
	
	para "Shouldn't she have"
	line "adult supervision?"
	done
	