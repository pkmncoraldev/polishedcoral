Route6South_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 56 ; warp events
	warp_event 15,  0, ROUTE_6_UNDERWATER, 19
	warp_event 16,  0, ROUTE_6_UNDERWATER, 20
	warp_event 17,  0, ROUTE_6_UNDERWATER, 21
	warp_event 18,  0, ROUTE_6_UNDERWATER, 22
	warp_event 19,  0, ROUTE_6_UNDERWATER, 23
	warp_event 20,  0, ROUTE_6_UNDERWATER, 24
	warp_event 21,  0, ROUTE_6_UNDERWATER, 25
	warp_event 22,  0, ROUTE_6_UNDERWATER, 26
	warp_event 15,  1, ROUTE_6_UNDERWATER, 27
	warp_event 16,  1, ROUTE_6_UNDERWATER, 28
	warp_event 17,  1, ROUTE_6_UNDERWATER, 29
	warp_event 18,  1, ROUTE_6_UNDERWATER, 30
	warp_event 19,  1, ROUTE_6_UNDERWATER, 31
	warp_event 20,  1, ROUTE_6_UNDERWATER, 32
	warp_event 21,  1, ROUTE_6_UNDERWATER, 33
	warp_event 22,  1, ROUTE_6_UNDERWATER, 34
	warp_event 15,  2, ROUTE_6_UNDERWATER, 35
	warp_event 16,  2, ROUTE_6_UNDERWATER, 36
	warp_event 17,  2, ROUTE_6_UNDERWATER, 37
	warp_event 18,  2, ROUTE_6_UNDERWATER, 38
	warp_event 19,  2, ROUTE_6_UNDERWATER, 39
	warp_event 20,  2, ROUTE_6_UNDERWATER, 40
	warp_event 15,  3, ROUTE_6_UNDERWATER, 41
	warp_event 16,  3, ROUTE_6_UNDERWATER, 42
	warp_event 17,  3, ROUTE_6_UNDERWATER, 43
	warp_event 18,  3, ROUTE_6_UNDERWATER, 44
	warp_event 19,  3, ROUTE_6_UNDERWATER, 45
	warp_event 20,  3, ROUTE_6_UNDERWATER, 46
	warp_event 16,  4, ROUTE_6_UNDERWATER, 47
	warp_event 17,  4, ROUTE_6_UNDERWATER, 48
	warp_event 18,  4, ROUTE_6_UNDERWATER, 49
	warp_event 19,  4, ROUTE_6_UNDERWATER, 50
	warp_event 18,  5, ROUTE_6_UNDERWATER, 51
	warp_event 19,  5, ROUTE_6_UNDERWATER, 52
	warp_event 18,  6, ROUTE_6_UNDERWATER, 53
	warp_event 19,  6, ROUTE_6_UNDERWATER, 54
	warp_event 24,  4, ROUTE_6_UNDERWATER, 55
	warp_event 25,  4, ROUTE_6_UNDERWATER, 56
	warp_event 24,  5, ROUTE_6_UNDERWATER, 57
	warp_event 25,  5, ROUTE_6_UNDERWATER, 58
	warp_event 14,  8, ROUTE_6_UNDERWATER, 59
	warp_event 15,  8, ROUTE_6_UNDERWATER, 60
	warp_event 14,  9, ROUTE_6_UNDERWATER, 61
	warp_event 15,  9, ROUTE_6_UNDERWATER, 62
	warp_event 58,  7, ROUTE_6_UNDERWATER, 63
	warp_event 59,  7, ROUTE_6_UNDERWATER, 64
	warp_event 57,  8, ROUTE_6_UNDERWATER, 65
	warp_event 58,  8, ROUTE_6_UNDERWATER, 66
	warp_event 59,  8, ROUTE_6_UNDERWATER, 67
	warp_event 60,  8, ROUTE_6_UNDERWATER, 68
	warp_event 57,  9, ROUTE_6_UNDERWATER, 69
	warp_event 58,  9, ROUTE_6_UNDERWATER, 70
	warp_event 59,  9, ROUTE_6_UNDERWATER, 71
	warp_event 60,  9, ROUTE_6_UNDERWATER, 72
	warp_event 58, 10, ROUTE_6_UNDERWATER, 73
	warp_event 59, 10, ROUTE_6_UNDERWATER, 74

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_SWIMMER_GIRL,  6, 17, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6South_1, -1
	person_event SPRITE_SWIMMER_GUY,  7, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6South_2, -1
	person_event SPRITE_TUBER_WATER, 17, 13, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute6South_3, -1
	
	
TrainerRoute6South_1:
	generictrainer SWIMMERF, SHANNON, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_1, .SeenText, .BeatenText

	text "The water gets"
	line "pretty deep around"
	cont "here."
	
	para "What could be down"
	line "there, I wonder!"
	done

.SeenText:
	text "Let's battle!"
	
	para "You'll be sinking"
	line "to the bottom of"
	cont "the ocean when I'm"
	cont "done with you!"
	done

.BeatenText:
	text "I'm sinking!"
	done
	
TrainerRoute6South_2:
	generictrainer SWIMMERM, DAVY, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_2, .SeenText, .BeatenText

	text "Let's just say my"
	line "new suit doesn't"
	cont "leave much to the"
	cont "imagination."
	
	para "I think I'll just"
	line "stay under the"
	cont "water…"
	done

.SeenText:
	text "My friend talked"
	line "me into a new"
	cont "style of swimsuit."
	
	para "He said all the"
	line "ladies love them!"
	
	para "I feel so exposed!"
	done

.BeatenText:
	text "Ah shoot!"
	done
	
	
TrainerRoute6South_3:
	generictrainer TUBER, KERRI, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_3, .SeenText, .BeatenText

	text "I'm getting dizzy!"
	done

.SeenText:
	text "I've drifted pretty"
	line "far away from the"
	cont "beach."
	
	para "I hope I wash up"
	line "somewhere soon…"
	done

.BeatenText:
	text "Sigh…"
	done
