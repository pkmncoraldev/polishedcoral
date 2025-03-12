LusterMall_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterMallTrigger0
	scene_script LusterMallTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterMallCallback

	db 27 ; warp events
	warp_def 29, 18, 3, LUSTER_CITY_SHOPPING
	warp_def 29, 19, 4, LUSTER_CITY_SHOPPING
	warp_def 29, 22, 5, LUSTER_CITY_SHOPPING
	warp_def 29, 23, 6, LUSTER_CITY_SHOPPING
	warp_def 15, 20, 1, LUSTER_MALL_POKECENTER
	warp_def 15, 21, 2, LUSTER_MALL_POKECENTER
	warp_def  7,  6, 1, LUSTER_MALL_ELECTRONICS_SHOP
	warp_def  7,  7, 2, LUSTER_MALL_ELECTRONICS_SHOP
	warp_def  7, 12, 1, LUSTER_MALL_COFFEE_SHOP
	warp_def  7, 13, 2, LUSTER_MALL_COFFEE_SHOP
	warp_def 15, 12, 1, LUSTER_MALL_SKATE_SHOP
	warp_def 15, 13, 2, LUSTER_MALL_SKATE_SHOP
	warp_def  7, 34, 1, LUSTER_MALL_ANTIQUE_SHOP
	warp_def  7, 35, 2, LUSTER_MALL_ANTIQUE_SHOP
	warp_def 15,  6, 1, LUSTER_MALL_HERB_SHOP
	warp_def 15,  7, 2, LUSTER_MALL_HERB_SHOP
	warp_def  7, 28, 1, LUSTER_MALL_STONE_SHOP
	warp_def  7, 29, 2, LUSTER_MALL_STONE_SHOP
	warp_def 15, 28, 1, LUSTER_MALL_BALL_SHOP
	warp_def 15, 29, 2, LUSTER_MALL_BALL_SHOP
	warp_def 15, 34, 1, LUSTER_MALL_CLOTHES_SHOP
	warp_def 15, 35, 2, LUSTER_MALL_CLOTHES_SHOP
	warp_def 15, 40, 2, LUSTER_MALL_BACK_ROOM
	warp_def 15,  2, 1, LUSTER_MALL_FURNITURE
	warp_def 15,  3, 2, LUSTER_MALL_FURNITURE
	warp_def  3, 20, 1, LUSTER_GYM
	warp_def  3, 21, 2, LUSTER_GYM

	db 8 ; coord events
	coord_event 15, 17, -1, LusterMallEscalator1
	coord_event 16, 17, -1, LusterMallEscalator2
	coord_event 15, 11, -1, LusterMallEscalatorClear
	coord_event 16, 11, -1, LusterMallEscalatorClear
	coord_event 25, 11, -1, LusterMallEscalator3
	coord_event 26, 11, -1, LusterMallEscalator4
	coord_event 26, 17, -1, LusterMallEscalatorClear
	coord_event 25, 17, -1, LusterMallEscalatorClear

	db 14 ; bg events
	signpost 26, 20, SIGNPOST_JUMPTEXT, LusterMallEscalatorSignText
	signpost  8, 20, SIGNPOST_JUMPTEXT, LusterMallEscalatorSignText
	signpost 16, 19, SIGNPOST_READ, LusterMallPokeCenterSign
	signpost  8,  5, SIGNPOST_JUMPTEXT, LusterMallElectronicsSignText
	signpost  8, 14, SIGNPOST_JUMPTEXT, LusterMallCoffeeSignText
	signpost 16, 11, SIGNPOST_JUMPTEXT, LusterMallSkateSignText
	signpost  8, 36, SIGNPOST_JUMPTEXT, LusterMallAntiqueSignText
	signpost 16,  5, SIGNPOST_JUMPTEXT, LusterMallHerbSignText
	signpost  8, 27, SIGNPOST_JUMPTEXT, LusterMallStoneSignText
	signpost 16, 30, SIGNPOST_JUMPTEXT, LusterMallBallSignText
	signpost 16, 36, SIGNPOST_JUMPTEXT, LusterMallClothesSignText
	signpost 11, 19, SIGNPOST_JUMPTEXT, LusterMall_PaperText
	signpost  5, 19, SIGNPOST_JUMPTEXT, LusterMall_GymSignText
	signpost 16,  1, SIGNPOST_JUMPTEXT, LusterMall_FurnitureSignText
	

	db 19 ; object events
	person_event SPRITE_MALL_COP,  5, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMall_Cop, EVENT_BEAT_MALL_COP
	person_event SPRITE_KOFFING_BEAN,  5, 12, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_KOFFING_BEAN,  5, 13, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GRANNY,  8, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMall_NPC1, -1
	person_event SPRITE_SCHOOLBOY, 16, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMall_NPC2, -1
	person_event SPRITE_ROCKER, 11, 33, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMall_NPC3, -1
	person_event SPRITE_YOUNGSTER, 11, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMall_NPC4, -1
	person_event SPRITE_CUTE_GIRL, 11, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterMall_NPC5, -1
	person_event SPRITE_GENTLEMAN, 11, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMall_NPC6, -1
	person_event SPRITE_CLERK, 11,  9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMall_NPC7, -1
	person_event SPRITE_BEAUTY, 17, 33, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterMall_NPC8, -1
	person_event SPRITE_SCHOOLGIRL,  8, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMall_NPC9, -1
	person_event SPRITE_POKEFAN_F, 26, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMall_NPC10, -1
	person_event SPRITE_SKATER, 22, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMall_NPC11, -1
	person_event SPRITE_SKATER, 23, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMall_NPC12, -1
	person_event SPRITE_CUTE_GIRL, 19,  6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMall_NPC13, -1
	person_event SPRITE_POKEFAN_M, 25, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterMall_NPC14, -1
	person_event SPRITE_YOUNGSTER, 17, 22, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMall_NPC15, -1
	person_event SPRITE_OFFICER, 16, 40, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterMall_NPC16, -1


	const_def 1 ; object constants
	const LUSTERMALLCOP
	const LUSTERMALLKOFFINGBEAN1
	const LUSTERMALLKOFFINGBEAN2
	const LUSTERMALLNPC1
	const LUSTERMALLNPC2
	const LUSTERMALLNPC3
	const LUSTERMALLNPC4
	const LUSTERMALLNPC5
	const LUSTERMALLNPC6
	const LUSTERMALLNPC7
	const LUSTERMALLNPC8
	const LUSTERMALLNPC9
	const LUSTERMALLNPC10
	const LUSTERMALLNPC11
	const LUSTERMALLNPC12
	const LUSTERMALLNPC13
	const LUSTERMALLNPC14
	const LUSTERMALLNPC15
	const LUSTERMALLNPC16
	
LusterMallTrigger0:
	end
	
LusterMallTrigger1:
	end
	
LusterMallCallback:
	checkevent EVENT_BEAT_POLLY_REMATCH
	iffalse .donegymstuff
	clearevent EVENT_BEAT_POLLY_REMATCH
	clearevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	clearevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	clearevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	clearevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	clearevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	clearevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
.donegymstuff
	domaptrigger LUSTER_CITY_SHOPPING, $1
	checkevent EVENT_STARTED_PART_TIME_JOB
	iffalse .skip
	moveperson LUSTERMALLNPC16, $29, $10
.skip
	return
	
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
	moveperson LUSTERMALLCOP, $11, $17
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
	warp2 DOWN, LUSTER_CITY_SHOPPING, $0d, $22
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
	moveperson LUSTERMALLCOP, $11, $17
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
	warp2 DOWN, LUSTER_CITY_SHOPPING, $0d, $22
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
	moveperson LUSTERMALLCOP, $18, $5
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
	warp2 DOWN, LUSTER_CITY_SHOPPING, $10, $22
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
	moveperson LUSTERMALLCOP, $18, $5
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
	warp2 DOWN, LUSTER_CITY_SHOPPING, $10, $22
.end
	end
	
LusterMallEscalatorStartBattle:
	writetext LusterMallCopText5
	waitbutton
	closetext
	waitsfx
	winlosstext LusterMallCopWinText, 0
	setlasttalked LUSTERMALLCOP
	loadtrainer MALL_COP, 1
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
	setevent EVENT_UNIQUE_ENCOUNTER_MALL_COP
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	pause 10
	disappear LUSTERMALLCOP
	special FadeInTextboxPalettes
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
	
LusterMall_FurnitureSignText:
	text "DéCOR de DITTO"
	
	para "“Let us TRANSFORM"
	line "your home.”"
	done
	
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
	text "HI JUMP KICKFLIP"
	
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
	
	para "“Natural Medicine"
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
	text "Hold it,<WAIT_S>"
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
	text "Alright, <WAIT_S>that's it!"
	
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
	text "You feel empty"
	line "inside…"
	done
	
LusterMallCopWinText:
	text "Why…"
	done
	
LusterMall_NPC1:
	jumptextfaceplayer LusterMall_NPC1Text
	
LusterMall_NPC2:
	faceplayer
	opentext
	writetext LusterMall_NPC2Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC2, UP
	end
	
LusterMall_NPC3:
	faceplayer
	opentext
	writetext LusterMall_NPC3Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC3, RIGHT
	end
	
LusterMall_NPC4:
	faceplayer
	opentext
	writetext LusterMall_NPC4Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC4, LEFT
	end
	
LusterMall_NPC5:
	jumptext LusterMall_NPC5Text
	
LusterMall_NPC6:
	faceplayer
	opentext
	writetext LusterMall_NPC6Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC6, LEFT
	end
	
LusterMall_NPC7:
	faceplayer
	opentext
	writetext LusterMall_NPC7Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC7, RIGHT
	end
	
LusterMall_NPC8:
	jumptextfaceplayer LusterMall_NPC8Text
	
LusterMall_NPC9:
	faceplayer
	opentext
	writetext LusterMall_NPC9Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC9, UP
	end
	
LusterMall_NPC10:
	jumptext LusterMall_NPC10Text
	
LusterMall_NPC11:
	jumptextfaceplayer LusterMall_NPC11Text
	
LusterMall_NPC12:
	jumptextfaceplayer LusterMall_NPC12Text
	
LusterMall_NPC13:
	checkitem SKATEBOARD
	iftrue .have_skateboard
	jumptextfaceplayer LusterMall_NPC13Text1
.have_skateboard
	jumptextfaceplayer LusterMall_NPC13Text2
	
LusterMall_NPC14:
	faceplayer
	opentext
	writetext LusterMall_NPC14Text
	waitbutton
	closetext
	spriteface LUSTERMALLNPC14, RIGHT
	end
	
LusterMall_NPC15:
	jumptextfaceplayer LusterMall_NPC15Text
	
LusterMall_NPC16:
	faceplayer
	opentext
	checkevent EVENT_STARTED_PART_TIME_JOB
	iftrue .have_job
	writetext LusterMall_NPC16Text1
	waitbutton
	closetext
	spriteface LUSTERMALLNPC16, DOWN
	end
.have_job
	writetext LusterMall_NPC16Text2
	waitbutton
	closetext
	spriteface LUSTERMALLNPC16, DOWN
	end
	
LusterMall_Paper:
	jumptext LusterMall_PaperText
	
LusterMall_Cop:
	jumptextfaceplayer LusterMall_CopText
	
LusterMall_NPC1Text:
	text "It makes me so"
	line "happy to see an"
	cont "ANTIQUE STORE in"
	cont "this day and age."
	
	para "Visiting it makes"
	line "me feel like a"
	cont "little girl again!"
	done
	
LusterMall_NPC2Text:
	text "I wanna buy a"
	line "SKATEBOARD so bad,"
	
	para "but my DAD won't"
	line "let me have one…"
	done
	
LusterMall_NPC3Text:
	text "Do you mind?"
	
	para "I'm supposed to be"
	line "meeting a girl"
	cont "here!"
	
	para "…"
	
	para "She's coming,"
	line "right?"
	done
	
LusterMall_NPC4Text:
	text "Boy, she loves to"
	line "talk."
	
	para "She won't even let "
	line "me get a word in"
	cont "edgewise."
	done
	
LusterMall_NPC5Text:
	text "…and then I told"
	line "her that he told"
	cont "me that she said"
	cont "that isn't true."
	
	para "Then she said that"
	line "I was lying!"
	
	para "Can you believe"
	line "that?"
	
	para "Blah <WAIT_S>blah <WAIT_S>blah!"
	
	para "…"
	
	para "It seems like"
	line "she'll never stop"
	cont "talking!"
	done
	
LusterMall_NPC6Text:
	text "I wish those two"
	line "behind me would"
	cont "keep it down."
	
	para "I'm trying to read"
	line "the newspaper."
	
	para "I've had to restart"
	line "the same paragraph"
	cont "ten times!"
	done
	
LusterMall_NPC7Text:
	text "What do you want?"
	
	para "Leave me alone."
	
	para "I'm on break!"
	done
	
LusterMall_NPC8Text:
	text "I love to buy lots"
	line "of designer #-"
	cont "BALLS to match my"
	cont "designer outfits!"
	done
	
LusterMall_NPC9Text:
	text "These pretty rocks"
	line "are so sparkly!"
	
	para "I wonder what they"
	line "do!"
	done
	
LusterMall_NPC10Text:
	text "Ok, <WAIT_S>so I am here,"
	
	para "and the ANTIQUE"
	line "SHOP is…"
	
	para "Oh…"
	
	para "This map is so"
	line "confusing!"
	done
	
LusterMall_NPC11Text:
	text "That lame MALL"
	line "COP keeps getting"
	cont "onto us."
	
	para "He's really funny"
	line "when he's mad!"
	done
	
LusterMall_NPC12Text:
	text "I love going the"
	line "wrong way on the"
	cont "escalators."
	
	para "Why?"
	
	para "Because I'm not"
	line "supposed to!"
	done
	
LusterMall_NPC13Text1:
	text "SKATERS are so"
	line "dreamy!"
	
	para "Do you have a"
	line "SKATEBOARD?"
	
	para "No, I didn't think"
	line "so…"
	done
	
LusterMall_NPC13Text2:
	text "SKATERS are so"
	line "dreamy!"
	
	para "Do you have a"
	line "SKATEBOARD?"
	
	para "You do?"
	
	para "Sigh…"
	
	para "Soooo dreamy!"
	done
	
LusterMall_NPC14Text:
	text "Sometimes I like"
	line "to just sit here"
	cont "and people-watch."
	
	para "…"
	
	para "That's not weird,"
	line "is it?"
	done
	
LusterMall_NPC15Text:
	text "No matter how busy"
	line "the MALL gets,"
	
	para "there's never a"
	line "line at the"
	cont "#MON CENTER."
	done
	
LusterMall_NPC16Text1:
	text "Employees only"
	line "past this point!"
	
	para "You want to get"
	line "back here, you"
	cont "get a job!"
	done
	
LusterMall_NPC16Text2:
	text "Employees only"
	line "past this point!"
	
	para "Go on ahead."
	done
	
LusterMall_PaperText:
	text "An issue of “THE"
	line "LUSTER TIMES”."
	done
	
LusterMall_GymSignText:
	text "LUSTER GYM"
	
	para "Closed for"
	line "construction."
	
	para "Come back in"
	line "the final game."
	done
	
LusterMall_CopText:
	text "You aren't up to"
	line "no good, <WAIT_S>are you?"
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
