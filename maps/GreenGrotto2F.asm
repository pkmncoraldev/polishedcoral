GreenGrotto2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 21,  7, 2, ROUTE_29
	warp_def  5, 27, 3, ROUTE_29

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, NOIVERN, -1, -1, (1 << 3) | PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, GreenGrotto2FNoivern, EVENT_GREEN_GROTTO_2F_NOIVERN_GONE
	strengthboulder_event  2, 15, -1
	strengthboulder_event  3, 14, -1
	strengthboulder_event 14, 11, -1
	strengthboulder_event 15, 11, -1
	
	
GreenGrotto2FNoivern:
	opentext TEXTBOX_POKEMON, NOIVERN
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
	
