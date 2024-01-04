Route24South_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback

	db 0 ; warp events

	db 0 ; coord events

	db 3 ; bg events
	bg_event 31,  2, SIGNPOST_ITEM + BALMMUSHROOM, EVENT_ROUTE_24_HIDDEN_BALMMUSHROOM_1
	bg_event 27,  6, SIGNPOST_ITEM + BALMMUSHROOM, EVENT_ROUTE_24_HIDDEN_BALMMUSHROOM_2
	bg_event 33,  7, SIGNPOST_ITEM + BIG_MUSHROOM, EVENT_ROUTE_24_HIDDEN_BIG_MUSHROOM

	db 9 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_BALL_CUT_FRUIT,  0, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom1, EVENT_ROUTE_24_MUSHROOM_1
	person_event SPRITE_BALL_CUT_FRUIT,  3, 33, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom2, EVENT_ROUTE_24_MUSHROOM_2
	person_event SPRITE_BALL_CUT_FRUIT,  8, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom3, EVENT_ROUTE_24_MUSHROOM_3
	person_event SPRITE_BALL_CUT_FRUIT,  7, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom4, EVENT_ROUTE_24_MUSHROOM_4
	fruittreeinvis_event 31,  0, FRUITTREE_ROUTE_24_1, RAWST_BERRY
	fruittreeinvis_event 33,  4, FRUITTREE_ROUTE_24_2, PERSIM_BERRY
	tmhmball_event 34, 13, TM_FIRE_BLAST, EVENT_ROUTE_24_FIRE_BLAST
	
	
	const_def 1 ; object constants
	const ROUTE_24_LEAF_1
	const ROUTE_24_LEAF_2
	const ROUTE_24_MUSHROOM_1
	const ROUTE_24_MUSHROOM_2
	const ROUTE_24_MUSHROOM_3
	const ROUTE_24_MUSHROOM_4
	
Route24SouthMushroom1:
	disappear ROUTE_24_MUSHROOM_1
	jump Route24SouthMushroom
	
Route24SouthMushroom2:
	disappear ROUTE_24_MUSHROOM_2
	jump Route24SouthMushroom
	
Route24SouthMushroom3:
	disappear ROUTE_24_MUSHROOM_3
	jump Route24SouthMushroom
	
Route24SouthMushroom4:
	disappear ROUTE_24_MUSHROOM_4
	
Route24SouthMushroom:
	callasm Route24SouthMushroomSetItemAsm
	farjump FindItemInBallScript
	end
	
Route24SouthMushroomSetItemAsm:
	ld a, 1
	ld [wCurItemBallQuantity], a
	call Random
	cp 10 percent
	jr c, .balm
	cp 30 percent
	jr c, .big
	ld a, TINYMUSHROOM
	jr .finish
.balm
	ld a, BALMMUSHROOM
	jr .finish
.big
	ld a, BIG_MUSHROOM
.finish
	ld [wCurItemBallContents], a
	ret
	
Route24SouthWindy_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
