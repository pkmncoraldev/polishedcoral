Route6_MapScriptHeader:
	db 3 ; scene scripts
	
	scene_script Route6Trigger0
	scene_script Route6Trigger1
	scene_script Route6Trigger2

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 5, 59, 3, ROUTE_5_GATE

	db 4 ; coord events
	xy_trigger 0, 6, 43, 0, Route6PokeFanM, 0, 0
	xy_trigger 0, 7, 44, 0, Route6PokeFanF, 0, 0
	xy_trigger 1, 6, 43, 0, Route6PokeFanM, 0, 0
	xy_trigger 1, 7, 44, 0, Route6PokeFanF, 0, 0

	db 3 ; bg events
	signpost 6, 60, SIGNPOST_READ, Route45HouseSign
	signpost 3, 26, SIGNPOST_READ, Route45LakeSign
	bg_event 8, 4, SIGNPOST_ITEM + ULTRA_BALL, EVENT_ROUTE_6_HIDDEN_ULTRA_BALL

	db 12 ; object events
	person_event SPRITE_CUTE_GIRL, 13, 52, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route6Lass2, -1
	person_event SPRITE_PSYDUCK, 13, 51, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route6Psyduck, -1
	person_event SPRITE_CAMPER, 8, 43, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute6_2, -1
	person_event SPRITE_PICNICKER, 8, 44, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute6_1, -1
	person_event SPRITE_POKEFAN_M, 6, 39, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6_3, -1
	person_event SPRITE_POKEFAN_F, 7, 40, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6_4, -1
	person_event SPRITE_GRANNY, 4, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6_5, -1
	person_event SPRITE_LASS, 4, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute6_6, -1
	person_event SPRITE_GENTLEMAN, 6, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute6_7, -1
	person_event SPRITE_BATTLE_GIRL, 9, 60, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route6Lass3, -1
	person_event SPRITE_FAT_GUY, 6, 23, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route6Fisher, -1
	tmhmball_event  19, 2, TM_THUNDERPUNCH, 1, EVENT_ROUTE_6_POKE_BALL_THUNDERPUNCH
	
	const_def 1 ; object constants
	const ROUTE6LASS2
	const ROUTE6PSYDUCK
	const ROUTE6TRAINER1
	const ROUTE6TRAINER2
	const ROUTE6TRAINER3
	const ROUTE6TRAINER4
	const ROUTE6TRAINER5
	const ROUTE6TRAINER6
	const ROUTE6TRAINER7
	const ROUTE6LASS3
	const ROUTE6FISHER
	const ROUTE6POKEBALL_THUNDERPUNCH
	
Route6Trigger0:
	end
	
Route6Trigger1:
	end
	
Route6Trigger2:
	end
	
Route6PokeFanM:
	checkevent EVENT_BEAT_ROUTE_6_TRAINER_3
	iftrue .end
	playmusic MUSIC_HIKER_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE6TRAINER3,  30
	applymovement ROUTE6TRAINER3, Movement_Route6_PokeFanM
	spriteface PLAYER, LEFT
	opentext
	writetext TrainerRoute6_3SeenText2
	waitbutton
	closetext
	winlosstext TrainerRoute6_3BeatenText, 0
	setlasttalked ROUTE6TRAINER3
	loadtrainer POKEFANM, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_6_TRAINER_3
.end
	end
	
Route6PokeFanF:
	checkevent EVENT_BEAT_ROUTE_6_TRAINER_4
	iftrue .end
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	showemote EMOTE_SHOCK, ROUTE6TRAINER4,  30
	applymovement ROUTE6TRAINER4, Movement_Route6_PokeFanF
	spriteface PLAYER, LEFT
	opentext
	writetext TrainerRoute6_4SeenText2
	waitbutton
	closetext
	winlosstext TrainerRoute6_4BeatenText, 0
	setlasttalked ROUTE6TRAINER4
	loadtrainer POKEFANF, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROUTE_6_TRAINER_4
.end
	end
	
TrainerRoute6_1:
	generictrainer PICNICKER, BETH, EVENT_BEAT_ROUTE_6_TRAINER_1, .SeenText, .BeatenText

	text "This is the worst"
	line "date ever…"
	done

.SeenText:
	text "My boyfriend and"
	line "I came here to be"
	cont "alone,"
	
	para "but then those two"
	line "creeps showed up…"
	done

.BeatenText:
	text "VINCENT!"
	
	para "They beat me!"
	done
	
TrainerRoute6_2:
	generictrainer CAMPER, VINCENT, EVENT_BEAT_ROUTE_6_TRAINER_2, .SeenText, .BeatenText

	text "Can you tell those"
	line "two to go away?"
	
	para "They're totally"
	line "ruining my mojo!"
	done

.SeenText:
	text "Those two old"
	line "people just showed"
	cont "up out of nowhere."
	
	para "They're really"
	line "killing the mood."
	done

.BeatenText:
	text "Arrgghh!"
	done
	
TrainerRoute6_3:
	generictrainer POKEFANM, RON, EVENT_BEAT_ROUTE_6_TRAINER_3, .SeenText, .BeatenText

	text "Hey, you're pretty"
	line "good!"
	
	para "Have any tips?"
	done

.SeenText:
	text "Huh?"
	
	para "Oh, wow."
	
	para "You actually want"
	line "to battle me?"
	
	para "Well, that's a"
	line "first!"	
	done

.BeatenText:
	text "HAHA- Wait…"
	
	para "What?"
	done
	
TrainerRoute6_4:
	generictrainer POKEFANF, SUSAN, EVENT_BEAT_ROUTE_6_TRAINER_4, .SeenText, .BeatenText

	text "Leave!"
	
	para "You've done"
	line "enough!"
	done

.SeenText:
	text "Hello, there."
	
	para "I see you're a"
	line "TRAINER too."
	
	para "Do you want to"
	line "battle?"
	done

.BeatenText:
	text "No!"
	
	para "My beautiful"
	line "#MON!"
	done
	
TrainerRoute6_5:
	generictrainer LADY, RUTH, EVENT_BEAT_ROUTE_6_TRAINER_5, .SeenText, .BeatenText

	text "Can you believe"
	line "they won't let me"
	
	para "on the boat to"
	line "the island?"
	
	para "Me!?"
	done

.SeenText:
	text "My fool of a"
	line "husband lost our"
	cont "ISLAND TICKETS!"
	
	para "Now they won't let"
	line "us on the boat!"
	
	para "A LADY must keep"
	line "composure, but a"
	
	para "TRAINER can freely"
	line "vent their"
	cont "frustrations!"	
	done

.BeatenText:
	text "How uncouth!"
	done
	
TrainerRoute6_6:
	generictrainer LASS, SARAH, EVENT_BEAT_ROUTE_6_TRAINER_6, .SeenText, .BeatenText

	text "Fine! I'll admit"
	line "it!"
	
	para "I haven't ever been"
	line "to SUNBEAM ISLAND…"
	done

.SeenText:
	text "Have you been to"
	line "SUNBEAM ISLAND?"
	
	para "Anyone who's anyone"
	line "has been there."
	done

.BeatenText:
	text "What? But how?"
	done
	
TrainerRoute6_7:
	generictrainer GENTLEMAN, DURWOOD, EVENT_BEAT_ROUTE_6_TRAINER_7, .SeenText, .BeatenText

	text "I actually found"
	line "the tickets."
	
	para "They were in my"
	line "trousers instead"
	cont "of my jacket."
	
	para "It's too late to"
	line "tell her now."
	
	para "I'll just be in"
	line "even more trouble."
	done

.SeenText:
	text "My wife threw a"
	line "fit when she found"
	
	para "out I lost our"
	line "tickets to the"
	cont "island."
	done

.BeatenText:
	text "Not bad."
	done
	
Route6Lass2:
	faceplayer
	opentext
	writetext Route6Lass2Text
	waitbutton
	closetext
	spriteface ROUTE6LASS2, DOWN
	end
	
Route6Psyduck:
	opentext
	writetext Route6PsyducklText
	cry PSYDUCK
	waitbutton
	closetext
	end
	
Route6Lass3:
	jumptextfaceplayer Route6Lass3Text
	
Route6Fisher:
	jumptextfaceplayer Route6FisherText
	
Route45HouseSign:
	jumptext Route45HouseSignText
	
Route45LakeSign:
	jumptext Route45LakeSignText
	
TrainerRoute6_3SeenText1:
	text "Huh?"
	
	para "Oh, wow."
	
	para "You actually want"
	line "to battle me?"
	
	para "Well, that's a"
	line "first!"	
	done
	
TrainerRoute6_3BeatenText:
	text "HAHA- Wait…"
	
	para "What?"
	done
	
TrainerRoute6_3NormalText:
	text "Hey, you're pretty"
	line "good!"
	
	para "Have any tips?"
	done
	
TrainerRoute6_3SeenText2:
	text "I saw you trying"
	line "to get by here"
	cont "without a battle!"
	
	para "Well, now you have"
	line "to battle me!"
	done
		
TrainerRoute6_4SeenText1:
	text "Hello, there."
	
	para "I see you're a"
	line "TRAINER too."
	
	para "Do you want to"
	line "battle?"
	done
	
TrainerRoute6_4BeatenText:
	text "No!"
	
	para "My beautiful"
	line "#MON!"
	done
	
TrainerRoute6_4NormalText:
	text "Leave!"
	
	para "You've done"
	line "enough!"
	done
	
TrainerRoute6_4SeenText2:
	text "AHHH!"
	
	para "You're stepping on"
	line "the flowers!"
	
	para "If you're going to"
	line "stomp all over the"
	cont "flowers,"
	
	para "my #MON will"
	line "STOMP all over"
	cont "you!"
	done
	
Route6Lass2Text:
	text "I walked all the"
	line "way here, and"
	
	para "there isn't even a"
	line "bridge to the"
	cont "island!"
	
	para "I can see it off"
	line "in the distance."
	
	para "Looks like I have"
	line "to take a boat…"
	done
	
Route6PsyducklText:
	text "PSYDUCK: Sai-ai-"
	line "ai!"
	done
	
Route6Lass3Text:
	text "Phew!"
	
	para "I made it through"
	line "the woods."
	
	para "Halfway home!"
	done
	
Route6FisherText:
	text "If you go NORTH"
	line "from here, you'll"
	cont "reach LAKE ONWA."
	
	para "There's a little"
	line "town set up on the"
	cont "lakeside."
	
	para "I don't think they"
	line "have a GYM there,"
	cont "though…"
	done
	
Route45HouseSignText:
	text "ROUTE 6"
	
	para "NORTH:"
	line "ROUTE 5"
	
	para "WEST:"
	line "LAKE OWNA"
	done
	
Route45LakeSignText:
	text "LAKE ONWA ahead."
	done
	
Movement_Route6_PokeFanM:
	step_right
	step_right
	step_right
	step_end
	
Movement_Route6_PokeFanF:
	step_right
	step_right
	step_right
	step_end