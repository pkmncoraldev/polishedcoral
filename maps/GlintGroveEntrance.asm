GlintGroveEntrance_MapScriptHeader:
	db 4 ; scene scripts
	
	scene_script GlintGroveEntranceTrigger0
	scene_script GlintGroveEntranceTrigger1
	scene_script GlintGroveEntranceTrigger2
	scene_script GlintGroveEntranceTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, GlintGroveEntrancePiles

	db 2 ; warp events
	warp_def 4, 9, 1, GLINT_GROVE
	warp_def 4, 8, 2, GLINT_GROVE

	db 8 ; coord events
	xy_trigger 0, 12, 8, 0, GlintContactsScriptL, 0, 0
	xy_trigger 0, 12,  9, 0, GlintContactsScriptR, 0, 0
	xy_trigger 1, 5, 8, 0, GlintRival_L, 0, 0
	xy_trigger 1,  5,  9, 0, GlintRival_R, 0, 0
	xy_trigger 3, 17,  9, 0, GlintContactsScriptSquish, 0, 0
	xy_trigger 3, 17,  8, 0, GlintContactsScriptSquish, 0, 0
	xy_trigger 3, 12,  8, 0, GlintContactsScriptL, 0, 0
	xy_trigger 3, 12,  9, 0, GlintContactsScriptR, 0, 0

	db 1 ; bg events
	signpost 10, 10, SIGNPOST_READ, GlintGroveSign

	db 3 ; object events
	person_event SPRITE_COLBY, 0, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, -1, EVENT_GLINT_RIVAL_WILL_BUMP
	person_event SPRITE_PSYCHIC, 11, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_GLINT_CONTACT_GUY_1
	person_event SPRITE_PSYCHIC, 11, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintGroveEntranceContactsGuy, EVENT_GLINT_CONTACT_GUY_2
	
	const_def 1 ; object constants
	const GLINT_RIVAL
	const GLINT_CONTACT_GUY_1
	const GLINT_CONTACT_GUY_2
	
GlintGroveEntranceTrigger0:
	end

GlintGroveEntranceTrigger1:
	end

GlintGroveEntranceTrigger2:
	end

GlintGroveEntranceTrigger3:
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
	
GlintContactsScriptSquish:
	special Special_StopRunning
	playsound SFX_EGG_CRACK
	pause 10
	opentext
	writetext GlintGroveEntranceContactsSquishText
	waitbutton
	closetext
	dotrigger $0
	end
	
GlintContactsScriptL:
	special Special_StopRunning
	spriteface GLINT_CONTACT_GUY_1, RIGHT
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINT_CONTACT_GUY_1, 15
	pause 7
	applymovement GLINT_CONTACT_GUY_1, Movement_GlintContactsScriptL1
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_GLINT_CONTACT_GUY
	iftrue .skiptalk
	writetext GlintGroveEntranceContactsGuy1Text1
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintContactsDown
	applymovement GLINT_CONTACT_GUY_1, Movement_GlintContactsScriptL2
	setevent EVENT_TALKED_TO_GLINT_CONTACT_GUY
	dotrigger $3
	end
.skiptalk
	writetext GlintGroveEntranceContactsGuy1Text2
	waitbutton
	closetext
	applymovement GLINT_CONTACT_GUY_1, Movement_GlintContactsScriptL2
	applymovement PLAYER, Movement_GlintContactsDown
	end
	
GlintContactsScriptR:
	special Special_StopRunning
	spriteface GLINT_CONTACT_GUY_1, RIGHT
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, GLINT_CONTACT_GUY_1, 15
	pause 7
	applymovement GLINT_CONTACT_GUY_1, Movement_GlintContactsScriptR1
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_GLINT_CONTACT_GUY
	iftrue .skiptalk
	writetext GlintGroveEntranceContactsGuy1Text1
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintContactsDown
	applymovement GLINT_CONTACT_GUY_1, Movement_GlintContactsScriptR2
	setevent EVENT_TALKED_TO_GLINT_CONTACT_GUY
	dotrigger $3
	end
.skiptalk
	writetext GlintGroveEntranceContactsGuy1Text2
	waitbutton
	closetext
	applymovement GLINT_CONTACT_GUY_1, Movement_GlintContactsScriptR2
	applymovement PLAYER, Movement_GlintContactsDown
	end
	
GlintGroveEntranceContactsGuy:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_GLINT_CONTACT_GUY
	iffalse .didntseecontactguyscene
	writetext GlintGroveEntranceContactsGuyText
	waitbutton
	closetext
	end
.didntseecontactguyscene
	writetext GlintGroveEntranceContactsGuyText2
	waitbutton
	closetext
	end
	
GlintGroveSign:
	jumptext GlintGroveSignText
	
GlintRival_L:
	special Special_StopRunning
	moveperson GLINT_RIVAL, 8, 4
	appear GLINT_RIVAL
	clearevent EVENT_GLINT_RIVAL_WILL_BUMP
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_GlintRivalBump
	playmusic MUSIC_RIVAL_AFTER
	applymovement GLINT_RIVAL, Movement_GlintRivalBump2
	opentext
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
	opentext
	writetext GlintRivalText2
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintRivalOuttaTheWay2
	spriteface PLAYER, LEFT
	applymovement GLINT_RIVAL, Movement_GlintRivalWalkAway
	disappear GLINT_RIVAL
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_GLINT_GROVE
	setevent EVENT_GLINT_RIVAL_WILL_BUMP
	dotrigger $2
	end
	
	
GlintRival_R:
	special Special_StopRunning
	moveperson GLINT_RIVAL, 9, 4
	appear GLINT_RIVAL
	clearevent EVENT_GLINT_RIVAL_WILL_BUMP
	playsound SFX_EXIT_BUILDING
	applymovement PLAYER, Movement_GlintRivalBump
	playmusic MUSIC_RIVAL_AFTER
	applymovement GLINT_RIVAL, Movement_GlintRivalBump2
	opentext
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
	opentext
	writetext GlintRivalText2
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintRivalOuttaTheWay1
	spriteface PLAYER, RIGHT
	applymovement GLINT_RIVAL, Movement_GlintRivalWalkAway
	disappear GLINT_RIVAL
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_GLINT_GROVE
	setevent EVENT_GLINT_RIVAL_WILL_BUMP
	dotrigger $2
	end
	
GlintGroveSignText:
	text "GLINT GROVE"
	done
	
GlintRivalText1:
	text "Hey!"
	line "Watch it!"
	
	para "You?"
	
	para "What are you doing"
	line "here?"
	
	para "I left my #DEX"
	line "at the LIGHTHOUSE?"
	
	para "And what makes you"
	line "think you could"
	cont "just take it?"
	
	para "I don't need help"
	line "from a weakling"
	cont "like you."
	
	para "I bet you aren't"
	line "even any stronger"
	cont "than you were when"
	cont "you first got your"
	cont "#MON!"
	
	para "I was heading"
	line "home,"
	
	para "but I could take"
	line "you down real"
	cont "quick."
	done

GlintRivalText2:
	text "Tch!"
	
	para "Whatever…"
	
	para "My #MON weren't"
	line "even trying!"
	
	para "I don't need to"
	line "deal with this."
	
	para "Outta my way!"
	done
	
GlintRivalWinText:
	text "What?"
	
	para "How?"
	done
	
GlintRivalLoseText:
	text "Hmph!"
	
	para "Too easy."
	done
	
GlintGroveEntranceContactsGuy1Text1:
	text "Wait!"
	
	para "I dropped my cont-"
	line "act lens on the"
	cont "ground!"
	
	para "I can't see a"
	line "thing!"
	
	para "…"
	
	para "What?"
	
	para "Why are you look-"
	line "ing at me like"
	cont "that?"
	
	para "You don't believe"
	line "me?"
	
	para "…"
	
	para "Look, can you just"
	line "come back after"
	cont "I've found my"
	cont "contact lens?"
	done
	
GlintGroveEntranceContactsGuy1Text2:
	text "Hey!"
	
	para "Can you just come"
	line "back after I've"
	cont "found my contact"
	cont "lens?"
	done
	
GlintGroveEntranceContactsGuyText:
	text "I found my contact"
	line "lens,"
	
	para "but it's all"
	line "squished!"
	
	para "I still can't see"
	line "anything!"
	done
	
GlintGroveEntranceContactsGuyText2:
	text "I dropped my con-"
	line "tact lens on the"
	cont "ground earlier."
	
	para "I'm lucky someone"
	line "didn't walk by"
	cont "while I was look-"
	cont "ing for it."
	
	para "It could have been"
	line "squished!"
	done
	
GlintGroveEntranceContactsSquishText:
	text "Squitch!"
	
	para "You stepped on a…"
	
	para "CONTACT LENS!"
	
	para "Better just keep"
	line "moving…"
	done
	
Movement_GlintContactsDown:
	step_down
	step_end
	
Movement_GlintContactsScriptL1:
	step_right
	step_end
	
Movement_GlintContactsScriptL2:
	step_left
	step_end
	
Movement_GlintContactsScriptR1:
	step_right
	step_right
	step_end
	
Movement_GlintContactsScriptR2:
	step_left
	step_left
	step_end
	
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
	
Movement_GlintRivalOuttaTheWay1:
	step_left
	step_end
	
Movement_GlintRivalOuttaTheWay2:
	step_right
	step_end