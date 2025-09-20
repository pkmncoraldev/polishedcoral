Route23_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 2 ; warp events
	warp_event  7,  1, ROUTE_23_GATE, 3
	warp_event  6, 15, FIGHTING_DOJO, 1

	db 6 ; coord events
	coord_event 30, 35, 0, Route23BlackBeltStart
	coord_event 30, 35, 2, Route23Master1
	coord_event 30, 34, 2, Route23Master2
	coord_event 31, 34, 2, Route23Master3
	coord_event 30, 36, 2, Route23Master4
	coord_event 31, 36, 2, Route23Master5

	db 11 ; bg events
	signpost  8, 24, SIGNPOST_JUMPTEXT, Route23SignText
	signpost 16,  5, SIGNPOST_JUMPTEXT, Route23FightingDojoSignText
	signpost  2, 21, SIGNPOST_ITEM + GOLD_LEAF, EVENT_ROUTE_23_HIDDEN_GOLD_LEAF_1
	signpost 22, 12, SIGNPOST_ITEM + GOLD_LEAF, EVENT_ROUTE_23_HIDDEN_GOLD_LEAF_2
	signpost 26, 35, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_23_HIDDEN_SILVER_LEAF_1
	signpost 44, 33, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_23_HIDDEN_SILVER_LEAF_2
	signpost 45, 18, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_23_HIDDEN_SILVER_LEAF_3
	signpost 47,  6, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_23_HIDDEN_SILVER_LEAF_4
	signpost 34, 32, SIGNPOST_IFNOTSET, Route23FallenTree
	signpost 35, 32, SIGNPOST_IFNOTSET, Route23FallenTree
	signpost 32, 14, SIGNPOST_IFNOTSET, Route23Secret

	db 20 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_YOUNGSTER, 23, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer1, -1
	person_event SPRITE_BLACK_BELT, 48, 29, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer2, -1
	person_event SPRITE_GENTLEMAN, 27, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route23Trainer3, -1
	person_event SPRITE_GRANNY, 32, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, Route23Trainer4, -1
	person_event SPRITE_SUPER_NERD, 51, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer5, -1
	person_event SPRITE_BURGLAR, 46, 20, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, Route23Trainer6, -1
	person_event SPRITE_BATTLE_GIRL, 33,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route23Trainer7, -1
	person_event SPRITE_COOLTRAINER_M, 22, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route23Trainer8, -1
	person_event SPRITE_FISHER, 50,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route23Fisher, -1
	person_event SPRITE_BLACK_BELT, 35, 31, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route23BlackBelt, EVENT_GOT_HM04_STRENGTH
	person_event SPRITE_MASTER, 34, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_CUTE_GIRL, 34, 35, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route23NPC1, -1
	person_event SPRITE_FAT_GUY,  7, 20, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route23NPC2, -1
	itemball_event 21, 20, HYPER_POTION, 1, EVENT_ROUTE_23_POKE_BALL_1
	itemball_event  2, 52, EVERSTONE, 1, EVENT_ROUTE_23_POKE_BALL_2
	itemball_event 13, 44, SILVER_LEAF, 1, EVENT_ROUTE_23_POKE_BALL_3
	itemball_event 19, 40, PP_UP, 1, EVENT_ROUTE_23_POKE_BALL_4
	itemball_event  8,  5, GOLD_LEAF, 1, EVENT_ROUTE_23_POKE_BALL_5

	const_def 1 ; object constants
	const ROUTE_23_LEAF_1
	const ROUTE_23_LEAF_2
	const ROUTE_23_TRAINER_1
	const ROUTE_23_TRAINER_2
	const ROUTE_23_TRAINER_3
	const ROUTE_23_TRAINER_4
	const ROUTE_23_TRAINER_5
	const ROUTE_23_TRAINER_6
	const ROUTE_23_TRAINER_7
	const ROUTE_23_TRAINER_8
	const ROUTE_23_FISHER
	const ROUTE_23_BLACKBELT
	const ROUTE_23_MASTER
	const ROUTE_23_NPC_1
	const ROUTE_23_NPC_2

Route23Callback:
	checkevent EVENT_GOT_HM04_STRENGTH
	iffalse .skip_tree
	changeblock $20, $22, $cc
.skip_tree
Route23Callback2:
	clearevent EVENT_SET_ROUTE_27
	clearevent EVENT_ON_ROUTE_27
	readvar VAR_PLAYER_COLOR
	if_equal 6, .pink
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	disappear ROUTE_23_LEAF_2
	movetoplayer ROUTE_23_LEAF_2
	appear ROUTE_23_LEAF_2
	callasm Route23SetUpLeaves
	return
.pink
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	setevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	disappear ROUTE_23_LEAF_1
	movetoplayer ROUTE_23_LEAF_1
	appear ROUTE_23_LEAF_1
	callasm Route23SetUpLeaves
	return

Route23SetUpLeaves:
	ld a, 5
	ld [wRanchRaceSeconds], a
	xor a
	ld [wRanchRaceFrames], a
	ld a, [wPlayerSpriteX]
	add 100
	ld [wObject1SpriteX], a
	ret
	
Route23Secret:
	dw EVENT_GOT_ROUTE_23_SECRET
	opentext
	loadvar wScriptVar, MIRACLETONIC
	itemtotext $0, $0
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	setevent EVENT_GOT_ROUTE_23_SECRET
	specialsound
	itemnotify
	endtext
	special Special_IncSecretCounter
.bag_full
	buttonsound
	pocketisfull
	endtext
.found_text
	; found @ !
	text_jump UnknownText_0x1c0a1c
	db "@"
	
Route23FallenTree:
	dw EVENT_GOT_HM04_STRENGTH
	jumptext Route23FallenTreeText
	
Route23FallenTreeText:
	text "A huge fallen"
	line "tree blocks the"
	cont "way…"
	done
	
Route23NPC1:
	jumptextfaceplayer Route23NPC1Text
	
Route23NPC1Text:
	text "The fallen tree"
	line "has finally been"
	cont "cleared!"
	
	para "Thank goodness!"
	done
	
Route23NPC2:
	jumptextfaceplayer Route23NPC2Text
	
Route23NPC2Text:
	text "The leaves ahead"
	line "are a beautiful"
	cont "golden color."
	
	para "Occasionally you"
	line "can find extra"
	cont "beautiful ones."
	
	para "Keep an eye out!"
	done
	
Route23Master5:
	applyonemovement PLAYER, step_left
Route23Master4:
	applyonemovement PLAYER, step_up
	jump Route23Master1
Route23Master3:
	applyonemovement PLAYER, step_left
Route23Master2:
	applyonemovement PLAYER, step_down
Route23Master1:
	spriteface PLAYER, RIGHT
	pause 10
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
	writetext Route23BlackBeltText6
	waitbutton
	closetext
	pause 20
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_23_BLACKBELT, 15
	faceplayer
	opentext
	writetext Route23BlackBeltText7
	waitbutton
	closetext
	spriteface ROUTE_23_BLACKBELT, RIGHT
	pause 20
	opentext
	writetext Route23BlackBeltText8
	waitbutton
	closetext
	pause 10
	special Special_FadeOutMusic
	pause 40
	playmusic MUSIC_DOJO
	opentext TEXTBOX_UNKNOWN
	writetext Route23MasterText1
	waitbutton
	closetext
	pause 20
	spriteface ROUTE_23_BLACKBELT, DOWN
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_23_BLACKBELT, 15
	opentext
	writetext Route23BlackBeltText9
	waitbutton
	closetext
	pause 20
	playsound SFX_WATER_GUN
	appear ROUTE_23_MASTER
	spriteface ROUTE_23_MASTER, UP
	pause 2
	spriteface ROUTE_23_MASTER, DOWN
	pause 10
	spriteface ROUTE_23_BLACKBELT, UP
	spriteface PLAYER, UP
	pause 10
	opentext TEXTBOX_MASTER
	writetext Route23MasterText2
	waitbutton
	closetext
	pause 10
	applyonemovement ROUTE_23_BLACKBELT, turn_step_up
	opentext
	writetext Route23BlackBeltText10
	waitbutton
	closetext
	spriteface ROUTE_23_BLACKBELT, DOWN
	spriteface PLAYER, RIGHT
	pause 10
	special Special_FadeOutMusic
	pause 40
	opentext
rept 2
	playsound SFX_WHIRLWIND
	writetext Route23BlackBeltText11
	pause 70
	playsound SFX_POWDER
	writetext Route23BlackBeltText12
	pause 80
endr
	special FadeOutPalettesBlack
	closetext
	spriteface ROUTE_23_BLACKBELT, RIGHT
	spriteface ROUTE_23_NPC_1, LEFT
	opentext
	playsound SFX_WHIRLWIND
	writetext Route23BlackBeltText11
	pause 100
	playsound SFX_THUNDER
	writetext Route23BlackBeltText1
	waitsfx
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	waitsfx
	changeblock $20, $22, $cc
	pause 40
	closetext
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	opentext
	playsound SFX_POWDER
	writetext Route23BlackBeltText12
	pause 60
	closetext
	pause 20
	playmusic MUSIC_DOJO
	opentext TEXTBOX_MASTER
	writetext Route23MasterText3
	waitbutton
	closetext
	pause 10
	spriteface ROUTE_23_BLACKBELT, UP
	opentext
	writetext Route23BlackBeltText13
	waitbutton
	closetext
	applymovement ROUTE_23_BLACKBELT, Movement_Route23_BlackBelt
	disappear ROUTE_23_BLACKBELT
	applyonemovement PLAYER, step_right
	spriteface PLAYER, UP
	opentext TEXTBOX_MASTER
	writetext Route23MasterText4
	buttonsound
	changetextboxspeaker
	verbosegivetmhm HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
	setflag ENGINE_GOT_STRENGTH
	changetextboxspeaker TEXTBOX_MASTER
	writetext Route23MasterText5
	waitbutton
	closetext
	pause 20
	playsound SFX_WATER_GUN
	spriteface ROUTE_23_MASTER, UP
	pause 2
	disappear ROUTE_23_MASTER
	pause 20
	special Special_FadeOutMusic
	pause 40
	playmapmusic
	clearevent EVENT_FIGHTING_DOJO_MASTER_GONE
	dotrigger $1
	end

Route23Trainer1:
	generictrainer YOUNGSTER, KYLE, EVENT_BEAT_ROUTE_23_TRAINER_1, .SeenText, .BeatenText

	text "Maybe we should do"
	line "some more training"
	cont "before picking a"
	cont "fight…"
	done

.SeenText:
	text "Hey, how about a"
	line "battle real quick?"
	
	para "I wanna test my"
	line "new #MON."
	done

.BeatenText:
	text "Ah, dang!"
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

	text "Itchy! <WAIT_S>Itchy!"
	
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
	
Route23Trainer7:
	generictrainer BATTLE_GIRL, MAI, EVENT_BEAT_ROUTE_23_TRAINER_7, .SeenText, .BeatenText

	text "Thank you for"
	line "indulging me."
	
	para "We are told by our"
	line "MASTER to always"
	cont "keep up our train-"
	cont "ing."
	done

.SeenText:
	text "Excuse me."
	
	para "Are you going to"
	line "see the MASTER?"
	
	para "…"
	
	para "Battle with us!"
	done

.BeatenText:
	text "Thank you."
	done

Route23Trainer8:
	generictrainer COOLTRAINERM, TRIPP, EVENT_BEAT_ROUTE_23_TRAINER_8, .SeenText, .BeatenText

	text "Hmm…"
	
	para "Maybe I'm not ready"
	line "to fight that"
	cont "“MASTER” dude"
	cont "after all…"
	done

.SeenText:
	text "Man!"
	
	para "I heard that this"
	line "“MASTER” guy was"
	cont "supposed to be"
	cont "tough."
	
	para "The dude won't even"
	line "battle me!"
	done

.BeatenText:
	text "Gahh!"
	
	para "You're tough too!"
	done
	
Route23SignText:
	text "ROUTE 23"
	
	para "SOUTH:"
	line "KOMORE VILLAGE"
	done
	
Route23FightingDojoSignText:
	text "DOJO of"
	line "the MASTER"
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
	
Route23BlackBeltStart:
	spriteface PLAYER, RIGHT
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
	dotrigger $1
	end
	
Route23BlackBeltText1:
	text "HIYAAAH!"
	done
	
Route23BlackBeltText2:
	text "Tch!"
	
	para "No good…"
	done
	
Route23BlackBeltText3:
	text "MASTER! <WAIT_M>I-"
	
	para "Oh, <WAIT_S>you aren't"
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
	
	para "My MASTER would"
	line "be disappointed…"
	done
	
Route23BlackBeltText5:
	text "I train under a"
	line "great martial arts"
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
	
	para "If you wish to"
	line "know more about my"
	cont "MASTER, seek him"
	cont "out yourself."
	
	para "He resides in a"
	line "DOJO with an"
	cont "ornate black roof."
	
	para "You can't miss it."
	done
	
Route23BlackBeltText6:
	text "Still nothing!"
	done
	
Route23BlackBeltText7:
	text "MASTER! <WAIT_M>I-"
	
	para "Oh, <WAIT_S>it's you"
	line "again."
	done
	
Route23BlackBeltText8:
	text "I'm ready to just"
	line "give up and throw"
	cont "in the towel…"
	
	para "My MASTER would"
	line "be disappointed…"
	
	para "This should be no"
	line "problem for one"
	cont "trained under my"
	cont "MASTER…"
	
	para "I am a failure…"
	done
	
Route23BlackBeltText9:
	text "That voice…"
	
	para "MASTER!"
	done
	
Route23BlackBeltText10:
	text "Of course,"
	line "MASTER!"
	
	para "I'll try!"
	done
	
Route23BlackBeltText11:
	text "Inhale…"
	done
	
Route23BlackBeltText12:
	text "Exhale…"
	done
	
Route23BlackBeltText13:
	text "Thank you, MASTER."
	
	para "I still have much"
	line "to learn from you."
	
	para "I will head back"
	line "to the DOJO and"
	cont "resume my training"
	cont "at once."
	done
	
Route23MasterText1:
	text "You are a failure"
	line "only if you choose"
	cont "to let your past"
	cont "failures own you…"
	done
	
Route23MasterText2:
	text "Your heart is"
	line "troubled and your"
	cont "mind is clouded…"
	
	para "Have you forgotten"
	line "my teachings so"
	cont "easily?"
	
	para "Your STRENGTH does"
	line "not come only from"
	cont "within your body,"
	
	para "but from within"
	line "your mind…"
	
	para "Clear your mind"
	line "and your body will"
	cont "follow…"
	done
	
Route23MasterText3:
	text "Excellent…"
	
	para "You have done"
	line "well…"
	done
	
Route23MasterText4:
	text "He possessed the"
	line "STRENGTH inside"
	cont "himself the entire"
	cont "time…"
	
	para "As do you and your"
	line "#MON…"
	
	para "Take this,"
	line "child…"
	done
	
Route23MasterText5:
	text "That HM contains"
	line "the move STRENGTH…"
	
	para "It will summon the"
	line "power your #MON"
	cont "possess to move"
	cont "heavy objects such"
	cont "as boulders or"
	cont "fallen trees…"
	
	para "…"
	
	para "Your quest next"
	line "takes you to"
	cont "OBSCURA CITY."
	
	para "You will seek out"
	line "a young man named"
	cont "ROCKY."
	
	para "He's the curator of"
	line "the museum there."
	
	para "He is also a GYM"
	line "LEADER."
	
	para "I must warn you…"
	
	para "I sense much hard-"
	line "ship on the way."
	
	para "You should prepare"
	line "for anything and"
	cont "remain vigilant."
	
	para "Heed my warning,"
	line "and make sure you"
	cont "are well stocked"
	cont "for the road."
	
	para "Return to my DOJO"
	line "if you wish to"
	cont "resume your"
	cont "training."

	para "Until we meet"
	line "again, child…"
	
	para "Farewell…"
	done
	
	
Route23FisherText1:
	text "Well, <WAIT_S>hi."
	
	para "It's not everyday I"
	line "see someone else"
	cont "at this little"
	cont "pond."
	
	para "Why don't you stick"
	line "around and fish"
	cont "for a while?"
	
	para "I could use the"
	line "company."
	
	para "Here, <WAIT_S>you can use"
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
	
Movement_Route23_BlackBelt:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
Route23Windy_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	