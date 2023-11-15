Route17_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_OFFICER, 26, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute17_1, -1
	person_event SPRITE_BLACK_BELT, 18,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute17_2, -1
	person_event SPRITE_OFFICER,  8, 39, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute17_3, -1
	person_event SPRITE_BEAUTY,  6, 24, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute17_4, -1


TrainerRoute17_1:
	generictrainer OFFICER, SANCHEZ, EVENT_BEAT_ROUTE_17_TRAINER_1, .SeenText, .BeatenText

	text "There's someone"
	line "out here holding"
	cont "people up."
	
	para "You haven't seen"
	line "anyone like that,"
	cont "have you?"
	done

.SeenText:
	text "I need to ask you"
	line "some questions."
	
	para "Stop resisting!"
	done

.BeatenText:
	text "Oh, you're"
	line "cooperating?"
	done
	
TrainerRoute17_2:
	generictrainer BLACKBELT_T, ZERO, EVENT_BEAT_ROUTE_17_TRAINER_2, .SeenText, .BeatenText

	text "You are strong"
	line "and pure of heart."
	
	para "However, you have"
	line "not reached your"
	cont "true potential!"
	
	para "Keep training!"
	done

.SeenText:
	text "Are you pure of"
	line "heart?"
	
	para "Let me see the"
	line "way you battle!"
	done

.BeatenText:
	text "I see."
	
	para "Now I understand…"
	done
	
TrainerRoute17_3:
	generictrainer OFFICER, HARTWELL, EVENT_BEAT_ROUTE_17_TRAINER_3, .SeenText, .BeatenText

	text "You're just a kid!"
	
	para "The CAPTAIN would"
	line "go ballistic if I"
	cont "arrested a kid!"
	done

.SeenText:
	text "Stop right there!"
	
	para "I've finally got"
	line "you!"
	
	para "I'm takin' you in!"
	done

.BeatenText:
	text "You're not the one"
	line "I'm looking for!"
	done
	
TrainerRoute17_4:
	generictrainer LASS, LENA, EVENT_BEAT_ROUTE_17_TRAINER_4, .SeenText, .BeatenText

	text "What's a beautiful"
	line "girl like me have"
	cont "to do to find a"
	cont "handsome man!?"
	done

.SeenText:
	text "I wish I had a"
	line "handsome, hunky"
	cont "boyfriend!"
	
	para "I'm out here"
	line "looking for some-"
	cont "one like that!"
	done

.BeatenText:
	text "When will my wish"
	line "come true?"
	done

	