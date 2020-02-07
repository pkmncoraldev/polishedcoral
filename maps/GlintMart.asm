GlintMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, GLINT_CITY, 2
	warp_event  3,  7, GLINT_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_GLINT
	person_event SPRITE_FISHING_GURU, 2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GlintMartNpc1, -1
	person_event SPRITE_POKEFAN_F, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintMartNpc2, -1

	const_def 1 ; object constants
	const GLINTMART_CLERK
	const GLINTMART_NPC1
	const GLINTMART_NPC2
	
GlintMartNpc1:
	jumptextfaceplayer GlintMartNpc1Text

GlintMartNpc2:
	jumptextfaceplayer GlintMartNpc2Text

GlintMartNpc1Text:
	text "I'm on my way to"
	line "GLINT GROVE to"
	cont "catch some FAIRY"
	cont "#MON."
	
	para "I just needed to"
	line "stop by the MART"
	cont "to grab some #-"
	cont "BALLS."
	
	para "You should grab"
	line "some too."
	done

GlintMartNpc2Text:
	text "I'm looking for a"
	line "#DOLL for my"
	cont "little girl."
	
	para "They don't seem to"
	line "have anything like"
	cont "that here, though."
	done