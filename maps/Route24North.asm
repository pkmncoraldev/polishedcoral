Route24North_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_BLACK_BELT, 20, 31, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route24NorthNPC, -1
	person_event SPRITE_BEAUTY, 27, 29, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route24NorthTrainer1, -1
	person_event SPRITE_BIRD_KEEPER, 25, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route24NorthTrainer2, -1
	itemball_event 30, 25, BLACK_BELT, 1, EVENT_ROUTE_24_POKE_BALL


	const_def 1 ; object constants
	const ROUTE_24_NORTH_LEAF_1
	const ROUTE_24_NORTH_LEAF_2
	const ROUTE_24_NORTH_NPC

Route24NorthTrainer1:
	generictrainer BEAUTY, MANDY, EVENT_BEAT_ROUTE_24_NORTH_TRAINER_1, .SeenText, .BeatenText

	text "Some people are a"
	line "summer."
	
	para "Some people are a"
	line "spring."
	
	para "Me? <WAIT_S>I'm definitely"
	line "a fall!"
	done

.SeenText:
	text "Isn't it so pretty"
	line "here?"
	
	para "The orange leaves"
	line "really bring out"
	cont "my complexion!"
	
	para "Don't they just"
	line "make my eyes pop?"
	done

.BeatenText:
	text "Pop! <WAIT_S>Pop! <WAIT_S>Pop!"
	done

Route24NorthTrainer2:
	generictrainer BIRD_KEEPER, SIDNEY, EVENT_BEAT_ROUTE_24_NORTH_TRAINER_2, .SeenText, .BeatenText

	text "You can find some"
	line "pretty fierce bird"
	cont "#MON here on"
	cont "windy days!"
	done

.SeenText:
	text "Better look out!"
	
	para "My fierce birds"
	line "will slice you to"
	cont "pieces!"
	done

.BeatenText:
	text "Oh no!<WAIT_M>"
	line "SKARMORY!"
	done

Route24NorthNPC:
	faceplayer
	opentext
	writetext Route24NorthNPCText
	waitbutton
	closetext
	spriteface ROUTE_24_NORTH_NPC, UP
	end

Route24NorthNPCText:
	text "I came here to do"
	line "waterfall training"
	cont "under the falls"
	cont "to the NORTH."
	
	para "I've run into a"
	line "bit of a problem,"
	cont "however…"
	
	para "I forgot that I"
	line "can't swim!"
	done

Route24NorthWindy_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
