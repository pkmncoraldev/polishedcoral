RiverRapidsHouse_MapScriptHeader:
	db 4 ; scene scripts
	scene_script RiverRapidsHouseTrigger0
	scene_script RiverRapidsHouseTrigger1
	scene_script RiverRapidsHouseTrigger2
	scene_script RiverRapidsHouseTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RiverRapidsHouseCallback

	db 5 ; warp events
	warp_def  9,  1, 1, RIVER_RAPIDS_ENTRANCE
	warp_def  9,  2, 1, RIVER_RAPIDS_ENTRANCE
	warp_def  5, 2, 1, RIVER_RAPIDS
	warp_def  5, 3, 1, RIVER_RAPIDS
	warp_def  4, 3, 1, RIVER_RAPIDS

	db 0 ; coord events

	db 3 ; bg events
	signpost  3, 5, SIGNPOST_JUMPTEXT, RiverRapidsHouseFireplaceText
	signpost  3, 6, SIGNPOST_JUMPTEXT, RiverRapidsHouseFireplaceText
	signpost  3, 7, SIGNPOST_JUMPTEXT, RiverRapidsHouseWoodText

	db 4 ; object events
	person_event SPRITE_HEX_MANIAC, 4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RiverRapidsHouseLady, -1
	object_event 1, 5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, AZUMARILL, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, RiverRapidsEntranceAzumarill, -1
	object_event 7, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MAGBY, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, RiverRapidsEntranceMagby, -1
	object_event 3, 3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SWABLU, -1, -1, PAL_NPC_TEAL, PERSONTYPE_SCRIPT, 0, RiverRapidsEntranceSwablu, -1
	
	
RiverRapidsHouseTrigger0:
	end
	
RiverRapidsHouseTrigger1:
	priorityjump RiverRapidsHouseFail
	end
	
RiverRapidsHouseTrigger2:
	priorityjump RiverRapidsHousePass
	end
	
RiverRapidsHouseTrigger3:
	priorityjump RiverRapidsHouseNewRecord
	end
	
RiverRapidsHouseNewRecord:
	setevent EVENT_DAILY_PLAYER_RIVER_RAPID_GAME
	setlasttalked 1
	faceplayer
	opentext
	writetext RiverRapidsHouseLadyText10
	checktmhm TM_ENERGY_BALL
	iffalse .givetm
	waitbutton
	callasm RiverRapidsHouseGetItem
	verbosegiveitem ITEM_FROM_MEM, 1
	jump .cont
.givetm
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext RiverRapidsHouseLadyText12
	buttonsound
	verbosegivetmhm TM_ENERGY_BALL
	setevent EVENT_TM53
.cont
	writetext RiverRapidsHouseLadyText11
	waitbutton
	closetext
	pause 1
	dotrigger $0
	end
	
RiverRapidsHousePass:
	setevent EVENT_DAILY_PLAYER_RIVER_RAPID_GAME
	setlasttalked 1
	faceplayer
	opentext
	writetext RiverRapidsHouseLadyText9
	waitbutton
	callasm RiverRapidsHouseGetItem
	verbosegiveitem ITEM_FROM_MEM, 1
	writetext RiverRapidsHouseLadyText11
	waitbutton
	closetext
	pause 1
	dotrigger $0
	end
	
RiverRapidsHouseFail:
	setlasttalked 1
	faceplayer
	opentext
	writetext RiverRapidsHouseLadyText8
	waitbutton
	closetext
	pause 1
	dotrigger $0
	end
	
RiverRapidsHouseCallback:
	changeblock $4, $2, $4d
	changeblock $6, $2, $4e
	return
	
RiverRapidsHouseFireplaceText:
	text "The embers are"
	line "still warm."
	done
	
RiverRapidsHouseWoodText:
	text "A pile of neatly"
	line "stacked firewood."
	done
	
RiverRapidsHouseGetItem:
	ld hl, RiverRapidsPrizes
	xor a
	ld d, a
	call GetWeekday
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wScriptVar], a
	ret
	
RiverRapidsPrizes:
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db -1
	
RiverRapidsHouseLady:
	faceplayer
	checkevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	iftrue .talked
	setevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	opentext TEXTBOX_UNKNOWN
	writetext RiverRapidsHouseLadyText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface 1, LEFT
	writetext RiverRapidsHouseLadyText1_2
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface 1, UP
	writetext RiverRapidsHouseLadyText1_3
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface 1, RIGHT
	writetext RiverRapidsHouseLadyText1_4
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface 1, LEFT
	writetext RiverRapidsHouseLadyText1_5
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface 1, UP
	writetext RiverRapidsHouseLadyText1_6
	buttonsound
	farwritetext StdBlankText
	pause 6
	faceplayer
	writetext RiverRapidsHouseLadyText1_7
	buttonsound
	changetextboxspeaker TEXTBOX_LAKE
	farwritetext StdBlankText
	pause 6
	writetext RiverRapidsHouseLadyText1_8
	yesorno
	iffalse .no
	jump .rules
.talked
	opentext TEXTBOX_LAKE
	checkevent EVENT_DAILY_PLAYER_RIVER_RAPID_GAME
	iftrue .played_today
	writetext RiverRapidsHouseLadyText2
	jump .cont
.played_today
	writetext RiverRapidsHouseLadyText3
.cont
	yesorno
	iffalse .no
	writetext RiverRapidsHouseLadyText4
	yesorno
	iftrue .start
.rules
	writetext RiverRapidsHouseLadyText5
	yesorno
	iffalse .no
.start
	writetext RiverRapidsHouseLadyText6
	waitbutton
	closetext
	special FadeOutPalettes
	changeblock $2, $4, $db
	applyonemovement PLAYER, hide_person
	warpcheck
	end
.no
	writetext RiverRapidsHouseLadyText7
	waitbutton
	closetext
	end

RiverRapidsHouseLadyText1:
	text "Hello, friend.<WAIT_S>"
	line "Welcome!"
	
	para "We don't get many"
	line "visitors to our"
	cont "spot."
	
	para "Let me introduce"
	line "you to everyone."
	done
	
RiverRapidsHouseLadyText1_2:
	text "This is RAINDROP."
	done
	
RiverRapidsHouseLadyText1_3:
	text "That's BLISS."
	done
	
RiverRapidsHouseLadyText1_4:
	text "That's SPIRIT in"
	line "the corner."
	done
	
RiverRapidsHouseLadyText1_5:
	text "You must have seen"
	line "JUNIPER outside by"
	cont "the door,"
	done
	
RiverRapidsHouseLadyText1_6:
	text "and FLOWER by the"
	line "riverbank with the"
	cont "sign."
	done
	
RiverRapidsHouseLadyText1_7:
	text "And I'm called"
	line "LAKE."
	done
	
RiverRapidsHouseLadyText1_8:
	text "And you must be…"
	line "<WAIT_M>Don't tell me…"
	
	para "You blew in out of"
	line "nowhere, so you"
	cont "must be BREEZE."
	
	para "I run a little"
	line "game with all my"
	cont "friends here."
	
	para "If you can win in"
	line "under a minute,"
	cont "I'll give you a"
	cont "little treasure."
	
	para "Wanna play,"
	line "little BREEZE?"
	done
	
RiverRapidsHouseLadyText2:
	text "Greetings, little"
	line "BREEZE."
	
	para "Did you come to"
	line "play my game?"
	
	para "If you can win in"
	line "under a minute,"
	cont "I'll give you a"
	cont "little treasure."
	
	para "Wanna play?"
	done
	
RiverRapidsHouseLadyText3:
	text "Greetings, little"
	line "BREEZE."
	
	para "Did you come to"
	line "play my game?"
	
	para "Since you've won"
	line "today, I can't"
	cont "give you anything."
	
	para "Still wanna play?"
	done
	
RiverRapidsHouseLadyText4:
	text "Do you remember"
	line "how to play?"
	done

RiverRapidsHouseLadyText5:
	text "Here's how it"
	line "all works."
	
	para "We'll head up the"
	line "mountain to the"
	cont "top of the river."
	
	para "You'll ride the"
	line "rapids back down"
	cont "to the bottom."
	
	para "When you come to a"
	line "rock, you'll have"
	cont "to pick which way"
	cont "you want to go."
	
	para "Press the D-PAD"
	line "with good timing."
	
	para "Too late, and you"
	line "will crash!"
	
	para "If that happens,"
	line "you won't be able"
	cont "to pick your path!"
	
	para "Hit just the right"
	line "timing, and you'll"
	cont "hear a chime and"
	cont "won't lose speed."
	
	para "Alright, are you"
	line "ready to play?"
	done
	
RiverRapidsHouseLadyText6:
	text "Copacetic!"
	
	para "We'll head up."
	done
	
RiverRapidsHouseLadyText7:
	text "It's your choice,"
	line "little BREEZE…"
	done
	
RiverRapidsHouseLadyText8:
	text "Ahhh…"
	
	para "Sorry, little"
	line "BREEZE."
	
	para "You took longer"
	line "than a minute."
	
	para "You can always try"
	line "again if you like."
	done
	
RiverRapidsHouseLadyText9:
	text "Ahhh!"
	
	para "You got under a"
	line "minute again!"
	
	para "Good job little,"
	line "BREEZE."
	
	para "Let me reward you"
	line "with a treasure."
	done
	
RiverRapidsHouseLadyText10:
	text "FAR OUT!"
	
	para "A new record!"
	
	para "That's amaaaazing,"
	line "my little BREEZE."
	
	para "Let me reward you"
	line "with a treasure."
	done
	
RiverRapidsHouseLadyText11:
	text  "You can always try"
	line "again if you like,"
	
	para "but I only have"
	line "one treasure a day"
	cont "to give."
	done
	
RiverRapidsHouseLadyText12:
	text "It's a TM that"
	line "draws from the"
	cont "power of nature."
	done
	