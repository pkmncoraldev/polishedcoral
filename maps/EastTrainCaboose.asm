EastTrainCaboose_MapScriptHeader:
	db 2 ; scene scripts
	scene_script EastTrainCabooseTrigger0
	scene_script EastTrainCabooseTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 3,  2, TRAIN_CABIN_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_DISGUISEMAN,  2,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAIN_CABIN_1_SNARE_OFFICER
	person_event SPRITE_SNARE,  2,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_EAST_TRAIN_CABOOSE_SNARE_GRUNT

	const_def 1 ; object constants
	const EAST_TRAIN_CABOOSE_SNARE_OFFICER
	const EAST_TRAIN_CABOOSE_SNARE_GRUNT

EastTrainCabooseTrigger0:
	setevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement PLAYER, step_left
	playsound SFX_EXIT_BUILDING
	appear EAST_TRAIN_CABOOSE_SNARE_OFFICER
	pause 1
	pause 9
	opentext
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	writetext EastTrainCabooseSnareGruntText1
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	pause 20
	follow PLAYER, EAST_TRAIN_CABOOSE_SNARE_OFFICER
	applyonemovement PLAYER, fix_facing
	applyonemovement PLAYER, step_left
	stopfollow
	applyonemovement PLAYER, remove_fixed_facing
	opentext
	writetext EastTrainCabooseSnareOfficerText1
	waitbutton
	closetext
	applymovement EAST_TRAIN_CABOOSE_SNARE_OFFICER, Movement_EastTrainCabooseGruntChange
	playsound SFX_TWINKLE
	variablesprite SPRITE_DISGUISEMAN, SPRITE_SNARE
	special MapCallbackSprites_LoadUsedSpritesGFX
	waitsfx
	pause 10
	opentext
	writetext EastTrainCabooseSnareOfficerText2
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext EastTrainCabooseSnareOfficerWinText, 0
	setlasttalked EAST_TRAIN_CABOOSE_SNARE_OFFICER
	loadtrainer GRUNTM, TRAIN_GRUNTM_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext EastTrainCabooseSnareOfficerText3
	waitbutton
	closetext
	applymovement EAST_TRAIN_CABOOSE_SNARE_OFFICER, Movement_EastTrainCabooseOfficerRunAway
	disappear EAST_TRAIN_CABOOSE_SNARE_OFFICER
	playsound SFX_ENTER_DOOR
	spriteface PLAYER, LEFT
	opentext
	writetext EastTrainCabooseSnareGruntText2
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext EastTrainCabooseSnareGruntWinText, 0
	setlasttalked EAST_TRAIN_CABOOSE_SNARE_GRUNT
	loadtrainer GRUNTM, TRAIN_GRUNTM_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext EastTrainCabooseSnareGruntText3
	waitbutton
	closetext
	applymovement EAST_TRAIN_CABOOSE_SNARE_GRUNT, Movement_EastTrainCabooseGruntRunAway1
	playsound SFX_BUMP
	applymovement EAST_TRAIN_CABOOSE_SNARE_GRUNT, Movement_EastTrainCabooseGruntRunAway2
	playsound SFX_BUMP
	applymovement EAST_TRAIN_CABOOSE_SNARE_GRUNT, Movement_EastTrainCabooseGruntRunAway3
	disappear EAST_TRAIN_CABOOSE_SNARE_GRUNT
	playsound SFX_ENTER_DOOR
	setevent EVENT_SNARE_ON_TRAIN
	setevent EVENT_TRAIN_DOWN_OFFICER_GONE
	clearevent EVENT_ALWAYS_SET
	clearevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	special Special_FadeOutMusic
	pause 40
	playsound SFX_ELEVATOR_END
	opentext
	writetext EastTrainCaboosePAText1
	buttonsound
	writetext EastTrainCaboosePAText4
	waitsfx
	setflag ENGINE_PUNKS_ON_TRAIN
	playmapmusic
	writetext EastTrainCaboosePAText2
	pause 80
	buttonsound
	writetext EastTrainCaboosePAText4
	waitsfx
	writetext EastTrainCaboosePAText3
	waitbutton
	closetext
	pause 5
	variablesprite SPRITE_DISGUISEMAN, SPRITE_SNARE_GIRL
	clearevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	dotrigger $1
	end
	
EastTrainCabooseTrigger1:
	end
	
EastTrainCaboosePAText1:
	text "PA: Ding-dong!"
	
	para "This is your"
	line "CONDUCTOR."
	
	para "HAH!"
	
	para "As if!"
	done
	
EastTrainCaboosePAText2:
	text "We're TEAM SNARE!"
	done
	
EastTrainCaboosePAText3:
	text "Everyone stay in"
	line "your seats and"
	cont "don't move!"
	
	para "Someone will be by"
	line "shortly to take"
	cont "your #MON."
	
	para "MS. LOCKE!"
	
	para "We're in the cab"
	line "at the front of"
	cont "the train!"
	
	para "Let's get this"
	line "party started!"
	done
	
EastTrainCaboosePAText4:
	text " "
	done
	
EastTrainCabooseSnareGruntText1:
	text "What's wrong?"
	
	para "Not what you were"
	line "expecting?"
	
	para "Snicker…"
	
	para "Alright."
	
	para "Hand over your"
	line "#MON and we"
	cont "won't hurt too"
	cont "much."
	done
	
EastTrainCabooseSnareGruntText2:
	text "Hey!"
	
	para "Come back!"
	
	para "Don't leave me here"
	line "alone!"
	
	para "Whatever…"
	
	para "I got this myself!"
	done
	
EastTrainCabooseSnareGruntText3:
	text "Yeah…"
	
	para "I'm outta here,"
	line "too!"
	done
	
EastTrainCabooseSnareOfficerText1:
	text "What are you wait-"
	line "ing for kid?"
	
	para "You heard him!"
	
	para "Hand 'em over!"
	done
	
EastTrainCabooseSnareOfficerText2:
	text "That is, unless"
	line "you have something"
	cont "to say about it."
	done
	
EastTrainCabooseSnareOfficerText3:
	text "You've gotta be"
	line "kidding me!"
	
	para "I'm outta here!"
	done
	
EastTrainCabooseSnareOfficerWinText:
	text "What the!?"
	done
	
EastTrainCabooseSnareGruntWinText:
	text "I don't got this!"
	done
	
Movement_EastTrainCabooseGruntChange:
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 6
	turn_head_left
	step_sleep 12
	step_end

Movement_EastTrainCabooseGruntRunAway1:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	step_end
	
Movement_EastTrainCabooseGruntRunAway2:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_sleep 12
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	run_step_up
	run_step_right
	run_step_right
	run_step_down
	run_step_down
	step_end
	
Movement_EastTrainCabooseGruntRunAway3:
	fix_facing
	jump_step_up
	remove_fixed_facing
	step_sleep 12
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_right
	step_end
	
Movement_EastTrainCabooseOfficerRunAway:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	step_end
	