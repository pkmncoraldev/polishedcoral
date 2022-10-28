Route8_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route8Callback

	db 3 ; warp events
	warp_def 39, 45, 1, ROUTE_8_GATE
	warp_def 39, 46, 2, ROUTE_8_GATE
	warp_def 11, 17, 1, ROUTE_8_ENCOUNTER_HOUSE

	db 1 ; coord events
	bg_event 35, 20, SIGNPOST_ITEM + DAWN_STONE, EVENT_ROUTE_8_HIDDEN_DAWN_STONE

	db 4 ; bg events
	signpost 34, 48, SIGNPOST_READ, Route8Sign
	signpost 10, 24, SIGNPOST_READ, Route8Flowers
	signpost 11, 24, SIGNPOST_READ, Route8Flowers
	signpost 12, 18, SIGNPOST_READ, Route8FlowerHouseSign

	db 11 ; object events
	person_event SPRITE_YOUNGSTER, 13, 25, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route8NPC1, -1
	person_event SPRITE_BATTLE_GIRL, 29, 45, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route8NPC2, -1
	person_event SPRITE_POKEFAN_F, 10, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route8NPC3, -1
	person_event SPRITE_FISHER, 14, 37, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute8_1, -1
	person_event SPRITE_POKEFAN_M, 19, 49, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute8_2, -1
	person_event SPRITE_POKEFAN_F, 26, 52, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute8_3, -1
	person_event SPRITE_BEAUTY, 21, 29, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute8_4, -1
	cuttree_event  4, -1, EVENT_ROUTE_3_CUT_TREE_3
	fruittree_event 18, 16, FRUITTREE_ROUTE_8_1, CHESTO_BERRY
	fruittree_event 16, 16, FRUITTREE_ROUTE_8_2, CHERI_BERRY
	itemball_event 32, -2, RARE_CANDY, 1, EVENT_ROUTE_3_RARE_CANDY

Route8Callback:
	clearflag ENGINE_ENCOUNTER_HOUSE
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	return
	
Route8NPC1:
	jumptextfaceplayer Route8NPC1Text
	
Route8NPC2:
	jumptextfaceplayer Route8NPC2Text
	
Route8NPC3:
	jumptextfaceplayer Route8NPC3Text
	
Route8Sign:
	jumptext Route8SignText
	
Route8Flowers:
	jumptext Route8FlowersText
	
Route8FlowerHouseSign:
	jumptext Route8FlowerHouseSignText
	
TrainerRoute8_1:
	generictrainer FISHER, LESLIE, EVENT_BEAT_ROUTE_8_TRAINER_1, .SeenText, .BeatenText
	
	text "I came here to"
	line "fish because it"
	cont "was quiet and"
	cont "secluded,"
	
	para "but more and more"
	line "people hang around"
	cont "here everyday…"
	done

.SeenText:
	text "Gah!"
	
	para "Can't I get some"
	line "peace?"
	done

.BeatenText:
	text "Gah!"
	done
	
TrainerRoute8_2:
	generictrainer POKEFANM, REG, EVENT_BEAT_ROUTE_8_TRAINER_2, .SeenText, .BeatenText

	text "You're #MON are"
	line "seriously good!"
	done

.SeenText:
	text "Do you like"
	line "SWABLU?"
	
	para "It's my favorite!"
	done

.BeatenText:
	text "My SWABLU!"
	done
	
TrainerRoute8_3:
	generictrainer POKEFANF, NICHOLE, EVENT_BEAT_ROUTE_8_TRAINER_3, .SeenText, .BeatenText

	text "You seem to have"
	line "trained your #-"
	cont "MON with love and"
	cont "care."
	done

.SeenText:
	text "Hello!"
	
	para "Are you a fellow"
	line "#MON lover?"
	done

.BeatenText:
	text "Yes you are!"
	done
	
TrainerRoute8_4:
	generictrainer BEAUTY, BRITNEY, EVENT_BEAT_ROUTE_8_TRAINER_4, .SeenText, .BeatenText

	text "All things lose"
	line "their beauty."
	
	para "Even the blooming"
	line "flowers will wilt…"
	done

.SeenText:
	text "The flowers at"
	line "the house up"
	cont "ahead are so"
	cont "beautiful!"
	done

.BeatenText:
	text "Wilted like a"
	line "flower…"
	done
	
Route8NPC1Text:
	text "The lady in that"
	line "house really likes"
	cont "likes to brag"
	cont "about her flowers."
	
	para "I guess they ARE"
	line "kinda pretty…"
	done
	
Route8NPC2Text:
	text "Can't talk…"
	
	para "Looking for #-"
	line "MON…"
	done
	
Route8NPC3Text:
	text "Ah!"
	
	para "Feels nice to"
	line "finally sit down!"
	
	para "Thanks whoever put"
	line "a bench here!"
	done
	
Route8SignText:
	text "ROUTE 8"
	
	para "NORTH:"
	line "ROUTE 3"
	
	para "SOUTH:"
	line "LAKE ONWA"
	done
	
Route8FlowersText:
	text "Some pretty"
	line "flowers."
	
	para "They smell really"
	line "good!"
	done
	
Route8FlowerHouseSignText:
	text "MADAME DAHLIA'S"
	line "HOUSE OF FLOWERS"
	done
