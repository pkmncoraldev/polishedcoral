SpookyForest1_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SpookyForest1Trigger0
	scene_script SpookyForest1Trigger1

	db 0 ; callbacks

	db 0 ; warp events

	db 4 ; coord events
	coord_event  0,  6, 0, SpookyForestReset
	coord_event  0,  7, 0, SpookyForestReset
	coord_event 13,  6, 0, SpookyForestReset
	coord_event 13,  7, 0, SpookyForestReset

	db 1 ; bg events
	signpost 10, 7, SIGNPOST_READ, SpookyForest1Sign

	db 0 ; object events

	
SpookyForest1Trigger0:
	end
	
SpookyForest1Trigger1:
	opentext
	writetext SpookyForest1KidGotLostText
	waitbutton
	closetext
	dotrigger $0
	end
	
SpookyForestReset:
	special Special_FadeBlackQuickly
	playsound SFX_PERISH_SONG
	waitsfx
	pause 5
	special FadeOutPalettes
	special Special_StopRunning
	checkflag ENGINE_HAVE_FOLLOWER
	iffalse .nofollower
	clearflag ENGINE_HAVE_FOLLOWER
	stopfollow
	domaptrigger SPOOKY_FOREST_1, $1
.nofollower
	warp2 UP, SPOOKY_FOREST_1, $7, $f
	end
	
SpookyForest1Sign:
	jumptext SpookyForest1SignText
	
SpookyForest1KidGotLostText:
	text "The KID got lost"
	line "in the darkness…"
	done
	
SpookyForest1SignText:
	text "BEWARE!"
	
	para "If you don't want"
	line "to get lost,"
	
	para "you must pay"
	line "very close atten-"
	cont "tion to your"
	cont "surroundings."
	
	para "Watch carefully"
	line "for clues."
	done