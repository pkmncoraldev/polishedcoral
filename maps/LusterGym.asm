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

	db 2 ; object events
	person_event SPRITE_GYM_GUY, 19, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterGymGuy, -1
	person_event SPRITE_POLLY,  1,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LusterGymPolly, -1

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
;	setevent EVENT_BEAT_GLINT_GYM_TRAINER_1
;	setevent EVENT_BEAT_GLINT_GYM_TRAINER_2
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
;	checkevent EVENT_BEAT_GLINT_GYM_TRAINER_1_REMATCH
;	iffalse PollyTextLoop
;	checkevent EVENT_BEAT_GLINT_GYM_TRAINER_2_REMATCH
;	iftrue LusterGymPollyRematch
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
	text "BEFORE BATTLE."
	done
	
LusterGymPollyTextBeforeBattleRematch:
	text "REMATCH?"
	done
	
LusterGymPollyTextAfterBattle:
	text "AFTER BATTLE."
	done
	
LusterGymPollyTextTMSpeech:
	text "TM SPEECH"
	done
	
LusterGymPollyTextWin:
	text "YOU WIN"
	done
	
LusterGymPollyTextWinRematch:
	text "YOU WIN REMATCH"
	done
	
LusterGymPollyTextLoss:
	text "YOU LOSE"
	done
	
LusterGymPollyTextLoop:
	text "SPEECH LOOP"
	done
	
LusterGymPollyTextNoRematch:
	text "NO REMATCH"
	done
	
Text_ReceivedFifthBadge:
	text "YOU GOT FIFTH"
	line "BADGE"
	done
	
LusterGymGuy:
	end
	
LusterGymCheckPlayerXCoord:
	ld a, [wXCoord]
	ld [wScriptVar], a
	ret