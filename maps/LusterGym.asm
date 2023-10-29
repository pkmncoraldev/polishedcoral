LusterGym_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterGymTrigger0
	scene_script LusterGymTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterGymCallback

	db 2 ; warp events
	warp_def 21, 14, 25, LUSTER_MALL
	warp_def 21, 15, 26, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 14 ; object events
	person_event SPRITE_GYM_GUY, 19, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterGymGuy, -1
	person_event SPRITE_POLLY,  3,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterGymPolly, -1
	person_event SPRITE_LASS, 18,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, LusterGymTrainer1, EVENT_BEAT_POLLY
	person_event SPRITE_DELINQUENT_F, 12,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer2, EVENT_BEAT_POLLY
	person_event SPRITE_LASS, 13,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, LusterGymTrainer3, EVENT_BEAT_POLLY
	person_event SPRITE_BEAUTY, 14,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer4, EVENT_BEAT_POLLY
	person_event SPRITE_BEAUTY,  7,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer5, EVENT_BEAT_POLLY
	person_event SPRITE_DELINQUENT_F,  8, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, LusterGymTrainer6, EVENT_BEAT_POLLY
	person_event SPRITE_LASS, 18,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterGymTrainer1Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_DELINQUENT_F, 12,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer2Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_LASS, 13,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterGymTrainer3Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_BEAUTY, 14,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer4Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_BEAUTY,  7,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer5Rematch, EVENT_HAVENT_BEAT_POLLY
	person_event SPRITE_DELINQUENT_F,  8, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterGymTrainer6Rematch, EVENT_HAVENT_BEAT_POLLY

	const_def 1 ; object constants
	const LUSTER_GYM_GUY
	const LUSTER_GYM_POLLY

LusterGymTrigger0:
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
	warp2 DOWN, LUSTER_MALL, $10, $03
	end
.right
	warp2 DOWN, LUSTER_MALL, $11, $03
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
	line "isn't here, sorry…"
	
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
	opentext
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
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_POLLY
	iftrue .GotTMFromPolly
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_1
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_2
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_3
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_4
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_5
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_6
	writetext LusterGymPollyTextAfterBattle
	buttonsound
;	verbosegivetmhm TM_FAKE_OUT
	setevent EVENT_GOT_TM_FROM_POLLY
	writetext LusterGymPollyTextTMSpeech
	waitbutton
	closetext
	spriteface LUSTER_GYM_POLLY, DOWN
	end

.GotTMFromPolly:
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	iffalse PollyTextLoop
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
	iftrue LusterGymPollyRematch
PollyTextLoop:
	writetext LusterGymPollyTextLoop
	waitbutton
	closetext
	end
	
LusterGymPollyRematch:
	checkevent EVENT_BEAT_POLLY_REMATCH
	iftrue PollyTextLoop
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
	opentext
	writetext LusterGymPollyTextLoop
	waitbutton
	closetext
	setevent EVENT_BEAT_POLLY_REMATCH
	spriteface LUSTER_GYM_POLLY, DOWN
	end
.end
	writetext LusterGymPollyTextNoRematch
	waitbutton
	closetext
	end
	
LusterGymPollyTextBeforeBattle:
	text "Oh it's you…"
	
	para "Yeah, yeah, I'm"
	line "here."
	
	para "Not that I have"
	line "any real choice."
	
	para "My parents say"
	line "I'm some kind of"
	cont "“progidy” or some-"
	cont "thing."
	
	para "So they make me do"
	line "this stupid GYM"
	cont "LEADER thing."
	
	para "Let's get this over"
	line "with so I can get"
	cont "back to the MALL!"
	done
	
LusterGymPollyTextBeforeBattleRematch:
	text "Oh it's you!"
	
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
	
	para "You should, uh…"
	line "also take this."
	done
	
LusterGymPollyTextTMSpeech:
	text "TM SPEECH"
	
	para "…"
	
	para "That battle was…"
	
	para "Actually fun?"
	
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
	line "uh… take this."
	
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
	text "Aw, come on!"
	done
	
Text_ReceivedFifthBadge:
	text "<PLAYER> received"
	line "the BANEBADGE."
	done
	
LusterGymTrainer1:
	generictrainer LASS, KATHY_5, EVENT_BEAT_LUSTER_GYM_TRAINER_1, .SeenText, .BeatenText

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
	text "Yep, you're not"
	line "bad!"
	done
	
LusterGymTrainer2:
	generictrainer DELINQUENT_F, LIZ_5, EVENT_BEAT_LUSTER_GYM_TRAINER_2, .SeenText, .BeatenText

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
	generictrainer LASS, BEBE_5, EVENT_BEAT_LUSTER_GYM_TRAINER_3, .SeenText, .BeatenText

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
	generictrainer BEAUTY, CLAIRE_5, EVENT_BEAT_LUSTER_GYM_TRAINER_4, .SeenText, .BeatenText

	text "Apparently they're"
	line "in the shape of"
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
	generictrainer BEAUTY, SAM_5, EVENT_BEAT_LUSTER_GYM_TRAINER_5, .SeenText, .BeatenText

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
	generictrainer DELINQUENT_F, MEGAN_5, EVENT_BEAT_LUSTER_GYM_TRAINER_6, .SeenText, .BeatenText

	text "Whatever…"
	
	para "I really don't"
	line "care…"
	done

.SeenText:
	text "A battle?"
	
	para "Yeah, sure…"
	
	para "Whatever…"
	done

.BeatenText:
	text "Eh…"
	done
	
LusterGymTrainer1Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext LusterGymTrainer1RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer1RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer LASS, KATHY_5
	jump .cont
.sixbadges
	loadtrainer LASS, KATHY_6
	jump .cont
.sevenbadges
	loadtrainer LASS, KATHY_7
	jump .cont
.eightbadges
	loadtrainer LASS, KATHY_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_1_REMATCH
	end
.FightDone
	writetext LusterGymTrainer1RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer1RematchRegularText:
	text "POLLY has been"
	line "around a lot more"
	cont "lately!"
	
	para "I wonder if she's"
	line "starting to like"
	cont "being GYM LEADER."
	done

LusterGymTrainer1RematchSeenText:
	text "Oh it's you."
	
	para "You here to battle"
	line "POLLY again?"
	done

LusterGymTrainer1RematchBeatenText:
	text "Yep, you're not"
	line "bad!"
	done
	
LusterGymTrainer2Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	iftrue .FightDone
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext LusterGymTrainer2RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer2RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer DELINQUENT_F, LIZ_5
	jump .cont
.sixbadges
	loadtrainer DELINQUENT_F, LIZ_6
	jump .cont
.sevenbadges
	loadtrainer DELINQUENT_F, LIZ_7
	jump .cont
.eightbadges
	loadtrainer DELINQUENT_F, LIZ_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_2_REMATCH
	end
.FightDone
	writetext LusterGymTrainer2RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer2RematchRegularText:
	text "To train POISON-"
	line "types, you've gotta"
	cont "be rotten to the"
	cont "core."
	
	para "Like me!"
	done

LusterGymTrainer2RematchSeenText:
	text "What is it with"
	line "all these goody-"
	cont "goodies training"
	cont "POISON-types?"

LusterGymTrainer2RematchBeatenText:
	text "Yuck!"
	done
	
LusterGymTrainer3Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	iftrue .FightDone
	playmusic MUSIC_LASS_ENCOUNTER
	writetext LusterGymTrainer3RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer3RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer LASS, BEBE_5
	jump .cont
.sixbadges
	loadtrainer LASS, BEBE_6
	jump .cont
.sevenbadges
	loadtrainer LASS, BEBE_7
	jump .cont
.eightbadges
	loadtrainer LASS, BEBE_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_3_REMATCH
	end
.FightDone
	writetext LusterGymTrainer3RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer3RematchRegularText:
	text "How is POLLY so"
	line "good at something"
	cont "she doesn't even"
	cont "practice?"
	
	para "It's so"
	line "frustrating!"
	done

LusterGymTrainer3RematchSeenText:
	text "One day I'll"
	line "finally beat POLLY."
	
	para "But first I'll try"
	line "against you again!"
	done

LusterGymTrainer3RematchBeatenText:
	text "I still can't"
	line "beat you either?"
	done
	
LusterGymTrainer4Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	iftrue .FightDone
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	writetext LusterGymTrainer4RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer4RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer BEAUTY, CLAIRE_5
	jump .cont
.sixbadges
	loadtrainer BEAUTY, CLAIRE_6
	jump .cont
.sevenbadges
	loadtrainer BEAUTY, CLAIRE_7
	jump .cont
.eightbadges
	loadtrainer BEAUTY, CLAIRE_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_4_REMATCH
	end
.FightDone
	writetext LusterGymTrainer4RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer4RematchRegularText:
	text "Apparently they're"
	line "in the shape of"
	cont "POLLY's favorite!"
	done

LusterGymTrainer4RematchSeenText:
	text "Have you figured"
	line "out the shape of"
	cont "the planters yet?"
	done

LusterGymTrainer4RematchBeatenText:
	text "You know your"
	line "stuff!"
	done
	
LusterGymTrainer5Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	iftrue .FightDone
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	writetext LusterGymTrainer5RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer5RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer BEAUTY, SAM_5
	jump .cont
.sixbadges
	loadtrainer BEAUTY, SAM_6
	jump .cont
.sevenbadges
	loadtrainer BEAUTY, SAM_7
	jump .cont
.eightbadges
	loadtrainer BEAUTY, SAM_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_5_REMATCH
	end
.FightDone
	writetext LusterGymTrainer5RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer5RematchRegularText:
	text "AAAEEEIII!"
	
	para "I just can't take"
	line "it!"
	
	para "POISON-types are"
	line "just so precious!"
	done

LusterGymTrainer5RematchSeenText:
	text "Don't you see how"
	line "sweet POISON-type"
	cont "#MON are?"
	
	para "I'll show you"
	line "again!"
	done

LusterGymTrainer5RematchBeatenText:
	text "My little"
	line "sweeties!"
	done
	
LusterGymTrainer6Rematch:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
	iftrue .FightDone
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext LusterGymTrainer6RematchSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LusterGymTrainer6RematchBeatenText, 0
	checkcode VAR_BADGES
	ifequal 8, .eightbadges
	ifequal 7, .sevenbadges
	ifequal 6, .sixbadges
	loadtrainer DELINQUENT_F, MEGAN_5
	jump .cont
.sixbadges
	loadtrainer DELINQUENT_F, MEGAN_6
	jump .cont
.sevenbadges
	loadtrainer DELINQUENT_F, MEGAN_7
	jump .cont
.eightbadges
	loadtrainer DELINQUENT_F, MEGAN_8
.cont
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_BEAT_LUSTER_GYM_TRAINER_6_REMATCH
	end
.FightDone
	writetext LusterGymTrainer6RematchRegularText
	waitbutton
	closetext
	end

LusterGymTrainer6RematchRegularText:
	text "Whatever…"
	
	para "I still don't"
	line "really care…"
	done

LusterGymTrainer6RematchSeenText:
	text "Another battle?"
	
	para "Yeah, sure…"
	
	para "Whatever…"
	done

LusterGymTrainer6RematchBeatenText:
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
	
	para "Champ in making!"
	
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