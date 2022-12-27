DodrioRanchRaceTrack_MapScriptHeader:
	db 4 ; scene scripts
	scene_script DodrioRanchRaceTrackTrigger0
	scene_script DodrioRanchRaceTrackTrigger1
	scene_script DodrioRanchRaceTrackTrigger2
	scene_script DodrioRanchRaceTrackTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DodrioRanchRaceTrackMakeBrown

	db 0 ; warp events

	db 39 ; coord events
	xy_trigger 1, 11, 31, 0, RanchRideRaceCheckpoint1, 0, 0
	xy_trigger 1, 10, 31, 0, RanchRideRaceCheckpoint1, 0, 0
	xy_trigger 1, 12, 40, 0, RanchRideRaceCheckpoint2, 0, 0
	xy_trigger 1, 13, 40, 0, RanchRideRaceCheckpoint2, 0, 0
	xy_trigger 1, 24, 31, 0, RanchRideRaceCheckpoint3, 0, 0
	xy_trigger 1, 25, 31, 0, RanchRideRaceCheckpoint3, 0, 0
	xy_trigger 1, 17, 28, 0, RanchRideRaceFinishLine, 0, 0
	xy_trigger 1, 17, 29, 0, RanchRideRaceFinishLine, 0, 0
	xy_trigger 1, 18, 29, 0, RanchRideRaceBackwards, 0, 0
	xy_trigger 1, 18, 28, 0, RanchRideRaceBackwards, 0, 0
	xy_trigger 1, 12, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 14, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 15, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 16, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 18, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 19, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 20, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 21, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 23, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 24, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 11, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 23, 41, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 23, 40, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 22, 41, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 24, 37, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 25, 36, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 25, 37, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 22, 40, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 24, 36, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 28, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 29, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 30, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 31, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 32, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 33, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 34, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 26, 35, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 10, 27, 0, RanchRideRaceOffTrack, 0, 0
	xy_trigger 1, 25, 27, 0, RanchRideRaceOffTrack, 0, 0

	db 8 ; bg events
	signpost 18, 16, SIGNPOST_READ, RanchRideRaceLogs
	signpost 18, 13, SIGNPOST_READ, RanchRideRaceLogs
	signpost 17, 12, SIGNPOST_READ, RanchRideRaceLogs
	signpost 12, 17, SIGNPOST_READ, RanchRideRaceLogs
	signpost 11, 18, SIGNPOST_READ, RanchRideRaceLogs
	signpost 11, 19, SIGNPOST_READ, RanchRideRaceLogs
	signpost 10, 18, SIGNPOST_READ, RanchRideRaceLogs
	signpost 6, 17, SIGNPOST_READ, RanchRideRaceLogs

	db 11 ; object events
	person_event SPRITE_SNES,  7,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchRideScarecrow, -1
	person_event SPRITE_POKEMANIAC, 17, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RanchRideRaceGuy, -1
	person_event SPRITE_COWGIRL, 14,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RanchRideReturnGirl, -1
	object_event 14, 6, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchRideDodrio, -1
	object_event 15, 16, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchRideDoduo, -1
	object_event 15, 12, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchRideDoduo, -1
	object_event 8, 11, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchRideDoduo, -1
	object_event 11, 9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchRideDoduo, -1
	person_event SPRITE_BEAUTY, 12,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RanchRideDoduo, -1
	person_event SPRITE_BIRD_KEEPER, 3, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RanchRideDoduo, -1
	fruittreeinvis_event  28, 30, FRUITTREE_DODRIO_RANCH, LEPPA_BERRY


	const_def 1 ; object constants
	const RANCHRACESCARECROW
	const RANCHRACENPC1
	const RANCHRACENPC2
	const RANCHRACEDODRIO
	const RANCHRACEDODUO1
	const RANCHRACEDODUO2
	const RANCHRACEDODUO3
	const RANCHRACEDODUO4
	const RANCHRACEBERRYTREE
	
DodrioRanchRaceTrackTrigger0:
	end
	
DodrioRanchRaceTrackTrigger1:
	end
	
DodrioRanchRaceTrackTrigger2:
	spriteface RANCHRACENPC1, RIGHT
	spriteface PLAYER, LEFT
	opentext
	writetext RanchRideRaceText5
	waitbutton
	closetext
	setevent EVENT_JUST_FAILED_RANCH_RACE
	dotrigger $0
	end
	
DodrioRanchRaceTrackTrigger3:
	opentext
	writetext RanchRideReturnGirlText4
	waitbutton
	closetext
	dotrigger $0
	end
	
DodrioRanchRaceTrackMakeBrown:
	writebyte (1 << 7) | (PAL_OW_BROWN << 4)
	special Special_SetPlayerPalette
	return
	
RanchRideScarecrow:
	jumptext RanchRideScarecrowText
	
;RanchRacePokeBall1:
;	itemball LUCKY_EGG
	
;RanchRacePokeBall2:
;	itemball FULL_RESTORE
	
RanchRideDodrio:
	opentext
	writetext RanchRideDodrioText
	cry DODRIO
	waitbutton
	closetext
	end
	
RanchRideDoduo:
	opentext
	writetext RanchRideDoduoText
	cry DODUO
	waitbutton
	closetext
	end
	
RanchRideRaceLogs:
	jumptext RanchRideRaceLogsText
	
DodrioRanchRaceTrackResetTimerAsm:
	xor a
	ld [wRanchRaceFrames], a
	ld [wRanchRaceSeconds], a
	ret
	
RanchRideRaceCheckpoint1:
	setevent EVENT_RANCH_RACE_CHECKPOINT1
	end
	
RanchRideRaceCheckpoint2:
	setevent EVENT_RANCH_RACE_CHECKPOINT2
	end
	
RanchRideRaceCheckpoint3:
	setevent EVENT_RANCH_RACE_CHECKPOINT3
	end
	
RanchRideRaceFinishLine:
	checkevent EVENT_RANCH_RACE_CHECKPOINT1
	iffalse .nocheckpoints
	checkevent EVENT_RANCH_RACE_CHECKPOINT2
	iffalse .skippedcheckpoint
	checkevent EVENT_RANCH_RACE_CHECKPOINT3
	iffalse .skippedcheckpoint
	checkevent EVENT_RANCH_RACE_FINISHED_LAP_1
	iftrue .lap2
	setevent EVENT_RANCH_RACE_FINISHED_LAP_1
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	playsound SFX_TALLY
	end
.lap2
	checkevent EVENT_RANCH_RACE_FINISHED_LAP_2
	iftrue .lap3
	setevent EVENT_RANCH_RACE_FINISHED_LAP_2
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	playsound SFX_TALLY
	end
.lap3
	setflag ENGINE_DONE_RANCH_RACE_TODAY
	clearevent EVENT_DODRIO_RANCH_TIMER
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_1
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_2
	dotrigger $0
	playmusic MUSIC_NONE
	playsound SFX_RAZOR_WIND
	waitsfx
	playsound SFX_CHOOSE_A_CARD
	waitsfx
	pause 10
	spriteface RANCHRACENPC1, RIGHT
	spriteface PLAYER, LEFT
	playmusic MUSIC_ROUTE_4
	callasm CheckFacingObjectCutscene
	iffalse .endwalking
	applyonemovement PLAYER, step_left
.endwalking
	opentext
	checkcode VAR_RANCHRACESECONDS
	addvar $1
	RAM2MEM $0
	writetext RanchRideRaceText4
	clearevent EVENT_JUST_FAILED_RANCH_RACE
	pause 20
	playsound SFX_LEVEL_UP
	writetext RanchRideRaceTimeText
	waitsfx
	buttonsound
	checkevent EVENT_FINISHED_RANCH_RACE_ONCE
	iffalse .firsttime
	checkevent EVENT_FINISHED_RANCH_RACE_TWICE
	iffalse .secondtime
	writetext RanchRideRaceTimeTextThirdTime
	waitbutton
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .ranchsunday
	if_equal MONDAY, .ranchmonday
	if_equal TUESDAY, .ranchtuesday
	if_equal WEDNESDAY, .ranchwednesday
	if_equal THURSDAY, .ranchthursday
	if_equal FRIDAY, .ranchfriday
	if_equal SATURDAY, .ranchsaturday
.ranchsunday
	verbosegiveitem RARE_CANDY
	jump .gaveoutdayitem
.ranchmonday
	verbosegiveitem HP_UP
	jump .gaveoutdayitem
.ranchtuesday
	verbosegiveitem PROTEIN
	jump .gaveoutdayitem
.ranchwednesday
	verbosegiveitem IRON
	jump .gaveoutdayitem
.ranchthursday
	verbosegiveitem CALCIUM
	jump .gaveoutdayitem
.ranchfriday
	verbosegiveitem CARBOS
	jump .gaveoutdayitem
.ranchsaturday
	verbosegiveitem PP_UP
.gaveoutdayitem
	writetext RanchRideRaceText8
	waitbutton
	closetext
	callasm DodrioRanchRaceTrackResetTimerAsm
	end
.firsttime
	writetext RanchRideRaceTimeTextFirstTime
	buttonsound
	verbosegivetmhm HM_FLY
	setevent EVENT_GOT_HM02_FLY
	setflag ENGINE_GOT_FLY
	writetext RanchRideRaceText11
	waitbutton
	closetext
	setevent EVENT_FINISHED_RANCH_RACE_ONCE
	callasm DodrioRanchRaceTrackResetTimerAsm
	end
.secondtime
	writetext RanchRideRaceTimeTextSecondTime
	waitbutton
	setevent EVENT_FINISHED_RANCH_RACE_TWICE
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext RanchRideGotDoduoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DODUO, 10
	special TeachDoduoExtremeSpeed
	writetext RanchRideRaceText7
	waitbutton
	closetext
	setevent EVENT_RANCH_GOT_DODUO
	callasm DodrioRanchRaceTrackResetTimerAsm
	end
	
.PartyFull:
	writetext RanchRidePartyFullText
	waitbutton
	closetext
	setevent EVENT_FINISHED_RANCH_RACE_ONCE
	callasm DodrioRanchRaceTrackResetTimerAsm
	end
	
.skippedcheckpoint
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_1
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_2
	clearevent EVENT_DODRIO_RANCH_TIMER
	callasm DodrioRanchRaceTrackResetTimerAsm
	dotrigger $2
	playmusic MUSIC_NONE
	playsound SFX_WRONG
	waitsfx
	pause 10
	opentext
	writetext RanchRideRaceWhatAreYouDoingText
	waitbutton
	warp DODRIO_RANCH_RACETRACK, $1d, $11
	end
	
.nocheckpoints
	end
	
RanchRideRaceBackwards:
	checkevent EVENT_RANCH_RACE_CHECKPOINT3
	iftrue .end
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_1
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_2
	clearevent EVENT_DODRIO_RANCH_TIMER
	callasm DodrioRanchRaceTrackResetTimerAsm
	dotrigger $2
	playmusic MUSIC_NONE
	playsound SFX_WRONG
	waitsfx
	pause 10
	opentext
	writetext RanchRideRaceBackwardsText
	waitbutton
	warp DODRIO_RANCH_RACETRACK, $1d, $11
	end
.end
	end
RanchRideRaceOffTrack:
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_1
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_2
	clearevent EVENT_DODRIO_RANCH_TIMER
	callasm DodrioRanchRaceTrackResetTimerAsm
	dotrigger $2
	playmusic MUSIC_NONE
	playsound SFX_WRONG
	waitsfx
	pause 10
	opentext
	writetext RanchRideRaceOffTrackText
	waitbutton
	special FadeOutPalettes
	warp DODRIO_RANCH_RACETRACK, $1d, $11
	end
	
RanchRideRaceTimesUp::
	clearevent EVENT_RANCH_RACE_CHECKPOINT1
	clearevent EVENT_RANCH_RACE_CHECKPOINT2
	clearevent EVENT_RANCH_RACE_CHECKPOINT3
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_1
	clearevent EVENT_RANCH_RACE_FINISHED_LAP_2
	clearevent EVENT_DODRIO_RANCH_TIMER
	callasm DodrioRanchRaceTrackResetTimerAsm
	dotrigger $2
	playmusic MUSIC_NONE
	playsound SFX_WRONG
	waitsfx
	pause 10
	opentext
	writetext RanchRideRaceTimesUpText
	waitbutton
	special FadeOutPalettes
	warp DODRIO_RANCH_RACETRACK, $1d, $11
	end
	
RanchRideRaceGuy:
	faceplayer
	opentext
	checkevent EVENT_DODRIO_RANCH_TIMER
	iffalse .trytostartrace
;	checkcode VAR_CONTESTMINUTES
;	addvar $1
;	RAM2MEM $0
	writetext RanchRideRaceText6
	waitbutton
	closetext
	end
.trytostartrace

	checkevent EVENT_FINISHED_RANCH_RACE_ONCE
	iffalse .trytostartracecont
	checkevent EVENT_FINISHED_RANCH_RACE_TWICE
	iffalse .trytostartracecont
	checkevent EVENT_RANCH_GOT_DODUO
	iftrue .trytostartracecont
	writetext RanchRideRaceText9
	waitbutton
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull2
	writetext RanchRideGotDoduoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DODUO, 10
	special TeachDoduoExtremeSpeed
	writetext RanchRideRaceText7
	waitbutton
	closetext
	setevent EVENT_RANCH_GOT_DODUO
	end
	
.PartyFull2:
	writetext RanchRidePartyFullText
	waitbutton
	closetext
	end
	
.trytostartracecont
	checkflag ENGINE_DONE_RANCH_RACE_TODAY
	iftrue .doneracetoday
	checkevent EVENT_JUST_FAILED_RANCH_RACE
	iftrue .justfailed
	writetext RanchRideRaceText1
	jump .trytostartracecont2
.justfailed
	writetext RanchRideRaceText10
.trytostartracecont2
	yesorno
	iffalse .pickednoranchrace
	writetext RanchRideRaceText3
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	applymovement PLAYER, Movement_RanchRideMovement1
	jump .startranchrace
.YouAreFacingLeft
	applymovement PLAYER, Movement_RanchRideMovement2
	jump .startranchrace
.YouAreFacingRight
	applymovement PLAYER, Movement_RanchRideMovement4
	jump .startranchrace
.YouAreFacingDown
	applymovement PLAYER, Movement_RanchRideMovement3
.startranchrace
	dotrigger $1
	spriteface PLAYER, UP
	spriteface RANCHRACENPC1, RIGHT
	playmusic MUSIC_NONE
	opentext
	writetext RanchRideRaceCountdown3
	playsound SFX_TALLY
	pause 25
	writetext RanchRideRaceCountdown2
	playsound SFX_TALLY
	pause 25
	writetext RanchRideRaceCountdown1
	playsound SFX_TALLY
	pause 25
	writetext RanchRideRaceCountdownGo
	playsound SFX_THROW_BALL
	pause 25
	closetext
	playmusic MUSIC_DODRIO_RACE
	setevent EVENT_DODRIO_RANCH_TIMER
	end
.pickednoranchrace
	writetext RanchRideRaceText2
	waitbutton
	closetext
	end
.doneracetoday
	writetext RanchRideRaceText8
	waitbutton
	closetext
	end
	
RanchRideReturnGirl:
	faceplayer
	opentext
	writetext RanchRideReturnGirlText1
	yesorno
	iffalse .no
	writetext RanchRideReturnGirlText2
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	special Special_FadeBlackQuickly
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	waitsfx
	warpfacing UP, DODRIO_RANCH_HOUSE, $2, $4
	end
.no
	writetext RanchRideReturnGirlText3
	waitbutton
	closetext
	end
	
RanchRideRaceText1:
	text "Hey hey!"
	
	para "You're a natural!"
	
	para "Want to test your"
	line "riding skills with"
	cont "with a TIME TRIAL?"
	
	para "You could even win"
	line "a prize!"
	done
	
RanchRideRaceText2:
	text "Hmm…"
	
	para "Maybe next time."
	done
	
RanchRideRaceText3:
	text "Great!"
	
	para "You must do 3 laps"
	line "on the track in"
	cont "45 seconds."
	
	para "Remember to press"
	line "the A BUTTON to"
	cont "jump over the"
	cont "hurdles."
	
	para "Oh, and stay on"
	line "the track."
	
	para "If you step on the"
	line "grass, you're dis-"
	cont "qualified!"
	
	para "Get to the start"
	line "line, and we'll get"
	cont "going."
	done
	
RanchRideRaceText4:
	text "Great job!"
	
	para "Your time was…"
	done
RanchRideRaceTimeText:
	text_from_ram wStringBuffer3
	text " seconds!"
	done
	
RanchRideRaceTimeTextFirstTime:
	text "Wow, kid!"
	
	para "You were really"
	line "flying out there!"
	
	para "Alright!"
	
	para "Here's your prize!"
	done
	
RanchRideRaceTimeTextSecondTime:
	text "Alright!"
	
	para "Here's your prize!"
	
	para "A bonafide DODRIO"
	line "RANCH racing"
	cont "DODUO!"	
	done
	
RanchRideRaceTimeTextThirdTime:
	text "Alright!"
	
	para "Here's your prize!"
	done
	
RanchRideRaceText5:
	text "That's a shame."
	
	para "You should try"
	line "again."
	done
	
RanchRideRaceText6:
	text "What are you"
	line "doing!?"
	
	para "Get going!"
	done
	
RanchRideRaceText7:
	text "That DODUO hatched"
	line "just recently."
	
	para "It was born to"
	line "run!"
	
	para "It's a natural,"
	line "like you, kid!"
	
	para "Come back tomorrow"
	line "for a chance at"
	cont "another prize!"
	done
	
RanchRideRaceText8:
	text "Come back tomorrow"
	line "for a chance at"
	cont "another prize!"
	done
	
RanchRideRaceText9:
	text "Made some room?"
	done
	
RanchRideRaceText10:
	text "You want to try"
	line "again?"
	done
	
RanchRideRaceText11:
	text "That move will let"
	line "you fly to any"
	cont "town or city that"
	cont "you've visited!"
	
	para "You'll need a BADGE"
	line "from EVENTIDE"
	cont "VILLAGE to use it"
	cont "outside of battle."
	
	para "Come back tomorrow"
	line "for a chance at"
	cont "another prize!"
	done
	
RanchRideRaceWhatAreYouDoingText:
	text "What are you"
	line "doing!?"
	done
	
RanchRideRaceBackwardsText:
	text "STOP!"
	
	para "You're going the"
	line "wrong way!"
	done
	
RanchRideRaceOffTrackText:
	text "STOP!"
	
	para "You have to stay"
	line "on the track!"
	done
	
RanchRideRaceTimesUpText:
	text "STOP!"
	
	para "Time's up!"
	done
	
RanchRideRaceCountdown3:
	text "3…"
	done
	
RanchRideRaceCountdown2:
	text "2…"
	done
	
RanchRideRaceCountdown1:
	text "1…"
	done
	
RanchRideRaceCountdownGo:
	text "GO!"
	done
	
RanchRideGotDoduoText:
	text "<PLAYER> received"
	line "a special DODUO!"
	done
	
RanchRidePartyFullText:
	text "Oh!"
	
	para "You already have"
	line "6 #MON on"
	cont "you…"
	
	para "You need to make"
	line "some room!"
	done
	
RanchRideRaceLogsText:
	text "Some logs are"
	line "stacked neatly."
	done
	
RanchRideRaceBerryText:
	text "BERRY"
	done
	
RanchRideDodrioText:
	text "DODRIO: DRRREEEO!"
	done
	
RanchRideDoduoText:
	text "DODUO: DEWO! DEWO!"
	done
	
RanchRideReturnGirlText1:
	text "Done ridin'"
	line "already?"
	done
	
RanchRideReturnGirlText2:
	text "Alright!"
	
	para "Let's head back"
	line "inside, then."
	done
	
RanchRideReturnGirlText3:
	text "Ok!"
	
	para "Just let me know"
	line "when you're ready."
	done
	
RanchRideReturnGirlText4:
	text "That there DODRIO"
	line "is the finest on"
	cont "the ranch."
	
	para "And she's just a"
	line "darlin', too."
	
	para "Press the A BUTTON"
	line "to jump down"
	cont "ledges or over"
	cont "hurdles."
	
	para "When you're done"
	line "ridin', just come"
	cont "talk to me."
	
	para "Have fun!"
	done
	
RanchRideScarecrowText:
	text "It's a SCARE-"
	line "MURKROW!"
	
	para "It's so life-like!"
	done
	
ReceivedFlyText1:
	text "<PLAYER> found"
	line "HM02 FLY!"
	done
	
ReceivedFlyText2:
	text "<PLAYER> put HM02"
	line "in the TM POCKET."
	done
	
Movement_RanchRideMovement1:
	step_right
	step_right
	step_up
	step_end
	
Movement_RanchRideMovement2:
	step_right
	step_end
	
Movement_RanchRideMovement3:
	step_right
	step_right
	step_down
	step_end
	
Movement_RanchRideMovement4:
	step_down
	step_right
	step_right
	step_right
	step_up
	step_end
