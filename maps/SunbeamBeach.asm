SunbeamBeach_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	person_event SPRITE_ROWBOAT, 29, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandSunbather, -1
	person_event SPRITE_TRUNKS, 17,  8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, 4, 19, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_TRUNKS, 33,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 4, 19, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BIKINI_2, 22, 10, SPRITEMOVEDATA_WANDER, 1, 1, 4, 19, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_UMBRELLA, 24, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 24, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 28, 11, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_UMBRELLA, 28, 12, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SUPER_NERD, 45, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1

SunbeamIslandSunbather:
	checktime 1<<NITE
	iftrue .nite
	jumptext SunbeamIslandSunbatherText
.nite
	jumptext SunbeamIslandSunbatherText2
	
SunbeamIslandSunbatherText:
	text "Can I help you?"
	
	para "You're blocking"
	line "my sun."
	done
	
SunbeamIslandSunbatherText2:
	text "…"
	
	para "She's sleeping…"
	done
	
SunbeamIslandSunbatherText3:
	text "…"
	
	para "She fell asleep"
	line "again…"
	done
	
SunbeamIslandSunbatherText4:
	text "Huh?"
	
	para "What do you want?"
	
	para "Just take this and"
	line "leave me alone!"
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
	verbosegiveitem POTION
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
