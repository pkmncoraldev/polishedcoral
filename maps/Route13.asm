Route13_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route13Callback

	db 16 ; warp events
	warp_event 20,  9, ROUTE_13_UNDERWATER, 1
	warp_event 21,  9, ROUTE_13_UNDERWATER, 2
	warp_event 19, 10, ROUTE_13_UNDERWATER, 3
	warp_event 20, 10, ROUTE_13_UNDERWATER, 4
	warp_event 21, 10, ROUTE_13_UNDERWATER, 5
	warp_event 22, 10, ROUTE_13_UNDERWATER, 6
	warp_event 19, 11, ROUTE_13_UNDERWATER, 7
	warp_event 20, 11, ROUTE_13_UNDERWATER, 8
	warp_event 21, 11, ROUTE_13_UNDERWATER, 9
	warp_event 22, 11, ROUTE_13_UNDERWATER, 10
	warp_event 20, 12, ROUTE_13_UNDERWATER, 11
	warp_event 21, 12, ROUTE_13_UNDERWATER, 12
	warp_event 28,  6, ROUTE_13_UNDERWATER, 13
	warp_event 29,  6, ROUTE_13_UNDERWATER, 14
	warp_event 28,  7, ROUTE_13_UNDERWATER, 15
	warp_event 29,  7, ROUTE_13_UNDERWATER, 16

	db 0 ; coord events

	db 4 ; bg events
	signpost  7, 38, SIGNPOST_ITEM + RARE_CANDY, EVENT_ROUTE_13_HIDDEN_RARE_CANDY
	signpost  9, 49, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_ROUTE_13_HIDDEN_BOTTLE_CAP_1
	signpost  8, 34, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_ROUTE_13_HIDDEN_BOTTLE_CAP_2
	signpost  2, 32, SIGNPOST_ITEM + SHELL_BELL, EVENT_ROUTE_13_HIDDEN_SHELL_BELL

	db 12 ; object events
	person_event SPRITE_CHILD,  7, 37, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route13Kid1, -1
	person_event SPRITE_SCHOOLGIRL,  6, 38, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route13Kid2, -1
	person_event SPRITE_UMBRELLA,  4, 35, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA,  4, 36, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_TUBER,  5, 51, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute13_1, -1
	person_event SPRITE_FISHER, 11, 40, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute13_2, -1
	person_event SPRITE_TUBER,  8, 44, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute13_3, -1
	person_event SPRITE_SWIMMER_GIRL, 14, 50, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute13_4, -1
	person_event SPRITE_TUBER_WATER, 15, 14, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute13_5, -1
	person_event SPRITE_BIKINI_2,  4, 32, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route13NPC1, -1
	person_event SPRITE_TRUNKS,  2, 35, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route13NPC2, -1
	tapeball_event  10,  8, MUSIC_WATER_ROUTE, 1, EVENT_MUSIC_WATER_ROUTE
	
	const_def 1 ; object constants
	const ROUTE_13_KID_1
	const ROUTE_13_KID_2

Route13Callback:
	clearevent EVENT_CAPE_LIGHTHOUSE_COLORS
	domaptrigger SUNSET_CAPE, $0
	return

Route13NPC1:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_13_SHELL_BELL
	iftrue .gotbell
	writetext Route13NPC1Text1
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	checkmoney $0, 500
	if_equal $2, .nomoney
	giveitem SHELL_BELL
	iffalse .NoRoom
	playsound SFX_TRANSACTION
	takemoney $0, 500
	takeitem SHELL_BELL
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	verbosegiveitem SHELL_BELL
.gotbell
	writetext Route13NPC1Text2
	waitbutton
	closetext
	setevent EVENT_ROUTE_13_SHELL_BELL
	end
.NoRoom
	writetext Route13NPC1Text3
	waitbutton
	closetext
	end
.no
	writetext Route13NPC1Text4
	waitbutton
	closetext
	end
.nomoney
	writetext Route13NPC1Text5
	waitbutton
	closetext
	end
	
Route13NPC1Text1:
	text "I make bells from"
	line "the shells on the"
	cont "beach."
	
	para "You want one?"
	line "Only ¥500."
	done
	
Route13NPC1Text2:
	text "That SHELL BELL"
	line "will restore HP"
	cont "to a #MON that"
	cont "holds it when they"
	cont "deal damage."
	
	para "It could come in"
	line "handy in a pinch!"
	done
	
Route13NPC1Text3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	done

Route13NPC1Text4:
	text "Suit yourself."
	done

Route13NPC1Text5:
	text "Come back with"
	line "¥500 if you want"
	cont "one."
	done

Route13NPC2:
	jumptextfaceplayer Route13NPC2Text

Route13NPC2Text:
	text "That girl over"
	line "there…"
	
	para "She sells SHELL"
	line "BELLs by the"
	cont "seashore…"
	done

Route13Kid1:
	faceplayer
	opentext
	writetext Route13Kid1Text
	waitbutton
	closetext
	spriteface ROUTE_13_KID_1, RIGHT
	end
	
Route13Kid1Text:
	text "We're building a"
	line "sandcastle!"
	
	para "We're gonna play"
	line "king and queen!"
	done
	
Route13Kid2:
	faceplayer
	opentext
	writetext Route13Kid2Text
	waitbutton
	closetext
	spriteface ROUTE_13_KID_2, DOWN
	end
	
Route13Kid2Text:
	text "I wanted to be the"
	line "king, but he said"
	cont "I had to be the"
	cont "queen cuz I'm a"
	cont "girl…"
	done

TrainerRoute13_1:
	generictrainer TUBER, SAMANTHA, EVENT_BEAT_ROUTE_13_TRAINER_1, .SeenText, .BeatenText

	text "Me and MARILL like"
	line "to spray people"
	cont "with WATER GUN!"
	
	para "It's fun!"
	done

.SeenText:
	text "Go MARILL!"
	
	para "Get that TRAINER"
	line "all wet!"
	done

.BeatenText:
	text "You meanie!"
	
	para "We were just"
	line "playing!"
	done
	
TrainerRoute13_2:
	generictrainer FISHER, HARRELSON, EVENT_BEAT_ROUTE_13_TRAINER_2, .SeenText, .BeatenText

	text "Yo <WAIT_S>ho <WAIT_S>ho<WAIT_S> and a"
	line "battle for fun!"
	done

.SeenText:
	text "Yo <WAIT_S>ho <WAIT_S>ho<WAIT_S> and a"
	line "bottle of rum!"
	
	para "I sing shanties"
	line "to pass the time"
	cont "while fishing."
	done

.BeatenText:
	text "Yo <WAIT_S>ho <WAIT_S>ho?"
	done
	
TrainerRoute13_3:
	generictrainer TUBER, BEBE, EVENT_BEAT_ROUTE_13_TRAINER_3, .SeenText, .BeatenText

	text "Not fair!"

	para "Why did you make"
	line "me battle?"
	
	para "Huh?"
	line "I asked you?"
	
	para "Oh yeah!"
	done

.SeenText:
	text "Heya!"
	
	para "Wanna battle?"
	done

.BeatenText:
	text "Waaah!"
	done
	
TrainerRoute13_4:
	generictrainer SWIMMERF, GISELE, EVENT_BEAT_ROUTE_13_TRAINER_4, .SeenText, .BeatenText

	text "I think I'll head"
	line "back to shore now…"
	done

.SeenText:
	text "I know I'm dressed"
	line "to swim, but I"
	cont "usually just stay"
	cont "on the shore."
	done

.BeatenText:
	text "I'm washed up!"
	done
	
TrainerRoute13_5:
	generictrainer TUBER, SOFIE, EVENT_BEAT_ROUTE_13_TRAINER_5, .SeenText, .BeatenText

	text "Someday I'll learn"
	line "to swim without"
	cont "my tube."
	
	para "But not today!"
	done

.SeenText:
	text "I love floating"
	line "on the water but I"
	cont "can't swim."
	
	para "That's what my tube"
	line "is for!"
	done

.BeatenText:
	text "That was fun!"
	done
	