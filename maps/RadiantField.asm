RadiantField_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  4, 16, 2, RADIANT_TOWNSHIP
	warp_def  4, 17, 3, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_SCHOOLGIRL, 13, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantFieldLittleGirlRed, EVENT_RADIANT_FIELD_LITTLE_GIRL_RED
	person_event SPRITE_SCHOOLGIRL, 20, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantFieldLittleGirlBlue, EVENT_RADIANT_FIELD_LITTLE_GIRL_BLUE
	person_event SPRITE_SCHOOLGIRL, 16,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantFieldLittleGirlPurple, EVENT_RADIANT_FIELD_LITTLE_GIRL_PURPLE
	person_event SPRITE_CASINO,  9, 18, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO,  9, 19, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 24, 16, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	
	
	const_def 1 ; object constants
	const RADIANT_FIELD_LITTLE_GIRL_RED
	const RADIANT_FIELD_LITTLE_GIRL_BLUE
	const RADIANT_FIELD_LITTLE_GIRL_PURPLE
	
RadiantFieldLittleGirlRed:
	faceplayer
	opentext
	writetext RadiantFieldLittleGirlRedText
	waitbutton
	closetext
	setevent EVENT_RADIANT_FIELD_LITTLE_GIRL_RED
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement RADIANT_FIELD_LITTLE_GIRL_RED, Movement_LittleGirlRed
	jump .skip
.YouAreFacingLeft
	applymovement RADIANT_FIELD_LITTLE_GIRL_RED, Movement_LittleGirlRed2
.skip
	disappear RADIANT_FIELD_LITTLE_GIRL_RED
	checkevent EVENT_RADIANT_FIELD_LITTLE_GIRL_BLUE
	iffalse .end
	checkevent EVENT_RADIANT_FIELD_LITTLE_GIRL_PURPLE
	iffalse .end
	jump RadiantFieldFoundAllLittleGirls
.end
	end
	
RadiantFieldLittleGirlBlue:
	faceplayer
	opentext
	writetext RadiantFieldLittleGirlBlueText
	waitbutton
	closetext
	setevent EVENT_RADIANT_FIELD_LITTLE_GIRL_BLUE
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applymovement RADIANT_FIELD_LITTLE_GIRL_BLUE, Movement_LittleGirlBlue
	jump .skip
.YouAreFacingUp
	applymovement RADIANT_FIELD_LITTLE_GIRL_BLUE, Movement_LittleGirlBlue2
	applymovement RADIANT_FIELD_LITTLE_GIRL_BLUE, Movement_LittleGirlBlue3
.skip
	disappear RADIANT_FIELD_LITTLE_GIRL_BLUE
	checkevent EVENT_RADIANT_FIELD_LITTLE_GIRL_RED
	iffalse .end
	checkevent EVENT_RADIANT_FIELD_LITTLE_GIRL_PURPLE
	iffalse .end
	jump RadiantFieldFoundAllLittleGirls
.end
	end
	
RadiantFieldLittleGirlPurple:
	faceplayer
	opentext
	writetext RadiantFieldLittleGirlPurpleText
	waitbutton
	closetext
	setevent EVENT_RADIANT_FIELD_LITTLE_GIRL_PURPLE
	playsound SFX_JUMP_OVER_LEDGE
	applymovement RADIANT_FIELD_LITTLE_GIRL_PURPLE, Movement_LittleGirlPurple
	disappear RADIANT_FIELD_LITTLE_GIRL_PURPLE
	checkevent EVENT_RADIANT_FIELD_LITTLE_GIRL_RED
	iffalse .end
	checkevent EVENT_RADIANT_FIELD_LITTLE_GIRL_BLUE
	iffalse .end
	jump RadiantFieldFoundAllLittleGirls
.end
	end
	
RadiantFieldFoundAllLittleGirls:
	opentext
	writetext RadiantFieldFoundAllLittleGirlsText1
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	farwritetext StdBlankText
	pause 6
	writetext RadiantFieldFoundAllLittleGirlsText2
	waitbutton
	closetext
	setevent EVENT_RADIANT_FIELD_FOUND_ALL_GIRLS
	end
	
RadiantFieldFoundAllLittleGirlsText1:
	text "You found all the"
	line "girls!"
	done
	
RadiantFieldFoundAllLittleGirlsText2:
	text "Better go tell"
	line "GRAMMA LEILANI!"
	done
	
RadiantFieldLittleGirlRedText:
	text "Teehee!"
	
	para "You found me!"
	
	para "What?"
	
	para "GRAMMA is looking"
	line "for me?"
	
	para "Ok, I'm going home"
	line "now."
	
	para "Bye bye!"
	done
	
RadiantFieldLittleGirlBlueText:
	text "La la la!"
	
	para "I love the pretty"
	line "flowers."
	
	para "GRAMMA LEILANI is"
	line "waiting for me?"
	
	para "I didn't mean to"
	line "make her worry…"
	done
	
RadiantFieldLittleGirlPurpleText:
	text "Oh hi!"
	
	para "GRAMMA sent you to"
	line "check on me?"
	
	para "I'm fine!"
	
	para "I'll head back so"
	line "she doesn't worry."
	done
	
Movement_LittleGirlRed2:
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
	
Movement_LittleGirlRed:
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
	
Movement_LittleGirlBlue2:
	step_right
	
Movement_LittleGirlBlue:
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_LittleGirlBlue3:
	step_left
	step_left
	step_end
	
Movement_LittleGirlPurple:
	jump_step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
