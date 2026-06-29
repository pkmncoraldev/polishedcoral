OldManorExterior_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, OldManorExteriorCallback

	db 2 ; warp events
	warp_def 9, 14, 1, SPOOKHOUSE_LIVING_ROOM
	warp_def 9, 15, 2, SPOOKHOUSE_LIVING_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	tapeball_event  3,  4, MUSIC_EVENTIDE, 1, EVENT_MUSIC_EVENTIDE
	person_event SPRITE_INVISIBLE,  9, 14, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, OldManorExteriorLockedDoor, EVENT_SPOOKHOUSE_NOT_LOCKED
	person_event SPRITE_INVISIBLE,  9, 15, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, OldManorExteriorLockedDoor, EVENT_SPOOKHOUSE_NOT_LOCKED
	person_event SPRITE_BALL_CUT_FRUIT, 11, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OldManorExteriorCleanseTag, EVENT_CLEANSE_TAG_GONE
	person_event SPRITE_BALL_CUT_FRUIT, 11, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OldManorExteriorDoll, EVENT_OLD_MANOR_DOLL_GONE
	
OldManorExteriorCallback:
	checkevent EVENT_SPIRITOMB_DOLL_DAY_COOLDOWN
	iftrue .skip
	checkevent EVENT_DECO_SPIRITOMB_DOLL
	iftrue .skip
	checkevent EVENT_GOT_CLENSE_TAG
	iffalse .skip
	clearevent EVENT_OLD_MANOR_DOLL_GONE
.skip
	return
	
OldManorExteriorCleanseTag:
	loadvar wCurItemBallContents, CLEANSE_TAG
	loadvar wCurItemBallQuantity, 1
	farscall FindItemInBallScript
	iffalse .end
	setevent EVENT_CLEANSE_TAG_GONE
	setevent EVENT_GOT_CLENSE_TAG
	setevent EVENT_SPIRITOMB_DOLL_DAY_COOLDOWN
.end
	end
	
OldManorExteriorDoll:
	setevent EVENT_DECO_SPIRITOMB_DOLL
	disappear LAST_TALKED
	opentext
	writetext GiveSpiritombDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwaySpiritombDollText
	waitbutton
	closetext
	end
	
GiveSpiritombDollText:
	text "<PLAYER> found"
	line "SPIRITOMB DOLL!"
	done
	
PutAwaySpiritombDollText:
	text "SPIRITOMB DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
OldManorExteriorLockedDoor:
	jumptext OldManorExteriorLockedDoorText
	
OldManorExteriorLockedDoorText:
	text "It's locked tight."
	
	para "It looks like it"
	line "hasn't been opened"
	cont "in years…"
	done
