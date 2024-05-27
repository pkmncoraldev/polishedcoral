HuntersThicket_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, HuntersThicketCallback

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29, 20, SIGNPOST_ITEM + SUN_STONE, EVENT_HUNTERS_THICKET_HIDDEN_SUN_STONE

	db 19 ; object events
	itemball_event  5, 20, CALCIUM, 1, EVENT_HUNTERS_THICKET_BALL_1
	itemball_event 18, 29, REPEL, 1, EVENT_HUNTERS_THICKET_BALL_2
	itemball_event 14, 21, X_SPEED, 1, EVENT_HUNTERS_THICKET_BALL_3
	person_event SPRITE_COOLTRAINER_F, 29, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerHunters_1, -1
	person_event SPRITE_BUG_CATCHER, 16, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerHunters_2, -1
	person_event SPRITE_PICNICKER, 19, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerHunters_3, -1
	object_event 10,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LEDIAN, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, HuntersThicketLedian, EVENT_HUNTERS_THICKET_LEDIAN_GONE
	fruittree_event  8, 14, FRUITTREE_HUNTERS_THICKET, CHESTO_BERRY
	tapeball_event 48, 13, MUSIC_ENCOUNTER_GYM_LEADER, 1, EVENT_MUSIC_ENCOUNTER_GYM_LEADER
	itemball_event 45, 16, POTION, 1, EVENT_HUNTERS_THICKET_BALL_4
	itemball_event 30, 10, POTION, 1, EVENT_HUNTERS_THICKET_BALL_5
	itemball_event 39,  5, POTION, 1, EVENT_HUNTERS_THICKET_BALL_6
	object_event 50,  4, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HuntersThicketDisguiseman, EVENT_HUNTERS_THICKET_DISGUISEMAN
	person_event SPRITE_CAMPER, 21, 40, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerHunters_4, -1
	person_event SPRITE_SUPER_NERD,  8, 32, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerHunters_5, -1
	person_event SPRITE_COOLTRAINER_F, 12, 51, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, TrainerHunters_6, -1
	person_event SPRITE_BUG_CATCHER, 12, 61, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerHunters_7, -1
	person_event SPRITE_ICESKATER_VARIABLE, 15, 51, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HuntersThicketRanger, EVENT_LEDIAN_RANGER_GONE
	itemball_event  51, 15, FIVESTARHELM, 1, EVENT_GOT_FIVESTARHELM


	const_def 1 ; object constants
	const HUNTERS_THICKET_POKE_BALL_1
	const HUNTERS_THICKET_POKE_BALL_2
	const HUNTERS_THICKET_POKE_BALL_3
	const HUNTERS_THICKET_TRAINER_1
	const HUNTERS_THICKET_TRAINER_2
	const HUNTERS_THICKET_TRAINER_3
	const HUNTERS_THICKET_LEDIAN
	const HUNTERS_THICKET_BERRY_TREE
	const HUNTERS_THICKET_POKE_BALL_4
	const HUNTERS_THICKET_POKE_BALL_5
	const HUNTERS_THICKET_POKE_BALL_6
	const HUNTERS_THICKET_POKE_BALL_7
	const HUNTERS_THICKET_DISGUISEMAN
	const HUNTERS_THICKET_TRAINER_4
	const HUNTERS_THICKET_TRAINER_5
	const HUNTERS_THICKET_TRAINER_6
	const HUNTERS_THICKET_TRAINER_7
	const HUNTERS_THICKET_LEDIAN_RANGER
	const HUNTERS_THICKET_HELM_ITEMBALL

HuntersThicketCallback:
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_LEDIAN_RANGER_MASK
	callasm HuntersThicketLoadDisguise
	if_equal 1, .one
	if_equal 2, .two
	if_equal 3, .three
	if_equal 4, .four
;.five
	return
.four
	moveperson HUNTERS_THICKET_POKE_BALL_7, 50, 4
	moveperson HUNTERS_THICKET_DISGUISEMAN, 39, 5
	return
.three
	moveperson HUNTERS_THICKET_POKE_BALL_6, 50, 4
	moveperson HUNTERS_THICKET_DISGUISEMAN, 30, 10
	return
.two
	moveperson HUNTERS_THICKET_POKE_BALL_5, 50, 4
	moveperson HUNTERS_THICKET_DISGUISEMAN, 45, 16
	return
.one
	moveperson HUNTERS_THICKET_POKE_BALL_4, 50, 4
	moveperson HUNTERS_THICKET_DISGUISEMAN, 48, 13
	return
	
HuntersThicketLoadDisguise:
	ld a, [wHuntersDisguise]
	ld [wScriptVar], a
	ret

HuntersThicketRanger:
;	waitsfx
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	scall LedianRangerPoseStart
	opentext
	writetext HuntersThicketRangerText1
	waitbutton
	closetext
	scall LedianRangerPoseEnd
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 10
	opentext
	writetext HuntersThicketRangerText2
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext HuntersThicketRangerText3
	waitbutton
	closetext
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 10
	opentext
	writetext HuntersThicketRangerText4
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext HuntersThicketRangerText5
	waitbutton
	closetext
	pause 10
	scall LedianRangerPoseStart
	opentext
	writetext HuntersThicketRangerText1
	waitbutton
	closetext	
	winlosstext HuntersThicketRangerWinText, 0
	setlasttalked HUNTERS_THICKET_LEDIAN_RANGER
	loadtrainer LEDIAN_RANGER, 1
	startbattle
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, DOWN
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	scall LedianRangerPoseStart
	opentext
	writetext HuntersThicketRangerText6
	waitbutton
	closetext
	scall LedianRangerPoseEnd
	pause 10
	clearevent EVENT_GOT_FIVESTARHELM
	faceplayer
	opentext
	writetext HuntersThicketRangerText12
	waitbutton
	closetext
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 10
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext HuntersThicketRangerText7
	jump .cont
.girl
	writetext HuntersThicketRangerText7_girl
.cont
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext HuntersThicketRangerText8
	waitbutton
	closetext
	pause 10
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_LEDIAN_RANGER_FACE
	playsound SFX_WALL_OPEN
	special MapCallbackSprites_LoadUsedSpritesGFX
	waitsfx
	pause 20
	opentext
	verbosegiveitem FIVESTARHELM
	iffalse .NoRoom
	setevent EVENT_GOT_FIVESTARHELM
	writetext HuntersThicketRangerText9
	waitbutton
	closetext
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 10
	opentext
	writetext HuntersThicketRangerText10
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext HuntersThicketRangerText11
	waitbutton
	closetext
	pause 10
	scall LedianRangerPoseStart2
	opentext
	writetext HuntersThicketRangerText1
	waitbutton
	closetext
	scall LedianRangerPoseEnd2
	playsound SFX_WARP_TO
	applyonemovement HUNTERS_THICKET_LEDIAN_RANGER, teleport_from
	disappear HUNTERS_THICKET_LEDIAN_RANGER
	special Special_FadeOutMusic
	pause 20
	playmapmusic
	end
.NoRoom
	writetext HuntersThicketRangerNoRoomText
	buttonsound
	writetext HuntersThicketRangerText9
	waitbutton
	closetext
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 10
	opentext
	writetext HuntersThicketRangerText10
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext HuntersThicketRangerText11
	waitbutton
	closetext
	pause 10
	scall LedianRangerPoseStart2
	opentext
	writetext HuntersThicketRangerText1
	waitbutton
	closetext
	scall LedianRangerPoseEnd2
	playsound SFX_WARP_TO
	appear HUNTERS_THICKET_HELM_ITEMBALL
	applyonemovement HUNTERS_THICKET_LEDIAN_RANGER, teleport_from
	disappear HUNTERS_THICKET_LEDIAN_RANGER
	special Special_FadeOutMusic
	pause 20
	playmapmusic
	end

LedianRangerPoseStart:
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, DOWN
	pause 20
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_LEDIAN_RANGER_MASK_POSE
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 6
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 12
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, LEFT
	pause 20
	end
	
LedianRangerPoseStart2:
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, DOWN
	pause 20
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_LEDIAN_RANGER_FACE_POSE
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 6
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, UP
	pause 12
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, LEFT
	pause 20
	end
	
LedianRangerPoseEnd:
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, DOWN
	pause 3
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_LEDIAN_RANGER_MASK
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

LedianRangerPoseEnd2:
	spriteface HUNTERS_THICKET_LEDIAN_RANGER, DOWN
	pause 3
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_LEDIAN_RANGER_FACE
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

HuntersThicketRangerText1:
	text "Go! Go!"
	line "LEDIAN RANGER!"
	
	para "COMET PUNCH to"
	line "victory!"
	done
	
HuntersThicketRangerText2:
	text "I hope that"
	line "sounded cool…"
	
	para "…"
	
	para "Oh, right!"
	done
	
HuntersThicketRangerText3:
	text "What's a shady"
	line "looking character"
	cont "such as yourself"
	cont "doing here?"
	
	para "Up to no good I'm"
	line "sure!"
	
	para "Don't try and deny"
	line "it!"
	
	para "I can see right"
	line "through your lies!"
	done
	
HuntersThicketRangerText4:
	text "Hehe… Nice…"
	
	para "That sounds"
	line "tough!"
	
	para "…"
	
	para "Oh, right!"
	done
	
HuntersThicketRangerText5:
	text "This is a job for"
	line "the LEDIAN RANGER!"
	
	para "Champion of peace"
	line "and justice!"
	
	para "I'll take you down"
	line "lickity-split!"
	done
	
HuntersThicketRangerText6:
	text "Of course!"

	para "Exactly as I"
	line "thought!"
	done
	
HuntersThicketRangerText12:
	text "I knew you were"
	line "a fellow warrior"
	cont "of justice!"
	
	para "What?"
	
	para "A shady character?"
	
	para "I don't remember"
	line "calling you that!"
	
	para "I simply had to"
	line "test you before"
	cont "making you my new"
	cont "sidekick."
	done
	
HuntersThicketRangerText7:
	text "I think he bought"
	line "it."
	
	para "…"
	
	para "Oh, right!"
	done
	
HuntersThicketRangerText7_girl:
	text "I think she bought"
	line "it."
	
	para "…"
	
	para "Oh, right!"
	done
	
HuntersThicketRangerText8:
	text "Of course!"
	
	para "From the moment I"
	line "saw you, I knew"
	cont "you were the one!"
	
	para "I shall dub you"
	line "“KID LEDYBA”!"
	
	para "Take this."
	done
	
HuntersThicketRangerText9:
	text "That helmet is"
	line "your symbol of"
	cont "justice!"
	
	para "Don't worry."
	
	para "I have plenty of"
	line "those things back"
	cont "at my apartme-"
	
	para "I mean…"
	
	para "…back at the"
	line "HQ BASE!"
	done
	
HuntersThicketRangerText10:
	text "Phew. That was a"
	line "close one…"
	
	para "…"
	
	para "Oh, right!"
	done
	
HuntersThicketRangerText11:
	text "Go out and be a"
	line "champion of peace"
	cont "and justice!"
	
	para "Just like your"
	line "idol."
	
	para "Me!"
	
	para "Until we meet"
	line "again, KID LEDYBA!"
	done

HuntersThicketRangerWinText:
	text "Go! Go!"
	line "LEDIAN RANGER!"
	
	para "COMET PUNCH to…"
	
	para "…defeat?"
	done

HuntersThicketRangerNoRoomText:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "I'll just leave"
	line "it here."
	done

HuntersThicketDisguiseman:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_DISGUISE_MASTER
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement HUNTERS_THICKET_DISGUISEMAN, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext HuntersThicket_DisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext HuntersThicketDisguisemanBeatenText, 0
	setlasttalked HUNTERS_THICKET_DISGUISEMAN
	loadtrainer DISGUISE, MASTER_5
	startbattle
	reloadmapafterbattle
	opentext
	writetext HuntersThicket_DisguiseMan1Text3
	waitbutton
	closetext
	applymovement HUNTERS_THICKET_DISGUISEMAN, Movement_StarglowCavern_DisguiseMan2
	disappear HUNTERS_THICKET_DISGUISEMAN
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	setevent EVENT_HUNTERS_THICKET_DISGUISEMAN
	end

HuntersThicket_DisguiseMan1Text1:
	text "TEXT 1"
	done

HuntersThicket_DisguiseMan1Text2:
	text "TEXT 2"
	done

HuntersThicket_DisguiseMan1Text3:
	text "TEXT 3"
	done

HuntersThicketDisguisemanBeatenText:
	text "YOU WIN!"
	done

HuntersThicketLedian:
	opentext
	writetext HuntersThicketLedianText
	cry LEDIAN
	waitbutton
	closetext
	waitsfx
	loadwildmon LEDIAN, 19
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear HUNTERS_THICKET_LEDIAN
	reloadmapafterbattle
	setevent EVENT_HUNTERS_THICKET_LEDIAN_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal LEDIAN, .CaughtLedian
	opentext
	writetext HuntersThicketLedianTextGone
	waitbutton
	closetext
.CaughtLedian
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end

HuntersThicketLedianText:
	text "LEDIIIII!"
	done

HuntersThicketLedianTextGone:
	text "LEDIAN flew off"
	line "into the woods!"
	done

TrainerHunters_1:
	generictrainer COOLTRAINERF, SALLY, EVENT_BEAT_HUNTERS_TRAINER_1, .SeenText, .BeatenText

	text "I was at 19 wins"
	line "in a row until you"
	cont "came along…"
	done

.SeenText:
	text "Nice!"
	
	para "Another TRAINER!"
	
	para "Time to keep my"
	line "winning streak"
	cont "going!"
	done

.BeatenText:
	text "No!"
	
	para "My winning streak!"
	done
	
TrainerHunters_2:
	generictrainer BUG_CATCHER, JOSH, EVENT_BEAT_HUNTERS_TRAINER_2, .SeenText, .BeatenText

	text "My BUG #MON"
	line "ARE rocks!"
	done

.SeenText:
	text "BUG #MON rock!"
	
	para "Let me show you!"
	done

.BeatenText:
	text "See?"
	
	para "I told you."
	done
	
TrainerHunters_3:
	generictrainer PICNICKER, TRISTA, EVENT_BEAT_HUNTERS_TRAINER_3, .SeenText, .BeatenText

	text "Why'd you have to"
	line "come along and"
	cont "ruin my good time?"
	done

.SeenText:
	text "Isn't this spot"
	line "just beautiful?"
	
	para "This is my favor-"
	line "ite place in the"
	cont "whole wide world!"
	done

.BeatenText:
	text "Who invited you?"
	done
	
TrainerHunters_4:
	generictrainer CAMPER, JERRY, EVENT_BEAT_HUNTERS_TRAINER_4, .SeenText, .BeatenText

	text "I saw some guy"
	line "dressed up like a"
	cont "#BALL and this"
	cont "other dude in a"
	cont "LEDIAN costume."
	
	para "What a bunch of"
	line "FREAKS!"
	done

.SeenText:
	text "A bunch of weirdos"
	line "seem to hang out"
	cont "around here…"
	
	para "What?"
	
	para "No, not me!"
	done

.BeatenText:
	text "Argh!"
	done
	
TrainerHunters_5:
	generictrainer SUPER_NERD, GREG, EVENT_BEAT_HUNTERS_TRAINER_5, .SeenText, .BeatenText

	text "Go! Go!"
	line "LEDIAN RANGER!"
	
	para "COMET PUNCH to"
	line "victory!"
	done

.SeenText:
	text "Have you heard of"
	line "the LEDIAN RANGER?"
	
	para "He's the coolest!"
	done

.BeatenText:
	text "It's over for me!"
	done
	
TrainerHunters_6:
	generictrainer COOLTRAINERF, LOIS, EVENT_BEAT_HUNTERS_TRAINER_6, .SeenText, .BeatenText

	text "Whew!"
	
	para "You're tough."
	
	para "I'm having trouble"
	line "keeping up!"
	done

.SeenText:
	text "The woods makes"
	line "for excellent"
	cont "training!"
	
	para "Come on, let's go"
	line "a round!"
	done

.BeatenText:
	text "Another round?"
	done
	
TrainerHunters_7:
	generictrainer BUG_CATCHER, JOEL, EVENT_BEAT_HUNTERS_TRAINER_7, .SeenText, .BeatenText

	text "I'm more into hunt-"
	line "ing for #MON"
	cont "than battling."
	done

.SeenText:
	text "Some kids catch"
	line "bugs because they"
	cont "think they're cool"
	cont "or gross."
	
	para "I do it for the"
	line "thrill of the"
	cont "hunt!"
	done

.BeatenText:
	text "What a thrill!"
	done
