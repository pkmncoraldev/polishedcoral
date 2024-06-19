BarInside_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BarInsideTrigger0
	scene_script BarInsideTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BarInsideCallback

	db 2 ; warp events
	warp_event  5,  9, DUSK_TURNPIKE, 18
	warp_event  6,  9, DUSK_TURNPIKE, 18

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	person_event SPRITE_SPA_WORKER,  6,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BAR_FIGHT_DONE
	person_event SPRITE_SAILOR,  7,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BAR_FIGHT_DONE
	hiddentape_event 9, 1, MUSIC_BAR, 1, EVENT_MUSIC_BAR
	person_event SPRITE_JUKEBOX,  1,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, -1
	person_event SPRITE_JUKEBOX,  0,  4, SPRITEMOVEDATA_TILE_UP_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_JUKEBOX,  0,  4, SPRITEMOVEDATA_TILE_UP_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BarInsideJukebox, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_PORYGON_SCREEN,  6,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BarInsideBartender, -1
	person_event SPRITE_SPA_WORKER,  5,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BarInsideRegular1, -1
	person_event SPRITE_ROCKER,  3,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BarInsideRegular2, -1
	person_event SPRITE_BEAUTY,  1,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BarInsideRegular3, -1
	person_event SPRITE_BURGLAR,  8,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BarInsideRegular4, -1
	person_event SPRITE_CHILD,  5, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BarInsideChild, -1
	person_event SPRITE_POKEFAN_M,  6, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BarInsideDad, -1
	person_event SPRITE_POKEFAN_F,  4, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BarInsideMom, -1
	person_event SPRITE_BATTLE_GIRL,  5, 11, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BarInsideWaitress, -1
	
	
	
BarInsideCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	return
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	return	
	
BarInsideTrigger0:
	opentext
	writetext BarInsideFightText1
	waitbutton
	closetext
	callasm MakePalGreen
	applymovement 1, Movement_BarInsideBubba
	playsound SFX_BUMP
	applymovement 2, Movement_BarInsideSailor
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	earthquake 5
	pause 5
	spriteface 2, DOWN
	applymovement 2, Movement_BarInsideSailor2
	opentext
	writetext BarInsideFightText2
	waitbutton
	closetext
	pause 5
	applyonemovement 1, step_down
	opentext
	writetext BarInsideFightText3
	waitbutton
	closetext
	pause 5
	applyonemovement 2, turn_step_up
	opentext
	writetext BarInsideFightText8
	waitbutton
	closetext
	pause 10
	applyonemovement 2, turn_step_down
	opentext
	writetext BarInsideFightText4
	waitbutton
	closetext
	waitsfx
	winlosstext BarInsideFightWinText, 0
	setlasttalked 2
	loadtrainer SAILOR, PETEY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
	writetext BarInsideFightText5
	waitbutton
	closetext
	pause 5
	applymovement 2, Movement_BarInsideSailor3
	disappear 2
	playsound SFX_EXIT_BUILDING
	pause 5
	applyonemovement 1, step_down
	opentext
	writetext BarInsideFightText6
	waitbutton
	closetext
	waitsfx
	winlosstext BarInsideFightWinText2, 0
	setlasttalked 1
	loadtrainer CUEBALL, BUBBA
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
	writetext BarInsideFightText7
	waitbutton
	closetext
	pause 5
	applymovement 1, Movement_BarInsideSailor3
	disappear 1
	playsound SFX_EXIT_BUILDING
	setevent EVENT_BAR_FIGHT_DONE
	dotrigger $1
	end
	
BarInsideTrigger1:
	end
	
BarInsideFightText1:
	text "I said, <WAIT_M>you got a"
	line "problem, pal?"
	done
	
BarInsideFightText2:
	text "Hey!"
	
	para "Watch where you're"
	line "standin'!"
	
	para "Can't you see we're"
	line "fightin' here?"
	
	para "…"
	
	para "What are you"
	line "lookin' at?"
	
	para "I don't much like"
	line "the cutta yur jib!"
	done
	
BarInsideFightText3:
	text "Yeah, <WAIT_S>me either!"
	done
	
BarInsideFightText4:
	text "Like I was sayin'…"
	
	para "You got a starin'"
	line "problem, <WAIT_S>and I got"
	cont "the solution!"
	done
	
BarInsideFightText5:
	text "Grr!<WAIT_M>"
	line "Forget this!"
	done
	
BarInsideFightText6:
	text "Hey what gives?"
	
	para "You beat up the"
	line "guy I was beatin'"
	cont "up!"
	
	para "I had dibs!"
	done
	
BarInsideFightText7:
	text "I ain't got time"
	line "for this!"
	
	para "I gotta go pummle"
	line "that other guy!"
	done
	
BarInsideFightText8:
	text "You stay outta"
	line "this!"
	done
	
BarInsideFightWinText:
	text "Graah!"
	done
	
BarInsideFightWinText2:
	text "Guh wha?"
	done
	
Movement_BarInsideBubba:
	fix_facing
	step_up
	remove_fixed_facing
	run_step_down
	step_end
	
Movement_BarInsideSailor:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_BarInsideSailor2:
	fix_facing
	fast_step_up
	remove_fixed_facing
	step_end
	
Movement_BarInsideSailor3:
	step_right
	step_down
	step_end
	
BarInsideBartender:
	opentext
	checkevent EVENT_CAN_BUY_HOUSE_SPECIAL
	iftrue .house_special
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iftrue .talked
	setevent EVENT_TALKED_TO_BARTENDER_ONCE
	writetext BarInsideBartenderText1
	waitbutton
	callasm BartenderAsm1
	writetext BarInsideBartenderText2
	waitbutton
	closetext
	end
.talked
	writetext BarInsideBartenderText3
	waitbutton
	callasm BartenderAsm1
	writetext BarInsideBartenderText4
	waitbutton
	closetext
	end
.house_special
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .talked2
	setevent EVENT_TALKED_HOUSE_SPECIAL
	writetext BarInsideBartenderText5
	jump .house_special_buy
.talked2
	writetext BarInsideBartenderText6
.house_special_buy
	waitbutton
	callasm BartenderAsm2
	writetext BarInsideBartenderText7
	waitbutton
	closetext
	end
	
BartenderAsm1:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_MOOMOOS_1
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
BartenderAsm2:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_MOOMOOS_2
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
BarInsideBartenderText1:
	text "You handled those"
	line "guys pretty well,"
	cont "kid."
	
	para "Ol' BUBBA gets"
	line "rowdy when he's"
	cont "drinkin' the"
	cont "house special."
	
	para "You're curious"
	line "about the house"
	cont "special?"
	
	para "It's called"
	line "MOOMOO BREW."
	
	para "It's MOOMOO MILK"
	line "with a little"
	cont "somethin' <WAIT_M>extra"
	cont "mixed in."
	
	para "Anyway, <WAIT_S>enough of"
	line "all that."
	
	para "What'll ya have,"
	line "kid?"
	done
	
BarInsideBartenderText2:
	text "What's that?"
	
	para "MOOMOO BREW?"
	
	para "I can't sell"
	line "em' to a kid!"
	
	para "…"
	
	para "Alright, <WAIT_S>tell ya"
	line "what."
	
	para "If you can prove"
	line "to me that you're"
	cont "tough enough,"
	
	para "I'll sell you a"
	line "MOOMOO BREW."
	
	para "Beat all the"
	line "regulars here,"
	cont "and we'll talk."
	done
	
BarInsideBartenderText3:
	text "What'll ya have,"
	line "kid?"
	done
	
BarInsideBartenderText4:
	text "If you can prove"
	line "to me that you're"
	cont "tough enough,"
	
	para "I'll sell you a"
	line "MOOMOO BREW."
	
	para "Beat all the"
	line "regulars here,"
	cont "and we'll talk."
	done
	
BarInsideBartenderText5:
	text "Alright, <WAIT_S>a deal's"
	line "a deal."
	
	para "I'll sell ya a"
	line "MOOMOO BREW."
	done
	
BarInsideBartenderText6:
	text "What'll ya have,"
	line "kid?"
	
	para "A MOOMOO BREW?"
	done
	
BarInsideBartenderText7:
	text "Keep this between"
	line "us, <WAIT_S>alright?"
	done
	
BarInsideRegular1:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	checkevent EVENT_BEAT_REGULAR_1
	iftrue .beat
	writetext BarInsideRegular1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext BarInsideRegular1WinText, 0
	setlasttalked 8
	loadtrainer CUEBALL, DESMOND
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_REGULAR_1
	checkevent EVENT_BEAT_REGULAR_2
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_3
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_4
	iffalse .cont
	setevent EVENT_CAN_BUY_HOUSE_SPECIAL
.cont
	opentext
.beat
	writetext BarInsideRegular1Text3
	waitbutton
	closetext
	spriteface 8, LEFT
	end
.normal
	writetext BarInsideRegular1Text1
	waitbutton
	closetext
	spriteface 8, LEFT
	end
	
BarInsideRegular1Text1:
	text "This guy <WAIT_M>is really"
	line "not good at pool!"
	done
	
BarInsideRegular1Text2:
	text "I lost the cue"
	line "ball, so we're"
	cont "usin' a #BALL."
	done
	
BarInsideRegular1Text3:
	text "You say it's ironic"
	line "that I lost the"
	cont "cue ball?"
	
	para "I don't get it…"
	done
	
BarInsideRegular1WinText:
	text "The cue ball isn't"
	line "all I lost…"
	done
	
BarInsideRegular2:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	checkevent EVENT_BEAT_REGULAR_2
	iftrue .beat
	writetext BarInsideRegular2Text2
	waitbutton
	closetext
	waitsfx
	winlosstext BarInsideRegular2WinText, 0
	setlasttalked 9
	loadtrainer GUITARIST, LARRY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_REGULAR_2
	checkevent EVENT_BEAT_REGULAR_1
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_3
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_4
	iffalse .cont
	setevent EVENT_CAN_BUY_HOUSE_SPECIAL
.cont
	opentext
.beat
	writetext BarInsideRegular2Text3
	waitbutton
	closetext
	spriteface 9, DOWN
	end
.normal
	writetext BarInsideRegular2Text1
	waitbutton
	closetext
	spriteface 9, DOWN
	end
	
BarInsideRegular2Text1:
	text "Between you and"
	line "me, <WAIT_S>I'm pretty good"
	cont "at this!"
	
	para "Maybe I should go"
	line "pro!"
	done
	
BarInsideRegular2Text2:
	text "This guy is better"
	line "at pool than he"
	cont "was lettin' on."
	
	para "Am I gettin'"
	line "hussled?"
	done
	
BarInsideRegular2Text3:
	text "First this guy,"
	line "and now you."
	
	para "I'm gettin' hussled"
	line "left and right!"
	done
	
BarInsideRegular2WinText:
	text "You too?"
	done
	
BarInsideRegular3:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	checkevent EVENT_BEAT_REGULAR_3
	iftrue .beat
	writetext BarInsideRegular3Text2
	waitbutton
	closetext
	waitsfx
	winlosstext BarInsideRegular3WinText, 0
	setlasttalked 10
	loadtrainer BEAUTY, TRIXIE
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_REGULAR_3
	checkevent EVENT_BEAT_REGULAR_1
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_2
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_4
	iffalse .cont
	setevent EVENT_CAN_BUY_HOUSE_SPECIAL
.cont
	opentext
.beat
	writetext BarInsideRegular3Text3
	waitbutton
	closetext
	end
.normal
	writetext BarInsideRegular3Text1
	waitbutton
	closetext
	end
	
BarInsideRegular3Text1:
	text "Not interested."
	done
	
BarInsideRegular3Text2:
	text "What do you want?"
	
	para "Can't I enjoy my"
	line "drink in peace?"
	done
	
BarInsideRegular3Text3:
	text "Would you quit"
	line "starin' at me?"
	done
	
BarInsideRegular3WinText:
	text "Alright you win."
	
	para "Now leave me"
	line "alone."
	done
	
BarInsideRegular4:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	checkevent EVENT_BEAT_REGULAR_4
	iftrue .beat
	writetext BarInsideRegular4Text2
	waitbutton
	closetext
	waitsfx
	winlosstext BarInsideRegular4WinText, 0
	setlasttalked 11
	loadtrainer BURGLAR, JULIAN
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_REGULAR_4
	checkevent EVENT_BEAT_REGULAR_1
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_2
	iffalse .cont
	checkevent EVENT_BEAT_REGULAR_3
	iffalse .cont
	setevent EVENT_CAN_BUY_HOUSE_SPECIAL
.cont
	opentext
.beat
	writetext BarInsideRegular4Text3
	waitbutton
	closetext
	spriteface 11, UP
	end
.normal
	writetext BarInsideRegular4Text1
	waitbutton
	closetext
	spriteface 11, UP
	end
	
BarInsideRegular4Text1:
	text "Ain't you a little"
	line "young to be here"
	cont "without MOMMY?"
	done
	
BarInsideRegular4Text2:
	text "If I battle you"
	line "will you buzz off?"
	done
	
BarInsideRegular4Text3:
	text "Kids, I swear…"
	
	para "Always poking"
	line "their noses in"
	cont "other's business…"
	done
	
BarInsideRegular4WinText:
	text "Darn it!"
	done
	
BarInsideChild:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	writetext BarInsideChildText2
	waitbutton
	closetext
	spriteface 12, RIGHT
	end
.normal
	writetext BarInsideChildText1
	waitbutton
	closetext
	spriteface 12, RIGHT
	end
	
BarInsideChildText1:
	text "It's stinky and"
	line "loud here!"
	done
	
BarInsideChildText2:
	text "Sorry, <WAIT_S>I can't"
	line "battle."
	
	para "I don't have a"
	line "#MON."
	done
	
BarInsideDad:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	writetext BarInsideDadText2
	waitbutton
	closetext
	spriteface 13, UP
	end
.normal
	writetext BarInsideDadText1
	waitbutton
	closetext
	spriteface 13, UP
	end

BarInsideDadText1:
	text "This place isn't"
	line "what I expected"
	cont "at all!"
	
	para "I thought this"
	line "was a family"
	cont "establishment!"
	done
	
BarInsideDadText2:
	text "Please leave us"
	line "alone."
	
	para "We're just here"
	line "for a bite to eat."
	
	para "We don't want"
	line "any trouble."
	done

BarInsideMom:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	writetext BarInsideMomText2
	waitbutton
	closetext
	spriteface 14, DOWN
	end
.normal
	writetext BarInsideMomText1
	waitbutton
	closetext
	spriteface 14, DOWN
	end
	
BarInsideMomText1:
	text "I don't know, <WAIT_S>I"
	line "think it's kinda"
	cont "charming!"
	done
	
BarInsideMomText2:
	text "A battle?"
	
	para "Oh, no.<WAIT_M>"
	line "I shouldn't."
	done
	
BarInsideWaitress:
	faceplayer
	opentext
	checkevent EVENT_TALKED_HOUSE_SPECIAL
	iftrue .normal
	checkevent EVENT_TALKED_TO_BARTENDER_ONCE
	iffalse .normal
	writetext BarInsideWaitressText2
	waitbutton
	closetext
	end
.normal
	writetext BarInsideWaitressText1
	waitbutton
	closetext
	end
	
BarInsideWaitressText1:
	text "The goody-goodies"
	line "over there better"
	cont "tip well!"
	done
	
BarInsideWaitressText2:
	text "I'm not a customer,"
	line "I'm a waitress."
	
	para "And no, <WAIT_M>I don't"
	line "want to battle!"
	done
	
BarInsideJukebox:
	checkcode VAR_FACING
	ifequal UP, BarInsideJukeboxScript
	jumptext BarInsideJukeboxTextWrongSide
BarInsideJukeboxScript::
	opentext
	special PlaceMoneyTopRight
	callasm CheckJukeboxSong
	if_equal 0, .default
	if_equal 1, .wild
	if_equal 2, .starglow
	if_equal 3, .leader
.default
	writetext BarInsideJukeboxTextDefault
	jump .got_text
.wild
	writetext BarInsideJukeboxTextWild
	jump .got_text
.starglow
	writetext BarInsideJukeboxTextStarglow
	jump .got_text
.leader
	writetext BarInsideJukeboxTextLeader
.got_text
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext BarInsideJukeboxText
	yesorno
	iffalse .end
	checkmoney $0, 1
	if_equal $2, .no_money
	playsound SFX_TRANSACTION
	takemoney $0, 1
	special PlaceMoneyTopRight
	callasm UpdateJukeboxSong
	waitsfx
	closetext
	pause 10
	special Special_FadeOutMusic
	pause 20
	callasm CheckJukeboxSong
	if_equal 0, .default2
	if_equal 1, .wild2
	if_equal 2, .starglow2
	if_equal 3, .leader2
.default2
	playmusic MUSIC_BAR
	end
.wild2
	playmusic MUSIC_WILD_BATTLE_OLD
	end
.starglow2
	playmusic MUSIC_STARGLOW_OLD
	end
.leader2
	playmusic MUSIC_GYM_BATTLE_OLD
	end
.end
	closetext
	end
.no_money
	writetext BarInsideJukeboxNoMoneyText
	waitbutton
	closetext
	end

BarInsideJukeboxTextWrongSide:
	text "Oops, <WAIT_S>wrong side."
	done

BarInsideJukeboxText:
	text "Put in ¥1?"
	done
	
BarInsideJukeboxNoMoneyText:
	text "Too rich for your"
	line "blood!"
	done
	
BarInsideJukeboxTextDefault:
	text "MOOMOO BLUES"
	line "is playing."
	done
	
BarInsideJukeboxTextStarglow:
	text "ECHOES OF STARGLOW"
	line "is playing."
	done
	
BarInsideJukeboxTextWild:
	text "DRAMATIC BATTLE"
	line "is playing."
	done
	
BarInsideJukeboxTextLeader:
	text "LEADER'S SONATA"
	line "is playing."
	done
	
CheckJukeboxSong:
	xor a
	ld [wTapePlayerActive], a
	ld a, [wJukeboxSong]
	ld [wScriptVar], a
	ret
	
UpdateJukeboxSong:
	ld a, [wJukeboxSong]
	inc a
	ld [wJukeboxSong], a
	cp 4
	ret nz
	xor a
	ld [wJukeboxSong], a
	ret