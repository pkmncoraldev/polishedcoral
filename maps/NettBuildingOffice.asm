NettBuildingOffice_MapScriptHeader:
	db 2 ; scene scripts
	scene_script NettBuildingOfficeTrigger0
	scene_script NettBuildingOfficeTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuildingOfficeCallback

	db 2 ; warp events
	warp_event  5,  9, NETT_BUILDING_2F, 3
	warp_event  6,  9, NETT_BUILDING_2F, 4

	db 2 ; coord events
	coord_event  5,  8, 0, NettBuildingOfficeNettCutsceneL
	coord_event  6,  8, 0, NettBuildingOfficeNettCutsceneR

	db 11 ; bg events
	signpost  4,  6, SIGNPOST_READ, NettBuildingOfficeNewton
	signpost  5,  5, SIGNPOST_READ, NettBuildingOfficeNett
	signpost  2,  0, SIGNPOST_READ, NettBuildingOfficeBookshelf
	signpost  2,  1, SIGNPOST_READ, NettBuildingOfficeBookshelf
	signpost  8,  9, SIGNPOST_READ, NettBuildingOfficeStatue
	signpost  9,  9, SIGNPOST_READ, NettBuildingOfficeStatue
	signpost  2,  9, SIGNPOST_READ, NettBuildingOfficeClock
	signpost  2,  2, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  2,  3, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  9,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  9,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes

	db 4 ; object events
	person_event SPRITE_PSYCHIC,  3,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingOfficeNett, EVENT_NETT_BUILDING_DUNGEON
	person_event SPRITE_PLAYER_CUTSCENE,  6,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	person_event SPRITE_GOLD_TROPHY,  4,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NettBuildingOfficeTrophySilver, -1
	person_event SPRITE_GOLD_TROPHY,  5,  0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NettBuildingOfficeTrophyGold, -1

	const_def 1 ; object constants
	const NETT_OFFICE_NETT
	const NETT_OFFICE_PLAYER_CUTSCENE
	
	
NettBuildingOfficeTrigger0:
	end
	
NettBuildingOfficeTrigger1:
	end
	
NettBuildingOfficeCallback:
	checkevent EVENT_NETT_BUILDING_DUNGEON
	iffalse .skip1
	changeblock $4, $2, $ae
.skip1
	checkevent EVENT_NEWTON_OFF
	iffalse .skip2
	changeblock $6, $4, $36
	changeblock $0, $0, $5f
	changeblock $0, $2, $3b
.skip2
	return
	
NettBuildingOfficeNettCutsceneL:
	applymovement PLAYER, Movement_NettBuildingOfficePlayerCutscene1
	jump NettBuildingOfficeNettCutscene
	
NettBuildingOfficeNettCutsceneR:
	applymovement PLAYER, Movement_NettBuildingOfficePlayerCutscene4
	spriteface PLAYER, UP
NettBuildingOfficeNettCutscene:
	pause 10
	opentext
	writetext NettBuildingOfficeNettText1
	waitbutton
	closetext
	pause 5
	changeblock $4, $2, $ae
	spriteface NETT_OFFICE_NETT, RIGHT
	callasm GenericFinishBridge
	appear NETT_OFFICE_PLAYER_CUTSCENE
	pause 10
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement NETT_OFFICE_NETT, slow_step_right
	pause 10
	applyonemovement PLAYER, hide_person
	applymovement PLAYER, Movement_NettBuildingOfficePlayerCutscene2
	special Special_FadeOutMusic
	pause 20
	applyonemovement NETT_OFFICE_NETT, slow_step_up
	pause 20
	opentext
	writetext NettBuildingOfficeNettText2
	waitbutton
	closetext
	pause 10
	spriteface NETT_OFFICE_NETT, RIGHT
	pause 10
	opentext
	writetext NettBuildingOfficeNettText3
	waitbutton
	closetext
	pause 20
	applyonemovement NETT_OFFICE_NETT, slow_step_down
	opentext
	writetext NettBuildingOfficeNettText4
	waitbutton
	closetext
	pause 10
	applyonemovement NETT_OFFICE_NETT, turn_step_down
	pause 1
	closetext
	setevent EVENT_NEWTON_OFF
	changeblock $6, $4, $36
	callasm GenericFinishBridge
	pause 40
	opentext
	writetext NettBuildingOfficeNettText5
	waitbutton
	closetext
	pause 40
	applyonemovement NETT_OFFICE_NETT, turn_step_down
	pause 1
	closetext
	clearevent EVENT_NEWTON_OFF
	changeblock $6, $4, $a6
	callasm GenericFinishBridge
	closetext
	pause 60
	spriteface NETT_OFFICE_NETT, LEFT
	applyonemovement NETT_OFFICE_NETT, slow_step_left
	spriteface NETT_OFFICE_NETT, RIGHT
	pause 5
	changeblock $4, $2, $ad
	spriteface NETT_OFFICE_NETT, DOWN
	callasm GenericFinishBridge
	pause 10
	applymovement PLAYER, Movement_NettBuildingOfficePlayerCutscene3
	spriteface PLAYER, UP
	applyonemovement PLAYER, show_person
	pause 10
	disappear NETT_OFFICE_PLAYER_CUTSCENE
	opentext
	writetext NettBuildingOfficeNettText6
	buttonsound
	farwritetext StdBlankText
	pause 6
	playmusic MUSIC_LUSTER_CITY
	writetext NettBuildingOfficeNettText7
	buttonsound
	verbosegivetmhm HM_SURF
	setevent EVENT_GOT_HM03_SURF
	setflag ENGINE_GOT_SURF
	writetext NettBuildingOfficeNettText8
	waitbutton
	closetext
	dotrigger $1
	end
	
NettBuildingOfficeClock:
	jumptext NettBuildingOfficeClockText
	
NettBuildingOfficeRoseBushes:
	jumptext NettBuildingOfficeRoseBushesText
	
NettBuildingOfficeStatue:
	jumptext NettBuildingOfficeStatueText
	
NettBuildingOfficeBookshelf:
	jumptext NettBuildingOfficeBookshelfText
	
NettBuildingOfficeTrophySilver:
	jumptext NettBuildingOfficeTrophySilverText
	
NettBuildingOfficeTrophyGold:
	jumptext NettBuildingOfficeTrophyGoldText
	
NettBuildingOfficeNewton:
	checkevent EVENT_NETT_BUILDING_DUNGEON
	iffalse .nett_in_room
	opentext
	checkevent EVENT_NEWTON_OFF
	iftrue .turnon
	writetext NettBuildingOfficeNewtonText1
	yesorno
	iffalse .no
	playmusic MUSIC_NONE
	setevent EVENT_NEWTON_OFF
	changeblock $6, $4, $36
	changeblock $0, $0, $5f
	changeblock $0, $2, $3b
	callasm GenericFinishBridge
	pause 35
	playsound SFX_PAY_DAY
	spriteface PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	earthquake 5
	waitsfx
	opentext
	writetext NettBuildingOfficeNewtonText4
	waitbutton
	closetext
	end
.turnon
	writetext NettBuildingOfficeNewtonText2
	yesorno
	iffalse .no
	playmusic MUSIC_NONE
	clearevent EVENT_NEWTON_OFF
	changeblock $6, $4, $a6
	changeblock $0, $0, $ac
	changeblock $0, $2, $ab
	callasm GenericFinishBridge
	pause 35
	playsound SFX_PAY_DAY
	spriteface PLAYER, LEFT
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	earthquake 5
	waitsfx
	opentext
	writetext NettBuildingOfficeNewtonText4
	waitbutton
	closetext
	end
.no
	writetext NettBuildingOfficeNewtonTextNo
	waitbutton
	closetext
	end
.nett_in_room
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, NETT_OFFICE_NETT, 15
	spriteface NETT_OFFICE_NETT, RIGHT
	changeblock $4, $2, $ae
	callasm GenericFinishBridge
	opentext
	writetext NettBuildingOfficeNewtonText3
	waitbutton
	closetext
	changeblock $4, $2, $ad
	spriteface NETT_OFFICE_NETT, DOWN
	callasm GenericFinishBridge
	closetext
	end
	
NettBuildingOfficeNett:
	checkcode VAR_FACING
	if_equal LEFT, .youarefacingleft
	if_equal RIGHT, .youarefacingright
	if_equal DOWN, .youarefacingdown
.cont
	opentext
	writetext NettBuildingOfficeNettText9
	waitbutton
	closetext
	spriteface NETT_OFFICE_NETT, DOWN
	changeblock $4, $2, $ad
	callasm GenericFinishBridge
	end
.youarefacingleft
	spriteface NETT_OFFICE_NETT, RIGHT
	changeblock $4, $2, $ae
	callasm GenericFinishBridge
	jump .cont
.youarefacingright
	spriteface NETT_OFFICE_NETT, LEFT
	changeblock $4, $2, $af
	callasm GenericFinishBridge
	jump .cont
.youarefacingdown
	opentext
	writetext NettBuildingOfficeNettText10
	waitbutton
	closetext
	end
	
NettBuildingOfficeNettText1:
	text "Ah, <PLAYER>!"
	
	para "I'm so glad you"
	line "decided to come."
	
	para "Let's talk, shall"
	line "we?"
	done
	
NettBuildingOfficeNettText2:
	text "You know, I never"
	line "get tired of the"
	cont "view from up here…"
	
	para "…"
	
	para "My father founded"
	line "NETT CORP. with a"
	cont "noble goal."
	
	para "He valued the"
	line "relationship"
	cont "between people and"
	cont "#MON above all"
	cont "else."
	
	para "He sought to make"
	line "things that would"
	cont "help foster that"
	cont "relationship."
	
	para "…"
	
	para "Since he passed"
	line "the torch to me,"
	
	para "I've tried my best"
	line "to carry on that"
	cont "philosophy."
	
	done
	
NettBuildingOfficeNettText3:
	text "But things aren't"
	line "always so simple,"
	
	para "and sometimes"
	line "sacrifices need to"
	cont "be made."
	done
	
NettBuildingOfficeNettText4:
	text "Or else everything"
	line "we've worked for…"
	
	para "All of that"
	line "progress…"
	done
	
NettBuildingOfficeNettText5:
	text "Could be halted in"
	line "an instant!"
	done
	
NettBuildingOfficeNettText6:
	text "But I digress…"
	done
	
NettBuildingOfficeNettText7:
	text "You've done a great"
	line "deed for this city"
	cont "and her people."
	
	para "And for that, you"
	line "have my sincere"
	cont "thanks."
	
	para "I want you to have"
	line "this as a token of"
	cont "my appreciation."
	done
	
NettBuildingOfficeNettText8:
	text "That HM contains"
	line "the move SURF."
	
	para "In addition to"
	line "being an excellent"
	cont "move in battle,"
	
	para "it can also be"
	line "used to traverse"
	cont "bodies of water"
	cont "with ease."
	
	para "I'm sure it will"
	line "help you in the"
	cont "future."
	
	para "In this demo, you"
	line "don't even need a"
	cont "BADGE to use it"
	cont "outside of battle!"
	
;	para "You need the BADGE"
;	line "from LUSTER CITY"
;	cont "to use it outside"
;	cont "of battle."
	done
	
NettBuildingOfficeNettText9:
	text "You've done a great"
	line "deed for this city"
	cont "and her people."
	
	para "And for that, you"
	line "have my sincere"
	cont "thanks."
	done
	
NettBuildingOfficeNettText10:
	text "What are you doing"
	line "back there?"
	done
	
NettBuildingOfficeTrophySilverText:
	text "A silver trophy."
	done
	
NettBuildingOfficeTrophyGoldText:
	text "A shiny golden"
	line "trophy."
	done
	
NettBuildingOfficeNewtonText:
	text "Three balls are"
	line "suspended by wire."
	
	para "The middle ball"
	line "stays in place!"
	done
	
NettBuildingOfficeNewtonText1:
	text "Stop it?"
	done
	
NettBuildingOfficeNewtonText2:
	text "Start it?"
	done
	
NettBuildingOfficeNewtonText3:
	text "Ah!"
	
	para "Don't touch that."
	done
	
NettBuildingOfficeNewtonText4:
	text "The bookshelf"
	line "moved!"
	done
	
NettBuildingOfficeNewtonTextNo:
	text "Better not…"
	done
	
NettBuildingOfficeClockText:
	text "An old grandfather"
	line "clock!"
	done
	
NettBuildingOfficeRoseBushesText:
	text "Some prickly rose"
	line "bushes."
	done
	
NettBuildingOfficeStatueText:
	text "A statue of a"
	line "#MON."
	done
	
NettBuildingOfficeBookshelfText:
	text "None of the books"
	line "will budge."
	done
	
Movement_NettBuildingOfficeNett1:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_left
	step_end
	
Movement_NettBuildingOfficeNett2:
	step_right
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	slow_step_left
	step_end
	
Movement_NettBuildingOfficePlayerCutscene1:
	step_up
	step_up
	step_end
	
Movement_NettBuildingOfficePlayerCutscene2:
	slow_step_right
	slow_step_up
	slow_step_up
	step_end
	
Movement_NettBuildingOfficePlayerCutscene3:
	slow_step_left
	slow_step_down
	slow_step_down
	step_end
	
Movement_NettBuildingOfficePlayerCutscene4:
	step_up
	step_up
	step_left
	step_end
