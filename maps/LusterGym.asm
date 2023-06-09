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

	db 1 ; object events
	person_event SPRITE_GYM_GUY, 19, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterGymGuy, -1

	const_def 1 ; object constants
	const LUSTER_GYM_GUY

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
	
LusterGymGuy:
	end
	
LusterGymCheckPlayerXCoord:
	ld a, [wXCoord]
	ld [wScriptVar], a
	ret