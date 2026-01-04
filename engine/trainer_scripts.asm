TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadmemtrainer
	callasm CheckTrainerClass
	if_equal PLAYER_CORY, TalkToAirportGuardScript
	if_equal PLAYER_CORA, TalkToBankCardGirlScript
	encountermusic
	jump StartBattleWithMapTrainerScript
	
TalkToAirportGuardScript:
	clearevent EVENT_AIRPORT_FENCE
	faceobject PLAYER, LAST_TALKED
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	opentext
	trainertext $0
	waitbutton
	waitsfx
	closetext
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	loadvar wOtherTrainerClass, 0
	domaptrigger ONWA_INTL_AIRPORT, $1
	warp2 DOWN, ONWA_INTL_AIRPORT, $0d, $00
	end
	
TalkToBankCardGirlScript::
	faceobject PLAYER, LAST_TALKED
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .talking_again2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue .talking_again
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	writetext BankCardNPCText1
	jump .cont
.talking_again
	writetext BankCardNPCText1_2
.cont
	yesorno
	iffalse .no
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext BankCardNPCText2
	jump .cont2
.talking_again2
	writetext BankCardNPCText2_2
.cont2
	yesorno
	iffalse .no
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext BankCardNPCText3_boy
	jump .cont3
.girl
	writetext BankCardNPCText3_girl
.cont3
	playsound SFX_LEVEL_UP
	waitsfx
	waitbutton
	closetext
	pause 15
	opentext
	writetext BankCardNPCText4
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	applymovement 13, Movement_BankGirl1
	jump .cont4
.YouAreFacingUp
	applymovement 13, Movement_BankGirl2
.cont4
	disappear 13
	pause 10
	spriteface PLAYER, DOWN
	opentext
	writetext BankCardNPCText6
	waitbutton
	closetext
	loadvar wOtherTrainerClass, 0
	loadvar wSpamCalls, 7
	loadvar wSpamCallSteps, 2
	loadvar wSpamCallSteps+1, 0
	end
.no
	writetext BankCardNPCTextNo
	waitbutton
	closetext
	loadvar wOtherTrainerClass, 0
	end
	
BankCardNPCText1:
	text "Hiiiiii!<WAIT_S>"
	line "(smile, smile)"
	
	para "Can I have just a"
	line "moment of your"
	cont "time? <WAIT_S>(smile)<WAIT_S>"
	done
	
BankCardNPCText1_2:
	text "Hiiiiii!<WAIT_S>"
	line "(smile, smile)"
	
	para "Change your mind?<WAIT_S>"
	line "(smile, smile)"
	
	para "Can I have just a"
	line "moment of your"
	cont "time? <WAIT_S>(smile)<WAIT_S>"
	done
	
BankCardNPCText2:
	text "I'm out here giving"
	line "away good stuff to"
	cont "make people happy!"
	
	para "You wanna be happy"
	line "too, right?"
	
	para "Of course ya do!<WAIT_S>"
	line "(smile, smile)"
	
	para "All I need is a"
	line "little bit of your"
	cont "information."
	
	para "Nothing big, just"
	line "your name, home"
	cont "address, and your"
	cont "#GEAR number."
	
	para "If you'll write all"
	line "that down for me,"
	cont "I'll give you a"
	cont "special gift!"
	
	para "A BANK CARD for"
	line "your #GEAR!"
	
	para "Whad'ya say?<WAIT_S>"
	line "(smile, smile)<WAIT_S>"
	done
	
BankCardNPCText2_2:
	text "Hiiiiii!<WAIT_S>"
	line "(smile, smile)"
	
	para "Change your mind?<WAIT_S>"
	line "(smile, smile)"
	
	para "If you give me"
	line "your name, home"
	cont "address, and your"
	cont "#GEAR number,"
	
	para "I'll give you a"
	line "BANK CARD for"
	cont "your #GEAR."
	
	para "Whad'ya say?<WAIT_S>"
	line "(smile, smile)<WAIT_S>"
	done
	
BankCardNPCText3_boy:
	text "<PLAYER> gave the"
	line "odd lady his info…"
	done
	
BankCardNPCText3_girl:
	text "<PLAYER> gave the"
	line "odd lady her info…"
	done
	
BankCardNPCText4:
	text "Thank you!!!<WAIT_S>"
	line "I'm finally done!!!"
	
	para "I met my quota!"
	
	para "Yippee!!!"
	
	para "Huh?<WAIT_S> Your gift?"
	
	para "It'll be in the"
	line "mail…<WAIT_M>I think."
	
	para "Oh well, not my"
	line "problem."
	
	para "See ya later!"
	done
	
; BankCardNPCText5:
	; text "I'm finally done!<WAIT_S>"
	; line "I met my quota!"
	
	; para "Yippee!!!"
	
	; para "See ya later!"
	; done
	
BankCardNPCText6:
	text "Was that really"
	line "such a good idea?"
	done
	
BankCardNPCTextNo:
	text "Oh boo!<WAIT_S>"
	line "(pout, pout)"
	done
	
Movement_BankGirl1:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end

Movement_BankGirl2:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end
	
Movement_BankGirl3:
	step_right
	step_right
	step_end
	
Movement_BankGirl4:
	step_left
	step_left
	step_end

SeenByTrainerScript:: ; 0xbe675
	special Special_StopRunning
	callasm SeenByTrainerLandmarkTimer
	loadmemtrainer
	callasm CheckTrainerClass
	if_equal PLAYER_CORY, SeenByAirportGuardScript
	if_equal PLAYER_CORA, SeenByBankCardGirlScript
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	pause 1
	applymovement2 wMovementBuffer
	writepersonxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript

SeenByAirportGuardScript:
	clearevent EVENT_AIRPORT_FENCE
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	pause 1
	applymovement2 wMovementBuffer
	writepersonxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	opentext
	trainertext $0
	waitbutton
	waitsfx
	closetext
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	loadvar wOtherTrainerClass, 0
	domaptrigger ONWA_INTL_AIRPORT, $1
	warp2 DOWN, ONWA_INTL_AIRPORT, $0d, $00
	end
	
SeenByBankCardGirlScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	pause 1
	applymovement2 wMovementBuffer
	writepersonxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	opentext
	writetext BankCardNPCText1
	yesorno
	iffalse .no
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext BankCardNPCText2
	yesorno
	iffalse .no
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext BankCardNPCText3_boy
	jump .cont
.girl
	writetext BankCardNPCText3_girl
.cont
	playsound SFX_LEVEL_UP
	waitsfx
	waitbutton
	closetext
	pause 15
	opentext
	writetext BankCardNPCText4
	waitbutton
	closetext
	applymovement 13, Movement_BankGirl1
	disappear 13
	pause 10
	spriteface PLAYER, DOWN
	opentext
	writetext BankCardNPCText6
	waitbutton
	closetext
	loadvar wOtherTrainerClass, 0
	loadvar wSpamCalls, 7
	loadvar wSpamCallSteps, 2
	loadvar wSpamCallSteps+1, 0
	end
.no
	writetext BankCardNPCTextNo
	waitbutton
	closetext
	loadvar wOtherTrainerClass, 0
	checkcode VAR_XCOORD
	if_equal 12, .left_1
	if_equal 13, .left_2
	if_equal 17, .right_1
	if_equal 18, .right_2
	end
.left_1
	applymovement 13, Movement_BankGirl3
	jump .step_end
.left_2
	applyonemovement 13, step_right
	jump .step_end
.right_1
	applyonemovement 13, step_left
	jump .step_end
.right_2
	applymovement 13, Movement_BankGirl4
.step_end
	applyonemovement 13, step_sleep_1
	end
	
StartBattleWithMapTrainerScript: ; 0xbe68a
	loadvar wSkateboardGrinding, 0
	opentext
	trainertext $0
	waitbutton
	waitsfx
	closetext
	loadmemtrainer
	callasm CheckTrainerClass
	iffalse .nobattle
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadvar wRunningTrainerBattleScript, -1
	jump AlreadyBeatenTrainerScript
.nobattle
	reloadmap
	trainerflagaction SET_FLAG
	loadvar wRunningTrainerBattleScript, -1

AlreadyBeatenTrainerScript:
	scripttalkafter

CheckTrainerClass:
	ld a, [wTempTrainerClass]
	ld [wScriptVar], a
	ret
SeenByTrainerLandmarkTimer:
	xor a
	ld [wLandmarkSignTimer], a
	ret