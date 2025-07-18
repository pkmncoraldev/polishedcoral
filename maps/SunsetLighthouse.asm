SunsetLighthouse_MapScriptHeader:
	db 2 ; scene scripts
	
	scene_script SunsetLighthouseTrigger0
	scene_script SunsetLighthouseTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, SunsetLighthouseCallback

	db 3 ; warp events
	warp_event 5, 9, SUNSET_CAPE, 1
	warp_event 4, 9, SUNSET_CAPE, 1
	warp_event  5,  2, SUNSET_LIGHTHOUSE_ELEVATOR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	person_event SPRITE_GENTLEMAN, 4, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LighthouseAbner, -1
	person_event SPRITE_COLBY, -6, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_GLINT_RIVAL_NOT_IN_HOUSE
	person_event SPRITE_CUTE_GIRL, 6, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LighthouseKid1, EVENT_GOT_A_POKEMON_FROM_SPRUCE
	person_event SPRITE_POKEMANIAC, 6, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LighthouseKid2, EVENT_GOT_A_POKEMON_FROM_SPRUCE
	person_event SPRITE_CUTE_GIRL, 6, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LighthouseKid1, EVENT_LIGHTHOUSE_KIDS_DIE
	person_event SPRITE_POKEMANIAC, 6, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LighthouseKid2, EVENT_LIGHTHOUSE_KIDS_DIE

	const_def 1 ; object constants
	const LIGHTHOUSE_ABNER
	const LIGHTHOUSE_RIVAL
	const LIGHTHOUSE_KID1
	const LIGHTHOUSE_KID2
	const LIGHTHOUSE_KID1_2
	const LIGHTHOUSE_KID2_2
	
SunsetLighthouseTrigger0:
	priorityjump LighthouseStartGetStarterScene
	end

SunsetLighthouseTrigger1:
	end

SunsetLighthouseCallback:
	setevent EVENT_CAPE_LIGHTHOUSE_COLORS
	domaptrigger SUNSET_CAPE, $1
	checkevent EVENT_SUNSET_LIGHTHOUSE_UNLOCKED
	iffalse .end
	changeblock $4, $2, $47
.end
	return

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	jump LighthousePokeMenu
	closetext
	end

AlreadyGotPokemonScript:
	opentext
	writetext LighthousePokeBallText
	waitbutton
	closetext
	end
	
LighthouseStartGetStarterScene:
	special Special_StopRunning
	special Special_FadeOutMusic
	pause 5
	dotrigger $1
	playmusic MUSIC_SPRUCE
	applymovement PLAYER, Movement_EnterLighthouse
	spriteface PLAYER, UP
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText1
	waitbutton
	closetext
	
	playmusic MUSIC_RIVAL_ENCOUNTER
	playsound SFX_ENTER_DOOR
	moveperson LIGHTHOUSE_RIVAL, 5, 9
	appear LIGHTHOUSE_RIVAL
	applymovement LIGHTHOUSE_RIVAL, Movement_LighthouseRivalEnters
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText7
	waitbutton
	closetext
	pause 10
	opentext TEXTBOX_RIVAL
	writetext LighthouseRivalEntersText
	waitbutton
	closetext
	pause 10
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText10
	waitbutton
	closetext
	
	spriteface LIGHTHOUSE_RIVAL, LEFT
	opentext TEXTBOX_RIVAL
	writetext LighthouseRivalEntersText2
	waitbutton
	closetext
	pause 10
	playmusic MUSIC_SPRUCE
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText8
	waitbutton
	closetext
	pause 5
	spriteface LIGHTHOUSE_RIVAL, UP
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText9
	waitbutton
	closetext
	
	applymovement LIGHTHOUSE_ABNER, Movement_AbnerLighthouseWalk1
	spriteface LIGHTHOUSE_ABNER, DOWN
	opentext TEXTBOX_ABNER
	writetext PickStarterText
	waitbutton
	
LighthousePokeMenu:
	refreshscreen $0
	loadmenudata LighthousePokemonMenuData
	verticalmenu
	closewindow
	if_equal $1, .Charmander
	if_equal $2, .Squirtle
	if_equal $3, .Bulbasaur
	if_equal $4, .Cyndaquil
	if_equal $5, .Totodile
	if_equal $6, .Chikorita

.Charmander:
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext LighthouseTakeCharmanderText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke CHARMANDER, PLAIN_FORM, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	jump LighthouseGetStarterScene_part2
	end
.Squirtle:
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext LighthouseTakeSquirtleText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, PLAIN_FORM, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	jump LighthouseGetStarterScene_part2
	end
.Bulbasaur:
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext LighthouseTakeBulbasaurText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, PLAIN_FORM, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	jump LighthouseGetStarterScene_part2
	end	
.Cyndaquil:
	refreshscreen $0
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext LighthouseTakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CYNDAQUIL, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CYNDAQUIL, PLAIN_FORM, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	jump LighthouseGetStarterScene_part2
	end
	
.Totodile:
	refreshscreen $0
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext LighthouseTakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem TOTODILE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke TOTODILE, PLAIN_FORM, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	jump LighthouseGetStarterScene_part2
	end
	
.Chikorita:
	refreshscreen $0
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext LighthouseTakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	setevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, PLAIN_FORM, 5
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	jump LighthouseGetStarterScene_part2
	end
	
LighthousePokemonMenuData:
	db $40 ; flags
	db 00, 00 ; start coords
	db 14, 14 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 6 ; items
	db "CHARMANDER@"
	db "SQUIRTLE@"
	db "BULBASAUR@"
	db "CYNDAQUIL@"
	db "TOTODILE@"
	db "CHIKORITA@"
	end

LighthouseGetStarterScene_part2:
	clearevent EVENT_LIGHTHOUSE_KIDS_DIE
	applymovement LIGHTHOUSE_ABNER, Movement_AbnerLighthouseWalk2
	spriteface LIGHTHOUSE_ABNER, DOWN
;	opentext
;	writetext LighthouseAbnerTextToRival
;	waitbutton
;	closetext
	applyonemovement LIGHTHOUSE_RIVAL, turn_step_up
	opentext TEXTBOX_RIVAL
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .RivalSquirtleText
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .RivalBulbasaurText
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .RivalCyndaquilText
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .RivalTotodileText
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .RivalChikoritaText
	writetext RivalPicksTotodileText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continueLighthouseGetStarterScene_part2
.RivalSquirtleText
	writetext RivalPicksChikoritaText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continueLighthouseGetStarterScene_part2
.RivalBulbasaurText
	writetext RivalPicksCyndaquilText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continueLighthouseGetStarterScene_part2
.RivalCyndaquilText
	writetext RivalPicksSquirtleText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continueLighthouseGetStarterScene_part2
.RivalTotodileText
	writetext RivalPicksBulbasaurText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continueLighthouseGetStarterScene_part2
.RivalChikoritaText
	writetext RivalPicksCharmanderText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
.continueLighthouseGetStarterScene_part2
	applymovement LIGHTHOUSE_ABNER, Movement_AbnerLighthouseWalk3
	spriteface LIGHTHOUSE_ABNER, DOWN
;	opentext
;	writetext LighthouseAbnerTextToKid1
;	waitbutton
;	closetext
	applyonemovement LIGHTHOUSE_KID1, turn_step_up
	opentext TEXTBOX_GIRL
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .Kid1SquirtleText
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .Kid1BulbasaurText
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .Kid1CyndaquilText
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .Kid1TotodileText
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .Kid1ChikoritaText
	writetext Kid1PicksBulbasaurText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue2LighthouseGetStarterScene_part2
	
.Kid1SquirtleText
	writetext Kid1PicksCharmanderText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue2LighthouseGetStarterScene_part2
	
.Kid1BulbasaurText
	writetext Kid1PicksSquirtleText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue2LighthouseGetStarterScene_part2
.Kid1CyndaquilText
	writetext Kid1PicksChikoritaText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue2LighthouseGetStarterScene_part2
.Kid1TotodileText
	writetext Kid1PicksCyndaquilText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue2LighthouseGetStarterScene_part2
.Kid1ChikoritaText
	writetext Kid1PicksTotodileText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
.continue2LighthouseGetStarterScene_part2
	applymovement LIGHTHOUSE_ABNER, Movement_AbnerLighthouseWalk4
	spriteface LIGHTHOUSE_ABNER, DOWN
;	opentext
;	writetext LighthouseAbnerTextToKid2
;	waitbutton
;	closetext
	applyonemovement LIGHTHOUSE_KID2, turn_step_up
	opentext TEXTBOX_BOY
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .Kid2SquirtleText
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .Kid2BulbasaurText
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .Kid2CyndaquilText
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .Kid2TotodileText
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .Kid2ChikoritaText
	writetext Kid2PicksCyndaquilText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue3LighthouseGetStarterScene_part2
	
.Kid2SquirtleText
	writetext Kid2PicksTotodileText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue3LighthouseGetStarterScene_part2
	
.Kid2BulbasaurText
	writetext Kid2PicksChikoritaText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue3LighthouseGetStarterScene_part2
.Kid2CyndaquilText
	writetext Kid2PicksCharmanderText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue3LighthouseGetStarterScene_part2
.Kid2TotodileText
	writetext Kid2PicksSquirtleText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	jump .continue3LighthouseGetStarterScene_part2
.Kid2ChikoritaText
	writetext Kid2PicksBulbasaurText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
.continue3LighthouseGetStarterScene_part2
	applymovement LIGHTHOUSE_ABNER, Movement_AbnerLighthouseReturn
	spriteface LIGHTHOUSE_ABNER, DOWN
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText2
	waitbutton
	closetext
	spriteface LIGHTHOUSE_RIVAL, RIGHT
	spriteface PLAYER, LEFT
	opentext TEXTBOX_RIVAL
	writetext LighthouseRivalText1
	waitbutton
	closetext
	spriteface PLAYER, UP
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText3
	waitbutton
	closetext
	spriteface LIGHTHOUSE_KID1, RIGHT
	spriteface LIGHTHOUSE_KID2, LEFT
	appear LIGHTHOUSE_KID1_2
	appear LIGHTHOUSE_KID2_2
	spriteface PLAYER, LEFT
	opentext TEXTBOX_RIVAL
	writetext LighthouseRivalText2
	waitbutton
	closetext
	waitsfx
	disappear LIGHTHOUSE_KID1
	disappear LIGHTHOUSE_KID2
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
	winlosstext LighthouseRivalWinText, LighthouseRivalLoseText
	setlasttalked LIGHTHOUSE_RIVAL
	loadtrainer RIVAL, RIVAL1_6
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iffalse .LighthouseAfterVictorious
	jump .LighthouseAfterYourDefeat
	
.chikorita
	winlosstext LighthouseRivalWinText, LighthouseRivalLoseText
	setlasttalked LIGHTHOUSE_RIVAL
	loadtrainer RIVAL, RIVAL1_5
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iffalse .LighthouseAfterVictorious
	jump .LighthouseAfterYourDefeat

.cyndaquil
	winlosstext LighthouseRivalWinText, LighthouseRivalLoseText
	setlasttalked LIGHTHOUSE_RIVAL
	loadtrainer RIVAL, RIVAL1_4
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iffalse .LighthouseAfterVictorious
	jump .LighthouseAfterYourDefeat
	
.squirtle
	winlosstext LighthouseRivalWinText, LighthouseRivalLoseText
	setlasttalked LIGHTHOUSE_RIVAL
	loadtrainer RIVAL, RIVAL1_3
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iffalse .LighthouseAfterVictorious
	jump .LighthouseAfterYourDefeat
	
.bulbasaur
	winlosstext LighthouseRivalWinText, LighthouseRivalLoseText
	setlasttalked LIGHTHOUSE_RIVAL
	loadtrainer RIVAL, RIVAL1_2
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iffalse .LighthouseAfterVictorious
	jump .LighthouseAfterYourDefeat
	
.charmander
	winlosstext LighthouseRivalWinText, LighthouseRivalLoseText
	setlasttalked LIGHTHOUSE_RIVAL
	loadtrainer RIVAL, RIVAL1_1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iffalse .LighthouseAfterVictorious
	jump .LighthouseAfterYourDefeat
	
.LighthouseAfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext TEXTBOX_RIVAL
	writetext LighthouseRivalText_YouWon
	waitbutton
	closetext
	jump .LighthouseFinishRival

.LighthouseAfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext TEXTBOX_RIVAL
	writetext LighthouseRivalText_YouLost
	waitbutton
	closetext
.LighthouseFinishRival:
	applymovement LIGHTHOUSE_RIVAL, Movement_LighthouseRivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear LIGHTHOUSE_RIVAL
	special HealParty
	special Special_FadeOutMusic
	pause 10
	playmusic MUSIC_SPRUCE
	applymovement LIGHTHOUSE_ABNER, Movement_AbnerLighthouseWalk1
	spriteface LIGHTHOUSE_ABNER, DOWN
	spriteface PLAYER, UP
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerText4
	waitbutton
	closetext
	pause 10
	opentext TEXTBOX_ABNER
	writetext LighthouseAbnerTextGiveDex
	waitbutton
	changetextboxspeaker
	writetext Lighthouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	changetextboxspeaker TEXTBOX_ABNER
	writetext LighthouseAbnerText5
	buttonsound
	giveitem RIVAL_POKEDEX
	changetextboxspeaker
	writetext LighthouseGotRivalDexText
	playsound SFX_KEY_ITEM
	waitsfx
	setevent EVENT_GOT_RIVAL_POKEDEX
	buttonsound
	writetext LighthousePutAwayRivalDexText
	waitbutton
	changetextboxspeaker TEXTBOX_ABNER
	writetext LighthouseAbnerText6
	waitbutton
	closetext
	special Special_FadeOutMusic
	pause 5
	playmapmusic
	domaptrigger ROUTE_1_GATE, $1
	end	
	
LighthouseAbner:
	checkevent EVENT_SUNSET_LIGHTHOUSE_UNLOCKED
	iftrue .elevator_unlocked
	checkevent EVENT_SAVED_SUNBEAM
	iftrue .beentoisland
	checkevent EVENT_SPRUCE_CALLED_COME_TO_ISLAND
	iftrue .second_visit
	checkevent EVENT_MOM_SPEECH_LOOP
	iftrue LighthouseAbnerPostPokeGear
	jumptextfaceplayer LighthouseAbnerText
.second_visit
	jumptextfaceplayer TEXTBOX_ABNER, LighthouseAbner2ndVisitText
.beentoisland
	jumptextfaceplayer TEXTBOX_ABNER, LighthouseAbnerBeenToHouseText
.elevator_unlocked
	jumptextfaceplayer TEXTBOX_ABNER, LighthouseAbnerElevatorUnlockedText
	
LighthouseRival:
	end
	
LighthouseKid1:
	faceplayer
	opentext
	writetext LighthouseKid1Text
	buttonsound
	spriteface LIGHTHOUSE_KID1, RIGHT
	spriteface LIGHTHOUSE_KID1_2, RIGHT
	closetext
	end	
	
LighthouseKid2:
	faceplayer
	opentext
	writetext LighthouseKid2Text
	buttonsound
	spriteface LIGHTHOUSE_KID2, LEFT
	spriteface LIGHTHOUSE_KID2_2, LEFT
	closetext
	end
	
LighthouseAbnerPostPokeGear:
	jumptextfaceplayer TEXTBOX_ABNER, LighthouseAbnerTextPostPokeGear
	
Movement_EnterLighthouse:
	step_up
	step_up
	step_left
	step_up
	step_end
	
Movement_AbnerLighthouseWalk1:
	step_down
	step_end
	
Movement_AbnerLighthouseWalk2:
	step_left
	step_end
	
Movement_AbnerLighthouseWalk3:
	step_right
	step_right
	step_end
	
Movement_AbnerLighthouseWalk4:
	step_right
	step_end
	
Movement_AbnerLighthouseReturn:
	step_left
	step_left
	step_up
	step_end
	
Movement_LighthouseRivalEnters:
	step_sleep 20
	step_up
	step_up
	step_left
	step_left
	step_up
	step_end
	
Movement_LighthouseRivalLeaves:
	step_down
	step_down
	step_right
	step_down
	step_end
	
LighthouseGotRivalDexText:
	text "<PLAYER> received"
	line "<RIVAL>'s #DEX!"
	done
	
LighthousePutAwayRivalDexText:
	text "<PLAYER> put the"
	line "#DEX in"
	cont "the KEY POCKET."
	done
	
Lighthouse_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done
	
LighthouseAbnerText1:
	text "<PLAYER>!"
	
	para "So nice of you to"
	line "finally join us."
	
	para "Now we're just"
	line "missing <RIVAL>,"
	
	para "and knowing him,"
	line "we could be here"
	cont "for hours waiting,"
	
	para "so let's just get"
	line "started…"
	
	para "Today marks the"
	line "first day in your"
	cont "journey as #MON"
	cont "TRAINERS!"
	
	para "This is a very im-"
	line "portant day for"
	cont "all of you and-"
	done
	
LighthouseAbnerText2:
	text "Congrats!"
	
	para "You are all now"
	line "#MON trainers!"
	
	para "Go out and be"
	line "the best trainers"
	cont "you can be."
	done
	
LighthouseAbnerText3:
	text "That's a great"
	line "idea, <RIVAL>."
	done
	
LighthouseAbnerText4:
	text "Oh, don't worry"
	line "about <RIVAL>."
	
	para "Some people are"
	line "overcompetitive."
	done
	
LighthouseAbnerTextGiveDex:
	text "Oh!<WAIT_M>"
	line "I almost forgot!"
	
	para "I am supposed to"
	line "give you kids each"
	cont "one of these."
	done
	
LighthouseAbnerText5:
	text "<RIVAL> ran off"
	line "before I could"
	cont "give him his…"
	
	para "<PLAYER>."
	
	para "Do you think you"
	line "could take it with"
	cont "you?"
	
	para "<RIVAL> lives in"
	line "GLINT CITY to the"
	cont "NORTH."
	
	para "You're going that"
	line "way anyway, aren't"
	cont "you?"
	done
	
LighthouseAbnerText6:
	text "Anyway, <WAIT_S>you should"
	line "be on your way."
	
	para "I'm sure you'll"
	line "do great things!"
	
	para "Good luck!"
	done
	
LighthouseAbnerText7:
	text "<RIVAL>!"
	
	para "Late as usual."
	
	para "What's your excuse"
	line "this time?"
	done
	
LighthouseAbnerText8:
	text "Ahem…<WAIT_M>"
	line "I was saying…"
	done
	
LighthouseAbnerText9:
	text "As I'm sure you're"
	line "no doubt aware,"
	
	para "the #MON LEAGUE"
	line "INVITATIONAL TOUR-"
	cont "NAMENT is fast"
	cont "approaching."
	
	para "The tournament is"
	line "held every 5 years"
	cont "and is open to the"
	cont "strongest TRAINERS"
	cont "across the OWNA"
	cont "REGION."
	
	para "That invitation is"
	line "also extended to"
	cont "any TRAINER who"
	cont "can collect the"
	cont "8 #MON LEAGUE"
	cont "GYM BADGES."
	
	para "In light of this,"
	line "you kids have been"
	cont "chosen by PROF."
	cont "SPRUCE to each"
	cont "recieve your own"
	cont "#MON."
	
	para "However, SPRUCE's"
	line "work keeps him"
	cont "very busy,"
	
	para "and he couldn't be"
	line "here in person"
	cont "today."
	
	para "Because of this,<WAIT_S>"
	line "I am filling in"
	cont "for him."
	
	para "I have in this"
	line "bag six rare"
	cont "#MON."

	para "They were sent"
	line "from the PROF.'s"
	cont "lab especially"
	cont "for all of you."
	
	para "You only get one,<WAIT_S>"
	line "so choose wisely."
	
	para "But no matter"
	line "which you choose,<WAIT_S>"
	cont "you must train"
	cont "it well."
	
	para "One of you might"
	line "even become the"
	cont "next #MON"
	cont "LEAGUE CHAMPION!"
	
	para "Ohohohoho!<WAIT_M>"
	line "Ahem."
	
	para "<PLAYER>!"
	
	para "Why don't you"
	line "choose first?"
	done
	
LighthouseAbnerText10:
	text "Right."
	
	para "Didn't think so."
	
	para "You're just lucky"
	line "<PLAYER> was also"
	cont "running late,"
	
	para "or you might have"
	line "missed your chance"
	cont "to get a #MON."
	done
	
LighthouseAbnerText:
	text "Did you visit"
	line "your MOM yet?"
	
	para "No?<WAIT_M>"
	line "Then go talk"
	cont "to her!"
	done
	
LighthouseAbnerTextPostPokeGear:
	text "Nice #GEAR,"
	line "<PLAYER>."
	
	para "Good luck on"
	line "your journey!"
	done	

LighthouseRivalText1:
	text "Your #MON"
	line "looks weak,"
	cont "<PLAYER>."
	
	para "I bet mine could"
	line "wipe the floor"
	cont "with yours!"
	
	para "Why don't we have"
	line "a little battle"
	cont "to find out?"
	done
	
LighthouseRivalText2:
	text "This is gonna be"
	line "a piece of cake!"
	done
	
LighthouseRivalEntersText:
	text "…"
	done
	
LighthouseRivalEntersText2:
	text "Tch!"
	done
	
LighthouseRivalText_YouWon:
	text "Whatever!"
	
	para "I'm going to go"
	line "train my #MON."
	
	para "This won't happen"
	line "again!"
	done
	
LighthouseRivalText_YouLost:
	text "I knew I'd win."
	
	para "You'd better stay"
	line "out of my way if"
	cont "you know what's"
	cont "good for you."
	done
	
RivalPicksCharmanderText:
	text "<PLAYER> picked"
	line "CHIKORITA,"
	
	para "so I'll pick"
	line "CHARMANDER!"
	
	para "It looks much"
	line "stronger."
	done
	
RivalPicksSquirtleText:
	text "<PLAYER> picked"
	line "CYNDAQUIL,"
	
	para "so I'll pick"
	line "SQUIRTLE!"
	
	para "It looks much"
	line "stronger."
	done
	
RivalPicksBulbasaurText:
	text "<PLAYER> picked"
	line "TOTODILE,"
	
	para "so I'll pick"
	line "BULBASAUR!"
	
	para "It looks much"
	line "stronger."
	done
	
	
RivalPicksCyndaquilText:
	text "<PLAYER> picked"
	line "BULBASAUR,"
	
	para "so I'll pick"
	line "CYNDAQUIL!"
	
	para "It looks much"
	line "stronger."
	done
	
RivalPicksTotodileText:
	text "<PLAYER> picked"
	line "CHARMANDER,"
	
	para "so I'll pick"
	line "TOTODILE!"
	
	para "It looks much"
	line "stronger."
	done
	
RivalPicksChikoritaText:
	text "<PLAYER> picked"
	line "SQUIRTLE,"
	
	para "so I'll pick"
	line "CHIKORITA!"
	
	para "It looks much"
	line "stronger."
	done
	
Kid1PicksCharmanderText:
	text "Oh!"
	
	para "I want CHARMANDER!"
	line "It's so cute!"
	done
	
Kid1PicksSquirtleText:
	text "Oh!"
	
	para "I want SQUIRTLE!"
	line "It's so cute!"
	done
	
Kid1PicksBulbasaurText:
	text "Oh!"
	
	para "I want BULBASAUR!"
	line "It's so cute!"
	done
	
Kid1PicksCyndaquilText:
	text "Oh!"
	
	para "I want CYNDAQUIL!"
	line "It's so cute!"
	done
	
Kid1PicksTotodileText:
	text "Oh!"
	
	para "I want TOTODILE!"
	line "It's so cute!"
	done
	
Kid1PicksChikoritaText:
	text "Oh!"
	
	para "I want CHIKORITA!"
	line "It's so cute!"
	done
	
Kid2PicksCharmanderText:
	text "Yes!"
	
	para "No one took"
	line "CHARMANDER!"
	
	para "I'll take it!"
	done
	
Kid2PicksSquirtleText:
	text "Yes!"
	
	para "No one took"
	line "SQUIRTLE!"
	
	para "I'll take it!"
	done
	
Kid2PicksBulbasaurText:
	text "Yes!"
	
	para "No one took"
	line "BULBASAUR!"
	
	para "I'll take it!"
	done
	
Kid2PicksCyndaquilText:
	text "Yes!"
	
	para "No one took"
	line "CYNDAQUIL!"
	
	para "I'll take it!"
	done
	
Kid2PicksTotodileText:
	text "Yes!"
	
	para "No one took"
	line "TOTODILE!"
	
	para "I'll take it!"
	done
	
Kid2PicksChikoritaText:
	text "Yes!"
	
	para "No one took"
	line "CHIKORITA!"
	
	para "I'll take it!"
	done
	
LighthouseRivalWinText:
	text "WHAT? How could"
	line "I lose?"
	done

LighthouseRivalLoseText:
	text "Haha!"
	
	para "Looks like I'm the"
	line "better trainer!"
	done
	
LighthouseTakeCharmanderText:
	text "You'll take"
	line "CHARMANDER,<WAIT_S> the"
	cont "FIRE #MON?"
	done

LighthouseTakeSquirtleText:
	text "Do you want"
	line "SQUIRTLE,<WAIT_S> the"
	cont "WATER #MON?"
	done

LighthouseTakeBulbasaurText:
	text "So, you like"
	line "BULBASAUR,<WAIT_S> the"
	cont "GRASS #MON?"
	done
	
LighthouseTakeCyndaquilText:
	text "You'll take"
	line "CYNDAQUIL,<WAIT_S> the"
	cont "FIRE #MON?"
	done

LighthouseTakeTotodileText:
	text "Do you want"
	line "TOTODILE,<WAIT_S> the"
	cont "WATER #MON?"
	done

LighthouseTakeChikoritaText:
	text "So, you like"
	line "CHIKORITA,<WAIT_S> the"
	cont "GRASS #MON?"
	done
	
LighthousePokeBallText:
	text "I already gave"
	line "you a #MON."

	para "Everyone only"
	line "gets one."
	done

PickStarterText:
	text "Go ahead and"
	line "pick a #MON."
	
	para "Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done
	
	
DidntChooseStarterText:
	text "Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done	

LighthouseKid1Text:
	text "Yippee!<WAIT_M>"
	line "We won!"
	done
	
LighthouseKid2Text:
	text "I can't believe"
	line "I lost…"
	done

LighthouseAbner2ndVisitText:
	text "<PLAYER>!"
	
	para "It's great to see"
	line "you!"
	
	para "How is your #-"
	line "MON?"
	
	para "A trip to the"
	line "island?"
	
	para "You must be"
	line "looking for"
	cont "CAP'N STRAND."
	
	para "He lives on the"
	line "beach to the SOUTH"
	cont "of town."
	
	para "Good luck!"
	done
	
LighthouseAbnerBeenToHouseText:
	text "<PLAYER>!"
	
	para "It's great to see"
	line "you!"
	
	para "I seem to have"
	line "locked the door to"
	cont "the elevator from"
	cont "the other side…"
	
	para "I haven't seen the"
	line "keys in years so I"
	cont "can't get to the"
	cont "top anymore!"
	
	para "The only way in"
	line "is through the"
	cont "basement under the"
	cont "lighthouse."
	
	para "I hope the #MON"
	line "at the top is"
	cont "alright…"
	done
	
LighthouseAbnerElevatorUnlockedText:
	text "<PLAYER>!"
	
	para "It's great to see"
	line "you!"
	
	para "How is your"
	line "journey going?"
	
	para "Say hi to your MOM"
	line "for me!"
	done
