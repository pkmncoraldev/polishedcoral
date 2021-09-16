ShimmerCity_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 21 ; warp events
	warp_event  6, 25, SHIMMER_LAB_LOBBY, 1
	warp_event  7, 25, SHIMMER_LAB_LOBBY, 2
	warp_event  7, 15, SHIMMER_UNDER_BOARDWALK, 4
	warp_event  7, 14, SHIMMER_UNDER_BOARDWALK, 2
	warp_event  7, 11, SHIMMER_UNDER_BOARDWALK, 9
	warp_event  7, 10, SHIMMER_UNDER_BOARDWALK, 7
	warp_event  8,  8, SHIMMER_UNDER_BOARDWALK, 14
	warp_event  8,  7, SHIMMER_UNDER_BOARDWALK, 13
	warp_event  8,  6, SHIMMER_UNDER_BOARDWALK, 12
	warp_event  7,  3, SHIMMER_UNDER_BOARDWALK, 21
	warp_event  6,  3, SHIMMER_UNDER_BOARDWALK, 20
	warp_event  5,  3, SHIMMER_UNDER_BOARDWALK, 18
	warp_event  4,  3, SHIMMER_UNDER_BOARDWALK, 17
	warp_event  3,  3, SHIMMER_UNDER_BOARDWALK, 16
	warp_event  2,  6, SHIMMER_UNDER_BOARDWALK, 33
	warp_event  2,  7, SHIMMER_UNDER_BOARDWALK, 34
	warp_event  2,  8, SHIMMER_UNDER_BOARDWALK, 35
	warp_event  3, 10, SHIMMER_UNDER_BOARDWALK, 28
	warp_event  3, 11, SHIMMER_UNDER_BOARDWALK, 30
	warp_event  3, 14, SHIMMER_UNDER_BOARDWALK, 23
	warp_event  3, 15, SHIMMER_UNDER_BOARDWALK, 25

	db 0 ; coord events

	db 3 ; bg events
	bg_event 17, 15, SIGNPOST_ITEM + POTION, EVENT_SHIMMER_CITY_HIDDEN_ITEM
	signpost 13, 18, SIGNPOST_LEFT, ShimmerCityFishMarket
	signpost 16, 18, SIGNPOST_LEFT, ShimmerCityBerryMarket

	db 5 ; object events
	person_event SPRITE_FISHING_GURU, 13, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc1, -1
	person_event SPRITE_POKEFAN_F, 16, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerCityNpc2, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX, 15, 18, SPRITEMOVEDATA_STALL, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  3,  4, SPRITEMOVEDATA_BINOCULARS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  3,  6, SPRITEMOVEDATA_BINOCULARS_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	
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
	end
	
ShimmerCityNpc2:
	end
	
ShimmerCityText:
	text "TEXT"
	done
	