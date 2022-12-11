LusterMallSkateShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  5,  3, 11, LUSTER_MALL
	warp_def  5,  4, 12, LUSTER_MALL
	warp_def  0,  5, 1, LUSTER_MALL_SKATE_TEST

	db 1 ; coord events
	coord_event 5, 1, -1, LusterMallSkateShopStop

	db 8 ; bg events
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  4,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  5,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  4,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  5,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  0,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  5,  1, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  5,  0, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText

	db 3 ; object events
	person_event SPRITE_BIRD_KEEPER,  1,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallSkateShop_Clerk, -1
	person_event SPRITE_YOUNGSTER,  2,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallSkateShop_NPC1, -1
	person_event SPRITE_SKATER,  4,  1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMallSkateShop_NPC2, -1

	
	const_def 1 ; object constants
	const LUSTER_MALL_SKATE_SHOP_CLERK
	
LusterMallSkateShopStop:
	playsound SFX_PAY_DAY
	spriteface LUSTER_MALL_SKATE_SHOP_CLERK, RIGHT
	showemote EMOTE_SHOCK, LUSTER_MALL_SKATE_SHOP_CLERK, 15
	opentext
	writetext LusterMallSkateShop_ClerkText7
	waitbutton
	closetext
	spriteface LUSTER_MALL_SKATE_SHOP_CLERK, DOWN
	applyonemovement PLAYER, step_down
	end
	
LusterMallSkateShop_Clerk:
	opentext
	checkitem SKATEBOARD
	iffalse .no_board
	checkevent EVENT_KNOW_OLLIE
	iffalse .no_ollie
	checkevent EVENT_KNOW_GRIND
	iffalse .no_grind
	writetext LusterMallSkateShop_ClerkText4
	waitbutton
	closetext
	end
.no_board
	writetext LusterMallSkateShop_ClerkText1
	waitbutton
	closetext
	end
.no_ollie
	writetext LusterMallSkateShop_ClerkText2
	yesorno
	iffalse .no_ollie_no
	writetext LusterMallSkateShop_ClerkTextYes
	waitbutton
	closetext
	pause 6
	domaptrigger LUSTER_MALL_SKATE_TEST, $0
	warpfacing UP, LUSTER_MALL_SKATE_TEST, $5, $9
	end
.no_grind
	writetext LusterMallSkateShop_ClerkText3
	yesorno
	iffalse .no_ollie_no
	writetext LusterMallSkateShop_ClerkTextYes
	waitbutton
	closetext
	pause 6
	domaptrigger LUSTER_MALL_SKATE_TEST, $1
	warpfacing UP, LUSTER_MALL_SKATE_TEST, $5, $9
	end
.no_ollie_no
	writetext LusterMallSkateShop_ClerkTextNo
	waitbutton
	closetext
	end
	
LusterMallSkateShop_NPC1:
	jumptextfaceplayer LusterMallSkateShop_NPC1Text
	
LusterMallSkateShop_NPC2:
	jumptextfaceplayer LusterMallSkateShop_NPC2Text
	
LusterMallSkateShop_NPC1Text:
	text "The guy behind the"
	line "counter is a real"
	cont "jerk!"
	
	para "He won't sell me a"
	line "SKATEBOARD!"
	done
	
LusterMallSkateShop_NPC2Text:
	text "Look at all these"
	line "sick decks."
	
	para "I don't know which"
	line "one to get."
	done
	
LusterMallSkateShop_ClerkText1:
	text "What do you want?"
	
	para "I don't got time"
	line "to babysit some"
	cont "kid!"
	
	para "A SKATEBOARD?"
	
	para "Hahaha!"
	
	para "You're no skater!"
	
	para "Tell ya what,"
	
	para "I'll give you the"
	line "“annoying kid”"
	cont "deal."
	
	para "You get out of"
	line "my shop,"
	
	para "and I won't pummel"
	line "you into the"
	cont "ground."
	
	para "Sound good to you?"
	done
	
LusterMallSkateShop_ClerkText2:
	text "You must be that"
	line "kid who rolls with"
	cont "“THE NIDOKINGS”!"
	
	para "Hey, nice board!"
	
	para "You wanna see how"
	line "to do some tricks"
	cont "on that thing?"
	done
	
LusterMallSkateShop_ClerkText3:
	text "You wanna move"
	line "on to the GRIND?"
	done
	
LusterMallSkateShop_ClerkText4:
	text "You know everything"
	line "I can teach you!"
	
	para "Say hi to"
	line "“THE NIDOKINGS”"
	cont "for me."
	done
	
LusterMallSkateShop_ClerkTextYes:
	text "Nice."
	
	para "Let's head to the"
	line "WAREHOUSE and I'll"
	cont "show you."
	done
	
LusterMallSkateShop_ClerkTextNo:
	text "Whatever."

	para "Your loss."
	done
	
LusterMallSkateShop_ClerkText7:
	text "Hey!"
	
	para "I can't let you"
	line "back there by"
	cont "yourself."
	done
	
LusterMallSkateShopShelfText:
	text "It's filled with"
	line "tools for fixing"
	cont "skateboards."
	done
	
LusterMallSkateShopSkateboardText:
	text "A variety of cool"
	line "skateboard decks."
	done
	