WestTrainCab_MapScriptHeader:
	db 2 ; scene scripts
	scene_script WestTrainCabTrigger0
	scene_script WestTrainCabTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  2, TRAIN_CABIN_2, 1
	warp_event  2,  2, LUSTER_TRAIN_CUTSCENE, 1

	db 1 ; coord events
	coord_event  4,  2, 0, WestTrainCabEngineerStopsYou

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_OFFICER,  1,  4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, WestTrainCabEngineer, -1
	person_event SPRITE_SNARE,  1,  2, SPRITEMOVEDATA_STANDING_LEFT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WestTrainCabSnare1, -1
	person_event SPRITE_SNARE,  3,  2, SPRITEMOVEDATA_STANDING_LEFT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WestTrainCabSnare2, -1
	person_event SPRITE_SNARE_GIRL,  2,  1, SPRITEMOVEDATA_STANDING_LEFT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_LOCKE,  2,  2, SPRITEMOVEDATA_STANDING_LEFT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WestTrainCabLocke, -1
	

	const_def 1 ; object constants
	const WEST_TRAIN_CAB_ENGINEER
	const WEST_TRAIN_CAB_SNARE_1
	const WEST_TRAIN_CAB_SNARE_2
	const WEST_TRAIN_CAB_SNARE_DRIVER
	const WEST_TRAIN_CAB_LOCKE
	
WestTrainCabTrigger0:
	end
	
WestTrainCabTrigger1:
	end
	
WestTrainCabEngineerStopsYou:
	dotrigger $1
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface WEST_TRAIN_CAB_ENGINEER, DOWN
	showemote EMOTE_SHOCK, WEST_TRAIN_CAB_ENGINEER, 15
	spriteface PLAYER, UP
	opentext TEXTBOX_CONDUCTOR
	writetext WestTrainCabEngineerText1
	waitbutton
	closetext
	pause 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, WEST_TRAIN_CAB_LOCKE, 15
	spriteface WEST_TRAIN_CAB_ENGINEER, LEFT
	spriteface PLAYER, LEFT
	opentext TEXTBOX_LOCKE
	writetext WestTrainCabLockeText1
	waitbutton
	closetext
	pause 5
	spriteface WEST_TRAIN_CAB_ENGINEER, DOWN
	spriteface PLAYER, UP
	opentext TEXTBOX_CONDUCTOR
	writetext WestTrainCabEngineerText2
	waitbutton
	closetext
	end
	
WestTrainCabEngineer:
	jumptextfaceplayer TEXTBOX_CONDUCTOR, WestTrainCabEngineerText2
	
WestTrainCabSnare1:
	jumptext WestTrainCabSnare1Text
	
WestTrainCabSnare2:
	jumptext WestTrainCabSnare2Text
	
WestTrainCabLocke:
	opentext TEXTBOX_LOCKE
	writetext WestTrainCabLockeText2
	waitbutton
	closetext
	faceplayer
	pause 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, WEST_TRAIN_CAB_LOCKE, 15
	opentext TEXTBOX_LOCKE
	writetext WestTrainCabLockeText3
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext WestTrainCabLockeWinText, WestTrainCabLockeLoseText
	setlasttalked WEST_TRAIN_CAB_LOCKE
	loadtrainer LOCKE, TRAIN_LOCKE
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext TEXTBOX_LOCKE
	writetext WestTrainCabLockeText4
	waitbutton
	closetext
	spriteface WEST_TRAIN_CAB_LOCKE, LEFT
	pause 5
	opentext TEXTBOX_LOCKE
	writetext WestTrainCabLockeTextMove
	waitbutton
	closetext
	waitsfx
	applyonemovement WEST_TRAIN_CAB_LOCKE, turn_step_left
	playsound SFX_BUMP
	spriteface WEST_TRAIN_CAB_SNARE_DRIVER, DOWN
	applyonemovement WEST_TRAIN_CAB_SNARE_DRIVER, fix_facing
	follow WEST_TRAIN_CAB_SNARE_DRIVER, WEST_TRAIN_CAB_LOCKE
	applyonemovement WEST_TRAIN_CAB_SNARE_DRIVER, step_up
	stopfollow
	applyonemovement WEST_TRAIN_CAB_SNARE_DRIVER, remove_fixed_facing
	pause 5
	playsound SFX_ELEVATOR_END
	opentext TEXTBOX_PA
	writetext WestTrainCabLockeText5
	waitbutton
	closetext
	spriteface WEST_TRAIN_CAB_LOCKE, RIGHT
	pause 5
	opentext TEXTBOX_LOCKE
	writetext WestTrainCabLockeText6
	waitbutton
	closetext
	pause 5
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear WEST_TRAIN_CAB_SNARE_1
	disappear WEST_TRAIN_CAB_SNARE_2
	disappear WEST_TRAIN_CAB_SNARE_DRIVER
	disappear WEST_TRAIN_CAB_LOCKE
	clearflag ENGINE_PUNKS_ON_TRAIN
	clearevent EVENT_SNARE_ON_TRAIN
	setevent EVENT_DONE_SNARE_TRAIN
	setevent EVENT_ALWAYS_SET
	setevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	setevent EVENT_SAVED_TRAIN
	setevent EVENT_FLICKER_TRAIN_STATION_SNARE
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	special Special_FadeOutMusic
	waitsfx
	special Special_FadeInQuickly
	applyonemovement WEST_TRAIN_CAB_ENGINEER, step_left
	spriteface WEST_TRAIN_CAB_ENGINEER, DOWN
	spriteface PLAYER, UP
	opentext TEXTBOX_CONDUCTOR
	writetext WestTrainCabEngineerText3
	waitbutton
	closetext
	applymovement WEST_TRAIN_CAB_ENGINEER, Movement_West_Train_Cab
	applyonemovement PLAYER, step_left
	changeblock $2, $2, $1a
	opentext TEXTBOX_CONDUCTOR
	writetext WestTrainCabEngineerText4
	waitbutton
	closetext
	pause 5
	playsound SFX_ELEVATOR_END
	opentext TEXTBOX_PA
	writetext WestTrainCabEngineerText5
	waitbutton
	closetext
	spriteface WEST_TRAIN_CAB_ENGINEER, RIGHT
	pause 5
	opentext TEXTBOX_CONDUCTOR
	writetext WestTrainCabEngineerText6
;	waitbutton
;	verbosegiveitem TRAIN_PASS
;	writetext WestTrainCabEngineerText7
	waitbutton
	closetext
	spriteface WEST_TRAIN_CAB_ENGINEER, LEFT
	pause 5
	opentext TEXTBOX_CONDUCTOR
	writetext WestTrainCabEngineerText8
	waitbutton
	closetext
	special Special_DisableInput
	special FadeOutPalettes
	special Special_MakePlayerInvisible
	domaptrigger LUSTER_TRAIN_STATION, $1
	warpcheck
	end
	
WestTrainCabEngineerText1:
	text "Pssst…"
	
	para "Hey kid!"
	
	para "Keep your voice"
	line "down!"
	
	para "Those goons broke"
	line "in and took over"
	cont "the train!"
	
	para "You're a TRAINER,<WAIT_S>"
	line "right?"
	
	para "You gotta help me!"
	done
	
WestTrainCabEngineerText2:
	text "You got this, kid!"
	
	para "Show them what"
	line "for!"
	done
	
WestTrainCabEngineerText3:
	text "Oh wow!"
	
	para "Great job, kid!"
	
	para "I didn't think"
	line "you'd actually do"
	cont "it!"
	
	para "Oh!"
	
	para "I should get back"
	line "to the controls!"
	done
	
WestTrainCabEngineerText4:
	text "Just in time!"
	
	para "We're almost to"
	line "the station!"
	
	para "I'll make an"
	line "announcement."
	done
	
WestTrainCabEngineerText5:
	text "PA: Ding<WAIT_S>-dong!"
	
	para "This is your"
	line "CONDUCTOR."
	
	para "I have an update"
	line "on the situation."
	
	para "I've handled it!"
	
	para "You're all safe"
	line "now, <WAIT_S>thanks to me!"
	
	para "We'll be arriving"
	line "in LUSTER CITY"
	cont "momentarily."
	done
	
WestTrainCabEngineerText6:
	text "Hey kid."
	
	para "Why don't we keep"
	line "this between you"
	cont "and me."
	
	para "You will, <WAIT_S>won't"
	line "you?"
	
	para "Of course you"
	line "will!"
	done
	
WestTrainCabEngineerText7:
	text "That RAIL PASS"
	line "will let you ride"
	cont "the TRAIN for free"
	cont "whenever you want!"
	
	para "Do we have a deal?"
	
	para "Of course we do!"
	done
	
WestTrainCabEngineerText8:
	text "Alright!"
	
	para "Here we are!"
	
	para "LUSTER CITY!"
	done
	
WestTrainCabSnare1Text:
	text "Knock it off!"
	
	para "Don't make me"
	line "turn around!"
	done
	
WestTrainCabSnare2Text:
	text "Keep driving!"
	
	para "The others should"
	line "be taking care of"
	cont "the passengers."
	done
	
WestTrainCabLockeText1:
	text "Quiet back there!"
	done
	
WestTrainCabLockeText2:
	text "I thought I told"
	line "you to be quiet"
	cont "back there!"
	
	para "I'll shut you up!"
	done
	
WestTrainCabLockeText3:
	text "Who?<WAIT_M>"
	line "A kid?"
	
	para "How did you get"
	line "in here?"
	
	para "You must be the"
	line "one that got in"
	cont "our way on SUNBEAM"
	cont "ISLAND!"
	
	para "Well, <WAIT_S>not this"
	line "time!"
	
	para "I'm ending this"
	line "before it gets out"
	cont "of hand!"
	done
	
WestTrainCabLockeText4:
	text "I can't believe it!"
	
	para "How did you take"
	line "everyone down?"
	
	para "How did you take"
	line "ME down?"
	
	para "You're just one"
	line "kid!"
	
	para "This is a"
	line "nightmare!"
	
	para "…<WAIT_L>Forget this!"
	done
	
WestTrainCabLockeText5:
	text "Ding<WAIT_S>-dong!"
	
	para "Attention TEAM"
	line "SNARE!"
	
	para "This is LOCKE."
	
	para "There's been a"
	line "change of plans…"
	
	para "Get ready to bail!"
	
	para "We're outta here,"
	line "boys!"
	done
	
WestTrainCabLockeText6:
	text "This isn't over!"
	
	para "We'll get our"
	line "revenge!"
	done
	
WestTrainCabLockeTextMove:
	text "Move over!"
	done
	
WestTrainCabLockeWinText:
	text "This can't be"
	line "happening!"
	done
	
WestTrainCabLockeLoseText:
	text "Just like that!"
	done

Movement_West_Train_Cab:
	step_left
	step_down
	step_left
	step_end
	