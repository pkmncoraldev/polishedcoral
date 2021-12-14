ShimmerCity_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, ShimmerCityFlyPoint

	db 26 ; warp events
	warp_event 10, 31, SHIMMER_LAB_LOBBY, 1
	warp_event 11, 31, SHIMMER_LAB_LOBBY, 2
	warp_event 11, 21, SHIMMER_UNDER_BOARDWALK, 4
	warp_event 11, 20, SHIMMER_UNDER_BOARDWALK, 2
	warp_event 11, 17, SHIMMER_UNDER_BOARDWALK, 9
	warp_event 11, 16, SHIMMER_UNDER_BOARDWALK, 7
	warp_event 12, 14, SHIMMER_UNDER_BOARDWALK, 14
	warp_event 12, 13, SHIMMER_UNDER_BOARDWALK, 13
	warp_event 12, 12, SHIMMER_UNDER_BOARDWALK, 12
	warp_event 11,  9, SHIMMER_UNDER_BOARDWALK, 21
	warp_event 10,  9, SHIMMER_UNDER_BOARDWALK, 20
	warp_event  9,  9, SHIMMER_UNDER_BOARDWALK, 18
	warp_event  8,  9, SHIMMER_UNDER_BOARDWALK, 17
	warp_event  7,  9, SHIMMER_UNDER_BOARDWALK, 16
	warp_event  6, 12, SHIMMER_UNDER_BOARDWALK, 33
	warp_event  6, 13, SHIMMER_UNDER_BOARDWALK, 34
	warp_event  6, 14, SHIMMER_UNDER_BOARDWALK, 35
	warp_event  7, 16, SHIMMER_UNDER_BOARDWALK, 28
	warp_event  7, 17, SHIMMER_UNDER_BOARDWALK, 30
	warp_event  7, 20, SHIMMER_UNDER_BOARDWALK, 23
	warp_event  7, 21, SHIMMER_UNDER_BOARDWALK, 25
	warp_event 41, 21, SHIMMER_POKECENTER, 1
	warp_event 47, 21, SHIMMER_MART, 1
	warp_event 21, 29, SHIMMER_HOUSE_1, 1
	warp_event 27, 29, SHIMMER_HOUSE_2, 1
	warp_event 45, 29, SHIMMER_HOUSE_3, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 21, 21, SIGNPOST_ITEM + BIG_NUGGET, EVENT_SHIMMER_CITY_HIDDEN_ITEM
	signpost 20, 22, SIGNPOST_LEFT, ShimmerCityFishMarket
	signpost 23, 22, SIGNPOST_LEFT, ShimmerCityBerryMarket

	db 10 ; object events
	person_event SPRITE_FISHING_GURU, 20, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc1, -1
	person_event SPRITE_POKEFAN_F, 23, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc2, -1
	person_event SPRITE_REDS_MOM, 25, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc3, -1
	person_event SPRITE_CHILD, 20, 30, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc4, -1
	person_event SPRITE_FAT_GUY, 19, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc5, -1
	person_event SPRITE_BALLOONS, 21, 23, SPRITEMOVEDATA_BALLOONS_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BALLOONS, 18, 23, SPRITEMOVEDATA_BALLOONS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX, 21, 22, SPRITEMOVEDATA_STALL, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  9,  8, SPRITEMOVEDATA_BINOCULARS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  9, 10, SPRITEMOVEDATA_BINOCULARS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	
	const_def 1 ; object constants
	const SHIIMER_CITY_NPC_1
	const SHIIMER_CITY_NPC_2
	const SHIIMER_CITY_NPC_3
	const SHIIMER_CITY_NPC_4
	const SHIIMER_CITY_NPC_5
	
	
ShimmerCityFlyPoint:
	setflag ENGINE_FLYPOINT_SHIMMER
	setevent EVENT_CAN_GO_TO_SHIMMER
	return
	
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
	iffalse .no
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
	
ShimmerCityHorseaKidAsm:
	farcall SelectTradeOrDaycareMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp HORSEA
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
	text "TEXT"
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
	text "Oh thank you!"
	line "Thank you!"
	cont "Thank you!"
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
	text "Thank you!"
	line "Thank you!"
	
	para "I love my HORSEA!"
	done
	
ShimmerCityNpc4Text9:
	text "Thanks, but I can't"
	line "take your only"
	cont "#MON."
	done
	
ShimmerCityNpc5Text:
	text "The guy at that"
	line "stall over there"
	cont "sells #MON."
	
	para "Don't worry,"
	line "though."
	
	para "He seems to take"
	line "good care of them."
	
	para "Everything's above"
	line "the board!"
	done
	