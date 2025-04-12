WestTrainCaboose_MapScriptHeader:
	db 2 ; scene scripts
	scene_script WestTrainCabooseTrigger0
	scene_script WestTrainCabooseTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, WestTrainCabooseCallback

	db 1 ; warp events
	warp_event  0,  2, TRAIN_CABIN_1, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_DISGUISEMAN,  2,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRAIN_CABIN_1_SNARE_OFFICER
	person_event SPRITE_SNARE,  2,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_WEST_TRAIN_CABOOSE_SNARE_GRUNT
	tapeball_event  2,  2, MUSIC_TRAIN, 1, EVENT_MUSIC_TRAIN

	const_def 1 ; object constants
	const WEST_TRAIN_CABOOSE_SNARE_OFFICER
	const WEST_TRAIN_CABOOSE_SNARE_GRUNT
	const WEST_TRAIN_CABOOSE_TAPE

WestTrainCabooseCallback:
	checkevent EVENT_SAVED_TRAIN
	iftrue .end
	moveperson WEST_TRAIN_CABOOSE_TAPE, -5,-5
.end
	return

WestTrainCabooseTrigger0:
	special Special_DisableInput
	setevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	applyonemovement PLAYER, remove_fixed_facing
	applyonemovement PLAYER, step_right
	playsound SFX_EXIT_BUILDING
	appear WEST_TRAIN_CABOOSE_SNARE_OFFICER
	pause 1
	pause 9
	special Special_EnableInput
	opentext
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	writetext WestTrainCabooseSnareGruntText1
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	pause 20
	follow PLAYER, WEST_TRAIN_CABOOSE_SNARE_OFFICER
	applyonemovement PLAYER, fix_facing
	applyonemovement PLAYER, step_right
	stopfollow
	applyonemovement PLAYER, remove_fixed_facing
	opentext
	writetext WestTrainCabooseSnareOfficerText1
	waitbutton
	closetext
	applymovement WEST_TRAIN_CABOOSE_SNARE_OFFICER, Movement_WestTrainCabooseGruntChange
	playsound SFX_TWINKLE
	variablesprite SPRITE_DISGUISEMAN, SPRITE_SNARE
	special MapCallbackSprites_LoadUsedSpritesGFX
	waitsfx
	pause 10
	opentext
	writetext WestTrainCabooseSnareOfficerText2
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext WestTrainCabooseSnareOfficerWinText, 0
	setlasttalked WEST_TRAIN_CABOOSE_SNARE_OFFICER
	loadtrainer GRUNTM, TRAIN_GRUNTM_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext WestTrainCabooseSnareOfficerText3
	waitbutton
	closetext
	applymovement WEST_TRAIN_CABOOSE_SNARE_OFFICER, Movement_WestTrainCabooseOfficerRunAway
	disappear WEST_TRAIN_CABOOSE_SNARE_OFFICER
	playsound SFX_ENTER_DOOR
	spriteface PLAYER, RIGHT
	opentext
	writetext WestTrainCabooseSnareGruntText2
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext WestTrainCabooseSnareGruntWinText, 0
	setlasttalked WEST_TRAIN_CABOOSE_SNARE_GRUNT
	loadtrainer GRUNTM, TRAIN_GRUNTM_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext WestTrainCabooseSnareGruntText3
	waitbutton
	closetext
	applymovement WEST_TRAIN_CABOOSE_SNARE_GRUNT, Movement_WestTrainCabooseGruntRunAway1
	playsound SFX_BUMP
	applymovement WEST_TRAIN_CABOOSE_SNARE_GRUNT, Movement_WestTrainCabooseGruntRunAway2
	playsound SFX_BUMP
	applymovement WEST_TRAIN_CABOOSE_SNARE_GRUNT, Movement_WestTrainCabooseGruntRunAway3
	disappear WEST_TRAIN_CABOOSE_SNARE_GRUNT
	playsound SFX_ENTER_DOOR
	setevent EVENT_SNARE_ON_TRAIN
	setevent EVENT_TRAIN_DOWN_OFFICER_GONE
	clearevent EVENT_ALWAYS_SET
	clearevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	special Special_FadeOutMusic
	pause 40
	playsound SFX_ELEVATOR_END
	opentext
	writetext WestTrainCaboosePAText1
	buttonsound
	writetext WestTrainCaboosePAText4
	waitsfx
	setflag ENGINE_PUNKS_ON_TRAIN
	playmusic MUSIC_SNARE_THEME
	writetext WestTrainCaboosePAText2
	pause 80
	buttonsound
	writetext WestTrainCaboosePAText4
	waitsfx
	writetext WestTrainCaboosePAText3
	waitbutton
	closetext
	pause 5
	variablesprite SPRITE_DISGUISEMAN, SPRITE_SNARE_GIRL
	clearevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	dotrigger $1
	callasm WestTrainCabooseCheckTapePlayerAsm
	iffalse .end
	special Special_FadeOutMusic
	pause 10
	playnewmapmusic
.end
	end
	
WestTrainCabooseCheckTapePlayerAsm:
	ld a, [wTapePlayerActive]
	ld [wScriptVar], a
	ret
	
WestTrainCabooseTrigger1:
	end
	
WestTrainCaboosePAText1:
	text "PA: Ding<WAIT_S>-dong!"
	
	para "This is your"
	line "CONDUCTOR."
	
	para "HAH! <WAIT_M>As if!"
	done
	
WestTrainCaboosePAText2:
	text "We're TEAM SNARE!"
	done
	
WestTrainCaboosePAText3:
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
	
WestTrainCaboosePAText4:
	text " "
	done
	
WestTrainCabooseSnareGruntText1:
	text "What's wrong?"
	
	para "Not what you were"
	line "expecting?"
	
	para "Snicker…"
	
	para "Alright."
	
	para "Hand over your"
	line "#MON and we"
	cont "won't hurt you"
	cont "too bad."
	done
	
WestTrainCabooseSnareGruntText2:
	text "Hey! <WAIT_M>Come back!"
	
	para "Don't leave me here"
	line "alone!"
	
	para "Whatever…"
	
	para "I got this myself!"
	done
	
WestTrainCabooseSnareGruntText3:
	text "Yeah…"
	
	para "I'm outta here,"
	line "too!"
	done
	
WestTrainCabooseSnareOfficerText1:
	text "What are you wait-"
	line "ing for kid?"
	
	para "You heard him!"
	
	para "Hand 'em over!"
	done
	
WestTrainCabooseSnareOfficerText2:
	text "That is, unless"
	line "you have something"
	cont "to say about it."
	done
	
WestTrainCabooseSnareOfficerText3:
	text "You've gotta be"
	line "kidding me!"
	
	para "I'm outta here!"
	done
	
WestTrainCabooseSnareOfficerWinText:
	text "What the!?"
	done
	
WestTrainCabooseSnareGruntWinText:
	text "I don't got this!"
	done
	
Movement_WestTrainCabooseGruntChange:
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	turn_head_down
	turn_head_right
	turn_head_up
	turn_head_left
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_right
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_left
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_right
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_left
	step_sleep 6
	turn_head_down
	step_sleep 6
	turn_head_right
	step_sleep 12
	step_end

Movement_WestTrainCabooseGruntRunAway1:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	step_end
	
Movement_WestTrainCabooseGruntRunAway2:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_sleep 12
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	run_step_up
	run_step_left
	run_step_left
	run_step_down
	run_step_down
	step_end
	
Movement_WestTrainCabooseGruntRunAway3:
	fix_facing
	jump_step_up
	remove_fixed_facing
	step_sleep 12
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_left
	step_end
	
Movement_WestTrainCabooseOfficerRunAway:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	step_end