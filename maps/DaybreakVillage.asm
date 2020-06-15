DaybreakVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, DaybreakVillageFlypointCallback

	db 4 ; warp events
	warp_event  4, 11, DAYBREAK_POKEMON_TRAINER_SCHOOL, 2
	warp_event 13,  7, DAYBREAK_POKECENTER, 2
	warp_event 19,  7, DAYBREAK_MARCUS_HOUSE, 2
	warp_event 17, 11, DAYBREAK_ALEX_HOUSE, 2
	
	db 0 ; coord events

	db 4 ; bg events
	bg_event 11, 10, SIGNPOST_JUMPTEXT, DaybreakVillageSignText
	bg_event  5, 12, SIGNPOST_JUMPTEXT, DaybreakTrainerSchoolSignText
	bg_event 14,  7, SIGNPOST_JUMPSTD, pokecentersign
	bg_event 19,  4, SIGNPOST_ITEM + SUPER_POTION, EVENT_DAYBREAK_HIDDEN_SUPER_POTION

	db 2 ; object events
	person_event SPRITE_GRANNY, 8, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DaybreakNPC1, -1
	itemball_event  5,  4, RARE_CANDY, 1, EVENT_DAYBREAK_RARE_CANDY

	
DaybreakVillageFlypointCallback:
	setflag ENGINE_FLYPOINT_DAYBREAK
	return
	
DaybreakNPC1:
	checkevent EVENT_BEAT_TEACHER
	iftrue .DaybreakNPCBeatTeacher
	jumptextfaceplayer DaybreakNPC1Text1
	
.DaybreakNPCBeatTeacher
	jumptextfaceplayer DaybreakNPC1Text2
	
DaybreakNPC1Text1:
	text "Is that a #MON?"
	
	para "Oh, it's so cute!"
	
	para "You should show"
	line "your old teacher."
	
	para "She's probably in"
	line "the schoolhouse"
	cont "teaching class."
	
	para "She'll be so proud."
	done
	
DaybreakNPC1Text2:
	text "Did you show your"
	line "teacher your"
	cont "#MON?"
	
	para "She gave you a"
	line "QUICK CLAW?"
	
	para "That's a useful"
	line "item!"
	
	para "Make sure you take"
	line "good care of it."
	done
	
DaybreakVillageSignText:
	text "DAYBREAK VILLAGE"
	
	para "A village of new"
	line "beginings."
	done
	
DaybreakTrainerSchoolSignText:
	text "DAYBREAK #MON"
	line "TRAINER SCHOOL"
	done
