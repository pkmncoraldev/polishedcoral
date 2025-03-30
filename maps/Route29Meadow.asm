Route29Meadow_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route29MeadowCallback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, 10, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route29Mina, -1
	person_event SPRITE_DISGUISEMAN,  8, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route29Easel, -1
	person_event SPRITE_LEAVES,  8, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route29Easel, -1


	const_def 1 ; object constants
	const ROUTE_29_MINA

Route29MeadowCallback:
	checkevent EVENT_DONE_ROUTE_29_MINA
	iftrue .skip
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA_GROUND
	variablesprite SPRITE_DISGUISEMAN, SPRITE_VALVE_1
.skip
	return

Route29Mina:
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	jump .cont
.YouAreFacingDown
	applymovement PLAYER, Movement_Route29_Player1
	spriteface PLAYER, LEFT
.cont
	waitsfx
	special Special_FadeOutMusic
	playmusic MUSIC_MINA
	opentext
	writetext Route29MinaText1
	waitbutton
	closetext
	pause 50
	spriteface ROUTE_29_MINA, DOWN
	pause 10
	spriteface ROUTE_29_MINA, UP
	pause 3
	spriteface ROUTE_29_MINA, DOWN
	pause 3
	spriteface ROUTE_29_MINA, UP
	pause 3
	spriteface ROUTE_29_MINA, DOWN
	pause 20
	callasm Route29MinaIndoorPermsAsm1
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_29_MINA, 15
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA
	callasm Route29MinaIndoorPermsAsm2
	faceplayer
	playsound SFX_THROW_BALL
	applymovement ROUTE_29_MINA, Movement_Route29_Mina_jump
	opentext
	checktime 1<<NITE
	iftrue .nite
	writetext Route29MinaText2
	jump .cont2
.nite
	writetext Route29MinaText2_nite
.cont2
	waitbutton
	closetext
	pause 5
	spriteface ROUTE_29_MINA, DOWN
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA_GROUND
	pause 5
	checkcode VAR_FACING
	if_equal LEFT, .cont3
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	applymovement PLAYER, Movement_Route29_Player2
	jump .cont3
.YouAreFacingRight
	applymovement PLAYER, Movement_Route29_Player3
.cont3
	applyonemovement PLAYER, step_right
	pause 5
	callasm Route29PlayerLayDownAsm
	pause 25
	spriteface ROUTE_29_MINA, UP
	pause 25
	opentext
	writetext Route29MinaText3
	waitbutton
	closetext
	pause 80
	spriteface ROUTE_29_MINA, DOWN
	pause 20
	opentext
	writetext Route29MinaText4
	yesorno
	closetext
	pause 50
	opentext
	writetext Route29MinaText5
	playsound SFX_READ_TEXT
	writetext Route29MinaText6
	playsound SFX_READ_TEXT
	writetext Route29MinaText7
	playsound SFX_READ_TEXT
	writetext Route29MinaText8
	playsound SFX_READ_TEXT
	writetext Route29MinaText9
	playsound SFX_READ_TEXT
	writetext Route29MinaText10
	playsound SFX_READ_TEXT
	writetext Route29MinaText11
	playsound SFX_READ_TEXT
	writetext Route29MinaText12
	playsound SFX_READ_TEXT
	writetext Route29MinaText13
	playsound SFX_READ_TEXT
	writetext Route29MinaText14
	playsound SFX_READ_TEXT
	writetext Route29MinaText15
	playsound SFX_READ_TEXT
	writetext Route29MinaText16
	playsound SFX_READ_TEXT
	writetext Route29MinaText17
	playsound SFX_READ_TEXT
	writetext Route29MinaText18
	playsound SFX_READ_TEXT
	writetext Route29MinaText19
	playsound SFX_READ_TEXT
	writetext Route29MinaText20
	special FadeOutPalettesBlack
	closetext
	pause 40
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MINA
	variablesprite SPRITE_DISGUISEMAN, SPRITE_PAINTINGS
	disappear ROUTE_29_MINA
	moveperson ROUTE_29_MINA, $16, $09
	appear ROUTE_29_MINA
	spriteface ROUTE_29_MINA, UP
	opentext
	writetext Route29MinaDozeOffText
	waitbutton
	closetext
	pause 60
	special FadeInTextboxPalettes;FadeOutPalettesBlack
	pause 30
	playsound SFX_JUMP_OVER_LEDGE
	special Special_ForcePlayerStateNormal
	applyonemovement PLAYER, jump_in_place
	pause 10
	callasm Route29MinaIndoorPermsAsm1
	spriteface ROUTE_29_MINA, DOWN
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE_29_MINA, 15
	spriteface PLAYER, UP
	opentext
	writetext Route29MinaText21
	waitbutton
	closetext
	applyonemovement PLAYER, step_up
	follow ROUTE_29_MINA, PLAYER
	applyonemovement ROUTE_29_MINA, step_left
	stopfollow
	spriteface ROUTE_29_MINA, RIGHT
	spriteface PLAYER, UP
	pause 40
	opentext
	writetext Route29MinaText22
	spriteface ROUTE_29_MINA, DOWN
	farwritetext StdBlankText
	pause 6
	writetext Route29MinaText23
	waitbutton
	closetext
	pause 40
	spriteface ROUTE_29_MINA, RIGHT
	spriteface PLAYER, LEFT
	pause 20
	
	opentext
	writetext Route29MinaText24
	waitbutton
	closetext
	waitsfx
	winlosstext Route29MinaMinaWinText, 0
	setlasttalked ROUTE_29_MINA
	loadtrainer MINA, 2
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MINA
	opentext
	writetext Route29MinaText25
	waitbutton
	closetext
	follow PLAYER, ROUTE_29_MINA
	applyonemovement PLAYER, step_right
	stopfollow
	spriteface PLAYER, LEFT
	spriteface ROUTE_29_MINA, UP
	playsound SFX_UNKNOWN_61
	disappear 2
	pause 25
	playsound SFX_SWITCH_POCKETS
	disappear 3
	pause 25
	spriteface ROUTE_29_MINA, RIGHT
	pause 10
	opentext
	special Special_MinaGoodbye
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement ROUTE_29_MINA, Movement_Route29MinaLeave
	disappear ROUTE_29_MINA
	special Special_UpdatePalsInstant
	setevent EVENT_ROUTE_29_MINA_GONE
	setevent EVENT_DONE_ROUTE_29_MINA
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_29
	setflag ENGINE_MINA_ROUTE_29
	pause 10
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	end
	
Route29MinaIndoorPermsAsm1:
	ld a, 69
	ld [wPermission], a
	ret
	
Route29MinaIndoorPermsAsm2:
	ld a, 2
	ld [wPermission], a
	ret
	
Route29PlayerLayDownAsm:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_PHOTO_1
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Movement_Route29_Player1:
	step_right
	step_down
	step_end
	
Movement_Route29_Player3:
	step_down
	step_right
Movement_Route29_Player2:
	step_right
	step_up
	step_end
	
Movement_Route29_Mina_jump:
	fix_facing
	jump_in_place
	remove_fixed_facing
	step_end
	
Movement_Route29MinaLeave:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
Route29MinaText1:
	text "MINA: Y<WAIT_S>a<WAIT_S>a<WAIT_S>a<WAIT_S>a<WAIT_S>aawn…"
	done
	
Route29MinaText2:
	text "EEEEK!"
	
	para "<PLAYER>!"
	
	para "You scared the"
	line "heck outta me!"
	
	para "How long were you"
	line "standing there?"
	
	para "…<WAIT_L>That's kinda"
	line "weird, <PLAYER>…"
	
	para "…<WAIT_M>A<WAIT_S>a<WAIT_S>aaaanyway…"
	
	para "I was just lying"
	line "on the grass and"
	cont "watching the"
	cont "clouds."
	
	para "Why don't you join"
	line "me?"
	done
	
Route29MinaText2_nite:
	text "EEEEK!"
	
	para "<PLAYER>!"
	
	para "You scared the"
	line "heck outta me!"
	
	para "How long were you"
	line "standing there?"
	
	para "…<WAIT_L>That's kinda"
	line "weird, <PLAYER>…"
	
	para "…<WAIT_M>A<WAIT_S>a<WAIT_S>aaaanyway…"
	
	para "I was just lying"
	line "on the grass and"
	cont "watching the"
	cont "stars."
	
	para "Why don't you join"
	line "me?"
	done
	
Route29MinaText3:
	text "Sometimes I do"
	line "this when I can't"
	cont "decide what to"
	cont "paint."
	
	para "It helps clear my"
	line "head."
	done
	
Route29MinaText4:
	text "Ya know, <WAIT_S>every day"
	line "it feels like life"
	cont "moves faster and"
	cont "faster."
	
	para "It's nice to take"
	line "time to just slow"
	cont "down and relax."
	
	para "Don't you think,"
	line "<PLAYER>?"
	done
	
Route29MinaText5:
	text "You really don't"
	line "say much, do you?"
	
	para "You're the strong,"
	line "silent type, huh?"
	
	para "Not me!"
	
	para "You might not be"
	line "able to tell just"
	cont "by looking at me,"
	
	para "but I love"
	line "talking!"
	
	para "I'll just go on and"
	line "on if you let me!"
	
	para "Just talking about"
	line "anything that"
	cont "comes to mind.<WAIT_S>"
	done
	
Route29MinaText6:
	text "Oh! <WAIT_S>You see that"
	line "big fluffy cloud?<WAIT_M><WAIT_S>"
	done
	
Route29MinaText7:
	text "It looks just like"
	line "cotton candy!<WAIT_M><WAIT_S>"
	done
	
Route29MinaText8:
	text "I could really go"
	line "for some cotton@"
	sound_read
	text "<SCRL2>candy right now.<WAIT_M>"
	done
	
Route29MinaText9:
	text "Or maybe ice cream"
	line "would be better.<WAIT_M>"
	done
	
Route29MinaText10:
	text "Yeah, ice cream.<WAIT_S><WAIT_S>"
	line "With sprinkles!<WAIT_S><WAIT_S>"
	done
	
Route29MinaText11:
	text "Blue sprinkles!<WAIT_S><WAIT_S>"
	line "No, pink!<WAIT_S>@"
	sound_read
	text "<SCRL2>Pink is better!<WAIT_S>"
	done
	
Route29MinaText12:
	text "What's your"
	line "favorite color?<WAIT_S>"
	done
	
Route29MinaText13:
	text "Mine's pink, but it"
	line "used to be blue."
	done
	
Route29MinaText14:
	text "…Or was is green?"
	line "Yeah! It was!"
	done
	
Route29MinaText15:
	text "It was green, but"
	line "now it's pink."
	done
	
Route29MinaText16:
	text "The thing about a"
	line "favorite color is"
	done
	
Route29MinaText17:
	text "you usually don't"
	line "notice when it@"
	sound_read
	text "<SCRL2>changes."
	done
	
Route29MinaText18:
	text "I guess it's like"
	line "that with other@"
	sound_read
	text "<SCRL2>things."
	done
	
Route29MinaText19:
	text "Not just colors."
	done
	
Route29MinaText20:
	text "Blah blah blah"
	line "blah blah blah@"
	sound_read
	text "<SCRL2>blah blah blah@"
	sound_read
	text "<SCRL2>blah blah blah…"
	done
	
Route29MinaText21:
	text "Ah, <WAIT_S>you're awake!"
	
	para "You fell asleep"
	line "in the middle of"
	cont "our conversation."
	
	para "Rude!"
	
	para "But that's OK."
	
	para "Inspiration hit,"
	line "so I just let you"
	cont "sleep."
	
	para "Anyway, I just"
	line "finished up."
	
	para "Here, <WAIT_S>take a look!"
	done
	
Route29MinaText22:
	text "Well?"
	
	para "What do you think?"
	
	para "I guess I'll"
	line "call it:<WAIT_L>"
	done
	
Route29MinaText23:
	text "“Cotton in the"
	line "Sky”."
	done
	
Route29MinaText24:
	text "Anyway…"
	
	para "Now that you're"
	line "all rested up,"
	cont "how about a battle"
	cont "to commemorate the"
	cont "new painting?"
	
	para "Here we go!"
	done
	
Route29MinaText25:
	text "Darn!"
	
	para "I was hoping to"
	line "catch you off"
	cont "guard while you"
	cont "were still groggy…"
	
	para "You showed me,"
	line "though!"
	
	para "Anyway, I've been"
	line "laying around for"
	cont "long enough."
	
	para "I'll be on my way"
	line "now."
	done
	
Route29MinaMinaWinText:
	text "You aren't still"
	line "tired?"
	done
	
Route29MinaDozeOffText:
	text "<PLAYER> drifted off"
	line "while MINA kept"
	cont "blabbering on…"
	done
	
Route29Easel:
	jumptext Route29EaselText
	
Route29EaselText:
	text "MINA's easel."
	done