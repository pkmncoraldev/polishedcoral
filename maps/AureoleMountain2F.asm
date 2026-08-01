AureoleMountain2F_MapScriptHeader:
	db 1 ; scene scripts
	scene_script AureoleMountain2FTrigger0

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 19,  5, 2, AUREOLE_MOUNTAIN_1F
	warp_def 13, 11, 1, AUREOLE_MOUNTAIN_3F
	warp_def 11, 20, 9, AUREOLE_MOUNTAIN_1F
	warp_def 10, 18, 1, ROUTE_1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17, 18, SIGNPOST_ITEM + SUPER_REPEL, EVENT_AUREOLE_MOUNTAIN_2F_HIDDEN_ITEM_1

	db 6 ; object events
	object_event 14,  7, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_AUREOLE_MOUNTAIN_2F_DISGUISEMAN_BLUE
	object_event 14,  7, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AureoleMountain2FDisguiseman, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_DISGUISEMAN
	person_event SPRITE_POKEMANIAC, 12,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain2F_Trainer_1, -1
	person_event SPRITE_COOLTRAINER_F,  2, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain2F_Trainer_2, -1
	person_event SPRITE_HIKER, 19, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain2F_Trainer_3, -1
	person_event SPRITE_POKEMANIAC, 10, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, AureoleMountain2F_Trainer_4, -1

	
AureoleMountain2FTrigger0:
	callasm AureoleMountain2FCoordAsm
	if_not_equal $13, .end
	disappear 1
.end
	end
	
AureoleMountain2FCoordAsm:
	ld a, [wXCoord]
	ld [wScriptVar], a
	ret	
	
AureoleMountain2F_Trainer_1:
	generictrainer PSYCHIC_T, JACQUES, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_1, .SeenText, .BeatenText

	text "I can't believe it!"
	
	para "My visions have"
	line "never been wrong!"
	
	para "Actually, they"
	line "have…"
	
	para "Hehe…"
	done

.SeenText:
	text "I see…"
	
	para "I see…"
	
	para "An easy victory!"
	done

.BeatenText:
	text "But my vision!"
	done
	
AureoleMountain2F_Trainer_2:
	generictrainer COOLTRAINERF, MAE, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_2, .SeenText, .BeatenText

	text "Alright."
	
	para "You might be just"
	line "a bit better than"
	cont "me…"
	done

.SeenText:
	text "How tough are you,"
	line "huh?"
	
	para "Let's find out!"
	done

.BeatenText:
	text "I coulda had"
	line "that!"
	done
	
AureoleMountain2F_Trainer_3:
	generictrainer HIKER, BRUCE, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_3, .SeenText, .BeatenText

	text "I made it to the"
	line "ladder up ahead,"
	
	para "but I couldn't"
	line "find my way any"
	cont "further."
	
	para "It's so confusing"
	line "up there!"
	done

.SeenText:
	text "This might be"
	line "where I have to"
	cont "turn back."
	
	para "Let's have a battle"
	line "while I give it"
	cont "some thought."
	done

.BeatenText:
	text "Guess it's over"
	line "for me."
	done
	
AureoleMountain2F_Trainer_4:
	generictrainer PSYCHIC_T, RHETT, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_4, .SeenText, .BeatenText

	text "You really should"
	line "watch where you're"
	cont "falling!"
	done

.SeenText:
	text "Woah!"
	
	para "Where the heck"
	line "did you come from?"
	done

.BeatenText:
	text "I didn't see"
	line "that coming!"
	done
	
AureoleMountain2FDisguiseman:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_DISGUISE_MASTER
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement 1, Movement_StarglowCavern_DisguiseMan1
	opentext TEXTBOX_UNKNOWN
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	faceplayer
	opentext TEXTBOX_DISGUISEMAN
	writetext AureoleMountain2FDisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext AureoleMountain2FDisguisemanBeatenText, 0
	setlasttalked 1
	loadtrainer DISGUISE, MASTER_6
	startbattle
	reloadmapafterbattle
	opentext TEXTBOX_DISGUISEMAN
	writetext AureoleMountain2FDisguiseMan1Text3
	waitbutton
	closetext
	applymovement 1, Movement_StarglowCavern_DisguiseMan2
	disappear 1
	opentext TEXTBOX_DISGUISEMAN
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	setevent EVENT_BEAT_AUREOLE_MOUNTAIN_2F_DISGUISEMAN
	setevent EVENT_UNIQUE_ENCOUNTER_DISGUISE_MASTER_AUREOLE_MOUNTAIN
	end

AureoleMountain2FDisguiseMan1Text2:
	text "TEXT 2"
	done
	
AureoleMountain2FDisguiseMan1Text3:
	text "TEXT 3"
	done
	
AureoleMountain2FDisguisemanBeatenText:
	text "YOU WIN"
	done