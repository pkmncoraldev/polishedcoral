GlintGroveDeep_MapScriptHeader:
	db 2 ; scene scripts
	scene_script GlintGroveDeepTrigger0
	scene_script GlintGroveDeepTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 13, 7, 3, GLINT_GROVE
	warp_def 13, 6, 4, GLINT_GROVE

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 6, 2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, GlintSecretSmeargle, EVENT_GLINT_SECRET_SMEARGLE
	person_event SPRITE_ROCKER, 8, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintSecretTrioRed, EVENT_TRIO_BROS2
	person_event SPRITE_ROCKER, 6, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintSecretTrioBlue, EVENT_TRIO_BROS2
	person_event SPRITE_ROCKER, 9, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, GlintSecretTrioYellow, EVENT_TRIO_BROS2

	const_def 1 ; object constants
	const GLINTSECRET_SMEARGLE
	
GlintGroveDeepTrigger0:
	end
	
GlintGroveDeepTrigger1:
	end
	
GlintSecretSmeargle:
	opentext
	writetext GlintSecretSmeargleText
	cry SMEARGLE
	waitbutton
	closetext
	waitsfx
	loadwildmon SMEARGLE, 10
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY_LEGENDARY
	startbattle
	if_equal $1, GlintSecretSmeargle2
	disappear GLINTSECRET_SMEARGLE
GlintSecretSmeargle2:
	reloadmapafterbattle
	special HealParty
	dotrigger $0
	clearevent EVENT_TRIO_BROS
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
GlintSecretTrioRed:
	jumptextfaceplayer GlintSecretTrioRedText
	
GlintSecretTrioBlue:
	jumptextfaceplayer GlintSecretTrioBlueText

GlintSecretTrioYellow:
	jumptextfaceplayer GlintSecretTrioYellowText
	
GlintSecretSmeargleText:
	text "SMEARGLE: Gooahh!"
	done

GlintSecretTrioRedText:
	text "How are things,"
	line "TRAINER?"
	
	para "We still come"
	line "here to study the"
	cont "SMEARGLE."
	done
	
GlintSecretTrioBlueText:
	text "We still have a"
	line "lot to learn from"
	cont "these SMEARGLE."
	done
	
GlintSecretTrioYellowText:
	text "It might not seem"
	line "like it,"
	
	para "but our research"
	line "here is really"
	cont "quite important."
	done