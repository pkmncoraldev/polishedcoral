Route13_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_FISHER, 15, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute13_1, -1
	person_event SPRITE_FISHER, 24,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute13_2, -1
	person_event SPRITE_FISHER, 35, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute13_3, -1
	person_event SPRITE_SWIMMER_GUY,  5, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute13_4, -1
	person_event SPRITE_SWIMMER_GIRL, 22, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute13_5, -1
	person_event SPRITE_SWIMMER_GIRL, 39, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute13_6, -1
	person_event SPRITE_SWIMMER_GUY, 34, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute13_7, -1
	
TrainerRoute13_1:
	generictrainer FISHER, DICK, EVENT_BEAT_ROUTE_13_TRAINER_1, .SeenText, .BeatenText

	text "You have some good"
	line "#MON there."
	
	para "I wonder how much"
	line "you could get for"
	cont "'em."
	done

.SeenText:
	text "I fish all day and"
	line "sell my catches at"
	cont "the MARKET in"
	cont "PORT SHIMMER."
	done

.BeatenText:
	text "My new catches!"
	done
	
TrainerRoute13_2:
	generictrainer FISHER, ROBBY, EVENT_BEAT_ROUTE_13_TRAINER_2, .SeenText, .BeatenText

	text "Just get outta"
	line "here, kid."
	
	para "Before I push ya'"
	line "in the water!"
	done

.SeenText:
	text "Nothin's bitin'"
	line "today!"
	
	para "I'll take out my"
	line "frustration on"
	cont "you!"
	done

.BeatenText:
	text "Argh!"
	done
	
TrainerRoute13_3:
	generictrainer FISHER, ERIC, EVENT_BEAT_ROUTE_13_TRAINER_3, .SeenText, .BeatenText

	text "I'm gonna be out"
	line "here trying to un-"
	cont "tangle this line"
	cont "for hours!"
	done

.SeenText:
	text "Ah!"
	
	para "You got my fishing"
	line "line all tangled!"
	done

.BeatenText:
	text "That's just great…"
	done
	
TrainerRoute13_4:
	generictrainer SWIMMERM, PABLO, EVENT_BEAT_ROUTE_13_TRAINER_4, .SeenText, .BeatenText

	text "PORT SHIMMER is"
	line "quite a distance"
	cont "from here."
	done

.SeenText:
	text "You heading down"
	line "to PORT SHIMMER?"
	
	para "Hope you're"
	line "prepared!"
	done

.BeatenText:
	text "Ah man."
	line "I lost!"
	done
	
TrainerRoute13_5:
	generictrainer SWIMMERF, SHAE, EVENT_BEAT_ROUTE_13_TRAINER_5, .SeenText, .BeatenText

	text "Maybe I should try"
	line "riding my ERROR!!" ;TODO replace with a mon from her team
	cont "instead of"
	cont "swimming."
	done

.SeenText:
	text "Woah!"
	
	para "Look at you riding"
	line "your #MON!"
	
	para "How fun!"
	done

.BeatenText:
	text "How fun!"
	done
	
TrainerRoute13_6:
	generictrainer SWIMMERF, PEGGY, EVENT_BEAT_ROUTE_13_TRAINER_6, .SeenText, .BeatenText

	text "You can uh… stop"
	line "looking at my"
	cont "swimsuit now…"
	done

.SeenText:
	text "What do you think"
	line "of my swimsuit?"
	
	para "Pretty cute,"
	line "right?"
	done

.BeatenText:
	text "Okay…"
	line "That's enough…"
	done
	
TrainerRoute13_7:
	generictrainer SWIMMERM, GARY, EVENT_BEAT_ROUTE_13_TRAINER_7, .SeenText, .BeatenText

	text "I guess I should"
	line "wait 30 minutes"
	cont "after eating"
	cont "before I battle…"
	done

.SeenText:
	text "I love swimming"
	line "after a big meal!"
	
	para "I also love"
	line "battling after a"
	cont "big meal!"
	done

.BeatenText:
	text "Ouch!"
	line "Cramp!"
	done
