Crossroads_MapScriptHeader:
	db 2 ; scene scripts
	scene_script CrossroadsTrigger0
	scene_script CrossroadsTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, CrossroadsFlyPoint
	callback MAPCALLBACK_TILES, CrossroadsCallback

	db 5 ; warp events
	warp_event 30,  7, INN_1F, 1
	warp_event 31,  7, INN_1F, 2
	warp_event 28,  6, INN_1F, 18
	warp_event 23, 21, ROUTE_23_GATE, 1
	warp_event 24, 21, ROUTE_23_GATE, 2

	db 4 ; coord events
	coord_event 20,  9, 0, CrossroadsCutsceneStart1
	coord_event 20, 10, 0, CrossroadsCutsceneStart2
	coord_event 20, 11, 0, CrossroadsCutsceneStart3
	coord_event 20, 12, 0, CrossroadsCutsceneStart4

	db 0 ; bg events

	db 15 ; object events
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE, 11, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE, 10, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_CROSSROADS_CUTSCENE_DONE
	person_event SPRITE_SNARE, 11, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_CROSSROADS_CUTSCENE_DONE
	person_event SPRITE_COLBY,  7, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_COLBY, 11, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_ALWAYS_SET
	person_event SPRITE_BACKPACK,  8, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, CrossroadsSign, -1
	person_event SPRITE_GENERAL_VARIABLE_1,  8, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CrossroadsUnfortunateCustomer, EVENT_CROSSROADS_UNFORTUNATE_CUSTOMER
	person_event SPRITE_SNARE, 21, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CrossroadsSnare1, EVENT_INN_SNARE_GONE
	person_event SPRITE_SNARE, 21, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CrossroadsSnare2, EVENT_INN_SNARE_GONE
	
	const_def 1 ; object constants
	const CROSSROADS_PLAYER_CUTSCENE_RED
	const CROSSROADS_PLAYER_CUTSCENE_BLUE
	const CROSSROADS_PLAYER_CUTSCENE_GREEN
	const CROSSROADS_PLAYER_CUTSCENE_BROWN
	const CROSSROADS_PLAYER_CUTSCENE_PURPLE
	const CROSSROADS_PLAYER_CUTSCENE_TEAL
	const CROSSROADS_PLAYER_CUTSCENE_PINK
	const CROSSROADS_SNARE_GRUNT_1
	const CROSSROADS_SNARE_GRUNT_2
	const CROSSROADS_COLBY
	const CROSSROADS_COLBY2

CrossroadsFlyPoint:
	setflag ENGINE_FLYPOINT_CROSSROADS
	return
	
CrossroadsTrigger0:
CrossroadsTrigger1:
	checkevent EVENT_CROSSROADS_UNFORTUNATE_CUSTOMER
	iffalse .skip
	checkevent EVENT_INN_1F_UNFORTUNATE_CUSTOMER_2
	iffalse .skip
	clearevent EVENT_CROSSROADS_UNFORTUNATE_CUSTOMER
.skip
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<DUSK
	iffalse .end
	changeblock $14, $06, $f0
	changeblock $16, $06, $b6
	changeblock $14, $08, $c3
	changeblock $16, $08, $b5
	changeblock -$2, $2, $f2
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock $14, $06, $ec
	changeblock $16, $06, $01
	changeblock $14, $08, $80
	changeblock $16, $08, $01
	changeblock -$2, $2, $f3
	clearflag ENGINE_STREETLIGHTS
	clearflag ENGINE_STREETLIGHTS2
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end

CrossroadsCallback:
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .playerfemale
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_POKEMANIAC
	jump .cont
.playerfemale
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_PONYTAIL
.cont
	checktime 1<<DUSK
	iftrue .dusk
	checktime 1<<NITE
	iffalse .notnite
.dusk
	changeblock $14, $06, $f0
	changeblock $16, $06, $b6
	changeblock $14, $08, $c3
	changeblock $16, $08, $b5
	changeblock -$2, $2, $f2
	setflag ENGINE_STREETLIGHTS
.notnite
	domaptrigger ROUTE_22_TUNNEL, $1
	return

CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle:
	farcall CheckCurrentMapXYTriggers
	ret nc
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapScriptHeaderBank]
	farjp CallScript
	
CrossroadsCutsceneStart1:
	special Special_StopRunning
	playmusic MUSIC_SNARE_THEME
	applymovement PLAYER, Movement_CrossroadsCutsceneStart1
	moveperson CROSSROADS_PLAYER_CUTSCENE_RED, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_BLUE, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_GREEN, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_BROWN, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_PURPLE, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_TEAL, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_PINK, 23, 10
	scall CrossroadsCutscene1
	applymovement PLAYER, Movement_CrossroadsCutsceneCameraPan1
	jump CrossroadsCutscene2
	
CrossroadsCutsceneStart2:
	special Special_StopRunning
	playmusic MUSIC_SNARE_THEME
	applymovement PLAYER, Movement_CrossroadsCutsceneStart2
	moveperson CROSSROADS_PLAYER_CUTSCENE_RED, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_BLUE, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_GREEN, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_BROWN, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_PURPLE, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_TEAL, 23, 10
	moveperson CROSSROADS_PLAYER_CUTSCENE_PINK, 23, 10
	scall CrossroadsCutscene1
	applymovement PLAYER, Movement_CrossroadsCutsceneCameraPan1
	jump CrossroadsCutscene2
	
CrossroadsCutsceneStart3:
	special Special_StopRunning
	playmusic MUSIC_SNARE_THEME
	applymovement PLAYER, Movement_CrossroadsCutsceneStart2
	moveperson CROSSROADS_PLAYER_CUTSCENE_RED, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_BLUE, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_GREEN, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_BROWN, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_PURPLE, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_TEAL, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_PINK, 23, 11
	scall CrossroadsCutscene1
	applymovement PLAYER, Movement_CrossroadsCutsceneCameraPan2
	jump CrossroadsCutscene2
	
CrossroadsCutsceneStart4:
	special Special_StopRunning
	playmusic MUSIC_SNARE_THEME
	applymovement PLAYER, Movement_CrossroadsCutsceneStart3
	moveperson CROSSROADS_PLAYER_CUTSCENE_RED, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_BLUE, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_GREEN, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_BROWN, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_PURPLE, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_TEAL, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_PINK, 23, 1
	scall CrossroadsCutscene1
	applymovement PLAYER, Movement_CrossroadsCutsceneCameraPan2
	jump CrossroadsCutscene2
	
CrossroadsCutscene1:
	pause 40
	copybytetovar wPlayerPalette
    if_equal 0, .red
    if_equal 1, .blue
    if_equal 2, .green
	if_equal 3, .brown
	if_equal 4, .purple
	if_equal 5, .teal
	if_equal 6, .pink
.red:	
	appear CROSSROADS_PLAYER_CUTSCENE_RED
	jump .cont
.blue
	appear CROSSROADS_PLAYER_CUTSCENE_BLUE
	jump .cont
.green
	appear CROSSROADS_PLAYER_CUTSCENE_GREEN
	jump .cont
.brown
	appear CROSSROADS_PLAYER_CUTSCENE_BROWN
	jump .cont
.purple
	appear CROSSROADS_PLAYER_CUTSCENE_PURPLE
	jump .cont
.teal
	appear CROSSROADS_PLAYER_CUTSCENE_TEAL
	jump .cont
.pink
	appear CROSSROADS_PLAYER_CUTSCENE_PINK
.cont
	pause 10
	applyonemovement PLAYER, hide_person
	spriteface CROSSROADS_SNARE_GRUNT_1, LEFT
	spriteface CROSSROADS_SNARE_GRUNT_2, LEFT
	pause 5
	applyonemovement CROSSROADS_SNARE_GRUNT_1, turn_step_left
	opentext
	writetext CrossroadsCutsceneGruntText1
	waitbutton
	closetext
	applymovement CROSSROADS_SNARE_GRUNT_1, Movement_CrossroadsSnareRunAway
	pause 5
	applyonemovement CROSSROADS_SNARE_GRUNT_2, turn_step_left
	opentext
	writetext CrossroadsCutsceneGruntText2
	waitbutton
	closetext
	applymovement CROSSROADS_SNARE_GRUNT_2, Movement_CrossroadsSnareRunAway
	opentext
	writetext CrossroadsCutsceneGruntText3
	waitbutton
	closetext
	disappear CROSSROADS_SNARE_GRUNT_1
	disappear CROSSROADS_SNARE_GRUNT_2
	clearevent EVENT_CROSSROADS_CUTSCENE_DONE
	end
CrossroadsCutscene2:
	pause 30
	special Special_FadeOutMusic
	pause 50
	moveperson CROSSROADS_PLAYER_CUTSCENE_RED, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_BLUE, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_GREEN, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_BROWN, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_PURPLE, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_TEAL, 23, 11
	moveperson CROSSROADS_PLAYER_CUTSCENE_PINK, 23, 11
	spriteface PLAYER, DOWN
	writecode VAR_MOVEMENT, $fe
	callasm MakePlayerColbyAsm
	writebyte (1 << 7) | (PAL_OW_GREEN << 4)
	special Special_SetPlayerPalette
	special MapCallbackSprites_LoadUsedSpritesGFX
	playmusic MUSIC_RIVAL_ENCOUNTER
	pause 30
	playsound SFX_EXIT_BUILDING
	appear CROSSROADS_COLBY
	applyonemovement CROSSROADS_COLBY, step_down
	pause 10
	applyonemovement PLAYER, show_person
	pause 5
	disappear CROSSROADS_COLBY
	pause 25
	applymovement PLAYER, Movement_CrossroadsColbyWalk1
	appear CROSSROADS_COLBY2
	pause 10
	applyonemovement PLAYER, hide_person
	applyonemovement PLAYER, slow_step_left
	spriteface PLAYER, RIGHT
	
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special Special_RestorePlayerPalette
	special MapCallbackSprites_LoadUsedSpritesGFX
	applyonemovement PLAYER, show_person
	pause 10
	opentext TEXTBOX_RIVAL
	disappear CROSSROADS_PLAYER_CUTSCENE_RED
	disappear CROSSROADS_PLAYER_CUTSCENE_BLUE
	disappear CROSSROADS_PLAYER_CUTSCENE_GREEN
	disappear CROSSROADS_PLAYER_CUTSCENE_BROWN
	disappear CROSSROADS_PLAYER_CUTSCENE_PURPLE
	disappear CROSSROADS_PLAYER_CUTSCENE_TEAL
	disappear CROSSROADS_PLAYER_CUTSCENE_PINK
	writetext CrossroadsCutsceneColbyText1
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
	winlosstext CrossroadsCutsceneColbyWinText, CrossroadsCutsceneColbyLoseText
	setlasttalked CROSSROADS_COLBY2
	loadtrainer RIVAL_S, RIVAL_S_1_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.chikorita
	winlosstext CrossroadsCutsceneColbyWinText, CrossroadsCutsceneColbyLoseText
	setlasttalked CROSSROADS_COLBY2
	loadtrainer RIVAL_S, RIVAL_S_1_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.cyndaquil
	winlosstext CrossroadsCutsceneColbyWinText, CrossroadsCutsceneColbyLoseText
	setlasttalked CROSSROADS_COLBY2
	loadtrainer RIVAL_S, RIVAL_S_1_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.squirtle
	winlosstext CrossroadsCutsceneColbyWinText, CrossroadsCutsceneColbyLoseText
	setlasttalked CROSSROADS_COLBY2
	loadtrainer RIVAL_S, RIVAL_S_1_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.bulbasaur
	winlosstext CrossroadsCutsceneColbyWinText, CrossroadsCutsceneColbyLoseText
	setlasttalked CROSSROADS_COLBY2
	loadtrainer RIVAL_S, RIVAL_S_1_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.charmander
	winlosstext CrossroadsCutsceneColbyWinText, CrossroadsCutsceneColbyLoseText
	setlasttalked CROSSROADS_COLBY2
	loadtrainer RIVAL_S, RIVAL_S_1_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext TEXTBOX_RIVAL
	writetext CrossroadsCutsceneColbyText2
	waitbutton
	closetext
	applymovement CROSSROADS_COLBY2, Movement_CrossroadsColbyWalk2
	disappear CROSSROADS_COLBY2
	special Special_FadeOutMusic
	pause 15
	setevent EVENT_CROSSROADS_CUTSCENE_DONE
	setevent EVENT_ROUTE_11_BRIDGE_BUILT
	clearevent EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	playnewmapmusic
	dotrigger $1
	end
	
MakePlayerColbyAsm:
	ld a, PLAYER_COLBY
	ld [wPlayerState], a
	ret
	
CrossroadsSnare1:
	jumptext CrossroadsSnare1Text
	
CrossroadsSnare2:
	jumptext CrossroadsSnare2Text
	
CrossroadsSnare1Text:
CrossroadsSnare2Text:
	text "Nope. <WAIT_S>"
	line "Not this way!"
	done
	
CrossroadsUnfortunateCustomer:
	jumptextfaceplayer CrossroadsUnfortunateCustomerText
	
CrossroadsUnfortunateCustomerText:
	text "Someone took my"
	line "spot at the INN."
	
	para "I had already paid"
	line "and everything!"
	
	para "Can you believe"
	line "that?"
	done
	
CrossroadsSign:
	jumptext CrossroadsSignText
	
CrossroadsSignText:
	text "NORTH: ROUTE 11"
	line "EVENTIDE VILLAGE"
	
	para "SOUTH: ROUTE 23"
	line "KOMORE VILLAGE"
	
	para "EAST: UNFINISHED"
	
	para "WEST: ROUTE 22"
	line "DUSK TURNPIKE"
	done
	
CrossroadsCutsceneGruntText1:
	text "You really shoulda"
	line "left us alone."
	
	para "Now our boss is"
	line "gonna come take"
	cont "you down!"
	done
	
CrossroadsCutsceneGruntText2:
	text "Our boss is some"
	line "kinda whizkid or"
	cont "something."
	
	para "They say he's never"
	line "lost even a single"
	cont "time!"
	done
	
CrossroadsCutsceneGruntText3:
	text "BOSS!"
	
	para "We got trouble!"
	done
	
CrossroadsCutsceneColbyText1:
	text "What's up,"
	line "<PLAYER>?"
	
	para "Surprised to see"
	line "me?"
	
	para "Yeah, that's right,<WAIT_S>"
	line "I'm with TEAM SNARE"
	cont "now."
	
	para "Our leader sees my"
	line "true potential."
	
	para "He says I'm a"
	line "prodigy."
	
	para "He says that my"
	line "losing to you must"
	cont "be foul play."
	
	para "So, I'm done"
	line "playing fair!"
	
	para "I'll prove to him"
	line "I have what it"
	cont "takes!"
	
	para "I'll prove it to"
	line "both of them…"
	done
	
CrossroadsCutsceneColbyText2:
	text "Whatever!"
	
	para "I expected as"
	line "much!"
	
	para "We're only just"
	line "getting started"
	cont "here!"
	
	para "Our plans are in"
	line "motion, and you"
	cont "aren't going to"
	cont "stop them."
	
	para "I hope you enjoyed"
	line "that victory,"
	cont "<PLAYER>."
	
	para "Soon you're going"
	line "to get what's"
	cont "coming to you…"
	done
	
CrossroadsCutsceneColbyWinText:
	text "…"
	done
	
CrossroadsCutsceneColbyLoseText:
	text "Yes!"
	
	para "Finally!"
	done
	
Movement_CrossroadsCutsceneStart1:
	step_down
	step_right
	step_right
	step_right
	step_end
	
Movement_CrossroadsCutsceneStart2:
	step_right
	step_right
	step_right
	step_end
	
Movement_CrossroadsCutsceneStart3:
	step_up
	step_right
	step_right
	step_right
	step_end
	
Movement_CrossroadsSnareRunAway:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end
	
Movement_CrossroadsCutsceneCameraPan1:
	slow_step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	slow_step_right
	slow_step_up
	slow_step_up
	step_end
	
Movement_CrossroadsCutsceneCameraPan2:
	slow_step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
	
Movement_CrossroadsColbyWalk1:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

Movement_CrossroadsColbyWalk2:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end