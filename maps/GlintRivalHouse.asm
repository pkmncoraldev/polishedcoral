GlintRivalHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 4, GLINT_CITY
	warp_def 7, 3, 4, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_POKEFAN_F, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintRivalHouseMom, -1
	tapeball_event  4,  3, MUSIC_RIVAL_ENCOUNTER, 2, EVENT_MUSIC_RIVAL_ENCOUNTER

	const_def 1 ; object constants
	const GLINT_RIVALHOUSE_MOM
	
GlintRivalHouseMom:
	faceplayer
	opentext TEXTBOX_RIVALS_MOM
	checkitem RIVAL_POKEDEX
	iffalse .gave_pokedex
	writetext GlintRivalMomText1
	waitbutton
	closetext
	end
.gave_pokedex
	writetext GlintRivalMomText2
	waitbutton
	closetext
	end
	
GlintRivalMomText1:
	text "You're looking for"
	line "<RIVAL>?"

	para "He went off to"
	line "GLINT GROVE to do"
	cont "some training."
	
	para "Oh?<WAIT_M>"
	line "A #DEX?"
	
	para "<RIVAL> ran off"
	line "before they were"
	cont "handed out?"
	
	para "Sigh…"
	
	para "That boy is just"
	line "like his father."
	
	para "For better or for"
	line "worse…"
	done
	
GlintRivalMomText2:
	text "<RIVAL> went"
	line "off looking for"
	cont "something."
	
	para "I worry about"
	line "him."
	
	para "That boy is just"
	line "like his father."
	
	para "For better or for"
	line "worse…"
	done
