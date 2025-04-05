Route28_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, Route28RocksCallback
	callback MAPCALLBACK_TILES, Route28Callback

	db 4 ; warp events
	warp_event 20, 16, ROUTE_1, 1
	warp_event 21, 17, ROUTE_1, 1
	warp_event 33, 57, ROUTE_28_OTTOS_TENT, 1
	warp_event 18, 65, GREEN_GROTTO_1F, 1

	db 2 ; coord events
	coord_event 28, 55, 0, Route28ColbyStopsYouL
	coord_event 29, 55, 0, Route28ColbyStopsYou

	db 7 ; bg events
	signpost 43, 27, SIGNPOST_ITEM + MAX_REVIVE, EVENT_ROUTE_28_HIDDEN_ITEM_1
	signpost 20, 33, SIGNPOST_ITEM + ELIXIR, EVENT_ROUTE_28_HIDDEN_ITEM_2
	signpost 39, 33, SIGNPOST_ITEM + MAX_POTION, EVENT_ROUTE_28_HIDDEN_ITEM_3
	signpost 14, 12, SIGNPOST_ITEM + REVIVE, EVENT_ROUTE_28_HIDDEN_ITEM_4
	signpost 56, 35, SIGNPOST_ITEM + ENERGY_ROOT, EVENT_ROUTE_28_HIDDEN_ITEM_5
	signpost 13, 31, SIGNPOST_READ, Route28Sign
	signpost 62, 30, SIGNPOST_READ, GreenGrottoSign

	db 19 ; object events
	person_event SPRITE_PICNICKER, 20, 26, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route28Trainer1, -1
	person_event SPRITE_SUPER_NERD, 37, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, Route28Trainer2, -1
	person_event SPRITE_ROCKER, 37, 22, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, Route28Trainer3, -1
	person_event SPRITE_SCIENTIST, 26, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route28Trainer4, -1
	person_event SPRITE_SCIENTIST, 28,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route28Trainer5, -1
	person_event SPRITE_GRANNY, 49, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route28Trainer6, -1
	person_event SPRITE_POKEFAN_M, 16, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route28StrengthMan, -1
	strengthboulder_event 22, 70, EVENT_ROUTE_28_BOULDER_1
	strengthboulder_event 23, 70, EVENT_ROUTE_28_BOULDER_2
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -5, -4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route28StrengthMansBoulder, -1
	person_event SPRITE_COLBY, -5, -4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SNARE, -5, -4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SNARE, -5, -4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BIRD_KEEPER,  6, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route28NPC1, -1
	person_event SPRITE_REDS_MOM, 50, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route28NPC2, -1
	itemball_event 33, 38, REVIVE, 1, EVENT_ROUTE_28_POKEBALL_1
	itemball_event 26, 43, MAX_REVIVE, 1, EVENT_ROUTE_28_POKEBALL_2
	fruittree_event 18, 55, FRUITTREE_ROUTE_28_1, PECHA_BERRY
	fruittree_event 20, 55, FRUITTREE_ROUTE_28_2, FIGY_BERRY
	
	
	const_def 1 ; object constants
	const ROUTE_28_TRAINER_1
	const ROUTE_28_TRAINER_2
	const ROUTE_28_TRAINER_3
	const ROUTE_28_TRAINER_4
	const ROUTE_28_TRAINER_5
	const ROUTE_28_TRAINER_6
	const ROUTE_28_PUSHER
	const ROUTE_28_BOULDER_1
	const ROUTE_28_BOULDER_2
	const ROUTE_28_BOULDER_DUMMY
	const ROUTE_28_COLBY
	const ROUTE_28_SNARE_1
	const ROUTE_28_SNARE_2
	
Route28Sign:
	jumptext Route28SignText
	
Route28SignText:
	text "ROUTE 28"
	
	para "NORTH:"
	line "BRIGHTBURG"
	
	para "SOUTHWEST:"
	line "OBSCURA CITY"
	done
	
GreenGrottoSign:
	jumptext GreenGrottoSignText
	
GreenGrottoSignText:
	text "GREEN GROTTO"
	line "ahead."
	
	para "Beware falling"
	line "rocks!"
	done
	
Route28NPC1:
	jumptextfaceplayer Route28NPC1Text
	
Route28NPC1Text:
	text "The nurse at the"
	line "#MON CENTER"
	cont "refused to heal"
	cont "my #MON!"
	
	para "I've never heard"
	line "of that!"
	
	para "Guess I gotta"
	line "keep moving!"
	done
	
Route28NPC2:
	checkevent EVENT_ROUTE_28_CUTSCENE_DONE
	iftrue .done_colby
	setevent EVENT_ROUTE_28_TALKED_TO_LADY
	jumptextfaceplayer Route28NPC2Text1
.done_colby
	checkevent EVENT_ROUTE_28_TALKED_TO_LADY
	iftrue .talked_to_lady
	jumptextfaceplayer Route28NPC2Text2
.talked_to_lady
	jumptextfaceplayer Route28NPC2Text3
	
Route28NPC2Text1:
	text "I saw a kid with"
	line "spikey hair go"
	cont "into that tent"
	cont "up ahead."
	
	para "He looked like"
	line "he was with TEAM"
	cont "SNARE!"
	
	para "I'd prepare for"
	line "trouble right now"
	cont "if you're going"
	cont "any further…"
	
	para "Don't say I didn't"
	line "warn you!"
	done
	
Route28NPC2Text2:
	text "That TEAM SNARE"
	line "is nothing but"
	cont "trouble."
	done
	
Route28NPC2Text3:
	text "I told you!"
	
	para "That TEAM SNARE"
	line "is nothing but"
	cont "trouble."
	
	para "Did you listen to"
	line "my advice and"
	cont "prepare?"
	done
	
Route28ColbyStopsYouL:
	setevent EVENT_ROUTE_28_COLBY_EVENT_LEFT
; fallthrough
Route28ColbyStopsYou:
	special Special_StopRunning
	applyonemovement PLAYER, remove_fixed_facing
	special Special_FadeOutMusic
	pause 30
	disappear ROUTE_28_COLBY
	disappear ROUTE_28_SNARE_1
	disappear ROUTE_28_SNARE_2
	moveperson ROUTE_28_COLBY, 33, 57
	moveperson ROUTE_28_SNARE_1, 33, 57
	moveperson ROUTE_28_SNARE_2, 33, 57
	spriteface PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	appear ROUTE_28_SNARE_1
	applymovement ROUTE_28_SNARE_1, Movement_Route28_Snare_1
	spriteface ROUTE_28_SNARE_1, RIGHT
	playsound SFX_EXIT_BUILDING
	appear ROUTE_28_SNARE_2
	applymovement ROUTE_28_SNARE_2, Movement_Route28_Snare_2
	spriteface ROUTE_28_SNARE_2, LEFT
	pause 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	playsound SFX_EXIT_BUILDING
	appear ROUTE_28_COLBY
	applymovement ROUTE_28_COLBY, Movement_Route28_Colby_1
	applymovement ROUTE_28_SNARE_2, Movement_Route28_Snare_3
	follow ROUTE_28_SNARE_2, ROUTE_28_SNARE_1
	applymovement ROUTE_28_SNARE_2, Movement_Route28_Snare_4
	stopfollow
	disappear ROUTE_28_SNARE_1
	disappear ROUTE_28_SNARE_2
	checkevent EVENT_ROUTE_28_COLBY_EVENT_LEFT
	iftrue .player_left
	applymovement ROUTE_28_COLBY, Movement_Route28_Colby_2
	jump .cont
.player_left
	applymovement ROUTE_28_COLBY, Movement_Route28_Colby_2_Left
.cont
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_28_COLBY, 15
	applymovement ROUTE_28_COLBY, Movement_Route28_Colby_3
	opentext
	writetext Route28ColbyText1
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
	winlosstext Route28ColbyWinText, Route28ColbyLoseText
	setlasttalked ROUTE_28_COLBY
	loadtrainer RIVAL_S, RIVAL_S_2_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.chikorita
	winlosstext Route28ColbyWinText, Route28ColbyLoseText
	setlasttalked ROUTE_28_COLBY
	loadtrainer RIVAL_S, RIVAL_S_2_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.cyndaquil
	winlosstext Route28ColbyWinText, Route28ColbyLoseText
	setlasttalked ROUTE_28_COLBY
	loadtrainer RIVAL_S, RIVAL_S_2_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.squirtle
	winlosstext Route28ColbyWinText, Route28ColbyLoseText
	setlasttalked ROUTE_28_COLBY
	loadtrainer RIVAL_S, RIVAL_S_2_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.bulbasaur
	winlosstext Route28ColbyWinText, Route28ColbyLoseText
	setlasttalked ROUTE_28_COLBY
	loadtrainer RIVAL_S, RIVAL_S_2_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
.charmander
	winlosstext Route28ColbyWinText, Route28ColbyLoseText
	setlasttalked ROUTE_28_COLBY
	loadtrainer RIVAL_S, RIVAL_S_2_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route28ColbyText2
	waitbutton
	closetext
	pause 5
	playsound SFX_CALL
	waitsfx
	pause 20
	playsound SFX_CALL
	waitsfx
	pause 20
	playsound SFX_CALL
	pause 2
	applyonemovement ROUTE_28_COLBY, turn_step_down
	applyonemovement ROUTE_28_COLBY, remove_fixed_facing
	playsound SFX_TALLY
	opentext
	writetext Route28ColbyText3
	waitbutton
	closetext
	pause 5
	applyonemovement ROUTE_28_COLBY, turn_step_up
	opentext
	writetext Route28ColbyText4
	waitbutton
	closetext
	applymovement ROUTE_28_COLBY, Movement_Route28_Colby_4
	disappear ROUTE_28_COLBY
	special Special_FadeOutMusic
	pause 15
	setevent EVENT_ROUTE_28_CUTSCENE_DONE
	setevent EVENT_OTTO_TALKS_ABOUT_RIVAL
	playmapmusic
	dotrigger $1
	end
;	disappear ROUTE_28_SNARE_1
;	disappear ROUTE_28_SNARE_2
	end
	
Route28ColbyText1:
	text "You."
	
	para "I should've known"
	line "you'd show up at"
	cont "some point."
	
	para "I'm kinda busy"
	line "at the moment."
	
	para "But you don't care,"
	line "do you?"
	
	para "You so-called"
	line "goody-goody!"
	
	para "You might have"
	line "everyone else"
	cont "fooled, but not"
	cont "me!"
	
	para "I can see right"
	line "through your"
	cont "charade."
	
	para "…"
	
	para "I'm already behind"
	line "schedule, but I"
	cont "don't even care."
	
	para "Let's do this!"
	done
	
Route28ColbyText2:
	text "Argh!"
	
	para "You make me so"
	line "mad!"
	
	para "Someone like you"
	line "beating someone"
	cont "like me…"
	
	para "It's not fair!"
	
	para "I can't wait to"
	line "bring you down a"
	cont "peg or two."
	
	para "And I'll do it"
	line "by any means"
	cont "necessary."
	done
	
Route28ColbyText3:
	text "What?"
	
	para "Yeah, I know."
	
	para "No, we're still"
	line "good to go."
	
	para "I'm coming right"
	line "now, so get ready"
	cont "to get started."
	done
	
Route28ColbyText4:
	text "I'm gonna give you"
	line "a taste of your"
	cont "own medicine soon"
	cont "enough."
	
	para "Just try and stop"
	line "me, <PLAYER>."
	done
	
Route28ColbyWinText:
	text "Tch!"
	
	para "Typical…"
	done
	
Route28ColbyLoseText:
	text "Yes!"
	
	para "Finally!"
	done
	
Movement_Route28_Snare_1:
	step_down
	step_left
	step_end
	
Movement_Route28_Snare_2:
	step_down
	step_right
	step_end
	
Movement_Route28_Snare_3:
	step_down
	step_left
	step_left
	step_left
	step_end
	
Movement_Route28_Snare_4:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
Movement_Route28_Colby_1:
	step_down
	step_sleep 60
	turn_step_left
	step_sleep 20
	turn_step_right
	step_sleep 20
	turn_step_down
	step_sleep 20
	step_end
	
Movement_Route28_Colby_2_Left:
	step_left
; fallthrough
Movement_Route28_Colby_2:
	step_left
	step_left
	step_left
	step_left
	step_sleep 10
	turn_step_down
	step_sleep 30
	turn_step_up
	step_sleep 30
	turn_step_down
	step_sleep 10
	turn_step_up
	step_end
	
Movement_Route28_Colby_3:
	step_up
	step_up
	step_end
	
Movement_Route28_Colby_4:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
Route28Callback:
	checkevent EVENT_ROUTE_28_BOULDER_TOP
	iftrue .top
	checkevent EVENT_ROUTE_28_BOULDER_BOTTOM
	iftrue .bottom
.end
	return
.top
	changeblock 20, 16, 59
	moveperson ROUTE_28_BOULDER_DUMMY, 20, 16
	return
.bottom
	changeblock 20, 16, 59
	moveperson ROUTE_28_BOULDER_DUMMY, 21, 17
	return
	
Route28RocksCallback:
	writecmdqueue .BoulderCmdQueue
	return

.BoulderCmdQueue:
	dbw CMDQUEUE_STONETABLE, .BoulderTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.BoulderTable:
	stonetable 1, ROUTE_28_BOULDER_1, .Boulder_1_T
	stonetable 1, ROUTE_28_BOULDER_2, .Boulder_2_T
	stonetable 2, ROUTE_28_BOULDER_1, .Boulder_1_B
	stonetable 2, ROUTE_28_BOULDER_2, .Boulder_2_B
	db -1 ; end

.Boulder_1_T:
	changeblock 20, 16, 59
	disappear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_TOP
	setevent EVENT_ROUTE_28_BOULDER_1
	moveperson ROUTE_28_BOULDER_DUMMY, 20, 16
	appear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_PUSHED
	refreshscreen
	disappear ROUTE_28_BOULDER_1
	closetext
	end
	
.Boulder_2_T:
	changeblock 20, 16, 59
	disappear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_TOP
	setevent EVENT_ROUTE_28_BOULDER_2
	moveperson ROUTE_28_BOULDER_DUMMY, 20, 16
	appear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_PUSHED
	refreshscreen
	disappear ROUTE_28_BOULDER_2
	closetext
	end
	
.Boulder_1_B:
	changeblock 20, 16, 59
	disappear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_BOTTOM
	setevent EVENT_ROUTE_28_BOULDER_1
	moveperson ROUTE_28_BOULDER_DUMMY, 21, 17
	appear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_PUSHED
	refreshscreen
	disappear ROUTE_28_BOULDER_1
	closetext
	end
	
.Boulder_2_B:
	changeblock 20, 16, 59
	disappear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_BOTTOM
	setevent EVENT_ROUTE_28_BOULDER_2
	moveperson ROUTE_28_BOULDER_DUMMY, 21, 17
	appear ROUTE_28_BOULDER_DUMMY
	setevent EVENT_ROUTE_28_BOULDER_PUSHED
	refreshscreen
	disappear ROUTE_28_BOULDER_2
	closetext
	end
	
Route28BoulderClearCmdQueue:
	xor a
	ld [wCmdQueue], a
	ret
	
Route28StrengthMan:
	faceplayer
	checkevent EVENT_ROUTE_28_BOULDER_PUSHED
	iftrue .done
	jumptextfaceplayer Route28StrengthManText
.done
	opentext
	checktmhm TM_SELFDESTRUCT
	iftrue .end
	writetext Route28StrengthManText2
	waitbutton
	writetext Route28StrengthManText3
	playmusic MUSIC_NONE
	playsound SFX_ITEM_FAKE
	pause 45
	writetext Route28StrengthManText4
	buttonsound
	farwritetext StdBlankText
	pause 6
	special Special_DotDotDot
	pause 40
.loop
	writetext Route28StrengthManText6
	waitbutton
	closetext
	callasm Route28WalkAwayAsm
	if_equal 1, .down
	if_equal 2, .left
	playsound SFX_READ_TEXT
	opentext
	jump .loop
.down
	applyonemovement PLAYER, turn_step_down
	jump .cont
.left
	applyonemovement PLAYER, turn_step_left
.cont
	playmusic MUSIC_ROUTE_28
	opentext
	writetext Route28StrengthManText7
	waitbutton
	closetext
	pause 5
	callasm Route28TurnAsm
	if_equal 6, .you_are_up
	spriteface PLAYER, UP
	jump .cont2
.you_are_up
	spriteface PLAYER, RIGHT
.cont2
	pause 10
	opentext
	writetext Route28StrengthManText8
	waitbutton
	verbosegivetmhm TM_SELFDESTRUCT
.end
	writetext Route28StrengthManText9
	waitbutton
	closetext
	end
	
Route28TurnAsm:
	ld a, [wYCoord]
	cp $10
	ret nz
	ld a, 6
	ld [wScriptVar], a
	ret
	
Route28WalkAwayAsm:
.loop
	call DelayFrame
	call GetJoypad
	ld a, [hJoyPressed]
	cp D_DOWN
	jr z, .down
	cp D_LEFT
	jr z, .left
	cp A_BUTTON
	jr z, .A
	call RTC
	jr .loop
.down
	ld a, 1
	ld [wScriptVar], a
	ret
.left
	ld a, 2
	ld [wScriptVar], a
	ret
.A
	ld a, 3
	ld [wScriptVar], a
	ret
	
Route28TextScrollAsm1:
	ld hl, wOptions1
	ld a, [hl]
	ld [wPlaceBallsX], a
	set NO_TEXT_SCROLL, [hl]
	ret
	
Route28TextScrollAsm2:
	ld a, [wPlaceBallsX]
	ld [wOptions1], a
	xor a
	ld [wPlaceBallsX], a
	ret
	
Route28StrengthManText:
	text "They call me"
	line "MR. PUSHER!"
	
	para "Think you can push"
	line "as good as me?"
	
	para "Push a boulder all"
	line "the way to me and"
	cont "I'll acknowledge"
	cont "you as a pusher!"
	
	para "Who knows?"
	
	para "There might even"
	line "be a reward in it"
	cont "for you!"
	done
	
Route28StrengthManText2:
	text "Wow!"
	
	para "You pushed that"
	line "all the way here?"
	
	para "It's huge!"
	
	para "That takes real"
	line "dedication!"
	
	para "I officially"
	line "recognize you as"
	cont "a true pusher!"
	
	para "Here, <WAIT_S>take this"
	line "as a reward."
	
	para "It'll let your"
	line "#MON push heavy"
	cont "boulders."
	done
	
Route28StrengthManText3:
	text "<PLAYER> received"
	line "HM04."
	done
	
Route28StrengthManText4:
	text "Huh?"
	
	para "You already have"
	line "HM04 STRENGTH?"
	done
	
Route28StrengthManText5_1:
	text "…"
	done
	
Route28StrengthManText5_2:
	text "… …"
	done
	
Route28StrengthManText5_3:
	text "… … …"
	done
	
Route28StrengthManText6:
	text "Oops."
	done
	
Route28StrengthManText7:
	text "Wait up, kid!"
	done
	
Route28StrengthManText8:
	text "I'm just kidding…"
	
	para "You should have"
	line "seen the look on"
	cont "your face!"
	
	para "You looked like"
	line "you were about to"
	cont "explode!"
	
	para "Here, <WAIT_S>take this"
	line "instead."
	done
	
Route28StrengthManText9:
	text "That TM contains"
	line "SELFDESTRUCT."
	
	para "That move deals"
	line "massive damage,"
	cont "but makes the user"
	cont "faint too."
	
	para "…<WAIT_L>Sorry about that"
	line "earlier."
	
	para "It was a little"
	line "funny though, you"
	cont "gotta admit!"
	done
	
Route28StrengthMansBoulder:
	jumptext Route28StrengthMansBoulderText
	
Route28StrengthMansBoulderText:
	text "MR. PUSHER's"
	line "beloved boulder."
	done
	
Route28Trainer1:
	checkevent EVENT_BEAT_ROUTE_28_TRAINER_1
	iftrue .beat
	opentext
	writetext Route28Trainer1SeenText1
	waitbutton
	closetext
	pause 10
	special SaveMusic
	playmusic MUSIC_LASS_ENCOUNTER
	faceplayer
	opentext
	writetext Route28Trainer1SeenText2
	waitbutton
	closetext
	waitsfx
	winlosstext Route28Trainer1BeatenText, 0
	loadtrainer PICNICKER, SANDY
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_ROUTE_28_TRAINER_1
	end
.beat
	jumptextfaceplayer Route28Trainer1NormalText

Route28Trainer1NormalText:
	text "I'm talking to my"
	line "friend in VIOLET"
	cont "CITY in the JOHTO"
	cont "REGION."
	done

Route28Trainer1SeenText1:
	text "Uh-huh. Yeah, and"
	line "you know…"
	done
	
Route28Trainer1SeenText2:
	text "Pardon? Battle?"
	line "I'm on the phone."

	para "Oh, all right. But"
	line "make it fast."
	done

Route28Trainer1BeatenText:
	text "Oh! I've got to"
	line "relieve my anger!"
	done
	
Route28Trainer2:
	generictrainer SUPER_NERD, MARIO, EVENT_BEAT_ROUTE_28_TRAINER_2, .SeenText, .BeatenText

	text "Neh he he…"
	
	para "You'll get what's"
	line "coming one day."
	done

.SeenText:
	text "Neh he he…"
	
	para "Feeling tired?"
	done

.BeatenText:
	text "Neh he he…"
	done
	
Route28Trainer3:
	generictrainer GUITARIST, VINNY, EVENT_BEAT_ROUTE_28_TRAINER_3, .SeenText, .BeatenText

	text "I'm gonna start"
	line "weeping too after"
	cont "that…"
	done

.SeenText:
	text "I broke a guitar"
	line "guitar string!"
	
	para "We'll battle while"
	line "my guitar gently"
	cont "weeps."
	done

.BeatenText:
	text "No good!"
	done
	
Route28Trainer4:
	generictrainer SCIENTIST, HAROLD, EVENT_BEAT_ROUTE_28_TRAINER_4, .SeenText, .BeatenText

	text "BRIGHTBURG…"
	
	para "What a fascinating"
	line "place…"
	done

.SeenText:
	text "Recently strange"
	line "things have been"
	cont "happening in"
	cont "BRIGHTBURG."
	
	para "Is it sickenss?"
	line "Mass hysteria?"
	
	para "I came to"
	line "investigate."
	done

.BeatenText:
	text "I wonder…"
	done
	
Route28Trainer5:
	generictrainer SCIENTIST, SAL, EVENT_BEAT_ROUTE_28_TRAINER_5, .SeenText, .BeatenText

	text "Your #MON…"
	
	para"What perfect"
	line "specimens!"
	done

.SeenText:
	text "Hold it!"
	
	para "Your #MON…"
	
	para "Let me observe"
	line "them!"
	done

.BeatenText:
	text "Aha!"
	para "Thank you!"
	done
	
Route28Trainer6:
	generictrainer LADY, JUDY, EVENT_BEAT_ROUTE_28_TRAINER_6, .SeenText, .BeatenText

	text "MR. PUSHER…"
	
	para "What a strapping"
	line "man he is!"
	
	para "Why, if I were"
	line "thirty years"
	cont "younger…"
	done

.SeenText:
	text "Are you going to"
	line "see MR. PUSHER?"
	
	para "You are,"
	line "aren't you?"
	done

.BeatenText:
	text "Ahh…"
	done
	