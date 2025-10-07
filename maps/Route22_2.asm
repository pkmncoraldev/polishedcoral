Route22_2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 5 ; coord events
	coord_event 58, 31, 0, Route22_2_Snare
	coord_event 58, 32, 0, Route22_2_Snare
	coord_event 58, 33, 0, Route22_2_Snare
	coord_event 58, 34, 0, Route22_2_Snare
	coord_event 58, 35, 0, Route22_2_Snare

	db 0 ; bg events

	db 9 ; object events
	person_event SPRITE_SNARE, 33, 61, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_2_SNARE_GONE
	person_event SPRITE_BIKER, 16, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route22_2Trainer1, -1
	person_event SPRITE_BIKER, 33,  8, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route22_2Trainer2, -1
	person_event SPRITE_CUEBALL, 32, 37, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route22_2Trainer3, -1
	person_event SPRITE_BIKER, 34, 38, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route22_2Trainer4, -1
	person_event SPRITE_BIKER, 13, 66, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer5, -1
	person_event SPRITE_BIKER, 12, 57, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer6, -1
	person_event SPRITE_CUEBALL, 11, 66, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer7, -1
	person_event SPRITE_CUEBALL, 10, 57, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route22_2Trainer8, -1
	
	
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
	generictrainer BIKER, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_1, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer2:
	generictrainer BIKER, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_2, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer3:
	generictrainer CUEBALL, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_3, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer4:
	generictrainer BIKER, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_4, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer5:
	generictrainer BIKER, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_5, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer6:
	generictrainer BIKER, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_6, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer7:
	generictrainer CUEBALL, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_7, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route22_2Trainer8:
	generictrainer CUEBALL, REX, EVENT_BEAT_ROUTE_22_2_TRAINER_8, .SeenText, .BeatenText

	text "TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	