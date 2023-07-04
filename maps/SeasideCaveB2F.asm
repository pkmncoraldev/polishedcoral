SeasideCaveB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  7, 16, SEASIDE_CAVE_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DRAKLOAK, -1, -1, (1 << 3) | PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, SeasideCaveB2FDrakloak, EVENT_SEASIDE_CAVE_B2F_DRAKLOAK_GONE

	const_def 1 ; object constants
	const SEASIDE_CAVE_B2F_DRAKLOAK

SeasideCaveB2FDrakloak:
	opentext
	writetext SeasideCaveB2FDrakloakText
	cry DRAKLOAK
	waitbutton
	closetext
	waitsfx
	loadwildmon DRAKLOAK, 46
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear SEASIDE_CAVE_B2F_DRAKLOAK
	reloadmapafterbattle
	setevent EVENT_SEASIDE_CAVE_B2F_DRAKLOAK_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal LEDIAN, .CaughtDrakloak
	opentext
	writetext SeasideCaveB2FDrakloakTextGone
	waitbutton
	closetext
.CaughtDrakloak
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
SeasideCaveB2FDrakloakText:
	text "KLOOOOOOOO!"
	line "DRA-DRA!"
	done
	
SeasideCaveB2FDrakloakTextGone:
	text "DRAKLOAK fled"
	line "into the water…"
	done