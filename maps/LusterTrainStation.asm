LusterTrainStation_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterTrainStationTrigger0
	scene_script LusterTrainStationTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterTrainStationCallback

	db 3 ; warp events
	warp_event  6, 15, LUSTER_CITY_SHOPPING, 1
	warp_event  7, 15, LUSTER_CITY_SHOPPING, 2
	warp_event 19,  2, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	person_event SPRITE_OFFICER,  9, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterTrainStationConductor, EVENT_MET_MR_NETT
	person_event SPRITE_REPORTER, 11, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterTrainStationReporter, EVENT_MET_MR_NETT
	person_event SPRITE_CAMERAMAN, 11,  9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterTrainStationCameraman, EVENT_MET_MR_NETT
	person_event SPRITE_PSYCHIC, 12,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_CUTE_GIRL, 11,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_SUPER_NERD, 14, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_ROCKER, 13, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_FAT_GUY, 10,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MET_MR_NETT
	person_event SPRITE_OFFICER,  7,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterTrainStationConductor, -1
	person_event SPRITE_FAT_GUY, 10,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterTrainStationNPC1, EVENT_HAVENT_BEEN_TO_LUSTER_CITY
	person_event SPRITE_POKEFAN_F, 12,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterTrainStationNPC2, EVENT_HAVENT_BEEN_TO_LUSTER_CITY
	person_event SPRITE_CUTE_GIRL, 13,  9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterTrainStationNPC3, EVENT_HAVENT_BEEN_TO_LUSTER_CITY
	person_event SPRITE_SUPER_NERD, 10,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterTrainStationNPC4, EVENT_HAVENT_BEEN_TO_LUSTER_CITY

	
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
	const LUSTER_TRAIN_STATION_NPC_1
	const LUSTER_TRAIN_STATION_NPC_2
	const LUSTER_TRAIN_STATION_NPC_3
	const LUSTER_TRAIN_STATION_NPC_4
	
LusterTrainStationTrigger0:
	end
	
LusterTrainStationTrigger1:
	priorityjump LusterTrainStationArrive
	end

LusterTrainStationCallback:
	checkevent EVENT_MET_MR_NETT
	iffalse .end
	changeblock $8, $8, $59
	changeblock $8, $a, $5a
	changeblock $6, $a, $56
	changeblock $6, $c, $56
	changeblock $8, $c, $56
.end
	return

LusterTrainStationArrive:
	special Special_StopLandmarkTimer
	applyonemovement PLAYER, remove_fixed_facing
	playmusic MUSIC_TRAIN_STOP
;	refreshscreen
	disappear LUSTER_TRAIN_STATION_OFFICER
	disappear LUSTER_TRAIN_STATION_CONDUCTOR
	clearevent EVENT_MET_MR_NETT
	callasm LusterTrainThing
	applymovement PLAYER, Movement_LusterTrainArrives2
	pause 5
	playsound SFX_FAINT
	earthquake 5
	pause 35
	special Special_EnableInput
	opentext TEXTBOX_PA
	writetext LusterTrainStationText1
	waitbutton
	callasm LusterTrainThing2
	closetext
	moveperson LUSTER_TRAIN_STATION_OFFICER, 8, 8
	moveperson LUSTER_TRAIN_STATION_CONDUCTOR, 4, 3
	appear LUSTER_TRAIN_STATION_OFFICER
	pause 10
	applymovement PLAYER, Movement_LusterTrainArrives3
;	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer1
;	spriteface LUSTER_TRAIN_STATION_OFFICER, UP
	pause 15
	playsound SFX_EXIT_BUILDING
	special Special_ForcePlayerStateNormal
	applyonemovement PLAYER, step_down
	pause 10
	checkevent EVENT_MET_MR_NETT
	iftrue .met_nett
	applymovement PLAYER, Movement_LusterTrainArrives4
	opentext TEXTBOX_CONDUCTOR
	writetext LusterTrainStationConductorText1
	waitbutton
	closetext
	appear LUSTER_TRAIN_STATION_CONDUCTOR
	playsound SFX_EXIT_BUILDING
	applymovement LUSTER_TRAIN_STATION_CONDUCTOR, Movement_LusterStationConductor
	pause 10
	applymovement PLAYER, Movement_LusterTrainArrives5
	spriteface PLAYER, RIGHT
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer2
	pause 1
	applyonemovement LUSTER_TRAIN_STATION_OFFICER, remove_fixed_facing
	pause 35
	applyonemovement LUSTER_TRAIN_STATION_REPORTER, turn_step_left
	opentext TEXTBOX_REPORTER
	writetext LusterTrainStationReporterText1
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_REPORTER, UP
	opentext TEXTBOX_REPORTER
	writetext LusterTrainStationReporterText2
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_CONDUCTOR, DOWN
	opentext TEXTBOX_CONDUCTOR
	writetext LusterTrainStationConductorText2
	waitbutton
	closetext
	applyonemovement LUSTER_TRAIN_STATION_CAMERAMAN, run_step_up
	spriteface LUSTER_TRAIN_STATION_CAMERAMAN, RIGHT
	spriteface LUSTER_TRAIN_STATION_CONDUCTOR, LEFT
	opentext TEXTBOX_CONDUCTOR
	writetext LusterTrainStationConductorText3
	waitbutton
	closetext
	applyonemovement LUSTER_TRAIN_STATION_CAMERAMAN, run_step_down
	spriteface LUSTER_TRAIN_STATION_CAMERAMAN, RIGHT
	spriteface LUSTER_TRAIN_STATION_REPORTER, LEFT
	applyonemovement LUSTER_TRAIN_STATION_REPORTER, turn_step_left
	opentext TEXTBOX_REPORTER
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
	appear LUSTER_TRAIN_STATION_NPC_1
	appear LUSTER_TRAIN_STATION_NPC_2
	appear LUSTER_TRAIN_STATION_NPC_3
	appear LUSTER_TRAIN_STATION_NPC_4
	applyonemovement LUSTER_TRAIN_STATION_NETT, remove_fixed_facing
	changeblock $8, $8, $59
	changeblock $8, $a, $5a
	changeblock $6, $a, $56
	changeblock $6, $c, $56
	changeblock $8, $c, $56
	callasm GenericFinishBridge
	waitsfx
	special FadeInTextboxPalettes
	pause 20
	playmusic MUSIC_MOM		;Mr Nett's theme song
	applyonemovement LUSTER_TRAIN_STATION_NETT, step_left
	spriteface LUSTER_TRAIN_STATION_NETT, UP
	spriteface PLAYER, DOWN
	opentext TEXTBOX_UNKNOWN
	writetext LusterStationNettText1
	waitbutton
	closetext
	applyonemovement LUSTER_TRAIN_STATION_NETT, step_down
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTER_TRAIN_STATION_NETT, 15
	pause 25
	applyonemovement LUSTER_TRAIN_STATION_NETT, step_up
	opentext TEXTBOX_UNKNOWN
	writetext LusterStationNettText2
	buttonsound
	changetextboxspeaker TEXTBOX_NETT
	farwritetext StdBlankText
	pause 6
	writetext LusterStationNettText3
	waitbutton
	closetext
	applymovement LUSTER_TRAIN_STATION_NETT, Movement_LusterStationNett
	playsound SFX_EXIT_BUILDING
	disappear LUSTER_TRAIN_STATION_NETT
	waitsfx
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	setevent EVENT_MET_MR_NETT
	clearevent EVENT_HAVENT_BEEN_TO_LUSTER_CITY
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	blackoutmod LUSTER_CITY_RESIDENTIAL
	dotrigger $0
	end
.met_nett
	applymovement PLAYER, Movement_LusterTrainArrives6
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer2
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	playmapmusic
	dotrigger $0
	end

LusterTrainStationConductor:
	faceplayer
	opentext
	checkitem TRAIN_PASS
	iffalse .no_ticket
	writetext LusterTrainStationClerkText1
	yesorno
	iffalse .end
	closetext
	domaptrigger TRAIN_CABIN_1, $0
	setevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	
	follow LUSTER_TRAIN_STATION_OFFICER, PLAYER
	applymovement LUSTER_TRAIN_STATION_OFFICER, Movement_LusterStationOfficer1
	stopfollow
	spriteface LUSTER_TRAIN_STATION_OFFICER, LEFT
	applymovement PLAYER, Movement_LusterStationBoardTrain
	playsound SFX_ENTER_DOOR
	applyonemovement PLAYER, hide_person
	waitsfx
	opentext TEXTBOX_PA
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
.no_ticket
	writetext LusterTrainStationClerkText3
	waitbutton
	closetext
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
	
LusterTrainStationClerkText3:
	text "You can't ride the"
	line "train without a"
	cont "ticket."
	
	para "Your last ticket"
	line "was only good for"
	cont "one trip."
	
	para "Have a nice day."
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
	text "This is ONWA NEWS,"
	line "on the scene!"
	
	para "A train hijacked"
	line "by the notorious"
	cont "TEAM SNARE has"
	cont "arrived safely at"
	cont "the station."
	
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
	text "Well, <WAIT_S>there you"
	line "have it, folks!"
	
	para "A crisis averted,"
	line "all thanks to this"
	cont "brave hero!"
	
	para "This has been"
	line "ONWA NEWS, on"
	cont "the scene!"
	
	para "Signing off!"
	done
	
LusterTrainStationConductorText1:
	text "Outta the way!"
	done
	
LusterTrainStationConductorText2:
	text "Of course I can!"
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
	
	para "Well, <WAIT_S>needless to"
	line "say, that did it!"
	
	para "Those crooks"
	line "turned tail and"
	cont "ran right outta"
	cont "there!"
	
	para "I can't say I blame"
	line "them."
	
	para "I mean, <WAIT_S>look at"
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
	
	para "You stopped TEAM"
	line "SNARE, didn't you?"
	
	para "I know you did."
	
	para "…"
	
	para "You should stop by"
	line "the NETT BUILDING."
	
	para "I'd love to show"
	line "my graditude for"
	cont "the hero of LUSTER"
	cont "CITY!"
	
	para "…"
	
	para "Well, <WAIT_S>I should be"
	line "going now."
	done
	
LusterStationNettText2:
	text "Oh!"
	
	para "I forgot to"
	line "introduce myself."
	
	para "I'm MR. NETT,"
	
	para "PRESIDENT and CEO"
	line "of NETT CORP."
	done
	
LusterStationNettText3:
	text "Remember to stop"
	line "by and tell them I"
	cont "sent you."
	done
	
Movement_LusterTrainArrives2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	slow_step_left
	slow_step_left
	slow_step_left
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
	run_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
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
	step_up
	turn_step_down
	step_end
	
Movement_LusterStationBoardTrain:
	step_up
	step_left
	step_left
	step_left
	step_up
	step_end
	
Movement_LusterStationTrainLeaves:
	slow_step_right
	slow_step_right
	step_right
	step_right
	step_right
	step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	fast_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

Movement_LusterStationTrainCamera:
	slow_step_up
	slow_step_right
	step_end
	
LusterTrainStationNPC1:
	faceplayer
	opentext
	writetext LusterTrainStationNPC1Text
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_NPC_1, DOWN
	end
	
LusterTrainStationNPC2:
	faceplayer
	opentext
	writetext LusterTrainStationNPC2Text
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_NPC_2, DOWN
	end
	
LusterTrainStationNPC3:
	jumptextfaceplayer LusterTrainStationNPC3Text
	
LusterTrainStationNPC4:
	faceplayer
	opentext
	writetext LusterTrainStationNPC4Text
	waitbutton
	closetext
	spriteface LUSTER_TRAIN_STATION_NPC_4, DOWN
	end
	
LusterTrainStationNPC1Text:
	text "Taking the train"
	line "is nice, but I"
	cont "wish I could FLY"
	cont "around on my"
	cont "#MON!"
	
	para "I've heard there's a"
	line "ranch to the EAST"
	cont "that can make that"
	cont "happen."
	done
	
LusterTrainStationNPC2Text:
	text "I wonder if it's"
	line "really safe to"
	cont "take the train…"
	done
	
LusterTrainStationNPC3Text:
	text "Can I help you?<WAIT_S>"
	line "You're staring."
	
	para "In LUSTER CITY,"
	line "you'll be better"
	cont "off keeping your"
	cont "eyes to yourself."
	done
	
LusterTrainStationNPC4Text:
	text "If you're planning"
	line "on frequently tra-"
	cont "velling by train,"
	
	para "you'd better get"
	line "a TRAIN PASS."
	
	para "I don't think I"
	line "could afford to"
	cont "travel if I had to"
	cont "buy a ticket each"
	cont "time!"
	done
	