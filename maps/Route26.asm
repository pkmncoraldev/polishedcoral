Route26_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route26Callback

	db 2 ; warp events
	warp_def 15, 10, 1, KOMORE_COMMUNITY_CENTER
	warp_def 15, 11, 2, KOMORE_COMMUNITY_CENTER

	db 0 ; coord events

	db 8 ; bg events
	signpost 16,  9, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign
	signpost  4, 38, SIGNPOST_IFNOTSET, Route26Tree
	signpost  5, 38, SIGNPOST_IFNOTSET, Route26Tree
	signpost 24, 31, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_26_HIDDEN_GOLD_LEAF
	signpost  8, 17, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_26_HIDDEN_SILVER_LEAF_1
	signpost 12, 21, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_26_HIDDEN_SILVER_LEAF_2
	signpost 22, 21, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_26_HIDDEN_SILVER_LEAF_3
	signpost 24, 19, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_26_HIDDEN_SILVER_LEAF_4

	db 8 ; object events
	object_event -2, 28, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -2, 28, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_CAMPER, 18, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route26NPC, -1
	person_event SPRITE_REDS_MOM, 16, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route26NPC2, -1
	person_event SPRITE_BATTLE_GIRL, 25, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, Route26Trainer1, -1
	person_event SPRITE_POKEFAN_F, 10, 27, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route26Trainer2, -1
	person_event SPRITE_BURGLAR, 26, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route26Trainer3, -1
	itemball_event 23, 10, GOLD_LEAF, 1, EVENT_ROUTE_26_POKE_BALL


Route26Callback:
	checkevent EVENT_ROUTE_26_TREE
	iffalse .skip
	changeblock $26, $04, $bb
.skip
	jump Route23Callback2

Route26Tree:
	dw EVENT_ROUTE_26_TREE
	strengthtree
	iffalse .end
	changeblock $26, $04, $bb
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_ROUTE_26_TREE
.end
	end

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
	
Route26NPC2:
	jumptextfaceplayer Route26NPC2Text
	
Route26NPC2Text:
	text "Nearby there's an"
	line "old building."
	
	para "It used to be our"
	line "COMMUNITY CENTER."
	
	para "Strange things"
	line "started happening"
	cont "inside."
	
	para "People reported"
	line "noises and the"
	cont "feeling of being"
	cont "watched."
	
	para "As such, it fell"
	line "out of use and"
	cont "into disrepair."
	done
	
Route26Trainer1:
	generictrainer BATTLE_GIRL, SHOO, EVENT_BEAT_ROUTE_26_TRAINER_1, .SeenText, .BeatenText

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
	generictrainer POKEFANF, YVONNE, EVENT_BEAT_ROUTE_26_TRAINER_2, .SeenText, .BeatenText

	text "I thought I saw"
	line "a PIKACHU run off"
	cont "into the woods"
	cont "near the old"
	cont "COMMUNITY CENTER."
	
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
	
Route26Trainer3:
	generictrainer BURGLAR, JONESY, EVENT_BEAT_ROUTE_26_TRAINER_3, .SeenText, .BeatenText

	text "You're gonna try"
	line "and hit that"
	cont "abandoned building"
	cont "before me, huh?"
	
	para "That's what I get"
	line "for givin' out"
	cont "a tip!"
	done

.SeenText:
	text "Heard there's an"
	line "abandoned building"
	cont "around here."
	
	para "Wonder if there's"
	line "any loot there to"
	cont "nab!"
	done

.BeatenText:
	text "Bah!"
	done
	
Route26Windy_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	