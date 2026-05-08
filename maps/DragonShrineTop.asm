DragonShrineTop_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DragonShrineTopTrigger0
	scene_script DragonShrineTopTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DragonShrineTopCallback

	db 2 ; warp events
	warp_def 39,  9, 3, DRAGON_SHRINE_INTERIOR
	warp_def 39, 10, 4, DRAGON_SHRINE_INTERIOR

	db 6 ; coord events
	coord_event  7, 10, 0, DragonShrineTopScene1
	coord_event  8, 10, 0, DragonShrineTopScene2
	coord_event  9, 10, 0, DragonShrineTopRivalScene
	coord_event 10, 10, 0, DragonShrineTopScene4
	coord_event 11, 10, 0, DragonShrineTopScene5
	coord_event 12, 10, 0, DragonShrineTopScene6

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  8, SPRITE_COLBY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_PLAYER_CUTSCENE,  9,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	object_event  9,  8, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event  1,  1, SPRITE_COLBY_FALL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	
DragonShrineTopTrigger0:
DragonShrineTopTrigger1:
	end
	
DragonShrineTopCallback:
	setevent EVENT_LIGHTNING_ACTIVE
	loadvar wLightningCooldown, 60
	return
	
DragonShrineTopScene1:
	applyonemovement PLAYER, remove_fixed_facing
	special FadeOutPalettesBlack
	applymovement PLAYER, Movement_DragonShrineTopScene1
	jump DragonShrineTopRivalScene
	
DragonShrineTopScene2:
	applyonemovement PLAYER, remove_fixed_facing
	special FadeOutPalettesBlack
	applyonemovement PLAYER, big_step_right
	jump DragonShrineTopRivalScene
	
DragonShrineTopScene3:
	applyonemovement PLAYER, remove_fixed_facing
	special FadeOutPalettesBlack
	jump DragonShrineTopRivalScene
	
DragonShrineTopScene4:
	applyonemovement PLAYER, remove_fixed_facing
	special FadeOutPalettesBlack
	applyonemovement PLAYER, big_step_left
	jump DragonShrineTopRivalScene
	
DragonShrineTopScene5:
	applyonemovement PLAYER, remove_fixed_facing
	special FadeOutPalettesBlack
	applymovement PLAYER, Movement_DragonShrineTopScene5
	jump DragonShrineTopRivalScene
	
DragonShrineTopScene6:
	applyonemovement PLAYER, remove_fixed_facing
	special FadeOutPalettesBlack
	applymovement PLAYER, Movement_DragonShrineTopScene6
	
DragonShrineTopRivalScene:
	priority 1, LOW_PRIORITY
	clearevent EVENT_LIGHTNING_ACTIVE
	loadvar wLightning, 0
	spriteface PLAYER, UP
	pause 10
	special Special_FadeOutMusic
	special FadeInTextboxPalettes
	pause 20
	applyonemovement 1, turn_step_up
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText1
	waitbutton
	closetext
	waitsfx
	pause 5
	scall DragonShrineTopLightning
	pause 10
	applyonemovement 1, turn_step_up
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText2
	waitbutton
	closetext
	waitsfx
	pause 70
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText3
	waitbutton
	closetext
	waitsfx
	pause 20
	applyonemovement PLAYER, slow_step_up
	appear 2
	pause 60
	applyonemovement PLAYER, hide_person
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText4
	waitbutton
	closetext
	waitsfx
;push player
	spriteface 1, RIGHT
	pause 2
	spriteface 1, DOWN
	callasm DragonShrineLightning
	earthquake 3
	applymovement 2, Movement_DragonShrineTopPlayerJump
	applymovement PLAYER, Movement_DragonShrineTopLightning
	
	pause 10
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText5
	waitbutton
	closetext
	waitsfx
	
	pause 10
	applyonemovement 1, turn_step_up
	applyonemovement PLAYER, remove_fixed_facing
	pause 40
	applymovement PLAYER, Movement_DragonShrineTopCameraPan
	pause 20
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText6
	waitbutton
	closetext
	waitsfx
	pause 20
	applyonemovement 1, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText7
	waitbutton
	closetext
	waitsfx
	scall DragonShrineTopLightning
	waitsfx
	changeblock $8, $2, $c0
	changeblock $a, $2, $c1
	changeblock $8, $4, $c4
	changeblock $a, $4, $c5
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText15
	waitbutton
	closetext
	waitsfx
	pause 5
	applyonemovement 2, slow_step_up
	callasm DragonShrineLightning
	applymovement PLAYER, Movement_DragonShrineTopLightningShort
	scall DragonShrineTopLightning
	waitsfx
	pause 5
	changeblock $8, $2, $b4
	changeblock $a, $2, $b4
	changeblock $8, $4, $b4
	changeblock $a, $4, $b4
	setevent EVENT_DONT_HIDE_SPRITES_BEFORE_BATTLE
	winlosstext DragonShrineTopRivalWinText, DragonShrineTopRivalLoseText
	setlasttalked 1
	loadtrainer RIVAL_S, RIVAL_S_3_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	clearevent EVENT_DONT_HIDE_SPRITES_BEFORE_BATTLE
	spriteface 1, UP
	reloadmapafterbattle
	clearevent EVENT_LIGHTNING_ACTIVE
	pause 10
	scall DragonShrineTopLightning
	waitsfx
	pause 5
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText8
	waitbutton
	closetext
	waitsfx
	scall DragonShrineTopLightning
	waitsfx
	pause 20
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText9
	waitbutton
	closetext
	applyonemovement 1, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText10
	scall DragonShrineTopLightning
	waitsfx
	waitbutton
	closetext
	pause 30
	applymovement PLAYER, Movement_DragonShrineTopCameraPan2
	spriteface PLAYER, UP
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText11
	waitbutton
	closetext
	waitsfx
	playsound SFX_CHANGE_DEX_MODE
	appear 3
	priority 2, HIGH_PRIORITY
	priority 3, NORMAL_PRIORITY
	applyonemovement 1, turn_step_down
	applymovement 3, Movement_DragonShrineTopThrowItem
	disappear 3
	opentext
	verbosegiveitem POTION;DRAGON_STONE
	closetext
	pause 20
	opentext TEXTBOX_RIVAL
	writetext DragonShrineTopRivalSceneText12
	waitbutton
	closetext
	waitsfx
	pause 40
	applymovement 1, Movement_DragonShrineTopColbyStepBack;walk to edge of cliff
	pause 10
	applyonemovement 2, slow_step_up
	pause 10
	applyonemovement PLAYER, show_person
	applyonemovement PLAYER, remove_fixed_facing
	disappear 2
	
	
	opentext TEXTBOX_RIVAL
	
	writetext DragonShrineTopRivalSceneText13
	waitbutton
	closetext
	waitsfx

;colby jumps
	disappear 4
	moveperson 4, 9, 8
	appear 4
	applyonemovement PLAYER, remove_fixed_facing
	disappear 1
	changeaction 4, PERSON_ACTION_COLBY_FALL
	disappear 4

	applyonemovement PLAYER, run_step_up
	pause 40
	opentext
	writetext DragonShrineTopRivalSceneText14
	waitbutton
	closetext
	waitsfx
	pause 20
	setevent EVENT_DONT_ADJUST_CRY_VOLUME
	loadvar wVolume, $00
	cry DRAGONITE
	waitsfx
	loadvar wVolume, $77
	clearevent EVENT_DONT_ADJUST_CRY_VOLUME
;	setevent EVENT_LIGHTNING_ACTIVE
	setevent EVENT_DRAGON_SHRINE_DONE
	loadvar wLightningCooldown, 60
	dotrigger $1
	end
	
DragonShrineTopLightning:
	callasm DragonShrineLightning
	applymovement PLAYER, Movement_DragonShrineTopLightning
	end
	
DragonShrineTopRivalWinText:
	text "It's over, isn't"
	line "it?"
	
	para "I'm not worthy…"
	
	para "I…<WAIT_M> failed…"
	done
	
DragonShrineTopRivalLoseText:
	text "Yes!"
	
	para "Now the DRAGON"
	line "will finally"
	cont "reveal itself!"
	done
	
DragonShrineTopRivalSceneText1:
	text "SHOW YOURSELF!<WAIT_M>"
	line "I COMMAND YOU!"
	done
	
DragonShrineTopRivalSceneText2:
	text "I BROUGHT THE"
	line "DRAGON STONE!"
	
	para "SO REVEAL YOURSELF"
	line "TO ME, NOW!"
	done
	
DragonShrineTopRivalSceneText3:
	text "…<WAIT_L>Why?"
	
	para "Why won't you show"
	line "yourself to me?"
	done
	
DragonShrineTopRivalSceneText4:
	text "It's you, <PLAYER>…"
	
	para "You're the reason…"
	done
	
DragonShrineTopRivalSceneText5:
	text "You're the reason"
	line "the DRAGON won't"
	cont "deem me worthy!"
	
	para "You're the one"
	line "person always"
	cont "in my way."
	
	para "The ONE person"
	line "I can never beat!"
	done
	
DragonShrineTopRivalSceneText6:
	text "The whole reason"
	line "I worked with"
	cont "TEAM SNARE was to"
	cont "get my hands on"
	cont "this stone."
	
	para "So that the"
	line "DRAGON would show"
	cont "itself and deem"
	cont "me the strongest."
	
	para "Just like my"
	line "FATHER!"
	
	para "Then I would"
	line "finally be able"
	cont "to show my face"
	cont "in front of him…"
	done
	
DragonShrineTopRivalSceneText7:
	text "But it won't"
	line "happen…"
	
	para "Not while you"
	line "continue to stand"
	cont "in my way!"
	done
	
DragonShrineTopRivalSceneText15:
	text "So, one more time,"
	line "I challenge you,"
	cont "<PLAYER>!"
	
	para "I'll show my true"
	line "strength, and the"
	cont "DRAGON will have"
	cont "no choice but to"
	cont "reveal itself!"
	done
	
DragonShrineTopRivalSceneText8:
	text "I give up."
	
	para "You win, <PLAYER>."
	
	para "I lose."
	
	para "Are you happy?"
	done
	
DragonShrineTopRivalSceneText9:	
	text "I've failed the"
	line "DRAGON…"
	
	para "I've failed my"
	line "father…"
	
	para "I've even failed"
	line "our boss…"
	done
	
DragonShrineTopRivalSceneText10:
	text "MR. ELI."
	done
	
DragonShrineTopRivalSceneText11:
	text "He sought me out"
	line "and gave me the "
	cont "full force of"
	cont "TEAM SNARE."
	
	para "He must have known"
	line "how important this"
	cont "was to me."
	
	para "All he asked in"
	line "return is that I"
	cont "don't disappoint"
	cont "him."
	
	para "But I did…"
	
	para "…"
	
	para "Take the stupid"
	line "stone back!"
	
	para "It's useless to"
	line "me now!"
	done
	
DragonShrineTopRivalSceneText12:
	text "Now, get outta"
	line "here!"
	
	para "You won't be seeing"
	line "any more of me."
	done
	
DragonShrineTopRivalSceneText13:
	text "Don't come any"
	line "closer, <PLAYER>!"
	
	para "Don't try to stop"
	line "me!"
	done
	
DragonShrineTopRivalSceneText14:
	text "…<WAIT_L>He's gone…"
	done
	
DragonShrineLightning:
	ld a, $40 | 1
	ld [wTimeOfDayPalFlags], a
	ld de, SFX_THUNDER
	call PlaySFX
	farcall Special_UpdatePalsInstant
	ld a, $40 | 0
	ld [wTimeOfDayPalFlags], a
	ret
	
Movement_DragonShrineTopScene1:
	big_step_right
	big_step_right
	step_end
	
Movement_DragonShrineTopScene6:
	big_step_left
	
Movement_DragonShrineTopScene5:
	big_step_left
	big_step_left
	step_end
	
Movement_DragonShrineTopLightning:
	step_sleep 50
Movement_DragonShrineTopLightningShort:
	step_sleep 10
	step_end

Movement_DragonShrineTopPlayerJump:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_DragonShrineTopCameraPan:
	slow_step_up
	slow_step_up
	step_end
	
Movement_DragonShrineTopCameraPan2:
	slow_step_down
	slow_step_down
	step_end
	
Movement_DragonShrineTopThrowItem:
	fix_facing
	set_sliding
	jump_step_down
	remove_sliding
	remove_fixed_facing
	step_end

Movement_DragonShrineTopColbyStepBack:
	fix_facing
	slow_half_step_back
	remove_fixed_facing
	step_end