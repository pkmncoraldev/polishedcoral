Inn3F_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Inn3FTrigger0
	scene_script Inn3FTrigger1

	db 0 ; callbacks

	db 23 ; warp events
	warp_event  0, 11, INN_2F, 3
	warp_event -1, -1, INN_2F, 4
	warp_event 28, 13, INN_3F, 17
	warp_event 29, 13, INN_3F, 17
	warp_event  3, 11, INN_3F, 9
	warp_event  7, 11, INN_3F, 11
	warp_event 15, 11, INN_3F, 13
	warp_event 19, 11, INN_3F, 15
	warp_event  1,  5, INN_3F, 5
	warp_event  0,  5, INN_3F, 5
	warp_event  7,  5, INN_3F, 6
	warp_event  6,  5, INN_3F, 6
	warp_event 18,  5, INN_3F, 7
	warp_event 19,  5, INN_3F, 7
	warp_event 24,  5, INN_3F, 8
	warp_event 25,  5, INN_3F, 8
	warp_event 21, 11, INN_3F, 3
	warp_event 11, 11, INN_ELEVATOR, 1
	warp_event  0,  2, ROUTE_1, 1
	warp_event  6,  2, ROUTE_1, 1
	warp_event 16,  2, ROUTE_1, 1
	warp_event 22,  2, ROUTE_1, 1
	warp_event 31, 11, INN_VENT, 5

	db 6 ; coord events
	coord_event 24,  5, 0, Inn3F301Unlock
	coord_event 25,  5, 0, Inn3F301Unlock
	coord_event  6,  5, 0, Inn3F303Unlock
	coord_event  7,  5, 0, Inn3F303Unlock
	coord_event  0,  5, 0, Inn3F304Unlock
	coord_event  1,  5, 0, Inn3F304Unlock

	db 18 ; bg events
	signpost 11,  5, SIGNPOST_JUMPTEXT, Inn1FPainting1Text
	signpost 11, 17, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost 11, 18, SIGNPOST_JUMPTEXT, Inn3F301Text
	signpost 11, 14, SIGNPOST_JUMPTEXT, Inn3F302Text
	signpost 11,  8, SIGNPOST_JUMPTEXT, Inn3F303Text
	signpost 11,  4, SIGNPOST_JUMPTEXT, Inn3F304Text
	signpost 13, 30, SIGNPOST_JUMPTEXT, Inn3FWetFloorText
	signpost 11, 29, SIGNPOST_JUMPTEXT, Inn3FShelfText
	signpost 11, 28, SIGNPOST_JUMPTEXT, Inn3FShelfText
	signpost 11, 20, SIGNPOST_JUMPTEXT, Inn3FMaintenanceText
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text

	db 14 ; object events
	person_event SPRITE_FAT_GUY, -1, -1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, EVENT_ALWAYS_SET
	person_event SPRITE_INVISIBLE, 11,  3, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, EVENT_INN_3F_304_OPEN
	person_event SPRITE_INVISIBLE, 11,  7, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, EVENT_INN_3F_303_OPEN
	person_event SPRITE_INVISIBLE, 11, 11, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_INVISIBLE, 11, 15, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn3F302Door, EVENT_INN_3F_302_OPEN
	person_event SPRITE_INVISIBLE, 11, 19, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, EVENT_INN_3F_301_OPEN
	person_event SPRITE_INVISIBLE, 11, 21, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn3FServiceDoor, EVENT_INN_3F_SERVICE_DOOR_OPEN
	person_event SPRITE_SNARE, 12,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrainerInn3FSnareNPC, EVENT_INN_3F_CLOTHES
	person_event SPRITE_BALL_CUT_FRUIT,  3,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn3FClothes, EVENT_INN_3F_CLOTHES
	person_event SPRITE_PONYTAIL,  2, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 3, Inn3FCustomer1, -1
	person_event SPRITE_BALL_CUT_FRUIT,  4,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn3FBall1, EVENT_INN_3F_POKEBALL_1
	person_event SPRITE_BALL_CUT_FRUIT,  3,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn3FBall2, EVENT_INN_3F_POKEBALL_2
	person_event SPRITE_BALL_CUT_FRUIT,  5,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn3FBall3, EVENT_INN_3F_POKEBALL_3
	person_event SPRITE_BALL_CUT_FRUIT,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn3FBall4, EVENT_INN_3F_POKEBALL_4
	
	const_def 1 ; object constants
	const INN_3F_CLERK
	const INN_3F_DOOR_LOCK_1
	const INN_3F_DOOR_LOCK_2
	const INN_3F_DOOR_LOCK_3
	const INN_3F_DOOR_LOCK_4
	const INN_3F_DOOR_LOCK_5
	const INN_3F_DOOR_LOCK_6
	const INN_3F_SNARE_NPC
	const INN_3F_CLOTHES
	const INN_3F_CUSTOMER
	const INN_3F_POKEBALL_1
	const INN_3F_POKEBALL_2
	const INN_3F_POKEBALL_3
	const INN_3F_POKEBALL_4
	
Inn3F302Door:
	opentext
	writetext Inn3F302DoorText1
	buttonsound
	farwritetext StdBlankText
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 6
	writetext Inn3F302DoorText2
	special RestoreMusic
	special DeleteSavedMusic
	farwritetext StdBlankText
	pause 6
	writetext Inn3F302DoorText3
	yesorno
	iffalse .no
	checkevent EVENT_INN_2F_LEARNED_KNOCK
	iffalse .default
	loadmenudata Inn3fKnockMenuData
	verticalmenu
	closewindow
	if_equal $1, .default
	if_equal $2, .correct
	
	writetext Inn3F302DoorText4
	farwritetext StdBlankText
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 6
	writetext Inn3F302DoorText8
	jump .wrong
	end
.correct
	writetext Inn3F302DoorText4
	farwritetext StdBlankText
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 6
	writetext Inn3F302DoorText9
	special RestoreMusic
	special DeleteSavedMusic
	farwritetext StdBlankText
	pause 6
	writetext Inn3F302DoorText6
	closetext
	pause 30
	playsound SFX_WALL_OPEN
	disappear INN_3F_DOOR_LOCK_4
	pause 14
	opentext
	writetext Inn2F201LockedDoorText3
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
.default
	writetext Inn3F302DoorText4
	farwritetext StdBlankText
	waitsfx
	special SaveMusic
	playmusic MUSIC_NONE
	pause 6
	writetext Inn3F302DoorText5
.wrong
	special RestoreMusic
	special DeleteSavedMusic
	farwritetext StdBlankText
	pause 6
	writetext Inn3F302DoorText6
	farwritetext StdBlankText
	pause 6
	writetext Inn3F302DoorText7
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
.no
	writetext Inn1FLemonWaterNo
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
	
Inn3fKnockMenuData:
	db $40 ; flags
	db 03, 00 ; start coords
	db 11, 17 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $81 ; flags
	db 3 ; items
	db "Knock… knock…@"
	db "Knockity knock…@"
	db "Kn-kn-knock!@"
	end
	
Inn3F302DoorText1:
	text "A knock comes from"
	line "the other side of"
	cont "the door:"
	done
	
Inn3F302DoorText2:
	text "<WAIT_S><WAIT_T>@"
	sound_knock
	text "Knock…<WAIT_M>@"
	sound_knock
	text " knock…<WAIT_S><WAIT_T>@"
	sound_knock
	text " kn-"
	line "@"
	sound_knock
	text "knock…<WAIT_M>@"
	sound_knock
	text " knock…<WAIT_L>"
	done
	
Inn3F302DoorText3:
	text "Knock back?"
	done
	
Inn3F302DoorText4:
	text "<PLAYER>"
	line "knocked back:<WAIT_M>"
	done
	
Inn3F302DoorText5:
	text "<WAIT_S><WAIT_T>@"
	sound_knock
	text "Knock…<WAIT_M>@"
	sound_knock
	text " knock…<WAIT_L>"
	done
	
Inn3F302DoorText6:
	text "… <WAIT_S><WAIT_L>… <WAIT_S><WAIT_L>…<WAIT_S><WAIT_L>"
	done
	
Inn3F302DoorText7:
	text "No reply…"
	done
	
Inn3F302DoorText8:
	text "<WAIT_S><WAIT_T>@"
	sound_knock
	text "Kno-<WAIT_T>@"
	sound_knock
	text "kno-<WAIT_T>@"
	sound_knock
	text "knock…<WAIT_L>"
	done
	
Inn3F302DoorText9:
	text "<WAIT_S><WAIT_T>@"
	sound_knock
	text "Knock-<WAIT_T>@"
	sound_knock
	text "i-<WAIT_T>@"
	sound_knock
	text "ty<WAIT_S>@"
	sound_knock
	text " knock!<WAIT_L>"
	done
	
Inn3FBall1:
	callasm Inn3FSetItem1Asm
	farscall FindItemInBallScript
	iffalse .end
	disappear INN_3F_POKEBALL_1
.end
	callasm Inn1FResertScriptVar
	end
	
Inn3FSetItem1Asm:
	ld a, 1
	ld [wCurItemBallQuantity], a
	ld a, RARE_CANDY
	ld [wCurItemBallContents], a
	ret
	
Inn3FBall2:
	callasm Inn3FSetItem2Asm
	farscall FindItemInBallScript
	iffalse .end
	disappear INN_3F_POKEBALL_2
.end
	callasm Inn1FResertScriptVar
	end
	
Inn3FSetItem2Asm:
	ld a, 1
	ld [wCurItemBallQuantity], a
	ld a, ULTRA_BALL
	ld [wCurItemBallContents], a
	ret
	
Inn3FBall3:
	callasm Inn3FSetItem3Asm
	farscall FindItemInBallScript
	iffalse .end
	disappear INN_3F_POKEBALL_3
.end
	callasm Inn1FResertScriptVar
	end
	
Inn3FSetItem3Asm:
	ld a, 1
	ld [wCurItemBallQuantity], a
	ld a, FULL_RESTORE
	ld [wCurItemBallContents], a
	ret
	
Inn3FBall4:
	callasm Inn3FSetItem4Asm
	farscall FindItemInBallScript
	iffalse .end
	disappear INN_3F_POKEBALL_4
.end
	callasm Inn1FResertScriptVar
	end
	
Inn3FSetItem4Asm:
	ld a, 1
	ld [wCurItemBallQuantity], a
	ld a, REVIVE
	ld [wCurItemBallContents], a
	ret
	
Inn3FCustomer1:
	jumptextfaceplayer Inn3FCustomer1Text
	
Inn3FCustomer1Text:
	text "Eeeeeek!"
	
	para "Where did you come"
	line "from!?"
	
	para "Get out of my"
	line "room!"
	done
	
Inn3F301Unlock:
	setevent EVENT_INN_3F_301_OPEN
	end
	
Inn3F303Unlock:
	setevent EVENT_INN_3F_303_OPEN
	end
	
Inn3F304Unlock:
	setevent EVENT_INN_3F_304_OPEN
	end
	
Inn3FTrigger0:
Inn3FTrigger1:
	callasm Inn1FRunningInTheHallsASM
	ifnotequal 0, .running
	end
.running
	disappear INN_3F_CLERK
	callasm Inn3FMoveClerkAsm
	ifequal 2, .right
	appear INN_3F_CLERK
	special Special_StopRunning
	applyonemovement INN_3F_CLERK, big_step_left
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_3F_CLERK, slow_step_right
	disappear INN_3F_CLERK
	callasm Inn1FResertScriptVar
	end
.right
	appear INN_3F_CLERK
	special Special_StopRunning
	applyonemovement INN_3F_CLERK, big_step_right
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_3F_CLERK, slow_step_left
	disappear INN_3F_CLERK
	callasm Inn1FResertScriptVar
	end
	
Inn3FClothes:
	disappear LAST_TALKED
	opentext
	writetext Inn3FClothesText1
	playsound SFX_KEY_ITEM
	waitsfx
	writetext Inn3FClothesText2
	waitbutton
	closetext
	pause 10
	applymovement PLAYER, Movement_Inn3FChangeClothes
	playsound SFX_TWINKLE
	callasm Inn3FChangeClothesASM
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 10
	opentext
	writetext Inn3FClothesText3
	waitbutton
	closetext
	setevent EVENT_SNARE_DISGUISE
	end
	
Inn3FChangeClothesASM:
	ld a, PLAYER_SNARE
	ld [wPlayerState], a
	ret
	
Movement_Inn3FChangeClothes:
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 12
	step_end
	
Inn3FClothesText1:
	text "<PLAYER> found"
	line "SNARE UNIFORM!"
	done
	
Inn3FClothesText2:
	text "Better get"
	line "changed."
	done
	
Inn3FClothesText3:
	text "Lookin' good!"
	done
	
TrainerInn3FSnareNPC:
	checkevent EVENT_SNARE_DISGUISE
	iffalse .normal
	callasm Inn1FResertScriptVar
	jumptextfaceplayer TrainerInn3FSnareNPCText1
.normal
	callasm Inn1FResertScriptVar
	jumptextfaceplayer TrainerInn3FSnareNPCText2
	
TrainerInn3FSnareNPCText1:
	text "Looking good!"
	done
	
TrainerInn3FSnareNPCText2:
	text "You say you're with"
	line "us, but you lost"
	cont "your uniform?"
	
	para "Well, I DO have an"
	line "extra in my room"
	cont "here, but…"
	
	para "Hmm…<WAIT_M> Nah!<WAIT_S>"
	line "Not my problem!"
	
	para "So, unless you can"
	line "find some other"
	cont "way in, you're plum"
	cont "outta luck, dude!"
	done
	
Inn3FServiceDoor:
	checkitem SERVICE_KEY
	iffalse .locked
	opentext
	writetext Inn3FServiceDoorText1
	waitbutton
	closetext
	disappear INN_3F_DOOR_LOCK_6
	pause 7
	playsound SFX_WALL_OPEN
	pause 14
	opentext
	writetext Inn1F104LockedDoorText2
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
.locked
	jumptext Inn1FLockedDoorText
	
Inn3FServiceDoorText1:
	text "<PLAYER> used"
	line "SERVICE KEY."
	done
	
Inn3FMoveClerkAsm:
	ld a, [wXCoord]
	cp $0b
	jr nc, .right
	ld a, 1
	ld [wScriptVar], a
	ld a, INN_3F_CLERK
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
	ld a, INN_3F_CLERK
	ld b, a
	ld a, [wXCoord]
	sub 5
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
Inn3FMaintenanceText:
	text "SERVICE ROOM"
	done
	
Inn3F301Text:
	text "ROOM 301"
	done
	
Inn3F302Text:
	text "ROOM 302"
	done
	
Inn3F303Text:
	text "ROOM 303"
	done
	
Inn3F304Text:
	text "ROOM 304"
	done
	
Inn3FWetFloorText:
	text "CAUTION."
	line "WET FLOOR."
	done
	
Inn3FShelfText:
	text "Tools, cans of"
	line "paint, and other"
	cont "random junk."
	done
