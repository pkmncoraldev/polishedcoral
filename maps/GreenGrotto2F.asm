GreenGrotto2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 23,  7, 2, ROUTE_29
	warp_def  7, 27, 3, ROUTE_29
	warp_def 13, 34, 9, GREEN_GROTTO_1F

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  7,  7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, NOIVERN, -1, -1, (1 << 3) | PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, GreenGrotto2FNoivern, EVENT_GREEN_GROTTO_2F_NOIVERN_GONE
	person_event SPRITE_HIKER, 12, 36, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GreenGrotto2FNPC, -1
	strengthboulder_event  2, 17, -1
	strengthboulder_event  3, 16, -1
	strengthboulder_event 14, 13, -1
	strengthboulder_event 15, 13, -1
	
	
GreenGrotto2FNPC:
	jumptextfaceplayer GreenGrotto2FNPCText
	
GreenGrotto2FNPCText:
	text "Woah there!<WAIT_S>"
	line "Careful!"
	
	para "That hole leads"
	line "back down to the"
	cont "entrance of the"
	cont "cave."
	
	para "Near that hippie"
	line "fella's tent."
	
	para "Don't jump down"
	line "unless you want to"
	cont "hike all the way"
	cont "back up."
	done
	
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
	
