SunsetPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 5, 7, SUNSET_BAY, 2
	warp_event 4, 7, SUNSET_BAY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	object_event  3,  3, SPRITE_CHILD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetPokeCenterYoungin, -1
	object_event  9,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetPokeCenterFireGuy, -1
	object_event 10,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunsetPokeCenterFairyGirl, -1
	
	const_def 1 ; object constants
	const SUNSET_POKECENTER_NURSE
	const SUNSET_POKECENTER_CHANSEY
	const SUNSET_POKECENTER_NPC1
	const SUNSET_POKECENTER_NPC2
	const SUNSET_POKECENTER_NPC3

SunsetPokeCenterYoungin:
	jumptextfaceplayer SunsetPokeCenterSunsetPokeCenterYounginText

SunsetPokeCenterFireGuy:
	jumptextfaceplayer SunsetPokeCenterFireGuyText

SunsetPokeCenterFairyGirl:
	jumptextfaceplayer SunsetPokeCenterFairyGirlText

SunsetPokeCenterSunsetPokeCenterYounginText:
	text "I want to be a"
	line "#MON trainer,"
	
	para "but I'm not old"
	line "enough yet."
	
	para "I come here to"
	line "see as many"
	cont "#MON as I can."
	done

SunsetPokeCenterFireGuyText:
	text "Have you talked"
	line "to my sister and"
	cont "her husband in the"
	cont "house next door?"
	
	para "Don't listen to"
	line "them!"
	
	para "FIRE #MON are"
	line "the best #MON!"
	done

SunsetPokeCenterFairyGirlText:
	text "Have you heard of"
	line "FAIRY #MON?"
	
	para "They're great and"
	line "all so adorable!"
	done
