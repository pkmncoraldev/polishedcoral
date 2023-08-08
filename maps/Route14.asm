Route14_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_SAILOR, 15, 45, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute14_1, -1
	person_event SPRITE_SWIMMER_GIRL,  6,  6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_2, -1
	person_event SPRITE_SWIMMER_GIRL, 18,  6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_3, -1
	person_event SPRITE_SWIMMER_GUY, 13, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_4, -1
	person_event SPRITE_SWIMMER_GUY, 14, 69, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_5, -1
	person_event SPRITE_SWIMMER_GUY, 22, 22, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_6, -1
	person_event SPRITE_SWIMMER_GIRL, 19, 79, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_7, -1
	
TrainerRoute14_1:
	generictrainer SAILOR, RANDALL, EVENT_BEAT_ROUTE_14_TRAINER_1, .SeenText, .BeatenText

	text "You wouldn't have"
	line "room on that #-"
	cont "MON for me,"
	cont "would you?"
	
	para "Sigh…"
	
	para "Guess I'll be"
	line "stranded here for"
	cont "a while longer…"
	done

.SeenText:
	text "I've been stranded"
	line "on this little"
	cont "island for months!"
	
	para "The boat I was on"
	line "left without me!"
	done

.BeatenText:
	text "I can't swim!"
	done
	
TrainerRoute14_2:
	generictrainer SWIMMERF, RACHEL, EVENT_BEAT_ROUTE_14_TRAINER_2, .SeenText, .BeatenText

	text "Huff… Puff…"
	
	para "No time for"
	line "another break!"
	
	para "I've got more"
	line "swimming to do!"
	done

.SeenText:
	text "Huff… Puff…"
	
	para "How about a break"
	line "from swimming for"
	cont "a #MON battle?"
	done

.BeatenText:
	text "Huff… Puff…"
	
	para "Break time is"
	line "over!"
	done
	
TrainerRoute14_3:
	generictrainer SWIMMERF, ROSA, EVENT_BEAT_ROUTE_14_TRAINER_3, .SeenText, .BeatenText

	text "So tiny…"
	line "So insignificant…"
	
	para "Am I having an"
	line "existential crisis"
	cont "or something?"
	done

.SeenText:
	text "We're so tiny in"
	line "this great big"
	cont "blue ocean…"
	
	para "You ever think"
	line "about that?"
	done

.BeatenText:
	text "I have a lot to"
	line "think about…"
	done
	
TrainerRoute14_4:
	generictrainer SWIMMERM, DEVIN, EVENT_BEAT_ROUTE_14_TRAINER_4, .SeenText, .BeatenText

	text "Always with the"
	line "battles!"
	
	para "Doesn't matter when"
	line "or where!"
	done

.SeenText:
	text "We're out in the"
	line "middle of the"
	cont "ocean!"
	
	para "Time for a battle,"
	line "of course!"
	done

.BeatenText:
	text "Dang!"
	done
	
TrainerRoute14_5:
	generictrainer SWIMMERM, IAN, EVENT_BEAT_ROUTE_14_TRAINER_5, .SeenText, .BeatenText

	text "I battle like I"
	line "swim:"
	
	para "Lazily!"
	done

.SeenText:
	text "I'm not really a"
	line "swimmer."
	
	para "I just kinda float"
	line "along lazily…"
	done

.BeatenText:
	text "Ah…"
	done
	
TrainerRoute14_6:
	generictrainer SWIMMERM, DEON, EVENT_BEAT_ROUTE_14_TRAINER_6, .SeenText, .BeatenText

	text "The entrance to"
	line "the cave is on"
	cont "the neaby island."
	
	para "It apparently goes"
	line "into a big under-"
	cont "water cavern."
	
	para "I bet it gets real"
	line "dark down there…"
	done

.SeenText:
	text "There's apparently"
	line "a cave nearby."
	
	para "Beat me and I'll"
	line "tell you more!"
	done

.BeatenText:
	text "Alright, I'll"
	line "tell you!"
	done
	
TrainerRoute14_7:
	generictrainer SWIMMERF, CONNIE, EVENT_BEAT_ROUTE_14_TRAINER_7, .SeenText, .BeatenText

	text "I've gotta get"
	line "to the shore and"
	cont "dry off."
	done

.SeenText:
	text "I think I've been"
	line "in the water too"
	cont "long."
	
	para "My skin's starting"
	line "to prune!"
	done

.BeatenText:
	text "Glub… glub…"
	done
