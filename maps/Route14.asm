Route14_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 16 ; warp events
	warp_event 16, 23, ROUTE_14_15_UNDERWATER, 1
	warp_event 17, 23, ROUTE_14_15_UNDERWATER, 2
	warp_event 13, 24, ROUTE_14_15_UNDERWATER, 3
	warp_event 14, 24, ROUTE_14_15_UNDERWATER, 4
	warp_event 15, 24, ROUTE_14_15_UNDERWATER, 5
	warp_event 16, 24, ROUTE_14_15_UNDERWATER, 6
	warp_event 17, 24, ROUTE_14_15_UNDERWATER, 7
	warp_event 18, 24, ROUTE_14_15_UNDERWATER, 8
	warp_event 13, 25, ROUTE_14_15_UNDERWATER, 9
	warp_event 14, 25, ROUTE_14_15_UNDERWATER, 10
	warp_event 15, 25, ROUTE_14_15_UNDERWATER, 11
	warp_event 16, 25, ROUTE_14_15_UNDERWATER, 12
	warp_event 17, 25, ROUTE_14_15_UNDERWATER, 13
	warp_event 18, 25, ROUTE_14_15_UNDERWATER, 14
	warp_event 14, 26, ROUTE_14_15_UNDERWATER, 15
	warp_event 15, 26, ROUTE_14_15_UNDERWATER, 16

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_FISHER, 13, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute14_1, -1
	person_event SPRITE_FISHER, 24,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute14_2, -1
	person_event SPRITE_FISHER, 35, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute14_3, -1
	person_event SPRITE_SWIMMER_GUY,  5, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_4, -1
	person_event SPRITE_SWIMMER_GIRL, 22, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_5, -1
	person_event SPRITE_SWIMMER_GIRL, 39, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute14_6, -1
	person_event SPRITE_SWIMMER_GUY, 34, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute14_7, -1
	
TrainerRoute14_1:
	generictrainer FISHER, DICK, EVENT_BEAT_ROUTE_14_TRAINER_1, .SeenText, .BeatenText

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
	
TrainerRoute14_2:
	generictrainer FISHER, ROBBY, EVENT_BEAT_ROUTE_14_TRAINER_2, .SeenText, .BeatenText

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
	
TrainerRoute14_3:
	generictrainer FISHER, ERIC, EVENT_BEAT_ROUTE_14_TRAINER_3, .SeenText, .BeatenText

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
	
TrainerRoute14_4:
	generictrainer SWIMMERM, PABLO, EVENT_BEAT_ROUTE_14_TRAINER_4, .SeenText, .BeatenText

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
	
TrainerRoute14_5:
	generictrainer SWIMMERF, SHAE, EVENT_BEAT_ROUTE_14_TRAINER_5, .SeenText, .BeatenText

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
	
TrainerRoute14_6:
	generictrainer SWIMMERF, PEGGY, EVENT_BEAT_ROUTE_14_TRAINER_6, .SeenText, .BeatenText

	text "You can uh… <WAIT_M>stop"
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
	text "Ok…<WAIT_M>"
	line "That's enough…"
	done
	
TrainerRoute14_7:
	generictrainer SWIMMERM, GARY, EVENT_BEAT_ROUTE_14_TRAINER_7, .SeenText, .BeatenText

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
	text "Ouch!<WAIT_M>"
	line "Cramp!"
	done
