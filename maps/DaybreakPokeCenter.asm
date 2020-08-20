DaybreakPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 5, 7, DAYBREAK_VILLAGE, 2
	warp_event 4, 7, DAYBREAK_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  4, 1
	person_event SPRITE_GENTLEMAN, 3, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, DaybreakPokeCenterNPC1, -1
	person_event SPRITE_POKEMANIAC, 6, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, DaybreakPokeCenterNPC2, -1
	person_event SPRITE_LEDYBA, 5, 8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DaybreakPokeCenterLedyba, -1
	object_event  5,  1, SPRITE_NUMEL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, DaybreakPokeCenterNumel, -1
	
	
	const_def 1 ; object constants
	const DAYBREAKPOKECENTER1F_NURSE
	const DAYBREAKPOKECENTER1F_GAMEBOY_KID
	const DAYBREAKPOKECENTER1F_GENTLEMAN
	const DAYBREAKPOKECENTER1F_YOUNGSTER
	const DAYBREAKPOKECENTER1F_NUMEL
	
DaybreakPokeCenterNumel:
	opentext
	writetext DaybreakPokeCenterNumelText
	cry NUMEL
	waitbutton
	closetext
	end
	
DaybreakPokeCenterNumelText:
	text "NUMEL: Sii!"
	done
	
DaybreakPokeCenterNPC1:
	jumptextfaceplayer DaybreakPokeCenterNPC1Text

DaybreakPokeCenterNPC2:
	jumptextfaceplayer DaybreakPokeCenterNPC2Text

DaybreakPokeCenterLedyba:
	opentext
	writetext DaybreakPokeCenterLedybaText
	cry LEDYBA
	waitbutton
	closetext
	end

DaybreakPokeCenterNPC1Text:
	text "You're a #MON"
	line "TRAINER, right?"
	
	para "We have quite the"
	line "variety of #MON"
	cont "around here."
	
	para "I say you should"
	line "catch a few."
	
	para "They may not look"
	line "like much now,"
	cont "but looks can be"
	cont "deceiving."
	done

DaybreakPokeCenterNPC2Text:
	text "My grandpa says"
	line "that weak #MON"
	cont "can turn into"
	cont "strong #MON."
	
	para "That's why I named"
	line "my LEDYBA CRUSHER!"
	done
	
DaybreakPokeCenterLedybaText:
	text "CRUSHER: …LEDY?"
	done