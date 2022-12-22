EastTrainCab_MapScriptHeader:
	db 2 ; scene scripts
	scene_script EastTrainCabTrigger0
	scene_script EastTrainCabTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  0,  2, TRAIN_CABIN_2, 2
	warp_event  3,  2, LUSTER_TRAIN_CUTSCENE, 1

	db 1 ; coord events
	coord_event  1,  2, 0, EastTrainCabEngineerStopsYou

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_OFFICER,  1,  1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EastTrainCabEngineer, -1
	person_event SPRITE_SNARE,  1,  3, SPRITEMOVEDATA_STANDING_RIGHT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EastTrainCabSnare1, -1
	person_event SPRITE_SNARE,  3,  3, SPRITEMOVEDATA_STANDING_RIGHT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EastTrainCabSnare2, -1
	person_event SPRITE_SNARE_GIRL,  2,  4, SPRITEMOVEDATA_STANDING_RIGHT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_LOCKE,  2,  3, SPRITEMOVEDATA_STANDING_RIGHT, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EastTrainCabLocke, -1
	

	const_def 1 ; object constants
	const EAST_TRAIN_CAB_ENGINEER
	const EAST_TRAIN_CAB_SNARE_1
	const EAST_TRAIN_CAB_SNARE_2
	const EAST_TRAIN_CAB_SNARE_DRIVER
	const EAST_TRAIN_CAB_LOCKE
	
EastTrainCabTrigger0:
	end
	
EastTrainCabTrigger1:
	end
	
EastTrainCabEngineerStopsYou:
	dotrigger $1
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface EAST_TRAIN_CAB_ENGINEER, DOWN
	showemote EMOTE_SHOCK, EAST_TRAIN_CAB_ENGINEER, 15
	spriteface PLAYER, UP
	opentext
	writetext EastTrainCabEngineerText1
	waitbutton
	closetext
	pause 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, EAST_TRAIN_CAB_LOCKE, 15
	spriteface EAST_TRAIN_CAB_ENGINEER, RIGHT
	spriteface PLAYER, RIGHT
	opentext
	writetext EastTrainCabLockeText1
	waitbutton
	closetext
	pause 5
	spriteface EAST_TRAIN_CAB_ENGINEER, DOWN
	spriteface PLAYER, UP
	jumptext EastTrainCabEngineerText2
	
EastTrainCabEngineer:
	jumptextfaceplayer EastTrainCabEngineerText2
	
EastTrainCabSnare1:
	jumptext EastTrainCabSnare1Text
	
EastTrainCabSnare2:
	jumptext EastTrainCabSnare2Text
	
EastTrainCabLocke:
	opentext
	writetext EastTrainCabLockeText2
	waitbutton
	closetext
	faceplayer
	pause 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, EAST_TRAIN_CAB_LOCKE, 15
	opentext
	writetext EastTrainCabLockeText3
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext EastTrainCabLockeWinText, EastTrainCabLockeLoseText
	setlasttalked EAST_TRAIN_CAB_LOCKE
	loadtrainer LOCKE, TRAIN_LOCKE
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext EastTrainCabLockeText4
	waitbutton
	closetext
	spriteface EAST_TRAIN_CAB_LOCKE, RIGHT
	pause 5
	opentext
	writetext EastTrainCabLockeTextMove
	waitbutton
	closetext
	waitsfx
	applyonemovement EAST_TRAIN_CAB_LOCKE, turn_step_right
	playsound SFX_BUMP
	spriteface EAST_TRAIN_CAB_SNARE_DRIVER, DOWN
	applyonemovement EAST_TRAIN_CAB_SNARE_DRIVER, fix_facing
	follow EAST_TRAIN_CAB_SNARE_DRIVER, EAST_TRAIN_CAB_LOCKE
	applyonemovement EAST_TRAIN_CAB_SNARE_DRIVER, step_up
	stopfollow
	applyonemovement EAST_TRAIN_CAB_SNARE_DRIVER, remove_fixed_facing
	pause 5
	playsound SFX_ELEVATOR_END
	opentext
	writetext EastTrainCabLockeText5
	waitbutton
	closetext
	spriteface EAST_TRAIN_CAB_LOCKE, LEFT
	pause 5
	opentext
	writetext EastTrainCabLockeText6
	waitbutton
	closetext
	pause 5
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear EAST_TRAIN_CAB_SNARE_1
	disappear EAST_TRAIN_CAB_SNARE_2
	disappear EAST_TRAIN_CAB_SNARE_DRIVER
	disappear EAST_TRAIN_CAB_LOCKE
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
	applyonemovement EAST_TRAIN_CAB_ENGINEER, step_right
	spriteface EAST_TRAIN_CAB_ENGINEER, DOWN
	spriteface PLAYER, UP
	opentext
	writetext EastTrainCabEngineerText3
	waitbutton
	closetext
	applymovement EAST_TRAIN_CAB_ENGINEER, Movement_East_Train_Cab
	applyonemovement PLAYER, step_right
	changeblock $2, $2, $1a
	opentext
	writetext EastTrainCabEngineerText4
	waitbutton
	closetext
	pause 5
	playsound SFX_ELEVATOR_END
	opentext
	writetext EastTrainCabEngineerText5
	waitbutton
	closetext
	spriteface EAST_TRAIN_CAB_ENGINEER, LEFT
	pause 5
	opentext
	writetext EastTrainCabEngineerText6
	waitbutton
	verbosegiveitem TRAIN_PASS
	writetext EastTrainCabEngineerText7
	waitbutton
	closetext
	spriteface EAST_TRAIN_CAB_ENGINEER, RIGHT
	pause 5
	opentext
	writetext EastTrainCabEngineerText8
	waitbutton
	closetext
	special FadeOutPalettes
	applyonemovement PLAYER, hide_person
	domaptrigger LUSTER_TRAIN_STATION, $1
	warpcheck
	end
	
EastTrainCabEngineerText1:
	text "Pssst…"
	
	para "Hey kid!"
	
	para "Keep your voice"
	line "down!"
	
	para "I'm the CONDUCTOR!"
	
	para "Those goons broke"
	line "in and took over"
	cont "the train!"
	
	para "You're a TRAINER,"
	line "right?"
	
	para "You gotta help me!"
	done
	
EastTrainCabEngineerText2:
	text "You got this, kid!"
	
	para "Show them what"
	line "for!"
	done
	
EastTrainCabEngineerText3:
	text "Oh wow!"
	
	para "Great job, kid!"
	
	para "I didn't think"
	line "you'd actually do"
	cont "it!"
	
	para "Oh!"
	
	para "I should get back"
	line "to the controls!"
	done
	
EastTrainCabEngineerText4:
	text "Just in time!"
	
	para "We're almost to"
	line "the station!"
	
	para "I'll make an"
	line "announcement."
	done
	
EastTrainCabEngineerText5:
	text "PA: Ding-dong!"
	
	para "This is your"
	line "CONDUCTOR."
	
	para "I have an update"
	line "on the situation."
	
	para "I've handled it!"
	
	para "You're all safe"
	line "now, thanks to me!"
	
	para "We'll be arriving"
	line "in LUSTER CITY"
	cont "momentarily."
	done
	
EastTrainCabEngineerText6:
	text "Hey kid."
	
	para "Why don't we keep"
	line "this between you"
	cont "and me."
	
	para "I'll make it worth"
	line "your while!"
	done
	
EastTrainCabEngineerText7:
	text "That RAIL PASS"
	line "will let you ride"
	cont "the TRAIN for free"
	cont "whenever you want!"
	
	para "Do we have a deal?"
	
	para "Of course we do!"
	done
	
EastTrainCabEngineerText8:
	text "Alright!"
	
	para "Here we are!"
	
	para "LUSTER CITY!"
	done
	
EastTrainCabSnare1Text:
	text "Knock it off!"
	
	para "Don't make me"
	line "turn around!"
	done
	
EastTrainCabSnare2Text:
	text "Keep driving!"
	
	para "The others should"
	line "be taking care of"
	cont "the passengers."
	done
	
EastTrainCabLockeText1:
	text "Quiet back there!"
	done
	
EastTrainCabLockeText2:
	text "I thought I told"
	line "you to be quiet"
	cont "back there!"
	
	para "I'll shut you up!"
	done
	
EastTrainCabLockeText3:
	text "Who?"
	
	para "A kid?"
	
	para "How did you get"
	line "in here?"
	
	para "You must be the"
	line "one that got in"
	cont "our way on SUNBEAM"
	cont "ISLAND!"
	
	para "Well, not this"
	line "time!"
	
	para "I'm ending this"
	line "before it gets out"
	cont "of hand!"
	done
	
EastTrainCabLockeText4:
	text "I can't believe it!"
	
	para "How did you take"
	line "everyone down?"
	
	para "How did you take"
	line "ME down?"
	
	para "You're just one"
	line "kid!"
	
	para "This is a"
	line "nightmare!"
	
	para "…"
	
	para "Forget this!"
	done
	
EastTrainCabLockeText5:
	text "PA: Ding-dong!"
	
	para "Attention TEAM"
	line "SNARE!"
	
	para "This is LOCKE."
	
	para "There's been a"
	line "change of plans…"
	
	para "Get ready to bail!"
	
	para "We're outta here,"
	line "boys!"
	done
	
EastTrainCabLockeText6:
	text "This isn't over"
	line "runt!"
	
	para "We'll get our"
	line "revenge!"
	done
	
EastTrainCabLockeTextMove:
	text "Move over!"
	done
	
EastTrainCabLockeWinText:
	text "This can't be"
	line "happening!"
	done
	
EastTrainCabLockeLoseText:
	text "Just like that!"
	done

Movement_East_Train_Cab:
	step_right
	step_down
	step_right
	step_end
	