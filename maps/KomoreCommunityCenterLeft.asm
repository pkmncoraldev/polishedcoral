KomoreCommunityCenterLeft_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, KomoreCommunityCenterLeftCallback

	db 4 ; warp events
	warp_def  4,  5, 3, KOMORE_COMMUNITY_CENTER_MIDDLE
	warp_def  5,  5, 4, KOMORE_COMMUNITY_CENTER_MIDDLE
	warp_def  7,  2, 4, KOMORE_COMMUNITY_CENTER
	warp_def  7,  3, 4, KOMORE_COMMUNITY_CENTER

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_MIMIKYU_DOLL,  6,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterPikachu, EVENT_MIMIKYU_GONE
	object_event  5,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, TOTODILE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterTotodile, -1
	object_event  1,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CYNDAQUIL, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterCyndaquil, -1
	object_event  4,  6, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CHIKORITA, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterChikorita, -1
	

KomoreCommunityCenterLeftCallback:
	setevent EVENT_MIMIKYU_WILL_GO_LEFT
	clearevent EVENT_MIMIKYU_WILL_GO_RIGHT
	checkevent EVENT_MIMIKYU_RIGHT
	iffalse .skip
	clearevent EVENT_MIMIKYU_RIGHT
	setevent EVENT_MIMIKYU_MIDDLE
.skip
	checkevent EVENT_MIMIKYU_LEFT
	iftrue .end
	moveperson 1, -5, -5
.end
	return

KomoreCommunityCenterTotodile:
	jumptext KomoreCommunityCenterTotodileText
	
KomoreCommunityCenterCyndaquil:
	jumptext KomoreCommunityCenterCyndaquilText
	
KomoreCommunityCenterChikorita:
	jumptext KomoreCommunityCenterChikoritaText


KomoreCommunityCenterTotodileText:
	text "A dusty old"
	line "TOTODILE doll."
	done
	
KomoreCommunityCenterCyndaquilText:
	text "A dusty old"
	line "CYNDAQUIL doll."
	done
	
KomoreCommunityCenterChikoritaText:
	text "A dusty old"
	line "CHIKORITA doll."
	done
