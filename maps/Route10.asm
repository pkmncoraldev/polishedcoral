Route10_MapScriptHeader:
	db 5 ; scene scripts
	scene_script Route10Trigger0
	scene_script Route10Trigger1
	scene_script Route10Trigger2
	scene_script Route10Trigger3
	scene_script Route10Trigger4

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, Route10Random
	callback MAPCALLBACK_TILES, Route10Callback

	db 4 ; warp events
	warp_def 35, 13, 3, FLICKER_PASS_2F
	warp_def 47,  7, 4, FLICKER_PASS_2F
	warp_def 31, 11, 1, ROUTE_10_REST_HOUSE
	warp_def  3, 33, 1, ROUTE_10_MOVE_REMINDER_HOUSE

	db 44 ; coord events
	xy_trigger 1, 30, 19, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 31, 20, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 32, 19, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 33, 20, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 34, 21, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 35, 20, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 31, 28, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 32, 29, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 33, 30, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 34, 31, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 36, 32, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 37, 33, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 38, 34, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 39, 33, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 40, 34, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 41, 33, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 42, 32, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 43, 33, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 30, 44, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 16, 47, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 26, 33, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 32, 37, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 36, 27, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 32, 24, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 21, 39, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 15, 42, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 14, 32, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 3, 27, 50, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  3, 10, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  4, 11, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  5, 14, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  4, 15, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  5, 16, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  4, 17, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  5, 18, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1,  4, 19, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 13, 20, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 14, 21, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 13, 22, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 12, 23, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 22, 55, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 1, 23, 55, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 22, 55, 0, Route10StartSnowstorm, 0, 0
	xy_trigger 2, 23, 55, 0, Route10StartSnowstorm, 0, 0

	db 10 ; bg events
	bg_event 35, 47, SIGNPOST_ITEM + REVIVE, EVENT_ROUTE_10_HIDDEN_ITEM_1
	bg_event  8, 30, SIGNPOST_ITEM + PP_UP, EVENT_ROUTE_10_HIDDEN_ITEM_2
	signpost 36,  9, SIGNPOST_READ, Route10Snowman1
	signpost  9, 41, SIGNPOST_READ, Route10Snowman2
	signpost 32, 16, SIGNPOST_READ, Route10Sign
	signpost  4, 35, SIGNPOST_READ, Route10MoveRelearnerSign
	signpost  3, 36, SIGNPOST_READ, TwinkleTownWood
	signpost  2, 36, SIGNPOST_READ, TwinkleTownWood
	signpost 31,  9, SIGNPOST_READ, TwinkleTownWood
	signpost 30,  9, SIGNPOST_READ, TwinkleTownWood

	db 11 ; object events
	person_event SPRITE_SNOWGIRL, 32, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route10NPC, -1
	person_event SPRITE_CORY_MISC, 1, 1, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route10NPC, -1
	person_event SPRITE_BOARDER, 34, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute10_1, -1
	person_event SPRITE_SKIER, 33, 27, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute10_2, -1
	person_event SPRITE_BOARDER, 30, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute10_3, -1
	person_event SPRITE_SKIER, 39, 38, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute10_4, -1
	person_event SPRITE_BOARDER, 22, 42, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute10_5, -1
	person_event SPRITE_FIREBREATHER, 24, 50, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute10_6, -1
	person_event SPRITE_BOARDER, 12, 33, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute10_7, -1
	itemball_event 30, 47, MAX_ETHER, 1, EVENT_ROUTE_10_POKE_BALL_1
	itemball_event 40, 26, BURN_HEAL, 1, EVENT_ROUTE_10_POKE_BALL_2

	const_def 1 ; object constants
	const ROUTE_10_GOGGLES_GIRL
	const ROUTE_10_BLUSH

Route10Trigger0:
	end
	
Route10Trigger1:
	end
	
Route10Trigger2:
	end
	
Route10Trigger3:
	end
	
Route10Trigger4:
	callasm Route10SfxAsm
	end
	
Route10NPC:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_10_GOGGLES_GIRL
	iftrue .done_goggles
	checkitem SAFE_GOGGLES
	iftrue .have_goggles
	writetext Route10NPCText1
	waitbutton
	closetext
	end
	
.have_goggles
	writetext Route10NPCText2
	yesorno
	iffalse .no
	writetext Route10NPCText4
	waitbutton
	writetext Route10NPCText5
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext Route10NPCText6
	waitbutton
	closetext
	wait 10
	disappear ROUTE_10_BLUSH
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	if_equal RIGHT, .YouAreFacingRight
;	spriteface PLAYER, RIGHT
	applyonemovement ROUTE_10_GOGGLES_GIRL, turn_step_down
	playsound SFX_SWEET_KISS_2
	wait 3
;	spriteface PLAYER, UP
	closetext
	moveperson ROUTE_10_BLUSH, $d, $21
	wait 15
	spriteface PLAYER, DOWN
	closetext
	wait 10
	appear ROUTE_10_BLUSH
	opentext
	writetext Route10NPCText7
	waitbutton
	closetext
	wait 5
	disappear ROUTE_10_BLUSH
	spriteface PLAYER, UP
	opentext
	jump .cont
.YouAreFacingLeft
;	spriteface PLAYER, UP
	applyonemovement ROUTE_10_GOGGLES_GIRL, turn_step_right
	playsound SFX_SWEET_KISS_2
	wait 3
;	spriteface PLAYER, LEFT
	closetext
	moveperson ROUTE_10_BLUSH, $e, $20
	wait 15
	spriteface PLAYER, DOWN
	closetext
	wait 10
	appear ROUTE_10_BLUSH
	opentext
	writetext Route10NPCText7
	waitbutton
	closetext
	wait 5
	disappear ROUTE_10_BLUSH
	spriteface PLAYER, LEFT
	opentext
	jump .cont
.YouAreFacingRight
;	spriteface PLAYER, UP
	applyonemovement ROUTE_10_GOGGLES_GIRL, turn_step_left
	playsound SFX_SWEET_KISS_2
	wait 3
;	spriteface PLAYER, LEFT
	closetext
	moveperson ROUTE_10_BLUSH, $c, $20
	wait 15
	spriteface PLAYER, DOWN
	closetext
	wait 10
	appear ROUTE_10_BLUSH
	opentext
	writetext Route10NPCText7
	waitbutton
	closetext
	wait 5
	disappear ROUTE_10_BLUSH
	spriteface PLAYER, RIGHT
	opentext
.cont
	takeitem SAFE_GOGGLES
	writetext Route10NPCText8
	waitbutton
	verbosegiveitem SAFE_GOGGLES
	writetext Route10NPCText9
	waitbutton
	closetext
	setevent EVENT_ROUTE_10_GOGGLES_GIRL
	end
.done_goggles
	writetext Route10NPCText10
	waitbutton
	closetext
	end
.no
	writetext Route10NPCText3
	waitbutton
	closetext
	end


Route10NPCText1:
	text "I think I lost"
	line "my goggles in"
	cont "the cave…"
	
	para "They were brand"
	line "new, too!"
	
	para "Could you maybe"
	line "keep an eye out?"
	
	para "I'll give you"
	line "something good in"
	cont "return!"
	done
	
Route10NPCText2:
	text "My goggles!"
	
	para "You found my"
	line "goggles!"
	
	para "Please, can I have"
	line "them back?"
	
	para "I'll give you"
	line "something good in"
	cont "return!"
	done
	
Route10NPCText3:
	text "What!?"
	
	para "No fair!"
	done
	
Route10NPCText4:
	text "Yay!"
	
	para "Thank you!"
	line "Thank you!"
	done
	
Route10NPCText5:
	text "<PLAYER> handed"
	line "over SAFTEYGOGGLE."
	done
	
Route10NPCText6:
	text "And heeeeere's"
	line "your reward!"
	done
	
Route10NPCText7:
	text "She kissed your"
	line "cheek…"
	done
	
Route10NPCText8:
	text "Huh?"
	
	para "That's not enough?"
	
	para "Ugh… Fine…"
	
	para "You can have my"
	line "old pair…"
	done
	
Route10NPCText9:
	text "What?"
	
	para "Why couldn't I just"
	line "use this pair?"
	
	para "I don't like the"
	line "color!"
	done
	
Route10NPCText10:
	text "Thanks again,"
	line "sweetie!"
	done
	
TrainerRoute10_1:
	generictrainer BOARDER, FRANK, EVENT_BEAT_ROUTE_10_TRAINER_1, .SeenText, .BeatenText

	text "Aren't you cold?"
	
	para "You're wearing"
	line "shorts!"
	done

.SeenText:
	text "Look at you!"
	
	para "You are NOT"
	line "dressed for this…"
	done

.BeatenText:
	text "Still beat me,"
	line "huh?"
	done
	
TrainerRoute10_2:
	generictrainer SKIER, KIM, EVENT_BEAT_ROUTE_10_TRAINER_2, .SeenText, .BeatenText

	text "Cold enough for"
	line "ya?"
	
	para "Haha…"
	
	para "…"
	
	para "I'm still no good"
	line "at small talk…"
	done

.SeenText:
	text "Nice weather,"
	line "huh?"
	
	para "Haha…"
	
	para "…"
	
	para "I'm no good at"
	line "small talk."
	done

.BeatenText:
	text "I'm no good at"
	line "battling, either…"
	done
	
TrainerRoute10_3:
	generictrainer BOARDER, JOSE, EVENT_BEAT_ROUTE_10_TRAINER_3, .SeenText, .BeatenText

	text "Snowboarding in a"
	line "snowstorm is tons"
	cont "of fun!"
	done

.SeenText:
	text "There's been a lot"
	line "of snowstorms"
	cont "lately."
	
	para "Makes battles more"
	line "interesting at"
	cont "least!"
	done

.BeatenText:
	text "What a battle!"
	done
	
TrainerRoute10_4:
	generictrainer SKIER, SHERRY, EVENT_BEAT_ROUTE_10_TRAINER_4, .SeenText, .BeatenText

	text "Nice and toasty!"
	done

.SeenText:
	text "Sure is cold out"
	line "here!"
	
	para "How about a battle"
	line "to warm up?"
	done

.BeatenText:
	text "That did it!"
	done
	
TrainerRoute10_5:
	generictrainer BOARDER, PETER, EVENT_BEAT_ROUTE_10_TRAINER_5, .SeenText, .BeatenText

	text "Your shoes are"
	line "covered in snow!"
	
	para "My snowboard lets"
	line "me glide right"
	cont "over!"
	done

.SeenText:
	text "Snow slowing you"
	line "down?"
	
	para "See, I don't have"
	line "that problem!"
	done

.BeatenText:
	text "Woah!"
	line "Slow down!"
	done
	
TrainerRoute10_6:
	generictrainer FIREBREATHER, TEX, EVENT_BEAT_ROUTE_10_TRAINER_6, .SeenText, .BeatenText

	text "Gah!"
	
	para "I'm burning up!"
	done

.SeenText:
	text "Cold?"
	line "I'm not cold!"
	
	para "MY BLOOD BURNS AS"
	line "HOT AS FIRE!"
	done

.BeatenText:
	text "HOT! HOT!"
	done
	
TrainerRoute10_7:
	generictrainer BOARDER, GLENN, EVENT_BEAT_ROUTE_10_TRAINER_7, .SeenText, .BeatenText

	text "Keep going!"
	
	para "You're almost"
	line "there!"
	done

.SeenText:
	text "How are your #-"
	line "MON handling the"
	cont "cold?"
	
	para "You're almost to"
	line "town now!"
	done

.BeatenText:
	text "Holding up well!"
	done
	
Route10Sign:
	jumptext Route10SignText
	
Route10SignText:
	text "ROUTE 10"
	
	para "NORTH: TWINKLE"
	line "TOWN"
	
	para "SOUTH: FLICKER"
	line "PASS"
	done
	
Route10MoveRelearnerSign:
	jumptext Route10MoveRelearnerSignText
	
Route10MoveRelearnerSignText:
	text "MOVE RELEARNER"
	
	para "Inquire inside."
	done
	
Route10Snowman1:
	opentext
	checkevent EVENT_ROUTE_10_SNOWMAN_1_2
	iftrue .tooksecondeye
	checkevent EVENT_ROUTE_10_SNOWMAN_1_1
	iftrue .tookfirsteye
	writetext TwinkleTownSnowman1Text1
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $8, $24, $bd
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text2
	waitbutton
	closetext
	setevent EVENT_ROUTE_10_SNOWMAN_1_1
	end
.tookfirsteye
	writetext TwinkleTownSnowman1Text3
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $8, $24, $be
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text4
	waitbutton
	closetext
	setevent EVENT_ROUTE_10_SNOWMAN_1_2
	end
.tooksecondeye
	writetext TwinkleTownSnowman1Text5
	waitbutton
	closetext
	end
.no
	writetext TwinkleTownSnowman1TextNo
	waitbutton
	closetext
	end
	
Route10Snowman2:
	opentext
	checkevent EVENT_ROUTE_10_SNOWMAN_2_2
	iftrue .tooksecondeye
	checkevent EVENT_ROUTE_10_SNOWMAN_2_1
	iftrue .tookfirsteye
	writetext TwinkleTownSnowman1Text1
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $28, $8, $bf
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text2
	waitbutton
	closetext
	setevent EVENT_ROUTE_10_SNOWMAN_2_1
	end
.tookfirsteye
	writetext TwinkleTownSnowman1Text3
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $28, $8, $c0
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text4
	waitbutton
	closetext
	setevent EVENT_ROUTE_10_SNOWMAN_2_2
	end
.tooksecondeye
	writetext TwinkleTownSnowman1Text5
	waitbutton
	closetext
	end
.no
	writetext TwinkleTownSnowman1TextNo
	waitbutton
	closetext
	end
	
Route10Random:
	checkevent EVENT_HAD_FIRST_SNOWSTORM
	iffalse .first_storm
	checkevent EVENT_SNOWSTORM_HAPPENING
	iftrue .endcallback
	callasm Route10RandomAsm
	jump .endcallback
.first_storm
	callasm Route10FirstTimeRandomAsm
	setevent EVENT_HAD_FIRST_SNOWSTORM
.endcallback
	return
	
Route10Callback:
	checkevent EVENT_ROUTE_10_SNOWMAN_1_2
	iffalse .no1
	changeblock $8, $24, $be
	jump .snowman2
.no1
	checkevent EVENT_ROUTE_10_SNOWMAN_1_1
	iffalse .snowman2
	changeblock $8, $24, $bd
.snowman2
	checkevent EVENT_ROUTE_10_SNOWMAN_2_2
	iffalse .no2
	changeblock $28, $8, $c0
	jump .snowmanend
.no2
	checkevent EVENT_ROUTE_10_SNOWMAN_2_1
	iffalse .snowmanend
	changeblock $28, $8, $bf
.snowmanend
	return
	
Route10SfxAsm:
	farcall CheckSFX
	ret c
	ld de, SFX_SNOWSTORM
	farcall PlaySFX
	ret
	
Route10StartSnowstorm:
	setevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 1
	playsound SFX_SNOWSTORM_INTRO
	dotrigger $4
	end
	
Route10RandomAsm:
	call Random
	cp $7f ; 50 percent
	ret c
	call Random
	cp $3f ; 25 percent
	jr c, Route10SetScene1Asm
	call Random
	cp $3f ; 25 percent
	jr c, Route10SetScene2Asm
	jr Route10SetScene3Asm
	
Route10FirstTimeRandomAsm:
	call Random
	cp $7f ; 50 percent
	jr c, Route10SetScene1Asm
	jr Route10SetScene2Asm
	
	
Route10SetScene1Asm:
	ld b, BANK(Route10SetScene1Script)
	ld de, Route10SetScene1Script
	jr Route10SetSceneFinishAsm
	
Route10SetScene2Asm:
	ld b, BANK(Route10SetScene2Script)
	ld de, Route10SetScene2Script
	jr Route10SetSceneFinishAsm
	
Route10SetScene3Asm:
	ld b, BANK(Route10SetScene3Script)
	ld de, Route10SetScene3Script
	
Route10SetSceneFinishAsm:
	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [wScriptBank]
	ld [hli], a
	ld a, [wScriptPos]
	ld [hli], a
	ld a, [wScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [wScriptBank], a
	ld a, e
	ld [wScriptPos], a
	ld a, d
	ld [wScriptPos + 1], a
	ret
	
Route10SetScene1Script:
	dotrigger $1
	end
	
Route10SetScene2Script:
	dotrigger $2
	end
	
Route10SetScene3Script:
	dotrigger $3
	end
