SpookhouseBedroom_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SpookhouseBedroomCallback

	db 3 ; warp events
	warp_def 7, 4, 5, SPOOKHOUSE_LIVING_ROOM
	warp_def 7, 5, 6, SPOOKHOUSE_LIVING_ROOM
	warp_def 3, 4, 5, SPOOKHOUSE_DINING_ROOM

	db 0 ; coord events

	db 17 ; bg events
	signpost 2, 11, SIGNPOST_READ, SpookHouseBookshelf
	signpost 2, 10, SIGNPOST_READ, SpookHouseBookshelf
	signpost 3, 2, SIGNPOST_READ, SpookHouseBed
	signpost  3,  1, SIGNPOST_READ, SpookHouseBed
	signpost 2, 0, SIGNPOST_READ, SpookHouseTrashcan
	signpost 3, 7, SIGNPOST_READ, SpookHouseJournal
	signpost  4,  9, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  5,  3, SIGNPOST_READ, SpookHouseDiningRoomRubble
	signpost  5,  4, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  5,  6, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  5,  7, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  6,  1, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  7,  9, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  7, 10, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  7, 11, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  3,  4, SIGNPOST_READ, SpookHouseDiningRoomBelow
	signpost  3,  5, SIGNPOST_READ, SpookHouseDiningRoomRubble

	db 3 ; object events
	person_event SPRITE_SCARY_PAINTING,  1,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, SpookHousePainting, EVENT_SCARY_PAINTING_GONE
	person_event SPRITE_SCARY_PAINTING_2,  1,  4, SPRITEMOVEDATA_TRACK_PLAYER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, SpookHousePainting2, EVENT_SCARY_PAINTING_GONE_2
	person_event SPRITE_TWIN,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_ALWAYS_SET
	
	const_def 1 ; object constants
	const SPOOKHOUSE_BEDROOM_PAINTING
	const SPOOKHOUSE_BEDROOM_PAINTING_2
	const SPOOKHOUSE_BEDROOM_GIRL
	
SpookhouseBedroomCallback:
	checkevent EVENT_SPOOKHOUSE_GOT_BALL
	iftrue .end
	checkevent EVENT_SPOOKHOUSE_BALL_LEFT_GONE
	iftrue .remove
	clearevent EVENT_SPOOKHOUSE_BLOCKER_GONE
	jump .end
.remove
	setevent EVENT_SPOOKHOUSE_BLOCKER_GONE
.end
	return
	
SpookHouseBookshelf:
	jumptext SpookHouseBookshelfText
	
SpookHouseBed:
	jumptext SpookHouseBedText
	
SpookHouseTrashcan:
	jumptext SpookHouseTrashcanText
	
SpookHouseDiningRoomBelow:
	jumptext SpookHouseDiningRoomBelowText
	
SpookHouseDiningRoomRubble:
	jumptext SpookHouseDiningRoomRubbleText
	
SpookHousePainting2:
	opentext
	writetext SpookHousePainting2Text
	playsound SFX_THIEF_2
	waitsfx
	waitbutton
	closetext
	callasm PaintingPoison
	end
	
SpookHousePainting2Text:
	text "The painting"
	line "exudes an ominous"
	cont "aura."
	
	para "Looking at it"
	line "makes you sick to"
	cont "your stomach."
	done
	
PaintingPoison:
	ld a, [wPartyCount]
	ld e, a
	xor a
	ld [wCurPartyMon], a
	jr .skip
.loop
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
.skip
	ld a, e
	cp -1
	ret z
	dec e
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld a, [hl]
	and 1 << PSN
	jr nz, .loop
	
	ld a, 1 << PSN
	ld [hl], a
	ret
	
SpookHouseJournal:
	checkevent EVENT_SPOOKHOUSE_BEATEN
	iftrue .no_scary
	checkevent EVENT_SCARY_PAINTING_GONE
	iftrue .no_scary
	appear SPOOKHOUSE_BEDROOM_GIRL
	appear SPOOKHOUSE_BEDROOM_PAINTING_2
	spriteface SPOOKHOUSE_BEDROOM_PAINTING_2, UP
	opentext
	writetext SpookHouseJournalText1
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText3
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText4
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText5
	yesorno
	iffalse SpookHouseJournalNo
	spriteface SPOOKHOUSE_BEDROOM_PAINTING, UP
	pause 1
	spriteface SPOOKHOUSE_BEDROOM_PAINTING, DOWN
	writetext SpookHouseJournalText6
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText7
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface SPOOKHOUSE_BEDROOM_PAINTING, RIGHT
	spriteface SPOOKHOUSE_BEDROOM_PAINTING_2, RIGHT
	writetext SpookHouseJournalText8
	waitbutton
	closetext
	pause 2
	disappear SPOOKHOUSE_BEDROOM_GIRL
	disappear SPOOKHOUSE_BEDROOM_PAINTING
	end
.no_scary
	opentext
	writetext SpookHouseJournalText1
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText3
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText4
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText5
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText6
	yesorno
	iffalse SpookHouseJournalNo
	writetext SpookHouseJournalText7
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext SpookHouseJournalText8
	waitbutton
	closetext
	end
	
SpookHouseJournalNo:
	farwritetext BetterNotText
	waitbutton
	disappear SPOOKHOUSE_BEDROOM_GIRL
	checkevent EVENT_SCARY_PAINTING_GONE
	iftrue .skip
	disappear SPOOKHOUSE_BEDROOM_PAINTING_2
.skip
	closetext
	end
	
SpookHouseBookshelfText:
	text "It's full of old"
	line "dusty books and"
	cont "journals."
	done
	
SpookHouseBedText:
	text "A big fluffy bed."
	
	para "It's neatly made,"
	line "but seems like it"
	cont "hasn't been used in"
	cont "years."
	done
	
SpookHouseTrashcanText:
	text "It's full of dust."
	done
	
SpookHouseDiningRoomBelowText:
	text "You can see the"
	line "dining room below"
	cont "through the broken"
	cont "floorboards."
	done
	
SpookHouseDiningRoomRubbleText:
	text "Some rubble from"
	line "the ceiling."
	
	para "It has knocked"
	line "some holes in the"
	cont "floor to the room"
	cont "below."
	done
	
SpookHouseJournalText1:
	text "A dusty old"
	line "journal."
	
	para "Read it?"
	done
	
SpookHouseJournalText3:
	text "Who wouldn't?"
	
	para "…"
	
	para "DAY:O/O    MONTH:X"
	
	para "It's been a month"
	line "since it happened."
	
	para "I've decided to"
	line "write my thoughts"
	cont "in a new journal."
	
	para "I burned my old"
	line "one…"
	
	para "A fresh start will"
	line "help me move on."
	
	para "Perhaps the mem-"
	line "ories of her will"
	cont "stay behind as"
	cont "well…"
	
	para "I try not to dwell"
	line "on what happened,"
	
	para "but I do miss her"
	line "so."
	
	para "Even now I can see"
	line "her smiling face…"
	
	para "…"
	
	para "The rest of the"
	line "page is empty."
	
	para "Read the next"
	line "page?"
	done
	
SpookHouseJournalText4:
	text "DAY:O/X    MONTH:X"
	
	para "I can't stop think-"
	line "ing about what"
	cont "happened."
	
	para "I've tried my best"
	line "to put it out of"
	cont "my mind,"
	
	para "but it only seems"
	line "to have gotten"
	cont "worse…"
	
	para "My husband tells"
	line "me I just need to"
	cont "relax."
	
	para "He's right, but for"
	line "some reason I just"
	cont "can't."
	
	para "It's almost like I"
	line "can feel her"
	cont "staring at me…"
	
	para "I need to rest…"
	
	para "Read the next"
	line "page?"
	done
	
SpookHouseJournalText5:
	text "DAY:X/O    MONTH:X"
	
	para "I saw her…"
	
	para "My husband doesn't"
	line "believe me."
	
	para "He says I'm going"
	line "mad."
	
	para "He's wrong."
	
	para "I saw her…"
	
	para "My dear, sweet"
	line "REBECCA…"
	
	para "She just stood"
	line "there staring at"
	cont "me."
	
	para "…"
	
	para "Perhaps I AM"
	line "going mad…"
	
	para "She's gone."
	
	para "There's nothing I"
	line "can do to bring"
	cont "her back."
	
	para "Read the next"
	line "page?"
	done
	
SpookHouseJournalText6:
	text "DAY:X/X    MONTH:X"
	
	para "My old journal"
	line "turned up."
	
	para "The one that I"
	line "burned."
	
	para "Inside it were"
	line "entries I'm sure"
	cont "I never wrote."
	
	para "The incidents have"
	line "also gotten worse."
	
	para "I've seen her many"
	line "times these past"
	cont "few days."
	
	para "My husband has"
	line "started seeing her"
	cont "too."
	
	para "We have decided it"
	line "best that we move"
	cont "far away."
	
	para "Maybe then we will"
	line "be able to esca-"
	
	para "The entry ends"
	line "there."
	
	para "Read the last"
	line "page?"
	done
	
SpookHouseJournalText7:
	text "WE CHANGED OUR"
	line "MINDS."
	
	para "WE DECIDED TO STAY"
	line "AND PLAY WITH"
	
	para "REBECCA FOREVER"
	line "AND EVER."
	
	para "WE WILL NEVER"
	line "LEAVE HER AGAIN."
	
	para "SHE WILL NEVER"
	line "BE ALONE AGAIN."
	
	para "…"
	
	para "…"
	done
	
SpookHouseJournalText8:
	text "NEVERALONENEVER"
	line "ALONENEVERALONE"
	
	para "NEVERALONENEVER"
	line "ALONENEVERALONE"
	
	para "NEVERALONENEVER"
	line "ALONENEVERALONE"
	
	para "The journal ends."
	done