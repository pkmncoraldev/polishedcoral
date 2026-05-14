GlintGroveEntrance_MapScriptHeader:
	db 2 ; scene scripts
	
	scene_script GlintGroveEntranceTrigger0
	scene_script GlintGroveEntranceTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GlintGroveEntrancePiles

	db 2 ; warp events
	warp_def  5,  9, 1, GLINT_GROVE
	warp_def  5,  8, 2, GLINT_GROVE

	db 2 ; coord events
	xy_trigger 0,  6,  8, 0, GlintRival_L, 0, 0
	xy_trigger 0,  6,  9, 0, GlintRival_R, 0, 0

	db 1 ; bg events
	signpost 10, 10, SIGNPOST_READ, GlintGroveSign

	db 1 ; object events
	person_event SPRITE_COLBY, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, -1, -1
	
	const_def 1 ; object constants
	const GLINT_RIVAL
	
GlintGroveEntranceTrigger0:
GlintGroveEntranceTrigger1:
	end
	
GlintGroveEntrancePiles:
	clearflag ENGINE_GLINT_GROVE_PILE_1
	clearflag ENGINE_GLINT_GROVE_PILE_2
	clearflag ENGINE_GLINT_GROVE_PILE_3
	clearflag ENGINE_GLINT_GROVE_PILE_4
	clearflag ENGINE_GLINT_GROVE_PILE_5
	clearflag ENGINE_GLINT_GROVE_PILE_6
	clearflag ENGINE_GLINT_GROVE_PILE_7
	return
	
GlintGroveSign:
	jumptext GlintGroveSignText
	
GlintRival_L:
	special Special_StopRunning
	disappear GLINT_RIVAL
	moveperson GLINT_RIVAL, 8, 5
	appear GLINT_RIVAL
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_GlintRivalBump
	playmusic MUSIC_RIVAL_AFTER
	applymovement GLINT_RIVAL, Movement_GlintRivalBump2
	opentext TEXTBOX_RIVAL
	writetext GlintRivalText1
	waitbutton
	closetext
	waitsfx
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .totodile
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .cyndaquil
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .chikorita
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .charmander
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .bulbasaur
	
.totodile
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.chikorita
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.cyndaquil
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.squirtle
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.bulbasaur
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle

.charmander
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext TEXTBOX_RIVAL
	writetext GlintRivalText2
	waitbutton
	changetextboxspeaker
	writetext GlintGroveEntranceGiveText
	takeitem RIVAL_POKEDEX
	playsound SFX_LEVEL_UP 
	waitsfx
	changetextboxspeaker TEXTBOX_RIVAL
	writetext GlintRivalText3
	waitbutton
	closetext
	applyonemovement PLAYER, step_right
	spriteface PLAYER, LEFT
	applymovement GLINT_RIVAL, Movement_GlintRivalWalkAway
	disappear GLINT_RIVAL
	special Special_FadeOutMusic
	pause 15
	playmapmusic
	dotrigger $1
	end
	
GlintRival_R:
	special Special_StopRunning
	disappear GLINT_RIVAL
	moveperson GLINT_RIVAL, 9, 5
	appear GLINT_RIVAL
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_GlintRivalBump
	playmusic MUSIC_RIVAL_AFTER
	applymovement GLINT_RIVAL, Movement_GlintRivalBump2
	opentext TEXTBOX_RIVAL
	writetext GlintRivalText1
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .totodile
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .cyndaquil
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .chikorita
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .charmander
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .bulbasaur
	
.totodile
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.chikorita
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.cyndaquil
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.squirtle
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.bulbasaur
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle

.charmander
	winlosstext GlintRivalWinText, GlintRivalLoseText
	setlasttalked GLINT_RIVAL
	loadtrainer RIVAL, RIVAL2_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext TEXTBOX_RIVAL
	writetext GlintRivalText2
	waitbutton
	changetextboxspeaker
	writetext GlintGroveEntranceGiveText
	takeitem RIVAL_POKEDEX
	playsound SFX_LEVEL_UP 
	waitsfx
	changetextboxspeaker TEXTBOX_RIVAL
	writetext GlintRivalText3
	waitbutton
	closetext
	applyonemovement PLAYER, step_left
	spriteface PLAYER, RIGHT
	applymovement GLINT_RIVAL, Movement_GlintRivalWalkAway
	disappear GLINT_RIVAL
	special Special_FadeOutMusic
	pause 15
	playmapmusic
	dotrigger $1
	end
	
GlintGroveSignText:
	text "GLINT GROVE"
	done
	
GlintRivalText1:
	text "Hey!<WAIT_M>"
	line "Watch it!"
	
	para "You?"
	
	para "What are you doing"
	line "here?"
	
	para "I left before I"
	line "got my #DEX?"
	
	para "And what makes you"
	line "think you could"
	cont "just take it?"
	
	para "I don't need help"
	line "from someone like"
	cont "you!"
	
	para "I bet you aren't"
	line "even any stronger"
	cont "than at the"
	cont "LIGHTHOUSE!"
	
	para "I was just"
	line "finishing up my"
	cont "training,"
	
	para "but I could take"
	line "you down real"
	cont "quick."
	done
	
GlintRivalText2:
	text "Tch!<WAIT_M>"
	line "Whatever…"
	
	para "My #MON weren't"
	line "even trying!"
	
	para "I don't need to"
	line "deal with this."
	
	para "Just hand over my"
	line "#DEX, and stay"
	cont "outta my way!"
	done
	
GlintRivalText3:
	text "Now, step aside!"
	done
	
GlintGroveEntranceGiveText:
	text "<PLAYER> handed over"
	line "<RIVAL>'s #DEX."
	done
	
GlintRivalWinText:
	text "What?"
	line "<WAIT_M>How?"
	done
	
GlintRivalLoseText:
	text "Hmph!"
	line "<WAIT_M>Too easy."
	done
	
Movement_GlintRivalBump:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_GlintRivalBump2:
	big_step_down
	big_step_down
	step_end
	
Movement_GlintRivalWalkAway:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
