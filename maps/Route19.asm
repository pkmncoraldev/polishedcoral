Route19_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route19Callback

	db 4 ; warp events
	warp_event 41, 46, ROUTE_19_DUSK_GATE, 1
	warp_event 41, 47, ROUTE_19_DUSK_GATE, 2
	warp_event 22, 13, SEASIDE_CAVE_1F, 1
	warp_event 27, 33, ROUTE_22_TUNNEL, 7

	db 0 ; coord events

	db 6 ; bg events
	signpost 27,  6, SIGNPOST_JUMPTEXT, Route19Sign1Text
	signpost 34, 25, SIGNPOST_JUMPTEXT, Route19Sign2Text
	signpost 12, 14, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_ROUTE_19_HIDDEN_BOTTLE_CAP_1
	signpost 10, 25, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_ROUTE_19_HIDDEN_BOTTLE_CAP_2
	signpost 44, 38, SIGNPOST_ITEM + MAX_POTION, EVENT_ROUTE_19_HIDDEN_MAX_POTION
	signpost 26,  6, SIGNPOST_ITEM + REVIVE, EVENT_ROUTE_19_HIDDEN_REVIVE


	db 10 ; object events
	person_event SPRITE_PIGTAILS, 40, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route19Clover, EVENT_SAVED_CLOVER
	person_event SPRITE_SKATER, 28, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route19Skater1, -1
	person_event SPRITE_SKATER, 28, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route19Skater2, -1
	person_event SPRITE_SAILOR, 31,  8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route19Trainer1, -1
	person_event SPRITE_SCHOOLBOY, 35, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route19Trainer2, -1
	person_event SPRITE_BIKER, 40,  6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route19Trainer3, -1
	person_event SPRITE_AROMA_LADY, 48, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 4, Route19Trainer4, -1
	person_event SPRITE_BIKER, 47, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route19Trainer5, -1
	person_event SPRITE_GENTLEMAN, 45, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route19Trainer6, -1
	tapeball_event 20, 31, MUSIC_TRAINER_VICTORY, 2, EVENT_MUSIC_TRAINER_VICTORY


	const_def 1 ; object constants
	const ROUTE_19_CLOVER
	
Route19Callback:
	domaptrigger ROUTE_22_TUNNEL, $0
	return
	
Route19Clover:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	jumptextfaceplayer Route19CloverText1
.time_to_save
	faceplayer
	opentext
	writetext Route19CloverText2
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ROUTE_19_CLOVER, Movement_Route19Clover
	disappear ROUTE_19_CLOVER
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
	
Route19Skater1:
	jumptextfaceplayer Route19Skater1Text
	
Route19Skater1Text:
	text "Grinding on the"
	line "planters lets you"
	cont "get to places you"
	cont "shouldn't be."
	
	para "It's cool, I guess."
	done
	
Route19Skater2:
	jumptextfaceplayer Route19Skater2Text
	
Route19Skater2Text:
	text "I love hopping"
	line "right over people's"
	cont "heads on my board."
	
	para "They never see it"
	line "coming!"
	done
	
Route19Trainer1:
	generictrainer SAILOR, SCOTT, EVENT_BEAT_ROUTE_19_TRAINER_1, .SeenText, .BeatenText

	text "We just docked at"
	line "PORT SHIMMER."
	
	para "It's so nice to be"
	line "back on dry land!"
	done

.SeenText:
	text "LAND HO!"
	
	para "Time for a battle,"
	line "matey!"
	done

.BeatenText:
	text "I'm sunk!"
	done
	
Route19Trainer2:
	generictrainer SCHOOLBOY, FREDDY, EVENT_BEAT_ROUTE_19_TRAINER_2, .SeenText, .BeatenText

	text "Your #MON are"
	line "so cool!"
	
	para "We have some work"
	line "to do!"
	done

.SeenText:
	text "Do you train"
	line "#MON too?"
	
	para "Can I see?"
	done

.BeatenText:
	text "Woah!"
	done
	
Route19Trainer3:
	generictrainer BIKER, GARRET, EVENT_BEAT_ROUTE_19_TRAINER_3, .SeenText, .BeatenText

	text "These brick roads"
	line "ain't a very smooth"
	cont "ride!"
	done

.SeenText:
	text "Ahaha!"
	
	para "Listen to this"
	line "baby purr!"
	done

.BeatenText:
	text "Argh!"
	
	para "My ride!"
	done
	
Route19Trainer4:
	generictrainer AROMA_LADY, LINDA, EVENT_BEAT_ROUTE_19_TRAINER_4, .SeenText, .BeatenText

	text "This place used to"
	line "smell like sweet"
	cont "flowers."
	
	para "Now it just smells"
	line "like gasoline!"
	
	para "Cough! Cough!"
	done

.SeenText:
	text "Sniff… Sniff…"
	
	para "Do you smell that?"
	done

.BeatenText:
	text "Smells like a"
	line "loss!"
	done
	
Route19Trainer5:
	generictrainer BIKER, DALE, EVENT_BEAT_ROUTE_19_TRAINER_5, .SeenText, .BeatenText

	text "I'll tell ya…"
	
	para "Life's an open"
	line "road, kid."
	
	para "I could never"
	line "settle down in"
	cont "one place!"
	done

.SeenText:
	text "Out on the open"
	line "road."
	
	para "Nothin' like it!"
	done

.BeatenText:
	text "You showed me!"
	done
	
Route19Trainer6:
	generictrainer GENTLEMAN, ELWARD, EVENT_BEAT_ROUTE_19_TRAINER_6, .SeenText, .BeatenText

	text "“MOOMOO'S” it's"
	line "called."
	
	para "Never in all of"
	line "my days have I"
	cont "seen such a rowdy"
	cont "bunch!"
	done

.SeenText:
	text "Have you been to"
	line "the establishment"
	cont "up ahead?"
	
	para "Quite the rowdy"
	line "bunch they are!"
	done

.BeatenText:
	text "Very well."
	done
	
Route19CloverText1:
	text "Hehe…"
	
	para "Me and the other"
	line "girls ran away"
	cont "from home!"
	
	para "It's fun to act"
	line "out!"
	done
	
Route19CloverText2:
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
	
Movement_Route19Clover:
	jump_step_down
	step_down
	step_down
	step_down
	step_end
	
Route19Sign1Text:
	text "ROUTE 19"
	
	para "WEST:"
	line "PORT SHIMMER"
	
	para "SOUTHEAST:"
	line "RADIANT TOWN &"
	cont "DUSK TURNPIKE"
	done
	
Route19Sign2Text:
	text "ROUTE 19"
	
	para "NORTHWEST:"
	line "PORT SHIMMER"
	
	para "SOUTHEAST:"
	line "RADIANT TOWN &"
	cont "DUSK TURNPIKE"
	done
	