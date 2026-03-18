MtOnwaCliff_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 21, 28, 2, MT_ONWA_2F
	warp_def 33, 4, 8, MT_ONWA_1F

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_ROCKER, 15, 30, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwaOutside_1, -1
	person_event SPRITE_BIRD_KEEPER, 13, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwaOutside_2, -1
	person_event SPRITE_COOLTRAINER_F, 29, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerMtOnwaOutside_3, -1
	person_event SPRITE_MINA,  9, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtOnwaMina, EVENT_MT_ONWA_MINA_GONE
	person_event SPRITE_PAINTINGS,  8, 17, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MtOnwaEasel, EVENT_MT_ONWA_MINA_GONE
	person_event SPRITE_LEAVES,  8, 17, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MtOnwaEasel, EVENT_MT_ONWA_MINA_GONE
	person_event SPRITE_PLAYER_CUTSCENE,  9, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER

	const_def 1 ; object constants
	const MT_ONWA_TRAINER1
	const MT_ONWA_TRAINER2
	const MT_ONWA_TRAINER3
	const MT_ONWA_MINA
	const MT_ONWA_PAINTING
	const MT_ONWA_EASEL
	const MT_ONWA_CUTSCENE
	
MtOnwaEasel:
	jumptext MtOnwaEaselText
	
MtOnwaEaselText:
	text "MINA's easel."
	done
	
MtOnwaMina:
	faceplayer
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText1
	waitbutton
	closetext
	spriteface MT_ONWA_MINA, UP
	special Special_ForcePlayerStateNormal
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
	spriteface MT_ONWA_MINA, UP
	pause 15
	special Special_FadeOutMusic
	pause 20
	applyonemovement PLAYER, hide_person
	applymovement PLAYER, Movement_MtOnwaCutscene1
	playmusic MUSIC_NONE
	pause 20
	playmusic MUSIC_MOUNTAINTOP
	pause 20
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText2
	waitbutton
	closetext
	pause 40
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText3
	waitbutton
	closetext
	pause 40
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText4
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
	playmusic MUSIC_MINA
	spriteface MT_ONWA_MINA, LEFT
	spriteface PLAYER, RIGHT
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText5
	waitbutton
	closetext
	
	follow MT_ONWA_MINA, PLAYER
	applyonemovement MT_ONWA_MINA, step_right
	stopfollow
	spriteface MT_ONWA_MINA, LEFT
	spriteface PLAYER, UP
	pause 40
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText6
	pause 10
	spriteface MT_ONWA_MINA, DOWN
	farwritetext StdBlankText
	pause 6
	writetext MtOnwaMinaText7
	waitbutton
	closetext
	pause 40
	spriteface MT_ONWA_MINA, LEFT
	spriteface PLAYER, RIGHT
	pause 20
	
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText8
	waitbutton
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText9
	waitbutton
	closetext
	waitsfx
	
	winlosstext MtOnwaMinaWinText, 0
	setlasttalked MT_ONWA_MINA
	checkevent EVENT_REACHED_LUSTER_CITY
	iftrue .got_to_luster
	loadtrainer MINA, 2
	jump .cont2
.got_to_luster
	loadtrainer MINA, 3
.cont2
	startbattle
	dontrestartmapmusic
	reloadmap
	playmusic MUSIC_MINA
	
	opentext TEXTBOX_MINA
	writetext MtOnwaMinaText10
	waitbutton
	closetext
	follow PLAYER, MT_ONWA_MINA
	applyonemovement PLAYER, step_left
	stopfollow
	spriteface PLAYER, RIGHT
	spriteface MT_ONWA_MINA, UP
	playsound SFX_UNKNOWN_61
	disappear MT_ONWA_PAINTING
	pause 25
	playsound SFX_SWITCH_POCKETS
	disappear MT_ONWA_EASEL
	pause 25
	spriteface MT_ONWA_MINA, LEFT
	pause 10
	opentext TEXTBOX_MINA
	special Special_MinaGoodbye
	waitbutton
	closetext
	applymovement MT_ONWA_MINA, Movement_MtOnwaMinaLeave
	disappear MT_ONWA_MINA
	setevent EVENT_MT_ONWA_MINA_GONE
	setevent EVENT_DONE_MT_ONWA_MINA
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_MT_ONWA
	setflag ENGINE_MINA_MT_ONWA
	special Special_FadeOutMusic
	pause 10
	playmapmusic
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
	generictrainer BIRD_KEEPER, TED, EVENT_BEAT_MT_ONWA_CLIFF_TRAINER_2, .SeenText, .BeatenText

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
	text "Yep!<WAIT_M>"
	line "I was right!"
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
	
MtOnwaMinaText1:
	text "Oh, hi <PLAYER>."
	
	para "It's MINA!<WAIT_M>"
	line "Remember me?"
	
	para "Good to see you"
	line "again."
	
	para "Check out this"
	line "view with me for"
	cont "a minute."
	done
	
MtOnwaMinaText2:
	text "We're so high up,"
	line "huh?"
	done
	
MtOnwaMinaText3:
	text "Everything looks"
	line "so small from up"
	cont "here."
	done
	
MtOnwaMinaText4:	
	text "It's a bit…<WAIT_M>"
	line "romantic…"
	done

MtOnwaMinaText5:
	text "I couldn't pass up"
	line "the opportunity to"
	cont "paint this view."
	
	para "There's no better"
	line "inspiration than"
	cont "the beauty of"
	cont "nature!"
	
	para "Here, <WAIT_S>take a look!"
	done
	
MtOnwaMinaText6:
	text "Well?"
	
	para "What do you think?"

	para "I call it:<WAIT_L>"
	done

MtOnwaMinaText7:
	text "“Mountaintop"
	line "Vista”."
	done

MtOnwaMinaText8:
	text "While you're here,"
	line "why don't we have"
	cont "another battle?"
	
	para "But first, let me"
	line "heal your #MON."
	done

MtOnwaMinaText9:
	text "Ok!"
	
	para "Let's do it!"
	done
	
MtOnwaMinaText10:
	text "Alright, you win!"
	
	para "That was fun, but"
	line "I should be going."
	
	para "I've got places to"
	line "be and paintings"
	cont "to paint!"
	done
	
MtOnwaMinaWinText:
	text "Haha!"
	line "Good job!"
	done
	
Movement_MtOnwaMinaLeave:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
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
