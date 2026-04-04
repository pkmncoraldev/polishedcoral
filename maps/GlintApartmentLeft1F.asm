GlintApartmentLeft1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 5, GLINT_CITY
	warp_def 7, 3, 5, GLINT_CITY
	warp_def 1, 6, 1, GLINT_APARTMENT_LEFT_2F

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_GRAMPS, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintApt11FNpc1, -1
	person_event SPRITE_ELDER, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GlintApt11FNpc2, -1
	person_event SPRITE_SUPER_NERD, 4, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GlintApt11FNpc3, -1

	const_def 1 ; object constants
	const GLINT_APT11F_NPC1
	const GLINT_APT11F_NPC2
	
GlintApt11FNpc1:
	faceplayer
	opentext
	writetext GlintApt11FNpc1Text
	waitbutton
	spriteface GLINT_APT11F_NPC1, LEFT
	closetext
	end
	
GlintApt11FNpc2:
	faceplayer
	opentext
	writetext GlintApt11FNpc2Text
	waitbutton
	spriteface GLINT_APT11F_NPC2, RIGHT
	closetext
	end
	
GlintApt11FNpc3:
	jumptextfaceplayer GlintApt11FNpc3Text
	
GlintApt11FNpc1Text:
	text "Moves are more"
	line "powerful if used"
	cont "by a #MON that"
	cont "is the same type."
	
	para "For example,"
	
	para "a FIGHTING-type"
	line "move will be"
	cont "stronger if used"
	cont "by a FIGHTING-type"
	cont "#MON!"
	
	para "Nice bonus!"
	done
	
GlintApt11FNpc2Text:
	text "Have you heard of"
	line "HIDDEN MACHINES?"
	
	para "HMs can let your"
	line "#MON use moves"
	cont "to reach new areas"
	cont "if you have the"
	cont "right GYM BADGE."
	
	para "Your #MON"
	line "doesn't even need"
	cont "to learn the move"
	cont "to use it outside"
	cont "of battle!"
	done
	
GlintApt11FNpc2Text3:
	text "That HM will teach"
	line "ROCK SMASH."
	
	para "It's a FIGHTING-"
	line "type move,"
	
	para "so it might come"
	line "in handy against"
	cont "NORMAL-type"
	cont "#MON!"
	done
	
GlintApt11FNpc3Text:
	text "I saw a cute girl"
	line "trying to smash up"
	cont "the rocks in the"
	cont "grove earlier."
	
	para "She was running"
	line "into some kind of"
	cont "issue it seems."
	done
	