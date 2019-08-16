SunsetCafe_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SUNSET_BAY, 3
	warp_event  3,  7, SUNSET_BAY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_FAT_GUY,  4,  3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunsetCafeNPC1, -1
	person_event SPRITE_BATTLE_GIRL,  6,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetCafeNPC2, -1
	person_event SPRITE_CLERK,  3,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetCafeClerk, -1
	
	const_def 1 ; object constants
	const SUNSET_CAFE_NPC1
	const SUNSET_CAFE_NPC2
	const SUNSET_CAFE_CLERK

SunsetCafeClerk:
	pokemart MARTTYPE_INFORMAL, MART_SUNSET

SunsetCafeNPC1:
	jumptext SunsetCafeNPC1Text

SunsetCafeNPC2:
	jumptextfaceplayer SunsetCafeNPC2Text

	
SunsetCafeNPC1Text:
	text "Oooof…"
	
	para "Why do I always"
	line "over eat?"
	done

SunsetCafeNPC2Text:
	text "My favorite is"
	line "BERRY JUICE."
	
	para "Though, I hear"
	line "FRESH WATER is"
	cont "better for you."
	done
	
ClerkText:
	text "Hey, <PLAYER>."
	
	para "What can I get"
	line "you today?"
	done
	