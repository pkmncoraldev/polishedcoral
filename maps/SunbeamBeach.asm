SunbeamBeach_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 22, SIGNPOST_ITEM + WATER_STONE, EVENT_SUNBEAM_BEACH_HIDDEN_WATER_STONE

	db 10 ; object events
	person_event SPRITE_CANDLE, 31, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, 19, 4, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, SunbeamIslandSunbatherNite, -1
	person_event SPRITE_ROWBOAT, 31, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandSunbather, -1
	person_event SPRITE_TRUNKS, 20, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, 4, 19, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamBeachTrunks1, -1
	person_event SPRITE_TRUNKS, 35, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 4, 19, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunbeamBeachTrunks2, -1
	person_event SPRITE_BIKINI_2, 24, 14, SPRITEMOVEDATA_WANDER, 1, 1, 4, 19, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamBeachBikini, -1
	person_event SPRITE_UMBRELLA, 26, 15, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 26, 16, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 30, 15, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 30, 16, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SUPER_NERD, 47, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1

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
	
SunbeamBeachTrunks1Text:
	text "Man…"
	
	para "Those girls are so"
	line "pretty…"
	
	para "I'm just too shy"
	line "to talk to any of"
	cont "them…"
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
	
	para "Ow ow!"
	
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
