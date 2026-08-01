AureoleMountain1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AureoleMountain1FCallback

	db 10 ; warp events
	warp_def 47, 13, 3, ROUTE_32
	warp_def 29,  9, 1, AUREOLE_MOUNTAIN_2F
	warp_def 39, 25, 4, AUREOLE_MOUNTAIN_1F
	warp_def  9, 33, 3, AUREOLE_MOUNTAIN_1F
	warp_def  5, 35, 6, AUREOLE_MOUNTAIN_1F
	warp_def  3, 17, 5, AUREOLE_MOUNTAIN_1F
	warp_def  9, 26, 8, AUREOLE_MOUNTAIN_1F
	warp_def 39, 18, 1, ROUTE_1
	warp_def 27, 21, 1, ROUTE_1
	warp_def  9, 17, 1, AUREOLE_MOUNTAIN_OUTSIDE

	db 0 ; coord events

	db 2 ; bg events
	bg_event 25, 37, SIGNPOST_ITEM + HYPER_POTION, EVENT_AUREOLE_MOUNTAIN_1F_HIDDEN_ITEM_1
	bg_event 15, 29, SIGNPOST_ITEM + PP_UP, EVENT_AUREOLE_MOUNTAIN_1F_HIDDEN_ITEM_2

	db 11 ; object events
	person_event SPRITE_SUPER_NERD, 38,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain1F_Trainer_1, -1
	person_event SPRITE_POKEMANIAC, 19,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, AureoleMountain1F_Trainer_2, -1
	person_event SPRITE_POKEMANIAC, 22, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain1F_Trainer_3, -1
	person_event SPRITE_DELINQUENT_M, 24, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, AureoleMountain1F_Trainer_4, -1
	person_event SPRITE_COOLTRAINER_M, 34, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, AureoleMountain1F_Trainer_5, -1
	person_event SPRITE_COOLTRAINER_F, 31, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain1F_Trainer_6, -1
	tapeball_event 33, 41, MUSIC_TRAINER_VICTORY, 2, EVENT_MUSIC_TRAINER_VICTORY
	itemball_event 11, 32, EXPERT_BELT, 1, EVENT_AUREOLE_MOUNTAIN_1F_ITEM
	strengthboulder_event 18, 44, -1


AureoleMountain1FCallback:
	domaptrigger AUREOLE_MOUNTAIN_OUTSIDE, 0
	return

AureoleMountain1F_Trainer_1:
	generictrainer SUPER_NERD, ADAM, EVENT_BEAT_AUREOLE_MOUNTAIN_1F_TRAINER_1, .SeenText, .BeatenText

	text "I might be in"
	line "over my head here…"
	done

.SeenText:
	text "Hehe…"
	
	para "You think you're"
	line "ready to climb up"
	cont "AUREOLE MOUNTAIN?"
	
	para "Let's find out!"
	done

.BeatenText:
	text "More ready than"
	line "me!"
	done
	
AureoleMountain1F_Trainer_2:
	generictrainer POKEMANIAC, BENNY, EVENT_BEAT_AUREOLE_MOUNTAIN_1F_TRAINER_2, .SeenText, .BeatenText

	text "I won't let this"
	line "minor setback stop"
	cont "me!"
	done

.SeenText:
	text "You climbing the"
	line "mountain too?"
	
	para "I bet their are"
	line "some crazy rare"
	cont "#MON up top!"
	done

.BeatenText:
	text "Graaah!"
	done
	
AureoleMountain1F_Trainer_3:
	generictrainer POKEMANIAC, MILO, EVENT_BEAT_AUREOLE_MOUNTAIN_1F_TRAINER_3, .SeenText, .BeatenText

	text "Tell me all about"
	line "the #MON you've"
	cont "seen on your"
	cont "travels!"
	done

.SeenText:
	text "You look fairly"
	line "tough."
	
	para "You must have seen"
	line "all kinds of #-"
	cont "MON on your"
	cont "travels!"
	
	para "Tell me about"
	line "them all!"
	done

.BeatenText:
	text "Wow! So tough!"
	done
	
AureoleMountain1F_Trainer_4:
	generictrainer DELINQUENT_M, QUINCY, EVENT_BEAT_AUREOLE_MOUNTAIN_1F_TRAINER_4, .SeenText, .BeatenText

	text "You knocked my"
	line "my #MON out"
	cont "like a light!"
	done

.SeenText:
	text "Hah!"
	
	para "Little kiddy lost"
	line "in the mountains?"
	
	para "We'll put'cha to"
	line "bed!"
	done

.BeatenText:
	text "Ayee!"
	done
	
AureoleMountain1F_Trainer_5:
	generictrainer COOLTRAINERM, LUCAS, EVENT_BEAT_AUREOLE_MOUNTAIN_1F_TRAINER_5, .SeenText, .BeatenText
	
	text "Good luck!"
	
	para "Maybe I'll see"
	line "you up there."
	done

.SeenText:
	text "Feeling tired yet?"
	
	para "I hope not,"
	line "because you're just"
	cont "getting started!"
	done

.BeatenText:
	text "Doing fine!"
	done
	
AureoleMountain1F_Trainer_6:
	generictrainer COOLTRAINERF, BROOKE, EVENT_BEAT_AUREOLE_MOUNTAIN_1F_TRAINER_6, .SeenText, .BeatenText

	text "I'm just gonna rest"
	line "here for a while…"
	done

.SeenText:
	text "Ow ow ow!"
	
	para "I think I sprained"
	line "my ankle falling"
	cont "down a hole!"
	
	para "Be careful!"
	done

.BeatenText:
	text "Yeowch!"
	done