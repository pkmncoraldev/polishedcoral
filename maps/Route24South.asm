Route24South_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, Route24SouthCallback

	db 0 ; warp events

	db 2 ; coord events
	coord_event 24,  4, 0, Route24SouthBreloom
	coord_event 24,  5, 0, Route24SouthBreloom

	db 3 ; bg events
	bg_event 31,  2, SIGNPOST_ITEM + BALMMUSHROOM, EVENT_ROUTE_24_HIDDEN_BALMMUSHROOM_1
	bg_event 27,  6, SIGNPOST_ITEM + BALMMUSHROOM, EVENT_ROUTE_24_HIDDEN_BALMMUSHROOM_2
	bg_event 33,  7, SIGNPOST_ITEM + BIG_MUSHROOM, EVENT_ROUTE_24_HIDDEN_BIG_MUSHROOM

	db 14 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_BALL_CUT_FRUIT,  0, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom1, EVENT_ROUTE_24_MUSHROOM_1
	person_event SPRITE_BALL_CUT_FRUIT,  3, 33, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom2, EVENT_ROUTE_24_MUSHROOM_2
	person_event SPRITE_BALL_CUT_FRUIT,  8, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom3, EVENT_ROUTE_24_MUSHROOM_3
	person_event SPRITE_BALL_CUT_FRUIT,  7, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthMushroom4, EVENT_ROUTE_24_MUSHROOM_4
	person_event SPRITE_SHROOMISH_OW,  3, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_24_BRELOOM
	person_event SPRITE_SHROOMISH_OW,  4, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_24_BRELOOM
	person_event SPRITE_SHROOMISH_OW,  6, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_24_BRELOOM
	person_event SPRITE_BRELOOM_OW,  4, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent,  EVENT_ROUTE_24_BRELOOM
	itemball_event 29,  4, BALMMUSHROOM, 1, EVENT_ROUTE_24_MUSHROOM_5
	person_event SPRITE_JUGGLER, 18, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route24SouthTrainer1, -1
	person_event SPRITE_CAMPER, 13, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, Route24SouthTrainer2, -1
	person_event SPRITE_BATTLE_GIRL,  9,  6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route24SouthNPC, -1
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
	const ROUTE_24_SHROOMISH_1
	const ROUTE_24_SHROOMISH_2
	const ROUTE_24_SHROOMISH_3
	const ROUTE_24_BRELOOM
	const ROUTE_24_MUSHROOM_5
	
Route24SouthCallback:
	checkevent EVENT_ROUTE_24_BRELOOM
	iftrue .breloom_done_today
	checkflag ENGINE_WINDY_DAY
	iftrue .breloom_done_today
	callasm BreloomRandomAsm
	if_equal 0, .breloom_done_today
	clearevent EVENT_ROUTE_24_BRELOOM
	clearevent EVENT_ROUTE_24_MUSHROOM_5
	dotrigger $0
	jump Route23Callback
.breloom_done_today
	setevent EVENT_ROUTE_24_BRELOOM
	setevent EVENT_ROUTE_24_MUSHROOM_5
	dotrigger $1
	jump Route23Callback
	
Route24SouthNPC:
	jumptextfaceplayer Route24SouthNPCText
	
Route24SouthNPCText:
	text "I hear sometimes,"
	line "on days when the"
	cont "wind is still,"
	
	para "something special"
	line "can happen in the"
	cont "clearing nearby."
	
	para "How exciting!"
	done
	
Route24SouthTrainer1:
	generictrainer JUGGLER, RONNIE, EVENT_BEAT_ROUTE_24_SOUTH_TRAINER_1, .SeenText, .BeatenText

	text "Alright, show's"
	line "over!"
	
	para "Move along!"
	done

.SeenText:
	text "Step right up!"
	line "Step right up!"
	
	para "To the most"
	line "wonderful #MON"
	cont "show in the world!"
	done

.BeatenText:
	text "My #MON!"
	done
	
Route24SouthTrainer2:
	generictrainer CAMPER, TERRY, EVENT_BEAT_ROUTE_24_SOUTH_TRAINER_2, .SeenText, .BeatenText

	text "I know I'm supposed"
	line "to be roughin' it,"
	
	para "but maybe I should"
	line "have packed a tent"
	cont "or something…"
	done

.SeenText:
	text "I'm out roughin' it"
	line "with my #MON!"
	
	para "We're about to set"
	line "up camp!"
	done

.BeatenText:
	text "How rough!"
	done
	
BreloomRandomAsm:
	call Random
	cp 25 percent
	jr c, .breloom
	xor a
	ld [wScriptVar], a
	ret
.breloom
	ld a, 1
	ld [wScriptVar], a
	ret
	
Route24SouthBreloom:
	applyonemovement PLAYER, step_right
	special Special_FadeOutMusic
	pause 10
rept 2
	spriteface ROUTE_24_SHROOMISH_1, UP
	pause 1
	cry SHROOMISH
	waitsfx
	pause 1
	spriteface ROUTE_24_SHROOMISH_1, DOWN
	pause 10
	spriteface ROUTE_24_SHROOMISH_2, UP
	pause 1
	cry SHROOMISH
	waitsfx
	pause 1
	spriteface ROUTE_24_SHROOMISH_2, DOWN
	pause 10
	spriteface ROUTE_24_SHROOMISH_3, UP
	pause 1
	cry SHROOMISH
	waitsfx
	pause 1
	spriteface ROUTE_24_SHROOMISH_3, DOWN
	pause 10
	spriteface ROUTE_24_BRELOOM, UP
	pause 1
	cry BRELOOM
	waitsfx
	pause 1
	spriteface ROUTE_24_BRELOOM, DOWN
	pause 15
endr
	spriteface ROUTE_24_SHROOMISH_1, UP
	pause 1
	cry SHROOMISH
	waitsfx
	pause 1
	spriteface ROUTE_24_SHROOMISH_1, DOWN
	pause 10
	spriteface ROUTE_24_SHROOMISH_2, UP
	pause 1
	cry SHROOMISH
	waitsfx
	pause 1
	spriteface ROUTE_24_SHROOMISH_2, DOWN
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_24_BRELOOM, 15
	pause 10
	applyonemovement ROUTE_24_SHROOMISH_1, set_sliding
	applyonemovement ROUTE_24_SHROOMISH_1, fix_facing
rept 2
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_24_SHROOMISH_1, jump_step_up
endr
	applyonemovement ROUTE_24_SHROOMISH_1, remove_sliding
	applyonemovement ROUTE_24_SHROOMISH_1, remove_fixed_facing
	disappear ROUTE_24_SHROOMISH_1
	applyonemovement ROUTE_24_SHROOMISH_2, set_sliding
	applyonemovement ROUTE_24_SHROOMISH_2, fix_facing
rept 3
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_24_SHROOMISH_2, jump_step_up
endr
	applyonemovement ROUTE_24_SHROOMISH_2, remove_sliding
	applyonemovement ROUTE_24_SHROOMISH_2, remove_fixed_facing
	disappear ROUTE_24_SHROOMISH_2
	applyonemovement ROUTE_24_SHROOMISH_3, set_sliding
	applyonemovement ROUTE_24_SHROOMISH_3, fix_facing
rept 2
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_24_SHROOMISH_3, jump_step_down
endr
	applyonemovement ROUTE_24_SHROOMISH_3, remove_sliding
	applyonemovement ROUTE_24_SHROOMISH_3, remove_fixed_facing
	disappear ROUTE_24_SHROOMISH_3
	pause 10
	spriteface ROUTE_24_BRELOOM, UP
	pause 1
	cry BRELOOM
	waitsfx
	pause 1
;	appear ROUTE_24_MUSHROOM_5
	applyonemovement ROUTE_24_BRELOOM, set_sliding
	applyonemovement ROUTE_24_BRELOOM, fix_facing
rept 2
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_24_BRELOOM, jump_step_up
endr
	applyonemovement ROUTE_24_BRELOOM, remove_sliding
	applyonemovement ROUTE_24_BRELOOM, remove_fixed_facing
	disappear ROUTE_24_BRELOOM
	dotrigger $1
	pause 10
	playmusic MUSIC_AUTUMN
	end
	
Route24SouthMushroom1:
	callasm Route24SouthMushroomSetItemAsm
	farscall FindItemInBallScript
	iffalse .end
	disappear ROUTE_24_MUSHROOM_1
.end
	end
	
Route24SouthMushroom2:
	callasm Route24SouthMushroomSetItemAsm
	farscall FindItemInBallScript
	iffalse .end
	disappear ROUTE_24_MUSHROOM_2
.end
	end
	
Route24SouthMushroom3:
	callasm Route24SouthMushroomSetItemAsm
	farscall FindItemInBallScript
	iffalse .end
	disappear ROUTE_24_MUSHROOM_3
.end
	end
	
Route24SouthMushroom4:
	callasm Route24SouthMushroomSetItemAsm
	farscall FindItemInBallScript
	iffalse .end
	disappear ROUTE_24_MUSHROOM_4
.end
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
