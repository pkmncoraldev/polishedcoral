TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadmemtrainer
	encountermusic
	jump StartBattleWithMapTrainerScript

SeenByTrainerScript:: ; 0xbe675
	special Special_StopRunning
	loadmemtrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	pause 1
	applymovement2 wMovementBuffer
	writepersonxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript: ; 0xbe68a
	opentext
	trainertext $0
	waitbuttonsilent
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
