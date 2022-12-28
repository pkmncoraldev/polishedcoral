LusterMallCoffeeShop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  7,  4, 9, LUSTER_MALL
	warp_def  7,  5, 10, LUSTER_MALL

	db 0 ; coord events

	db 4 ; bg events
	bg_event  3,  1, SIGNPOST_READ, LusterMallCoffeeShop_Koffing
	bg_event  4,  1, SIGNPOST_READ, LusterMallCoffeeShop_Koffing
	bg_event  5,  1, SIGNPOST_READ, LusterMallCoffeeShop_Koffing
	bg_event  7,  1, SIGNPOST_READ, LusterMallCoffeeShop_Picture

	db 9 ; object events
	object_event  4,  1, SPRITE_N64, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event  3,  1, SPRITE_KOFFING_BEAN, SPRITEMOVEDATA_TOP_HALF, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event  5,  1, SPRITE_KOFFING_BEAN, SPRITEMOVEDATA_BOTTOM_HALF, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	object_event 1, 3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_COMMAND, pokemart, MARTTYPE_COFFEE, MART_LUSTER_MALL_COFFEE, -1
	person_event SPRITE_CLERK,  4,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallCoffeeShop_Cook, -1
	person_event SPRITE_GENTLEMAN,  4,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterMallCoffeeShop_NPC1, -1
	person_event SPRITE_ARTIST,  5,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMallCoffeeShop_NPC2, -1
	person_event SPRITE_POKEFAN_M,  6,  2, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallCoffeeShop_NPC3, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  5,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterMallCoffeeShop_Paper, -1

	const_def 1 ; object constants
	const LUSTER_MALL_COFFEE_SHOP_SIGN_1
	const LUSTER_MALL_COFFEE_SHOP_SIGN_2
	const LUSTER_MALL_COFFEE_SHOP_SIGN_3
	const LUSTER_MALL_COFFEE_SHOP_CLERK
	const LUSTER_MALL_COFFEE_SHOP_COOK
	const LUSTER_MALL_COFFEE_SHOP_NPC1
	const LUSTER_MALL_COFFEE_SHOP_NPC2
	const LUSTER_MALL_COFFEE_SHOP_NPC3
	const LUSTER_MALL_COFFEE_SHOP_PAPER
	
	
LusterMallCoffeeShop_Cook:
	jumptextfaceplayer LusterMallCoffeeShop_CookText

	faceplayer
	opentext
	writetext LusterMallCoffeeShop_CookText5
	yesorno
	iffalse .no1
	writetext LusterMallCoffeeShop_CookText1
	waitbutton
.return1
	special Special_ChooseItem
	iffalse .no1
	
	callasm CheckItemCanCook
	iffalse .pickagain1
	
	copybytetovar wCurItem
	takeitem ITEM_FROM_MEM
	callasm LoadwCurItemIntowCookingItem1
	
	writetext LusterMallCoffeeShop_CookText2
	yesorno
	iffalse .no1
	writetext LusterMallCoffeeShop_CookText9
	yesorno
	iffalse .ask_one_item
	writetext LusterMallCoffeeShop_CookText3
	waitbutton
.return2
	special Special_ChooseItem
	iffalse .ask_one_item
	
	callasm CheckItemCanCook
	iffalse .pickagain2
	
	callasm LoadwCurItemIntowCookingItem2
	iffalse .not_same_item
	writetext LusterMallCoffeeShop_CookText7
	yesorno
	iffalse .pickagain3
.same_item
	callasm LoadwCookingItem1IntowCookingItem2
	jump .cont
.not_same_item
	writetext LusterMallCoffeeShop_CookText4
	yesorno
	iffalse .no2
	copybytetovar wCurItem
	takeitem ITEM_FROM_MEM
.cont
	writetext LusterMallCoffeeShop_CookText6
	waitbutton
	closetext
	
	applymovement LUSTER_MALL_COFFEE_SHOP_COOK, Movement_CoffeeShop1
	pause 40
	opentext
	writetext LusterMallCoffeeShop_Cooking
	waitbutton
	closetext
	pause 20
	applymovement LUSTER_MALL_COFFEE_SHOP_COOK, Movement_CoffeeShop2
	faceplayer
	pause 15
	
	opentext
	callasm CookItemsTogether
	copybytetovar wCurItem
	verbosegiveitem ITEM_FROM_MEM, 1
	callasm ClearCookingItems
	jumpopenedtext LusterMallCoffeeShop_CookTextEnd
.no2
	callasm ReturnCookingItem1ToPlayer
	copybytetovar wCurItem
	giveitem ITEM_FROM_MEM, 1
.no1
	callasm ClearCookingItems
	jumpopenedtext LusterMallCoffeeShop_CookTextEnd
.pickagain1
	writetext LusterMallCoffeeShop_CookTextPickAgain
	waitbutton
	jump .return1
.pickagain2
	writetext LusterMallCoffeeShop_CookTextPickAgain
	waitbutton
	jump .return2
.ask_one_item
	callasm LoadwCookingItem1Name
	writetext LusterMallCoffeeShop_CookText8
	yesorno
	iftrue .same_item
	writetext LusterMallCoffeeShop_CookText10
	yesorno
	iftrue .no2
.pickagain3
	writetext LusterMallCoffeeShop_CookTextPickAgain2
	waitbutton
	jump .return2
	
CheckItemCanCook:
	ld a, [wCurItem]
	ld hl, CookableItems
	ld de, 1
	call IsInArray
	jr nc, .cant_cook
	ld a, TRUE
	ld [wScriptVar], a
	ret
.cant_cook
	ld a, FALSE
	ld [wScriptVar], a
	ret
	
LoadwCookingItem1Name:
	ld a, [wCookingItem1]
	ld [wNamedObjectIndexBuffer], a
	jp GetItemName
	
LoadwCurItemIntowCookingItem1:
	ld a, [wCurItem]
	ld [wCookingItem1], a
	
	ld [wNamedObjectIndexBuffer], a
	jp GetItemName
	
LoadwCurItemIntowCookingItem2:
	ld a, [wCookingItem1]
	ld b, a
	xor a
	ld [wScriptVar], a
	ld a, [wCurItem]
	ld [wCookingItem2], a
	cp b
	jr nz, .not_same_item
	
	ld a, TRUE
	ld [wScriptVar], a
	
.not_same_item
	call GetCurItemName
	call CopyName1
	
	ld a, [wCookingItem1]
	ld [wNamedObjectIndexBuffer], a
	jp GetItemName
	
LoadwCookingItem1IntowCookingItem2:
	ld a, [wCookingItem1]
	ld [wCookingItem2], a
	ret
	
CookItemsTogether:
	ld a, [wCookingItem1]
	ld hl, CookableItems
    ld de, 3
    call IsInArray
    jr nc, .no_good
    inc hl
    ld a, [hli]
    ld h, [hl]
    ld l, a
	ld a, [wCookingItem2]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .no_good
	cp b
	jr z, .found
	inc hl
	inc hl
	jr .loop
.found
	ld a, [hli]
	ld [wCurItem], a
	ld hl, LusterMallCoffeeShop_CookTextGoodItem
	jp PrintText
.no_good
	ld a, POKE_BALL
	ld [wCurItem], a
	ld hl, LusterMallCoffeeShop_CookTextBadItem
	jp PrintText
	
ReturnCookingItem1ToPlayer:
	ld a, [wCookingItem1]
	ld [wCurItem], a
	ret
	
ReturnCookingItem2ToPlayer:
	ld a, [wCookingItem1]
	ld [wCurItem], a
	ret
	
ClearCookingItems:
	xor a
	ld [wCookingItem1], a
	ld [wCookingItem2], a
	ret	
	
INCLUDE "data/items/recipes.asm"
	
LusterMallCoffeeShop_CookTextGoodItem:
	text "Wow!"
	
	para "This came out"
	line "great!"
	
	para "Here you go!"
	prompt
	
LusterMallCoffeeShop_CookTextBadItem:
	text "Hmm…"
	
	para "These two"
	line "ingredients don't"
	cont "seem to work too"
	cont "well together…"
	
	para "Well, here you go"
	line "anyway…"
	prompt
	
LusterMallCoffeeShop_CookText:
	text "IN PROGRESS"
	done
	
LusterMallCoffeeShop_CookText1:
	text "What would you"
	line "like to brew?"
	done
	
LusterMallCoffeeShop_CookText2:
	text "Brew a"
	line "@"
	text_from_ram wStringBuffer1
	text "?"
	done
	
LusterMallCoffeeShop_CookText3:
	text "What else would"
	line "you like to brew?"
	done
	
LusterMallCoffeeShop_CookText4:
	text "Brew a"
	line "@"
	text_from_ram wStringBuffer1
	text ""
	cont "and @"
	text_from_ram wStringBuffer2
	text "?"
	done
	
LusterMallCoffeeShop_CookText5:
	text "Welcome!"
	
	para "I can brew tea"
	line "with ingredients"
	cont "you provide!"
	
	para "Want to give it a"
	line "try?"
	done
	
LusterMallCoffeeShop_CookText6:
	text "Coming right up!"
	done
	
LusterMallCoffeeShop_CookText7:
	text "Two"
	line "@"
	text_from_ram wStringBuffer1
	text "S?"
	
	para "I would only need"
	line "one."
	
	para "Brew with one"
	line "@"
	text_from_ram wStringBuffer1
	text "?"
	done
	
LusterMallCoffeeShop_CookText8:
	text "Brew with one"
	line "@"
	text_from_ram wStringBuffer1
	text "?"
	done
	
LusterMallCoffeeShop_CookText9:
	text "Do you want to"
	line "brew with a second"
	cont "item?"
	done
	
LusterMallCoffeeShop_CookText10:
	text "Would you like to"
	line "stop?"
	done
	
LusterMallCoffeeShop_CookTextEnd:
	text "Please come again!"
	done
	
LusterMallCoffeeShop_CookTextPickAgain:
	text "I can't brew a"
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	
	para "What else would"
	line "you like to brew?"
	done
	
LusterMallCoffeeShop_CookTextPickAgain2:
	text "Ok, then."

	para "What else would"
	line "you like to brew?"
	done
	
LusterMallCoffeeShop_NPC1:
	faceplayer
	opentext
	checkevent EVENT_GAVE_COFFE_SHOP_MAN_TEA
	iftrue .already_done
	checkitem BLOSSOM_TEA
	iftrue .have_tea
	writetext LusterMallCoffeeShop_NPC1Text1
	jump .end
.have_tea
	writetext LusterMallCoffeeShop_NPC1Text2
	yesorno
	iffalse .no
	takeitem BLOSSOM_TEA
	writetext LusterMallCoffeeShop_NPC1TextGiveTea
	playsound SFX_LEVEL_UP 
	waitsfx
	closetext
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC1, LEFT
	pause 10
	opentext
	writetext LusterMallCoffeeShop_NPC1Text3
	waitbutton
	closetext
	faceplayer
	pause 10
	opentext
	writetext LusterMallCoffeeShop_NPC1Text4
	waitbutton
	verbosegiveitem MAX_REVIVE
	setevent EVENT_GAVE_COFFE_SHOP_MAN_TEA
.already_done
	writetext LusterMallCoffeeShop_NPC1Text5
	jump .end
.no
	writetext LusterMallCoffeeShop_NPC1TextNo
.end
	waitbutton
	closetext
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC1, LEFT
	end
	
LusterMallCoffeeShop_NPC2:
	faceplayer
	opentext
	writetext LusterMallCoffeeShop_NPC2Text1
	waitbutton
	closetext
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC2, RIGHT
	end
	
LusterMallCoffeeShop_NPC3:
	faceplayer
	opentext
	writetext LusterMallCoffeeShop_NPC3Text
	waitbutton
	closetext
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC3, UP
	end
	
LusterMallCoffeeShop_Paper:
	opentext
	writetext LusterMallCoffeeShop_PaperText
	waitbutton
	closetext
	pause 5
	playsound SFX_PAY_DAY
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	if_equal LEFT, .YouAreFacingLeft
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC2, UP
	jump .cont
.YouAreFacingUp
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC2, DOWN
	jump .cont
.YouAreFacingLeft
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC2, RIGHT
.cont
	showemote EMOTE_SHOCK, LUSTER_MALL_COFFEE_SHOP_NPC2, 15
	opentext
	writetext LusterMallCoffeeShop_NPC2Text2
	waitbutton
	closetext
	spriteface LUSTER_MALL_COFFEE_SHOP_NPC2, RIGHT
	applyonemovement LUSTER_MALL_COFFEE_SHOP_NPC2, turn_step_right
	applymovement LUSTER_MALL_COFFEE_SHOP_PAPER, Movement_LusterMallCoffeeShopPaper
	disappear LUSTER_MALL_COFFEE_SHOP_PAPER
	end
	
LusterMallCoffeeShop_Koffing:
	jumptext LusterMallCoffeeShop_KoffingText
	
LusterMallCoffeeShop_Picture:
	jumptext LusterMallCoffeeShop_PictureText
	
Movement_LusterMallCoffeeShopPaper:
	fix_facing
	fast_slide_step_left
	remove_fixed_facing
	step_end
	
LusterMallCoffeeShop_NPC1Text1:
	text "The BARISTAS here"
	line "don't know how to"
	cont "make BLOSSOM TEA…"
	
	para "It's a special tea"
	line "from GLINT CITY."
	
	para "They brew it with"
	line "flower petals from"
	cont "the GLINT GROVE."
	
	para "It's my favorite!"
	
	para "I sure wish some"
	line "kind soul would"
	cont "bring me some"
	cont "BLOSSOM TEA…"
	
	para "SIGH…"
	done
	
LusterMallCoffeeShop_NPC1Text2:
	text "The BARISTAS here"
	line "don't know how to"
	cont "make BLOSSOM TEA…"
	
	para "It's a special tea"
	line "from GLINT CITY."
	
	para "They brew it with"
	line "flower petals from"
	cont "the GLINT GROVE."
	
	para "It's my favorite!"
	
	para "…"
	
	para "Oh!"
	
	para "That lovely smell!"
	
	para "You have some"
	line "BLOSSOM TEA!"
	
	para "Please, will you"
	line "let me have it?"
	done
	
LusterMallCoffeeShop_NPC1Text3:
	text "Gulp… gulp…"
	
	para "…"
	
	para "Ah!"
	done
	
LusterMallCoffeeShop_NPC1Text4:
	text "That's the stuff!"
	
	para "Thank you so much!"
	
	para "I haven't had tea"
	line "that good in many"
	cont "years!"
	
	para "Take this as"
	line "thanks."
	done

LusterMallCoffeeShop_NPC1Text5:
	text "Thanks again for"
	line "the BLOSSOM TEA!"
	done
	
LusterMallCoffeeShop_NPC1TextNo:
	text "You need to learn"
	line "to respect your"
	cont "elders!"
	done
	
LusterMallCoffeeShop_NPC1TextGiveTea:
	text "<PLAYER> handed"
	line "over the"
	cont "BLOSSOM TEA."
	done
	
LusterMallCoffeeShop_NPC2Text1:
	text "I come here to"
	line "write my novel."
	
	para "I like to write in"
	line "public so every-"
	cont "one can see."
	
	para "…"
	
	para "Are you paying"
	line "attention to me?"
	done
	
LusterMallCoffeeShop_NPC2Text2:
	text "Hey!"
	
	para "It's not done!"
	
	para "No peeking!"
	done
	
LusterMallCoffeeShop_NPC3Text:
	text "I come here to"
	line "drink all my"
	cont "sorrows away…"
	
	para "Huh?"
	
	para "I know coffee won't"
	line "help me forget."
	
	para "I just like the"
	line "taste!"
	done
	
LusterMallCoffeeShop_PaperText:
	text "It's a mostly"
	line "blank sheet of"
	cont "paper."
	done
	
LusterMallCoffeeShop_KoffingText:
	text "KOFFEE the KOFFING"
	line "says:"
	
	para "Drink! Drink!"
	line "Drink!"
	done
	
LusterMallCoffeeShop_PictureText:
	text "Some tasteful,"
	line "coffee-themed art."
	
	para "How quaint."
	done
	
LusterMallCoffeeShop_Cooking:
	text "Bubble… bubble…"
	
	para "…"
	
	para "Fssssss…"
	
	para "…"
	
	para "Ding!"
	done
	
Movement_CoffeeShop1:
	turn_step_right
	step_sleep 20
	slow_step_right
	step_end
	
Movement_CoffeeShop2:
	turn_step_left
	step_sleep 20
	slow_step_left
	step_end
	