TwinkleGymEntry_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymEntryTrigger0
	scene_script TwinkleGymEntryTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 11,  6, 7, TWINKLE_TOWN
	warp_def 11,  7, 7, TWINKLE_TOWN

	db 2 ; coord events
	xy_trigger 0,  9,  4, 0, TwinkleGymEntryClerkStopsYouL, 0, 0
	xy_trigger 0,  9,  9, 0, TwinkleGymEntryClerkStopsYouR, 0, 0

	db 0 ; bg events

	db 2 ; object events
	object_event  6,  7, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinkleGymEntryClerk, -1
	object_event  9, 10, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymGuyScript, -1

	
	const_def 1 ; object constants
	const TWINKLE_GYM_ENTRY_CLERK
	const TWINKLE_GYM_ENTRY_GYM_GUY
	
	
TwinkleGymEntryTrigger0:
	end
	
TwinkleGymEntryTrigger1:
	end
	
TwinkleGymEntryClerkStopsYouL:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_ENTRY_CLERK, LEFT
	showemote EMOTE_SHOCK, TWINKLE_GYM_ENTRY_CLERK, 15
	pause 7
	spriteface PLAYER, RIGHT
	opentext
	writetext TwinkleGymEntryClerkTextExcuseMe
	waitbutton
	closetext
	spriteface TWINKLE_GYM_ENTRY_CLERK, DOWN
	applymovement PLAYER, Movement_TwinkleGymEntryL
	opentext
	writetext TwinkleGymEntryClerkTextExcuseMe2
	jump TwinkleGymEntryClerk.cont
	end
	
TwinkleGymEntryClerkStopsYouR:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_ENTRY_CLERK, RIGHT
	showemote EMOTE_SHOCK, TWINKLE_GYM_ENTRY_CLERK, 15
	pause 7
	spriteface PLAYER, LEFT
	opentext
	writetext TwinkleGymEntryClerkTextExcuseMe
	waitbutton
	closetext
	spriteface TWINKLE_GYM_ENTRY_CLERK, DOWN
	applymovement PLAYER, Movement_TwinkleGymEntryR
	opentext
	writetext TwinkleGymEntryClerkTextExcuseMe2
	jump TwinkleGymEntryClerk.cont
	end
	
TwinkleGymEntryClerk:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLUE_KEY
	iftrue .gotbluekey
	writetext TwinkleGymEntryClerkText1
.cont
	yesorno
	iffalse .saidno
	setevent EVENT_GOT_BLUE_KEY
	dotrigger $1
	writetext TwinkleGymEntryClerkText2
	waitbutton
	verbosegiveitem B_ROOM_KEY
	writetext TwinkleGymEntryClerkText3
	waitbutton
	closetext
	end
.gotbluekey
	checkevent EVENT_CAN_GET_YELLOW_KEY
	iftrue .yellow
	writetext TwinkleGymEntryClerkText4
	waitbutton
	closetext
	end
.yellow
	checkevent EVENT_GOT_YELLOW_KEY
	iftrue .gotyellowkey
	writetext TwinkleGymEntryClerkText5
	waitbutton
	takeitem B_ROOM_KEY
	verbosegiveitem Y_ROOM_KEY
	writetext TwinkleGymEntryClerkText6
	waitbutton
	closetext
	setevent EVENT_GOT_YELLOW_KEY
	end
.gotyellowkey
	checkevent EVENT_CAN_GET_RED_KEY
	iftrue .red
	writetext TwinkleGymEntryClerkText7
	waitbutton
	closetext
	end
.red
	checkevent EVENT_GOT_RED_KEY
	iftrue .gotredkey
	writetext TwinkleGymEntryClerkText8
	waitbutton
	takeitem Y_ROOM_KEY
	verbosegiveitem R_ROOM_KEY
	writetext TwinkleGymEntryClerkText9
	waitbutton
	closetext
	setevent EVENT_GOT_RED_KEY
	end
.gotredkey
	writetext TwinkleGymEntryClerkText10
	waitbutton
	closetext
	end
.saidno
	writetext TwinkleGymEntryClerkSaidNo
	waitbutton
	closetext
	end
	
TwinkleGymGuyScript:
	opentext
	yesorno
	iffalse .skip
	setevent EVENT_CAN_GET_YELLOW_KEY
.skip
	yesorno
	iffalse .skip2
	setevent EVENT_CAN_GET_RED_KEY
.skip2
	closetext
	end
	
TwinkleGymEntryClerkText1:
	text "TEXT 1"
	done
	
TwinkleGymEntryClerkText2:
	text "TEXT 2"
	done
	
TwinkleGymEntryClerkText3:
	text "TEXT 3"
	done
	
TwinkleGymEntryClerkText4:
	text "TEXT 4"
	done
	
TwinkleGymEntryClerkText5:
	text "TEXT 5"
	
	para "<PLAYER> handed"
	line "over the B.ROOM"
	cont "KEY."
	done
	
TwinkleGymEntryClerkText6:
	text "TEXT 6"
	done
	
TwinkleGymEntryClerkText7:
	text "TEXT 7"
	done
	
TwinkleGymEntryClerkText8:
	text "TEXT 8"
	
	para "<PLAYER> handed"
	line "over the Y.ROOM" 
	cont "KEY."
	done
	
TwinkleGymEntryClerkText9:
	text "TEXT 9"
	done
	
TwinkleGymEntryClerkText10:
	text "TEXT 10"
	done
	
TwinkleGymEntryClerkTextExcuseMe:
	text "Excuse me!"
	done
	
TwinkleGymEntryClerkTextExcuseMe2:
	text "Are you here to"
	line "challenge the GYM?"
	done
	
TwinkleGymEntryClerkSaidNo:
	text "Alright then."
	
	para "Have a good day!"
	done

Movement_TwinkleGymEntryL:
	step_right
	step_right
	turn_step_up
	step_end
	
Movement_TwinkleGymEntryR:
	step_left
	step_left
	step_left
	turn_step_up
	step_end
