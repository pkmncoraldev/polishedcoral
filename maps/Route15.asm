Route15_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 47 ; warp events
	warp_event 36,  7, CONNECTING_CAVERN_ENTRANCE, 1
	warp_event  6, 22, ROUTE_14_15_UNDERWATER, 17
	warp_event  7, 22, ROUTE_14_15_UNDERWATER, 18
	warp_event  6, 23, ROUTE_14_15_UNDERWATER, 19
	warp_event  7, 23, ROUTE_14_15_UNDERWATER, 20
	warp_event 18, 19, ROUTE_14_15_UNDERWATER, 21
	warp_event 19, 19, ROUTE_14_15_UNDERWATER, 22
	warp_event 17, 20, ROUTE_14_15_UNDERWATER, 23
	warp_event 18, 20, ROUTE_14_15_UNDERWATER, 24
	warp_event 19, 20, ROUTE_14_15_UNDERWATER, 25
	warp_event 20, 20, ROUTE_14_15_UNDERWATER, 26
	warp_event 17, 21, ROUTE_14_15_UNDERWATER, 27
	warp_event 18, 21, ROUTE_14_15_UNDERWATER, 28
	warp_event 19, 21, ROUTE_14_15_UNDERWATER, 29
	warp_event 20, 21, ROUTE_14_15_UNDERWATER, 30
	warp_event 18, 22, ROUTE_14_15_UNDERWATER, 31
	warp_event 19, 22, ROUTE_14_15_UNDERWATER, 32
	warp_event 70, 16, ROUTE_14_15_UNDERWATER, 33
	warp_event 71, 16, ROUTE_14_15_UNDERWATER, 34
	warp_event 70, 17, ROUTE_14_15_UNDERWATER, 35
	warp_event 71, 17, ROUTE_14_15_UNDERWATER, 36
	warp_event 63, 22, ROUTE_14_15_UNDERWATER, 37
	warp_event 64, 22, ROUTE_14_15_UNDERWATER, 38
	warp_event 65, 22, ROUTE_14_15_UNDERWATER, 39
	warp_event 63, 23, ROUTE_14_15_UNDERWATER, 40
	warp_event 64, 23, ROUTE_14_15_UNDERWATER, 41
	warp_event 65, 23, ROUTE_14_15_UNDERWATER, 42
	warp_event 68, 19, ROUTE_14_15_UNDERWATER, 43
	warp_event 69, 19, ROUTE_14_15_UNDERWATER, 44
	warp_event 66, 20, ROUTE_14_15_UNDERWATER, 45
	warp_event 67, 20, ROUTE_14_15_UNDERWATER, 46
	warp_event 68, 20, ROUTE_14_15_UNDERWATER, 47
	warp_event 69, 20, ROUTE_14_15_UNDERWATER, 48
	warp_event 66, 21, ROUTE_14_15_UNDERWATER, 49
	warp_event 67, 21, ROUTE_14_15_UNDERWATER, 50
	warp_event 68, 21, ROUTE_14_15_UNDERWATER, 51
	warp_event 69, 21, ROUTE_14_15_UNDERWATER, 52
	warp_event 68, 22, ROUTE_14_15_UNDERWATER, 53
	warp_event 69, 22, ROUTE_14_15_UNDERWATER, 54
	warp_event 70, 22, ROUTE_14_15_UNDERWATER, 55
	warp_event 68, 23, ROUTE_14_15_UNDERWATER, 56
	warp_event 69, 23, ROUTE_14_15_UNDERWATER, 57
	warp_event 70, 23, ROUTE_14_15_UNDERWATER, 58
	warp_event 26,  2, CORAL_REEF, 1
	warp_event 27,  2, CORAL_REEF, 2
	warp_event 26,  3, CORAL_REEF, 3
	warp_event 27,  3, CORAL_REEF, 4

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	person_event SPRITE_SAILOR, 15, 45, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute15_1, -1
	person_event SPRITE_SWIMMER_GIRL,  6,  6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute15_2, -1
	person_event SPRITE_SWIMMER_GIRL, 18,  6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute15_3, -1
	person_event SPRITE_SWIMMER_GUY, 13, 14, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute15_4, -1
	person_event SPRITE_SWIMMER_GUY, 15, 67, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute15_5, -1
	person_event SPRITE_SWIMMER_GUY, 22, 22, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute15_6, -1
	person_event SPRITE_SWIMMER_GIRL, 19, 79, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute15_7, -1
	tapeball_event 60, 18, MUSIC_WATER_ROUTE, 1, EVENT_MUSIC_WATER_ROUTE
	
TrainerRoute15_1:
	generictrainer SAILOR, RANDALL, EVENT_BEAT_ROUTE_15_TRAINER_1, .SeenText, .BeatenText

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
	
TrainerRoute15_2:
	generictrainer SWIMMERF, RACHEL, EVENT_BEAT_ROUTE_15_TRAINER_2, .SeenText, .BeatenText

	text "Huff… <WAIT_S>Puff…"
	
	para "No time for"
	line "another break!"
	
	para "I've got more"
	line "swimming to do!"
	done

.SeenText:
	text "Huff… <WAIT_S>Puff…"
	
	para "How about a break"
	line "from swimming for"
	cont "a #MON battle?"
	done

.BeatenText:
	text "Huff… <WAIT_S>Puff…"
	
	para "Break time is"
	line "over!"
	done
	
TrainerRoute15_3:
	generictrainer SWIMMERF, ROSA, EVENT_BEAT_ROUTE_15_TRAINER_3, .SeenText, .BeatenText

	text "So tiny…<WAIT_M>"
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
	
TrainerRoute15_4:
	generictrainer SWIMMERM, DEVIN, EVENT_BEAT_ROUTE_15_TRAINER_4, .SeenText, .BeatenText

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
	
TrainerRoute15_5:
	generictrainer SWIMMERM, IAN, EVENT_BEAT_ROUTE_15_TRAINER_5, .SeenText, .BeatenText

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
	
TrainerRoute15_6:
	generictrainer SWIMMERM, DEON, EVENT_BEAT_ROUTE_15_TRAINER_6, .SeenText, .BeatenText

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
	text "Alright, <WAIT_S>I'll"
	line "tell you!"
	done
	
TrainerRoute15_7:
	generictrainer SWIMMERF, CONNIE, EVENT_BEAT_ROUTE_15_TRAINER_7, .SeenText, .BeatenText

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
	text "Glub… <WAIT_S>glub…"
	done
