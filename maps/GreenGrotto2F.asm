GreenGrotto2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 19,  7, 2, ROUTE_29

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, NOIVERN, -1, -1, (1 << 3) | PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, GreenGrotto2FNoivern, EVENT_GREEN_GROTTO_2F_NOIVERN_GONE
	strengthboulder_event  2, 13, -1
	strengthboulder_event  3, 12, -1
	strengthboulder_event 14,  9, -1
	strengthboulder_event 15,  9, -1
	
	
GreenGrotto2FNoivern:
	opentext
	writetext GreenGrotto2FNoivernText
	cry NOIVERN
	waitbutton
	closetext
	waitsfx
	loadwildmon NOIVERN, 52
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear 1
	reloadmapafterbattle
	setevent EVENT_GREEN_GROTTO_2F_NOIVERN_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal NOIVERN, .CaughtNoivern
	opentext
	writetext GreenGrotto2FNoivernTextGone
	waitbutton
	closetext
.CaughtNoivern
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	setevent EVENT_UNIQUE_ENCOUNTER_NOIVERN_BOSS
	end

GreenGrotto2FNoivernText:
	text "VEEE! NOI! NOI!"
	line "NOI! NOI!"
	done

GreenGrotto2FNoivernTextGone:
	text "NOIVERN flew off"
	line "into the cave!"
	done
	
