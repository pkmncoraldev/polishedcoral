KomoreCommunityCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, KomoreCommunityCenterCallback

	db 4 ; warp events
	warp_def  7,  4, 1, KOMORE_VILLAGE
	warp_def  7,  5, 2, KOMORE_VILLAGE
	warp_def  1,  8, 1, KOMORE_COMMUNITY_CENTER_RIGHT
	warp_def  1,  0, 3, KOMORE_COMMUNITY_CENTER_LEFT

	db 20 ; coord events
	xy_trigger 0,  5,  7, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  4,  7, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  6,  6, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  6,  5, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  6,  4, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  6,  3, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  6,  2, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  4,  0, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  3,  1, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 0,  2,  2, 0, KomoreCommunityCenterLight, 0, 0
	xy_trigger 1,  3,  0, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  2,  1, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  4,  8, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  5,  8, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  6,  7, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  7,  6, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  7,  5, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  7,  4, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  7,  3, 0, KomoreCommunityCenterDark, 0, 0
	xy_trigger 1,  7,  2, 0, KomoreCommunityCenterDark, 0, 0

	db 4 ; bg events
	signpost  1,  1, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign1Text
	signpost  1,  5, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign2Text
	signpost  1,  9, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign3Text
	signpost  1,  4, SIGNPOST_JUMPTEXT, KomoreCommunityCenterDoorText

	db 2 ; object events
	person_event SPRITE_BALL_CUT_FRUIT,  3,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterItemBall, EVENT_KOMORE_COMMUNITY_CENTER_ITEM
	person_event SPRITE_BALL_CUT_FRUIT,  3,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KomoreCommunityCenterItemBall, EVENT_KOMORE_COMMUNITY_CENTER_ITEM

	const_def 1 ; object constants
	const KOMORE_COMMUNITY_CENTER_ITEM_1
	const KOMORE_COMMUNITY_CENTER_ITEM_2

KomoreCommunityCenterCallback:
	checkevent EVENT_KOMORE_COMMUNITY_CENTER_ITEM
	iffalse .skip
	checkevent EVENT_MIMIKYU_WILL_GO_LEFT
	iftrue .left
	checkevent EVENT_MIMIKYU_WILL_GO_RIGHT
	iftrue .right
	jump .skip
.left
	clearevent EVENT_MIMIKYU_WILL_GO_LEFT
	clearevent EVENT_MIMIKYU_WILL_GO_RIGHT
	setevent EVENT_MIMIKYU_LEFT
	clearevent EVENT_MIMIKYU_MIDDLE
	clearevent EVENT_MIMIKYU_RIGHT
	jump .skip
.right
	clearevent EVENT_MIMIKYU_WILL_GO_LEFT
	clearevent EVENT_MIMIKYU_WILL_GO_RIGHT
	clearevent EVENT_MIMIKYU_LEFT
	clearevent EVENT_MIMIKYU_MIDDLE
	setevent EVENT_MIMIKYU_RIGHT
.skip
	readvar VAR_PLAYER_COLOR
	if_equal 6, .pink
	moveperson KOMORE_COMMUNITY_CENTER_ITEM_2, -5, -5
	return
.pink
	moveperson KOMORE_COMMUNITY_CENTER_ITEM_1, -5, -5
	return

KomoreCommunityCenterLight:
	checktime 1<<NITE
	iftrue KomoreCommunityCenterDark
	setflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
KomoreCommunityCenterDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $0
	end	

KomoreCommunityCenterItemBall:
	callasm KomoreCommunityCenterSetItemAsm
	farscall FindItemInBallScript
	iffalse .end
	clearevent EVENT_MIMIKYU_MIDDLE
	clearevent EVENT_MIMIKYU_RIGHT
	setevent EVENT_MIMIKYU_LEFT
	disappear KOMORE_COMMUNITY_CENTER_ITEM_1
	disappear KOMORE_COMMUNITY_CENTER_ITEM_2
.end
	end

KomoreCommunityCenterSetItemAsm:
	ld a, POTION
	ld [wCurItemBallContents], a
	ld a, 1
	ld [wCurItemBallQuantity], a
	ret

KomoreCommunityCenterSign1Text:
	text "ROOM A"
	done

KomoreCommunityCenterSign2Text:
	text "ROOM B"
	done
	
KomoreCommunityCenterSign3Text:
	text "ROOM C"
	done
	
KomoreCommunityCenterDoorText:
	text "It's blocked from"
	line "the other side…"
	done