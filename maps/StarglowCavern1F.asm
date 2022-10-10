StarglowCavern1F_MapScriptHeader:
	db 2 ; scene scripts
	scene_script StarglowCavern1FTrigger0
	scene_script StarglowCavern1FTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, StarglowCavern1FCallback

	db 4 ; warp events
	warp_def 29, 5, 1, ROUTE_3
	warp_def 27, 31, 1, ROUTE_3_EAST
	warp_def 5, 23, 1, STARGLOW_CAVERN_2F
	warp_def 11, 33, 2, STARGLOW_CAVERN_2F

	db 1 ; coord events
	xy_trigger 0, 19, 34, 0, StarglowCavernNuggeyManStopsYou, 0, 0

	db 1 ; bg events
	bg_event  2, 14, SIGNPOST_ITEM + RARE_CANDY, EVENT_STARGLOW_CAVERN_1F_HIDDEN_ITEM

	db 12 ; object events
	person_event SPRITE_HIKER, 22, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerStarglowCavern_1, -1
	person_event SPRITE_HIKER, 11, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerStarglowCavern_2, -1
	person_event SPRITE_HIKER, 5, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerStarglowCavern_3, -1
	person_event SPRITE_HIKER, 19, 35, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, StarglowCavern1FNPC1, -1
	itemball_event 11,  4, LIGHT_CLAY, 1, EVENT_STARGLOW_CAVERN_1F_POKE_BALL1
	itemball_event  3, 14, RARE_CANDY, 1, EVENT_STARGLOW_CAVERN_1F_POKE_BALL3
	person_event SPRITE_DISGUISEMAN, 19, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, StarglowCavern1FNPC2, EVENT_STARGLOW_CAVERN_1F_POKE_BALL2
	person_event SPRITE_FAT_GUY, 19, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_STARGLOW_CAVERN_DISGUISEMAN
	person_event SPRITE_FAT_GUY,  0,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_STARGLOW_CAVERN_DISGUISEMAN_2
	person_event SPRITE_FAT_GUY, 20, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_STARGLOW_CAVERN_DISGUISEMAN_2
	smashrock_event 13, 24
	smashrock_event 15, 16
	smashrock_event 16,  7
	
	const_def 1 ; object constants
	const STARGLOWCAVERN_TRAINER1
	const STARGLOWCAVERN_TRAINER2
	const STARGLOWCAVERN_TRAINER3
	const STARGLOWCAVERN_NUGGETMAN
	const STARGLOWCAVERN_POKEBALL
	const STARGLOWCAVERN_POKEBALL2
	const STARGLOWCAVERN_TRAINER4_POKEBALL
	const STARGLOWCAVERN_DISGUISEMAN
	const STARGLOWCAVERN_DISGUISEMAN2
	const STARGLOWCAVERN_DISGUISEMAN3
	
StarglowCavern1FTrigger0:
	end
	
StarglowCavern1FTrigger1:
	end
	
StarglowCavern1FCallback:
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	return
	
TrainerStarglowCavern_1:
	generictrainer HIKER, DOUG, EVENT_BEAT_STARGLOW_CAVERN_1F_TRAINER_1, .SeenText, .BeatenText

	text "GRASS or WATER"
	line "#MON would"
	cont "probably do great"
	cont "around here."
	done

.SeenText:
	text "You'll find a bunch"
	line "of ROCK TYPE #-"
	cont "MON in this cave."
	
	para "Hope you're"
	line "prepared!"
	done

.BeatenText:
	text "That's the way!"
	done
	
TrainerStarglowCavern_2:
	generictrainer HIKER, WILL, EVENT_BEAT_STARGLOW_CAVERN_1F_TRAINER_2, .SeenText, .BeatenText

	text "This cave is"
	line "great!"
	
	para "So many great ROCK"
	line "#MON!"
	done

.SeenText:
	text "HIKERS love caves!"
	
	para "I don't know why,"
	line "but we just do!"
	done

.BeatenText:
	text "Oh yeah!"
	done
	
TrainerStarglowCavern_3:
	generictrainer HIKER, ROB, EVENT_BEAT_STARGLOW_CAVERN_1F_TRAINER_3, .SeenText, .BeatenText

	text "Don't worry."
	
	para "This cave is"
	line "straightforward."
	
	para "You can't really"
	line "get lost in here."
	done

.SeenText:
	text "Hehehe…"
	
	para "What's wrong, kid?"
	
	para "Lost?"
	done

.BeatenText:
	text "What's that?"
	
	para "I lost?"
	done
	
StarglowCavernNuggeyManStopsYou:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, STARGLOWCAVERN_NUGGETMAN, 15
	pause 7
	spriteface PLAYER, RIGHT	
StarglowCavern1FNPC1:
	checkevent EVENT_GOT_NUGGET_FROM_STARGLOW_CAVERN_HIKER
	iftrue .alreadygotnugget
	checkevent EVENT_STARGLOW_CAVERN_DISGUISEMAN_FINISHED
	iftrue .didntgetnuggetlasttime
	opentext
	writetext StarglowCavern_NuggetManText1
	buttonsound
	verbosegiveitem NUGGET
	writetext StarglowCavern_NuggetManText2
	waitbutton
	closetext
	variablesprite SPRITE_DISGUISEMAN, SPRITE_FAT_GUY
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement STARGLOWCAVERN_TRAINER4_POKEBALL, Movement_StarglowCavern_DisguiseMan2
	disappear STARGLOWCAVERN_TRAINER4_POKEBALL
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	appear STARGLOWCAVERN_DISGUISEMAN3
	applymovement STARGLOWCAVERN_DISGUISEMAN3, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text5
	waitbutton
	closetext
	spriteface STARGLOWCAVERN_DISGUISEMAN3, UP
	spriteface PLAYER, DOWN
	opentext
	writetext StarglowCavern_DisguiseMan1Text6
	waitbutton
	closetext
	applymovement STARGLOWCAVERN_DISGUISEMAN3, Movement_StarglowCavern_DisguiseMan2
	disappear STARGLOWCAVERN_DISGUISEMAN3
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	pause 7
	spriteface PLAYER, RIGHT
	opentext
	writetext StarglowCavern_NuggetManText3
	waitbutton
	closetext
	dotrigger $1
	setevent EVENT_GOT_NUGGET_FROM_STARGLOW_CAVERN_HIKER
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN_2
	setevent EVENT_STARGLOW_CAVERN_1F_POKE_BALL2
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN_FINISHED
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	end
.alreadygotnugget:
	opentext
	writetext StarglowCavern_NuggetManText4
	waitbutton
	closetext
	end
.didntgetnuggetlasttime:
	opentext
	writetext StarglowCavern_NuggetManText5
	waitbutton
	closetext
	end
	
StarglowCavern1FNPC2:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_FAT_GUY
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement STARGLOWCAVERN_TRAINER4_POKEBALL, Movement_StarglowCavern_DisguiseMan1
	appear STARGLOWCAVERN_DISGUISEMAN
	opentext
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	disappear STARGLOWCAVERN_TRAINER4_POKEBALL
	spriteface STARGLOWCAVERN_DISGUISEMAN, RIGHT
	opentext
	writetext StarglowCavern_DisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN_2
	setevent EVENT_STARGLOW_CAVERN_1F_POKE_BALL2
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN_FINISHED
	dotrigger $1
	winlosstext StarglowCavern1FDisguisemanBeatenText, 0
	setlasttalked STARGLOWCAVERN_TRAINER4_POKEBALL
	loadtrainer DISGUISE, MASTER_1
	startbattle
	reloadmapafterbattle
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	opentext
	writetext StarglowCavern_DisguiseMan1Text3_boy
	waitbutton
	closetext
	jump .cont
.girl
	opentext
	writetext StarglowCavern_DisguiseMan1Text3_girl
	waitbutton
	closetext
.cont
	applymovement STARGLOWCAVERN_DISGUISEMAN, Movement_StarglowCavern_DisguiseMan2
	disappear STARGLOWCAVERN_DISGUISEMAN
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	end

StarglowCavern_DisguiseMan1Text1:
	text "Ohohohoho!"
	
	para "Appearing right,"
	line "before your eyes!"
	
	para "'Tis I, the MASTER"
	line "OF DISGUISE!"
	done
	
StarglowCavern_DisguiseMan1Text2:
	text "This item looked "
	line "so free to take,"
	
	para "but now you real-"
	line "ize your mistake."
	
	para "If you'd talked to"
	line "him over there,"
	
	para "you could've passed"
	line "without a care."
	
	para "He's not a TRAINER"
	line "can't you see?"
	
	para "I cannot say the"
	line "same for me."
	
	para "But, greed, it got"
	line "the best of you,"
	
	para "and now there's no-"
	line "thing you can do,"
	
	para "but see that your"
	line "and my eyes meet."
	
	para "So now prepare"
	line "for your defeat!"
	done
	
StarglowCavern_DisguiseMan1Text3_boy:
	text "A TRAINER strong,"
	line "and handsome, too."
	
	para "It seem's that I"
	line "have lost to you."
	
	para "Someday I'll cut"
	line "you down to size,"
	
	para "for I'm the MASTER"
	line "OF DISGUISE!"
	done
	
StarglowCavern_DisguiseMan1Text3_girl:
	text "A TRAINER strong,"
	line "and pretty, too."
	
	para "It seem's that I"
	line "have lost to you."
	
	para "Someday I'll cut"
	line "you down to size,"
	
	para "for I'm the MASTER"
	line "OF DISGUISE!"
	done
	
StarglowCavern_DisguiseMan1Text4:
	text "Ohohohoho!"
	done
	
StarglowCavern_DisguiseMan1Text5:
	text "Appearing right,"
	line "before your eyes!"
	
	para "'Tis I, the MASTER"
	line "OF DISGUISE!"
	done
	
StarglowCavern_DisguiseMan1Text6:
	text "Correct! Correct!"
	line "How did you know"
	
	para "this was the way"
	line "that you should"
	cont "go?"
	
	para "You saw the item"
	line "over there."
	
	para "It seems like you"
	line "just didn't care."
	
	para "To this man you"
	line "chose to speak."
	
	para "Are your #MON"
	line "not weak?"
	
	para "If you'd come and"
	line "spoken to me,"
	
	para "in a battle you"
	line "would be."
	
	para "So keep in mind,"
	line "don't trust your"
	cont "eyes,"
	
	para "for I'm the MASTER"
	line "OF DISGUISE!"
	done
	
StarglowCavern_NuggetManText1:
	text "Woah!"
	
	para "Someone actually"
	line "decided to take"
	cont "this path!"
	
	para "I'm not sure why,"
	line "but most people"
	cont "who pass by here"
	cont "go on the other"
	cont "side."
	
	para "Is it because they"
	line "think I'm going to"
	cont "pick a fight?"
	
	para "Anyway, you're the"
	line "first person I've"
	cont "talked to in quite"
	cont "some time."
	
	para "As thanks for you"
	line "stopping by,"
	
	para "I want you to"
	line "have this."
	done
	
StarglowCavern_NuggetManText2:
	text "That NUGGET is"
	line "worth a lot of"
	cont "money."
	
	para "Make sure not to"
	line "spend it all at"
	cont "one time!"
	done
	
StarglowCavern_NuggetManText3:
	text "What a weird guy…"
	done
	
StarglowCavern_NuggetManText4:
	text "Thanks again for"
	line "stopping by!"
	done
	
StarglowCavern_NuggetManText5:
	text "I saw you pass by"
	line "here a while ago."
	
	para "I was going to"
	line "give you something"
	cont "if you came and"
	cont "talked to me,"
	
	para "but someone else"
	line "came along and I"
	cont "gave it to them."
	
	para "Sorry, kid."
	done
	
StarglowCavern1FDisguisemanBeatenText:
	text "Kept your footing."
	line "Nice and steady!"
	
	para "I guess it's I who"
	line "wasn't ready…"
	done
	
Movement_StarglowCavern_DisguiseMan1:
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 12
	step_end

Movement_StarglowCavern_DisguiseMan2:
	turn_head_down
	step_sleep 12
	turn_head_left
	step_sleep 6
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end