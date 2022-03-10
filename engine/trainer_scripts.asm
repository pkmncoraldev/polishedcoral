TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadmemtrainer
	encountermusic
	jump StartBattleWithMapTrainerScript

SeenByTrainerScript:: ; 0xbe675
	special Special_StopRunning
	callasm SeenByTrainerLandmarkTimer
	loadmemtrainer
	callasm CheckTrainerClass
	if_equal PLAYER_CORY, AirportGuardScript
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	pause 1
	applymovement2 wMovementBuffer
	writepersonxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript

AirportGuardScript:
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
	domaptrigger ONWA_INTL_AIRPORT, $1
	warpfacing DOWN, ONWA_INTL_AIRPORT, $0d, $00
	end
	
StartBattleWithMapTrainerScript: ; 0xbe68a
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