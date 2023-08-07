RadiantField_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  6, 16, 2, RADIANT_TOWNSHIP
	warp_def  6, 17, 3, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_TWIN, 13, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantFieldRose, EVENT_SAVED_ROSE
	person_event SPRITE_TWIN, 20, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantFieldIris, EVENT_SAVED_IRIS
	person_event SPRITE_TWIN, 16,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantFieldViolet, EVENT_SAVED_VIOLET
	person_event SPRITE_CASINO,  9, 18, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO,  9, 19, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 24, 16, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	
	
	const_def 1 ; object constants
	const RADIANT_FIELD_ROSE
	const RADIANT_FIELD_IRIS
	const RADIANT_FIELD_VIOLET
	
RadiantFieldRose:
	checkevent EVENT_TALKED_TO_ERIKA_ONCE
	iftrue .time_to_save
	jumptextfaceplayer RadiantFieldRoseText1
.time_to_save
	faceplayer
	opentext
	writetext RadiantFieldRoseText2
	waitbutton
	closetext	
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement RADIANT_FIELD_ROSE, Movement_Rose
	jump .skip
.YouAreFacingLeft
	applymovement RADIANT_FIELD_ROSE, Movement_Rose2
.skip
	disappear RADIANT_FIELD_ROSE
	setevent EVENT_SAVED_ROSE
	callasm RoseSetNameAsm
	special Special_SaveLostGirl
.end
	end
	
RoseSetNameAsm:
	ld hl, .rosestring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.rosestring:
	db "ROSE@@@@@@@"
	
RadiantFieldIris:
	checkevent EVENT_TALKED_TO_ERIKA_ONCE
	iftrue .time_to_save
	jumptextfaceplayer RadiantFieldIrisText1
.time_to_save
	faceplayer
	opentext
	writetext RadiantFieldIrisText2
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applymovement RADIANT_FIELD_IRIS, Movement_Iris
	jump .skip
.YouAreFacingUp
	applymovement RADIANT_FIELD_IRIS, Movement_Iris2
	applymovement RADIANT_FIELD_IRIS, Movement_Iris3
.skip
	disappear RADIANT_FIELD_IRIS
	setevent EVENT_SAVED_IRIS
	callasm IrisSetNameAsm
	special Special_SaveLostGirl
.end
	end
	
IrisSetNameAsm:
	ld hl, .irisstring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.irisstring:
	db "IRIS@@@@@@@"
	
RadiantFieldViolet:
	checkevent EVENT_TALKED_TO_ERIKA_ONCE
	iftrue .time_to_save
	jumptextfaceplayer RadiantFieldVioletText1
.time_to_save
	faceplayer
	opentext
	writetext RadiantFieldVioletText2
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement RADIANT_FIELD_VIOLET, Movement_Violet
	disappear RADIANT_FIELD_VIOLET
	setevent EVENT_SAVED_VIOLET
	callasm VioletSetNameAsm
	special Special_SaveLostGirl
.end
	end
	
VioletSetNameAsm:
	ld hl, .violetstring
	ld bc, PKMN_NAME_LENGTH
	ld de, wStringBuffer1
	rst CopyBytes
	ret
	
.violetstring:
	db "VIOLET@@@@@"
	
RadiantFieldRoseText1:
	text "TEXT 1"
	done
	
RadiantFieldRoseText2:
	text "ROSE: TEXT 2"
	done
	
RadiantFieldIrisText1:
	text "La la la!"
	
	para "I'm collecting"
	line "flowers for GRAMMA"
	cont "LEILANI."
	done
	
RadiantFieldIrisText2:
	text "IRIS: La la la!"
	
	para "I'm collecting"
	line "flowers for GRAMMA"
	cont "LEILANI."
	
	para "Oh!"
	
	para "GRAMMA is worried"
	line "about me?"
	
	para "I didn't mean to"
	line "make her worry…"
	done
	
RadiantFieldVioletText1:
	text "TEXT 1"
	done
	
RadiantFieldVioletText2:	
	text "VIOLET: TEXT 2"
	done
	
Movement_Rose2:
	step_down
	step_right
	step_right
	step_right
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
Movement_Rose:
	step_right
	step_down
	step_right
	step_right
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
Movement_Iris2:
	step_right
	
Movement_Iris:
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_Iris3:
	step_left
	step_left
	step_end
	
Movement_Violet:
	jump_step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
