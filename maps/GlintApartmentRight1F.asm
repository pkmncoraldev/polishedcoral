GlintApartmentRight1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 6, GLINT_CITY
	warp_def 7, 3, 6, GLINT_CITY
	warp_def 1, 6, 1, GLINT_APARTMENT_RIGHT_2F

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_POKEFAN_M, 3, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintApt21FNpc1, -1
	person_event SPRITE_MATRON, 3, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintApt21FNpc2, -1
	person_event SPRITE_SUPER_NERD, 4, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GlintApt21FNpc3, -1

	const_def 1 ; object constants
	const GLINT_APT21F_NPC1
	const GLINT_APT21F_NPC2
	const GLINT_APT21F_NPC3

GlintApt21FNpc1:
	jumptextfaceplayer GlintApt21FNpc1Text
	
GlintApt21FNpc2:
	jumptextfaceplayer GlintApt21FNpc2Text
	
GlintApt21FNpc3:
	checkevent EVENT_GLINT_DEEP_MINA_GONE
	iftrue .mina_gone
	jumptextfaceplayer GlintApt21FNpc3Text1
.mina_gone
	jumptextfaceplayer GlintApt21FNpc3Text2
	
GlintApt21FNpc1Text:
	text "#MON can hold"
	line "items to use in"
	cont "battle."
	
	para "They'll use items"
	line "such as BERRIES"
	cont "all by themselves."
	done
	
GlintApt21FNpc2Text:
	text "#MON don't know"
	line "how to use manmade"
	cont "items like POTIONS"
	cont "or ANTIDOTE,"
	
	para "so don't bother"
	line "making them hold"
	cont "them."
	done
	
GlintApt21FNpc3Text1:
	text "There's a painter"
	line "girl from overseas"
	cont "staying upstairs."
	
	para "She's never around,"
	line "though."
	
	para "She always goes"
	line "off to the grove"
	cont "to paint."
	done
	
GlintApt21FNpc3Text2:
	text "That painter chick"
	line "that was staying"
	cont "upstairs is gone…"
	
	para "“MINA” I think it"
	line "was."
	
	para "She said something"
	line "about heading to"
	cont "the big city."
	done
	