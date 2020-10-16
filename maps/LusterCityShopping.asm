LusterCityShopping_MapScriptHeader:
	db 1 ; scene scripts
	scene_script LusterCityShoppingTrigger0

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, LusterCityFlypointCallback
	callback MAPCALLBACK_TILES, ShoppingCallback

	db 6 ; warp events
	warp_def 11,  0, 1, ROUTE_1
	warp_def 11,  1, 2, ROUTE_1
	warp_def 33, 12, 1, LUSTER_MALL
	warp_def 33, 13, 2, LUSTER_MALL
	warp_def 33, 16, 3, LUSTER_MALL
	warp_def 33, 17, 4, LUSTER_MALL

	db 10 ; coord events
	xy_trigger 0, 46,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 47,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 48,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 49,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 50,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 51,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 46, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 47, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 48, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 49, 29, 0, LusterShoppingSignThing, 0, 0

	db 0 ; bg events

	db 13 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 44, -3, SPRITEMOVEDATA_TILE_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN_2, 44,  7, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN_2, 44,  8, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN, 31, 15, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN, 31, 16, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_LASS, 36, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster2NPC1, -1
	person_event SPRITE_BATTLE_GIRL, 36, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster2NPC2, -1
	person_event SPRITE_CHILD, 36, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster2NPC3, -1
	person_event SPRITE_LASS, 46, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2NPC4, -1
	person_event SPRITE_BATTLE_GIRL, 33, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster2NPC5, -1
	person_event SPRITE_COOL_DUDE, 33, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Luster2NPC6, -1
	person_event SPRITE_FISHER, 40, 15, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster2NPC7, -1
	person_event SPRITE_SUPER_NERD, 29, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2NPC8, -1

	const_def 1 ; object constants
	const LUSTER2STREETLIGHT
	const LUSTER2MALLSIGN1_1
	const LUSTER2MALLSIGN1_2
	const LUSTER2MALLSIGN2_1
	const LUSTER2MALLSIGN2_2
	const LUSTER2NPC1
	const LUSTER2NPC2
	const LUSTER2NPC3
	const LUSTER2NPC4
	const LUSTER2NPC5
	const LUSTER2NPC6
	const LUSTER2NPC7
	const LUSTER2NPC8

LusterCityShoppingTrigger0:
	checktime 1<<NITE
	iffalse .end
	checkflag ENGINE_STREETLIGHTS
	iftrue .end
	changeblock -4, 20, $84
	setflag ENGINE_STREETLIGHTS
	callasm RefreshScreen_BridgeUpdate
.end
	end
	
LusterShoppingSignThing:
	dotrigger $1
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	setevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	end
	
LusterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_LUSTER
	return
	
ShoppingCallback:
	checktime 1<<NITE
	iffalse .notnite
	changeblock -4, 20, $84
.notnite
	return
	
Luster2NPC1:
	faceplayer
	opentext
	writetext Luster2NPC1Text
	waitbutton
	closetext
	spriteface LUSTER2NPC1, LEFT
	end

Luster2NPC2:
	faceplayer
	opentext
	writetext Luster2NPC2Text
	waitbutton
	closetext
	spriteface LUSTER2NPC2, RIGHT
	end

Luster2NPC3:
	faceplayer
	opentext
	writetext Luster2NPC3Text
	waitbutton
	closetext
	spriteface LUSTER2NPC3, LEFT
	end
	
Luster2NPC4:
	faceplayer
	opentext
	writetext Luster2NPC4Text
	waitbutton
	closetext
	spriteface LUSTER2NPC4, UP
	end
	
Luster2NPC5:
	faceplayer
	opentext
	writetext Luster2NPC5Text
	waitbutton
	closetext
	spriteface LUSTER2NPC5, DOWN
	end
	
Luster2NPC6:
	faceplayer
	opentext
	writetext Luster2NPC6Text
	waitbutton
	closetext
	spriteface LUSTER2NPC6, DOWN
	end
	
Luster2NPC7:
	faceplayer
	opentext
	writetext Luster2NPC7Text
	waitbutton
	closetext
	spriteface LUSTER2NPC7, LEFT
	end
	
Luster2NPC8:
	faceplayer
	opentext
	writetext Luster2NPC8Text
	waitbutton
	closetext
	spriteface LUSTER2NPC8, UP
	end
	
Luster2NPC1Text:
	text "I love coming to"
	line "the SHOPPING MALL!"
	
	para "My MOM always"
	line "makes me bring my"
	cont "little brother"
	cont "along, though…"
	done
	
Luster2NPC2Text:
	text "Why'd she have to"
	line "bring her kid"
	cont "brother along?"
	
	para "He's so annoying!"
	done
	
Luster2NPC3Text:
	text "My big sister is"
	line "taking me to the"
	cont "SHOPPING MALL!"
	
	para "YAY!"
	done
	
Luster2NPC4Text:
	text "This is the only"
	line "place in this city"
	cont "that I could des-"
	cont "cribe as pretty."
	
	para "Well, there is the"
	line "park, I guess."
	
	para "But, that place is"
	line "always so crowded."
	done
	
Luster2NPC5Text:
	text "Ehehehe!"
	
	para "I can't wait to"
	line "buy my boyfriend"
	cont "all sorts of cute"
	cont "outfits!"
	done
	
Luster2NPC6Text:
	text "Help me!"
	
	para "She dragged me"
	line "along with her…"
	done
	
Luster2NPC7Text:
	text "I locked my keys"
	line "in my car!"
	
	para "Today is not my"
	line "day…"
	done
	
Luster2NPC8Text:
	text "Only employees are"
	line "allowed behind the"
	cont "SHOPPING MALL."
	
	para "I'm thinking of"
	line "getting a job just"
	cont "to see what goes"
	cont "on back there…"
	done
