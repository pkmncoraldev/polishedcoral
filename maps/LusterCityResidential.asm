LusterCityResidential_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ResidentialCallback

	db 1 ; warp events
	warp_def 20, 13, 1, LUSTER_SEWERS_B1F_FLOODED

	db 0 ; coord events

	db 8 ; bg events
	signpost 18, 13, SIGNPOST_READ, LusterTrashcan1
	signpost 18, 14, SIGNPOST_READ, LusterTrashcan2
	signpost 35, 14, SIGNPOST_READ, LusterTrashcan3
	signpost 35, 20, SIGNPOST_READ, LusterTrashcan4
	signpost 45, 14, SIGNPOST_READ, LusterTrashcan5
	signpost 45, 20, SIGNPOST_READ, LusterTrashcan6
	signpost 12, 27, SIGNPOST_READ, LusterSign1
	signpost 15, 23, SIGNPOST_READ, LusterSign2

	db 19 ; object events
	person_event SPRITE_OFFICER, 39,  6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC1, -1
	person_event SPRITE_COOLTRAINER_F, 29, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster1NPC2, -1
	person_event SPRITE_GENTLEMAN, 30, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Luster1NPC3, -1
	person_event SPRITE_YOUNGSTER, 25, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC4, -1
	person_event SPRITE_COOLTRAINER_F, 33, 21, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster1NPC5, -1
	person_event SPRITE_YOUNGSTER, 39, 16, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Luster1NPC6, -1
	person_event SPRITE_LASS, 26, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster1NPC7, -1
	person_event SPRITE_FAT_GUY, 33,  9, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC8, -1
	person_event SPRITE_BUG_CATCHER, 47,  7, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC9, -1
	person_event SPRITE_YOUNGSTER, 51, 21, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster1NPC10, -1
	person_event SPRITE_MEOWTH, 44, 14, SPRITEMOVEDATA_POKEMON, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC11, -1
	person_event SPRITE_PIKACHU, 25, 14, SPRITEMOVEDATA_POKEMON, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC12, -1
	person_event SPRITE_DELINQUENT_M, 20, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterPunkLeader, -1
	person_event SPRITE_DELINQUENT_F, 21, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterPunk1, -1
	person_event SPRITE_DELINQUENT_M, 19, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterPunk2, -1
	person_event SPRITE_BURGLAR, 34, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterShadyGuy, -1
	person_event SPRITE_MALL_SIGN_2, 44, 31, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN_2, 44, 32, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_VALVE_1, 11, 32, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1


	const_def 1 ; object constants
	const LUSTER1NPC1
	const LUSTER1NPC2
	const LUSTER1NPC3
	const LUSTER1NPC4
	const LUSTER1NPC5
	const LUSTER1NPC6
	const LUSTER1NPC7
	const LUSTER1NPC8
	const LUSTER1NPC9
	const LUSTER1NPC10
	const LUSTER1NPC11
	const LUSTER1NPC12
	const LUSTERPUNKLEADER
	const LUSTERPUNK1
	const LUSTERPUNK2
	const LUSTERSHADYGUY
	const LUSTERMALLSIGN1
	const LUSTERMALLSIGN2
	
ResidentialCallback:
	checkevent EVENT_DOUBLE_LANDMARK_SIGN
	iffalse .cont
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
.cont
	checkevent EVENT_LUSTER_TRASHCAN_1
	iftrue .OpenSesame1
.cont1
	checkevent EVENT_LUSTER_TRASHCAN_2
	iftrue .OpenSesame2
.cont2
	checkevent EVENT_LUSTER_TRASHCAN_3
	iftrue .OpenSesame3
.cont3
	checkevent EVENT_LUSTER_TRASHCAN_4
	iftrue .OpenSesame4
.cont4
	checkevent EVENT_LUSTER_TRASHCAN_5
	iftrue .OpenSesame5
.cont5
	checkevent EVENT_LUSTER_TRASHCAN_6
	iftrue .OpenSesame6
.cont6
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .OpenSesameSewer
	return

.OpenSesame1:
	changeblock $c, $12, $52
	jump .cont1

.OpenSesame2:
	changeblock $e, $12, $53
	jump .cont2
	
.OpenSesame3:
	changeblock $e, $22, $4d
	jump .cont3
	
.OpenSesame4:
	changeblock $14, $22, $4c
	jump .cont4
	
.OpenSesame5:
	changeblock $e, $2c, $4d
	jump .cont5
	
.OpenSesame6:
	changeblock $14, $2c, $4c
	jump .cont6
	
.OpenSesameSewer:
	moveperson LUSTERPUNKLEADER, $10, $14
	moveperson LUSTERPUNK2, $10, $13
	moveperson LUSTERPUNK1, $10, $15
	changeblock $c, $14, $5a
	return
	
LusterSign1:
	jumptext LusterSign1Text
	
LusterSign2:
	jumptext LusterSign2Text
	
Luster1NPC1:
	jumptextfaceplayer Luster1NPC1Text
		
Luster1NPC2:
	jumptextfaceplayer Luster1NPC2Text
	
	
Luster1NPC3:
	faceplayer
	opentext
	writetext Luster1NPC3Text
	waitbutton
	closetext
	spriteface LUSTER1NPC3, DOWN
	end
	
Luster1NPC4:
	jumptextfaceplayer Luster1NPC4Text
		
Luster1NPC5:
	jumptextfaceplayer Luster1NPC5Text
	
Luster1NPC6:
	jumptextfaceplayer Luster1NPC6Text
	
Luster1NPC7:
	jumptextfaceplayer Luster1NPC7Text
	
Luster1NPC8:
	jumptextfaceplayer Luster1NPC8Text
	
Luster1NPC9:
	jumptextfaceplayer Luster1NPC9Text
	
Luster1NPC10:
	jumptextfaceplayer Luster1NPC10Text
		
Luster1NPC11:
	opentext
	writetext Luster1NPC11Text
	cry MEOWTH
	waitbutton
	closetext
	end
	
Luster1NPC12:
	opentext
	writetext Luster1NPC12Text
	cry PIKACHU
	waitbutton
	closetext
	end
	
LusterTrashcan1:
	changeblock $c, $12, $52
	opentext
	writetext LusterTrashcanText
	waitbutton
	closetext
	setevent EVENT_LUSTER_TRASHCAN_1
	end
	
LusterTrashcan2:
	changeblock $e, $12, $53
	opentext
	writetext LusterTrashcanText
	waitbutton
	closetext
	setevent EVENT_LUSTER_TRASHCAN_2
	end
	
LusterTrashcan3:
	changeblock $e, $22, $4d
	opentext
	writetext LusterTrashcanText
	waitbutton
	closetext
	setevent EVENT_LUSTER_TRASHCAN_3
	end
	
LusterTrashcan4:
	changeblock $14, $22, $4c
	opentext
	writetext LusterTrashcanText
	waitbutton
	closetext
	setevent EVENT_LUSTER_TRASHCAN_4
	end
	
LusterTrashcan5:
	changeblock $e, $2c, $4d
	opentext
	writetext LusterTrashcanText
	waitbutton
	closetext
	setevent EVENT_LUSTER_TRASHCAN_5
	end
	
LusterTrashcan6:
	changeblock $14, $2c, $4c
	opentext
	writetext LusterTrashcanText
	waitbutton
	closetext
	setevent EVENT_LUSTER_TRASHCAN_6
	end
	
LusterPunkLeader:
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .gogetpackage
	checkitem THE_THING
	iftrue .takethething
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .speechloop
	opentext
	writetext LusterPunkLeaderText1
	waitbutton
	closetext
	pause 10
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNKLEADER, 15
	pause 7
	faceplayer
	opentext
	writetext LusterPunkLeaderText4
	waitbutton
	closetext
	applyonemovement PLAYER, fix_facing
	follow PLAYER, LUSTERPUNKLEADER
	applyonemovement PLAYER, step_right
	stopfollow
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	spriteface LUSTERPUNK1, RIGHT
	applyonemovement LUSTERPUNK1, step_right
	opentext
	writetext LusterPunk1Text2
	waitbutton
	closetext
	pause 10
	spriteface LUSTERPUNK2, RIGHT
	applyonemovement LUSTERPUNK2, step_right
	opentext
	writetext LusterPunk2Text2
	waitbutton
	closetext
	pause 20
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNK1, 15
	pause 7
	spriteface LUSTERPUNK1, UP
	opentext
	writetext LusterPunk1Text3
	waitbutton
	closetext
	pause 15
	spriteface LUSTERPUNK2, DOWN
	opentext
	writetext LusterPunk2Text3
	waitbutton
	closetext
	pause 15
	spriteface LUSTERPUNKLEADER, LEFT
	opentext
	writetext LusterPunkLeaderText5
	waitbutton
	closetext
	pause 50
	spriteface LUSTERPUNKLEADER, RIGHT
	pause 10
	spriteface LUSTERPUNK1, RIGHT
	spriteface LUSTERPUNK2, RIGHT
	opentext
	writetext LusterPunkLeaderText6
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERPUNKLEADER, step_left
	pause 10
	spriteface LUSTERPUNK2, DOWN
	opentext
	writetext LusterPunk2Text4
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERPUNK2, step_left
	spriteface LUSTERPUNK2, DOWN
	spriteface LUSTERPUNK1, UP
	opentext
	writetext LusterPunk1Text4
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERPUNK1, step_left
	spriteface LUSTERPUNK1, UP
	setevent EVENT_CAN_GET_THE_THING
	end
.gogetpackage
	faceplayer
	opentext
	writetext LusterPunkLeaderText7
	waitbutton
	closetext
	spriteface LUSTERPUNKLEADER, LEFT
	end
.takethething
	faceplayer
	opentext
	writetext LusterPunkLeaderText2
	waitbutton
	closetext
	special Special_NewFadeBlack
	changeblock $c, $14, $5a
	closetext
	takeitem THE_THING
	setevent EVENT_LUSTER_SEWER_OPEN
	special Special_NewFadeIn
	end
.speechloop
	jumptextfaceplayer LusterPunkLeaderText3
	
LusterPunk1:
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .gogetpackage
	checkitem THE_THING
	iftrue .havethething
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .speechloop
	opentext
	writetext LusterPunk1Text1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNK1, 15
	pause 7
	faceplayer
	opentext
	writetext LusterPunk1Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	end
.gogetpackage
	opentext
	writetext LusterPunk1Text5
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	end
.havethething
	opentext
	writetext LusterPunk1Text6
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	end
.speechloop
	jumptextfaceplayer LusterPunk1Text7
	
LusterPunk2:
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .gogetpackage
	checkitem THE_THING
	iftrue .havethething
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .speechloop
	opentext
	writetext LusterPunk2Text1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNK2, 15
	pause 7
	faceplayer
	opentext
	writetext LusterPunk2Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	end
.gogetpackage
	opentext
	writetext LusterPunk2Text5
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	end
.havethething
	opentext
	writetext LusterPunk2Text6
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	end
.speechloop
	jumptextfaceplayer LusterPunk2Text7
	
LusterShadyGuy:
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .seweropen
	checkevent EVENT_GOT_THE_THING
	iftrue .alreadygotpackage
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .getpackage
	jumptextfaceplayer LusterShadyGuyText1
.getpackage
	faceplayer
	opentext
	writetext LusterShadyGuyText2
	waitbutton
	verbosegiveitem THE_THING
	writetext LusterShadyGuyText3
	waitbutton
	closetext
	setevent EVENT_GOT_THE_THING
	clearevent EVENT_CAN_GET_THE_THING
	end
.alreadygotpackage
	jumptextfaceplayer LusterShadyGuyText3
.seweropen
	jumptextfaceplayer LusterShadyGuyText4
	
LusterTrashcanText:
	text "It's empty…"
	done
	
LusterSign1Text:
	text "LUSTER TRAIN"
	line "STATION"
	done
	
LusterSign2Text:
	text "LUSTER CITY"
	
	para "The bustling"
	line "center of the"
	cont "ONWA REGION."
	done
	
LusterPunkLeaderText1:
	text "Gah!"
	
	para "This just ain't"
	line "right!"
	done
	
LusterPunkLeaderText2:
	text "Give “THE THING”."
	done
	
LusterPunkLeaderText3:
	text "Go into the sewer."
	done
	
LusterPunkLeaderText4:
	text "What're you lookin'"
	line "at?"
	
	para "Mind your own"
	line "business, kid!"
	done
	
LusterPunkLeaderText5:
	text "Hmm…"
	
	para "I guess that could"
	line "work,"
	
	para "but I'm not so sure"
	line "this kid can even"
	cont "handle it…"
	done
	
LusterPunkLeaderText6:
	text "Alright."
	
	para "How about this?"
	
	para "If you do this"
	line "favor for me,"
	
	para "I'll give you"
	line "something good in"
	cont "return."
	
	para "But first, you"
	line "gotta prove you" 
	cont "got what it takes."
	
	para "I have an"
	line "associate who"
	cont "has a uh…" 
	cont "“THING” I need."
	
	para "He's somewhere in"
	line "the neighborhood."
	
	para "If you can find"
	line "him and bring the"
	cont "uh…"
	cont "“THING” to me,"
	
	para "I'll let you help"
	line "me out."
	
	para "Yeah…"
	
	para "Now get to it!"
	done
	
LusterPunkLeaderText7:
	text "Did you get that"
	line "uh…"
	cont "“THING”?"
	
	para "What are you"
	line "waiting for?"
	done
	
LusterPunk1Text1:
	text "What are we"
	line "gonna do?"
	done
	
LusterPunk1Text2:
	text "Buzz off!"
	done
	
LusterPunk1Text3:
	text "Hey wait…"
	
	para "We can't show our"
	line "faces down there,"
	
	para "but what if we"
	line "sent the kid down"
	cont "there to deal with"
	cont "it instead?"
	done
	
LusterPunk1Text4:
	text "Good thinkin',"
	line "boss!"
	done
	
LusterPunk1Text5:
	text "Get going!"
	done
	
LusterPunk1Text6:
	text "Did you get it?"
	done
	
LusterPunk1Text7:
	text "TEXT 7"
	done
	
LusterPunk2Text1:
	text "This just ain't"
	line "fair, man…"
	done
	
LusterPunk2Text2:
	text "Not now, punk!"
	done
	
LusterPunk2Text3:
	text "Yeah!"
	
	para "She's right, boss!"
	
	para "That could work!"
	done
	
LusterPunk2Text4:
	text "Killing two birds"
	line "with one stone!"
	done
	
LusterPunk2Text5:
	text "What are you still"
	line "doing here?"
	done
	
LusterPunk2Text6:
	text "Took you long"
	line "enough…"
	done
	
LusterPunk2Text7:
	text "TEXT 7"
	done
	
LusterShadyGuyText1:
	text "What are you"
	line "lookin' at?"
	
	para "I ain't doin' any-"
	line "thing shady!"
	done
	
LusterShadyGuyText2:
	text "You the one?"
	
	para "They sent a kid?"
	
	para "…"
	
	para "Ah whatever!"
	
	para "Here's the uh…"
	line "“THING”."
	
	para "Take it and get"
	line "outta here."
	done
	
LusterShadyGuyText3:
	text "Scram!"
	
	para "We don't know each"
	line "other, capiche?"
	done
	
LusterShadyGuyText4:
	text "What do you want"
	line "now?"
	
	para "Scram!"
	
	para "We don't know each"
	line "other, capiche?"
	done
	
	
Luster1NPC1Text:
	text "TEXT 1"
	done
	
Luster1NPC2Text:
	text "TEXT 2"
	done
	
Luster1NPC3Text:
	text "TEXT 3"
	done
	
Luster1NPC4Text:
	text "LUSTER CITY has"
	line "two #MON"
	cont "CENTERS."
	
	para "There's this one"
	line "here, and also one"
	cont "in the SHOPPING"
	cont "MALL."
	
	para "Pretty convenient"
	line "if you ask me!"
	done
	
Luster1NPC5Text:
	text "TEXT 5"
	done
	
Luster1NPC6Text:
	text "TEXT 6"
	done
	
Luster1NPC7Text:
	text "TEXT 7"
	done
	
Luster1NPC8Text:
	text "TEXT 8"
	done
	
Luster1NPC9Text:
	text "I'm not supposed to"
	line "play in the"
	cont "street."
	
	para "Don't tell my"
	line "parents."
	done
	
Luster1NPC10Text:
	text "TEXT 10"
	done
	
Luster1NPC11Text:
	text "TEXT 11"
	done
	
Luster1NPC12Text:
	text "TEXT 12"
	done
	