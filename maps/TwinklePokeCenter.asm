TwinklePokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 4, 1, TWINKLE_TOWN
	warp_def 7, 5, 1, TWINKLE_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinklePokeCenterFisher, -1
	object_event  9,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, TwinklePokeCenterGirl, -1
	object_event  9,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, GLOOM, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinklePokeCenterGloom, -1
	object_event 11,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TwinklePokeCenterNerd, -1
	
	const_def 1 ; object constants
	const TWINKLE_POKECENTER_NURSE
	const TWINKLE_POKECENTER_CHANSEY
	const TWINKLE_POKECENTER_FISHER
	const TWINKLE_POKECENTER_GIRL
	const TWINKLE_POKECENTER_GLOOM
	const TWINKLE_POKECENTER_NERD
	
	
TwinklePokeCenterFisher:
	jumptextfaceplayer TwinklePokeCenterFisherText
	
TwinklePokeCenterGirl:
	jumptextfaceplayer TwinklePokeCenterGirlText
	
TwinklePokeCenterGloom:
	opentext
	writetext TwinklePokeCenterGloomText1
	cry GLOOM
	waitsfx
	buttonsound
	writetext TwinklePokeCenterGloomText2
	waitbutton
	closetext
	end
	
TwinklePokeCenterNerd:
	faceplayer
	opentext
	writetext TwinklePokeCenterNerdText
	waitbutton
	closetext
	spriteface TWINKLE_POKECENTER_NERD, UP
	end
	
TwinklePokeCenterFisherText:
	text "I came here to"
	line "fish in the lake,"
	
	para "but it's frozen"
	line "over!"
	
	para "I don't know what"
	line "I expected…"
	
	para "Man, I look like a"
	line "fool, huh?"
	done
	
TwinklePokeCenterGirlText:
	text "I kn-kn-knew it"
	line "was cold up here,"
	
	para "b-b-but this is"
	line "ridiculous…"
	
	para "I can b-b-barely"
	line "even step out of "
	cont "the P-P-#MON"
	cont "CENTER!"
	done
	
TwinklePokeCenterGloomText1:
	text "GLOOM: L-l-loom…"
	done
	
TwinklePokeCenterGloomText2:
	text "GLOOM is"
	line "shivering!"
	done
	
TwinklePokeCenterNerdText:
	text "Huh?"
	
	para "I'm blocking the"
	line "bookcase?"
	
	para "Don't worry."
	
	para "There's nothing"
	line "worth reading here"
	cont "anyway…"
	done
