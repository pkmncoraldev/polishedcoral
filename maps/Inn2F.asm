Inn2F_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Inn2FTrigger0

	db 0 ; callbacks

	db 17 ; warp events
	warp_event -1, -1, INN_1F, 3
	warp_event 21, 11, INN_1F, 4
	warp_event  0, 11, INN_3F, 1
	warp_event -1, -1, INN_3F, 2
	warp_event  3, 11, INN_2F, 9
	warp_event  7, 11, INN_2F, 11
	warp_event 15, 11, INN_2F, 13
	warp_event 19, 11, INN_2F, 15
	warp_event  1,  5, INN_2F, 5
	warp_event  0,  5, INN_2F, 5
	warp_event  7,  5, INN_2F, 6
	warp_event  6,  5, INN_2F, 6
	warp_event 18,  5, INN_2F, 7
	warp_event 19,  5, INN_2F, 7
	warp_event 24,  5, INN_2F, 8
	warp_event 25,  5, INN_2F, 8
	warp_event 11, 11, INN_ELEVATOR, 1

	db 0 ; coord events

	db 14 ; bg events
	signpost 11,  5, SIGNPOST_JUMPTEXT, Inn1FPainting1Text
	signpost 11, 17, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost 11, 18, SIGNPOST_JUMPTEXT, Inn2F201Text
	signpost 11, 14, SIGNPOST_JUMPTEXT, Inn2F202Text
	signpost 11,  8, SIGNPOST_JUMPTEXT, Inn2F203Text
	signpost 11,  4, SIGNPOST_JUMPTEXT, Inn2F204Text
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text

	db 8 ; object events
	person_event SPRITE_FAT_GUY, -1, -1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, EVENT_ALWAYS_SET
	person_event SPRITE_INVISIBLE, 11,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn2F204Door, EVENT_INN_2F_204_OPEN
	person_event SPRITE_INVISIBLE, 11,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn2F203Door, -1
	person_event SPRITE_INVISIBLE, 11, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_INVISIBLE, 11, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_INVISIBLE, 11, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn2F201LockedDoor, EVENT_INN_2F_201_OPEN
	person_event SPRITE_SNARE_GIRL,  5, 25, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerInn2F_1, -1
	person_event SPRITE_SNARE,  2, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerInn2F_2, -1
	
	const_def 1 ; object constants
	const INN_2F_CLERK
	const INN_2F_DOOR_LOCK_1
	const INN_2F_DOOR_LOCK_2
	const INN_2F_DOOR_LOCK_3
	const INN_2F_DOOR_LOCK_4
	const INN_2F_DOOR_LOCK_5
	
	
Inn2FTrigger0:
	callasm Inn1FRunningInTheHallsASM
	ifnotequal 0, .running
	end
.running
	disappear INN_2F_CLERK
	callasm Inn2FMoveClerkAsm
	ifequal 2, .right
	appear INN_2F_CLERK
	special Special_StopRunning
	applyonemovement INN_2F_CLERK, big_step_left
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_2F_CLERK, slow_step_right
	disappear INN_2F_CLERK
	callasm Inn1FResertScriptVar
	end
.right
	appear INN_2F_CLERK
	special Special_StopRunning
	applyonemovement INN_2F_CLERK, big_step_right
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_2F_CLERK, slow_step_left
	disappear INN_2F_CLERK
	callasm Inn1FResertScriptVar
	end
	
Inn2FMoveClerkAsm:
	ld a, [wXCoord]
	cp $0b
	jr nc, .right
	ld a, 1
	ld [wScriptVar], a
	ld a, INN_2F_CLERK
	ld b, a
	ld a, [wXCoord]
	add 6
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
.right
	ld a, 2
	ld [wScriptVar], a
	ld a, INN_2F_CLERK
	ld b, a
	ld a, [wXCoord]
	sub 5
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
Inn2F204Door:
	checkevent EVENT_BEAT_INN_1F_TRAINER_2
	iffalse Inn1FLockedDoor
	opentext
	writetext Inn2F204DoorText1
	waitbutton
	closetext
	pause 30
	playsound SFX_WALL_OPEN
	disappear INN_2F_DOOR_LOCK_1
	pause 14
	opentext
	writetext Inn2F204DoorText2
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
	
Inn2F204DoorText1:
	text "???: Is that the"
	line "mantenance person?"
	
	para "Finally! <WAIT_S>It's been"
	line "like an hour!"
	
	para "One second.<WAIT_S> I'll"
	line "unlock the door."
	done
	
Inn2F204DoorText2:
	text "Ok, come on in!"
	done
	
Inn2F203Door:
	jumptext Inn2F203DoorText
	
Inn2F203DoorText:
	text "It's not locked,"
	line "but the door won't"
	cont "budge."
	done
	
TrainerInn2F_1:
	trainer GRUNTF, INN_GRUNTF_2, EVENT_BEAT_INN_2F_TRAINER_1, .SeenText, .BeatenText, 0, .Script
	
.Script:
	callasm Inn1FResertScriptVar
	end_if_just_battled
	jumptextfaceplayer .NormalText

.NormalText:
	text "Why are we all so"
	line "darn unreliable?"
	done

.SeenText:
	text "Ah! You aren't"
	line "TEAM SNARE!"
	
	para "Did that ditzy"
	line "airhead downstairs"
	cont "lose her password"
	cont "again?"
	done

.BeatenText:
	text "I'm seeing stars!"
	done
	
TrainerInn2F_2:
	trainer GRUNTM, INN_GRUNTM_1, EVENT_BEAT_INN_2F_TRAINER_2, .SeenText, .BeatenText, 0, .Script
	
.Script:
	callasm Inn1FResertScriptVar
	jumptextfaceplayer .NormalText

.NormalText:
	text "Why are we here?"
	
	para "I'm just a GRUNT,"
	line "how should I know?"
	
	para "My supervisor"
	line "might know…"
	
	para "She was hanging"
	line "out in the lobby"
	cont "earlier."
	done

.SeenText:
	text "It's fine."
	
	para "I'll handle it."
	done

.BeatenText:
	text "Nevermind then."
	done
	
Inn2F201LockedDoor:
	opentext
	writetext Inn2F201LockedDoorText1
	waitbutton
	callasm Inn2F201LockedDoorAsm
	callasm Inn2F201LockedDoorCheckPassword
	iffalse .wrong
	ifequal 2, .nothing
	writetext Inn2F201LockedDoorTextPlayerSaid
	waitbutton
	closetext
	pause 10
	opentext
	writetext Inn2F201LockedDoorText2
	waitbutton
	closetext
	pause 10	
	playsound SFX_WALL_OPEN
	waitsfx
	opentext
	writetext Inn2F201LockedDoorText3
	waitbutton
	closetext
	callasm Inn2F201InitializeBackupName
	disappear INN_2F_DOOR_LOCK_5
	callasm Inn1FResertScriptVar
	end
	
.nothing
	writetext Inn2F201LockedDoorTextNothing
	waitbutton
	closetext
	pause 10
	opentext
	writetext Inn2F201LockedDoorTextNothing2
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
.wrong
	writetext Inn2F201LockedDoorTextPlayerSaid
	waitbutton
	closetext
	pause 10
	opentext
	writetext Inn2F201LockedDoorTextWrong
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
	
Inn2F201LockedDoorAsm:
	ld b, $5 ; password
	ld de, wBackupName
	farcall _NamingScreen
	ld hl, wBackupName
	ld de, Room201DefaultPassword
	jp InitName
	
Inn2F201LockedDoorCheckPassword:
	ld hl, Room201DefaultPassword
	ld de, wBackupName
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .default
	
	ld hl, Room201CorrectPassword
	ld de, wBackupName
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .correct
	ld a, 0
	ld [wScriptVar], a
	ret
	
.correct
	ld a, 1
	ld [wScriptVar], a
	ret
	
.default
	ld a, 2
	ld [wScriptVar], a
	ret
	
Inn2F201InitializeBackupName:
	ld hl, Room201BackupPassword
	ld de, wBackupName
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret
	
Room201DefaultPassword:
	db "¯@@@@@@@@@@@"
	
Room201CorrectPassword:
	db "TEST@@@@@@@@"
	
Room201BackupPassword:
	db "???@"
	
Inn2F201LockedDoorText1:
	text "???: Is someone"
	line "there?"
	
	para "…"
	
	para "What's the"
	line "password?"
	done
	
Inn2F201LockedDoorText2:
	text "Alright you got"
	line "it."
	
	para "You must be with"
	line "us."
	done
	
Inn2F201LockedDoorText3:
	text "The door unlocked!"
	done
	
Inn2F201LockedDoorTextPlayerSaid:
	text "<PLAYER> said"
	line "<WAIT_S>“<BACKUP>”."
	done
	
Inn2F201LockedDoorTextWrong:
	text "That ain't it!"
	
	para "We don't want"
	line "room service, so"
	cont "scram!"
	done
	
Inn2F201LockedDoorTextNothing:
	text "<PLAYER> didn't"
	line "say anything…"
	done
	
Inn2F201LockedDoorTextNothing2:
	text "???: Must be my"
	line "imagination…"
	done
	
Inn2F201Text:
	text "ROOM 201"
	done
	
Inn2F202Text:
	text "ROOM 202"
	done
	
Inn2F203Text:
	text "ROOM 203"
	done
	
Inn2F204Text:
	text "ROOM 204"
	done
