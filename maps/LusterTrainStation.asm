LusterTrainStation_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterTrainStationTrigger0
	scene_script LusterTrainStationTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterTrainStationCallback

	db 3 ; warp events
	warp_event 20, 15, LUSTER_CITY_SHOPPING, 1
	warp_event 21, 15, LUSTER_CITY_SHOPPING, 2
	warp_event  5,  2, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	person_event SPRITE_OFFICER,  4, 26, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterTrainStationConductor, EVENT_MET_MR_NETT
	person_event SPRITE_REPORTER, 11, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterTrainStationReporter, EVENT_MET_MR_NETT
	person_event SPRITE_CAMERAMAN, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterTrainStationCameraman, EVENT_MET_MR_NETT
	person_event SPRITE_PSYCHIC, 12, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_CUTE_GIRL, 11, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_SUPER_NERD, 14, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_ROCKER, 13, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_FAT_GUY, 10, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_OFFICER,  7, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterTrainStationConductor, -1

	
	const_def 1 ; object constants
	const LUSTER_TRAIN_STATION_CONDUCTOR
	const LUSTER_TRAIN_STATION_REPORTER
	const LUSTER_TRAIN_STATION_CAMERAMAN
	const LUSTER_TRAIN_STATION_NETT
	const LUSTER_TRAIN_STATION_CROWD1
	const LUSTER_TRAIN_STATION_CROWD2
	const LUSTER_TRAIN_STATION_CROWD3
	const LUSTER_TRAIN_STATION_CROWD4
	const LUSTER_TRAIN_STATION_OFFICER
	
LusterTrainStationTrigger0:
	end
	
LusterTrainStationTrigger1:
	end

LusterTrainStationCallback:
	checkevent EVENT_MET_MR_NETT
	iffalse .skip
	changeblock $16, $8, $59
	changeblock $16, $a, $5a
	changeblock $14, $a, $56
	changeblock $14, $c, $56
	changeblock $16, $c, $56
.skip
	checkmapscene LUSTER_TRAIN_STATION, $1
	iffalse .end
	special Special_StopLandmarkTimer
	earthquake 5
	playmusic MUSIC_NONE
	callasm LusterTrainThing
	applymovement PLAYER, Movement_LusterTrainArrives2
	pause 5
	earthquake 5
	pause 35
	opentext
	writetext LusterTrainStationText1
	waitbutton
	callasm LusterTrainThing2
	closetext
	pause 10
	applymovement PLAYER, Movement_LusterTrainArrives3
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer1
	spriteface LUSTER_TRAIN_STATION_OFFICER, UP
	pause 15
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, show_person
	applyonemovement PLAYER, step_down
	pause 10
	checkevent EVENT_MET_MR_NETT
	iftrue .met_nett
	applymovement PLAYER, Movement_LusterTrainArrives4
	opentext
	writetext LusterTrainStationConductorText1
	waitbutton
	closetext
	applymovement LUSTER_TRAIN_STATION_CONDUCTOR, Movement_LusterStationConductor
	pause 10
	applymovement PLAYER, Movement_LusterTrainArrives5
	spriteface PLAYER, RIGHT
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer2
	pause 30
	applyonemovement LUSTER_TRAIN_STATION_REPORTER, turn_step_left
	opentext
	writetext LusterTrainStationReporterText1
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_REPORTER, UP
	opentext
	writetext LusterTrainStationReporterText2
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_CONDUCTOR, DOWN
	opentext
	writetext LusterTrainStationConductorText2
	waitbutton
	closetext
	applyonemovement LUSTER_TRAIN_STATION_CAMERAMAN, run_step_up
	spriteface LUSTER_TRAIN_STATION_CAMERAMAN, RIGHT
	spriteface LUSTER_TRAIN_STATION_CONDUCTOR, LEFT
	opentext
	writetext LusterTrainStationConductorText3
	waitbutton
	closetext
	applyonemovement LUSTER_TRAIN_STATION_CAMERAMAN, run_step_down
	spriteface LUSTER_TRAIN_STATION_CAMERAMAN, RIGHT
	spriteface LUSTER_TRAIN_STATION_REPORTER, LEFT
	applyonemovement LUSTER_TRAIN_STATION_REPORTER, turn_step_left
	opentext
	writetext LusterTrainStationReporterText3
	waitbutton
	closetext
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	special Special_FadeOutMusic
	disappear LUSTER_TRAIN_STATION_CONDUCTOR
	disappear LUSTER_TRAIN_STATION_REPORTER
	disappear LUSTER_TRAIN_STATION_CAMERAMAN
	disappear LUSTER_TRAIN_STATION_CROWD1
	disappear LUSTER_TRAIN_STATION_CROWD2
	disappear LUSTER_TRAIN_STATION_CROWD3
	disappear LUSTER_TRAIN_STATION_CROWD4
	changeblock $16, $8, $59
	changeblock $16, $a, $5a
	changeblock $14, $a, $56
	changeblock $14, $c, $56
	changeblock $16, $c, $56
	callasm GenericFinishBridge
	waitsfx
	special FadeInTextboxPalettes
	pause 20
	playmusic MUSIC_MOM
	applyonemovement LUSTER_TRAIN_STATION_NETT, step_left
	spriteface LUSTER_TRAIN_STATION_NETT, UP
	spriteface PLAYER, DOWN
	opentext
	writetext LusterStationNettText1
	waitbutton
	closetext
	applyonemovement LUSTER_TRAIN_STATION_NETT, step_down
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTER_TRAIN_STATION_NETT, 15
	pause 25
	applyonemovement LUSTER_TRAIN_STATION_NETT, step_up
	opentext
	writetext LusterStationNettText2
	waitbutton
	closetext
	applymovement LUSTER_TRAIN_STATION_NETT, Movement_LusterStationNett
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_TRAIN_STATION_NETT
	waitsfx
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_NONE
	callasm LusterStationMusicAsm
	setevent EVENT_MET_MR_NETT
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	dotrigger $0
	jump .end
.met_nett
	applymovement PLAYER, Movement_LusterTrainArrives6
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer2
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	callasm LusterStationMusicAsm
	dotrigger $0
.end
	return
	
LusterStationMusicAsm:
	xor a
	ld [wMapMusic], a
	ret

LusterTrainStationConductor:
	faceplayer
	opentext
	writetext LusterTrainStationClerkText1
	yesorno
	iffalse .end
	closetext
	domaptrigger TRAIN_CABIN_1, $0
	clearevent EVENT_TRAIN_GOING_EAST
	setevent EVENT_TRAIN_GOING_WEST
	
	follow LUSTER_TRAIN_STATION_OFFICER, PLAYER
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer1
	stopfollow
	spriteface LUSTER_TRAIN_STATION_OFFICER, LEFT
	applymovement PLAYER, Movement_LusterStationBoardTrain
	playsound SFX_ENTER_DOOR
	applyonemovement PLAYER, hide_person
	waitsfx
	opentext
	writetext LusterStationAllAboardText
	waitbutton
	closetext
	pause 20
	special Special_FadeOutMusic
	pause 20	
	applymovement PLAYER, Movement_LusterStationTrainCamera
	pause 30
	playmusic MUSIC_TRAIN_STARTUP
	pause 20
	
	callasm FlickerStationTrainThing
	pause 20
	earthquake 5
	pause 5
	applymovement PLAYER, Movement_LusterStationTrainLeaves
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	callasm FlickerStationPlayerSeatAsm
	warpfacing LEFT, TRAIN_CABIN_1, $7, $2
	end
.end
	writetext LusterTrainStationClerkText2
	waitbutton
	closetext
	end
	
LusterTrainStationReporter:
	end
	
LusterTrainStationCameraman:
	end
	
LusterTrainStationClerkText1:
	text "Take the train to"
	line "FLICKER STATION?"
	done
	
LusterTrainStationClerkText2:
	text "Have a nice day."
	done
	
LusterStationAllAboardText:
	text "All aboard!"
	
	para "Train heading to"
	line "FLICKER STATION is"
	cont "now departing!"
	done
	
	
LusterTrainStationText1:
	text "We've arrived at"
	line "LUSTER CITY!"
	
	para "Please watch your"
	line "step as you exit"
	cont "the train."
	done
	
LusterTrainStationReporterText1:
	text "This is JACKIE"
	line "VALENTINE with"
	cont "LUSTER NEWS!"
	
	para "I'm here with the"
	line "conductor of the"
	cont "hijacked train!"
	done
	
LusterTrainStationReporterText2:
	text "Sir!"
	
	para "Can you tell us"
	line "what happened?"
	done
	
LusterTrainStationReporterText3:
	text "Well, there you"
	line "have it, folks!"
	
	para "A crisis averted,"
	line "all thanks to this"
	cont "brave hero!"
	
	para "For LUSTER NEWS,"
	line "this is JACKIE"
	cont "VALENTINE."
	
	para "Signing off!"
	done
	
LusterTrainStationConductorText1:
	text "Outta the way!"
	done
	
LusterTrainStationConductorText2:
	text "Of course I can,"
	line "JACKIE!"
	done
	
LusterTrainStationConductorText3:
	text "So there I was,"
	line "nobly piloting a"
	cont "speeding train,"
	
	para "passengers' lives"
	line "in my hands, when"
	cont "all of a sudden,"
	
	para "BOOOOM!"
	
	para "The door behind"
	line "me flew wide open!"
	
	para "In poured a group"
	line "of brutal thugs!"
	
	para "They caught me off"
	line "guard, tied me up,"
	cont "and took control"
	cont "of the train!"
	
	para "What they wanted"
	line "with it, I don't"
	cont "know."
	
	para "It mattered not!"
	
	para "As I lie on the"
	line "ground, I knew I"
	cont "couldn't let this"
	cont "stand!"
	
	para "I threw off my"
	line "binds, stood to my"
	cont "feet, and said,"
	
	para "“STOP, EVIL-DOERS!"
	
	para "IF YOU WANT THIS"
	line "TRAIN,"
	
	para "YOU'LL HAVE TO GO"
	line "THROUGH ME!”"
	
	para "Well, needless to"
	line "say, that did it!"
	
	para "Those crooks"
	line "turned tail and"
	cont "ran right outta"
	cont "there!"
	
	para "I can't say I blame"
	line "them."
	
	para "I mean, look at"
	line "me!"
	
	para "AHAHAHA!"
	done
	
LusterStationNettText1:
	text "Pretty wild, huh?"
	
	para "…"
	
	para "But that's not"
	line "what happened,"
	cont "is it?"
	
	para "You can tell a lot"
	line "about someone just"
	cont "from looking at"
	cont "them."
	
	para "That conductor"
	line "couldn't beat a"
	cont "MAGIKARP to save"
	cont "his life."
	
	para "…"
	
	para "You stopped those"
	line "thugs, didn't you?"
	
	para "I know you did."
	
	para "…"
	
	para "You should stop by"
	line "the NETT BUILDING."
	
	para "I'd love to show"
	line "my graditude for"
	cont "the hero of LUSTER"
	cont "CITY!"
	
	para "…"
	
	para "Well, I should be"
	line "going now."
	done
	
LusterStationNettText2:
	text "Oh!"
	
	para "I forgot to"
	line "introduce myself."
	
	para "I'm MR. NETT,"
	
	para "PRESIDENT and CEO"
	line "of NETT CORP."
	
	para "Remember to stop"
	line "by and tell them I"
	cont "sent you."
	done
	
Movement_LusterTrainArrives2:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end
	
Movement_LusterTrainArrives3:
	slow_step_left
	slow_step_down
	step_end
	
Movement_LusterTrainArrives4:
	step_right
	step_right
	step_end
	
Movement_LusterTrainArrives5:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_down
	step_down
	step_right
	step_end
	
Movement_LusterTrainArrives6:
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_end
	
Movement_LusterStationConductor:
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	big_step_right
	big_step_right
	big_step_right
	turn_step_left
	step_end
	
Movement_LusterStationNett:
	step_down
	step_down
	step_down
	step_end
	
Movement_LusterStationOfficer1:
	step_up
	step_up
	step_right
	step_end
	
Movement_LusterStationOfficer2:
	step_left
	step_down
	step_down
	step_end
	
Movement_LusterStationBoardTrain:
	step_up
	step_left
	step_left
	step_left
	step_up
	step_end
	
Movement_LusterStationTrainLeaves:
	slow_step_left
	slow_step_left
	step_left
	step_left
	step_left
	step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	fast_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

Movement_LusterStationTrainCamera:
	slow_step_up
	slow_step_right
	step_end
	