Route23_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 1 ; warp events
	warp_event 21,  1, CROSSROADS, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost  2, 24, SIGNPOST_JUMPTEXT, Route23SignText
	signpost 10,  5, SIGNPOST_JUMPTEXT, Route23FightingDojoSignText

	db 14 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_PICNICKER, 16, 30, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 0, Route23Trainer1, -1
	person_event SPRITE_BLACK_BELT, 38, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer2, -1
	person_event SPRITE_GENTLEMAN, 20, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer3, -1
	person_event SPRITE_GRANNY, 26, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route23Trainer4, -1
	person_event SPRITE_SUPER_NERD, 45, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer5, -1
	person_event SPRITE_BURGLAR, 42, 20, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, Route23Trainer6, -1
	person_event SPRITE_FISHER, 44,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route23Fisher, -1
	person_event SPRITE_BLACK_BELT, 29, 31, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route23BlackBelt, -1
	person_event SPRITE_GRAMPS,  2, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route23WindyMan, -1
	itemball_event 21, 14, POTION, 1, EVENT_ROUTE_23_POKE_BALL_1
	itemball_event  2, 46, POTION, 1, EVENT_ROUTE_23_POKE_BALL_2
	itemball_event 13, 38, POTION, 1, EVENT_ROUTE_23_POKE_BALL_3


	const_def 1 ; object constants
	const ROUTE_23_LEAF_1
	const ROUTE_23_LEAF_2
	const ROUTE_23_TRAINER_1
	const ROUTE_23_TRAINER_2
	const ROUTE_23_TRAINER_3
	const ROUTE_23_TRAINER_4
	const ROUTE_23_TRAINER_5
	const ROUTE_23_TRAINER_6
	const ROUTE_23_FISHER
	const ROUTE_23_BLACKBELT

Route23Callback:
	callasm Route23SetUpLeaves
	readvar VAR_PLAYER_COLOR
	if_equal 6, .pink
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	disappear ROUTE_23_LEAF_2
	movetoplayer ROUTE_23_LEAF_2
	appear ROUTE_23_LEAF_2
	return
.pink
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	setevent EVENT_HIDE_OW_OBJECTS_PINK
	disappear ROUTE_23_LEAF_1
	movetoplayer ROUTE_23_LEAF_1
	appear ROUTE_23_LEAF_1
	return

Route23SetUpLeaves:
	ld a, 5
	ld [wRanchRaceSeconds], a
	xor a
	ld [wRanchRaceFrames], a
	ret
	
Route23WindyMan:
	checkflag ENGINE_WINDY_DAY
	iftrue .windy
	jumptextfaceplayer Route23WindyManText1
.windy
	jumptextfaceplayer Route23WindyManText2
	
Route23WindyManAsm:
	ld hl, wDailyFlags2
	bit 7, [hl] ; ENGINE_WINDY_DAY
	jr z, .notset
	ld a, 1
	ld [wScriptVar], a
	ret
.notset
	xor a
	ld [wScriptVar], a
	ret
	
Route23WindyManText1:
	text "Strong gusts of"
	line "wind often blow"
	cont "the leaves around."
	
	para "Different #MON"
	line "show themselves"
	cont "on windy days."
	
	para "Today doesn't"
	line "seem too windy…"
	done
	
Route23WindyManText2:
	text "See the trees"
	line "swaying and the"
	cont "leaves blowing in"
	cont "the wind?"
	
	para "Today's a windy"
	line "day!"
	
	para "Different #MON"
	line "show themselves"
	cont "on windy days."
	done
	
Route23Trainer1:
	generictrainer PICNICKER, LES, EVENT_BEAT_ROUTE_23_TRAINER_1, .SeenText, .BeatenText

	text "I'm talking to my"
	line "friend in VIOLET"
	cont "CITY in the JOHTO"
	cont "REGION."
	done

.SeenText:
	text "Uh-huh. Yeah, and"
	line "you know…"

	para "Pardon? Battle?"
	line "I'm on the phone."

	para "Oh, all right. But"
	line "make it fast."
	done

.BeatenText:
	text "Oh! I've got to"
	line "relieve my anger!"
	done
	
Route23Trainer2:
	generictrainer BLACKBELT_T, SHINZO, EVENT_BEAT_ROUTE_23_TRAINER_2, .SeenText, .BeatenText

	text "The MASTER teaches"
	line "us the way of both"
	cont "martial arts and"
	cont "#MON battles."
	done

.SeenText:
	text "I have trained for"
	line "today!"
	
	para "I will show you"
	line "the power I have"
	cont "obtained!"
	done
	
.BeatenText:
	text "It's finished…"
	done
	
Route23Trainer3:
	generictrainer GENTLEMAN, VICTOR, EVENT_BEAT_ROUTE_23_TRAINER_3, .SeenText, .BeatenText

	text "In weather like"
	line "this, I am at"
	cont "peace…"
	done

.SeenText:
	text "The falling"
	line "leaves…"
	
	para "The cool air…"
	
	para "It makes me want"
	line "to battle!"
	done

.BeatenText:
	text "Good show!"
	done
	
Route23Trainer4:
	generictrainer LADY, LYDIA, EVENT_BEAT_ROUTE_23_TRAINER_4, .SeenText, .BeatenText

	text "You and your"
	line "#MON are simply"
	cont "delightful!"
	done

.SeenText:
	text "Ah."
	
	para "A TRAINER."
	
	para "How delightful!"
	done

.BeatenText:
	text "Delightful!"
	done
	
Route23Trainer5:
	generictrainer SUPER_NERD, REMY, EVENT_BEAT_ROUTE_23_TRAINER_5, .SeenText, .BeatenText

	text "Itchy! Itchy!"
	
	para "My eczema!"
	
	para "I'm breaking out!"
	done

.SeenText:
	text "Guh…"
	
	para "I shouldn't be out"
	line "here."
	
	para "The fresh air isn't"
	line "good for my skin…"
	done

.BeatenText:
	text "ITCHY!"
	done
	
Route23Trainer6:
	generictrainer BURGLAR, CHASE, EVENT_BEAT_ROUTE_23_TRAINER_6, .SeenText, .BeatenText

	text "Ok so I'm hiding in"
	line "the leaves!"
	
	para "Can't a guy hide in"
	line "the leaves?"
	done

.SeenText:
	text "Hiding in the"
	line "leaves?"
	
	para "Who's hiding in"
	line "the leaves?"
	
	para "I'm not hiding in"
	line "the leaves!"
	done

.BeatenText:
	text "Gah!"
	done
	
Route23SignText:
	text "ROUTE 23"
	done
	
Route23FightingDojoSignText:
	text "FIGHTING DOJO"
	done
	
Route23Fisher:
	faceplayer
	opentext
	checkitem SUPER_ROD
	iftrue .got_rod
	writetext Route23FisherText1
	waitbutton
	verbosegiveitem SUPER_ROD
.got_rod
	writetext Route23FisherText2
	waitbutton
	closetext
	spriteface ROUTE_23_FISHER, LEFT
	end
	
Route23BlackBelt:
	checkevent EVENT_ROUTE_23_TALKED_TO_BLACKBELT
	iftrue .talked
	opentext
	writetext Route23BlackBeltText1
	pause 20
	closetext
	applyonemovement ROUTE_23_BLACKBELT, turn_step_right
	playsound SFX_MOVE_PUZZLE_PIECE
	earthquake 5
	waitsfx
	pause 20
	opentext
	writetext Route23BlackBeltText2
	waitbutton
	closetext
	pause 20
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_23_BLACKBELT, 15
	faceplayer
	opentext
	writetext Route23BlackBeltText3
	waitbutton
	closetext
	spriteface ROUTE_23_BLACKBELT, RIGHT
	pause 20
	opentext
	writetext Route23BlackBeltText4
	waitbutton
	closetext
	pause 10
.talked
	faceplayer
	opentext
	writetext Route23BlackBeltText5
	waitbutton
	closetext
	pause 10
	spriteface ROUTE_23_BLACKBELT, RIGHT
	opentext
	writetext Route23BlackBeltText1
	pause 20
	closetext
	applyonemovement ROUTE_23_BLACKBELT, turn_step_right
	playsound SFX_MOVE_PUZZLE_PIECE
	earthquake 5
	waitsfx
	setevent EVENT_ROUTE_23_TALKED_TO_BLACKBELT
	end
	
Route23BlackBeltText1:
	text "HIYAAAH!"
	done
	
Route23BlackBeltText2:
	text "Tch!"
	
	para "No good…"
	done
	
Route23BlackBeltText3:
	text "MASTER!"
	line "I-"
	
	para "Oh, you aren't"
	line "the MASTER."
	done
	
Route23BlackBeltText4:
	text "A huge gust of"
	line "wind came and blew"
	cont "this tree down."
	
	para "It's blocking the"
	line "path and causing"
	cont "all sorts of"
	cont "trouble."
	
	para "I've been trying to"
	line "move it, but my"
	cont "STRENGTH is insuf-"
	cont "ficient…"
	
	para "The MASTER would"
	line "be disappointed…"
	done
	
Route23BlackBeltText5:
	text "I train under a"
	line "great MARTIAL ARTS"
	cont "MASTER in a DOJO"
	cont "nearby."
	
	para "Surely his mighty"
	line "STRENGTH would be"
	cont "enough to move"
	cont "such a tree."
	
	para "But I dare not"
	line "run back to the"
	cont "MASTER with my"
	cont "tail between my"
	cont "legs…"
	done
	
Route23FisherText1:
	text "Well, hi."
	
	para "It's not everyday I"
	line "see someone else"
	cont "at this little"
	cont "pond."
	
	para "Why don't you stick"
	line "around and fish"
	cont "for a while?"
	
	para "I could use the"
	line "company."
	
	para "Here, you can use"
	line "this."
	done
	
Route23FisherText2:
	text "That SUPER ROD is"
	line "as good as they"
	cont "come!"
	
	para "With it you should"
	line "be able to land"
	cont "some seriously"
	cont "super #MON!"
	done
	
Route23Windy_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	