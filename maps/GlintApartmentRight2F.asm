GlintApartmentRight2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, GLINT_APARTMENT_RIGHT_1F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_BATTLE_GIRL, 5, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintApt22FNpc1, -1
	person_event SPRITE_ROCKER, 6, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintApt22FNpc2, -1

	const_def 1 ; object constants
	const GLINT_APT22F_NPC1
	
GlintApt22FNpc1:
	jumptextfaceplayer GlintApt22FNpc1Text
	
GlintApt22FNpc2:
	faceplayer
	checkevent EVENT_BEAT_STANLEY
	iffalse .haventbeaten
	checkevent EVENT_GOT_EXP_SHARE
	iftrue .got_expshare
	opentext
	writetext GlintApt22FNpc2Text2
	waitbutton
	verbosegiveitem EXP_SHARE
	setevent EVENT_GOT_EXP_SHARE
	closetext
	end
	
.haventbeaten
	jumptext GlintApt22FNpc2Text1
	
.got_expshare
	jumptext GlintApt22FNpc2Text3
	
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
	
GlintApt22FNpc2Text1:
	text "Are you planning"
	line "on battling the"
	cont "GYM LEADER?"
	
	para "If you win, make"
	line "sure to come back"
	cont "and share the"
	cont "experience with"
	cont "me!"
	
	para "I'll give you some-"
	line "thing really cool!"
	done
	
GlintApt22FNpc2Text2:
	text "WOAH!"
	
	para "You beat STANLEY?"
	
	para "Tell me all about"
	line "it!"
	
	para "…"
	
	para "How exciting!"
	
	para "Thanks for sharing"
	line "your experience"
	cont "with me!"
	
	para "This should be"
	line "useful to a"
	cont "TRAINER like you!"
	done
	
GlintApt22FNpc2Text3:
	text "Thanks again for"
	line "sharing your"
	cont "experience with"
	cont "me!"
	done
