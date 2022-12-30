MtOnwaCliff_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, MtOnwaCliffCallback

	db 2 ; warp events
	warp_def 21, 28, 2, MT_ONWA_1F
	warp_def 33, 4, 1, MT_ONWA_2F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 15, 32, SIGNPOST_ITEM + SHINY_STONE, EVENT_MT_ONWA_CLIFF_HIDDEN_SHINY_STONE

	db 6 ; object events
	person_event SPRITE_ROCKER, 15, 30, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwaOutside_1, -1
	person_event SPRITE_HIKER, 13, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwaOutside_2, -1
	person_event SPRITE_COOLTRAINER_F, 29, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerMtOnwaOutside_3, -1
	person_event SPRITE_YOUNGSTER, 8, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, MtOnwaPanNPC, EVENT_MT_ONWA_NPC_1
	person_event SPRITE_CUTE_GIRL, 8, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, MtOnwaPanNPC, EVENT_MT_ONWA_NPC_2
	person_event SPRITE_PLAYER_CUTSCENE, 8, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER

	const_def 1 ; object constants
	const MT_ONWA_TRAINER1
	const MT_ONWA_TRAINER2
	const MT_ONWA_TRAINER3
	const MT_ONWA_NPC1
	const MT_ONWA_NPC2
	const MT_ONWA_CUTSCENE
	
MtOnwaCliffCallback:
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .playerfemale
	disappear MT_ONWA_NPC1
	disappear MT_ONWA_NPC2
	appear MT_ONWA_NPC2
	return
.playerfemale
	disappear MT_ONWA_NPC1
	appear MT_ONWA_NPC1
	disappear MT_ONWA_NPC2
	return
	
MtOnwaPanNPC:
	faceplayer
	opentext
	writetext MtOnwaPanNPCTextYesorNo
	yesorno
	iffalse .end
	writetext MtOnwaPanNPCText1
	waitbutton
	closetext
	spriteface MT_ONWA_NPC1, UP
	spriteface MT_ONWA_NPC2, UP
	checkcode VAR_FACING
	if_equal RIGHT, .cont
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement PLAYER, Movement_MtOnwaWalk1
	jump .cont
.YouAreFacingLeft
	applymovement PLAYER, Movement_MtOnwaWalk2
.cont
	spriteface PLAYER, UP
	appear MT_ONWA_CUTSCENE
	spriteface MT_ONWA_NPC1, UP
	spriteface MT_ONWA_NPC2, UP
	pause 15
	special Special_FadeOutMusic
	pause 20
	applyonemovement PLAYER, hide_person
	applymovement PLAYER, Movement_MtOnwaCutscene1
	playmusic MUSIC_NONE
	pause 20
	playmusic MUSIC_MOUNTAINTOP
	pause 20
	opentext
	writetext MtOnwaPanNPCText2
	waitbutton
	closetext
	pause 40
	opentext
	writetext MtOnwaPanNPCText5
	waitbutton
	closetext
	pause 40
	opentext
	writetext MtOnwaPanNPCText6
	waitbutton
	closetext
	waitbuttonsilent
	closetext
	applymovement PLAYER, Movement_MtOnwaCutscene2
	special Special_FadeOutMusic
	spriteface PLAYER, UP
	applyonemovement PLAYER, show_person
	disappear MT_ONWA_CUTSCENE
	pause 20
	special RestartMapMusic
	spriteface MT_ONWA_NPC1, LEFT
	spriteface MT_ONWA_NPC2, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext MtOnwaPanNPCText7
	yesorno
	iffalse .no_heal
	closetext	
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	opentext
.no_heal
	writetext MtOnwaPanNPCText3
	waitbutton
	closetext
	spriteface MT_ONWA_NPC1, UP
	spriteface MT_ONWA_NPC2, UP
	end
.end
	writetext MtOnwaPanNPCText4
	waitbutton
	closetext
	spriteface MT_ONWA_NPC1, UP
	spriteface MT_ONWA_NPC2, UP
	end
	
TrainerMtOnwaOutside_1:
	generictrainer COOLTRAINERM, CODY, EVENT_BEAT_MT_ONWA_CLIFF_TRAINER_1, .SeenText, .BeatenText

	text "I should have just"
	line "minded my own"
	cont "business."
	done

.SeenText:
	text "Ah!"
	
	para "The air out here"
	line "is so refreshing"
	cont "after being in"
	cont "that cave for so"
	cont "long."
	
	para "Now I'm itching for"
	line "a battle!"
	done

.BeatenText:
	text "Scratch that…"
	done
	
TrainerMtOnwaOutside_2:
	generictrainer HIKER, TED, EVENT_BEAT_MT_ONWA_CLIFF_TRAINER_2, .SeenText, .BeatenText

	text "You're strong,"
	line "alright."
	done

.SeenText:
	text "If you made it up"
	line "this high, you"
	cont "must be quite the"
	cont "TRAINER!"
	done

.BeatenText:
	text "Yep!"
	
	para "I was right!"
	done
	
TrainerMtOnwaOutside_3:
	generictrainer COOLTRAINERF, CASEY, EVENT_BEAT_MT_ONWA_CLIFF_TRAINER_3, .SeenText, .BeatenText

	text "I think that's"
	line "enough training"
	cont "for now…"
	done

.SeenText:
	text "The air up here is"
	line "a lot thinner."
	
	para "It's a great place"
	line "to train!"
	done

.BeatenText:
	text "Woah…"
	
	para "I'm getting light-"
	line "headed…"
	done
	
MtOnwaPanNPCText1:
	text "Great!"
	done
	
MtOnwaPanNPCText2:
	text "We're so high up!"
	done
	
MtOnwaPanNPCText3:
	text "Thanks for sharing"
	line "the view with me!"
	
	para "Come back any"
	line "time."
	
	para "I'll be here!"
	done
	
MtOnwaPanNPCText4:
	text "Oh well…"
	
	para "More view for me!"
	done
	
MtOnwaPanNPCText5:
	text "Everything looks"
	line "so small from up"
	cont "here."
	done
	
MtOnwaPanNPCText6:	
	text "It's a bit"
	line "romantic…"
	done
	
MtOnwaPanNPCText7:
	text "Would you and your"
	line "#MON like to"
	cont "rest here for a"
	cont "while?"
	done
	
MtOnwaPanNPCTextYesorNo:
	text "The view from here"
	line "is amazing!"
	
	para "Want to look with"
	line "me for a while?"
	done
	
Movement_MtOnwaWalk1:
	step_left
	step_up
	step_end
	
Movement_MtOnwaWalk2:
	step_down
	step_left
	step_left
	step_up
	step_end
	
Movement_MtOnwaCutscene1:
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
	
Movement_MtOnwaCutscene2:
	slow_step_down
	slow_step_down
	slow_step_down
	step_end
	
MtOnwaCutsceneShowPersonMovement:
	show_person
	step_end

MtOnwaCutsceneHidePersonMovement:
	hide_person
	step_end
