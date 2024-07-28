Inn1F_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Inn1FTrigger0
	scene_script Inn1FTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Inn1FCallback

	db 17 ; warp events
	warp_event 13, 23, CROSSROADS, 1
	warp_event 14, 23, CROSSROADS, 2
	warp_event -1, -1, INN_2F, 1
	warp_event 23, 11, INN_2F, 2
	warp_event  5, 11, INN_1F, 9
	warp_event  9, 11, INN_1F, 11
	warp_event 17, 11, INN_1F, 13
	warp_event 21, 11, INN_1F, 15
	warp_event  1,  5, INN_1F, 5
	warp_event  0,  5, INN_1F, 5
	warp_event  7,  5, INN_1F, 6
	warp_event  6,  5, INN_1F, 6
	warp_event 18,  5, INN_1F, 7
	warp_event 19,  5, INN_1F, 7
	warp_event 24,  5, INN_1F, 8
	warp_event 25,  5, INN_1F, 8
	warp_event 13, 11, INN_ELEVATOR, 1

	db 0 ; coord events

	db 18 ; bg events
	signpost 20,  7, SIGNPOST_JUMPTEXT, Inn1FLaptopText
	signpost 15, 12, SIGNPOST_JUMPTEXT, Inn1FWetFloorText
	signpost 11,  7, SIGNPOST_JUMPTEXT, Inn1FPainting1Text
	signpost 11, 19, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost 20, 11, SIGNPOST_JUMPTEXT, Inn1FStatueText
	signpost 16,  6, SIGNPOST_JUMPTEXT, Inn1FWhiteboardText
	signpost 16, 17, SIGNPOST_READ, Inn1FLemonWater
	signpost 11, 20, SIGNPOST_JUMPTEXT, Inn1F101Text
	signpost 11, 16, SIGNPOST_JUMPTEXT, Inn1F102Text
	signpost 11, 10, SIGNPOST_JUMPTEXT, Inn1F103Text
	signpost 11,  6, SIGNPOST_JUMPTEXT, Inn1F104Text
	signpost 19, 11, SIGNPOST_READ, Inn1FClerkDesk
	signpost  0,  0, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0,  6, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 16, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  0, 22, SIGNPOST_JUMPTEXT, Inn1FPainting2Text
	signpost  2,  3, SIGNPOST_READ, Inn1FPlayersBed
	signpost  1,  7, SIGNPOST_READ, Inn1FTrashCanPassword

	db 14 ; object events
	person_event SPRITE_MINA_GROUND, 17,  8, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND, 17,  9, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND, 17, 10, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MINA_GROUND, 17, 11, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FAT_GUY, 19, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, -1
	person_event SPRITE_COLBY, 11,  5, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1F104LockedDoor, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	person_event SPRITE_COLBY, 11,  9, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, EVENT_INN_1F_103_OPEN
	person_event SPRITE_COLBY, 11, 13, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, -1
	person_event SPRITE_COLBY, 11, 17, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_COLBY, 11, 21, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_POKEFAN_F, 19, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Inn1FCustomer1, -1
	person_event SPRITE_CUTE_GIRL, 20, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Inn1FCustomer2, -1
	person_event SPRITE_GENERAL_VARIABLE_1, 19, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn1FUnfortunateCustomer, EVENT_INN_1F_UNFORTUNATE_CUSTOMER
	person_event SPRITE_SNARE_GIRL,  2,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Inn1FSnareGirl, EVENT_INN_1F_ROCKET_GIRL

	const_def 1 ; object constants
	const INN_1F_WALL_1
	const INN_1F_WALL_2
	const INN_1F_WALL_3
	const INN_1F_WALL_4
	const INN_1F_CLERK
	const INN_1F_DOOR_LOCK_1
	const INN_1F_DOOR_LOCK_2
	const INN_1F_DOOR_LOCK_3
	const INN_1F_DOOR_LOCK_4
	const INN_1F_DOOR_LOCK_5
	const INN_1F_CUSTOMER_1
	const INN_1F_CUSTOMER_2
	const INN_1F_UNFORTUNATE_CUSTOMER
	const INN_1F_SNARE_GIRL
	
Inn1FTrigger0:
Inn1FTrigger1:
	callasm Inn1FRunningInTheHallsASM
	ifequal 1, .hall
	ifequal 2, .lobby
	end
.hall
	disappear INN_1F_CLERK
	callasm Inn1FMoveClerkAsm
	ifequal 2, .right
	appear INN_1F_CLERK
	special Special_StopRunning
	applyonemovement INN_1F_CLERK, step_left
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, step_right
	disappear INN_1F_CLERK
	callasm Inn1FResertScriptVar
	moveperson INN_1F_CLERK, $0a, $13
	appear INN_1F_CLERK
	end
.right
	appear INN_1F_CLERK
	special Special_StopRunning
	applyonemovement INN_1F_CLERK, step_right
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, step_left
	disappear INN_1F_CLERK
	callasm Inn1FResertScriptVar
	moveperson INN_1F_CLERK, $0a, $13
	appear INN_1F_CLERK
	end
.lobby
	setlasttalked INN_1F_CLERK
	faceplayer
	opentext
	writetext Inn1FNoRunningLobbyText
	waitbutton
	closetext
	spriteface INN_1F_CLERK, RIGHT
	callasm Inn1FResertScriptVar
	end
	
Inn1FCallback:
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .playerfemale
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_POKEMANIAC
	callasm Inn1FResertScriptVar
	return
.playerfemale
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_BATTLE_GIRL
	callasm Inn1FResertScriptVar
	return
	
Inn1FNoRunningHallsText:
	text "Hey!"
	
	para "No running in"
	line "the halls!"
	done
	
Inn1FNoRunningLobbyText:
	text "Hey!"
	
	para "No running in"
	line "the lobby!"
	done
	
Inn1FMoveClerkAsm:
	ld a, [wXCoord]
	cp $0b
	jr nc, .right
	ld a, 1
	ld [wScriptVar], a
	ld a, INN_1F_CLERK
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
	ld a, INN_1F_CLERK
	ld b, a
	ld a, [wXCoord]
	sub 5
	add 4
	ld d, a
	ld a, [wYCoord]
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
Inn1FResertScriptVar:
	xor a
	ld [wScriptVar], a
	ret
	
Inn1FRunningInTheHallsASM:
	ld a, [wPlayerState]
	cp PLAYER_RUN
	ret nz
	ld a, [wYCoord]
	cp $0e
	jr nc, .bottom
	cp $0c
	jr nc, .middle
	ret
.middle
	ld a, 1
	ld [wScriptVar], a
	ret
.bottom
	ld a, 2
	ld [wScriptVar], a
	ret
	
Inn1FSnareGirlScriptText1:
	text "It's gotta be"
	line "here somewhere."
	
	para "Did I drop it in"
	line "the trash?"
	
	para "…<WAIT_L>Aha!<WAIT_S>"
	line "There it is!"
	done
	
Inn1FSnareGirlScriptText2:
	text "Wuzzat?"
	
	para "I forgot to lock"
	line "the door and some"
	cont "kid wandered in!"
	
	para "Man, I can't do"
	line "anything right"
	cont "today…"
	
	para "Well, let's do"
	line "this, then."
	done
	
Inn1FSnareGirlScriptText3:
	text "Ah geez."
	
	para "Listen, I wasn't"
	line "doin' nothing in"
	cont "here, so go away."
	
	para "And definitely"
	line "don't look in the"
	cont "trashcan."
	
	para "That would be a"
	line "waste of time!"
	done
	
Inn1FSnareGirlWinText:
	text "Yikes!"
	done
	
Inn1FTrashCanPassword:
	checkevent EVENT_BEAT_INN_1F_TRAINER
	iffalse .nope
	callasm Inn1FResertScriptVar
	setevent EVENT_INN_1F_READ_103_NOTE
	jumptext Inn1FTrashCanPasswordText
.nope
	callasm Inn1FResertScriptVar
	jumptext Inn1FTrashCanPasswordText2
	
Inn1FTrashCanPasswordText:
	text "A slip of paper."
	line "It reads:"
	
	para "“Here is the code"
	line "for ROOM 201:"
	
	para "TODO"
	
	para "Do NOT lose it"
	line "this time!”"
	done
	
Inn1FTrashCanPasswordText2:
	text "It's full of trash."
	
	para "She's digging"
	line "through, looking"
	cont "for something."
	done
	
Inn1FSnareGirl:
	checkevent EVENT_INN_1F_READ_103_NOTE
	iftrue .found
	checkevent EVENT_BEAT_INN_1F_TRAINER
	iftrue .did
	applyonemovement INN_1F_SNARE_GIRL, turn_step_up
	opentext
	writetext Inn1FSnareGirlScriptText1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, INN_1F_SNARE_GIRL, 15
	special SaveMusic
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	faceplayer
	opentext
	writetext Inn1FSnareGirlScriptText2
	waitbutton
	closetext
	waitsfx
	winlosstext Inn1FSnareGirlWinText, 0
	setlasttalked INN_1F_SNARE_GIRL
	loadtrainer GRUNTF, INN_GRUNTF_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext Inn1FSnareGirlScriptText3
	waitbutton
	closetext
	setevent EVENT_BEAT_INN_1F_TRAINER
	end
.did
	callasm Inn1FResertScriptVar
	jumptextfaceplayer Inn1FSnareGirlScriptText3
.found
	callasm Inn1FResertScriptVar
	jumptextfaceplayer Inn1FSnareGirlText
	
Inn1FSnareGirlText:
	text "Oh boy."
	
	para "I hope this"
	line "doesn't come back"
	cont "to bite me…"
	done
	
Inn1FPlayersBed:
	opentext
	writetext Inn1FPlayersBedText1
	yesorno
	iffalse .end
	closetext
	special FadeOutPalettes
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	checkevent EVENT_INN_1F_SLEPT
	iftrue .skip
	setevent EVENT_INN_1F_SLEPT
	setevent EVENT_INN_1F_103_OPEN
	clearevent EVENT_INN_1F_UNFORTUNATE_CUSTOMER
	appear INN_1F_SNARE_GIRL
.skip
	pause 60
	special RestoreMusic
	spriteface PLAYER, DOWN
	callasm LoadMapPals
	special FadeInPalettes
	callasm Inn1FResertScriptVar
	jumptext Inn1FPlayersBedText2
.end
	closetext
	callasm Inn1FResertScriptVar
	end
	
Inn1FPlayersBedText1:
	text "It's your bed.<WAIT_S>"
	line "Take a rest?"
	done
	
Inn1FPlayersBedText2:
	text "Better get going!"
	done
	
Inn1FCustomer1:
	faceplayer
	opentext
	writetext Inn1FCustomer1Text
	waitbutton
	closetext
	spriteface INN_1F_CUSTOMER_1, DOWN
	end
	
Inn1FCustomer1Text:
	text "I just want a"
	line "place to lie down"
	cont "for a while."
	
	para "I'm so tired!"
	done
	
Inn1FCustomer2:
	faceplayer
	opentext
	writetext Inn1FCustomer2Text
	waitbutton
	closetext
	spriteface INN_1F_CUSTOMER_2, UP
	end
	
Inn1FCustomer2Text:
	text "Apparently a big"
	line "group came along"
	cont "and rented the"
	cont "rest of the rooms."
	done
	
Inn1FUnfortunateCustomer:
	setevent EVENT_INN_1F_UNFORTUNATE_CUSTOMER
	setevent EVENT_INN_1F_UNFORTUNATE_CUSTOMER_2
	applyonemovement INN_1F_UNFORTUNATE_CUSTOMER, turn_step_left
	opentext
	writetext Inn1FUnfortunateCustomerText1
	waitbutton
	closetext
	pause 5
	applyonemovement INN_1F_CLERK, turn_step_right
	opentext
	writetext Inn1FUnfortunateCustomerText2
	waitbutton
	closetext
	pause 5
	applyonemovement INN_1F_UNFORTUNATE_CUSTOMER, turn_step_left
	opentext
	writetext Inn1FUnfortunateCustomerText3
	waitbutton
	closetext
	pause 5
	spriteface PLAYER, DOWN
	pause 10
	callasm Inn1FResertScriptVar
	jumptext Inn1FUnfortunateCustomerText4
	
Inn1FUnfortunateCustomerText1:
	text "???: I told you,"
	line "I paid before I"
	cont "got here."
	
	para "My name is"
	line "<PLAYER>!"
	done
	
Inn1FUnfortunateCustomerText2:
	text "I understand, but"
	line "I don't have any"
	cont "more rooms under"
	cont "that name."
	
	para "I'm sorry."
	done
	
Inn1FUnfortunateCustomerText3:
	text "Other <PLAYER>:"
	line "Well, what am I"
	cont "meant to do now?"
	
	para "I don't have any"
	line "place to stay!"
	done
	
Inn1FUnfortunateCustomerText4:
	text "Better stay out"
	line "of it…"
	done
	
Inn1F104LockedDoor:
	checkitem ROOM_104_KEY
	iftrue .unlock_door
	callasm Inn1FResertScriptVar
	jumptext Inn1FLockedDoorText
.unlock_door
	opentext
	writetext Inn1F104LockedDoorText1
	waitbutton
	closetext
	disappear INN_1F_DOOR_LOCK_1
	pause 7
	playsound SFX_WALL_OPEN
	pause 14
	opentext
	writetext Inn1F104LockedDoorText2
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
	
Inn1F104LockedDoorText1:
	text "<PLAYER> used"
	line "ROOM 104 KEY."
	done
	
Inn1F104LockedDoorText2:
	text "The door unlocked."
	done
	
Inn1FLockedDoor:
	jumptext Inn1FLockedDoorText
	
Inn1FLockedDoorText:
	text "It's locked."
	done
	
Inn1FLockedElevator:
	jumptext Inn1FLockedElevatorText
	
Inn1FLockedElevatorText:
	text "It isn't running"
	line "at the moment."
	
	para "Better take the"
	line "stairs."
	done
	
Inn1FLemonWater:
	opentext
	writetext Inn1FLemonWaterText1
	yesorno
	iffalse .no
	callasm Inn1FResertScriptVar
	writetext Inn1FLemonWaterTextYes
	waitbutton
	closetext
	pause 20
	opentext
	special Special_DotDotDot
	closetext
	pause 20
	opentext
	writetext Inn1FLemonWaterText2
	waitbutton
	closetext
	end
.no
	writetext Inn1FLemonWaterNo
	waitbutton
	closetext
	end
	
Inn1FLemonWaterText1:
	text "A water cooler"
	line "filled with lemon"
	cont "water."
	
	para "Small plastic cups"
	line "sit beside it."
	
	para "Take some?"
	done
	
Inn1FLemonWaterText2:
	text "Tastes kinda"
	line "funky…"
	
	para "Better stick to"
	line "FRESH WATER…"
	done
	
Inn1FLemonWaterTextYes:
	text "Who wouldn't?"
	done
	
Inn1FLemonWaterNo:
	text "Better not…"
	done
	
Inn1F101Text:
	text "ROOM 101"
	done
	
Inn1F102Text:
	text "ROOM 102"
	done
	
Inn1F103Text:
	text "ROOM 103"
	done
	
Inn1F104Text:
	text "ROOM 104"
	done
	
Inn1FWhiteboardText:
	text "A whiteboard."
	
	para "Someone has drawn"
	line "a cute picture"
	cont "themed after the"
	cont "current month."
	
	para "It's somehow way"
	line "more charming than"
	cont "any of the art in"
	cont "the halls."
	done
	
Inn1FStatueText:
	text "An oddly detailed"
	line "statue of a"
	cont "#MON you don't"
	cont "recognize."
	done
	
Inn1FPainting1Text:
	text "A painting of a"
	line "#MON you don't"
	cont "recognize."
	done
	
Inn1FPainting2Text:
	text "A boring landscape"
	line "painting."
	
	para "It's plain and"
	line "inoffensive."
	done
	
Inn1FLaptopText:
	text "Raw assembly code."
	
	para "Map and scripting"
	line "files."
	
	para "A seemingly never-"
	line "ending to-do list."
	
	para "…"
	
	para "Looks like someone"
	line "is making a game!"
	done
	
Inn1FWetFloorText:
	text "CAUTION."
	line "WET FLOOR."
	
	para "…<WAIT_M>The floor isn't"
	line "even wet…"
	done
	
Inn1FClerkDesk:
	opentext
	checkitem ROOM_104_KEY
	iftrue .have_key
	writetext Inn1FClerkDeskText1
	waitbutton
	closetext
	spriteface INN_1F_CLERK, UP
	pause 10
	opentext
	writetext Inn1FClerkDeskText2
	farwritetext StdBlankText
	pause 6
	special Special_DotDotDot
	closetext
	pause 60
	spriteface INN_1F_CLERK, RIGHT
	opentext
	writetext Inn1FClerkDeskText3
	waitbutton
	verbosegiveitem ROOM_104_KEY
	writetext Inn1FClerkDeskText4
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
.have_key
	writetext Inn1FClerkDeskText5
	waitbutton
	closetext
	callasm Inn1FResertScriptVar
	end
	
Inn1FClerkDeskText1:
	text "Welcome to the"
	line "CROSSROADS INN."
	
	para "What's the name on"
	line "your reservation?"
	
	para "<PLAYER>?<WAIT_M>"
	line "Let's see here."
	done
	
Inn1FClerkDeskText2:
	text "CLICK <WAIT_S>CLACK <WAIT_S>CLICK<WAIT_L>"
	done
	
Inn1FClerkDeskText3:
	text "Ok, we have you"
	line "right here."
	
	para "Your room has"
	line "already been paid"
	cont "for in full."
	
	para "Here is your key."
	done
	
Inn1FClerkDeskText4:
	text "Your room is down"
	line "the hall to the"
	cont "left."
	
	para "Have a great stay!"
	done
	
Inn1FClerkDeskText5:
	text "Most of our rooms"
	line "have been rented"
	cont "by a shady group."
	
	para "They're called"
	line "TEAM SNARE."
	
	para "As long as they"
	line "don't cause issues"
	cont "in the rooms, it's"
	cont "not my problem."
	done
	
Inn1FClerk:
	faceplayer
	opentext
	writetext Inn1FClerkBackText
	waitbutton
	closetext
	spriteface INN_1F_CLERK, RIGHT
	end
	
Inn1FClerkBackText:
	text "How'd you get back"
	line "here?"
	
	para "Come back later."
	done
