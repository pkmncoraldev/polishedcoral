GlintGroveDeep_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 13, 7, 1, GLINT_GROVE_EAST
	warp_def 13, 6, 1, GLINT_GROVE_EAST

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 6, 2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, GlintSecretSmeargle, EVENT_GLINT_SECRET_SMEARGLE_GONE

	const_def 1 ; object constants
	const GLINTSECRET_SMEARGLE
	
GlintSecretSmeargle:
	opentext
	writetext GlintSecretSmeargleText
	cry SMEARGLE
	waitbutton
	closetext
	waitsfx
	loadwildmon SMEARGLE, 12
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY_LEGENDARY
	startbattle
	disappear GLINTSECRET_SMEARGLE
	reloadmapafterbattle
	setevent EVENT_GLINT_SECRET_SMEARGLE_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal SMEARGLE, .CaughtSmeargle
	opentext
	writetext GlintSecretSmeargleTextGone
	waitbutton
	closetext
.CaughtSmeargle
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
GlintSecretSmeargleText:
	text "SMEARGLE: Gooahh!"
	done

GlintSecretSmeargleTextGone:
	text "SMEARGLE fled deep"
	line "into the cave!"
	done
