GlintGroveEast_MapScriptHeader:
	db 1 ; scene scripts
	scene_script GlintGroveEastTrigger0

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 13,  6, 1, GLINT_GROVE_DEEP
	warp_def 37, 13, 1, GLINT_GROVE_UNDERGROUND

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	person_event SPRITE_MINA, 30,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveEastMina, EVENT_GLINT_GROVE_MINA_GONE
	itemball_event  8, 37, SUPER_POTION, 1, EVENT_GLINT_GROVE_EAST_POKE_BALL_1
	itemball_event  4, 12, REPEL, 1, EVENT_GLINT_GROVE_EAST_POKE_BALL_2
	person_event SPRITE_BOULDER_ROCK_FOSSIL, 29,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, GlintGroveEastRock, EVENT_GLINT_GROVE_ROCK_GONE
	smashrock_event  8, 35
	smashrock_event  9, 36
	itemball_event  2,  7, RARE_CANDY, 1, EVENT_GLINT_GROVE_EAST_POKE_BALL_3
	itemball_event 10, 44, SHINY_STONE, 1, EVENT_GLINT_GROVE_EAST_POKE_BALL_4
	strengthboulder_event 12, 41, EVENT_GLINT_GROVE_EAST_BOULDER_1
	strengthboulder_event 13, 42, EVENT_GLINT_GROVE_EAST_BOULDER_2
	
	const_def 1 ; object constants
	const GLINT_GROVE_EAST_MINA
	
GlintGroveEastTrigger0:
	special Special_UpdatePalsInstant
	end
	
GlintGroveEastRock:
	farjumptext UnknownText_0x1c0906
	
GlintGroveEastRockText:
	text "TEXT"
	done
	
GlintGroveEastMina:
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveEastMinaText10
	waitbutton
	closetext
	pause 10
	faceplayer
	checkevent EVENT_DIDNT_GIVE_MINA_TEA
	iftrue .said_no
	checkevent EVENT_TALKED_TO_MINA_ONCE
	iftrue .talked
	opentext TEXTBOX_UNKNOWN
	writetext GlintGroveEastMinaText1
	buttonsound
	changetextboxspeaker TEXTBOX_MINA
	farwritetext StdBlankText
	special Special_FadeOutMusic
	pause 6
	writetext GlintGroveEastMinaText9
	playmusic MUSIC_MINA
	waitbutton
	closetext
	spriteface GLINT_GROVE_EAST_MINA, DOWN
	pause 40
	faceplayer
	opentext TEXTBOX_MINA
	writetext GlintGroveEastMinaText2
	buttonsound
	farwritetext StdBlankText
	pause 6
	spriteface GLINT_GROVE_EAST_MINA, UP
	writetext GlintGroveEastMinaText3
	buttonsound
	farwritetext StdBlankText
	pause 6
	faceplayer
	writetext GlintGroveEastMinaText4
	waitbutton
	checkitem BLOSSOM_TEA
	iftrue .have_tea
	spriteface GLINT_GROVE_EAST_MINA, UP
	closetext
	setevent EVENT_TALKED_TO_MINA_ONCE
	special Special_FadeOutMusic
	pause 5
	playmapmusic
	end
.talked
	checkitem BLOSSOM_TEA
	iftrue .talked_have_tea
	opentext TEXTBOX_MINA
	writetext GlintGroveEastMinaText4
	waitbutton
	closetext
	spriteface GLINT_GROVE_EAST_MINA, UP
	end
.talked_have_tea
	opentext TEXTBOX_MINA
	playmusic MUSIC_MINA
	writetext GlintGroveEastMinaText4
.have_tea
	farwritetext StdBlankText
	pause 6
	writetext GlintGroveEastMinaText5
	yesorno
	iffalse .no
	writetext GlintGroveEastMinaGiveText
	takeitem BLOSSOM_TEA
	playsound SFX_LEVEL_UP 
	waitsfx
.return
	writetext GlintGroveEastMinaText6
	waitbutton
	closetext
	pause 5
	spriteface GLINT_GROVE_EAST_MINA, UP
	pause 5
	opentext TEXTBOX_MINA
	writetext GlintGroveEastMinaText11
	waitbutton
	closetext
	pause 5
	opentext
	writetext GlintGroveEastMinaRockSmashText
	waitbutton
	closetext
	waitsfx
	loadvar wBuffer6, SNUBBULL
	copybytetovar wBuffer6
	refreshscreen
	pokepic 0, 0
	cry 0
	waitsfx
	closepokepic
	playsound SFX_STRENGTH
	earthquake 84
	setlasttalked 4
	applymovement2 MovementData_Mina_Rock_Smash
	disappear 4
	setlasttalked GLINT_GROVE_EAST_MINA
	pause 5
	faceplayer
	opentext TEXTBOX_MINA
	writetext GlintGroveEastMinaText7
	waitbutton
	closetext
	applymovement GLINT_GROVE_EAST_MINA, Movement_Mina_Walk_Away
	disappear GLINT_GROVE_EAST_MINA
	setevent EVENT_GLINT_GROVE_MINA_GONE
	setevent EVENT_TALKED_TO_MINA_ONCE
	domaptrigger GLINT_GROVE_ENTRANCE, $2
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	end
.no
	setevent EVENT_DIDNT_GIVE_MINA_TEA
	writetext GlintGroveEastMinaTextNo
	waitbutton
	closetext
	spriteface GLINT_GROVE_EAST_MINA, UP
	special Special_FadeOutMusic
	pause 10
	playmapmusic
	end
.no_2
	writetext GlintGroveEastMinaTextNo
	waitbutton
	closetext
	spriteface GLINT_GROVE_EAST_MINA, UP
	end
.said_no
	opentext TEXTBOX_MINA
	writetext GlintGroveEastMinaText8
	yesorno
	iffalse .no_2
	writetext GlintGroveEastMinaGiveText
	takeitem BLOSSOM_TEA
	playsound SFX_LEVEL_UP 
	waitsfx
	playmusic MUSIC_MINA
	jump .return
	
GlintGroveEastMinaText1:
	text "Ah, ALOLA!"
	
	para "Oh… <WAIT_S>I guess you"
	line "don't say that"
	cont "around here, huh?"
	
	para "Well anyway…"
	done
	
GlintGroveEastMinaText2:
	text "I'm a painter."
	
	para "I'm always on the"
	line "lookout for my"
	cont "next spark of"
	cont "inspiration!"
	
	para "I came here to"
	line "paint this grove"
	cont "and its #MON."
	
	para "It's been fine"
	line "and all, but I'm"
	cont "missing my spark!"
	
	para "There's a rumor of"
	line "a #MON with a"
	cont "long, gooey tail"
	cont "somewhere around"
	cont "here."
	
	para "THAT'S <WAIT_S>what gets"
	line "me all inspired!"
	done
	
GlintGroveEastMinaText3:
	text "Unfortunately,"
	line "this rock is in"
	cont "in the way!"
	done
	
GlintGroveEastMinaText4:
	text "My SNUBBULL could"
	line "clear the way with"
	cont "ROCK SMASH, but"
	cont "he's too thirsty"
	cont "at the moment."
	
	para "If I had something"
	line "yummy to drink,"
	cont "I'd be all set!"
	
	para "Sigh…"
	done
	
GlintGroveEastMinaText5:
	text "… <WAIT_L>… <WAIT_L>… <WAIT_L>!"
	
	para "That smell!"
	
	para "You have"
	line "BLOSSOM TEA!"
	
	para "Please, can I"
	line "have some?"
	done
	
GlintGroveEastMinaText6:
	text "Great!"
	
	para "Now SNUBBULL can"
	line "blast on through!"
	done
	
GlintGroveEastMinaText7:
	text "I'm going to see"
	line "what's ahead."
	
	para "Something cool,"
	line "I hope!"
	done
	
GlintGroveEastMinaText8:
	text "You have"
	line "BLOSSOM TEA!"
	
	para "Please, can I"
	line "have some?"
	done
	
GlintGroveEastMinaText9:
	text "My name is MINA."
	done
	
GlintGroveEastMinaText10:
	text "Come on, SNUBBULL…"
	
	para "Please cooperate!"
	done
	
GlintGroveEastMinaText11:
	text "Ok, SNUBBULL!"
	
	para "Let's do it!"
	done
	
GlintGroveEastMinaTextNo:
	text "Sigh…"
	done
	
GlintGroveEastMinaGiveText:
	text "<PLAYER> handed over"
	line "BLOSSOM TEA."
	done

GlintGroveEastMinaRockSmashText:
	text "SNUBBULL used"
	line "ROCK SMASH!"
	done
	
MovementData_Mina_Rock_Smash:
	rock_smash 10
	step_end

Movement_Mina_Walk_Away:
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end
