GreenGrottoB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GreenGrottoB1FCallback

	db 6 ; warp events
	warp_event  3, 13, GREEN_GROTTO_1F, 3
	warp_event 11, 21, GREEN_GROTTO_1F, 4
	warp_event 31, 13, GREEN_GROTTO_1F, 5
	warp_event 11, 10, ROUTE_1, 1
	warp_event 29,  6, ROUTE_1, 1
	warp_event 34, 20, ROUTE_1, 1

	db 0 ; coord events

	db 5 ; bg events
	signpost 10,  9, SIGNPOST_IFSET, GreenGrottoB1FRock1
	signpost 10, 10, SIGNPOST_IFSET, GreenGrottoB1FRock2
	signpost  6, 27, SIGNPOST_IFSET, GreenGrottoB1FRock3
	signpost  6, 28, SIGNPOST_IFSET, GreenGrottoB1FRock4
	signpost 21, 34, SIGNPOST_IFSET, GreenGrottoB1FRock5

	db 8 ; object events
	person_event SPRITE_POKEMANIAC,  4,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerGreenGrottoB1F_1, -1
	person_event SPRITE_AROMA_LADY,  8, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 4, TrainerGreenGrottoB1F_2, -1
	person_event SPRITE_HIKER,  6, 25, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerGreenGrottoB1F_3, -1
	person_event SPRITE_ROCKER, 14, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerGreenGrottoB1F_4, -1
	person_event SPRITE_BATHER_2, 16, 15, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerGreenGrottoB1F_5, -1
	itemball_event  3,  6, WHITE_HERB, 1, EVENT_GREEN_GROTTO_B1F_POKEBALL_1
	itemball_event 27,  2, FULL_RESTORE, 1, EVENT_GREEN_GROTTO_B1F_POKEBALL_2
	itemball_event 25, 19, HYPER_POTION, 1, EVENT_GREEN_GROTTO_B1F_POKEBALL_3
	
	
GreenGrottoB1FCallback:
	clearevent EVENT_OTTO_TALKS_ABOUT_RIVAL
	checkevent EVENT_GREEN_GROTTO_BOULDER_1
	iffalse .skip1
	changeblock $8, $a, $5a
.skip1
	checkevent EVENT_GREEN_GROTTO_BOULDER_2
	iffalse .skip2
	changeblock $a, $a, $5d
.skip2
	checkevent EVENT_GREEN_GROTTO_BOULDER_3
	iffalse .skip3
	changeblock $1a, $6, $5c
.skip3
	checkevent EVENT_GREEN_GROTTO_BOULDER_4
	iffalse .skip4
	changeblock $1c, $6, $5b
.skip4
	checkevent EVENT_GREEN_GROTTO_BOULDER_5
	iffalse .skip5
	changeblock $22, $14, $5e
.skip5
	return

TrainerGreenGrottoB1F_1:
	generictrainer POKEMANIAC, TRENT, EVENT_BEAT_GREEN_GROTTO_B1F_TRAINER_1, .SeenText, .BeatenText

	text "Whatever, man."
	done

.SeenText:
	text "Heh heh."
	
	para "My #MON will"
	line "wipe the floor"
	cont "with you!"
	done

.BeatenText:
	text "Gahh!"
	done
	
TrainerGreenGrottoB1F_2:
	generictrainer AROMA_LADY, DIANE, EVENT_BEAT_GREEN_GROTTO_B1F_TRAINER_2, .SeenText, .BeatenText

	text "At least my"
	line "#MON smell"
	cont "nice."
	done

.SeenText:
	text "It's so damp and"
	line "musty down here."
	
	para "It smells"
	line "terrible!"
	done

.BeatenText:
	text "Yuck!"
	done
	
TrainerGreenGrottoB1F_3:
	generictrainer HIKER, BRAD, EVENT_BEAT_GREEN_GROTTO_B1F_TRAINER_3, .SeenText, .BeatenText

	text "Stop pushin' those"
	line "rocks down those"
	cont "holes!"
	
	para "One almost hit me"
	line "right on the head!"
	done

.SeenText:
	text "There's rocks"
	line "falling from the"
	cont "floor upstairs!"
	
	para "Is that you doin'"
	line "that?"
	done

.BeatenText:
	text "Oh no!"
	done
	
TrainerGreenGrottoB1F_4:
	generictrainer GUITARIST, MILLER, EVENT_BEAT_GREEN_GROTTO_B1F_TRAINER_4, .SeenText, .BeatenText

	text "Listen to that"
	line "sound!"
	
	para "I'm jammin'!"
	done

.SeenText:
	text "This cave has"
	line "great acoustics."
	
	para "It's the perfect"
	line "place for jammin'"
	cont "out!"
	done

.BeatenText:
	text "I was too busy"
	line "jammin' out!"
	done
	
TrainerGreenGrottoB1F_5:
	generictrainer SPA_TRAINER_F, ANDREA, EVENT_BEAT_GREEN_GROTTO_B1F_TRAINER_5, .SeenText, .BeatenText

	text "I didn't think"
	line "anyone else was"
	cont "around…"
	
	para "I left my clothes"
	line "on the shore!"
	done

.SeenText:
	text "EEEEEK!"
	
	para "What are you"
	line "doing here, you"
	cont "creep?"
	done

.BeatenText:
	text "You weren't"
	line "sneaking a peak?"
	done

GreenGrottoB1FRock1:
	dw EVENT_GREEN_GROTTO_BOULDER_1
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock2:
	dw EVENT_GREEN_GROTTO_BOULDER_2
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock3:
	dw EVENT_GREEN_GROTTO_BOULDER_3
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock4:
	dw EVENT_GREEN_GROTTO_BOULDER_4
	jumptext GreenGrottoB1FRockText1
	
GreenGrottoB1FRock5:
	dw EVENT_GREEN_GROTTO_BOULDER_5
	jumptext GreenGrottoB1FRockText2

GreenGrottoB1FRockText1:
	text "It's lodged into"
	line "place and can be"
	cont "walked on."
	done
	
GreenGrottoB1FRockText2:
	text "It's lodged into"
	line "place."
	done
