ConnectingCavern_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ConnectingCavernChangeBlocks

	db 7 ; warp events
	warp_event 37,  5, DAYBREAK_GROTTO_3, 7
	warp_event 31,  5, CONNECTING_CAVERN, 3
	warp_event  9,  9, CONNECTING_CAVERN, 2
	warp_event 29, 45, SEASIDE_CAVE_B1F, 4
	warp_event  3, 30, CONNECTING_CAVERN, 6
	warp_event 19,  5, CONNECTING_CAVERN, 5
	warp_event 23,  5, CONNECTING_CAVERN_ENTRANCE, 4

	db 2 ; coord events
	xy_trigger 1, 24, 30, 0, ConnectingCavernUnderBridge, 0, 0
	xy_trigger 0, 22, 30, 0, ConnectingCavernOverBridge, 0, 0

	db 3 ; bg events
	bg_event 27, 17, SIGNPOST_ITEM + MAX_ELIXIR, EVENT_CONNECTING_CAVERN_HIDDEN_MAX_ELIXIR
	bg_event 22, 24, SIGNPOST_ITEM + MAX_ELIXIR, EVENT_CONNECTING_CAVERN_HIDDEN_RARE_CANDY
	bg_event 37, 25, SIGNPOST_ITEM + MAX_ELIXIR, EVENT_CONNECTING_CAVERN_HIDDEN_MAX_REVIVE

	db 19 ; object events
	person_event SPRITE_SAILOR, 12, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerConnectingCavern_1, -1
	person_event SPRITE_COOLTRAINER_F, 18, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, TrainerConnectingCavern_2, -1
	person_event SPRITE_SUPER_NERD, 28, 21, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerConnectingCavern_3, -1
	person_event SPRITE_PSYCHIC, 41, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerConnectingCavern_4, -1
	person_event SPRITE_PSYCHIC, 23, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerConnectingCavern_5, -1
	person_event SPRITE_SWIMMER_GIRL, 35, 11, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerConnectingCavern_6, -1
	person_event SPRITE_SWIMMER_GUY, 41, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerConnectingCavern_7, -1
	person_event SPRITE_JUGGLER, 21,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerConnectingCavern_8, -1
	person_event SPRITE_BLACK_BELT, 12, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerConnectingCavern_9, -1
	itemball_event 30, 15, EXP_SHARE, 1, EVENT_CONNECTING_CAVERN_EXP_SHARE
	itemball_event  4, 13, MAX_REVIVE, 1, EVENT_CONNECTING_CAVERN_MAX_REVIVE
	itemball_event 21, 29, RARE_CANDY, 1, EVENT_CONNECTING_CAVERN_RARE_CANDY
	tapeball_event 27, 14, MUSIC_DARKNESS, 1, EVENT_MUSIC_DARKNESS
	itemball_event 37, 36, METAL_COAT, 1, EVENT_CONNECTING_CAVERN_METAL_COAT
	tmhmball_event 16, 16, TM_BRICK_BREAK, EVENT_CONNECTING_CAVERN_BRICK_BREAK
	smashrock_event 32, 24
	smashrock_event 31, 24
	smashrock_event 18, 18
	smashrock_event 20,  2


ConnectingCavernChangeBlocks:
	checktmhm TM_FLASH
	iftrue .skip
	checkevent EVENT_SNARKY_GIRL_1
	iffalse .skip
	setevent EVENT_SNARKY_GIRL_2
.skip
	checkscene
	ifequal $1, .end
	ifequal $0, .changeblocks
	dotrigger $0
.end
	return
.changeblocks
	changeblock $1e, $10, $fc
	changeblock $1e, $12, $fd
	return
	
ConnectingCavernUnderBridge:
	changeblock $1e, $10, $fc
	changeblock $1e, $12, $fd
	callasm GenericFinishBridge
	dotrigger $0
	end
	
ConnectingCavernOverBridge:
	changeblock $1e, $10, $f8
	changeblock $1e, $12, $f9
	callasm GenericFinishBridge
	dotrigger $1
	end
	
TrainerConnectingCavern_1:
	generictrainer SAILOR, SHAWN, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_1, .SeenText, .BeatenText

	text "What is someone"
	line "like you even"
	cont "doing down here?"
	
	para "What is someone"
	line "like ME even"
	cont "doing down here?"
	done	

.SeenText:
	text "What am I even"
	line "doing?"
	
	para "Wandering around"
	line "in the dark…"
	done

.BeatenText:
	text "Gah, you got me!"
	done
	
TrainerConnectingCavern_2:
	generictrainer COOLTRAINERF, JANE, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_2, .SeenText, .BeatenText

	text "You can tell a lot"
	line "about a person by"
	cont "looking at their"
	cont "#MON."
	done	

.SeenText:
	text "Let me see your"
	line "#MON."
	
	para "Are they strong?"
	
	para "Do they trust you?"
	done

.BeatenText:
	text "I see!"
	done
	
TrainerConnectingCavern_3:
	generictrainer SUPER_NERD, PEDRO, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_3, .SeenText, .BeatenText

	text "Alright alright…"
	
	para "It's all yours…"
	done	

.SeenText:
	text "Heheh…"
	
	para "Lots of cool stuff"
	line "down here…"
	
	para "Just free for the"
	line "taking…"
	done

.BeatenText:
	text "Message recieved…"
	done
	
TrainerConnectingCavern_4:
	generictrainer PSYCHIC_T, RALPH, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_4, .SeenText, .BeatenText

	text "I can see you are"
	line "driven by your"
	cont "love of #MON!"
	done	

.SeenText:
	text "What drives you?"
	
	para "What makes you do"
	line "the things you do?"
	done

.BeatenText:
	text "I see!"
	line "I see!"
	done
	
TrainerConnectingCavern_5:
	generictrainer PSYCHIC_T, NELSON, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_5, .SeenText, .BeatenText

	text "The strong TRAINER"
	line "in my vision…"
	
	para "It was you!"
	done	

.SeenText:
	text "I came here due to"
	line "a vision I had."
	
	para "I saw myself"
	line "meeting a strong"
	cont "TRAINER!"
	done

.BeatenText:
	text "It was you!"
	done
	
TrainerConnectingCavern_6:
	generictrainer SWIMMERF, BECKY, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_6, .SeenText, .BeatenText

	text "Maybe I should"
	line "have just kept"
	cont "swimming…"
	done	

.SeenText:
	text "I was swimming"
	line "around in the"
	cont "ocean when I found"
	cont "this cave."
	done

.BeatenText:
	text "Guh huh?"
	done
	
TrainerConnectingCavern_7:
	generictrainer SWIMMERM, MARK, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_7, .SeenText, .BeatenText

	text "Swimming in the"
	line "dark isn't weird,"
	cont "right?"
	done	

.SeenText:
	text "I love swimming"
	line "in the dark!"
	
	para "It gets my blood"
	line "pumping!"
	done

.BeatenText:
	text "Blackout!"
	done
	
TrainerConnectingCavern_8:
	generictrainer JUGGLER, RYAN, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_8, .SeenText, .BeatenText

	text "Do you use"
	line "different types of"
	cont "#BALLs?"
	
	para "I use BALLs that"
	line "match my #MON!"
	done	

.SeenText:
	text "Check out all of"
	line "my #BALLs!"
	done

.BeatenText:
	text "Cool, huh?"
	done
	
TrainerConnectingCavern_9:
	generictrainer BLACKBELT_T, TOSHI, EVENT_BEAT_CONNECTING_CAVERN_TRAINER_9, .SeenText, .BeatenText

	text "Depriving myself"
	line "of my sense of"
	cont "sight allows me to"
	cont "focus my mind."
	done	

.SeenText:
	text "I come here to"
	line "train my body and"
	cont "mind in the pitch"
	cont "black."
	
	para "You are disturbing"
	line "my training!"
	done

.BeatenText:
	text "HIYA!"
	done