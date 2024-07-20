RadiantField_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5, 20, 2, RADIANT_TOWNSHIP
	warp_def  5, 21, 3, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	person_event SPRITE_PIGTAILS, 11, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantFieldRose, EVENT_SAVED_ROSE
	person_event SPRITE_PIGTAILS, 22, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantFieldIris, EVENT_SAVED_IRIS
	person_event SPRITE_PIGTAILS, 18,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantFieldViolet, EVENT_SAVED_VIOLET
	person_event SPRITE_CASINO,  7, 22, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO,  7, 23, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO,  7, 18, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO,  7, 19, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 26, 28, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 26, 29, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_AROMA_LADY, 12, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 2, RadiantFieldTrainer1, -1
	person_event SPRITE_AROMA_LADY, 22, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 2, RadiantFieldTrainer2, -1
	person_event SPRITE_AROMA_LADY, 18, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 3, RadiantFieldTrainer3, -1
	person_event SPRITE_AROMA_LADY, 20, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 3, RadiantFieldTrainer4, -1
	
	
	const_def 1 ; object constants
	const RADIANT_FIELD_ROSE
	const RADIANT_FIELD_IRIS
	const RADIANT_FIELD_VIOLET
	
RadiantFieldTrainer1:
	generictrainer AROMA_LADY, TAYLOR, EVENT_BEAT_RADIANT_FIELD_TRAINER_1, .SeenText, .BeatenText

	text "Ahhh!"
	
	para "Our battle kicked"
	line "up so much pollen!"
	done

.SeenText:
	text "A beautiful field"
	line "of flowers."
	
	para "Is there anywhere"
	line "better for a #-"
	cont "MON battle?"
	done

.BeatenText:
	text "Whoops."
	done
	
RadiantFieldTrainer2:
	generictrainer AROMA_LADY, CAROL, EVENT_BEAT_RADIANT_FIELD_TRAINER_2, .SeenText, .BeatenText

	text "Your fierce"
	line "#MON beat mine"
	cont "fair and square."
	done

.SeenText:
	text "My GRASS-type"
	line "#MON thrive in"
	cont "this environment."
	
	para "There's no way"
	line "we'll lose!"
	done

.BeatenText:
	text "My GRASS-type"
	line "#MON!"
	done
	
RadiantFieldTrainer3:
	generictrainer AROMA_LADY, AMBER, EVENT_BEAT_RADIANT_FIELD_TRAINER_3, .SeenText, .BeatenText

	text "Join me!"
	
	para "Let's dance among"
	line "the flowers toget-"
	cont "her!"
	done

.SeenText:
	text "Hehehe!"
	
	para "I love dancing"
	line "among the flowers!"
	done

.BeatenText:
	text "Woo!"
	done
	
RadiantFieldTrainer4:
	generictrainer AROMA_LADY, JODI, EVENT_BEAT_RADIANT_FIELD_TRAINER_4, .SeenText, .BeatenText

	text "Did you know the"
	line "brown part of a"
	cont "sunflower is made"
	cont "up of many tiny"
	cont "flowers called"
	cont "florets?"
	
	para "Aren't sunflowers"
	line "fascinating?"
	done

.SeenText:
	text "If you can beat me"
	line "I'll tell you an"
	cont "intersting fact"
	cont "about sunflowers!"
	done

.BeatenText:
	text "Ok! <WAIT_S>You won!"
	done
	
RadiantFieldRose:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
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
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
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
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .time_to_save
	faceplayer 
	opentext
	writetext RadiantFieldVioletText1
	farwritetext StdBlankText
	pause 6
	writetext RadiantFieldVioletText3
	waitbutton
	closetext
	end
.time_to_save
	faceplayer
	opentext
	writetext RadiantFieldVioletText2
	farwritetext StdBlankText
	pause 6
	writetext RadiantFieldVioletText3
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
	text "I just love the"
	line "sunflowers!"
	
	para "They're so pretty!"
	done
	
RadiantFieldRoseText2:
	text "ROSE: I just love"
	line "the sunflowers!"
	
	para "They're so pretty!"
	
	para "What?"
	
	para "MS. ERIKA wants us"
	line "to come home?"
	
	para "Ok! <WAIT_S>Bye bye!"
	done
	
RadiantFieldIrisText1:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "I'm collecting"
	line "flowers for GRAMMA"
	cont "LEILANI."
	done
	
RadiantFieldIrisText2:
	text "IRIS: La <WAIT_S>la <WAIT_S>la!"
	
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
	text "I love the smell"
	line "of these flowers!"
	
	para "I wish I could"
	line "smell them forev-<WAIT_S>"
	done
	
RadiantFieldVioletText2:	
	text "VIOLET: I love the"
	line "smell of these"
	cont "flowers!"
	
	para "I wish I could"
	line "smell them forev-<WAIT_S>"
	done
	
RadiantFieldVioletText3:
	text "Ah…<WAIT_M> AH!<WAIT_L> …CHOO!"
	
	para "I better go home"
	line "before GRAMMA"
	cont "worries about me…"
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
	step_left
	step_left
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
	step_left
	step_left
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
