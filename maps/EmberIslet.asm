EmberIslet_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, EmberIsletCallback

	db 4 ; warp events
	warp_event 16, 22, ROUTE_33_UNDERWATER, 9
	warp_event 17, 22, ROUTE_33_UNDERWATER, 10
	warp_event 16, 23, ROUTE_33_UNDERWATER, 11
	warp_event 17, 23, ROUTE_33_UNDERWATER, 12

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 20, SIGNPOST_JUMPTEXT, EmberIslet_SignText

	db 2 ; object events
	object_event 10,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MOLTRES, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, EmberIsletMoltres, EVENT_MOLTRES_GONE
	itemball_event 10,  2, LUCKY_EGG, 1, EVENT_GOT_LUCKY_EGG
	
	
EmberIsletCallback:
	checkevent EVENT_MOLTRES_ACTIVE
	iftrue .end
	moveperson 2, -5, -5
.end
	return
	
EmberIsletMoltres:
	opentext TEXTBOX_POKEMON, MOLTRES
	writetext BorealIsletMoltresText
	cry MOLTRES
	waitbutton
	closetext
	waitsfx
	loadwildmon MOLTRES, 55
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, .lose
	disappear 1
	reloadmapafterbattle
	setevent EVENT_MOLTRES_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal MOLTRES, .CaughtMoltres
	opentext
	writetext BorealIsletMoltresTextGone
	waitbutton
	closetext
.CaughtMoltres
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
;	setevent EVENT_UNIQUE_ENCOUNTER_MOLTRES_BOSS
	end
.lose
	clearevent EVENT_MOLTRES_GONE
	reloadmapafterbattle
	end

BorealIsletMoltresText:
	text "GYAOOOO!"
	done

BorealIsletMoltresTextGone:
	text "MOLTRES flew"
	line "away…"
	done
	
EmberIslet_SignText:
	text "EMBER ISLET"
	done
