Route22_2_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route22_2Trigger0
	scene_script Route22_2Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route22_2Callback

	db 0 ; warp events

	db 5 ; coord events
	coord_event 58, 31, 0, Route22_2_Snare
	coord_event 58, 32, 0, Route22_2_Snare
	coord_event 58, 33, 0, Route22_2_Snare
	coord_event 58, 34, 0, Route22_2_Snare
	coord_event 58, 35, 0, Route22_2_Snare

	db 0 ; bg events

	db 14 ; object events
	person_event SPRITE_SNARE, 33, 61, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_2_SNARE_GONE
	person_event SPRITE_BIKER, 19, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route22_2Trainer1, -1
	person_event SPRITE_BIKER, 31,  7, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route22_2Trainer2, -1
	person_event SPRITE_CUEBALL, 31, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route22_2Trainer3, -1
	person_event SPRITE_BIKER, 34, 37, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route22_2Trainer4, -1
	person_event SPRITE_BIKER, 13, 66, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer5, -1
	person_event SPRITE_BIKER, 14, 57, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer6, -1
	person_event SPRITE_CUEBALL, 11, 66, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer7, -1
	person_event SPRITE_CUEBALL, 12, 57, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer8, -1
	person_event SPRITE_GENTLEMAN, 11, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route22_2Trainer9, -1
	tmhmball_event 15, 25, TM_SLUDGE_BOMB, EVENT_TM36
	person_event SPRITE_BILLBOARD_2, 30, 22, SPRITEMOVEDATA_BILLBOARD_2_L, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route22NPC1, -1
	person_event SPRITE_BILLBOARD_3, 30, 48, SPRITEMOVEDATA_BILLBOARD_1_L, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route22NPC1, -1
	person_event SPRITE_BILLBOARD_3,  8, 42, SPRITEMOVEDATA_BILLBOARD_2_L, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route22NPC1, -1
	
	
Route22_2Callback:
	checkevent EVENT_ROUTE_22_ROADBLOCK_GONE
	iffalse .end
	changeblock 6, -4, 193
	changeblock 8, -4, 185
	changeblock 10, -4, 194
.end
	return
	
Route22_2Trigger0:
Route22_2Trigger1:
	special Special_UpdatePalsInstant
	callasm Route22_2GetXCoordAsm
	if_equal 1, .first_right
	if_equal 2, .second_left
	if_equal 3, .second_right
	if_equal 4, .third_left
	if_equal 5, .third_right
	if_equal 6, .clear
	checkevent EVENT_BILLBOARDS_RIGHT
	iffalse .billboards_done
	moveperson 12, 22, 30
	billboard_move 12, 22, 30, -$30
	clearevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.first_right
	checkevent EVENT_BILLBOARDS_RIGHT
	iftrue .billboards_done
	moveperson 12, 25, 30
	billboard_move 12, 25, 30, $30
	setevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.second_left
	checkevent EVENT_BILLBOARDS_RIGHT
	iffalse .billboards_done
	moveperson 13, 48, 30
	billboard_move 13, 48, 30, -$30
	clearevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.second_right
	checkevent EVENT_BILLBOARDS_RIGHT
	iftrue .billboards_done
	moveperson 13, 51, 30
	billboard_move 13, 51, 30, $30
	setevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.third_left
	checkevent EVENT_BILLBOARDS_RIGHT
	iffalse .billboards_done
	moveperson 14, 42, 8
	billboard_move 14, 42, 8, -$30
	clearevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.third_right
	checkevent EVENT_BILLBOARDS_RIGHT
	iftrue .billboards_done
	moveperson 14, 45, 8
	billboard_move 14, 45, 8, $30
	setevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.clear
	clearevent EVENT_BILLBOARDS_RIGHT
.billboards_done
	end
	
Route22_2GetXCoordAsm:
	ld a, [wYCoord]
	cp $11
	jr c, .upper
	ld a, [wXCoord]
	cp $32
	jr nc, .second_right
	cp $22
	jr nc, .second_left
	cp $18
	jr nc, .first_right
;.first_left
	xor a
	ld [wScriptVar], a
	ret
.first_right
	ld a, 1
	ld [wScriptVar], a
	ret
.second_left
	ld a, 2
	ld [wScriptVar], a
	ret
.second_right
	ld a, 3
	ld [wScriptVar], a
	ret
.upper
	ld a, [wXCoord]
	cp $3a
	jr nc, .clear
	cp $2c
	jr nc, .third_right
.third_left
	ld a, 4
	ld [wScriptVar], a
	ret
.third_right
	ld a, 5
	ld [wScriptVar], a
	ret
.clear
	ld a, 6
	ld [wScriptVar], a
	ret
	
Route22_2_Snare:
	pause 10
	opentext
	writetext Route22_2_SnareText1
	waitbutton
	closetext
	pause 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 1, 15
	spriteface 1, LEFT
	opentext
	writetext Route22_2_SnareText2
	waitbutton
	closetext
	applymovement 1, Movement_Route22_2_Snare
	disappear 1
	dotrigger $1
	end
	
Route22_2_SnareText1:
	text "Huff…<WAIT_S> Puff…"
	done
	
Route22_2_SnareText2:
	text "Cripes!"
	
	para "Your bike is"
	line "fast!"
	
	para "Gotta go!"
	done
	
Movement_Route22_2_Snare:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	run_step_right
	run_step_right
	step_sleep 80
	run_step_left
	run_step_left
	run_step_left
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end
	
Route22_2Trainer1:
	generictrainer BIKER, WALKER, EVENT_BEAT_ROUTE_22_2_TRAINER_1, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer2:
	generictrainer BIKER, DONNY, EVENT_BEAT_ROUTE_22_2_TRAINER_2, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer3:
	generictrainer CUEBALL, BUTCH, EVENT_BEAT_ROUTE_22_2_TRAINER_3, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer4:
	generictrainer BIKER, CASSIDY, EVENT_BEAT_ROUTE_22_2_TRAINER_4, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer5:
	generictrainer BIKER, TOPHER, EVENT_BEAT_ROUTE_22_2_TRAINER_5, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer6:
	generictrainer BIKER, HAMM, EVENT_BEAT_ROUTE_22_2_TRAINER_6, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer7:
	generictrainer CUEBALL, WES, EVENT_BEAT_ROUTE_22_2_TRAINER_7, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer8:
	generictrainer CUEBALL, PATRICK, EVENT_BEAT_ROUTE_22_2_TRAINER_8, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer9:
	generictrainer GENTLEMAN, REGINALD, EVENT_BEAT_ROUTE_22_2_TRAINER_9, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	