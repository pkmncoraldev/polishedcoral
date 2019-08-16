Route5_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 51, 19, 1, ROUTE_5_GATE
	warp_def 51, 20, 2, ROUTE_5_GATE
	warp_def 27, 6, 1, ROUTE_5_DEEP
	warp_def 26, 6, 2, ROUTE_5_DEEP

	db 0 ; coord events

	db 3 ; bg events
	signpost 4, 27, SIGNPOST_READ, Route5Sign
	signpost 48, 21, SIGNPOST_READ, Route5GateSign
	bg_event 8, 32, SIGNPOST_ITEM + RARE_CANDY, EVENT_ROUTE_5_HIDDEN_RARE_CANDY

	db 11 ; object events
	person_event SPRITE_PICNICKER, 9, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute5_1, -1
	person_event SPRITE_CAMPER, 13, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute5_2, -1
	person_event SPRITE_BUG_CATCHER, 18, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute5_3, -1
	person_event SPRITE_LASS, 28, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute5_4, -1
	person_event SPRITE_HIKER, 41, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute5_5, -1
	person_event SPRITE_SCHOOLBOY, 13, 26, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, Route5NPC6, -1
	person_event SPRITE_YOUNGSTER, 32, 32, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 1, Route5NPC7, -1
	person_event SPRITE_CUTE_GIRL, 47, 20, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 1, Route5NPC8, -1
	itemball_event 31, 25, GREAT_BALL, 1, EVENT_ROUTE_5_POKE_BALL
	fruittree_event  6, 36, FRUITTREE_ROUTE_5_1, RAWST_BERRY
	fruittree_event 26, 26, FRUITTREE_ROUTE_5_2, LEPPA_BERRY
	
TrainerRoute5_1:
	generictrainer PICNICKER, SHAUNA, EVENT_BEAT_ROUTE_5_TRAINER_1, .SeenText, .BeatenText

	text "There are so many"
	line "different types of"
	
	para "#MON in these"
	line "woods."
	
	para "I just wanna catch"
	line "'em all!"
	done

.SeenText:
	text "There's so many"
	line "great #MON"
	cont "around here!"
	
	para "I can't wait to"
	line "catch some!"
	done

.BeatenText:
	text "This is why I need"
	line "to catch some new"
	cont "#MON…"
	done
	
TrainerRoute5_2:
	generictrainer CAMPER, TREVOR, EVENT_BEAT_ROUTE_5_TRAINER_2, .SeenText, .BeatenText

	text "No wonder you"
	line "wanted a battle!"
	done

.SeenText:
	text "You're walking"
	line "awful close there."
	
	para "You must want a"
	line "battle!"
	done

.BeatenText:
	text "Wow!"
	
	para "You're tough!"
	done
	
TrainerRoute5_3:
	generictrainer BUG_CATCHER, ARNOLD, EVENT_BEAT_ROUTE_5_TRAINER_3, .SeenText, .BeatenText

	text "Nyehehe…"
	
	para "No on understands"
	line "me or my bugs…"
	done

.SeenText:
	text "Nyehehe…"
	
	para "Do you like bugs?"
	done

.BeatenText:
	text "Nyehehe…"
	
	para "I guess not…"
	done
	
TrainerRoute5_4:
	generictrainer LASS, MELANIE, EVENT_BEAT_ROUTE_5_TRAINER_4, .SeenText, .BeatenText

	text "There could be"
	line "anything hiding in"
	cont "this tall grass…"
	
	para "Come on!"
	
	para "I can do this!"
	done

.SeenText:
	text "The grass on this"
	line "ROUTE is so tall!"
	
	para "I'm too scared to"
	line "walk through it!"
	done

.BeatenText:
	text "AIIIIEEEE!"
	done
	
TrainerRoute5_5:
	generictrainer HIKER, SIMON, EVENT_BEAT_ROUTE_5_TRAINER_5, .SeenText, .BeatenText

	text "This weather is"
	line "too perfect to get"
	cont "upset over a loss."
	done

.SeenText:
	text "Ahaha!"
	
	para "This weather is"
	line "perfect for a hike"
	cont "though the woods!"
	
	para "It's also perfect"
	line "for a #MON"
	cont "battle!"
	done

.BeatenText:
	text "Not even a loss"
	line "can get me down!"
	done

	
Route5NPC6:
	jumptextfaceplayer Route5NPC6Text
	
Route5NPC7:
	jumptextfaceplayer Route5NPC7Text
	
Route5NPC8:
	jumptextfaceplayer Route5NPC8Text
	
Route5Sign:
	jumptext Route5SignText
	
Route5GateSign:
	jumptext Route5GateSignText
	
Route5SignText:
	text "ROUTE 5"
	
	para "NORTH:"
	line "ROUTE 4"
	
	para "SOUTH:"
	line "ROUTE 6"
	done
	
Route5GateSignText:
	text "SUNBEAM ISLAND"
	line "AHEAD"
	done
	
Route5NPC6Text:
	text "#MON appear"
	line "much more often in"
	cont "the taller grass."
	
	para "That's good for"
	line "me, because I'm"
	
	para "looking for a new"
	line "team member."
	
	para "You might want to"
	line "avoid it, though."
	done
	
Route5NPC7Text:
	text "My friend said he"
	line "caught his SCYTHER"
	cont "in these woods."
	
	para "I want one so bad!"
	
	para "I'm not heading"
	line "back home until I"
	cont "find one!"
	done
	
Route5NPC8Text:
	text "I've heard there is"
	line "a place deep in"
	
	para "these woods where"
	line "you can catch a"
	
	para "rare #MON that"
	line "can evolve into"
	
	para "several different"
	line "#MON!"
	
	para "Pretty cool, huh?"
	done