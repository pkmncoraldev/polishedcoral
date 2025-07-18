Route6South_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 56 ; warp events
	warp_event 15,  0, ROUTE_6_UNDERWATER, 19
	warp_event 16,  0, ROUTE_6_UNDERWATER, 20
	warp_event 17,  0, ROUTE_6_UNDERWATER, 21
	warp_event 18,  0, ROUTE_6_UNDERWATER, 22
	warp_event 19,  0, ROUTE_6_UNDERWATER, 23
	warp_event 20,  0, ROUTE_6_UNDERWATER, 24
	warp_event 21,  0, ROUTE_6_UNDERWATER, 25
	warp_event 22,  0, ROUTE_6_UNDERWATER, 26
	warp_event 15,  1, ROUTE_6_UNDERWATER, 27
	warp_event 16,  1, ROUTE_6_UNDERWATER, 28
	warp_event 17,  1, ROUTE_6_UNDERWATER, 29
	warp_event 18,  1, ROUTE_6_UNDERWATER, 30
	warp_event 19,  1, ROUTE_6_UNDERWATER, 31
	warp_event 20,  1, ROUTE_6_UNDERWATER, 32
	warp_event 21,  1, ROUTE_6_UNDERWATER, 33
	warp_event 22,  1, ROUTE_6_UNDERWATER, 34
	warp_event 15,  2, ROUTE_6_UNDERWATER, 35
	warp_event 16,  2, ROUTE_6_UNDERWATER, 36
	warp_event 17,  2, ROUTE_6_UNDERWATER, 37
	warp_event 18,  2, ROUTE_6_UNDERWATER, 38
	warp_event 19,  2, ROUTE_6_UNDERWATER, 39
	warp_event 20,  2, ROUTE_6_UNDERWATER, 40
	warp_event 15,  3, ROUTE_6_UNDERWATER, 41
	warp_event 16,  3, ROUTE_6_UNDERWATER, 42
	warp_event 17,  3, ROUTE_6_UNDERWATER, 43
	warp_event 18,  3, ROUTE_6_UNDERWATER, 44
	warp_event 19,  3, ROUTE_6_UNDERWATER, 45
	warp_event 20,  3, ROUTE_6_UNDERWATER, 46
	warp_event 16,  4, ROUTE_6_UNDERWATER, 47
	warp_event 17,  4, ROUTE_6_UNDERWATER, 48
	warp_event 18,  4, ROUTE_6_UNDERWATER, 49
	warp_event 19,  4, ROUTE_6_UNDERWATER, 50
	warp_event 18,  5, ROUTE_6_UNDERWATER, 51
	warp_event 19,  5, ROUTE_6_UNDERWATER, 52
	warp_event 18,  6, ROUTE_6_UNDERWATER, 53
	warp_event 19,  6, ROUTE_6_UNDERWATER, 54
	warp_event 24,  4, ROUTE_6_UNDERWATER, 55
	warp_event 25,  4, ROUTE_6_UNDERWATER, 56
	warp_event 24,  5, ROUTE_6_UNDERWATER, 57
	warp_event 25,  5, ROUTE_6_UNDERWATER, 58
	warp_event 14,  8, ROUTE_6_UNDERWATER, 59
	warp_event 15,  8, ROUTE_6_UNDERWATER, 60
	warp_event 14,  9, ROUTE_6_UNDERWATER, 61
	warp_event 15,  9, ROUTE_6_UNDERWATER, 62
	warp_event 58,  7, ROUTE_6_UNDERWATER, 63
	warp_event 59,  7, ROUTE_6_UNDERWATER, 64
	warp_event 57,  8, ROUTE_6_UNDERWATER, 65
	warp_event 58,  8, ROUTE_6_UNDERWATER, 66
	warp_event 59,  8, ROUTE_6_UNDERWATER, 67
	warp_event 60,  8, ROUTE_6_UNDERWATER, 68
	warp_event 57,  9, ROUTE_6_UNDERWATER, 69
	warp_event 58,  9, ROUTE_6_UNDERWATER, 70
	warp_event 59,  9, ROUTE_6_UNDERWATER, 71
	warp_event 60,  9, ROUTE_6_UNDERWATER, 72
	warp_event 58, 10, ROUTE_6_UNDERWATER, 73
	warp_event 59, 10, ROUTE_6_UNDERWATER, 74

	db 1 ; coord events
	coord_event 43,  4, 1, Route6SouthMinaScene

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_SWIMMER_GIRL,  6, 17, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6South_1, -1
	person_event SPRITE_SWIMMER_GUY,  7, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6South_2, -1
	person_event SPRITE_TUBER_WATER, 17, 13, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute6South_3, -1
	person_event SPRITE_MINA,  6, 43, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route6SouthMina, EVENT_ROUTE_6_MINA_GONE
	person_event SPRITE_PAINTINGS,  5, 43, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route6SouthEasel, EVENT_ROUTE_6_MINA_GONE
	person_event SPRITE_LEAVES,  5, 43, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route6SouthEasel, EVENT_ROUTE_6_MINA_GONE
	person_event SPRITE_INVISIBLE,  5, 43, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route6SouthEasel, EVENT_ROUTE_6_MINA_GONE
	
	
Route6SouthMina:
	jumptext Route6SouthMinaText
	
Route6SouthMinaText:
	text "She's totally"
	line "engrossed in"
	cont "painting."
	done
	
Route6SouthMinaScene:
	special Special_StopRunning
	applyonemovement PLAYER, turn_step_down
	spriteface PLAYER, DOWN
	pause 20
	opentext
	writetext Route6SouthMinaSceneQuestionText1
;	refreshscreen $0
	loadmenudata Route6SouthMinaSceneMenuData
	verticalmenu
	closewindow
	closetext
	if_equal $1, .Nothing
	if_equal $2, .Smile
	if_equal $3, .PeaceSign
	if_equal $4, .FunnyFace
	if_equal $5, .RudeGesture
.Nothing
	writecode VAR_MONJUSTCAUGHT, $1
	pause 50
	opentext
	writetext Route6SouthMinaSceneQuestionText2
	waitbutton
	closetext
	jump .cont
.Smile
	pause 10
	callasm Route6SouthPlayerPhoto1Asm
	pause 5
	spriteface PLAYER, UP
	writecode VAR_MONJUSTCAUGHT, $2
	pause 35
	opentext
	writetext Route6SouthMinaSceneQuestionText3
	waitbutton
	closetext
	jump .cont
.PeaceSign
	pause 10
	callasm Route6SouthPlayerPhoto2Asm
	pause 5
	spriteface PLAYER, UP
	writecode VAR_MONJUSTCAUGHT, $3
	pause 35
	opentext
	writetext Route6SouthMinaSceneQuestionText4
	waitbutton
	closetext
	jump .cont
.FunnyFace
	pause 10
	callasm Route6SouthPlayerPhoto3Asm
	writecode VAR_MONJUSTCAUGHT, $4
	pause 5
	spriteface PLAYER, UP
	pause 5
	spriteface PLAYER, DOWN
	pause 5
	spriteface PLAYER, UP
	pause 5
	spriteface PLAYER, DOWN
	pause 5
	spriteface PLAYER, UP
	pause 5
	spriteface PLAYER, DOWN
	pause 5
	spriteface PLAYER, UP
	pause 5
	spriteface PLAYER, DOWN
	opentext
	writetext Route6SouthMinaSceneQuestionText5
	waitbutton
	closetext
	jump .cont
.RudeGesture
	pause 10
	callasm Route6SouthPlayerPhoto4Asm
	pause 5
	spriteface PLAYER, UP
	writecode VAR_MONJUSTCAUGHT, $5
	pause 35
	opentext
	writetext Route6SouthMinaSceneQuestionText6
	waitbutton
	closetext
.cont
	special Special_FadeOutMusic
	pause 40
	opentext
	special Special_DotDotDot
	closetext
	pause 40
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 4, 15
	playmusic MUSIC_MINA
	opentext TEXTBOX_MINA
	writetext Route6SouthMinaSceneText4
	waitbutton
	closetext
	pause 10
	spriteface PLAYER, DOWN
	pause 2
	special Special_ForcePlayerStateNormal
	opentext TEXTBOX_MINA
	writetext Route6SouthMinaSceneText5
	waitbutton
	closetext
	applymovement PLAYER, Movement_Route6SouthPlayer
	follow 4, PLAYER
	applyonemovement 4, step_right
	stopfollow
	spriteface 4, LEFT
	spriteface PLAYER, UP
	pause 40
	opentext TEXTBOX_MINA
	writetext Route6SouthMinaSceneText6
	spriteface 4, DOWN
	farwritetext StdBlankText
	pause 6
	writetext Route6SouthMinaSceneText7
	waitbutton
	closetext
	pause 40
	spriteface 4, LEFT
	spriteface PLAYER, RIGHT
	pause 20
	opentext TEXTBOX_MINA
	checkcode VAR_MONJUSTCAUGHT
	if_equal $1, .Nothing2
	if_equal $2, .Smile2
	if_equal $3, .PeaceSign2
	if_equal $4, .FunnyFace2
	if_equal $5, .RudeGesture2
.Nothing2
	writetext Route6SouthMinaSceneText8_1
	jump .cont2
.Smile2
	writetext Route6SouthMinaSceneText8_2
	jump .cont2
.PeaceSign2
	writetext Route6SouthMinaSceneText8_3
	jump .cont2
.FunnyFace2
	writetext Route6SouthMinaSceneText8_4
	jump .cont2
.RudeGesture2
	writetext Route6SouthMinaSceneText8_5
.cont2
	writecode VAR_MONJUSTCAUGHT, $0
	waitbutton
	closetext
	pause 10
	spriteface PLAYER, RIGHT
	opentext TEXTBOX_MINA
	writetext Route6SouthMinaSceneText9
	yesorno
	iffalse .no
	writetext Route6SouthMinaSceneText10
	jump .cont3
.no
	writetext Route6SouthMinaSceneText11
.cont3
	waitbutton
	closetext
	waitsfx
	winlosstext Route6SouthMinaMinaWinText, 0
	setlasttalked 4
	loadtrainer MINA, 2
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MINA
	opentext TEXTBOX_MINA
	writetext Route6SouthMinaSceneText12
	waitbutton
	closetext
	follow PLAYER, 4
	applyonemovement PLAYER, step_left
	stopfollow
	spriteface PLAYER, RIGHT
	spriteface 4, UP
	playsound SFX_UNKNOWN_61
	disappear 5
	pause 25
	playsound SFX_SWITCH_POCKETS
	disappear 6
	disappear 7
	pause 25
	spriteface 4, LEFT
	pause 10
	opentext TEXTBOX_MINA
	special Special_MinaGoodbye
	waitbutton
	closetext
	applymovement 4, Movement_Route6SouthMinaLeave
	disappear 4
	dotrigger $0
	setevent EVENT_ROUTE_6_MINA_GONE
	setevent EVENT_DONE_ROUTE_6_MINA
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_6
	setflag ENGINE_MINA_ROUTE_6
	special Special_FadeOutMusic
	pause 5
	playmapmusic
	end
	
Movement_Route6SouthPlayer:
	step_left
	step_down
	step_down
	step_end
	
Movement_Route6SouthMinaLeave:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
Route6SouthMinaSceneMenuData:
	db $40 ; flags
	db 00, 00 ; start coords
	db 12, 14 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 5 ; items
	db "DO NOTHING@"
	db "BIG SMILE@"
	db "PEACE SIGN@"
	db "FUNNY FACE@"
	db "RUDE GESTURE@"
	end
	
Route6SouthMinaSceneQuestionText1:
	text "She hasn't noticed"
	line "you and is still"
	cont "painting."
	
	para "What will you do?"
	done
	
Route6SouthMinaSceneQuestionText2:
	text "<PLAYER> stood"
	line "still."
	done
	
Route6SouthMinaSceneQuestionText3:
	text "<PLAYER> flashed"
	line "a big smile!"
	done
	
Route6SouthMinaSceneQuestionText4:
	text "<PLAYER> threw"
	line "up a peace sign."
	done
	
Route6SouthMinaSceneQuestionText5:
	text "<PLAYER> made a"
	line "funny face!"
	done
	
Route6SouthMinaSceneQuestionText6:
	text "<PLAYER> stuck"
	line "up a finger…"
	done
	
Route6SouthMinaSceneText1:
	text "…"
	done
	
Route6SouthMinaSceneText2:
	text "… …"
	done
	
Route6SouthMinaSceneText3:
	text "… … …"
	done
	
Route6SouthMinaSceneText4:
	text "Wait, who the"
	line "heck?"
	
	para "<PLAYER>!?"
	
	para "How long have"
	line "you been standing"
	cont "there?"
	done
	
Route6SouthMinaSceneText5:
	text "Oh, <WAIT_S>now you've"
	line "done it!"
	
	para "I wasn't paying"
	line "attention and I"
	cont "painted you into"
	cont "my scene!"
	
	para "Oh well…"
	
	para "It was kinda"
	line "empty, anyway…"
	
	para "Here, <WAIT_S>take a look!"
	done
	
Route6SouthMinaSceneText6:
	text "Well?"
	
	para "What do you think?"
	
	para "I guess I'll"
	line "call it:<WAIT_L>"
	done
	
Route6SouthMinaSceneText7:
	text "“Island Stillness…<WAIT_M>"
	line "…and <PLAYER>”."
	done
	
Route6SouthMinaSceneText8_1:
	text "You're kinda just"
	line "standing there,"
	cont "huh?"
	
	para "I mean you could"
	line "at least cracked"
	cont "a smile…"
	done
	
Route6SouthMinaSceneText8_2:
	text "Look at your big"
	line "smile!"
	
	para "You usually seem"
	line "so stoic."
	done
	
Route6SouthMinaSceneText8_3:
	text "A peace sign,"
	line "though?"
	
	para "I gotta say, <WAIT_S>that's"
	line "pretty cliché…"
	done
	
Route6SouthMinaSceneText8_4:
	text "What's with the"
	line "funny face, huh?"
	
	para "Kinda ruins the"
	line "picture, don't you"
	cont "think?"
	done
	
Route6SouthMinaSceneText8_5:
	text "…I could have done"
	line "without the"
	cont "finger, though…"
	
	para "I mean, <WAIT_S>really,"
	line "<PLAYER>!"
	done
	
Route6SouthMinaSceneText9:
	text "Anyway…"
	
	para "I came to this"
	line "little island for"
	cont "some inspiration."
	
	para "I heard that the"
	line "EXEGGUTOR here get"
	cont "as tall as the"
	cont "ones back home!"
	
	para "Maybe I was just"
	line "feeling a bit"
	cont "homesick…"
	
	para "…"
	
	para "Hey, while you're"
	line "here, how about"
	cont "another battle?"
	
	para "It'll be fun!."
	done
	
Route6SouthMinaSceneText10:
	text "Great, let's go!"
	done
	
Route6SouthMinaSceneText11:
	text "Sorry, <WAIT_S>not taking"
	line "no for an answer!"
	done
	
Route6SouthMinaSceneText12:
	text "Ha ha!"
	
	para "You did it again,"
	line "<PLAYER>."
	
	para "Well, I should be"
	line "going."
	
	para "There's plenty more"
	line "places in ONWA to"
	cont "draw inspiration"
	cont "from."
	
	para "I'm off to paint"
	line "something without"
	cont "you ruining it!"
	
	para "Just kidding!"
	done
	
Route6SouthMinaMinaWinText:
	text "Another great"
	line "battle!"
	done
	
Route6SouthPlayerPhoto1Asm:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_PHOTO_1
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Route6SouthPlayerPhoto2Asm:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_PHOTO_2
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Route6SouthPlayerPhoto3Asm:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_PHOTO_3
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Route6SouthPlayerPhoto4Asm:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_PHOTO_4
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Route6SouthEasel:
	jumptext Route6SouthEaselText
	
Route6SouthEaselText:
	text "MINA's easel."
	done
	
TrainerRoute6South_1:
	generictrainer SWIMMERF, SHANNON, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_1, .SeenText, .BeatenText

	text "The water gets"
	line "pretty deep around"
	cont "here."
	
	para "What could be down"
	line "there, I wonder!"
	done

.SeenText:
	text "Let's battle!"
	
	para "You'll be sinking"
	line "to the bottom of"
	cont "the ocean when I'm"
	cont "done with you!"
	done

.BeatenText:
	text "I'm sinking!"
	done
	
TrainerRoute6South_2:
	generictrainer SWIMMERM, DAVY, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_2, .SeenText, .BeatenText

	text "Let's just say my"
	line "new suit doesn't"
	cont "leave much to the"
	cont "imagination."
	
	para "I think I'll just"
	line "stay under the"
	cont "water…"
	done

.SeenText:
	text "My friend talked"
	line "me into a new"
	cont "style of swimsuit."
	
	para "He said all the"
	line "ladies love them!"
	
	para "I feel so exposed!"
	done

.BeatenText:
	text "Ah shoot!"
	done
	
	
TrainerRoute6South_3:
	generictrainer TUBER, KERRI, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_3, .SeenText, .BeatenText

	text "I'm getting dizzy!"
	done

.SeenText:
	text "I've drifted pretty"
	line "far away from the"
	cont "beach."
	
	para "I hope I wash up"
	line "somewhere soon…"
	done

.BeatenText:
	text "Sigh…"
	done
