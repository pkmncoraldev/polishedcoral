Route28_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, Route28RocksCallback
	callback MAPCALLBACK_TILES, Route28Callback

	db 4 ; warp events
	warp_event 20, 16, ROUTE_1, 1
	warp_event 21, 17, ROUTE_1, 1
	warp_event 35, 55, ROUTE_1, 1
	warp_event 18, 65, GREEN_GROTTO_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_PICNICKER, 20, 26, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route28Trainer1, -1
	person_event SPRITE_POKEFAN_M, 16, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route28StrengthMan, -1
	strengthboulder_event 22, 70, EVENT_ROUTE_28_BOULDER_1
	strengthboulder_event 23, 70, EVENT_ROUTE_28_BOULDER_2
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route28StrengthMansBoulder, -1

	
	
	const_def 1 ; object constants
	const ROUTE_28_TRAINER_1
	const ROUTE_28_PUSHER
	const ROUTE_28_BOULDER_1
	const ROUTE_28_BOULDER_2
	const ROUTE_28_BOULDER_DUMMY
	
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
	checktmhm TM_BULK_UP
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
	verbosegivetmhm TM_BULK_UP
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
	
	para "Here, <WAIT_S>take this"
	line "instead."
	done
	
Route28StrengthManText9:
	text "That TM contains"
	line "BULK UP."
	
	para "Your #MON will"
	line "beef up and boost"
	cont "their ATTACK and"
	cont "DEFENSE stats."
	
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
	loadtrainer PICNICKER, LES
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
	