GreenGrotto1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, GreenGrotto1FRocksCallback

	db 8 ; warp events
	warp_event 29, 27, ROUTE_28, 4
	warp_event  3, 19, ROUTE_29, 1
	warp_event 11, 13, GREEN_GROTTO_B1F, 1
	warp_event 19, 21, GREEN_GROTTO_B1F, 2
	warp_event 39, 12, GREEN_GROTTO_B1F, 3
	warp_event 16, 11, GREEN_GROTTO_B1F, 4
	warp_event 34,  7, GREEN_GROTTO_B1F, 5
	warp_event 42, 21, GREEN_GROTTO_B1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	strengthboulder_event  9, 21, EVENT_GREEN_GROTTO_BOULDER_1
	strengthboulder_event 15,  5, EVENT_GREEN_GROTTO_BOULDER_2
	strengthboulder_event 40,  5, EVENT_GREEN_GROTTO_BOULDER_3
	strengthboulder_event 33, 13, EVENT_GREEN_GROTTO_BOULDER_4
	strengthboulder_event 38, 21, EVENT_GREEN_GROTTO_BOULDER_5
	person_event SPRITE_HIKER,  7, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerGreenGrotto1F_1, -1
	person_event SPRITE_TEACHER,  8, 26, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerGreenGrotto1F_2, -1
	person_event SPRITE_POKEFAN_M,  7, 43, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerGreenGrotto1F_3, -1
	person_event SPRITE_DELINQUENT_M, 16, 40, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerGreenGrotto1F_4, -1
	itemball_event 27, 18, CALCIUM, 1, EVENT_GREEN_GROTTO_1F_POKEBALL
	
	
	const_def 1 ; object constants
	const GREEN_GROTTO_BOULDER_1
	const GREEN_GROTTO_BOULDER_2
	const GREEN_GROTTO_BOULDER_3
	const GREEN_GROTTO_BOULDER_4
	const GREEN_GROTTO_BOULDER_5

GreenGrotto1FRocksCallback:
	writecmdqueue .BoulderCmdQueue
	return

.BoulderCmdQueue:
	dbw CMDQUEUE_STONETABLE, .BoulderTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.BoulderTable:
	stonetable 6, GREEN_GROTTO_BOULDER_1, .Boulder_1
	stonetable 6, GREEN_GROTTO_BOULDER_2, .Boulder_2
	stonetable 7, GREEN_GROTTO_BOULDER_3, .Boulder_3
	stonetable 7, GREEN_GROTTO_BOULDER_4, .Boulder_4
	stonetable 8, GREEN_GROTTO_BOULDER_5, .Boulder_5
	db -1 ; end

.Boulder_1:
	playsound SFX_KINESIS
	disappear GREEN_GROTTO_BOULDER_1
	sjump .FinishBoulder
	
.Boulder_2:
	playsound SFX_KINESIS
	disappear GREEN_GROTTO_BOULDER_2
	sjump .FinishBoulder
	
.Boulder_3:
	playsound SFX_KINESIS
	disappear GREEN_GROTTO_BOULDER_3
	sjump .FinishBoulder
	
.Boulder_4:
	playsound SFX_KINESIS
	disappear GREEN_GROTTO_BOULDER_4
	sjump .FinishBoulder
	
.Boulder_5:
	playsound SFX_KINESIS
	disappear GREEN_GROTTO_BOULDER_5
	sjump .FinishBoulder
	
.FinishBoulder
	refreshscreen
	pause 20
	playsound SFX_STRENGTH
	earthquake 80
	opentext
	writetext GreenGrottoBoulderFellThroughText
	waitbutton
	closetext
	end
	
TrainerGreenGrotto1F_1:
	generictrainer HIKER, PHILLIP, EVENT_BEAT_GREEN_GROTTO_1F_TRAINER_1, .SeenText, .BeatenText

	text "You're busy?"
	
	para "Well, don't let"
	line "me get in your"
	cont "way, then."
	done

.SeenText:
	text "Hey let's battle!"
	
	para "You ain't doin'"
	line "nothin' right now,"
	cont "are ya?"
	done

.BeatenText:
	text "What's wrong?"
	done
	
TrainerGreenGrotto1F_2:
	generictrainer TEACHER, KINSEY, EVENT_BEAT_GREEN_GROTTO_1F_TRAINER_2, .SeenText, .BeatenText

	text "Field trips are"
	line "a great way to"
	cont "give kids hands-on"
	cont "experience."
	
	para "I wonder if a"
	line "place like this"
	cont "is too dangerous…"
	done

.SeenText:
	text "This place is a"
	line "perfect spot to"
	cont "bring my class on"
	cont "a field trip!"
	done

.BeatenText:
	text "You know your"
	line "stuff!"
	done
	
TrainerGreenGrotto1F_3:
	generictrainer POKEFANM, JASON, EVENT_BEAT_GREEN_GROTTO_1F_TRAINER_3, .SeenText, .BeatenText

	text "What does it truly"
	line "mean to be a real"
	cont "#FAN?"
	
	para "Is it enough to"
	line "just be a fan of"
	cont "#MON?"
	done

.SeenText:
	text "I call myself a"
	line "#FAN, but what"
	cont "does that mean?"
	done

.BeatenText:
	text "Not a fan of"
	line "that…"
	done
	
TrainerGreenGrotto1F_4:
	generictrainer DELINQUENT_M, BEAU, EVENT_BEAT_GREEN_GROTTO_1F_TRAINER_4, .SeenText, .BeatenText

	text "I wait around in"
	line "this cave to jump"
	cont "random people."
	
	para "How awesome is"
	line "that?"
	done

.SeenText:
	text "GOTCHA!"
	
	para "Battle time!"
	done

.BeatenText:
	text "You got me."
	done
	
GreenGrottoBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done
