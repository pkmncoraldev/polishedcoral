RadiantGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17,  4, 5, RADIANT_ORPHANAGE_1F
	warp_def 17,  5, 5, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 0 ; bg events

	db 19 ; object events
	object_event  4,  2, SPRITE_LEILANI_VARIABLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantGymLeilani2, EVENT_ALWAYS_SET
	object_event  4,  2, SPRITE_LEILANI_CHAIR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantGymLeilani, -1
	object_event  4,  2, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  2, SPRITE_LEILANI_CHAIR_2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, RadiantGymChair, EVENT_ALWAYS_SET
	object_event  3, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantGymGuy, -1
	object_event  5, 12, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, RadiantGymRose, EVENT_BEAT_LEILANI
	object_event  4,  8, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, RadiantGymLily, EVENT_BEAT_LEILANI
	object_event  5,  8, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, RadiantGymIris, EVENT_BEAT_LEILANI
	object_event  6,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, RadiantGymPoppy, EVENT_BEAT_LEILANI
	object_event  3,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, RadiantGymViolet, EVENT_BEAT_LEILANI
	object_event  2,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, RadiantGymClover, EVENT_BEAT_LEILANI
	object_event  7,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 1, RadiantGymFelicia, EVENT_BEAT_LEILANI
	object_event  5, 12, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantGymRoseRematch, EVENT_HAVENT_BEAT_LEILANI
	object_event  4,  8, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantGymLilyRematch, EVENT_HAVENT_BEAT_LEILANI
	object_event  5,  8, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantGymIrisRematch, EVENT_HAVENT_BEAT_LEILANI
	object_event  6,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantGymPoppyRematch, EVENT_HAVENT_BEAT_LEILANI
	object_event  3,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantGymVioletRematch, EVENT_HAVENT_BEAT_LEILANI
	object_event  2,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantGymCloverRematch, EVENT_HAVENT_BEAT_LEILANI
	object_event  7,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantGymFeliciaRematch, EVENT_HAVENT_BEAT_LEILANI
	
	
	const_def 1 ; object constants
	const RADIANT_GYM_LEILANI
	const RADIANT_GYM_LEILANI_2
	const RADIANT_GYM_LEILANI_CHAIR
	const RADIANT_GYM_LEILANI_CHAIR_2


RadiantGymLeilani:
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI_CHAIR
RadiantGymLeilani2:
	spriteface RADIANT_GYM_LEILANI_2, DOWN
	setevent EVENT_ALWAYS_SET
	opentext
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
	opentext
	writetext RadiantGymLeilaniTextBeforeBattle2
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymLeilaniTextWin, RadiantGymLeilaniTextLoss
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
	checkcode VAR_BADGES
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_LEILANI
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
;	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_LEILANI
	writetext RadiantGymLeilaniTextTMSpeech
	waitbutton
	closetext
	setevent EVENT_ALWAYS_SET
	end

.GotTMFromLeilani:
	checkevent EVENT_BEAT_RADIANT_GYM_ROSE_REMATCH
	iffalse LeilaniTextLoop
	checkevent EVENT_BEAT_RADIANT_GYM_LILY_REMATCH
	iffalse LeilaniTextLoop
	checkevent EVENT_BEAT_RADIANT_GYM_IRIS_REMATCH
	iffalse LeilaniTextLoop
	checkevent EVENT_BEAT_RADIANT_GYM_POPPY_REMATCH
	iffalse LeilaniTextLoop
	checkevent EVENT_BEAT_RADIANT_GYM_VIOLET_REMATCH
	iffalse LeilaniTextLoop
	checkevent EVENT_BEAT_RADIANT_GYM_CLOVER_REMATCH
	iffalse LeilaniTextLoop
	checkevent EVENT_BEAT_RADIANT_GYM_FELICIA_REMATCH
	iftrue RadiantGymLeilaniRematch
LeilaniTextLoop:
	writetext RadiantGymLeilaniTextLoop
	waitbutton
	closetext
.end
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
	opentext
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
	opentext
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
	
	para "Well, are you ready"
	line "for our rematch?"
	done
	
RadiantGymLeilaniTextAfterBattle:
	text "That badge will"
	line "let you use DIVE"
	cont "outside of battle."
	
	para "Take this as well."
	done
	
RadiantGymLeilaniTextTMSpeech:
	text "TM SPEECH"
	
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
	
	para "Come back and"
	line "visit GRAMMA again"
	cont "sometime."
	
	para "If you'll battle"
	line "all the girls,"
	cont "I'd love to give"
	cont "you a rematch!"
	done
	
RadiantGymLeilaniTextWin:
	text "Well done, sugar!"
	
	para "Very well done!"
	
	para "You've earned this."
	
	para "It's the #MON"
	line "LEAGUE PETALBADGE."
	done
	
RadiantGymLeilaniTextWinRematch:
	text "Well done, sugar!"
	
	para "Very well done!"
	
RadiantGymLeilaniTextLoss:
	text "Oh, sweetie."
	
	para "Nice try!"
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
	line "waiting!"
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

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymRoseRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_ROSE_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymRoseRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymRoseRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer ROSE, 2
	jump .cont
.sevenbadges
	loadtrainer ROSE, 3
	jump .cont
.eightbadges
	loadtrainer ROSE, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_ROSE_REMATCH
	end
.FightDone
	writetext RadiantGymRoseRematchRegularText
	waitbutton
	closetext
	end

RadiantGymRoseRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymRoseRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymRoseRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymLily:
	generictrainer LILY, 1, EVENT_BEAT_RADIANT_GYM_LILY, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymLilyRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_LILY_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymLilyRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymLilyRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer LILY, 2
	jump .cont
.sevenbadges
	loadtrainer LILY, 3
	jump .cont
.eightbadges
	loadtrainer LILY, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_LILY_REMATCH
	end
.FightDone
	writetext RadiantGymLilyRematchRegularText
	waitbutton
	closetext
	end

RadiantGymLilyRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymLilyRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymLilyRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymIris:
	generictrainer IRIS, 1, EVENT_BEAT_RADIANT_GYM_IRIS, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymIrisRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_IRIS_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymIrisRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymIrisRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer IRIS, 2
	jump .cont
.sevenbadges
	loadtrainer IRIS, 3
	jump .cont
.eightbadges
	loadtrainer IRIS, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_IRIS_REMATCH
	end
.FightDone
	writetext RadiantGymIrisRematchRegularText
	waitbutton
	closetext
	end

RadiantGymIrisRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymIrisRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymIrisRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymPoppy:
	generictrainer POPPY, 1, EVENT_BEAT_RADIANT_GYM_POPPY, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymPoppyRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_POPPY_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymPoppyRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymPoppyRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer POPPY, 2
	jump .cont
.sevenbadges
	loadtrainer POPPY, 3
	jump .cont
.eightbadges
	loadtrainer POPPY, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_POPPY_REMATCH
	end
.FightDone
	writetext RadiantGymPoppyRematchRegularText
	waitbutton
	closetext
	end

RadiantGymPoppyRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymPoppyRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymPoppyRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymViolet:
	generictrainer VIOLET, 1, EVENT_BEAT_RADIANT_GYM_VIOLET, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymVioletRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_VIOLET_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymVioletRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymVioletRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer VIOLET, 2
	jump .cont
.sevenbadges
	loadtrainer VIOLET, 3
	jump .cont
.eightbadges
	loadtrainer VIOLET, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_VIOLET_REMATCH
	end
.FightDone
	writetext RadiantGymVioletRematchRegularText
	waitbutton
	closetext
	end

RadiantGymVioletRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymVioletRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymVioletRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymClover:
	generictrainer CLOVER, 1, EVENT_BEAT_RADIANT_GYM_CLOVER, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymCloverRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_CLOVER_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymCloverRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymCloverRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer CLOVER, 2
	jump .cont
.sevenbadges
	loadtrainer CLOVER, 3
	jump .cont
.eightbadges
	loadtrainer CLOVER, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_CLOVER_REMATCH
	end
.FightDone
	writetext RadiantGymCloverRematchRegularText
	waitbutton
	closetext
	end

RadiantGymCloverRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymCloverRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymCloverRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymFelicia:
	generictrainer FELICIA, 1, EVENT_BEAT_RADIANT_GYM_FELICIA, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymFeliciaRematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RADIANT_GYM_FELICIA_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext RadiantGymFeliciaRematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext RadiantGymFeliciaRematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	loadtrainer FELICIA, 2
	jump .cont
.sevenbadges
	loadtrainer FELICIA, 3
	jump .cont
.eightbadges
	loadtrainer FELICIA, 4
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_RADIANT_GYM_FELICIA_REMATCH
	end
.FightDone
	writetext RadiantGymFeliciaRematchRegularText
	waitbutton
	closetext
	end

RadiantGymFeliciaRematchRegularText:
	text "NOMRAL TEXT"
	line "REMATCH"
	done

RadiantGymFeliciaRematchSeenText:
	text "SEEN TEXT"
	line "REMATCH"
	done

RadiantGymFeliciaRematchBeatenText:
	text "YOU WIN"
	line "REMATCH"
	done
	
RadiantGymGuyText1:
	text "TEXT 1"
	done
	
RadiantGymGuyText2:
	text "TEXT 2"
	done
	
RadiantGymChair:
	jumptext RadiantGymChairText
	
RadiantGymChairText:
	text "She has a second"
	line "rocking chair!"
	done
	
	