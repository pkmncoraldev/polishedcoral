RadiantGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 19,  4, 5, RADIANT_ORPHANAGE_1F
	warp_def 19,  5, 5, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 0 ; bg events

	db 12 ; object events
	object_event  4,  2, SPRITE_LEILANI_VARIABLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantGymLeilani2, EVENT_ALWAYS_SET
	object_event  4,  2, SPRITE_LEILANI_CHAIR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantGymLeilani, -1
	object_event  4,  2, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  2, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, RadiantGymChair, EVENT_ALWAYS_SET
	object_event  3, 16, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantGymGuy, -1
	object_event  5, 14, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, RadiantGymRose, -1
	object_event  4, 10, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, RadiantGymLily, -1
	object_event  5, 10, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, RadiantGymIris, -1
	object_event  6,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, RadiantGymPoppy, -1
	object_event  3,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, RadiantGymViolet, -1
	object_event  2,  9, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, RadiantGymClover, -1
	object_event  7,  9, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 1, RadiantGymFelicia, -1
	
	
	const_def 1 ; object constants
	const RADIANT_GYM_LEILANI
	const RADIANT_GYM_LEILANI_2
	const RADIANT_GYM_LEILANI_CHAIR
	const RADIANT_GYM_LEILANI_CHAIR_2


RadiantGymLeilani2:
	faceplayer
	jump RadiantGymLeilanicont
RadiantGymLeilani:
	checkcode VAR_FACING
	if_equal RIGHT, RadiantGymLeilaniFacingRight
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI_CHAIR
	spriteface RADIANT_GYM_LEILANI_2, DOWN
RadiantGymLeilanicont:
	setevent EVENT_ALWAYS_SET
	opentext TEXTBOX_LEILANI
	checkevent EVENT_BEAT_LEILANI
	iftrue .FightDone
	writetext RadiantGymLeilaniTextBeforeBattle1
	waitbutton
	closetext
	appear RADIANT_GYM_LEILANI
	appear RADIANT_GYM_LEILANI_CHAIR_2
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applyonemovement PLAYER, step_down
	spriteface PLAYER, UP
	disappear RADIANT_GYM_LEILANI_2
	disappear RADIANT_GYM_LEILANI_CHAIR
	spriteface RADIANT_GYM_LEILANI, RIGHT
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement RADIANT_GYM_LEILANI, slow_step_right
	spriteface RADIANT_GYM_LEILANI, DOWN
	jump .cont
.YouAreFacingUp
	disappear RADIANT_GYM_LEILANI_2
	disappear RADIANT_GYM_LEILANI_CHAIR
	spriteface RADIANT_GYM_LEILANI, RIGHT
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement RADIANT_GYM_LEILANI, slow_step_right
	spriteface RADIANT_GYM_LEILANI, DOWN
	applyonemovement PLAYER, step_right
	spriteface PLAYER, UP
	
.cont
	opentext TEXTBOX_LEILANI
	writetext RadiantGymLeilaniTextBeforeBattle2
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymLeilaniTextWin, RadiantGymLeilaniTextLoss
	setlasttalked RADIANT_GYM_LEILANI
	loadtrainer LEILANI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LEILANI
	clearevent EVENT_HAVENT_BEAT_LEILANI
	opentext
	writetext Text_ReceivedSixthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setevent EVENT_BEAT_LEILANI_FIRST_TIME
	setflag ENGINE_SIXTHBADGE
	setevent EVENT_CAN_FIGHT_ERIKA
	checkcode VAR_BADGES
	callasm RadiantGymAutoShopStepsAsm
	changetextboxspeaker TEXTBOX_LEILANI
	
.FightDone:	
	checkevent EVENT_TM46
	iftrue .GotTMFromLeilani
	setevent EVENT_BEAT_RADIANT_GYM_ROSE
	setevent EVENT_BEAT_RADIANT_GYM_LILY
	setevent EVENT_BEAT_RADIANT_GYM_IRIS
	setevent EVENT_BEAT_RADIANT_GYM_POPPY
	setevent EVENT_BEAT_RADIANT_GYM_VIOLET
	setevent EVENT_BEAT_RADIANT_GYM_CLOVER
	setevent EVENT_BEAT_RADIANT_GYM_FELICIA
	writetext RadiantGymLeilaniTextAfterBattle
	buttonsound
	changetextboxspeaker
	verbosegivetmhm TM_WEATHER_BALL
	setevent EVENT_TM46
	changetextboxspeaker TEXTBOX_LEILANI
	writetext RadiantGymLeilaniTextTMSpeech
	waitbutton
	closetext
	setevent EVENT_ALWAYS_SET
	end

.GotTMFromLeilani:
LeilaniTextLoop:
	writetext RadiantGymLeilaniTextLoop
	waitbutton
	closetext
.end
	end
RadiantGymLeilaniFacingRight:
	opentext
	writetext RadiantOrphanage1FLeilaniTextWrongSide
	waitbutton
	closetext
	end
	
RadiantGymLeilaniRematch:
	checkevent EVENT_BEAT_LEILANI_REMATCH
	iftrue LeilaniTextLoop
	writetext RadiantGymLeilaniTextBeforeBattleRematch
	yesorno
	iffalse .end
	closetext
	appear RADIANT_GYM_LEILANI
	appear RADIANT_GYM_LEILANI_CHAIR_2
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applyonemovement PLAYER, step_down
	spriteface PLAYER, UP
	disappear RADIANT_GYM_LEILANI_2
	disappear RADIANT_GYM_LEILANI_CHAIR
	spriteface RADIANT_GYM_LEILANI, RIGHT
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement RADIANT_GYM_LEILANI, slow_step_right
	spriteface RADIANT_GYM_LEILANI, DOWN
	jump .cont
.YouAreFacingUp
	disappear RADIANT_GYM_LEILANI_2
	disappear RADIANT_GYM_LEILANI_CHAIR
	spriteface RADIANT_GYM_LEILANI, RIGHT
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI
	special MapCallbackSprites_LoadUsedSpritesGFX
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement RADIANT_GYM_LEILANI, slow_step_right
	spriteface RADIANT_GYM_LEILANI, DOWN
	applyonemovement PLAYER, step_right
	spriteface PLAYER, UP
	
.cont
	opentext TEXTBOX_LEILANI
	writetext RadiantGymLeilaniTextBeforeBattle2
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymLeilaniTextWinRematch, RadiantGymLeilaniTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer LEILANI, 1
	jump .cont2
.sevenbadges
	loadtrainer LEILANI, 2
	jump .cont2
.eightbadges
	loadtrainer LEILANI, 3
.cont2
	startbattle
	reloadmapafterbattle
	opentext TEXTBOX_LEILANI
	writetext RadiantGymLeilaniTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_LEILANI_REMATCH
	setevent EVENT_ALWAYS_SET
	end
.end
	disappear RADIANT_GYM_LEILANI
	disappear RADIANT_GYM_LEILANI_CHAIR_2
	writetext RadiantGymLeilaniTextNoRematch
	waitbutton
	closetext
	setevent EVENT_ALWAYS_SET
	end
	
RadiantGymAutoShopStepsAsm:
	ld a, [wBikeUpgradeSteps]
	cp $ff
	ret z
	xor a
	ld [wBikeUpgradeSteps], a
	ld a, 150
	ld [wBikeUpgradeSteps + 1], a
	ret
	
RadiantGymLeilaniTextBeforeBattle1:
	text "Aren't the girls"
	line "just precious?"
	
	para "And they're so"
	line "talented for their"
	cont "age!"
	
	para "Can't have a GYM"
	line "without TRAINERS,"
	cont "and the girls are"
	cont "always eager to"
	cont "help out."
	
	para "They've been"
	line "training with me"
	cont "since before they"
	cont "could even speak."
	
	para "They're shooting"
	line "up like flowers"
	cont "before my eyes!"
	
	para "Oh, but I'm going"
	line "on and on again."
	
	para "Why don't we get"
	line "started?"
	done
	
RadiantGymLeilaniTextBeforeBattle2:
	text "I hope you're"
	line "prepared, dear."
	
	para "I don't plan on"
	line "losing."
	done
	
RadiantGymLeilaniTextBeforeBattleRematch:
	text "You beat all the"
	line "girls!"
	
	para "Well, <WAIT_S>are you ready"
	line "for our rematch?"
	done
	
RadiantGymLeilaniTextAfterBattle:
	text "That badge will"
	line "let you use the"
	cont "move STRENGTH"
	cont "outside of battle."
	
	para "Take this as well."
	done
	
RadiantGymLeilaniTextTMSpeech:
	text "That TM contains"
	line "WEATHER BALL."
	
	para "It isn't much most"
	line "of the time, but"
	cont "in harsh weather,"
	cont "its power goes up"
	cont "and its type"
	cont "changes!"
	
	para "…"
	
	para "We've only just"
	line "met, but I'm so"
	cont "proud of you!"
	
	para "Between my girls"
	line "and talented kids"
	cont "like yourself,"
	
	para "I'm so hopeful for"
	line "the next genera-"
	cont "tion!"
	
	para "Come and visit"
	line "GRAMMA again some-"
	cont "time, won't you?"
	
	para "If you'll battle"
	line "all the girls,"
	cont "I'd love to give"
	cont "you a rematch!"
	
	para "Oh, and do say"
	line "goodbye to ERIKA"
	cont "before you leave."
	
	para "I'm sure she would"
	line "appreciate it."
	done
	
RadiantGymLeilaniTextWin:
	text "Well done, dear!"
	line "Very well done!"
	
	para "You've earned this."
	
	para "It's the #MON"
	line "LEAGUE PETALBADGE."
	done
	
RadiantGymLeilaniTextWinRematch:
	text "Well done, dear!"
	line "Very well done!"
	done
	
RadiantGymLeilaniTextLoss:
	text "Oh, <WAIT_S>sweetie."
	line "Nice try!"
	done
	
RadiantGymLeilaniTextLoop:
	text "We've only just"
	line "met, but I'm so"
	cont "proud of you!"
	
	para "Between my girls"
	line "and talented kids"
	cont "like yourself,"
	
	para "I'm so hopeful for"
	line "the next genera-"
	cont "tion!"
	done
	
RadiantGymLeilaniTextNoRematch:
	text "Don't keep GRAMMA"
	line "waiting, now!"
	done
	
Text_ReceivedSixthBadge:
	text "<PLAYER> received"
	line "the PETALBADGE."
	done

RadiantGymGuy:
	checkevent EVENT_BEAT_LEILANI
	iftrue .won
	jumptextfaceplayer RadiantGymGuyText1
.won
	jumptextfaceplayer RadiantGymGuyText2

RadiantGymRose:
	generictrainer ROSE, 1, EVENT_BEAT_RADIANT_GYM_ROSE, .SeenText, .BeatenText

	text "You're good at"
	line "battles!"
	done

.SeenText:
	text "The challenger is"
	line "you?"
	
	para "Ok, <WAIT_S>I won't go"
	line "easy on you!"
	done

.BeatenText:
	text "You beat me?"
	done
	
RadiantGymLily:
	generictrainer LILY, 1, EVENT_BEAT_RADIANT_GYM_LILY, .SeenText, .BeatenText

	text "WAHHHH!"
	
	para "Why did I lose?"
	done

.SeenText:
	text "…<WAIT_M>Hello."
	
	para "I'm supposed to"
	line "battle you."
	done

.BeatenText:
	text "You beat me?"
	line "Sniffle…"
	done
	
RadiantGymIris:
	generictrainer IRIS, 1, EVENT_BEAT_RADIANT_GYM_IRIS, .SeenText, .BeatenText

	text "I wasn't paying"
	line "attention."
	
	para "I was too busy"
	line "singing!"
	done

.SeenText:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "Let's battle!"
	done

.BeatenText:
	text "La <WAIT_S>la <WAIT_S>la!"
	
	para "Oh, I lost?"
	done
	
RadiantGymPoppy:
	generictrainer POPPY, 1, EVENT_BEAT_RADIANT_GYM_POPPY, .SeenText, .BeatenText

	text "Grr…"
	
	para "I'll get you next"
	line "time!"
	done

.SeenText:
	text "Battle! <WAIT_S>Battle!"
	
	para "Let's battle!"
	done

.BeatenText:
	text "Graah!"
	line "You beat me!"
	done
	
RadiantGymViolet:
	generictrainer VIOLET, 1, EVENT_BEAT_RADIANT_GYM_VIOLET, .SeenText, .BeatenText

	text "You passed the"
	line "test!"
	
	para "Are you gonna beat"
	line "GRAMMA?"
	done

.SeenText:
	text "We have to test"
	line "people that wanna"
	cont "battle GRAMMA."
	
	para "It's our job!"
	done

.BeatenText:
	text "You win!"
	done
	
RadiantGymClover:
	generictrainer CLOVER, 1, EVENT_BEAT_RADIANT_GYM_CLOVER, .SeenText, .BeatenText

	text "There's no way"
	line "GRAMMA will lose!"
	done

.SeenText:
	text "You think you're"
	line "gonna beat GRAMMA?"
	
	para "You aren't gonna"
	line "get past me!"
	done

.BeatenText:
	text "Huh?"
	
	para "How did you beat"
	line "me?"
	done
	
RadiantGymFelicia:
	generictrainer FELICIA, 1, EVENT_BEAT_RADIANT_GYM_FELICIA, .SeenText, .BeatenText

	text "Oh well!"
	
	para "Even though I"
	line "lost, I still had"
	cont "fun!"
	done

.SeenText:
	text "It's time for a"
	line "#MON battle!"
	
	para "This'll be fun!"
	done

.BeatenText:
	text "Aw…<WAIT_M>"
	line "You won!"
	done
	
RadiantGymGuyText1:
	text "Yo! Yo! Yo!"
	line "Champ in making!"
	
	para "GRAMMA LEILANI"
	line "is well enough"
	cont "to battle again!"
	
	para "Way to go!"
	
	para "Her and the girls"
	line "use GRASS-type"
	cont "#MON."
	
	para "FIRE-types are"
	line "obviously a good"
	cont "choice."
	
	para "Go for it, kid!"
	done
	
RadiantGymGuyText2:
	text "Great job!"
	
	para "You showed that"
	line "sweet, little old"
	cont "lady what's what."
	
	para "Six badges down!"
	
	para "You're getting"
	line "there!"
	done
	
RadiantGymChair:
	jumptext RadiantGymChairText
	
RadiantGymChairText:
	text "She has a second"
	line "rocking chair!"
	done
	
	