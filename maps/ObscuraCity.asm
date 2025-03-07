ObscuraCity_MapScriptHeader:
	db 2 ; scene scripts
	scene_script ObscuraCityTrigger0
	scene_script ObscuraCityTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, ObscuraCityFlyPoint
	callback MAPCALLBACK_TILES, ObscuraCityCallback

	db 4 ; warp events
	warp_def 13, 22, 1, OBSCURA_MUSEUM_1F
	warp_def 13, 23, 2, OBSCURA_MUSEUM_1F
	warp_def  9, 29, 1, OBSCURA_MUSEUM_EMPLOYEE_ROOM
	warp_def 10, 29, 2, OBSCURA_MUSEUM_EMPLOYEE_ROOM

	db 0 ; coord events

	db 2 ; bg events
	signpost 14, 24, SIGNPOST_JUMPTEXT, ObscuraCityMuseumSign
	signpost  9, 32, SIGNPOST_JUMPTEXT, ObscuraCityMuseumBackSign

	db 4 ; object events
	person_event SPRITE_SNARE, 14, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCitySnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE_GIRL, 14, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCitySnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_ROCKY, 14, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_OBSCURA_CITY_ROCKY_GONE
	person_event SPRITE_DARCY, 19, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	
	
	const_def 1 ; object constants
	const OBSCURA_CITY_SNARE_1
	const OBSCURA_CITY_SNARE_2
	const OBSCURA_CITY_ROCKY
	const OBSCURA_CITY_DARCY
	
ObscuraCityTrigger0:
	end
	
ObscuraCityTrigger1:
	opentext
	writetext ObscuraCityRockyText1
	waitbutton
	closetext
	special Special_FadeOutMusic
	pause 10
	opentext
	writetext ObscuraCityDarcyText1
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	pause 48
	closetext
	appear OBSCURA_CITY_DARCY
	applymovement OBSCURA_CITY_DARCY, Movement_ObscuraCityDarcy1
	pause 10
	opentext
	writetext ObscuraCityRockyText2
	waitbutton
	closetext
	pause 2
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext
	writetext ObscuraCityRockyText3
	waitbutton
	closetext
	applyonemovement OBSCURA_CITY_DARCY, fix_facing
	applymovement OBSCURA_CITY_DARCY, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	opentext
	writetext ObscuraCityDarcyText2
	waitbutton
	closetext
	applymovement OBSCURA_CITY_DARCY, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	applymovement OBSCURA_CITY_DARCY, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	applymovement OBSCURA_CITY_DARCY, Movement_ObscuraCityDarcy2
	playsound SFX_TACKLE
	applyonemovement OBSCURA_CITY_DARCY, remove_fixed_facing
	opentext
	writetext ObscuraCityDarcyText3
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext
	writetext ObscuraCityRockyText4
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_DARCY, turn_step_up
	applyonemovement OBSCURA_CITY_DARCY, remove_fixed_facing
	opentext
	writetext ObscuraCityDarcyText4
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext
	writetext ObscuraCityRockyText5
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_DARCY, turn_step_up
	applyonemovement OBSCURA_CITY_DARCY, remove_fixed_facing
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext ObscuraCityDarcyText5
	jump .cont
.girl
	writetext ObscuraCityDarcyText5_girl
.cont
	waitbutton
	closetext
	pause 5
	applymovement OBSCURA_CITY_DARCY, Movement_ObscuraCityDarcy3
	disappear OBSCURA_CITY_DARCY
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_down
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext
	writetext ObscuraCityRockyText6
	waitbutton
	closetext
	special Special_FadeOutMusic
	pause 15
	playmapmusic
	applyonemovement OBSCURA_CITY_ROCKY, turn_step_right
	applyonemovement OBSCURA_CITY_ROCKY, remove_fixed_facing
	opentext
	writetext ObscuraCityRockyText7
	waitbutton
	closetext
	pause 5
	applyonemovement OBSCURA_CITY_ROCKY, step_up
	playsound SFX_ENTER_DOOR
	disappear OBSCURA_CITY_ROCKY
	dotrigger $0
	end
	
Movement_ObscuraCityDarcy1:
	run_step_up
	run_step_up
	run_step_up
	run_step_up
	step_end
	
Movement_ObscuraCityDarcy2:
	run_step_down
	big_step_up
	step_end
	
Movement_ObscuraCityDarcy3:
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end
	
ObscuraCityRockyText1:
	text "ROCKY: What did"
	line "that kid say?"
	
	para "Summoning the"
	line "dragon?"
	
	para "He can't be"
	line "serious."
	
	para "That's just an old"
	line "folktale."
	
	para "Only a crazy"
	line "person like my"
	cont "sister would take"
	cont "it seriously."
	
	para "She's going to be"
	line "very upset it was"
	cont "stolen."
	
	para "You know the kid"
	line "that took it,"
	cont "right?"
	
	para "Maybe there's a"
	line "chance we can get"
	cont "it back before-"
	done
	
ObscuraCityRockyText2:
	text "…<WAIT_L>she finds out…"
	done
	
ObscuraCityRockyText3:
	text "Hello, DARCY."
	done
	
ObscuraCityRockyText4:
	text "First of all, it's"
	line "not ROCKY, it's"
	cont "ROCKFORD!"
	
	para "Got it!?"
	
	para "And second, how"
	line "was I supposed to"
	cont "know some wackos"
	cont "who believe in"
	cont "fairytales would"
	cont "come take it?"
	done
	
ObscuraCityRockyText5:
	text "Relax, DARCY."
	
	para "We know where the"
	line "one who took it"
	cont "is heading."
	
	para "He thinks he can"
	line "use it to awaken"
	cont "the dragon."
	
	para "<PLAYER> here"
	line "will get it back."
	done
	
ObscuraCityRockyText6:
	text "Wait, DARCY!"
	done
	
ObscuraCityRockyText7:
	text "She's really upset"
	line "this time."
	
	para "What a headache"
	line "today has been."
	
	para "Well, anyway,"
	line "a deal's a deal."
	
	para "You helped me out"
	line "with those"
	cont "TEAM SNARE goons,"
	cont "so I'll give you"
	cont "your GYM BATTLE."
	
	para "Come on inside"
	line "and let's get"
	cont "to it."
	done
	
ObscuraCityDarcyText1:
	text "???: ROOOCKYYY!!!"
	done
	
ObscuraCityDarcyText2:
	text "DARCY: Don't you"
	line "“hello, DARCY” me!"
	done
	
ObscuraCityDarcyText3:
	text "I told you this"
	line "would happen if"
	cont "I let you display"
	cont "the DRAGON STONE"
	cont "here!"
	
	para "You assured me"
	line "nothing would"
	cont "happen to it!"
	
	para "Oh, I knew I"
	line "shouldn't have"
	cont "believed you…"
	
	para "I'll never forgive"
	line "you for this,"
	cont "ROCKY!"
	done
	
ObscuraCityDarcyText4:
	text "They aren't"
	line "fairytales, ROCKY!"
	
	para "There's obviously"
	line "truth to the myth"
	cont "if a group like"
	cont "TEAM SNARE wanted"
	cont "the DRAGON STONE!"
	done
	
ObscuraCityDarcyText5:
	text "He'd better!"
	
	para "Legend or not,"
	line "you know as well"
	cont "as I do how impor-"
	cont "tant that stone is"
	cont "to our family!"
	
	para "To the people of"
	line "ERROR!!"		;TODO come up with town name
	
	para "You do remember"
	line "ERROR!!"		;TODO come up with town name
	cont "don't you ROCKY?"
	
	para "You were only born"
	line "and raised there."
	
	para "You may not care"
	line "anymore, but I do,"
	cont "“ROCKFORD”!"
	done
	
ObscuraCityDarcyText5_girl:
	text "She'd better!"
	
	para "Legend or not,"
	line "you know as well"
	cont "as I do how impor-"
	cont "tant that stone is"
	cont "to our family!"
	
	para "To the people of"
	line "ERROR!!"
	
	para "You do remember"
	line "ERROR!!,"
	cont "don't you ROCKY?"
	
	para "You were only born"
	line "and raised there."
	
	para "You may not care"
	line "anymore, but I do,"
	cont "“ROCKFORD”!"
	done
	
	
ObscuraCityFlyPoint:
	setflag ENGINE_FLYPOINT_OBSCURA
	return
	
ObscuraCityCallback:
	callasm MusuemKeyboardAsm3
	clearevent EVENT_MUSEUM_FAILED_TERMINAL
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .skip
	domaptrigger OBSCURA_MUSEUM_1F, $0
.skip
	return
	
ObscuraCityMuseumSign:
	text "OBSCURA CITY"
	line "MUSEUM OF SCIENCE"
	cont "& #MON GYM"
	done
	
ObscuraCityMuseumBackSign:
	text "EMPLOYEE ENTRANCE"
	done
	
ObscuraCitySnare1:
	faceplayer
	opentext
	writetext ObscuraCitySnare1Text
	waitbutton
	closetext
	spriteface OBSCURA_CITY_SNARE_1, DOWN
	end
	
ObscuraCitySnare2:
	faceplayer
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext ObscuraCitySnare2TextBoy
	jump .cont
.girl
	writetext ObscuraCitySnare2TextGirl
.cont
	waitbutton
	closetext
	spriteface OBSCURA_CITY_SNARE_2, DOWN
	end

ObscuraCitySnare1Text:
	text "The MUSEUM is"
	line "closed today."
	
	para "Run along."
	done
	
ObscuraCitySnare2TextBoy:
	text "We were told not"
	line "to let a kid named"
	cont "<PLAYER> in."
	
	para "You are him."
	done
	
ObscuraCitySnare2TextGirl:
	text "We were told not"
	line "to let a kid named"
	cont "<PLAYER> in."
	
	para "You are her."
	done
