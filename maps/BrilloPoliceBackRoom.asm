BrilloPoliceBackRoom_MapScriptHeader:
	db 1 ; scene scripts
	scene_script BrilloPoliceBackRoomTrigger0

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRILLO_POLICE_STATION, 3
	warp_event  3,  7,  BRILLO_POLICE_STATION, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  4, SPRITE_SPA_WORKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -6, -6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -6, -6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -6, -6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event -6, -6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	

	const_def 1 ; object constants
	const BRILLO_POLICE_BACKROOM_CAPTAIN
	const BRILLO_POLICE_BACKROOM_COP_1
	const BRILLO_POLICE_BACKROOM_COP_2
	const BRILLO_POLICE_BACKROOM_COP_3
	const BRILLO_POLICE_BACKROOM_COP_4
	
BrilloPoliceBackRoomTrigger0:
	applyonemovement PLAYER, remove_fixed_facing
	applymovement PLAYER, Movement_BrilloPoliceBackRoom_Player
	opentext
	writetext BrilloPoliceBackRoomCaptainText1
	waitbutton
	closetext
	pause 10
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	pause 30
	disappear BRILLO_POLICE_BACKROOM_COP_1
	disappear BRILLO_POLICE_BACKROOM_COP_2
	disappear BRILLO_POLICE_BACKROOM_COP_3
	disappear BRILLO_POLICE_BACKROOM_COP_4
	moveperson BRILLO_POLICE_BACKROOM_COP_1, 2, 7
	moveperson BRILLO_POLICE_BACKROOM_COP_2, 2, 7
	moveperson BRILLO_POLICE_BACKROOM_COP_3, 2, 7
	moveperson BRILLO_POLICE_BACKROOM_COP_4, 2, 7
	playsound SFX_ENTER_DOOR
	appear BRILLO_POLICE_BACKROOM_COP_1
	applymovement BRILLO_POLICE_BACKROOM_COP_1, Movement_BrilloPoliceBackRoom_Cop_1
	playsound SFX_ENTER_DOOR
	appear BRILLO_POLICE_BACKROOM_COP_2
	applymovement BRILLO_POLICE_BACKROOM_COP_2, Movement_BrilloPoliceBackRoom_Cop_2
	playsound SFX_ENTER_DOOR
	appear BRILLO_POLICE_BACKROOM_COP_3
	applymovement BRILLO_POLICE_BACKROOM_COP_3, Movement_BrilloPoliceBackRoom_Cop_3
	playsound SFX_ENTER_DOOR
	appear BRILLO_POLICE_BACKROOM_COP_4
	applymovement BRILLO_POLICE_BACKROOM_COP_4, Movement_BrilloPoliceBackRoom_Cop_4
	opentext
	writetext BrilloPoliceBackRoomCaptainText2
	waitbutton
	closetext
	applymovement BRILLO_POLICE_BACKROOM_CAPTAIN, Movement_BrilloPoliceBackRoom_Captain_1
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_POLICE_BACKROOM_CAPTAIN
	pause 5
	applymovement BRILLO_POLICE_BACKROOM_COP_1, Movement_BrilloPoliceBackRoom_Cop_1_2
	opentext
	writetext BrilloPoliceBackRoomCop1Text1
	waitbutton
	closetext

	waitsfx
	winlosstext BrilloPoliceBackRoomCop1WinText, 0
	setlasttalked BRILLO_POLICE_BACKROOM_COP_1
	loadtrainer OFFICER, JONES
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic

	opentext
	writetext BrilloPoliceBackRoomCop1Text2
	waitbutton
	closetext
	applymovement BRILLO_POLICE_BACKROOM_COP_1, Movement_BrilloPoliceBackRoom_Captain_1
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_POLICE_BACKROOM_COP_1
	pause 5
	applymovement BRILLO_POLICE_BACKROOM_COP_2, Movement_BrilloPoliceBackRoom_Cop_2_2
	opentext
	writetext BrilloPoliceBackRoomCop2Text1
	waitbutton
	closetext

	waitsfx
	winlosstext BrilloPoliceBackRoomCop2WinText, 0
	setlasttalked BRILLO_POLICE_BACKROOM_COP_2
	loadtrainer OFFICER, SMITH
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic

	opentext
	writetext BrilloPoliceBackRoomCop2Text2
	waitbutton
	closetext
	applymovement BRILLO_POLICE_BACKROOM_COP_2, Movement_BrilloPoliceBackRoom_Captain_1
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_POLICE_BACKROOM_COP_2
	pause 5
	applymovement BRILLO_POLICE_BACKROOM_COP_3, Movement_BrilloPoliceBackRoom_Cop_3_2
	opentext
	writetext BrilloPoliceBackRoomCop3Text1
	waitbutton
	closetext

	waitsfx
	winlosstext BrilloPoliceBackRoomCop3WinText, 0
	setlasttalked BRILLO_POLICE_BACKROOM_COP_3
	loadtrainer OFFICER, ROGERS
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic

	opentext
	writetext BrilloPoliceBackRoomCop3Text2
	waitbutton
	closetext
	applymovement BRILLO_POLICE_BACKROOM_COP_3, Movement_BrilloPoliceBackRoom_Captain_1
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_POLICE_BACKROOM_COP_3
	pause 5
	applymovement BRILLO_POLICE_BACKROOM_COP_4, Movement_BrilloPoliceBackRoom_Cop_4_2
	opentext
	writetext BrilloPoliceBackRoomCop4Text1
	waitbutton
	closetext

	waitsfx
	winlosstext BrilloPoliceBackRoomCop4WinText, 0
	setlasttalked BRILLO_POLICE_BACKROOM_COP_4
	loadtrainer OFFICER, HARRIS
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	special SaveMusic
	startbattle
	reloadmapafterbattle
	special RestoreMusic

	opentext
	writetext BrilloPoliceBackRoomCop4Text2
	waitbutton
	closetext
	applymovement BRILLO_POLICE_BACKROOM_COP_4, Movement_BrilloPoliceBackRoom_Captain_1
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_POLICE_BACKROOM_COP_4
	pause 20
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_NONE
	special SaveMusic
	pause 60
	spriteface BRILLO_POLICE_BACKROOM_CAPTAIN, UP
	moveperson BRILLO_POLICE_BACKROOM_CAPTAIN, 2, 7
	playsound SFX_ENTER_DOOR
	appear BRILLO_POLICE_BACKROOM_CAPTAIN
	applymovement BRILLO_POLICE_BACKROOM_CAPTAIN, Movement_BrilloPoliceBackRoom_Captain_2
	opentext
	writetext BrilloPoliceBackRoomCaptainText3
	buttonsound
	farwritetext StdBlankText
	pause 6
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext BrilloPoliceBackRoomCaptainText7
	waitbutton
	closetext

	waitsfx
	winlosstext BrilloPoliceBackRoomCaptainWinText, 0
	setlasttalked BRILLO_POLICE_BACKROOM_CAPTAIN
	loadtrainer POLICE_CAPTAIN, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic

	opentext
	writetext BrilloPoliceBackRoomCaptainText4
	waitbutton
	closetext
	pause 30
	applyonemovement BRILLO_POLICE_BACKROOM_CAPTAIN, turn_step_up
	applyonemovement BRILLO_POLICE_BACKROOM_CAPTAIN, remove_fixed_facing
	pause 10
	playsound SFX_TALLY
	pause 10
	opentext
	writetext BrilloPoliceBackRoomCaptainText5
	waitbutton
	closetext
	pause 10
	playsound SFX_TALLY
	pause 25
	applyonemovement BRILLO_POLICE_BACKROOM_CAPTAIN, turn_step_down
	applyonemovement BRILLO_POLICE_BACKROOM_CAPTAIN, remove_fixed_facing
	opentext
	writetext BrilloPoliceBackRoomCaptainText6
	waitbutton
	closetext
	pause 10
	setevent EVENT_ROUTE_17_COPS_GONE
	clearevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing DOWN, BRILLO_TOWN, 35, 13
	end
	
BrilloPoliceBackRoomCaptainText1:
	text "A kid like you"
	line "needs to learn to"
	cont "respect authority!"
	
	para "I can't throw you"
	line "in a cell, you're"
	cont "too young."
	
	para "Since that's the"
	line "case, I'll have to"
	cont "do the next best"
	cont "thing!"
	
	para "OH, BOOOOYS!"
	done
	
BrilloPoliceBackRoomCaptainText2:
	text "These fine"
	line "officers will take"
	cont "it from here."
	
	para "You're gonna learn"
	line "to cooperate with"
	cont "the police, one"
	cont "way or another."
	
	para "Ha! Ha! Ha!"
	done
	
BrilloPoliceBackRoomCaptainText3:
	text "Well, you ready"
	line "to cooperate?"
	
	para "…"
	done
	
BrilloPoliceBackRoomCaptainText7:
	text "WHAT!?!<WAIT_S>"
	line "YOU BEAT 'EM ALL!?"
	
	para "…"
	
	para "Then I have no"
	line "other choice."
	
	para "You have the right"
	line "to remain silent."
	
	para "Stop resisting"
	line "arrest!"
	done
	
BrilloPoliceBackRoomCaptainText4:
	text "What is happening"
	line "right now?"
	
	para "You've embarassed"
	line "our entire police"
	cont "force!"
	
	para "If this gets out,"
	line "we're done for."
	
	para "…"
	done
	
BrilloPoliceBackRoomCaptainText5:
	text "It's ARMSTRONG."
	
	para "Move the"
	line "roadblock."
	
	para "…"
	
	para "Yeah."
	
	para "…"
	
	para "I know what I said"
	line "before!"
	
	para "Listen to what I'm"
	line "sayin' now!"
	
	para "…"
	
	para "Yeah, ok."
	done
	
BrilloPoliceBackRoomCaptainText6:
	text "You win.<WAIT_S>"
	line "Roadblock's gone."
	
	para "Get outta here."
	
	para "Don't let me see"
	line "your face again."
	
	para "Disrespectful kids"
	line "like you won't ever"
	cont "learn anyway."
	done
	
BrilloPoliceBackRoomCaptainWinText:
	text "You little whelp!"
	done
	
BrilloPoliceBackRoomCop1Text1:
	text "I'm gonna beat some"
	line "sense into you,"
	cont "you troublemaker!"
	done
	
BrilloPoliceBackRoomCop1Text2:
	text "Grrr…"
	
	para "You annoying"
	line "troublemaker!"
	done
	
BrilloPoliceBackRoomCop1WinText:
	text "Beaten!"
	done
	
BrilloPoliceBackRoomCop2Text1:
	text "I'd better turn"
	line "my bodycam off"
	cont "for this."
	done
	
BrilloPoliceBackRoomCop2Text2:
	text "We can do whatever"
	line "we want!"
	
	para "We have immunity!"
	done
	
BrilloPoliceBackRoomCop2WinText:
	text "We'll get you!"
	done
	
BrilloPoliceBackRoomCop3Text1:
	text "I don't really"
	line "want to do this,"
	cont "but it's my job…"
	done
	
BrilloPoliceBackRoomCop3Text2:
	text "I'm not a bad"
	line "person!"
	
	para "I was just"
	line "following orders!"
	done
	
BrilloPoliceBackRoomCop3WinText:
	text "Yikes!"
	done
	
BrilloPoliceBackRoomCop4Text1:
	text "I guess it's up"
	line "to me!"
	
	para "I'll whoop ya good!"
	done
	
BrilloPoliceBackRoomCop4Text2:
	text "You kicked my"
	line "butt!"
	done
	
BrilloPoliceBackRoomCop4WinText:
	text "Wow!"
	done
	
Movement_BrilloPoliceBackRoom_Player:
	step_up
	step_up
	step_end
	
Movement_BrilloPoliceBackRoom_Captain_1:
	step_left
	step_down
	step_down
	step_down
	step_end
	
Movement_BrilloPoliceBackRoom_Captain_2:
	step_up
	step_up
	step_up
	step_right
	turn_step_down
	remove_fixed_facing
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_1:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_left
	turn_step_down
	remove_fixed_facing
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_1_2:
	step_down
	step_right
	step_right
	step_down
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_2:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	turn_step_down
	remove_fixed_facing
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_2_2:
	step_down
	step_left
	step_down
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_3:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_step_down
	remove_fixed_facing
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_3_2:
	step_down
	step_down
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_4:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_step_down
	remove_fixed_facing
	step_end
	
Movement_BrilloPoliceBackRoom_Cop_4_2:
	step_down
	step_right
	step_down
	step_end
