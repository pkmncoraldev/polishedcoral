Route26_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 2 ; warp events
	warp_def 15, 10, 1, KOMORE_COMMUNITY_CENTER
	warp_def 15, 11, 2, KOMORE_COMMUNITY_CENTER

	db 0 ; coord events

	db 1 ; bg events
	signpost 16,  9, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign

	db 6 ; object events
	object_event -2, 28, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -2, 28, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_CAMPER, 18, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route26NPC, -1
	person_event SPRITE_SHAOLIN, 25, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route26Trainer1, -1
	person_event SPRITE_PSYCHIC, 21, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route26Trainer2, -1
	person_event SPRITE_POKEFAN_F, 10, 27, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route26Trainer3, -1


Route26NPC:
	jumptextfaceplayer Route26NPCText
	
Route26NPCText:
	text "This old building"
	line "gives me the"
	cont "creeps."
	
	para "It feels like I'm"
	line "being followed in"
	cont "there…"
	done
	
Route26Trainer1:
	generictrainer SHAOLIN, SHOO, EVENT_BEAT_ROUTE_26_TRAINER_1, .SeenText, .BeatenText

	text "You've trained"
	line "under the MASTER"
	cont "haven't you?"
	
	para "I can tell by"
	line "how you battle."
	done

.SeenText:
	text "Our battle shall"
	line "be spectacular."
	
	para "Let us begin."
	done

.BeatenText:
	text "Spectacular!"
	done
	
Route26Trainer2:
	generictrainer PSYCHIC_T, DAVID, EVENT_BEAT_ROUTE_26_TRAINER_2, .SeenText, .BeatenText

	text "It was probably"
	line "a coincidence…"
	done

.SeenText:
	text "I knew someone"
	line "would come along"
	cont "if I stood here."
	
	para "I had a feeling."
	
	para "…<WAIT_M>Or was it a"
	line "vision!?"
	done

.BeatenText:
	text "It's all clear"
	line "now!"
	done
	
Route26Trainer3:
	generictrainer POKEFANF, YVONNE, EVENT_BEAT_ROUTE_26_TRAINER_3, .SeenText, .BeatenText

	text "I thought I saw"
	line "a PIKACHU run off"
	cont "into the woods"
	cont "nearby."
	
	para "I wonder where"
	line "it was going!"
	done

.SeenText:
	text "Have you seen"
	line "anything strange"
	cont "around here?"
	
	para "I thought I saw"
	line "something odd"
	cont "earlier."
	done

.BeatenText:
	text "You won?<WAIT_M>"
	line "How odd!"
	done
	