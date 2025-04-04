SunbeamBeach_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 5 ; bg events
	bg_event  6, 20, SIGNPOST_ITEM + WATER_STONE, EVENT_SUNBEAM_BEACH_HIDDEN_WATER_STONE
	bg_event 10, 29, SIGNPOST_ITEM + TAPE_PLAYER, EVENT_MUSIC_SUNBEAM_ISLAND
	signpost 39, 16, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SUNBEAM_BEACH_HIDDEN_BOTTLE_CAP_1
	signpost 23, 10, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SUNBEAM_BEACH_HIDDEN_BOTTLE_CAP_2
	signpost 29, 15, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SUNBEAM_BEACH_HIDDEN_BOTTLE_CAP_3

	db 16 ; object events
	person_event SPRITE_CANDLE, 33, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, 19, 4, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, SunbeamIslandSunbatherNite, -1
	person_event SPRITE_SUNBATHER, 33, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandSunbather, -1
	person_event SPRITE_TRUNKS, 18, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamBeachTrunks1, -1
	person_event SPRITE_TRUNKS, 37, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunbeamBeachTrunks2, -1
	person_event SPRITE_SWIMMER_GIRL_LAND, 24, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamBeachBikini, -1
	person_event SPRITE_SCHOOLGIRL, 45,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamBeachGirl, -1
	person_event SPRITE_CHILD, 45, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamBeachBoy, -1
	person_event SPRITE_SWIMMER_GIRL_LAND, 42, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamBeachBikini2, -1
	person_event SPRITE_UMBRELLA, 26, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 26, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 32, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 32, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 40, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 40, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SUPER_NERD, 47, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
	hiddentape_event 10, 29, MUSIC_SUNBEAM_ISLAND, 1, EVENT_MUSIC_SUNBEAM_ISLAND

SunbeamIslandSunbather:
	jumptext SunbeamIslandSunbatherText
SunbeamIslandSunbatherNite:
	jumptext SunbeamIslandSunbatherText2
	
SunbeamBeachTrunks1:
	jumptextfaceplayer SunbeamBeachTrunks1Text
	
SunbeamBeachTrunks2:
	jumptextfaceplayer SunbeamBeachTrunks2Text
	
SunbeamBeachBikini:
	jumptextfaceplayer SunbeamBeachBikiniText
	
SunbeamBeachGirl:
	jumptextfaceplayer SunbeamBeachGirlText
	
SunbeamBeachBoy:
	jumptextfaceplayer SunbeamBeachBoyText
	
SunbeamBeachBikini2:
	jumptextfaceplayer SunbeamBeachBikini2Text
	
SunbeamBeachGirlText:
	text "We collect BOTTLE"
	line "CAPs that wash"
	cont "up on the beach!"
	done
	
SunbeamBeachBoyText:
	text "Seashells are"
	line "boring!"
	
	para "BOTTLE CAPs are"
	line "way better!"
	done
	
SunbeamBeachBikini2Text:
	text "You're not going"
	line "swimming dressed"
	cont "like that, right?"
	done
	
SunbeamBeachTrunks1Text:
	text "I can't hold it"
	line "in any longer…"
	
	para "I've just gotta"
	line "tell her the"
	cont "truth…"
	
	para "That girl over"
	line "there…"
	
	para "She's… <WAIT_L>She's…"
	
	para "She's got a piece"
	line "of seaweed stuck"
	cont "in her hair!"
	done
	
SunbeamBeachTrunks2Text:
	text "The beach is a"
	line "great place to"
	cont "meet girls!"
	
	para "That's the only"
	line "reason I'm here."
	
	para "I don't even know"
	line "how to swim!"
	done
	
SunbeamBeachBikiniText:
	text "That guy up there"
	line "keeps staring at"
	cont "me!"
	
	para "Weirdo…"
	done
	
SunbeamIslandSunbatherText:
	text "Can I help you?"
	
	para "You're blocking"
	line "my sun."
	done
	
SunbeamIslandSunbatherText2:
	text "…"
	
	para "She's sleeping!"
	
	para "Her skin looks"
	line "pretty red…"
	done
	
SunbeamIslandSunbatherText3:
	text "…"
	
	para "She fell asleep"
	line "again…"
	done
	
SunbeamIslandSunbatherText4:
	text "Huh?"
	
	para "Why's it so dark"
	line "out?"
	
	para "Ow! <WAIT_S>Ow!"
	
	para "Sunburn!"
	
	para "I must've fallen"
	line "asleep sunbathing"
	cont "again!"
	
	para "Just take this and"
	line "leave me alone!"
	
	para "I'm just gonna lie"
	line "here a little"
	cont "longer…"
	done
	
SunbeamBeachFluteDidntWorkText:
	text "It didn't work…"
	
	para "She's really out…"
	done
	
SunbeamPlayedFluteForSleepingBeauty::
	writetext SunbeamTextUseFlute
	playsound SFX_POKEFLUTE
	waitsfx
	closetext
	wait 10
	opentext
	checkevent EVENT_GOT_ITEM_FROM_SUNBATHER
	iftrue .gotitem
	writetext SunbeamIslandSunbatherText4
	waitbutton
	verbosegiveitem BLACKGLASSES
	iffalse .NoRoom
	writetext SunbeamIslandSunbatherText3
	waitbutton
	closetext
	setevent EVENT_GOT_ITEM_FROM_SUNBATHER
	end
.gotitem
	writetext SunbeamBeachFluteDidntWorkText
	waitbutton
	closetext
	end
.NoRoom
	writetext SunbeamBeachFluteNoRoomText
	waitbutton
	closetext
	end
	
SunbeamBeachFluteNoRoomText:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
