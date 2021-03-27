MtOnwaB3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 25, 17, 3, MT_ONWA_B2F
	warp_def 23, 17, 3, MT_ONWA_B3F
	warp_def 25, 7, 2, MT_ONWA_B3F
	warp_def 11, 15, 4, MT_ONWA_B2F

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_MAGMAR, 3, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LavaCaveBF3Magmar, EVENT_MT_ONWA_B3F_MAGMAR_GONE
	person_event SPRITE_FIREBREATHER, 20, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, LavaCaveBF3Trainer1, -1
	itemball_event 13, 8, ELECTIRIZER, 1, EVENT_MT_ONWA_B3F_POKE_BALL
	
	const_def 1 ; object constants
	const MTONWABF3_MAGMAR
	
LavaCaveBF3Magmar:
	opentext
	writetext LavaCaveBF3MagmarText
	cry MAGMAR
	waitbutton
	closetext
	waitsfx
	loadwildmon MAGMAR, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, LavaCaveBF3Magmar2
	disappear MTONWABF3_MAGMAR
	setevent EVENT_MT_ONWA_B3F_MAGMAR_GONE
LavaCaveBF3Magmar2:
	reloadmapafterbattle
	end

LavaCaveBF3MagmarText:
	text "MAAAAAR! MAG!"
	line "MAR!"
	done
	
LavaCaveBF3Trainer1:
	generictrainer FIREBREATHER, DOM, EVENT_BEAT_MT_ONWA_B3F_TRAINER, .SeenText, .BeatenText

	text "This is my favor-"
	line "ite training spot."
	
	para "It helps train not"
	line "just my #MON,"
	cont "but me as well."
	done

.SeenText:
	text "You must be tough"
	line "if you made it"
	cont "this far down."
	
	para "Let's find out just"
	line "how tough you are!"
	done

.BeatenText:
	text "Really tough!"
	done
