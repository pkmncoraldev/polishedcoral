GlintApartmentRight2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, GLINT_APARTMENT_RIGHT_1F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_BATTLE_GIRL, 5, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintApt22FNpc1, -1

	const_def 1 ; object constants
	const GLINT_APT22F_NPC1
	
GlintApt22FNpc1:
	jumptextfaceplayer GlintApt22FNpc1Text
	
GlintApt22FNpc1Text:
	text "GLINT CITY is nice"
	line "and all,"
	
	para "but I want to go"
	line "somewhere bigger!"
	
	para "I've always dreamed"
	line "of living in"
	cont "LUSTER CITY."
	
	para "I've heard they"
	line "have a huge mall"
	cont "with a GYM and a"
	cont "#MON CENTER in"
	cont "it!"
	done
