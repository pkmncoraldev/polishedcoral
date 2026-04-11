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

	db 0 ; bg events

	db 6 ; object events
	object_event 14,  7, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_AUREOLE_MOUNTAIN_2F_DISGUISEMAN_BLUE
	object_event 14,  7, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AureoleMountain2FDisguiseman, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_DISGUISEMAN
	person_event SPRITE_PSYCHIC, 12,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain2F_Trainer_1, -1
	person_event SPRITE_COOLTRAINER_F,  2, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain2F_Trainer_2, -1
	person_event SPRITE_HIKER, 19, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, AureoleMountain2F_Trainer_3, -1
	person_event SPRITE_PSYCHIC, 10, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, AureoleMountain2F_Trainer_4, -1

	
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

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"	
	done

.BeatenText:
	text "YOU WIN"
	done
	
AureoleMountain2F_Trainer_2:
	generictrainer COOLTRAINERF, MAE, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"	
	done

.BeatenText:
	text "YOU WIN"
	done
	
AureoleMountain2F_Trainer_3:
	generictrainer HIKER, BRUCE, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_3, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"	
	done

.BeatenText:
	text "YOU WIN"
	done
	
AureoleMountain2F_Trainer_4:
	generictrainer PSYCHIC_T, RHETT, EVENT_BEAT_AUREOLE_MOUNTAIN_2F_TRAINER_4, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"	
	done

.BeatenText:
	text "YOU WIN"
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