SunbeamBikiniContest_MapScriptHeader:
	db 1 ; scene scripts
	scene_script SunbeamBikiniContestTrigger0

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	person_event SPRITE_BIKINI_1, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunBeamContestBikiniBr, EVENT_SUNBEAM_BIKINIS_GONE
	person_event SPRITE_BIKINI_2, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunBeamContestBikiniBL, EVENT_SUNBEAM_BIKINIS_GONE
	person_event SPRITE_BIKINI_3, 3, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunBeamContestBikiniP, EVENT_SUNBEAM_BIKINIS_GONE
	person_event SPRITE_TRUNKS,  5,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_COOL_DUDE,  5,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BIKINI_3,  5,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_POKEFAN_M,  6,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BATTLE_GIRL,  6,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const SUNBEAMCONTESTBIKINIBR
	const SUNBEAMCONTESTBIKINIBL
	const SUNBEAMCONTESTBIKINIP
	const SUNBEAMCONTESTCROWD1
	const SUNBEAMCONTESTCROWD2
	const SUNBEAMCONTESTCROWD3
	const SUNBEAMCONTESTCROWD4
	const SUNBEAMCONTESTCROWD5
	
SunbeamBikiniContestTrigger0:
	playmusic MUSIC_GSC_GAME_CORNER
	setflag ENGINE_DAILY_BIKINI_CONTEST
	setevent EVENT_BIKINIBR
	setevent EVENT_BIKINIBL
	setevent EVENT_BIKINIP
	pause 7
	opentext
	writetext SunbeamContestText1
	waitbutton
	closetext
;	pause 7
	spriteface PLAYER, DOWN
	pause 5
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	spriteface PLAYER, UP
	opentext
	writetext SunbeamContestText12
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIBR
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini1
	opentext
	writetext SunBeamContestBikiniBrText1
	waitbutton
	closetext
	waitsfx
	winlosstext SunBeamContestBikiniBrWinText, SunBeamContestBikiniBrWinText
	setlasttalked SUNBEAMCONTESTBIKINIBR
	loadtrainer BIKINIBR, 1
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestText2
	waitbutton
	closetext
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIBR
	playsound SFX_ENTER_DOOR
	
	
	pause 7
	opentext
	writetext SunbeamContestText3
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIBL
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini1
	opentext
	writetext SunBeamContestBikiniBLText1
	waitbutton
	closetext
	waitsfx
	winlosstext SunBeamContestBikiniBLWinText, SunBeamContestBikiniBLWinText
	setlasttalked SUNBEAMCONTESTBIKINIBL
	loadtrainer BIKINIBL, 1
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestText4
	waitbutton
	closetext
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIBL
	playsound SFX_ENTER_DOOR
	
	pause 7
	opentext
	writetext SunbeamContestText5
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIP
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIP, Movement_SunbeamContestBikini1
	opentext
	writetext SunBeamContestBikiniPText1
	waitbutton
	closetext
	waitsfx
	winlosstext SunBeamContestBikiniPWinText, SunBeamContestBikiniPWinText
	setlasttalked SUNBEAMCONTESTBIKINIP
	loadtrainer BIKINIP, 1
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestText6
	waitbutton
	closetext
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	applymovement SUNBEAMCONTESTBIKINIP, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIP
	playsound SFX_ENTER_DOOR
	
	pause 7
	opentext
	writetext SunbeamContestText7
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIBR
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini3
	spriteface SUNBEAMCONTESTBIKINIBR, DOWN
	pause 14
	appear SUNBEAMCONTESTBIKINIBL
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini4
	spriteface SUNBEAMCONTESTBIKINIBL, DOWN
	pause 14
	appear SUNBEAMCONTESTBIKINIP
	playsound SFX_EXIT_BUILDING
	spriteface SUNBEAMCONTESTBIKINIP, LEFT
	pause 7
	spriteface SUNBEAMCONTESTBIKINIP, DOWN
	opentext
	writetext SunbeamContestText8
	waitbutton
	closetext
	pause 7
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini6
	opentext
	writetext SunbeamContestText9
	waitbutton
	closetext
	pause 7
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini6
	opentext
	writetext SunbeamContestText10
	waitbutton
	closetext
	pause 7
	applymovement SUNBEAMCONTESTBIKINIP, Movement_SunbeamContestBikini6
	opentext
	writetext SunbeamContestText11
	waitbutton
	closetext
	pause 7
	spriteface SUNBEAMCONTESTBIKINIP, RIGHT
	pause 7
	disappear SUNBEAMCONTESTBIKINIP
	playsound SFX_ENTER_DOOR
	pause 14
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIBL
	playsound SFX_ENTER_DOOR
	pause 14
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini2
	disappear SUNBEAMCONTESTBIKINIBR
	playsound SFX_ENTER_DOOR
	
	pause 7
	opentext
	writetext SunbeamContestText13
	waitbutton
	playmusic MUSIC_NONE
	writetext SunbeamContestText17
;	waitbutton
	loadmenudata .BikiniMenuData
	verticalmenu
	closewindow
	if_equal $1, .Lilac
	if_equal $2, .Aster
	if_equal $3, .Hazel
	
.Lilac
	clearevent EVENT_BIKINIP
	domaptrigger SUNBEAM_SURF_SHOP, $1
	writetext SunbeamContestText14
	playmusic MUSIC_GSC_GAME_CORNER
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	playmusic MUSIC_GSC_GAME_CORNER
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIBR
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini4
	spriteface SUNBEAMCONTESTBIKINIBR, DOWN
	opentext
	writetext SunBeamContestBikiniBrText2
	waitbutton
	closetext
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini6
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	applymovement SUNBEAMCONTESTBIKINIBR, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIBR
	playsound SFX_ENTER_DOOR
	pause 14
	opentext
	writetext SunbeamContestText18
	waitbutton
	closetext
	pause 7
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing RIGHT, SUNBEAM_SURF_SHOP, $5, $5
	end
.Aster
	clearevent EVENT_BIKINIBL
	domaptrigger SUNBEAM_SURF_SHOP, $1
	writetext SunbeamContestText15
	playmusic MUSIC_GSC_GAME_CORNER
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	playmusic MUSIC_GSC_GAME_CORNER
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIBL
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini4
	spriteface SUNBEAMCONTESTBIKINIBL, DOWN
	opentext
	writetext SunBeamContestBikiniBLText2
	waitbutton
	closetext
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini6
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	applymovement SUNBEAMCONTESTBIKINIBL, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIBL
	playsound SFX_ENTER_DOOR
	pause 14
	opentext
	writetext SunbeamContestText18
	waitbutton
	closetext
	pause 7
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing RIGHT, SUNBEAM_SURF_SHOP, $5, $5
	end
.Hazel
	clearevent EVENT_BIKINIBR
	domaptrigger SUNBEAM_SURF_SHOP, $1
	writetext SunbeamContestText16
	playmusic MUSIC_GSC_GAME_CORNER
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	playmusic MUSIC_GSC_GAME_CORNER
	waitbutton
	closetext
	pause 7
	appear SUNBEAMCONTESTBIKINIP
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAMCONTESTBIKINIP, Movement_SunbeamContestBikini4
	spriteface SUNBEAMCONTESTBIKINIP, DOWN
	opentext
	writetext SunBeamContestBikiniPText2
	waitbutton
	closetext
	applymovement SUNBEAMCONTESTBIKINIP, Movement_SunbeamContestBikini6
	spriteface SUNBEAMCONTESTCROWD1, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, LEFT
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, RIGHT
	pause 10
	spriteface SUNBEAMCONTESTCROWD3, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD1, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD5, UP
	pause 10
	spriteface SUNBEAMCONTESTCROWD2, UP
	pause 10
	applymovement SUNBEAMCONTESTBIKINIP, Movement_SunbeamContestBikini5
	disappear SUNBEAMCONTESTBIKINIP
	playsound SFX_ENTER_DOOR
	pause 14
	opentext
	writetext SunbeamContestText18
	waitbutton
	closetext
	pause 7
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing RIGHT, SUNBEAM_SURF_SHOP, $5, $5
	end
	
.BikiniMenuData:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 7 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "HAZEL@"
	db "ASTER@"
	db "LILAC@"
	end
	
SunBeamContestBikiniBr:
	end
	
SunBeamContestBikiniBL:
	end

SunBeamContestBikiniP:
	end

SunbeamContestText1:
	text "Welcome ladies and"
	line "gentleman to the"
	cont "SUNBEAM ISLAND"
	cont "BEACH BATTLE"
	cont "BEAUTY CONTEST!"
	
	para "Each of our three"
	line "competitors will"
	cont "come out one by"
	cont "one to strut their"
	cont "stuff on the run-"
	cont "way and in battle!"
	
	para "But first, give it"
	line "up for our judge"
	cont "for today,"
	cont "<PLAYER>!"
	done
	
SunbeamContestText2:
	text "PA: Wonderful!"
	
	para "What a battle!"
	
	para "Give it up for"
	line "HAZEL!"
	done
	
SunbeamContestText3:
	text "Next up is our"
	line "second contestant,"
	cont "the astonishing"
	cont "ASTER!"
	done
	
SunbeamContestText4:
	text "PA: Excellent!"
	
	para "A great battle by"
	line "both sides!"
	
	para "Make some noise"
	line "for ASTER!"
	done
	
SunbeamContestText5:
	text "And last, but not"
	line "least, our third"
	
	para "contestant, the"
	line "lovely LILAC!"
	done
	
SunbeamContestText6:
	text "Superb!"
	
	para "Expertly fought!"
	
	para "Show some love for"
	line "LILAC, everybody!"	
	done
	
SunbeamContestText7:
	text "PA: Before we get"
	line "to the results,"
	
	para "let's get all of"
	line "our contestants"
	cont "out here again!"
	done
	
SunbeamContestText8:
	text "Give it up for"
	line "HAZEL!"
	done
	
SunbeamContestText9:
	text "ASTER!"
	done
	
SunbeamContestText10:
	text "…and LILAC!"
	done
	
SunbeamContestText11:
	text "Thank you, ladies."
	
	para "We'll announce the"
	line "winners as soon as"
	cont "the results are"
	cont "in."
	done
	
SunbeamContestText12:
	text "PA: Alright!"
	
	para "Without further"
	line "ado,"
	
	para "let's get this"
	line "started with con-"
	cont "testant No. 1, the"
	cont "heavenly HAZEL!"
	done
	
SunbeamContestText13:
	text "Alright, <PLAYER>."
	
	para "It's time to make"
	line "your decision!"
	
	para "It's all up to you."
	
	para "Are you ready?"
	done
	
SunbeamContestText14:
	text "HAZEL!"
	done
	
SunbeamContestText15:
	text "ASTER!"
	done
	
SunbeamContestText16:
	text "LILAC!"
	done
	
SunbeamContestText17:
	text "And the winner of"
	line "the BEACH BATTLE"
	cont "BEAUTY CONTEST is…"	
	done
	
SunbeamContestText18:
	text "Well folks, that's"
	line "all for today!"
	
	para "Join us next time"
	line "for another fierce"
	cont "competition!"
	done
	
SunbeamContestCrowdText:
	text "Crowd: WOOO!!"
	line "YEAH!!"
	done
	
SunBeamContestBikiniPText1:
	text "A battle in a"
	line "bikini?"
	
	para "How exciting!"
	done
	
SunBeamContestBikiniPText2:
	text "I can't believe I"
	line "won!"
	
	para "Thanks everyone!"
	done
	
SunBeamContestBikiniPWinText:
	text "Whew!"
	
	para "I'm so excited!"
	done
	
SunBeamContestBikiniBLText1:
	text "This is a bit"
	line "embarassing,"
	
	para "but I'll still give"
	line "it my all!"
	done
	
SunBeamContestBikiniBLText2:
	text "Oh my!"
	
	para "I really won?"
	done
	
SunBeamContestBikiniBLWinText:
	text "Oh my!"
	done
	
SunBeamContestBikiniBrText1:
	text "Haha!"
	
	para "This'll be fun!"
	done
	
SunBeamContestBikiniBrText2:
	text "Nice!"
	
	para "I won!"
	done
	
SunBeamContestBikiniBrWinText:
	text "Yes!"
	
	para "Great battle!"
	done
	
Movement_SunbeamContestBikini1:
	step_sleep 40
	slow_step_left
	step_sleep 24
	slow_step_left
	step_sleep 24
	turn_head_down
	step_sleep 24
	turn_head_right
	step_sleep 24
	turn_head_up
	step_sleep 24
	turn_head_left
	step_sleep 24
	turn_head_down
	step_sleep 24
	slow_step_right
	step_sleep 24
	slow_step_right
	step_sleep 24
	turn_head_down
	step_sleep 24
	turn_head_left
	step_sleep 24
	turn_head_up
	step_sleep 24
	turn_head_right
	step_sleep 24
	turn_head_down
	step_sleep 24
	slow_step_left
	step_sleep 24
	turn_head_down
	step_end
	
Movement_SunbeamContestBikini2:
	step_right
	step_right
	step_end
	
Movement_SunbeamContestBikini3:
	step_left
	step_left
	step_end
	
Movement_SunbeamContestBikini4:
	step_left
	step_end
	
Movement_SunbeamContestBikini5:
	step_right
	step_end
	
Movement_SunbeamContestBikini6:
	turn_head_left
	step_sleep 24
	turn_head_up
	step_sleep 24
	turn_head_right
	step_sleep 24
	turn_head_down
	step_sleep 24
	step_end