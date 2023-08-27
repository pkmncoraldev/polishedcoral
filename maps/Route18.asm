Route18_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event 41, 42, ROUTE_18_DUSK_GATE, 1
	warp_event 41, 43, ROUTE_18_DUSK_GATE, 2
	warp_event 22,  9, SEASIDE_CAVE_1F, 1
	warp_event 27, 29, ROUTE_21_TUNNEL, 7

	db 0 ; coord events

	db 2 ; bg events
	signpost 23,  6, SIGNPOST_JUMPTEXT, Route18Sign1Text
	signpost 30, 25, SIGNPOST_JUMPTEXT, Route18Sign2Text

	db 8 ; object events
	person_event SPRITE_PIGTAILS, 36, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route18Clover, EVENT_SAVED_CLOVER
	person_event SPRITE_SKATER, 24, 18, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SAILOR, 28,  8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route18Trainer1, -1
	person_event SPRITE_SCHOOLBOY, 31, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route18Trainer2, -1
	person_event SPRITE_BIKER, 36,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route18Trainer3, -1
	person_event SPRITE_AROMA_LADY, 44, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_GENERICTRAINER, 4, Route18Trainer4, -1
	person_event SPRITE_BIKER, 43, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route18Trainer5, -1
	person_event SPRITE_GENTLEMAN, 41, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route18Trainer6, -1


	const_def 1 ; object constants
	const ROUTE_18_CLOVER
	
Route18Clover:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	jumptextfaceplayer Route18CloverText1
.time_to_save
	faceplayer
	opentext
	writetext Route18CloverText2
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ROUTE_18_CLOVER, Movement_Route18Clover
	disappear ROUTE_18_CLOVER
	setevent EVENT_SAVED_CLOVER
	callasm CloverSetNameAsm
	special Special_SaveLostGirl
	end
	
CloverSetNameAsm:
	ld hl, .cloverstring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.cloverstring:
	db "CLOVER@@@@@"
	
Route18Trainer1:
	generictrainer SAILOR, SCOTT, EVENT_BEAT_ROUTE_18_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route18Trainer2:
	generictrainer SCHOOLBOY, FREDDY, EVENT_BEAT_ROUTE_18_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route18Trainer3:
	generictrainer BIKER, GARRET, EVENT_BEAT_ROUTE_18_TRAINER_3, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route18Trainer4:
	generictrainer AROMA_LADY, LINDA, EVENT_BEAT_ROUTE_18_TRAINER_4, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route18Trainer5:
	generictrainer BIKER, DALE, EVENT_BEAT_ROUTE_18_TRAINER_5, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route18Trainer6:
	generictrainer GENTLEMAN, ELWARD, EVENT_BEAT_ROUTE_18_TRAINER_6, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route18CloverText1:
	text "Hehe…"
	
	para "Me and the other"
	line "girls ran away"
	cont "from home!"
	
	para "It's fun to act"
	line "out!"
	done
	
Route18CloverText2:
	text "CLOVER: Hehe…"
	
	para "Me and the other"
	line "girls ran away"
	cont "from home!"
	
	para "It's fun to act"
	line "out!"
	
	para "…"
	
	para "Huh? GRAMMA is"
	line "sick?"
	
	para "I didn't want to"
	line "actually hurt"
	cont "GRAMMA…"
	
	para "I guess I'll"
	line "go home then."
	done
	
Movement_Route18Clover:
	jump_step_down
	step_down
	step_down
	step_down
	step_end
	
Route18Sign1Text:
	text "ROUTE 18"
	
	para "WEST:"
	line "PORT SHIMMER"
	
	para "SOUTHEAST:"
	line "RADIANT TOWNSHIP &"
	cont "DUSK TURNPIKE"
	done
	
Route18Sign2Text:
	text "ROUTE 18"
	
	para "NORTHWEST:"
	line "PORT SHIMMER"
	
	para "SOUTHEAST:"
	line "RADIANT TOWNSHIP &"
	cont "DUSK TURNPIKE"
	done
	