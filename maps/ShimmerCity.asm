ShimmerCity_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, ShimmerCityFlyPoint

	db 27 ; warp events
	warp_event  8, 25, SHIMMER_LAB_LOBBY, 1
	warp_event  9, 25, SHIMMER_LAB_LOBBY, 2
	warp_event 11, 15, SHIMMER_UNDER_BOARDWALK, 4
	warp_event 11, 14, SHIMMER_UNDER_BOARDWALK, 2
	warp_event 11, 11, SHIMMER_UNDER_BOARDWALK, 9
	warp_event 11, 10, SHIMMER_UNDER_BOARDWALK, 7
	warp_event 12,  8, SHIMMER_UNDER_BOARDWALK, 14
	warp_event 12,  7, SHIMMER_UNDER_BOARDWALK, 13
	warp_event 12,  6, SHIMMER_UNDER_BOARDWALK, 12
	warp_event 11,  3, SHIMMER_UNDER_BOARDWALK, 37
	warp_event 10,  3, SHIMMER_UNDER_BOARDWALK, 20
	warp_event  8,  3, SHIMMER_UNDER_BOARDWALK, 18
	warp_event  7,  3, SHIMMER_UNDER_BOARDWALK, 17
	warp_event  6,  3, SHIMMER_UNDER_BOARDWALK, 10
	warp_event  5,  6, SHIMMER_UNDER_BOARDWALK, 33
	warp_event  5,  7, SHIMMER_UNDER_BOARDWALK, 34
	warp_event  5,  8, SHIMMER_UNDER_BOARDWALK, 35
	warp_event  6, 10, SHIMMER_UNDER_BOARDWALK, 28
	warp_event  6, 11, SHIMMER_UNDER_BOARDWALK, 30
	warp_event  6, 14, SHIMMER_UNDER_BOARDWALK, 23
	warp_event  6, 15, SHIMMER_UNDER_BOARDWALK, 25
	warp_event 37, 15, SHIMMER_POKECENTER, 1
	warp_event 41, 23, SHIMMER_MART, 1
	warp_event 17, 23, SHIMMER_HOUSE_1, 1
	warp_event 25, 23, SHIMMER_HOUSE_2, 1
	warp_event 27, 13, SHIMMER_CAFE, 1
	warp_event  9,  3, SHIMMER_UNDER_BOARDWALK, 19

	db 0 ; coord events

	db 11 ; bg events
	bg_event 18, 15, SIGNPOST_ITEM + BIG_NUGGET, EVENT_SHIMMER_CITY_HIDDEN_ITEM
	signpost 14, 19, SIGNPOST_LEFT, ShimmerCityFishMarket
	signpost 17, 19, SIGNPOST_LEFT, ShimmerCityBerryMarket
	signpost 18, 24, SIGNPOST_READ, ShimmerCitySign
	signpost 14, 26, SIGNPOST_READ, ShimmerCafeSign
	signpost 26,  7, SIGNPOST_READ, ShimmerLabSign
	signpost 14, 40, SIGNPOST_READ, ShimmerFlowers
	signpost 15, 40, SIGNPOST_READ, ShimmerFlowers
	signpost  6,  9, SIGNPOST_READ, ShimmerCityHotDogStand
	signpost  9, 27, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_CITY_HIDDEN_BOTTLE_CAP_1
	signpost 13, 14, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_CITY_HIDDEN_BOTTLE_CAP_2

	db 20 ; object events
	person_event SPRITE_FISHING_GURU, 14, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc1, -1
	person_event SPRITE_POKEFAN_F, 17, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc2, -1
	person_event SPRITE_REDS_MOM, 16, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc3, -1
	person_event SPRITE_CHILD, 19, 27, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc4, -1
	person_event SPRITE_FAT_GUY, 18, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc5, -1
	person_event SPRITE_PONYTAIL, 10, 18, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc6, -1
	person_event SPRITE_YOUNGSTER,  5, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc7, -1
	person_event SPRITE_CUTE_GIRL, 11, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc8, -1
	person_event SPRITE_SUPER_NERD,  9,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc9, -1
	person_event SPRITE_HIKER,  7,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc10, -1
	person_event SPRITE_MATRON, 24, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc11, -1
	person_event SPRITE_POKEFAN_F, 24, 22, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc12, -1
	person_event SPRITE_POKEMANIAC, 15,  9, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc13, -1
	person_event SPRITE_COOLTRAINER_M, 20, 37, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc14, -1
	person_event SPRITE_POKEFAN_M, 27, 11, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc15, -1
	person_event SPRITE_BURGLAR, 13, 25, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc16, -1
	person_event SPRITE_CHEF,  6,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerCityHotDogGuy, -1
	person_event SPRITE_PICNIC,  5,  9, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_BALLOONS, 15, 20, SPRITEMOVEDATA_BALLOONS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BALLOONS, 12, 20, SPRITEMOVEDATA_BALLOONS_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, -1

	
	const_def 1 ; object constants
	const SHIIMER_CITY_NPC_1
	const SHIIMER_CITY_NPC_2
	const SHIIMER_CITY_NPC_3
	const SHIIMER_CITY_NPC_4
	const SHIIMER_CITY_NPC_5
	const SHIIMER_CITY_NPC_6
	const SHIIMER_CITY_NPC_7
	const SHIIMER_CITY_NPC_8
	const SHIIMER_CITY_NPC_9
	const SHIIMER_CITY_NPC_10
	const SHIIMER_CITY_NPC_11
	const SHIIMER_CITY_NPC_12
	const SHIIMER_CITY_NPC_13
	const SHIIMER_CITY_NPC_14
	const SHIIMER_CITY_NPC_15
	const SHIIMER_CITY_NPC_16
	const SHIIMER_CITY_HOT_DOG_GUY
	
	
ShimmerCityFlyPoint:
	setflag ENGINE_FLYPOINT_SHIMMER
	setevent EVENT_CAN_GO_TO_SHIMMER
	setevent EVENT_MADE_IT_TO_SOUTH_ONWA
	clearevent EVENT_HAVENT_MADE_IT_TO_SOUTH_ONWA
	return
	
ShimmerCityHotDogGuy:
	faceplayer
	opentext
	writetext ShimmerCityHotDogGuyText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	checkmoney $0, 1000
	ifequal $2, .nomoney
	giveitem DUBIOUS_DOG
	iffalse .noroom
	takemoney $0, 1000
	takeitem DUBIOUS_DOG
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext ShimmerCityHotDogGuy2
	waitbutton
	closetext
	pause 5
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, turn_step_right
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, step_end
	pause 10
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, turn_step_right
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, step_end
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, turn_step_right
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, step_end
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, turn_step_right
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, step_end
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, turn_step_right
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, step_end
	pause 10
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, turn_step_down
	applyonemovement SHIIMER_CITY_HOT_DOG_GUY, step_end
	opentext
	writetext ShimmerCityHotDogGuy3
	buttonsound
	verbosegiveitem DUBIOUS_DOG
	closetext
	spriteface SHIIMER_CITY_HOT_DOG_GUY, DOWN
	end
.nomoney
	writetext ShimmerCityHotDogGuyNoMoney
	waitbutton
	closetext
	spriteface SHIIMER_CITY_HOT_DOG_GUY, DOWN
	end
.noroom
	writetext ShimmerCityHotDogGuyNoRoom
	waitbutton
	closetext
	spriteface SHIIMER_CITY_HOT_DOG_GUY, DOWN
	end
.no
	writetext ShimmerCityHotDogGuyTextNo
	waitbutton
	closetext
	spriteface SHIIMER_CITY_HOT_DOG_GUY, DOWN
	end

ShimmerCityHotDogGuyText1:
	text "Try one of the"
	line "BOARDWALK'S world"
	cont "famous hot dogs."
	
	para "Made of only the"
	line "best ingredients!"
	
	para "How about it?"
	line "Only ¥1000."
	done
	
ShimmerCityHotDogGuy2:
	text "One delicious"
	line "hot dog, coming"
	cont "right up!"
	done
	
ShimmerCityHotDogGuy3:
	text "Here ya go!"
	done
	
ShimmerCityHotDogGuyNoMoney:
	text "You don't have"
	line "the funds!"
	
	para "I can't just"
	line "give 'em away!"
	done
	
ShimmerCityHotDogGuyNoRoom:
	text "You've already got"
	line "too much junk!"
	
	para "Come back later."
	done
	
ShimmerCityHotDogGuyTextNo:
	text "Your loss!"
	done
	
ShimmerCityHotDogStand:
	jumptext ShimmerCityHotDogStandText
	
ShimmerCityHotDogStandText:
	text "A hot dog stand."
	
	para "A fishy smell"
	line "wafts from it."
	done
	
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
	
ShimmerCityNpc7:
	jumptext ShimmerCityNpc7Text
	
ShimmerCityNpc7Text:
	text "I can totally see"
	line "the LIGHTHOUSE"
	cont "from here!"
	done
	
ShimmerCityNpc8:
	faceplayer
	opentext
	writetext ShimmerCityNpc8Text
	waitbutton
	closetext
	spriteface SHIIMER_CITY_NPC_8, UP
	end
	
ShimmerCityNpc8Text:
	text "I'm a lonely loner.<WAIT_S>"
	line "I have no one."
	
	para "My friends call"
	line "me a loner,"
	
	para "my family calls"
	line "me a loner,"
	
	para "my boyfriend calls"
	line "me a loner,"
	
	para "even my #MON"
	line "call me a loner!"
	
	para "I have no one,<WAIT_S>"
	line "so here I sit:"
	
	para "Loner<WAIT_S>-ly…"
	done
	
ShimmerCityNpc9:
	faceplayer
	opentext
	writetext ShimmerCityNpc9Text
	waitbutton
	closetext
	spriteface SHIIMER_CITY_NPC_9, DOWN
	end
	
ShimmerCityNpc9Text:
	text "That girl over"
	line "there claims she's"
	cont "a loner."
	
	para "She has tons of"
	line "friends, and just"
	cont "wants to seem cool"
	cont "and mysterious."
	
	para "She has a long way"
	line "to go if she wants"
	cont "to be a REAL loner"
	cont "like me!"
	done
	
ShimmerCityNpc10:
	faceplayer
	opentext
	writetext ShimmerCityNpc10Text
	waitbutton
	closetext
	spriteface SHIIMER_CITY_NPC_10, UP
	end
	
ShimmerCityNpc10Text:
	text "They say the guy"
	line "who runs the BOAT"
	cont "HOUSE love to eat."
	
	para "But hey, <WAIT_S>"
	line "who doesn't, right?"
	
	para "Gahaha!"
	done
	
ShimmerCityNpc11:
	applyonemovement SHIIMER_CITY_NPC_11, turn_step_right
	opentext
	writetext ShimmerCityNpc11Text
	waitbutton
	closetext
	pause 5
	applyonemovement SHIIMER_CITY_NPC_12, turn_step_left
	opentext
	writetext ShimmerCityNpc11Text2
	waitbutton
	closetext
	end
	
ShimmerCityNpc11Text:
	text "You know the"
	line "hot dog vendor on"
	cont "the BOARDWALK?"
	
	para "I heard he sources"
	line "his ingredients"
	cont "locally."
	
	para "V<WAIT_S>E<WAIT_S>E<WAIT_S>E<WAIT_S>RY locally,"
	line "if you catch my"
	cont "drift…"
	done
	
ShimmerCityNpc11Text2:
	text "How scandalous!"
	done
	
ShimmerCityNpc12:
	applyonemovement SHIIMER_CITY_NPC_12, turn_step_left
	opentext
	writetext ShimmerCityNpc12Text
	waitbutton
	closetext
	pause 5
	applyonemovement SHIIMER_CITY_NPC_11, turn_step_right
	opentext
	writetext ShimmerCityNpc11Text2
	waitbutton
	closetext
	end
	
ShimmerCityNpc12Text:
	text "You know the"
	line "BERRY STALL lady?"
	
	para "I heard she has a"
	line "thing going on"
	cont "with the man at"
	cont "the FISH STALL."
	
	para "Can you believe"
	line "that?"
	done
	
ShimmerCityNpc13:
	jumptextfaceplayer ShimmerCityNpc13Text
	
ShimmerCityNpc13Text:
	text "Have you been"
	line "down below the"
	cont "BOARDWALK?"
	
	para "It's cool and"
	line "quiet down there,"
	
	para "but it's also a bit"
	line "dangerous!"
	done
	
ShimmerCityNpc14:
	jumptextfaceplayer ShimmerCityNpc14Text
	
ShimmerCityNpc14Text:
	text "I prefer to spend"
	line "time on this side"
	cont "of town."
	
	para "Far away from the"
	line "hustle and bustle"
	cont "of the MARKET and"
	cont "the BOARDWALK."
	
	para "It smells less"
	line "fishy over here,"
	cont "too!"
	done

ShimmerCityNpc15:
	jumptextfaceplayer ShimmerCityNpc15Text
	
ShimmerCityNpc15Text:
	text "Ancient temples!<WAIT_S>"
	line "Buried treasure!"
	
	para "Being an archeol-"
	line "ogist sounds so"
	cont "exciting!"
	
	para "I'm sure it totally"
	line "IS all it's cracked"
	cont "up to be!"
	done
	
ShimmerCityNpc16:
	jumptextfaceplayer ShimmerCityNpc16Text
	
ShimmerCityNpc16Text:
	text "Those hot dogs"
	line "they sell on the"
	cont "BOARDWALK taste"
	cont "real strange."
	
	para "I won't lie,"
	line "though…"
	
	para "They're kinda"
	line "growing on me!"
	done
	
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
	line "some BERRIES,"
	
	para "go to the front of"
	line "the stall."
	done
	
ShimmerCityNpc3Text:
	text "I just love the"
	line "salty sea air!"
	
	para "Smell that?<WAIT_M>"
	line "Smells… <WAIT_L> fishy?"
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
	
	para "I wonder what he"
	line "does with all the"
	cont "ones he doesn't"
	cont "sell to TRAINERS."
	
	para "I'm sure he takes"
	line "good care of them…"
	
	para "…<WAIT_L>right?"
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
	cont "the BOARDWALK."
	
	para "Shouldn't she have"
	line "adult supervision?"
	done
	