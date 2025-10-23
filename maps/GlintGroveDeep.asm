GlintGroveDeep_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 7 ; warp events
	warp_def 33,  7, 1, GLINT_GROVE_EAST
	warp_def 27, 11, 3, GLINT_GROVE_DEEP
	warp_def  9,  7, 2, GLINT_GROVE_DEEP
	warp_def 31, 21, 5, GLINT_GROVE_DEEP
	warp_def  9, 21, 4, GLINT_GROVE_DEEP
	warp_def  7, 14, 7, GLINT_GROVE_DEEP
	warp_def 28, 12, 6, GLINT_GROVE_DEEP

	db 1 ; coord events
	coord_event  4,  5, 2, GlintGroveDeepSmeargleScene

	db 2 ; bg events
	bg_event  4, 23, SIGNPOST_ITEM + SUPER_REPEL, EVENT_GLINT_DEEP_HIDDEN_ITEM_1
	bg_event 13, 24, SIGNPOST_ITEM + SUPER_POTION, EVENT_GLINT_DEEP_HIDDEN_ITEM_2

	db 8 ; object events
	itemball_event 17,  6, PAINTBRUSH, 1, EVENT_GLINT_DEEP_POKE_BALL
	object_event  4,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLINT_SMEARGLES_GONE
	object_event  5,  2, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SMEARGLE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLINT_SMEARGLES_GONE
	person_event SPRITE_MINA,  5,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveDeepMina, EVENT_GLINT_DEEP_MINA_GONE
	person_event SPRITE_LEAVES,  4,  5, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GlintGroveDeepEasel, EVENT_GLINT_DEEP_MINA_GONE
	person_event SPRITE_LEAVES,  4,  5, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GlintGroveDeepEasel, EVENT_GLINT_DEEP_MINA_GONE
	itemball_event 17, 26, REVIVE, 1, EVENT_GLINT_DEEP_POKE_BALL_2
	tapeball_event 20, 31, MUSIC_GLINT_GROVE, 1, EVENT_MUSIC_GLINT_GROVE

	const_def 1 ; object constants
	const GLINTSECRET_SHINY_SMEARGLE
	const GLINTSECRET_SMEARGLE_1
	const GLINTSECRET_SMEARGLE_2
	const GLINTSECRET_MINA
	const GLINTSECRET_PAINTING
	const GLINTSECRET_EASEL
	
	
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
	
GlintGroveDeepSmeargleScene:
	special Special_StopRunning
	spriteface GLINTSECRET_MINA, LEFT
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINTSECRET_MINA, 15
	opentext TEXTBOX_MINA
	writetext GlintGroveDeepMinaText1
	pause 8
	closetext
	playmusic MUSIC_NONE
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
	opentext TEXTBOX_MINA
	writetext GlintGroveDeepMinaText2
	waitbutton
	closetext
	pause 40
	spriteface GLINTSECRET_MINA, LEFT
	spriteface PLAYER, RIGHT
	playmusic MUSIC_MINA
	opentext TEXTBOX_MINA
	writetext GlintGroveDeepMinaText3
	waitbutton
	closetext
	follow GLINTSECRET_MINA, PLAYER
	applyonemovement GLINTSECRET_MINA, step_right
	stopfollow
	spriteface GLINTSECRET_MINA, LEFT
	spriteface PLAYER, UP
	pause 40
	opentext TEXTBOX_MINA
	writetext GlintGroveDeepMinaText4
	pause 10
	spriteface GLINTSECRET_MINA, DOWN
	farwritetext StdBlankText
	pause 6
	writetext GlintGroveDeepMinaText5
	waitbutton
	closetext
	pause 40
	spriteface GLINTSECRET_MINA, LEFT
	spriteface PLAYER, RIGHT
	pause 20
	opentext TEXTBOX_MINA
	writetext GlintGroveDeepMinaText6
	waitbutton
	closetext
	waitsfx
	winlosstext GlintGroveDeepMinaWinText, 0
	setlasttalked GLINTSECRET_MINA
	loadtrainer MINA, 1
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MINA
	checkevent EVENT_GOT_HM03_SURF
	iftrue .start_mina_quest
.return
	setevent EVENT_GLINT_DEEP_MINA_GONE
	setevent EVENT_GLINT_SMEARGLES_GONE
	setevent EVENT_DONE_GLINT_DEEP_MINA
	setflag ENGINE_MINA_GLINT_GROVE_DEEP
	opentext TEXTBOX_MINA
	writetext GlintGroveDeepMinaText7
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
	opentext TEXTBOX_MINA
	special Special_MinaGoodbye
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement GLINTSECRET_MINA, Movement_GlintDeepMinaLeave
	playsound SFX_EXIT_BUILDING
	disappear GLINTSECRET_MINA
	dotrigger $4
	clearevent EVENT_MINA_APARTMENT_EMPTY
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_JOURNAL
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_GLINT_GROVE
	special Special_FadeOutMusic
	pause 5
	playmapmusic
	end
.start_mina_quest
	domaptrigger ROUTE_6_SOUTH, $1
	clearevent EVENT_ROUTE_6_MINA_GONE
	clearevent EVENT_ROUTE_11_MINA_GONE
	clearevent EVENT_RADIANT_FIELD_MINA_GONE
	clearevent EVENT_ROUTE_29_MINA_GONE
	clearevent EVENT_ROUTE_10_MINA_GONE
	clearevent EVENT_UNIQUE_ENCOUNTER_MINA_JOURNAL
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_GLINT_GROVE
	setevent EVENT_MINA_QUEST_ACTIVATED
	jump .return
	
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

	para "I call it:<WAIT_L>"
	done
	
GlintGroveDeepMinaText5:
	text "“SMEARGLE"
	line "in Love”."
	done
	
GlintGroveDeepMinaText6:
	text "I can't believe"
	line "the SMEARGLE let"
	cont "me get so close"
	cont "like that!"
	
	para "What an awesome"
	line "feeling!"
	
	para "I'm all fired up!"
	
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
	
	para "So, uhh…<WAIT_S>"
	line "Thanks!"
	
	para "Anyway, <WAIT_S>I better"
	line "be going."
	
	para "I'm sure we'll"
	line "meet again."
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
