TempestIslet_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, TempestIsletCallback

	db 4 ; warp events
	warp_event  4, 26, ROUTE_33_UNDERWATER, 5
	warp_event  5, 26, ROUTE_33_UNDERWATER, 6
	warp_event  4, 27, ROUTE_33_UNDERWATER, 7
	warp_event  5, 27, ROUTE_33_UNDERWATER, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 20, SIGNPOST_JUMPTEXT, TempestIslet_SignText

	db 2 ; object events
	object_event 10,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ZAPDOS, -1, -1, (1 << 3) | PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, TempestIsletZapdos, EVENT_ZAPDOS_GONE
	itemball_event 10,  2, LUCKY_EGG, 1, EVENT_GOT_LUCKY_EGG


TempestIsletCallback:
	checkevent EVENT_ZAPDOS_ACTIVE
	iftrue .end
	moveperson 2, -5, -5
.end
	return

TempestIsletZapdos:
	opentext TEXTBOX_POKEMON, ZAPDOS
	writetext BorealIsletZapdosText
	cry ZAPDOS
	waitbutton
	closetext
	waitsfx
	loadwildmon ZAPDOS, 55
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, .lose
	disappear 1
	reloadmapafterbattle
	setevent EVENT_ZAPDOS_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal ZAPDOS, .CaughtZapdos
	opentext
	writetext BorealIsletZapdosTextGone
	waitbutton
	closetext
.CaughtZapdos
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
;	setevent EVENT_UNIQUE_ENCOUNTER_ZAPDOS_BOSS
	end
.lose
	clearevent EVENT_ZAPDOS_GONE
	reloadmapafterbattle
	end

BorealIsletZapdosText:
	text "GYAOOOO!"
	done

BorealIsletZapdosTextGone:
	text "ZAPDOS flew"
	line "away…"
	done

TempestIslet_SignText:
	text "TEMPEST ISLET"
	done