LusterMallSkateShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  5,  3, 11, LUSTER_MALL
	warp_def  5,  4, 12, LUSTER_MALL
	warp_def  0,  5, 1, LUSTER_MALL_SKATE_TEST

	db 1 ; coord events
	xy_trigger 0,  1,  5, 0, LusterMallSkateShopStop, 0, 0

	db 9 ; bg events
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  4,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  5,  7, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  4,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  5,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopShelfText
	signpost  0,  6, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  0,  4, SIGNPOST_JUMPTEXT, LusterMallSkateShopSignText
	signpost  5,  1, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText
	signpost  5,  0, SIGNPOST_JUMPTEXT, LusterMallSkateShopSkateboardText

	db 1 ; object events
	person_event SPRITE_BIRD_KEEPER,  1,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallSkateShop_Clerk, -1

	
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
	yesorno
	iffalse .no_board_no
	writetext LusterMallSkateShop_ClerkText5
	waitbutton
	closetext
	end
.no_board_no
	writetext LusterMallSkateShop_ClerkText6
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
	cont "discount."
	
	para "I'll give it to"
	line "you for just"
	cont "¥1,000,000."
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
	
LusterMallSkateShop_ClerkText5:
	text "You can't afford"
	line "that!"
	
	para "Maybe you'll find"
	line "one somewhere else."
	
	para "Hehe…"
	
	para "As if…"
	
	para "Now get outta"
	line "here, kid!"
	
	para "You're holding up"
	line "the line!"
	done
	
LusterMallSkateShop_ClerkText6:
	text "That's what I"
	line "thought."
	
	para "Maybe you'll find"
	line "one somewhere else."
	
	para "Hehe…"
	
	para "As if…"
	
	para "Now get outta"
	line "here, kid!"
	
	para "You're holding up"
	line "the line!"
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

LusterMallSkateShopSignText:
	text "SIGN TEXT"
	done
	