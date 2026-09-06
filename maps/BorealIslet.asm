BorealIslet_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BorealIsletCallback

	db 4 ; warp events
	warp_event 10, 26, ROUTE_33_UNDERWATER, 1
	warp_event 11, 26, ROUTE_33_UNDERWATER, 2
	warp_event 10, 27, ROUTE_33_UNDERWATER, 3
	warp_event 11, 27, ROUTE_33_UNDERWATER, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 20, SIGNPOST_JUMPTEXT, BorealIslet_SignText

	db 2 ; object events
	object_event 10,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ARTICUNO, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, BorealIsletArticuno, EVENT_ARTICUNO_GONE
	itemball_event 10,  2, LUCKY_EGG, 1, EVENT_GOT_LUCKY_EGG


BorealIsletCallback:
	checkevent EVENT_ARTICUNO_ACTIVE
	iftrue .end
	moveperson 2, -5, -5
.end
	return

BorealIsletArticuno:
	opentext TEXTBOX_POKEMON, ARTICUNO
	writetext BorealIsletArticunoText
	cry ARTICUNO
	waitbutton
	closetext
	waitsfx
	loadwildmon ARTICUNO, 55
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, .lose
	disappear 1
	reloadmapafterbattle
	setevent EVENT_ARTICUNO_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal ARTICUNO, .CaughtArticuno
	opentext
	writetext BorealIsletArticunoTextGone
	waitbutton
	closetext
.CaughtArticuno
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
;	setevent EVENT_UNIQUE_ENCOUNTER_ARTICUNO_BOSS
	end
.lose
	clearevent EVENT_ARTICUNO_GONE
	reloadmapafterbattle
	end

BorealIsletArticunoText:
	text "GYAOOOO!"
	done

BorealIsletArticunoTextGone:
	text "ARTICUNO flew"
	line "away…"
	done

BorealIslet_SignText:
	text "BOREAL ISLET"
	done