GlintGroveDeep_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GlintGroveDeepCallback

	db 7 ; warp events
	warp_def 33,  7, 1, GLINT_GROVE_EAST
	warp_def 27, 11, 3, GLINT_GROVE_DEEP
	warp_def  9,  7, 2, GLINT_GROVE_DEEP
	warp_def 31, 21, 5, GLINT_GROVE_DEEP
	warp_def  9, 21, 4, GLINT_GROVE_DEEP
	warp_def  7, 16, 7, GLINT_GROVE_DEEP
	warp_def 28, 12, 6, GLINT_GROVE_DEEP

	db 1 ; coord events
	coord_event  4,  5, 2, GlintGroveDeepSmeargleScene

	db 2 ; bg events
	bg_event  4, 23, SIGNPOST_ITEM + SUPER_REPEL, EVENT_GLINT_DEEP_HIDDEN_ITEM_1
	bg_event 13, 24, SIGNPOST_ITEM + SUPER_POTION, EVENT_GLINT_DEEP_HIDDEN_ITEM_2

	db 8 ; object events
	object_event 19,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, GlintSecretSmeargle, EVENT_GLINT_SECRET_SMEARGLE_GONE
	object_event  4,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLINT_SMEARGLES_GONE
	object_event  5,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLINT_SMEARGLES_GONE
	person_event SPRITE_MINA,  5,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveDeepMina, EVENT_GLINT_DEEP_MINA_GONE
	person_event SPRITE_LEAVES,  4,  5, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GlintGroveDeepEasel, EVENT_GLINT_DEEP_MINA_GONE
	person_event SPRITE_LEAVES,  4,  5, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GlintGroveDeepEasel, EVENT_GLINT_DEEP_MINA_GONE
	itemball_event 17, 26, REVIVE, 1, EVENT_GLINT_DEEP_POKE_BALL
	tapeball_event 20, 31, MUSIC_GLINT_GROVE, 1, EVENT_MUSIC_GLINT_GROVE

	const_def 1 ; object constants
	const GLINTSECRET_SHINY_SMEARGLE
	const GLINTSECRET_SMEARGLE_1
	const GLINTSECRET_SMEARGLE_2
	const GLINTSECRET_MINA
	const GLINTSECRET_PAINTING
	const GLINTSECRET_EASEL
	
GlintGroveDeepCallback:
	clearevent EVENT_GLINT_GROVE_EAST_ROCKS_BROWN
	return
	
Movement_GlintSmeargleLeave1:
	fast_jump_step_left
	fast_jump_step_left
	fast_jump_step_left
	step_end
	
Movement_GlintSmeargleLeave2:
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	step_end

Movement_GlintDeepMinaLeave:
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_end

GlintGroveDeepMina:
	jumptext GlintGroveDeepMinaText
	
GlintGroveDeepEasel:
	jumptext GlintGroveDeepEaselText
	
GlintSecretSmeargle:
	opentext
	writetext GlintSecretSmeargleText
	cry SMEARGLE
	waitbutton
	closetext
	waitsfx
	loadwildmon SMEARGLE, 12
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY_LEGENDARY
	startbattle
	disappear GLINTSECRET_SHINY_SMEARGLE
	reloadmapafterbattle
	setevent EVENT_GLINT_SECRET_SMEARGLE_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal SMEARGLE, .CaughtSmeargle
	opentext
	writetext GlintSecretSmeargleTextGone
	waitbutton
	closetext
.CaughtSmeargle
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
GlintGroveDeepSmeargleScene:
	special Special_StopRunning
	spriteface GLINTSECRET_MINA, LEFT
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTSECRET_MINA, 15
	opentext
	writetext GlintGroveDeepMinaText1
	pause 8
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTSECRET_SMEARGLE_1, 15
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTSECRET_SMEARGLE_2, 15
	playsound SFX_RUN
	applymovement GLINTSECRET_SMEARGLE_1, Movement_GlintSmeargleLeave1
	disappear GLINTSECRET_SMEARGLE_1
	playsound SFX_RUN
	applymovement GLINTSECRET_SMEARGLE_2, Movement_GlintSmeargleLeave2
	disappear GLINTSECRET_SMEARGLE_2
	clearevent EVENT_GLINT_SMEARGLES_GONE
	spriteface GLINTSECRET_MINA, UP
	pause 20
	opentext
	writetext GlintGroveDeepMinaText2
	waitbutton
	closetext
	pause 40
	spriteface GLINTSECRET_MINA, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGroveDeepMinaText3
	waitbutton
	closetext
	follow GLINTSECRET_MINA, PLAYER
	applyonemovement GLINTSECRET_MINA, step_right
	stopfollow
	spriteface GLINTSECRET_MINA, LEFT
	spriteface PLAYER, UP
	pause 40
	opentext
	writetext GlintGroveDeepMinaText4
;	buttonsound
	spriteface GLINTSECRET_MINA, DOWN
;	farwritetext StdBlankText
;	pause 6
	writetext GlintGroveDeepMinaText5
	waitbutton
	closetext
	pause 50
	spriteface GLINTSECRET_MINA, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGroveDeepMinaText6
	waitbutton
	closetext
	waitsfx
	winlosstext GlintGroveDeepMinaWinText, 0
	setlasttalked GLINTSECRET_MINA
	loadtrainer MINA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_GLINT_DEEP_MINA_GONE
	setevent EVENT_GLINT_SMEARGLES_GONE
	opentext
	writetext GlintGroveDeepMinaText7
	waitbutton
	verbosegiveitem PAINTBRUSH
	iffalse .NoRoom
	setevent EVENT_GOT_MINA_PAINTBRUSH
	jump .end
.NoRoom:
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext GlintGroveDeepMinaText8
	buttonsound
	farwritetext StdBlankText
	pause 6
.end
	writetext GlintGroveDeepMinaText9
	waitbutton
	closetext
	follow PLAYER, GLINTSECRET_MINA
	applyonemovement PLAYER, step_left
	stopfollow
	spriteface PLAYER, RIGHT
	spriteface GLINTSECRET_MINA, UP
	playsound SFX_UNKNOWN_61
	disappear GLINTSECRET_PAINTING
	pause 25
	playsound SFX_SWITCH_POCKETS
	disappear GLINTSECRET_EASEL
	pause 25
	spriteface GLINTSECRET_MINA, LEFT
	pause 10
	opentext
	writetext GlintGroveDeepMinaText10
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement GLINTSECRET_MINA, Movement_GlintDeepMinaLeave
	playsound SFX_EXIT_BUILDING
	disappear GLINTSECRET_MINA
	dotrigger $4
	clearevent EVENT_MINA_APARTMENT_EMPTY
	clearevent EVENT_ROUTE_6_MINA_GONE
	domaptrigger ROUTE_6_SOUTH, $1
	end
	
GlintGroveDeepMinaText:
	text "She's totally"
	line "engrossed in"
	cont "painting."
	done
	
GlintGroveDeepMinaText1:
	text "Ah! <WAIT_M><PLAYER>!"
	
	para "Be careful!"
	
	para "Don't startle the-"
	done
	
GlintGroveDeepMinaText2:
	text "…SMEARGLE…"
	done
	
GlintGroveDeepMinaText3:
	text "Oh, <WAIT_S>now you've"
	line "done it!"
	
	para "We were kinda"
	line "having a moment"
	cont "until you showed"
	cont "up and ruined it!"
	
	para "…"
	
	para "Oh well…"
	
	para "I was almost done"
	line "painting, anyway."
	
	para "Here, <WAIT_S>take a look!"
	done
	
GlintGroveDeepMinaText4:
	text "Well?"
	
	para "What do you think?"
	done
	
GlintGroveDeepMinaText5:
	text "I call it:<WAIT_L>"
	line "“SMEARGLE"
	cont "in Love”."
	done
	
GlintGroveDeepMinaText6:
	text "I can't believe"
	line "the SMEARGLE let"
	cont "me get so close"
	cont "like that!"
	
	para "What an awesome"
	line "feeling!"
	
	para "I'm all fired up!<WAIT_S>"
	line "I got that spark!"
	
	para "Do you feel it,"
	line "<PLAYER>?"
	
	para "Let's battle!"
	
	para "Right here,<WAIT_S>"
	line "right now!"
	done
	
GlintGroveDeepMinaText7:
	text "Wow! <WAIT_M>What an"
	line "awesome battle!"
	
	para "I wouldn't have"
	line "found my spark if"
	cont "it weren't for you."
	
	para "Here, have this"
	line "as thanks."
	done
	
GlintGroveDeepMinaText8:
	text "Oh, <WAIT_S>you can't"
	line "carry anymore"
	cont "stuff."
	
	para "Oh well, <WAIT_S>I'll"
	line "give it to you"
	cont "next time I see"
	cont "you."
	done
	
GlintGroveDeepMinaText9:
	text "Anyway, <WAIT_S>I better"
	line "be going."
	
	para "I'm sure we'll"
	line "meet again."
	done

GlintGroveDeepMinaText10:
	text "ALOLA,"
	line "<PLAYER>."
	
	para "Err… <WAIT_M>I mean…"

	para "Goodbye!"
	done

GlintGroveDeepMinaWinText:
	text "Woah!"
	
	para "I'm shocked at"
	line "your strength!"
	done
	
GlintGroveDeepEaselText:
	text "MINA's easel."
	done
	
GlintSecretSmeargleText:
	text "SMEARGLE: <WAIT_S>Gooahh!"
	done

GlintSecretSmeargleTextGone:
	text "SMEARGLE fled deep"
	line "into the cave!"
	done
