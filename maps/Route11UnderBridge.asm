Route11UnderBridge_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  6, 16, 3, ROUTE_11_2
	warp_def  7, 16, 4, ROUTE_11_2
	warp_def  8, 16, 4, ROUTE_11_2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_MINA, 31, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11UnderBridgeMina, EVENT_ROUTE_11_MINA_GONE
	person_event SPRITE_PAINTINGS, 30, 13, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route11UnderBridgeEasel, EVENT_ROUTE_11_MINA_GONE
	person_event SPRITE_LEAVES, 30, 13, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route11UnderBridgeEasel, EVENT_ROUTE_11_MINA_GONE
	tmhmball_event 11, 37, TM_FLASH_CANNON, EVENT_TM73


Route11UnderBridgeMina:
	special Special_ForcePlayerStateNormal
	opentext
	writetext Route11UnderBridgeMinaText1
	yesorno
	iffalse .no
	farwritetext StdBlankText
	pause 6
	writetext Route11UnderBridgeMinaText2
	pause 30
	closetext
	pause 30
	special Special_FadeOutMusic
	wait 5
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 1, 15
	faceplayer
	playmusic MUSIC_MINA
	opentext TEXTBOX_MINA
	writetext Route11UnderBridgeMinaText3
	waitbutton
	closetext
	pause 25
	spriteface 1, DOWN
	pause 25
	spriteface 1, RIGHT
	pause 30
	faceplayer
	pause 30
	opentext TEXTBOX_MINA
	writetext Route11UnderBridgeMinaText4
	waitbutton
	closetext
	follow 1, PLAYER
	applyonemovement 1, step_right
	stopfollow
	spriteface 1, LEFT
	spriteface PLAYER, UP
	pause 40
	opentext TEXTBOX_MINA
	writetext Route11UnderBridgeMinaText5
	spriteface 1, DOWN
	farwritetext StdBlankText
	pause 6
	writetext Route11UnderBridgeMinaText6
	waitbutton
	closetext
	pause 40
	spriteface 1, LEFT
	spriteface PLAYER, RIGHT
	pause 20
	opentext TEXTBOX_MINA
	writetext Route11UnderBridgeMinaText7
	waitbutton
	closetext
	waitsfx
	winlosstext Route11UnderBridgeMinaMinaWinText, 0
	setlasttalked 1
	loadtrainer MINA, 3
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MINA
	opentext TEXTBOX_MINA
	writetext Route11UnderBridgeMinaText8
	waitbutton
	closetext
	follow PLAYER, 1
	applyonemovement PLAYER, step_left
	stopfollow
	spriteface PLAYER, RIGHT
	spriteface 1, UP
	playsound SFX_UNKNOWN_61
	disappear 2
	pause 25
	playsound SFX_SWITCH_POCKETS
	disappear 3
	pause 25
	spriteface 1, LEFT
	pause 10
	opentext TEXTBOX_MINA
	special Special_MinaGoodbye
	waitbutton
	closetext
	follow PLAYER, 1
	applyonemovement PLAYER, step_up
	stopfollow
	spriteface PLAYER, DOWN
	applymovement 1, Movement_Route11UnderBridgeMinaLeave
	disappear 1
	setevent EVENT_ROUTE_11_MINA_GONE
	setevent EVENT_DONE_ROUTE_11_MINA
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_11
	setflag ENGINE_MINA_ROUTE_11
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	end
.no
	writetext Route11UnderBridgeMinaNo
	waitbutton
	closetext
	end
	
Route11UnderBridgeMinaText1:
	text "She's totally"
	line "absorbed in"
	cont "painting."
	
	para "Tap her shoulder?"
	done
	
Route11UnderBridgeMinaText2:
	text "Tap…<WAIT_M> tap…<WAIT_M> tap…"
	done
	
Route11UnderBridgeMinaText3:
	text "Oh, hi <PLAYER>."
	
	para "I figured you'd"
	line "show up at some"
	cont "point."
	
	para "You aren't follow-"
	line "ing me, are you?"
	
	para "… <WAIT_L>… <WAIT_L>…<WAIT_L>Just kidding!"
	
	para "Anyway, I came to"
	line "this bridge since"
	cont "it was just built."
	
	para "I figured the view"
	line "would be nice to"
	cont "paint."
	
	para "I don't know,"
	line "though."
	
	para "It was so bustling"
	line "and busy, that I"
	cont "wasn't really"
	cont "feeling inspired."
	
	para "I came down here"
	line "for some peace and"
	cont "quite, and next"
	cont "thing I knew,"
	
	para "inspiration"
	line "struck!"
	done
	
Route11UnderBridgeMinaText4:
	text "It's dark, rocky,"
	line "and a bit ugly"
	cont "down here,"
	
	para "but even a place"
	line "like this can have"
	cont "a lot of beauty if"
	cont "you slow down and"
	cont "take a look."
	
	para "Here,<WAIT_S> take a look"
	line "at what I've got."
	done
	
Route11UnderBridgeMinaText5:
	text "Well?"
	
	para "What do you"
	line "think?"
	
	para "I think I'll"
	line "call it:<WAIT_L>"
	done
	
Route11UnderBridgeMinaText6:
	text "“Underside”."
	done
	
Route11UnderBridgeMinaText7:
	text "Anyway…"
	
	para "I've got that outta"
	line "my system now."
	
	para "If you're here, I"
	line "bet you expect us"
	cont "to battle."
	
	para "Nope!<WAIT_S>"
	line "Not this time!"
	
	para "… <WAIT_L>… <WAIT_L>…<WAIT_L>Just kidding!"
	
	para "Battle time!"
	done
	
Route11UnderBridgeMinaText8:
	text "Oh yeah!"
	
	para "Great battle as"
	line "usual!"
	
	para "I'd expect nothing"
	line "less from you at"
	cont "this point."
	
	para "Anyway, I'm off!"
	
	para "Until next time."
	done
	
Route11UnderBridgeMinaNo:
	text "Better not…"
	done
	
Route11UnderBridgeMinaMinaWinText:
	text "And there it is!"
	done
	
Movement_Route11UnderBridgeMinaLeave:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_up
	step_up
	step_end
	
Route11UnderBridgeEasel:
	jumptext Route11UnderBridgeEaselText
	
Route11UnderBridgeEaselText:
	text "MINA's easel."
	done