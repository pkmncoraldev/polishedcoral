KomoreCommunityCenterRight_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, KomoreCommunityCenterRightCallback

	db 4 ; warp events
	warp_def  7,  2, 3, KOMORE_COMMUNITY_CENTER
	warp_def  7,  3, 3, KOMORE_COMMUNITY_CENTER
	warp_def  4,  0, 1, KOMORE_COMMUNITY_CENTER_MIDDLE
	warp_def  5,  0, 2, KOMORE_COMMUNITY_CENTER_MIDDLE

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_MIMIKYU_DOLL,  5,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterPikachu, EVENT_MIMIKYU_GONE
	object_event  4,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, SQUIRTLE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterSquirtle, -1
	object_event  2,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CHARMANDER, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterCharmander, -1
	object_event  5,  6, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, BULBASAUR, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterBulbasaur, -1
	
	
KomoreCommunityCenterRightCallback:
	clearevent EVENT_MIMIKYU_WILL_GO_LEFT
	setevent EVENT_MIMIKYU_WILL_GO_RIGHT
	checkevent EVENT_MIMIKYU_LEFT
	iffalse .skip
	clearevent EVENT_MIMIKYU_LEFT
	setevent EVENT_MIMIKYU_MIDDLE
.skip
	checkevent EVENT_MIMIKYU_RIGHT
	iftrue .end
	moveperson 1, -5, -5
.end
	return
	
KomoreCommunityCenterSquirtle:
	jumptext KomoreCommunityCenterSquirtleText
	
KomoreCommunityCenterCharmander:
	jumptext KomoreCommunityCenterCharmanderText
	
KomoreCommunityCenterBulbasaur:
	jumptext KomoreCommunityCenterBulbasaurText


KomoreCommunityCenterSquirtleText:
	text "A dusty old"
	line "SQUIRTLE doll."
	done
	
KomoreCommunityCenterCharmanderText:
	text "A dusty old"
	line "CHARMANDER doll."
	done
	
KomoreCommunityCenterBulbasaurText:
	text "A dusty old"
	line "BULBASAUR doll."
	done
