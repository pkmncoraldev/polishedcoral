LusterMallBallShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  2, 19, LUSTER_MALL
	warp_def  7,  3, 20, LUSTER_MALL

	db 0 ; coord events

	db 11 ; bg events
	signpost  7,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText1
	signpost  7,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText1
	signpost  3,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  3,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  5,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  5,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopCaseText2
	signpost  1,  5, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText1
	signpost  1,  6, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText2
	signpost  1,  7, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText2
	signpost  1,  4, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText3
	signpost  1,  3, SIGNPOST_JUMPTEXT, LusterMallBallShopPosterText3

	db 9 ; object events
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_BALL, MART_LUSTER_MALL_BALL_1, EVENT_DONE_PART_TIME_JOB
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_BALL_DISCOUNT, MART_LUSTER_MALL_BALL_2, EVENT_NO_BALL_SHOP_DISCOUNT
	object_event  0,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_BALL, MART_LUSTER_MALL_BALL_3, EVENT_DONE_PART_TIME_JOB
	object_event  0,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_BALL_DISCOUNT, MART_LUSTER_MALL_BALL_4, EVENT_NO_BALL_SHOP_DISCOUNT
	person_event SPRITE_LASS,  4,  7, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMallBallShop_NPC1, -1
	person_event SPRITE_REDS_MOM,  5,  1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallBallShop_NPC2, -1
	person_event SPRITE_POKEFAN_M,  6,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMallBallShop_NPC3, -1
	object_event  0,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWKING, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, LusterMallBallShop_Slowking, -1
	person_event SPRITE_POLLY,  5,  4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallBallShopPolly, EVENT_POLLY_NOT_IN_BALL_SHOP
	
	const_def 1 ; object constants
	const LUSTER_MALL_BALL_SHOP_CLERK
	const LUSTER_MALL_BALL_SHOP_CLERK_DISCOUNT
	const LUSTER_MALL_BALL_SHOP_CLERK2
	const LUSTER_MALL_BALL_SHOP_CLERK2_DISCOUNT
	const LUSTER_MALL_BALL_SHOP_NPC_1
	const LUSTER_MALL_BALL_SHOP_NPC_2
	const LUSTER_MALL_BALL_SHOP_NPC_3
	const LUSTER_MALL_BALL_SHOP_SLOWKING
	const LUSTER_MALL_BALL_SHOP_POLLY
	
	
LusterMallBallShopPolly:
	faceplayer
	opentext TEXTBOX_POLLY
	writetext LusterMallBallShopPollyText
	waitbutton
	closetext
	setevent EVENT_POLLY_NOT_IN_BALL_SHOP
	clearevent EVENT_POLLY_NOT_IN_SHINY_SHARDS
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement LUSTER_MALL_BALL_SHOP_POLLY, Movement_LusterMallBallShopPolly1
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_MALL_BALL_SHOP_POLLY
	end
.YouAreFacingRight
	applymovement LUSTER_MALL_BALL_SHOP_POLLY, Movement_LusterMallBallShopPolly2
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_MALL_BALL_SHOP_POLLY
	end
	
Movement_LusterMallBallShopPolly1:
	step_left
	step_down
	step_down
	step_end
	
Movement_LusterMallBallShopPolly2:
	step_down
	step_left
	step_down
	step_end
	
LusterMallBallShopPollyText:
	text "You again?"
	
	para "Can't you, <WAIT_S>like,<WAIT_S>"
	line "take a hint?"
	
	para "I'm not going to"
	line "battle you right"
	cont "now!"
	
	para "Ugh…"
	
	para "This is totally"
	line "stressing me out!"
	
	para "I wanna look at"
	line "something pretty…"
	done
	
LusterMallBallShop_NPC1:
	jumptextfaceplayer LusterMallBallShop_NPC1Text
	
LusterMallBallShop_NPC2:
	checkevent EVENT_DONE_PART_TIME_JOB
	iftrue .finishedjob
	checkevent EVENT_PART_TIME_JOB_SAVED_DELIVERY
	iftrue .saved_delivery
	checkevent EVENT_STARTED_PART_TIME_JOB
	iftrue .startedjob
	faceplayer 
	opentext
	writetext LusterMallBallShop_NPC2Text1
	yesorno
	iffalse .no
	writetext LusterMallBallShop_NPC2Text2
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext LusterMallBallShop_NPC2Text3
	waitbutton
	closetext
	setevent EVENT_STARTED_PART_TIME_JOB
	domaptrigger LUSTER_MALL, $1
	end
.no
	writetext LusterMallBallShop_NPC2TextNo
	waitbutton
	closetext
	end
.startedjob
	jumptextfaceplayer LusterMallBallShop_NPC2Text3
	
.saved_delivery
	appear LUSTER_MALL_BALL_SHOP_CLERK_DISCOUNT
	appear LUSTER_MALL_BALL_SHOP_CLERK2_DISCOUNT
	setevent EVENT_DONE_PART_TIME_JOB
	clearevent EVENT_NO_BALL_SHOP_DISCOUNT
	faceplayer
	opentext
	writetext LusterMallBallShop_NPC2Text4
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	disappear LUSTER_MALL_BALL_SHOP_CLERK
	disappear LUSTER_MALL_BALL_SHOP_CLERK2
	end
	
.finishedjob
	jumptextfaceplayer LusterMallBallShop_NPC2Text5
	
LusterMallBallShop_NPC3:
	faceplayer
	opentext
	writetext LusterMallBallShop_NPC3Text
	waitbutton
	closetext
	spriteface LUSTER_MALL_BALL_SHOP_NPC_3, DOWN
	end
	
LusterMallBallShop_Slowking:
	opentext TEXTBOX_POKEMON, SLOWKING
	writetext LusterMallBallShop_SlowkingText1
	cry SLOWKING
	waitsfx
	buttonsound
	writetext LusterMallBallShop_SlowkingText2
	waitbutton
	closetext
	end
	
LusterMallBallShop_SlowkingText1:
	text "<WAIT_S>S<WAIT_S>l<WAIT_S>o<WAIT_S>o<WAIT_S>o<WAIT_S>o<WAIT_S>w<WAIT_S>…"
	done
	
LusterMallBallShop_SlowkingText2:
	text "It gives a slow,"
	line "welcoming smile."
	done
	
LusterMallBallShop_NPC1Text:
	text "I didn't even know"
	line "this many kinds of"
	cont "#BALLS existed!"
	done
	
LusterMallBallShop_NPC2Text1:
	text "Are you finding"
	line "everything ok?"
	
	para "I'm actually the"
	line "owner of this"
	cont "little shop."
	
	para "You wouldn't be"
	line "looking for a"
	cont "part-time job,"
	cont "would you?"
	done
	
LusterMallBallShop_NPC2Text2:
	text "Great!"
	done
	
LusterMallBallShop_NPC2Text3:
	text "We make our"
	line "#BALLS out of"
	cont "APRICORNS imported"
	cont "from the JOHTO"
	cont "region."
	
	para "We are waiting for"
	line "a shipment and it's"
	cont "running late."
	
	para "They're usually"
	line "delivered by truck"
	cont "at the back of the"
	cont "building."
	
	para "Your job is to go"
	line "out there see what"
	cont "the holdup is."
	
	para "Go through the"
	line "employees only"
	cont "area to get back"
	cont "there."
	
	para "Chop chop!"
	done
	
LusterMallBallShop_NPC2Text4:
	text "The delivery guy"
	line "told me what"
	cont "happened!"
	
	para "You did a great"
	line "job!"
	
	para "I knew I made a"
	line "good choice when I"
	cont "hired you."
	
	para "As thanks for your"
	line "all your help,"
	
	para "why don't I give"
	line "you the employee"
	cont "discount?"
	
	para "You've earned it!"
	done
	
LusterMallBallShop_NPC2Text5:
	text "My grandpa was the"
	line "greatest #BALL"
	cont "smith in the JOHTO"
	cont "region."
	
	para "He taught me to"
	line "make #BALLS out"
	cont "of APRICORNS when"
	cont "I was just a girl."
	
	para "We still make our"
	line "#BALLS the old-"
	cont "fashioned way."
	
	para "I think it sets us"
	line "apart from the"
	cont "competition."
	done
	
LusterMallBallShop_NPC2TextNo:
	text "Ah well…"
	done
	
LusterMallBallShop_NPC3Text:
	text "Even the regular"
	line "#BALLS are more"
	cont "expensive here."
	
	para "They're made by"
	line "hand, so they're"
	cont "quality!"
	
	para "Is it really worth"
	line "it, though?"
	done
	
LusterMallBallShopCaseText1:
	text "A case of regular"
	line "# BALLS."
	done
	
LusterMallBallShopCaseText2:
	text "A variety of cool"
	line "# BALLS!"
	done
	
LusterMallBallShopPosterText1:
	text "A # BALL"
	line "poster."
	done
	
LusterMallBallShopPosterText2:
	text "A GREAT BALL"
	line "poster."
	done
	
LusterMallBallShopPosterText3:
	text "An ULTRA BALL"
	line "poster."
	done