MtOnwaB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 7 ; warp events
	warp_def 15, 17, 4, MT_ONWA_2F
	warp_def 19, 31, 4, MT_ONWA_B1F
	warp_def  3,  5, 5, MT_ONWA_B1F
	warp_def 37, 29, 2, MT_ONWA_B1F
	warp_def 37, 5, 3, MT_ONWA_B1F
	warp_def 35, 29, 1, MT_ONWA_B2F
	warp_def 35, 5, 2, MT_ONWA_B2F

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	tmhmball_event  2, 4, TM_FIRE_PUNCH, EVENT_MT_ONWA_B1F_POKE_BALL_1
	itemball_event 32, 7, RARE_CANDY, 1, EVENT_MT_ONWA_B1F_POKE_BALL_2
	itemball_event 10,18, ULTRA_BALL, 1, EVENT_MT_ONWA_B1F_POKE_BALL_3
	person_event SPRITE_FIREBREATHER, 26, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, LavaCaveBF1Trainer1, -1
	person_event SPRITE_FIREBREATHER, 23, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, LavaCaveBF1Trainer2, -1
	person_event SPRITE_FIREBREATHER, 23, 29, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, LavaCaveBF1Trainer3, -1
	person_event SPRITE_ROCKER,  7, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LavaCaveBF1NPC1, -1
	person_event SPRITE_ROCKER, 21, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LavaCaveBF1NPC2, -1
	
LavaCaveBF1Trainer1:
	generictrainer FIREBREATHER, MORT, EVENT_BEAT_MT_ONWA_B1F_TRAINER_1, .SeenText, .BeatenText

	text "Maybe I should"
	line "catch a WATER-type"
	cont "#MON."
	done

.SeenText:
	text "You can't beat me"
	line "in this heat."
	
	para "I'm in my element!"
	done

.BeatenText:
	text "Maybe fire isn't"
	line "my element after"
	cont "all…"
	done
	
LavaCaveBF1Trainer2:
	generictrainer FIREBREATHER, FRITZ, EVENT_BEAT_MT_ONWA_B1F_TRAINER_2, .SeenText, .BeatenText

	text "If you can't take"
	line "the heat, stay"
	cont "outta the kitchen."
	done

.SeenText:
	text "What's wrong, kid?"
	
	para "Too hot for ya?"
	done

.BeatenText:
	text "Wow!"
	
	para "What a red-hot"
	line "battle!"
	done
	
LavaCaveBF1Trainer3:
	generictrainer FIREBREATHER, MEL, EVENT_BEAT_MT_ONWA_B1F_TRAINER_3, .SeenText, .BeatenText

	text "Looks like your"
	line "fire burns hotter"
	cont "than mine."
	done

.SeenText:
	text "If you got here,"
	line "you must have a"
	cont "FIRE-type #MON."
	
	para "Why don't we"
	line "compare?"
	done

.BeatenText:
	text "Huh."
	
	para "I see."
	done
	
LavaCaveBF1NPC1:
	faceplayer 
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext LavaCaveBF1NPC1Text_boy
	jump .cont
.girl
	writetext LavaCaveBF1NPC1Text_girl
.cont
	waitbutton
	closetext
	end
	
LavaCaveBF1NPC2:
	faceplayer 
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext LavaCaveBF1NPC2Text_boy
	jump .cont
.girl
	writetext LavaCaveBF1NPC2Text_girl
.cont
	waitbutton
	closetext
	end
	
LavaCaveBF1NPC1Text_boy:
	text "Yo, little bro!"
	
	para "Another lava"
	line "surfer!"
	
	para "You see my bro by"
	line "by the entrance?"
	
	para "I thought we were"
	line "the only two cool"
	cont "enough to ride"
	cont "these hot waves!"
	
	para "But you?"
	
	para "You're the real"
	line "deal!"
	
	para "Stay spicy, little"
	line "bro!"
	done
	
LavaCaveBF1NPC1Text_girl:
	text "Yo, little mama!"
	
	para "Another lava"
	line "surfer!"
	
	para "You see my bro by"
	line "by the entrance?"
	
	para "I thought we were"
	line "the only two cool"
	cont "enough to ride"
	cont "these hot waves!"
	
	para "But you?"
	
	para "You're the real"
	line "deal!"
	
	para "Stay spicy, little"
	line "mama!"
	done
	
LavaCaveBF1NPC2Text_boy:
	text "Hey, little bro."
	
	para "You have a FIRE"
	line "TYPE #MON?"
	
	para "Me and my bro surf"
	line "over the lava on"
	cont "our FIRE #MON"
	cont "all the time, bro."
	
	para "You should try it,"
	line "little dude."
	done
	
LavaCaveBF1NPC2Text_girl:
	text "Hey, little mama."
	
	para "You have a FIRE"
	line "TYPE #MON?"
	
	para "Me and my bro surf"
	line "over the lava on"
	cont "our FIRE #MON"
	cont "all the time."
	
	para "You should try it,"
	line "mama."
	done
