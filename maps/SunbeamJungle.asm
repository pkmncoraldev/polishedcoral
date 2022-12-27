SunbeamJungle_MapScriptHeader:
	db 3 ; scene scripts
	scene_script SunbeamJungleTrigger0
	scene_script SunbeamJungleTrigger1
	scene_script SunbeamJungleTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SunbeamJungleCallback

	db 3 ; warp events
	warp_def 25,  4, 3, SUNBEAM_ISLAND
	warp_def 25,  5, 12, SUNBEAM_ISLAND
	warp_def  5, 11, 1, SUNBEAM_JUNGLE_CAVE

	db 18 ; coord events
	xy_trigger 1, 17, 11, 0, SunbeamJungleKageScript, 0, 0
	coord_event  4,  8, 2, JungleMakeSilverBlack
	coord_event  6, 11, 2, JungleMakeSilverBlack
	coord_event 17,  7, 2, JungleMakeSilverBlack
	coord_event  5,  6, 1, JungleMakeSilverBlue
	coord_event  5,  7, 1, JungleMakeSilverBlue
	coord_event  5,  8, 1, JungleMakeSilverBlue
	coord_event 17,  6, 2, JungleMakeSilverBlack
	coord_event 16,  6, 1, JungleMakeSilverBlue
	coord_event 16,  7, 1, JungleMakeSilverBlue
	coord_event 16,  8, 1, JungleMakeSilverBlue
	coord_event 16,  9, 1, JungleMakeSilverBlue
	coord_event 17,  8, 2, JungleMakeSilverBlack
	coord_event 17,  9, 2, JungleMakeSilverBlack
	coord_event 17, 10, 2, JungleMakeSilverBlack
	coord_event 17, 11, 2, JungleMakeSilverBlack
	coord_event  6, 10, 1, JungleMakeSilverBlue
	coord_event  7, 11, 1, JungleMakeSilverBlue

	db 8 ; bg events
	signpost  7,  8, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7,  9, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7, 10, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7, 11, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7, 12, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7, 13, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7, 14, SIGNPOST_READ, SunbeamJungleBigWaterfall
	signpost  7, 15, SIGNPOST_READ, SunbeamJungleBigWaterfall

	db 15 ; object events
	cuttree_event  4,  9, EVENT_SUNBEAM_JUNGLE_CUT_TREE_1
	cuttree_event 24,  5, EVENT_SUNBEAM_JUNGLE_CUT_TREE_2
	cuttree_event 25, 18, EVENT_SUNBEAM_JUNGLE_CUT_TREE_3
	person_event SPRITE_KAGE, 22,  4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_JUNGLE_CUTSCENE
	person_event SPRITE_SNARE, 22,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_JUNGLE_CUTSCENE
	person_event SPRITE_KAGE, 16,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE, 17,  8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE, 14,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, SunbeamJungleSnare2, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE_GIRL,  6, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, SunbeamJungleSnare3, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE, 13, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, SunbeamJungleSnare4, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE, 13, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, SunbeamJungleSnare5, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE_GIRL, 19, 27, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, SunbeamJungleSnare6, EVENT_SAVED_SUNBEAM
	person_event SPRITE_KAGE_WATER, -1, -1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAVED_SUNBEAM
	person_event SPRITE_SNARE_WATER, -1, -1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAVED_SUNBEAM
	person_event SPRITE_TRAFFIC_LIGHT,  5, 11, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1

	
	const_def 1 ; object constants
	const SUNBEAM_JUNGLE_TREE_1
	const SUNBEAM_JUNGLE_TREE_2
	const SUNBEAM_JUNGLE_TREE_3
	const SUNBEAM_JUNGLE_KAGE_CUTSCENE
	const SUNBEAM_JUNGLE_SNARE_CUTSCENE
	const SUNBEAM_JUNGLE_KAGE
	const SUNBEAM_JUNGLE_SNARE_BRIDGE
	const SUNBEAM_JUNGLE_SNARE_1
	const SUNBEAM_JUNGLE_SNARE_2
	const SUNBEAM_JUNGLE_SNARE_3
	const SUNBEAM_JUNGLE_SNARE_4
	const SUNBEAM_JUNGLE_SNARE_5
	const SUNBEAM_JUNGLE_KAGE_WATER
	const SUNBEAM_JUNGLE_SNARE_WATER

	
SunbeamJungleCallback:
	checkevent EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_2
	iftrue .end
	clearevent EVENT_SUNBEAM_JUNGLE_DEEP_ELECTABUZZ_GONE
.end
	return

JungleMakeSilverBlue:
	setevent EVENT_JUNGLE_CAVE_BLUE
	loadvar wTimeOfDayPalFlags, $40 | 1
	special Special_UpdatePalsInstant
	dotrigger $2
	end
	
JungleMakeSilverBlack:
	clearevent EVENT_JUNGLE_CAVE_BLUE
	loadvar wTimeOfDayPalFlags, $40 | 0
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
SunbeamJungleBigWaterfall:
	jumptext SunbeamJungleBigWaterfallText
	
SunbeamJungleTrigger0:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	applyonemovement PLAYER, step_up
	opentext
	writetext SunbeamJungleKageText1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	spriteface SUNBEAM_JUNGLE_KAGE_CUTSCENE, DOWN
	spriteface SUNBEAM_JUNGLE_SNARE_CUTSCENE, DOWN
	showemote EMOTE_SHOCK, SUNBEAM_JUNGLE_KAGE_CUTSCENE, 15
	opentext
	writetext SunbeamJungleKageText2
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_KAGE_CUTSCENE, Movement_SunbeamJungleKage1
	disappear SUNBEAM_JUNGLE_KAGE_CUTSCENE
	applyonemovement SUNBEAM_JUNGLE_SNARE_CUTSCENE, step_down
	callasm CheckFacingObjectCutscene
	iffalse .endwalking
	applyonemovement SUNBEAM_JUNGLE_SNARE_CUTSCENE, step_left
	spriteface SUNBEAM_JUNGLE_SNARE_CUTSCENE, DOWN
.endwalking
	special SaveMusic
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	opentext
	writetext SunbeamJungleSnare1Text1
	waitbutton
	closetext
	waitsfx
	winlosstext SunbeamJungleSnare1WinText, 0
	setlasttalked SUNBEAM_JUNGLE_SNARE_CUTSCENE
	loadtrainer GRUNTM, SUNBEAM_GRUNTM_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext SunbeamJungleSnare1Text2
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_SNARE_CUTSCENE, Movement_SunbeamJungleSnare2
	disappear SUNBEAM_JUNGLE_SNARE_CUTSCENE
	setevent EVENT_SUNBEAM_JUNGLE_CUTSCENE
	special Special_StartLandmarkTimer
	dotrigger $1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
SunbeamJungleTrigger1:
	end
	
SunbeamJungleTrigger2:
	end
	
SunbeamJungleKageScript:
	checkevent EVENT_SAVED_SUNBEAM
	iftrue .end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface SUNBEAM_JUNGLE_SNARE_BRIDGE, RIGHT
	showemote EMOTE_SHOCK, SUNBEAM_JUNGLE_SNARE_BRIDGE, 15
	applymovement SUNBEAM_JUNGLE_SNARE_BRIDGE, MovementSunbeamJungleSnareBridge1
	opentext
	writetext SunbeamJungleSnareBridgeText1
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_SNARE_BRIDGE, MovementSunbeamJungleSnareBridge2
	applyonemovement SUNBEAM_JUNGLE_SNARE_BRIDGE, run_step_up
	spriteface SUNBEAM_JUNGLE_SNARE_BRIDGE, LEFT
	opentext
	writetext SunbeamJungleSnareBridgeText2
	waitbutton
	closetext
	wait 5
	spriteface SUNBEAM_JUNGLE_KAGE, RIGHT
	opentext
	writetext SunbeamJungleKageText3
	waitbutton
	closetext
	playmusic MUSIC_SNARE_THEME
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage2
	opentext
	writetext SunbeamJungleKageText4
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext SunbeamJungleKageWinText, SunbeamJungleKageLoseText
	setlasttalked SUNBEAM_JUNGLE_KAGE_CUTSCENE
	loadtrainer KAGE, SUNBEAM_KAGE
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext SunbeamJungleKageText5
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage3
	playsound SFX_BUMP
	applymovement PLAYER, Movement_SunbeamJunglePlayerPushed
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage4
	opentext
	writetext SunbeamJungleKageText6
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage5
	special Special_FadeOutMusic
	opentext
	writetext SunbeamJungleKageText7
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage6
	playsound SFX_LICK
	applyonemovement SUNBEAM_JUNGLE_KAGE, turn_away_right
	opentext
	writetext SunbeamJungleKageText8
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage8_2
	opentext
	writetext SunbeamJungleKageText9
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage8
	opentext
	writetext SunbeamJungleKageText10
	wait 5
	closetext
	playsound SFX_KINESIS
	applymovement SUNBEAM_JUNGLE_KAGE, Movement_SunbeamJungleKage9
	playsound SFX_KARATE_CHOP
	disappear SUNBEAM_JUNGLE_KAGE
	disappear SUNBEAM_JUNGLE_KAGE_WATER
	moveperson SUNBEAM_JUNGLE_KAGE_WATER, $c, $13
	appear SUNBEAM_JUNGLE_KAGE_WATER
	applymovement SUNBEAM_JUNGLE_KAGE_WATER, Movement_SunbeamJungleKage10
	disappear SUNBEAM_JUNGLE_KAGE_WATER
	applymovement SUNBEAM_JUNGLE_SNARE_BRIDGE, MovementSunbeamJungleSnareBridge3
	spriteface SUNBEAM_JUNGLE_SNARE_BRIDGE, DOWN
	opentext
	writetext SunbeamJungleSnareBridgeText3
	waitbutton
	closetext
	applymovement SUNBEAM_JUNGLE_SNARE_BRIDGE, MovementSunbeamJungleSnareBridge4
	playsound SFX_KINESIS
	applyonemovement SUNBEAM_JUNGLE_SNARE_BRIDGE, jump_step_down
	playsound SFX_KARATE_CHOP
	disappear SUNBEAM_JUNGLE_SNARE_BRIDGE
	disappear SUNBEAM_JUNGLE_SNARE_WATER
	moveperson SUNBEAM_JUNGLE_SNARE_WATER, $c, $13
	appear SUNBEAM_JUNGLE_SNARE_WATER
	applymovement SUNBEAM_JUNGLE_SNARE_WATER, Movement_SunbeamJungleKage10
	disappear SUNBEAM_JUNGLE_SNARE_WATER
	disappear SUNBEAM_JUNGLE_SNARE_1
	disappear SUNBEAM_JUNGLE_SNARE_2
	disappear SUNBEAM_JUNGLE_SNARE_3
	disappear SUNBEAM_JUNGLE_SNARE_4
	disappear SUNBEAM_JUNGLE_SNARE_5
	clearflag ENGINE_PUNKS_ON_SUNBEAM
	setevent EVENT_SAVED_SUNBEAM
	clearevent EVENT_HAVENT_SAVED_SUNBEAM
	clearevent EVENT_SUNBEAM_BOAT_GONE
	playmusic MUSIC_LAVA
.end
	end

SunbeamJungleSnare2:
	generictrainer GRUNTM, SUNBEAM_GRUNTM_2, EVENT_BEAT_SUNBEAM_JUNGLE_SNARE_2, .SeenText, .BeatenText

	text "Run along now."
	
	para "I won't ask any"
	line "more questions…"
	done

.SeenText:
	text "Where was he going"
	line "in such a rush?"
	
	para "Where are YOU"
	line "going in such a"
	cont "rush?"
	done

.BeatenText:
	text "Alright. You win."
	done
	end
	
SunbeamJungleSnare3:
	generictrainer GRUNTF, SUNBEAM_GRUNTF_1, EVENT_BEAT_SUNBEAM_JUNGLE_SNARE_3, .SeenText, .BeatenText

	text "THERE IS NO"
	line "PASSWORD."
	
	para "I WAS JOKING!"
	
	para "…"
	
	para "DID YOU LAUGH?"
	
	para "I CAN'T HEAR YOU!"
	done

.SeenText:
	text "WHAT'S THE"
	line "PASSWORD?"
	
	para "WHAT?"
	
	para "I CAN'T HEAR YOU"
	line "OVER THE SOUND OF"
	cont "THE WATERFALL!"
	done

.BeatenText:
	text "DID YOU SAY"
	line "SOMETHING?"
	done
	end
	
SunbeamJungleSnare4:
	generictrainer GRUNTM, SUNBEAM_GRUNTM_3, EVENT_BEAT_SUNBEAM_JUNGLE_SNARE_4, .SeenText, .BeatenText

	text "We're here taking"
	line "#MON, duh!"
	
	para "There's a lot of"
	line "money in the"
	cont "exotic #MON"
	cont "around here!"
	done

.SeenText:
	text "What are we doing"
	line "here?"
	
	para "Beat me and I"
	line "might tell you!"
	done

.BeatenText:
	text "Dang!"
	done
	end
	
SunbeamJungleSnare5:
	generictrainer GRUNTM, SUNBEAM_GRUNTM_4, EVENT_BEAT_SUNBEAM_JUNGLE_SNARE_5, .SeenText, .BeatenText

	text "Those are some"
	line "good #MON"
	cont "alright."
	
	para "Too good for me!"
	done

.SeenText:
	text "You got some good"
	line "#MON for me?"
	
	para "Let's take a look!"
	done

.BeatenText:
	text "Yep!"
	
	para "Sure do!"
	done
	end
	
SunbeamJungleSnare6:
	generictrainer GRUNTF, SUNBEAM_GRUNTF_2, EVENT_BEAT_SUNBEAM_JUNGLE_SNARE_6, .SeenText, .BeatenText

	text "Us taking #MON"
	line "is no worse then"
	cont "a TRAINER catching"
	cont "them."
	
	para "We just do it for"
	line "profit!"
	done

.SeenText:
	text "Do I feel bad"
	line "about just taking"
	cont "#MON?"
	
	para "No way!"
	done

.BeatenText:
	text "Why would I?"
	done
	end
	
SunbeamJungleBigWaterfallText:
	text "Wow, it's a huge"
	line "waterfall."
	done

SunbeamJungleKageText1:
	text "After we wrap up"
	line "here, we can hit"
	cont "the reserve at"
	cont "the #MON LAB."

	para "There should only"
	line "be an old man and"
	cont "a MUNCHLAX to deal"
	cont "with,"

	para "so we should be"
	line "able to handle it"
	cont "without any issue."

	para "This job needs to"
	line "go smoothly or…"
	done

SunbeamJungleKageText2:
	text "Who's there?"

	para "It's just some kid."

	para "Probably lost."

	para "Take care of it."
	done

SunbeamJungleKageText3:
	text "Seriously?"

	para "None of the others"
	line "could handle it?"

	para "Useless!"
	line "All of you!"

	para "I'll take care of"
	line "this real quick"
	cont "like."
	done

SunbeamJungleKageText4:
	text "You just don't"
	line "know when to give"
	cont "up, huh punk?"

	para "Well you're in over"
	line "your head now."

	para "You may have taken"
	line "all those other"
	cont "morons down,"

	para "but I'm a cut above"
	line "the rest!"

	para "And you really"
	line "shouldn't have"
	cont "messed with me!"
	done

SunbeamJungleKageText5:
	text "Wha…?"

	para "Am I losing my"
	line "edge?"

	para "How'd a punk like"
	line "you beat me?"

	para "Argh!"
	done

SunbeamJungleKageText6:
	text "I won't let you"
	line "continue to get in"
	cont "our way!"

	para "You made me do"
	line "this…"
	done

SunbeamJungleKageText7:
	text "Don't worry, kid."

	para "This'll only hurt"
	line "a lot!"
	done

SunbeamJungleKageText8:
	text "Woah…"

	para "WOAH!"
	done

SunbeamJungleKageText9:
	text "I'm slipping!"
	done

SunbeamJungleKageText10:
	text "AUUUUGH!"
	done

SunbeamJungleKageWinText:
	text "You little…!"
	done

SunbeamJungleKageLoseText:
	text "You got what ya"
	line "had coming!"
	done

SunbeamJungleSnare1Text1:
	text "You heard him."

	para "Can't have some"
	line "kid snooping"
	cont "around trying to"
	cont "stop us."
	done

SunbeamJungleSnare1Text2:
	text "Not good at all!"

	para "BOSS!"
	done

SunbeamJungleSnare1WinText:
	text "Not good!"
	done
	
SunbeamJungleSnareBridgeText1:
	text "Uh oh…"
	
	para "It's the kid again!"
	done
	
SunbeamJungleSnareBridgeText2:
	text "BOSS!"
	
	para "That kid made it"
	line "all the way here!"
	
	para "What do we do?"
	done
	
SunbeamJungleSnareBridgeText3:
	text "BOSS!"
	
	para "I'm right behind"
	line "ya!"
	done
	
Movement_SunbeamJungleKage1:
	step_up
	step_up
	step_up
	step_end
	
Movement_SunbeamJungleKage2:
	step_down
	step_right
	step_right
	step_right
	step_end
	
Movement_SunbeamJungleKage3:
	fix_facing
	step_left
	remove_fixed_facing
	run_step_right
	step_end
	
Movement_SunbeamJungleKage4:
	step_sleep 10
	step_right
	step_right
	step_end
	
Movement_SunbeamJungleKage5:
	fix_facing
	slow_step_left
	step_sleep 15
	slow_step_left
	remove_fixed_facing
	step_end

Movement_SunbeamJungleKage6:
	step_sleep 10
	run_step_right
	step_end
	
Movement_SunbeamJungleKage7:
	turn_step_down
	turn_step_down
	turn_step_down
	turn_step_down
	turn_step_up
	turn_step_up
	step_end
	
Movement_SunbeamJungleKage8:
	turn_step_up
	turn_step_up
Movement_SunbeamJungleKage8_2:
	turn_step_up
	turn_step_up
	step_end

Movement_SunbeamJungleKage9:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_SunbeamJungleKage10:
	turn_away_down
	turn_away_down
	turn_away_down
	turn_away_down
	step_end
	
Movement_SunbeamJunglePlayerPushed:
	fix_facing
	jump_step_right
	remove_fixed_facing
	step_end
	
Movement_SunbeamJungleSnare1:
	step_down
	step_down
	step_end
	
Movement_SunbeamJungleSnare2:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end

MovementSunbeamJungleSnareBridge1:
	turn_step_right
	turn_step_right
	turn_step_right
	step_end
	
MovementSunbeamJungleSnareBridge2:
	turn_step_up
	turn_step_up
	turn_step_up
	step_end
	
MovementSunbeamJungleSnareBridge3:
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end

MovementSunbeamJungleSnareBridge4:
	turn_step_down
	turn_step_down
	turn_step_down
	step_end
	
