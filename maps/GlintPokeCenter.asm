GlintPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 1, GLINT_CITY
	warp_def 7, 4, 1, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  4, 1
	person_event SPRITE_FISHING_GURU, 5, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc1, -1
	person_event SPRITE_GENTLEMAN, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc2, -1
	person_event SPRITE_SCHOOLBOY,  2,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc3, -1
	object_event  5,  1, SPRITE_CHANSEY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintCenterChansey, -1

	const_def 1 ; object constants
	const GLINT_POKECENTER_NURSE
	const GLINT_POKECENTER_NPC1
	const GLINT_POKECENTER_NPC2
	const GLINT_POKECENTER_NPC3
	const GLINT_POKECENTER_CHANSEY
	
GlintCenterChansey:
	opentext
	writetext GlintCenterChanseyText
	cry CHANSEY
	waitbutton
	closetext
	end
	
GlintCenterChanseyText:
	text "CHANSEY: Sii!"
	done
	
GlintPokeCenterNpc1:
	jumptextfaceplayer GlintPokeCenterNpc1Text

GlintPokeCenterNpc2:
	jumptextfaceplayer GlintPokeCenterNpc2Text

GlintPokeCenterNpc3:
	jumptextfaceplayer GlintPokeCenterNpc3Text

GlintPokeCenterNpc1Text:
	text "Our GYM LEADER"
	line "specializes in"
	
	para "NORMAL TYPE"
	line "#MON."
	
	para "NORMAL doesn't"
	line "have many"
	
	para "strengths, but it"
	line "doesn't have many"
	cont "weaknesses either."
	done

GlintPokeCenterNpc2Text:
	text "There is a grove"
	line "NORTH of GLINT"
	cont "CITY."
	
	para "FAIRY TYPE #MON"
	line "seem to be drawn"
	
	para "to it for some"
	line "reason."
	done

GlintPokeCenterNpc3Text:
	text "You can store you"
	line "#MON in the PCs"
	
	para "at every #MON"
	line "CENTER."
	
	para "Each box can store"
	line "up to 20 #MON."
	
	para "Make sure to"
	line "change boxes when"
	
	para "they get full, or"
	line "you won't be able"
	
	para "to catch anymore"
	line "#MON."
	done