LusterMallSkateTest_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterMallSkateTestTrigger0
	scene_script LusterMallSkateTestTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterMallSkateTestCallback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_BIRD_KEEPER,  7,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BIRD_KEEPER,  4, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallSkateTest_Clerk, -1

	const_def 1 ; object constants
	const LUSTER_MALL_SKATE_NPC1
	const LUSTER_MALL_SKATE_NPC2

	
LusterMallSkateTestCallback:
	writecode VAR_MOVEMENT, PLAYER_SKATEBOARD
	special ReplaceKrisSprite
	checkevent EVENT_KNOW_OLLIE
	iffalse .end
	changeblock $6, $4, $98
	changeblock $8, $4, $99
	changeblock $a, $4, $87
	changeblock $a, $2, $9b
.end
	return

LusterMallSkateTestTrigger0:
	callasm LusterMallSkateTestGetOnBoard
	writecode VAR_MOVEMENT, PLAYER_SKATEBOARD
	special ReplaceKrisSprite
	setevent EVENT_KNOW_OLLIE
	applyonemovement LUSTER_MALL_SKATE_NPC1, step_down
	opentext
.repeat_ollie
	writetext LusterMallSkateTest_ClerkText1
	yesorno
	iffalse .repeat_ollie
	pause 5
	writetext LusterMallSkateTest_ClerkText2
	waitbutton
	closetext
	pause 5
	applymovement LUSTER_MALL_SKATE_NPC1, Movement_LusterMallSkateTest
	pause 5
	disappear LUSTER_MALL_SKATE_NPC1
	moveperson LUSTER_MALL_SKATE_NPC1, -6, -6
	appear LUSTER_MALL_SKATE_NPC1
	dotrigger $2
	end
	
LusterMallSkateTestTrigger1:
	callasm LusterMallSkateTestGetOnBoard
	writecode VAR_MOVEMENT, PLAYER_SKATEBOARD
	special ReplaceKrisSprite
	setevent EVENT_KNOW_GRIND
	applyonemovement LUSTER_MALL_SKATE_NPC1, step_down
	opentext
.repeat_grind
	writetext LusterMallSkateTest_ClerkText6
	yesorno
	iffalse .repeat_grind
	pause 5
	writetext LusterMallSkateTest_ClerkText7
	waitbutton
	closetext
	pause 5
	applymovement LUSTER_MALL_SKATE_NPC1, Movement_LusterMallSkateTest
	pause 5
	disappear LUSTER_MALL_SKATE_NPC1
	moveperson LUSTER_MALL_SKATE_NPC1, -6, -6
	appear LUSTER_MALL_SKATE_NPC1
	dotrigger $2
	end
	
LusterMallSkateTest_Clerk:
	faceplayer
	opentext
	checkevent EVENT_KNOW_GRIND
	iftrue .grind
	writetext LusterMallSkateTest_ClerkText3
	pause 5
	playsound SFX_EGG_CRACK
	waitsfx
	pause 5
	writetext LusterMallSkateTest_ClerkText4
	yesorno
	iftrue .move_on_1
.ask_start_over_1
	writetext LusterMallSkateTest_ClerkText11
	yesorno
	iftrue .restart_ollie
	writetext LusterMallSkateTest_ClerkText12
	yesorno
	iffalse .ask_start_over_1
.move_on_1
	writetext LusterMallSkateTest_ClerkText9
	waitbutton
	closetext
	pause 5
	dotrigger $1
	warpfacing UP, LUSTER_MALL_SKATE_TEST, $5, $9
	end
.restart_ollie
	writetext LusterMallSkateTest_ClerkText10
	waitbutton
	closetext
	clearevent EVENT_KNOW_OLLIE
	pause 5
	dotrigger $0
	warpfacing UP, LUSTER_MALL_SKATE_TEST, $5, $9
	end
	
.grind
	writetext LusterMallSkateTest_ClerkText8
	yesorno
	iftrue .move_on_2
.ask_start_over_2
	writetext LusterMallSkateTest_ClerkText11
	yesorno
	iftrue .restart_grind
	writetext LusterMallSkateTest_ClerkText13
	yesorno
	iffalse .ask_start_over_2
.move_on_2
	writetext LusterMallSkateTest_ClerkText5
	waitbutton
	closetext
	pause 5
	warpfacing UP, LUSTER_MALL_SKATE_SHOP, $1, $3
	end
.restart_grind
	writetext LusterMallSkateTest_ClerkText10
	waitbutton
	closetext
	clearevent EVENT_KNOW_GRIND
	pause 5
	dotrigger $1
	warpfacing UP, LUSTER_MALL_SKATE_TEST, $5, $9
	end
	
LusterMallSkateTestGetOnBoard:
	ld a, 1
	ld [wOnSkateboard], a
	ret
	
LusterMallSkateTest_ClerkText1:
	text "Alright,"
	line "listen up!"
	
	para "The OLLIE is the"
	line "most basic trick"
	cont "you can do."
	
	para "You can use it to"
	line "hop over small"
	cont "obstacles, ledges,"
	cont "or even people!"
	
	para "To do an OLLIE,"
	line "first you need to"
	cont "get some speed."
	
	para "Once you're moving,"
	line "hold and release"
	cont "the B BUTTON."
	
	para "As long as you"
	line "have a safe place"
	cont "to land,"
	
	para "you should do an"
	line "do an OLLIE!"
	
	para "…"
	
	para "Remember, you do"
	line "the OLLIE when you"
	cont "let go of the"
	cont "B BUTTON,"
	
	para "NOT when you first"
	line "press it."
	
	para "…"
	
	para "Ok."
	
	para "You got all that?"
	done
	
LusterMallSkateTest_ClerkText2:
	text "Cool."
	
	para "Let's see if you"
	line "can OLLIE those"
	cont "boxes over there"
	cont "and reach me."
	done
	
LusterMallSkateTest_ClerkText3:
	text "Sick."
	
	para "The timing can be"
	line "tricky,"
	
	para "but you'll get it"
	line "down in no time."

	para "If for some reason"
	line "you can't OLLIE,"
	
	para "you'll hear this"
	line "sound."
	prompt
	
LusterMallSkateTest_ClerkText4:
	text "If you hear that,"
	line "you can't OLLIE at"
	cont "that spot."
	
	para "Try again at a"
	line "different spot."
	
	para "Also, if you land"
	line "on rough ground,"
	
	para "where your wheels"
	line "can't spin,"
	
	para "you'll whipout!"
	
	para "So, watch out for"
	line "that."
	
	para "…"
	
	para "And that's pretty"
	line "much it for the"
	cont "OLLIE."
	
	para "You wanna move"
	line "on to the GRIND?"
	done
	
LusterMallSkateTest_ClerkText5:
	text "Great."
	
	para "Let's head back to"
	line "the shop."
	done
	
LusterMallSkateTest_ClerkText6:
	text "Alright,"
	line "listen up!"
	
	para "A GRIND is an"
	line "important trick"
	cont "for any serious"
	cont "SKATER!"
	
	para "You can use it to"
	line "get to places an"
	cont "OLLIE won't reach."
	
	para "To do a GRIND,"
	line "all you have to"
	cont "do is OLLIE onto"
	cont "certain rails."
	
	para "You have to come"
	line "at the rail from"
	cont "the right side,"
	cont "or you'll eat it!"
	
	para "…"
	
	para "Ok."
	
	para "You got all that?"
	done
	
LusterMallSkateTest_ClerkText7:
	text "Sick."
	
	para "GRIND that rail"
	line "over there and"
	cont "see if you can"
	cont "reach me."
	done
	
LusterMallSkateTest_ClerkText8:
	text "Nice."
	
	para "Easier than it"
	line "looks, huh?"
	
	para "You'll do an OLLIE"
	line "automatically when"
	cont "you hit the end of"
	cont "a rail."
	
	para "You can also GRIND"
	line "fountains and"
	cont "flower beds and"
	cont "stuff."
	
	para "Trying linking"
	line "OLLIES and GRINDS"
	cont "together for some"
	cont "cool lines!"
	
	para "…"
	
	para "So, you got it"
	line "down?"
	done
	
LusterMallSkateTest_ClerkText9:
	text "Cool."
	
	para "Let's move on."
	done
	
LusterMallSkateTest_ClerkText10:
	text "Let's try again."
	done
	
LusterMallSkateTest_ClerkText11:
	text "Do you want to"
	line "start over?"
	done
	
LusterMallSkateTest_ClerkText12:
	text "You wanna move"
	line "on to the GRIND?"
	done
	
LusterMallSkateTest_ClerkText13:
	text "So, you got it"
	line "down?"
	done
	
Movement_LusterMallSkateTest:
	step_up
	step_up
	step_up
	step_up
	step_end