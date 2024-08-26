Inn1F_MapScriptHeader:
	db 4 ; scene scripts
	scene_script Inn1FTrigger0
	scene_script Inn1FTrigger1
	scene_script Inn1FTrigger2
	scene_script Inn1FTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Inn1FCallback

	db 18 ; warp events
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
	warp_event  6, 18, CROSSROADS, 3

	db 4 ; coord events
	coord_event 13, 23, 2, Inn1FBlockDoor
	coord_event 14, 23, 2, Inn1FBlockDoor
	coord_event 13, 15, 3, Inn1FKageScene
	coord_event 14, 15, 3, Inn1FKageScene2

	db 18 ; bg events
	signpost 20,  7, SIGNPOST_JUMPTEXT, Inn1FLaptopText
	signpost 16, 12, SIGNPOST_JUMPTEXT, Inn1FWetFloorText
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

	db 15 ; object events
	person_event SPRITE_FAT_GUY, 19, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Inn1FClerk, -1
	person_event SPRITE_INVISIBLE, 11,  5, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1F104LockedDoor, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	person_event SPRITE_INVISIBLE, 11,  9, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, EVENT_INN_1F_103_OPEN
	person_event SPRITE_INVISIBLE, 11, 13, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedElevator, EVENT_ELEVATOR_OPEN
	person_event SPRITE_INVISIBLE, 11, 17, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, EVENT_INN_1F_102_OPEN
	person_event SPRITE_INVISIBLE, 11, 21, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Inn1FLockedDoor, -1
	person_event SPRITE_GENTLEMAN, 19, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Inn1FCustomer1, -1
	person_event SPRITE_CUTE_GIRL, 20, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Inn1FCustomer2, -1
	person_event SPRITE_GENERAL_VARIABLE_1, 19, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Inn1FUnfortunateCustomer, EVENT_INN_1F_UNFORTUNATE_CUSTOMER
	person_event SPRITE_SNARE_GIRL,  2,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Inn1FSnareGirl, EVENT_INN_1F_SNARE_GIRL
	person_event SPRITE_SNARE_GIRL, 18, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Inn1FSnareSupervisor, EVENT_INN_1F_LOBBY_SNARE
	person_event SPRITE_SNARE_GIRL,  3, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Inn1FSnareSupervisor3, EVENT_INN_1F_ROOM_SNARE
	person_event SPRITE_SNARE, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_KAGE, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

	const_def 1 ; object constants
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
	const INN_1F_LOBBY_SNARE
	const INN_1F_ROOM_SNARE
	const INN_1F_SNARE_1
	const INN_1F_SNARE_2
	const INN_1F_SNARE_KAGE
	
Inn1FKageScene2:
	applyonemovement PLAYER, step_left
Inn1FKageScene:
	disappear INN_1F_SNARE_1
	disappear INN_1F_SNARE_2
	disappear INN_1F_SNARE_KAGE
	opentext
	writetext Inn3FWaterfallTextKage
	waitbutton
	closetext
	spriteface INN_1F_CLERK, UP
	spriteface INN_1F_CUSTOMER_1, UP
	spriteface INN_1F_UNFORTUNATE_CUSTOMER, UP
	spriteface PLAYER, UP
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 25
	playsound SFX_ELEVATOR_END
	waitsfx
	playmusic MUSIC_SNARE_THEME
	moveperson INN_1F_SNARE_1, $d, $b
	moveperson INN_1F_SNARE_2, $d, $b
	moveperson INN_1F_SNARE_KAGE, $d, $b
	appear INN_1F_SNARE_KAGE
	playsound SFX_EXIT_BUILDING
	applymovement INN_1F_SNARE_KAGE, Movement_Inn1FKageStepDown
	appear INN_1F_SNARE_1
	playsound SFX_EXIT_BUILDING
	applymovement INN_1F_SNARE_1, Movement_Inn1FSnare1
	appear INN_1F_SNARE_2
	playsound SFX_EXIT_BUILDING
	applymovement INN_1F_SNARE_2, Movement_Inn1FSnare2
	opentext
	playsound SFX_THUNDER
	earthquake 5
	writetext Inn1FKageText1
	waitsfx
	closetext
	applyonemovement INN_1F_SNARE_KAGE, step_down
	opentext
	writetext Inn1FKageText2
	waitbutton
	closetext
	pause 5
	applymovement INN_1F_SNARE_KAGE, Movement_Inn1FKage1
	callasm Inn1FFallOverASM
	spriteface INN_1F_CLERK, RIGHT
	spriteface INN_1F_CUSTOMER_1, LEFT
	spriteface INN_1F_CUSTOMER_2, LEFT
	special Special_RestorePlayerPalette
	playsound SFX_BEAT_UP
	applyonemovement PLAYER, jump_step_down
	playsound SFX_SUBMISSION
	applyonemovement PLAYER, slow_step_down
	pause 10
	special Special_ForcePlayerStateNormal
	pause 10
	spriteface PLAYER, UP
	applymovement INN_1F_SNARE_KAGE, Movement_Inn1FKageStepDown2
	opentext
	writetext Inn1FKageText3
	waitbutton
	closetext
	pause 5
	applyonemovement PLAYER, fix_facing
	follow PLAYER, INN_1F_SNARE_KAGE
	applyonemovement PLAYER, slow_step_down
	opentext
	writetext Inn1FKageText4
	waitbutton
	closetext
	pause 5
	applyonemovement PLAYER, slow_step_down
	stopfollow
	opentext
	writetext Inn1FKageText5
	applyonemovement PLAYER, remove_fixed_facing
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, turn_step_right
	opentext
	writetext Inn1FClerkBattleinterrupt2
	closetext
	spriteface INN_1F_SNARE_KAGE, LEFT
	opentext
	playsound SFX_THUNDER
	earthquake 5
	writetext Inn1FKageText6
	waitsfx
	closetext
	spriteface INN_1F_SNARE_KAGE, DOWN
	pause 5
	opentext
	writetext Inn1FKageText7
	waitbutton
	closetext
	disappear INN_1F_SNARE_1
	disappear INN_1F_SNARE_2
	moveperson INN_1F_SNARE_1, $c, $13
	moveperson INN_1F_SNARE_2, $e, $13
	waitsfx
	special SaveMusic
	winlosstext Inn1FKageWinText, Inn1FKageLoseText
	setlasttalked INN_1F_SNARE_KAGE
	loadtrainer KAGE, INN_1F_KAGE
	startbattle
	appear INN_1F_SNARE_1
	appear INN_1F_SNARE_2
	reloadmapafterbattle
	special RestoreMusic
	
	opentext
	writetext Inn1FKageText8
	waitbutton
	closetext	
	spriteface INN_1F_SNARE_2, LEFT
	applymovement INN_1F_SNARE_2, Movement_Inn1FSnare2_2
	applyonemovement INN_1F_SNARE_KAGE, step_right
	applymovement INN_1F_SNARE_KAGE, Movement_Inn1FKageStepDown3
	playsound SFX_EXIT_BUILDING
	disappear INN_1F_SNARE_KAGE
	pause 40
	opentext
	playsound SFX_THUNDER
	earthquake 5
	writetext Inn1FKageText9
	waitsfx
	closetext
	
	applymovement INN_1F_SNARE_2, Movement_Inn1FSnareLeave
	opentext
	writetext Inn1FKageText10
	waitbutton
	closetext
	applymovement INN_1F_SNARE_1, Movement_Inn1FSnareLeave
	opentext
	writetext Inn1FKageText11
	waitbutton
	closetext
	follow INN_1F_SNARE_2, INN_1F_SNARE_1
	applymovement INN_1F_SNARE_2, Movement_Inn1FSnareLeave2
	playsound SFX_EXIT_BUILDING
	disappear INN_1F_SNARE_2
	applymovement INN_1F_SNARE_1, Movement_Inn1FSnareLeave3
	playsound SFX_EXIT_BUILDING
	disappear INN_1F_SNARE_1
	clearevent EVENT_INN_SNARE_MUSIC
	waitsfx
	special Special_FadeOutMusic
	pause 25
	playnewmapmusic
	disappear INN_1F_DOOR_LOCK_3
	setevent EVENT_INN_SNARE_GONE
	setevent EVENT_INN_2F_SNARE_HALLWAY
	setevent EVENT_INN_3F_SNARE_HALLWAY
	setevent EVENT_INN_1F_LOBBY_SNARE
	setevent EVENT_INN_1F_ROOM_SNARE
	setevent EVENT_INN_1F_SNARE_GIRL
	spriteface INN_1F_CUSTOMER_1, DOWN
	dotrigger $0
	end
	
Inn1FFallOverASM:
	ld a, PLAYER_FALLING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Inn1FKageWinText:
	text "GRAAAAHH!<WAIT_S>"
	line "Not again!"
	done
	
	
Inn1FKageLoseText:
	text "Yeah, that's"
	line "right!"
	
	para "Stay down!"
	done
	
Inn1FKageText1:
	text "KAGE: YOU!"
	done
	
Inn1FKageText2:
	text "I knew I recog-"
	line "nized you from"
	cont "somewhere!"
	
	para "You're that kid"
	line "from SUNBEAM!"
	
	para "You ain't leavin'"
	line "with that HM!"
	done
	
Inn1FKageText3:
	text "First, you embar-"
	line "rass me on SUNBEAM"
	cont "ISLAND…"
	done
	
Inn1FKageText4:
	text "…then, our leader"
	line "puts the “whizkid”"
	cont "in charge…"
	done
	
Inn1FKageText5:
	text "…and now you think"
	line "you can pull one"
	cont "over on me?"
	
	para "How much"
	line "humiliation must"
	cont "I put up with?"
	
	para "No more!"
	done
	
Inn1FKageText6:
	text "KAGE: Shut it!"
	done
	
Inn1FKageText7:
	text "You really"
	line "shouldn't have"
	cont "messed with me!"
	done
	
Inn1FKageText8:
	text "Fine. <WAIT_M>Keep that"
	line "WATERFALL HM."
	
	para "You can't use it"
	line "without a BADGE"
	cont "from OBSCURA CITY,"
	cont "anyway."
	
	para "And with the stuff"
	line "going down over"
	cont "there…"
	
	para "…"
	
	para "You're a serious"
	line "thorn in our side,"
	cont "you know that?"
	
	para "Our leader is"
	line "getting tired of"
	cont "our screw ups."
	
	para "That whizkid's"
	line "DRAGON STONE thing"
	cont "better work out."
	
	para "Otherwise, we may"
	line "have a big problem"
	cont "on our hands."
	
	para "Come on, boys.<WAIT_M>"
	line "We're leaving."
	done
	
Inn1FKageText9:
	text "KAGE: MOVE IT,"
	line "YOU CLOWNS!"
	done
	
Inn1FKageText10:
	text "Yes, BOSS!"
	done
	
Inn1FKageText11:
	text "Coming, BOSS!"
	done
	
Movement_Inn1FSnare1:
	step_down
	step_right
	step_down
	step_end
	
Movement_Inn1FSnare2:
	step_down
	step_left
	step_down
	step_end
	
Movement_Inn1FSnare2_2:
	fix_facing
	step_right
	remove_fixed_facing
	step_end
	
Movement_Inn1FKage1:
	fix_facing
	slow_step_up
	remove_fixed_facing
	run_step_down
	step_end
	
Movement_Inn1FSnareLeave:
	turn_step_down
	turn_step_down
	turn_step_down
	step_end
	
Movement_Inn1FSnareLeave2:
	run_step_left
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end
	
Movement_Inn1FSnareLeave3:
	run_step_right
	run_step_down
	run_step_down
	step_end

Movement_Inn1FKageStepDown3:
	step_down
;fallthru
Movement_Inn1FKageStepDown2:
	step_down
;fallthru
Movement_Inn1FKageStepDown:
	step_down
	step_down
	step_end
	
Inn1FBlockDoor:
	opentext
	writetext Inn1FBlockDoorText
	waitbutton
	closetext
	applyonemovement PLAYER, step_up
	end
	
Inn1FBlockDoorText:
	text "Better not go out"
	line "dressed like this!"
	done
	
Inn1FFrontDeskDoor:
	jumptext Inn1FFrontDeskDoorText
	
Inn1FFrontDeskDoorText:
	text "There's a locked"
	line "door here."
	done
	
Inn1FSnareSupervisor:
	checkevent EVENT_BEAT_INN_2F_TRAINER_2
	iftrue .start
	opentext
	writetext Inn1FSnareSupervisorTextNormal1
	waitbutton
	closetext
	pause 5
	faceplayer
	opentext
	writetext Inn1FSnareSupervisorTextNormal2
	waitbutton
	closetext
	spriteface INN_1F_LOBBY_SNARE, LEFT
	callasm Inn1FResertScriptVar
	end
.start
	faceplayer
	opentext
	writetext Inn1FSnareSupervisorText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	writetext Inn1FSnareSupervisorText2
	waitbutton
	closetext
	waitsfx
	playmusic MUSIC_SNARE_BATTLE
	callasm Inn1FFakeBattleStart
	callasm Inn1FMoveClerkAsm2
	appear INN_1F_CLERK
	special Special_UpdatePalsInstant
	refreshscreen
	applyonemovement INN_1F_CLERK, big_step_right
	spriteface PLAYER, LEFT
	spriteface INN_1F_LOBBY_SNARE, LEFT
	opentext
	writetext Inn1FClerkBattleinterrupt
	waitbutton
	closetext
	pause 10
	applyonemovement INN_1F_CLERK, slow_step_left
	disappear INN_1F_CLERK
	moveperson INN_1F_CLERK, $0a, $13
	appear INN_1F_CLERK
	pause 60
	callasm Inn1FPlayerYCoord
	iffalse .bottom
	spriteface PLAYER, DOWN
	jump .cont
.bottom
	spriteface PLAYER, UP
.cont
	faceplayer
	opentext
	writetext Inn1FSnareSupervisorText3
	waitbutton
	closetext
	waitsfx
	dotrigger $1
	clearevent EVENT_FAKE_BATTLE_INTO
	clearevent EVENT_INN_1F_ROOM_SNARE
	playmusic MUSIC_DEV_MESSAGE
	setflag ENGINE_HAVE_FOLLOWER
	follow INN_1F_LOBBY_SNARE, PLAYER
	applymovement INN_1F_LOBBY_SNARE, Movement_Inn1FSnareSupervisor
	stopfollow
	spriteface PLAYER, UP
	pause 10
	applyonemovement INN_1F_LOBBY_SNARE, turn_step_up
	pause 5
	applyonemovement INN_1F_LOBBY_SNARE, step_end
	playsound SFX_WALL_OPEN
	disappear INN_1F_DOOR_LOCK_4
	pause 14
	spriteface INN_1F_LOBBY_SNARE, DOWN
	pause 5
	opentext
	writetext Inn1FSnareSupervisorText4
	waitbutton
	closetext
	applyonemovement INN_1F_LOBBY_SNARE, step_up
	playsound SFX_ENTER_DOOR
	disappear INN_1F_LOBBY_SNARE
	pause 5
	applyonemovement PLAYER, step_up
	applyonemovement PLAYER, step_up
	clearflag ENGINE_HAVE_FOLLOWER
	callasm Inn1FResertScriptVar
	warpcheck
	end
	
Inn1FSnareSupervisorTextNormal1:
	text "Grumble… Grumble…<WAIT_S>"
	line "It ain't fair."
	
	para "That promotion"
	line "should have been"
	cont "mine!"
	done
	
Inn1FSnareSupervisorTextNormal2:
	text "Leave me alone."
	
	para "I ain't in the"
	line "mood!"
	done
	
Inn1FSnareSupervisorText1:
	text "What?<WAIT_S>"
	line "Supervisor?"
	
	para "Is that what that"
	line "bonehead told you?"
	
	para "He knows I didn't"
	line "get the promotion,"
	cont "and he's mocking"
	cont "me!"
	done
	
Inn1FSnareSupervisorText2:
	text "Gah! <WAIT_S>I don't have"
	line "to sit here and"
	cont "take this!"
	
	para "I'll prove to the"
	line "boss I'm worthy of"
	cont "supervisor right"
	cont "here and now!"
	done
	
Inn1FSnareSupervisorText3:
	text "Right. <WAIT_S>Sorry."
	
	para "That was"
	line "inconsiderate."
	
	para "Follow me."
	done
	
Inn1FSnareSupervisorText4:
	text "Sorry about all"
	line "this…"
	
	para "Come on in."
	done
	
Inn1FClerkBattleinterrupt:
	text "Hey!"
	
	para "No battles in"
	line "the lobby!"
	done
	
Inn1FClerkBattleinterrupt2:
	text "CLERK: Hey!"
	
	para "No battles in"
	line "the-<WAIT_S>"
	done
	
Inn1FFakeBattleStart:
	ld a, $69
	ld [wOtherTrainerClass], a
	predef Predef_StartBattle
	ret
	
Movement_Inn1FSnareSupervisor:
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	step_up
	step_end
	
Inn1FSnareSupervisor2:
	special Special_FadeOutMusic
	applyonemovement PLAYER, step_up
	opentext
	writetext Inn1FSnareSupervisor2Text1
	buttonsound
	farwritetext StdBlankText
	pause 6
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	writetext Inn1FSnareSupervisorText2
	waitbutton
	closetext
	waitsfx
	winlosstext Inn1FSnareSupervisorWinText, 0
	setlasttalked INN_1F_ROOM_SNARE
	loadtrainer GRUNTF, INN_GRUNTF_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmapmusic
	opentext
	writetext Inn1FSnareSupervisor2Text2
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext Inn1FSnareSupervisor3Text
	waitbutton
	closetext
	setevent EVENT_BEAT_INN_1F_TRAINER_2
	setevent EVENT_INN_1F_LOBBY_SNARE
	end
	
Inn1FSnareSupervisor2Text1:
	text "Ahem! <WAIT_S> Like I was"
	line "saying…"
	done
	
Inn1FSnareSupervisor2Text2:
	text "Wow, you clobbered"
	line "me good!"
	
	para "Now I see why I"
	line "didn't get that"
	cont "supervisor job…"
	done
	
Inn1FSnareSupervisorWinText:
	text "Not cut out for"
	line "it after all!"
	done
	
Inn1FSnareSupervisor3:
	jumptextfaceplayer Inn1FSnareSupervisor3Text
	
Inn1FSnareSupervisor3Text:
	text "At least we didn't"
	line "tear the room up"
	cont "too bad this time."
	
	para "Those other guys"
	line "totally ruined"
	cont "ROOM 203."
	
	para "They even knocked"
	line "a hole in the wall"
	cont "to the next room!"
	done
	
Inn1FTrigger1:
	priorityjump Inn1FSnareSupervisor2
	dotrigger $0
	end
	
Inn1FTrigger0:
Inn1FTrigger2:
Inn1FTrigger3:
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
	applyonemovement INN_1F_CLERK, big_step_left
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, slow_step_right
	disappear INN_1F_CLERK
	callasm Inn1FResertScriptVar
	moveperson INN_1F_CLERK, $0a, $13
	appear INN_1F_CLERK
	end
.right
	appear INN_1F_CLERK
	special Special_StopRunning
	applyonemovement INN_1F_CLERK, big_step_right
	opentext
	writetext Inn1FNoRunningHallsText
	waitbutton
	closetext
	applyonemovement INN_1F_CLERK, slow_step_left
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
	checkscene
	ifnotequal $3, .skip
	moveperson INN_1F_UNFORTUNATE_CUSTOMER, -5, -5
.skip
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
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_PONYTAIL
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
	
Inn1FPlayerYCoord:
	ld a, [wYCoord]
	cp $11
	jr z, .top
	xor a
	ld [wScriptVar], a
	ret
.top
	ld a, 1
	ld [wScriptVar], a
	ret
	
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
	ld a, $0d
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
	ld a, $0d
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
Inn1FMoveClerkAsm2:
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
	ld a, [wXCoord]
	cp $1c
	ret nc
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
	setevent EVENT_INN_SNARE_MUSIC
	setevent EVENT_INN_1F_SLEPT
	setevent EVENT_INN_1F_103_OPEN
	clearevent EVENT_INN_1F_UNFORTUNATE_CUSTOMER
	appear INN_1F_SNARE_GIRL
	appear INN_1F_LOBBY_SNARE
	clearevent EVENT_INN_2F_SNARE_HALLWAY
	clearevent EVENT_INN_3F_SNARE_HALLWAY
	special DeleteSavedMusic
	pause 60
	spriteface PLAYER, DOWN
	callasm LoadMapPals
	special FadeInPalettes
	callasm Inn1FResertScriptVar
	playnewmapmusic
	jumptext Inn1FPlayersBedText2
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
	checkevent EVENT_INN_SNARE_GONE
	iftrue .snare_gone
	faceplayer
	opentext
	writetext Inn1FCustomer1Text
	waitbutton
	closetext
	spriteface INN_1F_CUSTOMER_1, DOWN
	callasm Inn1FResertScriptVar
	end
.snare_gone
	callasm Inn1FResertScriptVar
	jumptext Inn1FCustomer1Text2
	
Inn1FCustomer1Text:
	text "I just want a"
	line "place to lie down"
	cont "for a while."
	
	para "I'm so tired!"
	done
	
Inn1FCustomer1Text2:
	text "He's nodding off"
	line "standing up."
	done
	
Inn1FCustomer2:
	faceplayer
	opentext
	checkevent EVENT_INN_SNARE_GONE
	iftrue .snare_gone
	writetext Inn1FCustomer2Text
	waitbutton
	closetext
	spriteface INN_1F_CUSTOMER_2, UP
	callasm Inn1FResertScriptVar
	end
.snare_gone
	writetext Inn1FCustomer2Text2
	waitbutton
	closetext
	spriteface INN_1F_CUSTOMER_2, UP
	callasm Inn1FResertScriptVar
	end
	
Inn1FCustomer2Text:
	text "Apparently a big"
	line "group called ahead"
	cont "and rented the"
	cont "rest of the rooms."
	done
	
Inn1FCustomer2Text2:
	text "Now that the big"
	line "group is gone,"
	cont "can we finally"
	cont "rent a room?"
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
	checkevent EVENT_INN_SNARE_GONE
	iftrue .snare_gone
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
.snare_gone
	writetext Inn1FClerkDeskText6
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
	
	para "As long as they"
	line "don't cause issues"
	cont "in the rooms, it's"
	cont "not my problem."
	done
	
Inn1FClerkDeskText6:
	text "Those TEAM SNARE"
	line "guys have no sense"
	cont "of respect!"
	
	para "I mean a battle"
	line "in the lobby?"
	
	para "Seriously!?<WAIT_S>"
	line "That's not allowed!"
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
