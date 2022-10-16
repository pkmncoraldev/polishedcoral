GlintApartmentLeft1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 7, 2, 5, GLINT_CITY
	warp_def 7, 3, 5, GLINT_CITY
	warp_def 1, 6, 1, GLINT_APARTMENT_LEFT_2F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GRAMPS, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintApt11FNpc1, -1
	person_event SPRITE_ELDER, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GlintApt11FNpc2, -1

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
	checkevent EVENT_GOT_HM06_ROCK_SMASH
	iftrue .gotrocksmash
	writetext GlintApt11FNpc2Text1
	waitbutton
	verbosegivetmhm HM_ROCK_SMASH
	setevent EVENT_GOT_HM06_ROCK_SMASH
	setflag ENGINE_GOT_ROCK_SMASH
	writetext GlintApt11FNpc2Text2
	buttonsound
	farwritetext StdBlankText
	pause 6
.gotrocksmash:
	writetext GlintApt11FNpc2Text3
	waitbutton
	closetext
	spriteface GLINT_APT11F_NPC2, RIGHT
	end
	
GlintApt11FNpc1Text:
	text "Moves are more"
	line "powerful if used"
	cont "by a #MON that"
	cont "is the same type."
	
	para "For example,"
	
	para "a FIGHTING TYPE"
	line "move will be"
	cont "stronger if used"
	cont "by a FIGHTING TYPE"
	cont "#MON!"
	done
	
GlintApt11FNpc2Text1:
	text "Are you a #MON"
	line "TRAINER?"
	
	para "Of course you are,"
	line "just look at you!"
	
	para "I love to meet"
	line "aspiring young"
	cont "TRAINERS!"
	
	para "Take this as a"
	line "gift from an old"
	cont "TRAINER to a new"
	cont "one."
	done
	
GlintApt11FNpc2Text2:
	text "That's an HM."
	
	para "That's short for"
	line "HIDDEN MACHINE."
	
	para "HMs teach your"
	line "#MON new moves."
	
	para "You can also"
	line "use HMs outside of"
	cont "battle to reach"
	cont "new areas if you"
	cont "have the right"
	cont "GYM BADGE."
	
	para "Your #MON"
	line "doesn't even need"
	cont "to learn the move"
	cont "to use it outside"
	cont "of battle."
	done
	
GlintApt11FNpc2Text3:
	text "That HM will teach"
	line "ROCK SMASH."
	
	para "It's a FIGHTING"
	line "TYPE move,"
	
	para "so it might come"
	line "in handy against"
	cont "NORMAL TYPE"
	cont "#MON!"
	done
	