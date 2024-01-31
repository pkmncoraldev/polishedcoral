GlintGroveEast_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  5, 11, 1, GLINT_GROVE_DEEP

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_MINA, 13,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveEastMina, EVENT_GLINT_GROVE_MINA_GONE
	smashrock_event  9, 12
	smashrock_event  9, 18
	
	const_def 1 ; object constants
	const GLINT_GROVE_EAST_MINA
	
GlintGroveEastMina:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MINA_ONCE
	iftrue .talked
	writetext GlintGroveEastMinaText1
	buttonsound
	farwritetext StdBlankText
	pause 6
.talked
	writetext GlintGroveEastMinaText2
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_MINA_ONCE
	end
	
GlintGroveEastMinaText1:
	text "ALOLA!"
	
	para "Oh… I guess you"
	line "don't say that"
	cont "around here, huh?"
	
	para "Well anyway,"
	line "my name is MINA."
	
	para "I'm a painter."
	
	para "I'm always on the"
	line "lookout for my"
	cont "next source of"
	cont "inspiration!"
	
	para "I came here to"
	line "paint this grove"
	cont "and it's #MON."
	
	para "It's been fine"
	line "and all, but I'm"
	cont "missing my spark!"
	
	para "There's a rumor of"
	line "a #MON with a"
	cont "long, gooey tail"
	cont "somewhere around"
	cont "here."
	
	para "Now THAT gets me"
	line "all inspired!"
	done
	
GlintGroveEastMinaText2:
	text "I saw something"
	line "just up there,"
	cont "but this rock is"
	cont "in the way."
	
	para "If only I could"
	line "just smash it to"
	cont "pieces!"
	done
