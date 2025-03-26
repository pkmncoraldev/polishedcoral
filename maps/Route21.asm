Route21_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 17, 29, ROUTE_21_GATE, 1
	warp_event 18, 29, ROUTE_21_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	signpost  4, 20, SIGNPOST_JUMPTEXT, Route21Sign
	signpost 26, 19, SIGNPOST_JUMPTEXT, Route21Sign
	
	db 11 ; object events
	tapeball_event 18, 9, MUSIC_WILD_VICTORY, 2, EVENT_MUSIC_WILD_VICTORY
	cuttree_event 12, 23, EVENT_ROUTE_21_CUT_TREE_1
	cuttree_event 20, 18, EVENT_ROUTE_21_CUT_TREE_2
	cuttree_event 21, 18, EVENT_ROUTE_21_CUT_TREE_3
	fruittree_event 12, 22, FRUITTREE_ROUTE_21_1, ORAN_BERRY
	fruittree_event  8, 24, FRUITTREE_ROUTE_21_2, PERSIM_BERRY
	fruittree_event  7, 22, FRUITTREE_ROUTE_21_3, SITRUS_BERRY
;	person_event SPRITE_PICNICKER, 11,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, Route21Trainer1, -1
	person_event SPRITE_PSYCHIC, 21, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route21Trainer1, -1
	person_event SPRITE_ROCKER,  5, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route21Trainer2, -1
	person_event SPRITE_SKATER, 15, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route21Trainer3, -1
	person_event SPRITE_BIRD_KEEPER, 24, 17, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route21Npc, -1
	
	const_def 1 ; object constants
	const ROUTE_21_POKE_BALL
	const ROUTE_21_CUT_TREE_1
	const ROUTE_21_CUT_TREE_2
	const ROUTE_21_CUT_TREE_3
	const ROUTE_21_BERRY_TREE_1
	const ROUTE_21_BERRY_TREE_2
	const ROUTE_21_BERRY_TREE_3
	
Route21Sign:
	text "ROUTE 21"
	
	para "NORTH:"
	line "DUSK TURNPIKE"
	
	para "SOUTH:"
	line "RADIANT TOWN"
	done
	
Route21Npc:
	jumptextfaceplayer Route21NpcText
	
Route21NpcText:
	text "I may look tough,"
	line "but I like coming"
	cont "to RADIANT TOWN"
	cont "to look at the"
	cont "beautiful flowers."
	
	para "Don't tell the"
	line "fellas at MOOMOO's…"
	done
	
;Route21Trainer1:
;	generictrainer PICNICKER, BAILEY, EVENT_BEAT_ROUTE_21_TRAINER_1, .SeenText, .BeatenText
;
;	text "Hmph!"
;	
;	para "My now stroll is"
;	line "all ruined!"
;	done

;.SeenText:
;	text "Isn't this such a"
;	line "plesant path?"
	
;	para "Just perfect for"
;	line "a nice stroll!"
;	done

;.BeatenText:
;	text "Hmph!"
;	done
	
Route21Trainer1:
	generictrainer PSYCHIC_T, LINUS, EVENT_BEAT_ROUTE_21_TRAINER_1, .SeenText, .BeatenText

	text "Hmmm…"
	
	para "I definitely feel"
	line "something…"
	
	para "Could you possess"
	line "the gift?"
	done

.SeenText:
	text "Ah!"
	
	para "Forgive me."
	
	para "For a moment I"
	line "thought I felt"
	cont "something…"
	done

.BeatenText:
	text "Hmmm…"
	done
	
Route21Trainer2:
	generictrainer GUITARIST, TITO, EVENT_BEAT_ROUTE_21_TRAINER_2, .SeenText, .BeatenText

	text "You and your"
	line "#MON may rock"
	cont "at battle,"
	
	para "but you'll never"
	line "shred like me!"
	done

.SeenText:
	text "Yo!"
	
	para "Check out this"
	line "riff!"
	done

.BeatenText:
	text "Heavy…"
	done
	
Route21Trainer3:
	generictrainer SKATER, CHAD, EVENT_BEAT_ROUTE_21_TRAINER_3, .SeenText, .BeatenText

	text "Oh yeah."
	
	para "You got the skills"
	line "for sure!"
	done

.SeenText:
	text "Jumping down a"
	line "ledge is easy."
	
	para "Jumping up takes"
	line "some real skill."
	done

.BeatenText:
	text "Gnarly!"
	done
	