LusterGym_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterGymTrigger0
	scene_script LusterGymTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterGymCallback

	db 2 ; warp events
	warp_def 21, 14, 26, LUSTER_MALL
	warp_def 21, 15, 27, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	person_event SPRITE_GYM_GUY, 19, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterGymGuy, -1
	person_event SPRITE_POLLY,  6,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterGymPolly, -1
	person_event SPRITE_LASS, 18,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, LusterGymTrainer1, -1
	person_event SPRITE_DELINQUENT_F, 12,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer2, -1
	person_event SPRITE_LASS, 13,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, LusterGymTrainer3, -1
	person_event SPRITE_BEAUTY, 14,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer4, -1
	person_event SPRITE_BEAUTY,  7,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer5, -1
	person_event SPRITE_DELINQUENT_F,  8, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer6, -1

	const_def 1 ; object constants
	const LUSTER_GYM_GUY
	const LUSTER_GYM_POLLY

LusterGymTrigger0:
	pause 5
	clearevent EVENT_POLLY_NOT_IN_BOUTIQUE
	applyonemovement LUSTER_GYM_GUY, step_down
	opentext
	writetext LusterGymCallbackText
	waitbutton
	closetext
	applyonemovement PLAYER, turn_step_down
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	pause 5
	callasm LusterGymCheckPlayerXCoord
	ifequal $0f, .right
	warp2 DOWN, LUSTER_MALL, $14, $03
	end
.right
	warp2 DOWN, LUSTER_MALL, $15, $03
	end
	
LusterGymTrigger1:
	end

LusterGymCallback:
	callasm LusterGymCheckPlayerXCoord
	ifequal $0f, .moveperson
	return
.moveperson
	moveperson LUSTER_GYM_GUY, $0f, $13
	return
	
LusterGymCallbackText:
	text "Hey, TRAINER."
	
	para "The GYM LEADER"
	line "isn't here, <WAIT_S>sorry…"
	
	para "You just missed"
	line "her."
	
	para "She said she was"
	line "going clothes"
	cont "shopping."
	
	para "Maybe you could"
	line "go find her and"
	cont "ask her for a"
	cont "battle."
	done
	
LusterGymPolly:
	faceplayer
	opentext TEXTBOX_POLLY
	checkevent EVENT_BEAT_POLLY
	iftrue .FightDone
	writetext LusterGymPollyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymPollyTextWin, LusterGymPollyTextLoss
	loadtrainer POLLY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POLLY
	clearevent EVENT_HAVENT_BEAT_POLLY
	opentext
	writetext Text_ReceivedFifthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FIFTHBADGE
	checkcode VAR_BADGES
	changetextboxspeaker TEXTBOX_POLLY
	
.FightDone:	
	checkevent EVENT_TM09
	iftrue .GotTMFromPolly
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_1
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_2
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_3
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_4
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_5
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_6
	writetext LusterGymPollyTextAfterBattle
	buttonsound
	changetextboxspeaker
	verbosegivetmhm TM_VENOSHOCK
	setevent EVENT_TM09
	changetextboxspeaker TEXTBOX_POLLY
	writetext LusterGymPollyTextTMSpeech
	waitbutton
	closetext
	spriteface LUSTER_GYM_POLLY, DOWN
	end

.GotTMFromPolly:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue PollyTextLoop
	checkevent EVENT_CAN_REMATCH_POLLY
	iftrue LusterGymPollyRematch
PollyTextLoop:
	writetext LusterGymPollyTextLoop
	waitbutton
	closetext
	end
	
LusterGymPollyRematch:
	writetext LusterGymPollyTextBeforeBattleRematch
	yesorno
	iffalse .end
	writetext LusterGymPollyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymPollyTextWinRematch, LusterGymPollyTextLoss
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer POLLY, 1
	jump .cont
.sixbadges
	loadtrainer POLLY, 2
	jump .cont
.sevenbadges
	loadtrainer POLLY, 3
	jump .cont
.eightbadges
	loadtrainer POLLY, 4
.cont
	startbattle
	reloadmapafterbattle
	opentext TEXTBOX_POLLY
	writetext LusterGymPollyTextLoop
	waitbutton
	closetext
	clearevent EVENT_CAN_REMATCH_POLLY
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	spriteface LUSTER_GYM_POLLY, DOWN
	end
.end
	writetext LusterGymPollyTextNoRematch
	waitbutton
	closetext
	end
	
LusterGymPollyTextBeforeBattle:
	text "Oh, it's you…"
	
	para "Yeah, <WAIT_S>yeah, <WAIT_S>I'm"
	line "here."
	
	para "Not that I have"
	line "any real choice."
	
	para "My parents say"
	line "I'm some kind of"
	cont "<WAIT_S>“progidy”<WAIT_S> or some-"
	cont "thing."
	
	para "So they make me do"
	line "this stupid GYM"
	cont "LEADER thing."
	
	para "Let's get this over"
	line "with so I can get"
	cont "back to the MALL!"
	done
	
LusterGymPollyTextBeforeBattleRematch:
	text "Oh, it's you!"
	
	para "I haven't been"
	line "hanging out at the"
	cont "MALL much lately…"
	
	para "Ever since our"
	line "last battle, I've"
	cont "been training like"
	cont "crazy!"
	
	para "You want a"
	line "rematch?"
	done
	
LusterGymPollyTextAfterBattle:
	text "I've never had to"
	line "give out that"
	cont "badge before."
	
	para "It lets you use"
	line "SURF outside of"
	cont "battle."
	
	para "You should, <WAIT_S>uh…<WAIT_S>"
	line "also take this."
	done
	
LusterGymPollyTextTMSpeech:
	text "That TM contains"
	line "VENOSHOCK."
	
	para "It… <WAIT_S>uh…<WAIT_S> deals more"
	line "damage if your foe"
	cont "is POISONED."
	
	para "…"
	
	para "That battle was…<WAIT_L>"
	line "actually fun?"
	
	para "I can't remember"
	line "the last time I"
	cont "lost."
	
	para "Turns out battling"
	line "is actually a lot"
	cont "of fun when you"
	cont "have a tough"
	cont "opponent!"
	
	para "I think I'll stay"
	line "here and practice"
	cont "battling for a"
	cont "while."
	
	para "The MALL can wait!"
	
	para "You should come"
	line "back sometime for"
	cont "a rematch!"
	done
	
LusterGymPollyTextWin:
	text "Huh?"
	
	para "Wait, I actually"
	line "lost?"
	
	para "I guess you should"
	line "uh… <WAIT_M>take this."
	
	para "It's the #MON"
	line "LEAGUE BANEBADGE."
	done
	
LusterGymPollyTextWinRematch:
	text "You win again!"
	done
	
LusterGymPollyTextLoss:
	text "Finally."
	
	para "I can get back"
	line "to shopping!"
	done
	
LusterGymPollyTextLoop:
	text "Turns out battling"
	line "is actually a lot"
	cont "of fun when you"
	cont "have a tough"
	cont "opponent!"
	
	para "I think I'll stay"
	line "here and practice"
	cont "battling for a"
	cont "while."
	
	para "The MALL can wait!"
	
	para "You should come"
	line "back sometime for"
	cont "a rematch!"
	done
	
LusterGymPollyTextNoRematch:
	text "Aw, <WAIT_S>come on!"
	done
	
Text_ReceivedFifthBadge:
	text "<PLAYER> received"
	line "the BANEBADGE."
	done
	
LusterGymTrainer1:
	generictrainer LASS, KATHY, EVENT_BEAT_LUSTER_GYM_TRAINER_1, .SeenText, .BeatenText

	text "POLLY is only"
	line "around when she"
	cont "has to be."
	
	para "I don't think she"
	line "likes her job as"
	cont "GYM LEADER…"
	done

.SeenText:
	text "POLLY just came"
	line "through."
	
	para "That must mean"
	line "a challenger is"
	cont "on the way."
	
	para "Is that you?"
	done
	done

.BeatenText:
	text "Yep, <WAIT_S>you're not"
	line "bad!"
	done
	
LusterGymTrainer2:
	generictrainer DELINQUENT_F, TERI, EVENT_BEAT_LUSTER_GYM_TRAINER_2, .SeenText, .BeatenText

	text "To train POISON-"
	line "types, you've gotta"
	cont "be rotten to the"
	cont "core."
	
	para "Like me!"
	done

.SeenText:
	text "What is it with"
	line "all these goody-"
	cont "goodies training"
	cont "POISON-types?"
	
	para "It makes me sick!"
	done

.BeatenText:
	text "Yuck!"
	done
	
LusterGymTrainer3:
	generictrainer LASS, HARLEY, EVENT_BEAT_LUSTER_GYM_TRAINER_3, .SeenText, .BeatenText

	text "How is POLLY so"
	line "good at something"
	cont "she doesn't even"
	cont "practice?"
	
	para "It's so"
	line "frustrating!"
	done

.SeenText:
	text "POLLY doesn't"
	line "like to battle"
	cont "very much."
	
	para "So why can't I ever"
	line "beat her?"
	done

.BeatenText:
	text "I can't beat you"
	line "either?"
	done
	
LusterGymTrainer4:
	generictrainer BEAUTY, CLAIRE, EVENT_BEAT_LUSTER_GYM_TRAINER_4, .SeenText, .BeatenText

	text "Apparently the"
	line "planters are in"
	cont "the shape of"
	cont "POLLY's favorite!"
	done

.SeenText:
	text "Did you know the"
	line "planters in this"
	cont "GYM are arranged"
	cont "in the shape of"
	cont "a #MON?"
	done

.BeatenText:
	text "You know your"
	line "stuff!"
	done
	
LusterGymTrainer5:
	generictrainer BEAUTY, SAM, EVENT_BEAT_LUSTER_GYM_TRAINER_5, .SeenText, .BeatenText

	text "AAAEEEIII!"
	
	para "I just can't take"
	line "it!"
	
	para "POISON-types are"
	line "just so precious!"
	done

.SeenText:
	text "It's so unfair!"
	
	para "POISON-types get"
	line "such a bad rap."
	
	para "I'll show you how"
	line "sweet and cute"
	cont "they can be!"
	done

.BeatenText:
	text "My little"
	line "sweeties!"
	done
	
LusterGymTrainer6:
	generictrainer DELINQUENT_F, MEGAN, EVENT_BEAT_LUSTER_GYM_TRAINER_6, .SeenText, .BeatenText

	text "Whatever…"
	
	para "I really don't"
	line "care…"
	done

.SeenText:
	text "A battle?"
	
	para "Yeah, <WAIT_M>sure…"
	
	para "Whatever…"
	done

.BeatenText:
	text "Eh…"
	done
	
LusterGymGuy:
	checkevent EVENT_BEAT_POLLY
	iftrue .Won
	jumptextfaceplayer LusterGymGuyText1
.Won
	jumptextfaceplayer LusterGymGuyText2
	
LusterGymCheckPlayerXCoord:
	ld a, [wXCoord]
	ld [wScriptVar], a
	ret
	
LusterGymGuyText1:
	text "Yo!"
	line "Champ in making!"
	
	para "The GYM LEADER"
	line "finally returned!"
	
	para "And she didn't seem"
	line "too happy about"
	cont "it…"
	
	para "Anyway, don't let"
	line "their cute looks"
	cont "fool you,"
	
	para "the girls here all"
	line "use POISON-types."
	
	para "GRASS and FAIRY-"
	line "types should"
	cont "beware."
	
	para "PSYCHIC-type and"
	line "GROUND-type moves"
	cont "will give them"
	cont "lots of trouble,"
	cont "though!"
	
	para "Good luck!"
	done
	
LusterGymGuyText2:
	text "Nice job!"
	
	para "Yet another badge"
	line "in the books!"
	
	para "Keep it up, kid!"
	done