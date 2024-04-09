DuskMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, DUSK_TURNPIKE, 12
	warp_event  2,  7, DUSK_TURNPIKE, 12

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_DUSK
	person_event SPRITE_ROCKER,  6,  6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DuskMartNPC1, -1
	person_event SPRITE_MATRON,  2,  8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DuskMartNPC2, -1
	
DuskMartNPC1:
	jumptextfaceplayer DuskMartNPC1Text
	
DuskMartNPC2:
	jumptextfaceplayer DuskMartNPC2Text
	
	
DuskMartNPC1Text:
	text "I'm so tired of"
	line "buying REPEL every"
	cont "single day!"
	
	para "Maybe I should"
	line "just bite the"
	cont "bullet and catch"
	cont "a #MON…"
	done
	
DuskMartNPC2Text:
	text "The #MART only"
	line "sells items for"
	cont "TRAINERS."
	
	para "If you want a"
	line "drink, you're"
	cont "better off at"
	cont "MOOMOO's."
	
	para "You look a little"
	line "young, though…"
	done
