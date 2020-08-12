LusterMall_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterMallTrigger0
	scene_script LusterMallTrigger1

	db 0 ; callbacks

	db 22 ; warp events
	warp_def 25, 14, 3, LUSTER_CITY_SHOPPING
	warp_def 25, 15, 4, LUSTER_CITY_SHOPPING
	warp_def 25, 18, 5, LUSTER_CITY_SHOPPING
	warp_def 25, 19, 6, LUSTER_CITY_SHOPPING
	warp_def 15, 16, 1, LUSTER_MALL_POKECENTER
	warp_def 15, 17, 2, LUSTER_MALL_POKECENTER
	warp_def  7,  2, 1, LUSTER_MALL_ELECTRONICS_SHOP
	warp_def  7,  3, 2, LUSTER_MALL_ELECTRONICS_SHOP
	warp_def  7,  8, 1, LUSTER_MALL_COFFEE_SHOP
	warp_def  7,  9, 2, LUSTER_MALL_COFFEE_SHOP
	warp_def  7, 24, 1, LUSTER_MALL_SKATE_SHOP
	warp_def  7, 25, 2, LUSTER_MALL_SKATE_SHOP
	warp_def  7, 30, 1, LUSTER_MALL_ANTIQUE_SHOP
	warp_def  7, 31, 2, LUSTER_MALL_ANTIQUE_SHOP
	warp_def 15,  2, 1, LUSTER_MALL_HERB_SHOP
	warp_def 15,  3, 2, LUSTER_MALL_HERB_SHOP
	warp_def 15,  8, 1, LUSTER_MALL_STONE_SHOP
	warp_def 15,  9, 2, LUSTER_MALL_STONE_SHOP
	warp_def 15, 24, 1, LUSTER_MALL_BALL_SHOP
	warp_def 15, 25, 2, LUSTER_MALL_BALL_SHOP
	warp_def 15, 30, 1, LUSTER_MALL_CLOTHES_SHOP
	warp_def 15, 31, 2, LUSTER_MALL_CLOTHES_SHOP

	db 8 ; coord events
	coord_event 11, 17, 0, LusterMallEscalator1
	coord_event 12, 17, 0, LusterMallEscalator2
	coord_event 11, 11, 0, LusterMallEscalatorClear
	coord_event 12, 11, 0, LusterMallEscalatorClear
	coord_event 21, 11, 0, LusterMallEscalator3
	coord_event 22, 11, 0, LusterMallEscalator4
	coord_event 22, 17, 0, LusterMallEscalatorClear
	coord_event 21, 17, 0, LusterMallEscalatorClear

	db 11 ; bg events
	signpost 20, 16, SIGNPOST_JUMPTEXT, LusterMallEscalatorSignText
	signpost  8, 16, SIGNPOST_JUMPTEXT, LusterMallEscalatorSignText
	signpost 16, 15, SIGNPOST_READ, LusterMallPokeCenterSign
	signpost  8,  1, SIGNPOST_JUMPTEXT, LusterMallElectronicsSignText
	signpost  8, 10, SIGNPOST_JUMPTEXT, LusterMallCoffeeSignText
	signpost  8, 23, SIGNPOST_JUMPTEXT, LusterMallSkateSignText
	signpost  8, 32, SIGNPOST_JUMPTEXT, LusterMallAntiqueSignText
	signpost 16,  1, SIGNPOST_JUMPTEXT, LusterMallHerbSignText
	signpost 16,  7, SIGNPOST_JUMPTEXT, LusterMallStoneSignText
	signpost 16, 26, SIGNPOST_JUMPTEXT, LusterMallBallSignText
	signpost 16, 32, SIGNPOST_JUMPTEXT, LusterMallClothesSignText
	

	db 3 ; object events
	person_event SPRITE_OFFICER, 0, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_KOFFING_BEAN,  5,  8, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_KOFFING_BEAN,  5,  9, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	const_def 1 ; object constants
	const LUSTERMALLCOP
	
LusterMallTrigger0:
	end
	
LusterMallTrigger1:
	end
	
LusterMallEscalator1:
	checkevent EVENT_ON_ESCALATOR
	iffalse .end
	applyonemovement PLAYER, step_down
	opentext
	checkevent EVENT_BEAT_MALL_COP
	iftrue LusterMallEscalatorBeatCop
	writetext LusterMallCopText1
	waitbutton
	closetext
	pause 5
	disappear LUSTERMALLCOP
	moveperson LUSTERMALLCOP, $0d, $17
	appear LUSTERMALLCOP
	applymovement LUSTERMALLCOP, Movement_LusterMallCop1
	pause 5
	opentext
	checkevent EVENT_KICKED_OUT_OF_MALL_3
	iftrue LusterMallEscalatorStartBattle
	checkevent EVENT_KICKED_OUT_OF_MALL_2
	iftrue .alreadykickedout2
	checkevent EVENT_KICKED_OUT_OF_MALL_1
	iftrue .alreadykickedout1
	writetext LusterMallCopText2
	setevent EVENT_KICKED_OUT_OF_MALL_1
	jump .cont
.alreadykickedout1
	writetext LusterMallCopText3
	setevent EVENT_KICKED_OUT_OF_MALL_2
	jump .cont
.alreadykickedout2
	writetext LusterMallCopText4
	setevent EVENT_KICKED_OUT_OF_MALL_3
	jump .cont
.cont
	waitbutton
	closetext
	clearevent EVENT_ON_ESCALATOR
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing DOWN, LUSTER_CITY_SHOPPING, $0d, $22
.end
	end
	
LusterMallEscalator2:
	checkevent EVENT_ON_ESCALATOR
	iffalse .end
	applyonemovement PLAYER, step_down
	opentext
	checkevent EVENT_BEAT_MALL_COP
	iftrue LusterMallEscalatorBeatCop
	writetext LusterMallCopText1
	waitbutton
	closetext
	pause 5
	disappear LUSTERMALLCOP
	moveperson LUSTERMALLCOP, $0d, $17
	appear LUSTERMALLCOP
	applymovement LUSTERMALLCOP, Movement_LusterMallCop2
	pause 5
	opentext
	checkevent EVENT_KICKED_OUT_OF_MALL_3
	iftrue LusterMallEscalatorStartBattle
	checkevent EVENT_KICKED_OUT_OF_MALL_2
	iftrue .alreadykickedout2
	checkevent EVENT_KICKED_OUT_OF_MALL_1
	iftrue .alreadykickedout1
	writetext LusterMallCopText2
	setevent EVENT_KICKED_OUT_OF_MALL_1
	jump .cont
.alreadykickedout1
	writetext LusterMallCopText3
	setevent EVENT_KICKED_OUT_OF_MALL_2
	jump .cont
.alreadykickedout2
	writetext LusterMallCopText4
	setevent EVENT_KICKED_OUT_OF_MALL_3
	jump .cont
.cont
	waitbutton
	closetext
	clearevent EVENT_ON_ESCALATOR
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing DOWN, LUSTER_CITY_SHOPPING, $0d, $22
.end
	end
	
LusterMallEscalator3:
	checkevent EVENT_ON_ESCALATOR
	iffalse .end
	applyonemovement PLAYER, step_up
	opentext
	checkevent EVENT_BEAT_MALL_COP
	iftrue LusterMallEscalatorBeatCop
	writetext LusterMallCopText1
	waitbutton
	closetext
	pause 5
	disappear LUSTERMALLCOP
	moveperson LUSTERMALLCOP, $14, $5
	appear LUSTERMALLCOP
	applymovement LUSTERMALLCOP, Movement_LusterMallCop3
	spriteface LUSTERMALLCOP, DOWN
	pause 5
	opentext
	checkevent EVENT_KICKED_OUT_OF_MALL_3
	iftrue LusterMallEscalatorStartBattle
	checkevent EVENT_KICKED_OUT_OF_MALL_2
	iftrue .alreadykickedout2
	checkevent EVENT_KICKED_OUT_OF_MALL_1
	iftrue .alreadykickedout1
	writetext LusterMallCopText2
	setevent EVENT_KICKED_OUT_OF_MALL_1
	jump .cont
.alreadykickedout1
	writetext LusterMallCopText3
	setevent EVENT_KICKED_OUT_OF_MALL_2
	jump .cont
.alreadykickedout2
	writetext LusterMallCopText4
	setevent EVENT_KICKED_OUT_OF_MALL_3
	jump .cont
.cont
	waitbutton
	closetext
	clearevent EVENT_ON_ESCALATOR
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	spriteface PLAYER, DOWN
	warpfacing DOWN, LUSTER_CITY_SHOPPING, $10, $22
.end
	end
	
LusterMallEscalator4:
	checkevent EVENT_ON_ESCALATOR
	iffalse .end
	applyonemovement PLAYER, step_up
	opentext
	checkevent EVENT_BEAT_MALL_COP
	iftrue LusterMallEscalatorBeatCop
	writetext LusterMallCopText1
	waitbutton
	closetext
	pause 5
	disappear LUSTERMALLCOP
	moveperson LUSTERMALLCOP, $14, $5
	appear LUSTERMALLCOP
	applymovement LUSTERMALLCOP, Movement_LusterMallCop3
	applyonemovement LUSTERMALLCOP, step_right
	spriteface LUSTERMALLCOP, DOWN
	pause 5
	opentext
	checkevent EVENT_KICKED_OUT_OF_MALL_3
	iftrue LusterMallEscalatorStartBattle
	checkevent EVENT_KICKED_OUT_OF_MALL_2
	iftrue .alreadykickedout2
	checkevent EVENT_KICKED_OUT_OF_MALL_1
	iftrue .alreadykickedout1
	writetext LusterMallCopText2
	setevent EVENT_KICKED_OUT_OF_MALL_1
	jump .cont
.alreadykickedout1
	writetext LusterMallCopText3
	setevent EVENT_KICKED_OUT_OF_MALL_2
	jump .cont
.alreadykickedout2
	writetext LusterMallCopText4
	setevent EVENT_KICKED_OUT_OF_MALL_3
	jump .cont
.cont
	waitbutton
	closetext
	clearevent EVENT_ON_ESCALATOR
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	spriteface PLAYER, DOWN
	warpfacing DOWN, LUSTER_CITY_SHOPPING, $10, $22
.end
	end
	
LusterMallEscalatorStartBattle:
	writetext LusterMallCopText5
	waitbutton
	closetext
	waitsfx
	winlosstext LusterMallCopWinText, 0
	setlasttalked LUSTERMALLCOP
	loadtrainer MALL_COP, PHIL
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext LusterMallCopText6
	waitbutton
	closetext
	pause 10
	setevent EVENT_BEAT_MALL_COP
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	pause 10
	disappear LUSTERMALLCOP
	special Special_NewFadeIn
	pause 10
	opentext
	writetext LusterMallCopText7
	waitbutton
	closetext
	clearevent EVENT_ON_ESCALATOR
	end
	
LusterMallEscalatorBeatCop:
	writetext LusterMallCopText8
	waitbutton
	closetext
	clearevent EVENT_ON_ESCALATOR
	end
	
LusterMallEscalatorClear:
	clearevent EVENT_ON_ESCALATOR
	end
LusterMallPokeCenterSign:
	jumpstd pokecentersign
	
LusterMallEscalatorSignText:
	text "LUSTER MALL"
	
	para "For all your"
	line "shopping needs!"
	
	para "NOTE FROM"
	line "MANAGEMENT:"
	
	para "“Please don't walk"
	line "the wrong way on"
	cont "the escalators.”"
	done

LusterMallElectronicsSignText:
	text "MAGNETON BROS."
	
	para "“All things"
	line "electronic!”"
	done

LusterMallCoffeeSignText:
	text "KOFFING BEAN"
	
	para "“Fresh Joe with a"
	line "big smile!”"
	done

LusterMallSkateSignText:
	text "MEGA KICKFLIP"
	
	para "“Best boards in"
	line "town.”"
	done	

LusterMallAntiqueSignText:
	text "BATON PASS"
	
	para "“Passing on old"
	line "treasures to new"
	cont "generations.”"
	done

LusterMallHerbSignText:
	text "THE WEEPIN' BELL"
	
	para "“Natrual Medicine"
	line "for what ails ya!”"
	done

LusterMallStoneSignText:
	text "SHINY SHARDS"
	
	para "“Evolve your #-"
	line "MON with the power"
	cont "of a stone!”"
	done

LusterMallBallSignText:
	text "AZALEA BALL CO."
	
	para "“Your one stop"
	line "# BALL shop!”"
	done

LusterMallClothesSignText:
	text "BOUTIQUE COTOUR"
	
	para "“Designer Clothes."
	line "Designer Prices.”"
	done

LusterMallCopText1:
	text "Hold it,"
	line "troublemaker!"
	done
	
LusterMallCopText2:
	text "Can't you read?"
	
	para "It's says very"
	line "clearly,"
	
	para "“Please don't walk"
	line "the wrong way on"
	cont "the escalators.”"
	
	para "But you already"
	line "knew that, didn't"
	cont "you?"
	
	para "Kids like you just"
	line "make my job that"
	cont "much harder!"
	
	para "You're outta here!"
	done
	
LusterMallCopText3:
	text "You again?"
	
	para "Didn't I already"
	line "deal with you?"
	
	para "Get out and stay"
	line "out!"
	done
	
LusterMallCopText4:
	text "Ok, kid!"
	
	para "Last chance."
	
	para "Stop going the"
	line "wrong way on the"
	cont "escalators!"
	
	para "You don't want to"
	line "mess with me."
	done
	
LusterMallCopText5:
	text "Alright, that's it!"
	
	para "If you just won't"
	line "stop walking the"
	cont "wrong way on the"
	cont "escalators,"
	
	para "I'll just have to"
	line "take care of you"
	cont "myself."
	
	para "Don't say I didn't"
	line "warn you!"	
	done
	
LusterMallCopText6:
	text "Fine!"
	
	para "You know what?"
	
	para "You want to walk"
	line "the wrong way on"
	cont "the escalators so"
	cont "badly?"
	
	para "You win!"
	
	para "I quit!"
	
	para "I hope you're"
	line "happy!"
	done
	
LusterMallCopText7:
	text "He's gone…"
	done
	
LusterMallCopText8:
	text "You feel somehow"
	line "empty inside…"
	done
	
LusterMallCopWinText:
	text "Why…"
	done
	
Movement_LusterMallCop1:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_up
	step_end
	
Movement_LusterMallCop2:
	step_up
	step_up
	step_up
	step_left
	step_up
	step_end
	
Movement_LusterMallCop3:
	step_down
	step_down
	step_down
	step_down
	step_right
	step_end
