NettBuildingTopFloor_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuildingTopFloorCallback

	db 4 ; warp events
	warp_event  2, 13, NETT_BUILDING_ELEVATOR, 1
	warp_event -6, -6, ROUTE_1, 1
	warp_event  5,  1, NETT_BUILDING_OFFICE, 1
	warp_event  6,  1, NETT_BUILDING_OFFICE, 2

	db 4 ; coord events
	coord_event  5,  2, 0, NettBuildingTopFloorStopL
	coord_event  6,  2, 0, NettBuildingTopFloorStopR
	coord_event  5,  6, 3, NettBuildingTopFloorKageLocke
	coord_event  6,  6, 3, NettBuildingTopFloorKageLockeR

	db 13 ; bg events
	signpost -6, -6, SIGNPOST_READ, NettBuildingTopFloor_Sign1
	signpost  1,  4, SIGNPOST_READ, NettBuildingTopFloor_Sign2
	signpost  2,  2, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  7,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  7,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  9,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  9,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 11,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 11,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 13,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 13,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 14,  0, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost -6, -6, SIGNPOST_READ, NettBuildingOfficeRoseBushes

	db 4 ; object events
	person_event SPRITE_OFFICER, -6, -6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_3, -1
	person_event SPRITE_RECEPTIONIST,  2,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingTopFloor_NPC_2, EVENT_NETT_BUILDING_DUNGEON
	person_event SPRITE_KAGE,  4,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingTopFloorKage, EVENT_NETT_KAGE_GONE
	person_event SPRITE_LOCKE,  4,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0,  NettBuildingTopFloorLocke, EVENT_NETT_LOCKE_GONE


NettBuildingTopFloorCallback:
	clearevent EVENT_NETT_OFFICE_DARK
	clearevent EVENT_NETT_OFFICE_MUSIC_OFF
	return

NettBuildingTopFloorKageLockeR:
	setevent EVENT_NETT_KAGE_LOCKE_RIGHT
NettBuildingTopFloorKageLocke:
	special Special_StopRunning
	applyonemovement PLAYER, step_up
	disappear 3
	disappear 4
	playmusic MUSIC_SNARE_THEME
	applyonemovement PLAYER, remove_fixed_facing
	pause 40
	moveperson 3, 6, 1
	moveperson 4, 5, 1
	appear 3
	playsound SFX_EXIT_BUILDING
	applymovement 3, Movement_NettBuildingTopFloorDown
	appear 4
	playsound SFX_EXIT_BUILDING
	applymovement 4, Movement_NettBuildingTopFloorDown
	pause 20
	applyonemovement 3, turn_step_left
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorKageText1
	waitbutton
	closetext
	pause 5
	applyonemovement 4, turn_step_right
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorLockeText1
	waitbutton
	closetext
	pause 20
	applyonemovement 4, turn_step_down
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorLockeText2
	waitbutton
	closetext
	pause 5
	applyonemovement 3, turn_step_down
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorKageText2
	waitbutton
	closetext
	checkevent EVENT_NETT_KAGE_LOCKE_RIGHT
	iftrue .locke_first
	applymovement 3, Movement_NettBuildingTopFloorDownLeft
	spriteface 3, DOWN
	scall NettBuildingTopFloorKageFight
	applyonemovement 4, turn_step_down
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorMoveText
	waitbutton
	closetext
	follow 3, 4
	spriteface 3, LEFT
	applymovement 3, Movement_NettBuildingTopFloorStepAsideRight
	stopfollow
	applyonemovement 3, remove_fixed_facing
	applyonemovement 4, remove_fixed_facing
	scall NettBuildingTopFloorLockeFight
	scall NettBuildingTopFloorKageGetsCall
	jump .end
.locke_first
	applymovement 4, Movement_NettBuildingTopFloorDownRight
	spriteface 4, DOWN
	scall NettBuildingTopFloorLockeFight
	applyonemovement 3, turn_step_down
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorMoveText
	waitbutton
	closetext
	follow 4, 3
	spriteface 4, RIGHT
	applymovement 4, Movement_NettBuildingTopFloorStepAsideLeft
	stopfollow
	applyonemovement 3, remove_fixed_facing
	applyonemovement 4, remove_fixed_facing
	scall NettBuildingTopFloorKageFight
	scall NettBuildingTopFloorLockeGetsCall
.end
	pause 40
	playmapmusic
	applyonemovement 3, turn_step_down
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorKageText4
	waitbutton
	closetext
	pause 5
	applyonemovement 4, turn_step_down
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorLockeText4
	waitbutton
	closetext
	dotrigger $4
	end
	
NettBuildingTopFloorKageFight:
	pause 5
	special SaveMusic
	winlosstext NettKageWinText, NettKageLoseText
	setlasttalked 3
	loadtrainer KAGE, NETT_KAGE
	startbattle
	spriteface 3, DOWN
	spriteface 4, DOWN
	reloadmapafterbattle
	special RestoreMusic
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorKageText3
	waitbutton
	closetext
	pause 5
	end
	
NettBuildingTopFloorLockeFight:
	pause 5
	special SaveMusic
	winlosstext NettLockeWinText, NettLockeLoseText
	setlasttalked 4
	loadtrainer LOCKE, NETT_LOCKE
	startbattle
	spriteface 3, DOWN
	spriteface 4, DOWN
	reloadmapafterbattle
	special RestoreMusic
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorLockeText3
	waitbutton
	closetext
	pause 5
	end
	
NettBuildingTopFloorKageGetsCall:
	applyonemovement 3, turn_step_down
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorPhoneText1
	pause 10
	playmusic MUSIC_NONE
	playsound SFX_CALL
	waitsfx
	pause 20
	playsound SFX_CALL
	waitsfx
	spriteface 4, RIGHT
	pause 20
	playsound SFX_CALL
	pause 2
	closetext
	applyonemovement 3, turn_step_up
	applyonemovement 3, remove_fixed_facing
	playsound SFX_HANG_UP
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorPhoneText2
	waitbutton
	closetext
	playsound SFX_HANG_UP
	pause 40
	applyonemovement 3, turn_step_left
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorPhoneText3
	waitbutton
	closetext
	pause 5
	applyonemovement 4, turn_step_right
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorPhoneText3
	waitbutton
	closetext
	end
	
NettBuildingTopFloorLockeGetsCall:
	applyonemovement 4, turn_step_down
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorPhoneText1
	pause 10
	playmusic MUSIC_NONE
	playsound SFX_CALL
	waitsfx
	pause 20
	playsound SFX_CALL
	waitsfx
	spriteface 3, LEFT
	pause 20
	playsound SFX_CALL
	pause 2
	closetext
	applyonemovement 4, turn_step_up
	applyonemovement 4, remove_fixed_facing
	playsound SFX_HANG_UP
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorPhoneText2
	waitbutton
	closetext
	playsound SFX_HANG_UP
	pause 40
	applyonemovement 4, turn_step_right
	applyonemovement 4, remove_fixed_facing
	opentext TEXTBOX_LOCKE
	writetext NettBuildingTopFloorPhoneText3
	waitbutton
	closetext
	pause 5
	applyonemovement 3, turn_step_left
	applyonemovement 3, remove_fixed_facing
	opentext TEXTBOX_CAGE
	writetext NettBuildingTopFloorPhoneText3
	waitbutton
	closetext
	end
	
Movement_NettBuildingTopFloorDown:
	step_down
	step_down
	step_end
	
Movement_NettBuildingTopFloorDownLeft:
	step_down
	step_left
	step_end
	
Movement_NettBuildingTopFloorDownRight:
	step_down
	step_right
	step_end
	
Movement_NettBuildingTopFloorStepAsideRight:
	fix_facing
	step_right
	step_end
	
Movement_NettBuildingTopFloorStepAsideLeft:
	fix_facing
	step_left
	step_end
	
NettBuildingTopFloorKage:
	jumptextfaceplayer NettBuildingTopFloorKageText4
	
NettBuildingTopFloorLocke:
	jumptextfaceplayer NettBuildingTopFloorLockeText4
	
NettKageWinText:
	text "You… YOU!"
	line "YOOOOUUUU!!!"
	done
	
NettKageLoseText:
	text "Yeah, that's"
	line "right!"
	
	para "Stay down!"
	done
	
NettBuildingTopFloorKageText1:
	text "Well, who do we"
	line "have here?"
	done
	
NettBuildingTopFloorKageText2:
	text "Someone has to"
	line "stop you."
	
	para "You beat us down"
	line "separately,"
	
	para "but you can't take"
	line "us both on."
	done
	
NettBuildingTopFloorKageText3:
	text "HOW DO YOU KEEP"
	line "DOING THIS!?"
	
	para "I JUST TO STOMP"
	line "YOU INTO THE DIRT,"
	cont "YOU LITTLE WHELP!"
	done
	
NettBuildingTopFloorKageText4:
	text "I guess it's"
	line "your lucky day."
	
	para "We've been given"
	line "orders to stand"
	cont "down."
	
	para "Get out of here"
	line "before we change"
	cont "our minds!"
	done
	
NettLockeWinText:
	text "Three times is"
	line "no fluke…"
	done
	
NettLockeLoseText:
	text "Ha!"
	
	para "Third time's a"
	line "charm!"
	done
	
NettBuildingTopFloorLockeText1:
	text "That little"
	line "nuisance again,"
	cont "right on cue."
	done
	
NettBuildingTopFloorLockeText2:
	text "Now that you know"
	line "the truth about"
	cont "who our boss is,"
	
	para "we can't let you"
	line "through those"
	cont "doors, kiddo."
	done
	
NettBuildingTopFloorLockeText3:
	text "Not good!"
	
	para "This is quickly"
	line "becoming a problem"
	cont "for us."
	done
	
NettBuildingTopFloorLockeText4:
	text "What's the plan"
	line "here?"
	
	para "He'd better have"
	line "a good reason for"
	cont "this…"
	done	
	
NettBuildingTopFloorMoveText:
	text "Move over!"
	
	para "I'll handle it!"
	done
	
NettBuildingTopFloorPhoneText1:
	text "ENOUGH!"
	
	para "I'm calling for"
	line "backup."
	
	para "This is getting"
	line "out of-"
	done
	
NettBuildingTopFloorPhoneText2:
	text "What?"
	
	para "We were just about"
	line "to call for-"
	
	para "…"
	
	para "WHAT!?"
	
	para "…"
	
	para "Fine…"
	done
	
NettBuildingTopFloorPhoneText3:
	text "Whisper… Whisper…"
	done

NettBuildingTopFloorStopL:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface ROUTE_12_GATE_OFFICER2, LEFT
	showemote EMOTE_SHOCK, ROUTE_12_GATE_OFFICER2, 15
	opentext TEXTBOX_LADY
	writetext NettBuildingTopFloorStopText
	waitbutton
	closetext
	applymovement PLAYER, Movement_NettBuildingTopFloorStop
	jump NettBuildingTopFloorStopR.cont
	
	
NettBuildingTopFloorStopR:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface ROUTE_12_GATE_OFFICER2, LEFT
	showemote EMOTE_SHOCK, ROUTE_12_GATE_OFFICER2, 15
	opentext TEXTBOX_LADY
	writetext NettBuildingTopFloorStopText
	waitbutton
	closetext
	applyonemovement PLAYER, step_right
.cont
	opentext TEXTBOX_LADY
	writetext NettBuildingTopFloor_NPC_2_Text1
	waitbutton
	closetext
	dotrigger $1
	end
	
Movement_NettBuildingTopFloorStop:
	step_right
	step_right
	step_end

NettBuildingTopFloor_NPC_2:
	checkitem TRAIN_PASS
	iftrue .got_pass
	jumptextfaceplayer NettBuildingTopFloor_NPC_2_Text1
.got_pass
	jumptextfaceplayer NettBuildingTopFloor_NPC_2_Text2
	
NettBuildingTopFloor_Sign1:
	jumptext NettBuildingTopFloor_Sign1Text
	
NettBuildingTopFloor_Sign2:
	jumptext NettBuildingTopFloor_Sign2Text
	
NettBuildingTopFloorStopText:
	text "Excuse me!"
	
	para "Can I help you?"
	done
	
NettBuildingTopFloor_NPC_2_Text1:
	text "Ah, you must be"
	line "<PLAYER>."
	
	para "You indeed have an"
	line "appointment with"
	cont "MR. ELI."
	
	para "Go on in."
	done
	
NettBuildingTopFloor_NPC_2_Text2:
	text "Have a nice day,"
	line "<PLAYER>!"
	done
	
NettBuildingTopFloor_Sign1Text:
	text "FLOOR 9"
	done
	
NettBuildingTopFloor_Sign2Text:
	text "ELI'S OFFICE"
	done