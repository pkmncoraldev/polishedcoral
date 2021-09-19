ShimmerLabExperimentalLab_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  9, SHIMMER_LAB_LOBBY, 4
	warp_event  6,  9, SHIMMER_LAB_LOBBY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 11 ; object events
	person_event SPRITE_SCIENTIST,  6,  3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabFossilCutscene, -1
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_PLAYER_CUTSCENE,  6,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_ALT
	person_event SPRITE_SCIENTIST,  6,  4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, 0, EVENT_ALWAYS_SET
	person_event SPRITE_BOOK_PAPER_POKEDEX,  2,  1, SPRITEMOVEDATA_FOSSIL_MACHINE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_BOOK_PAPER_POKEDEX,  2, 10, SPRITEMOVEDATA_FOSSIL_MACHINE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	
	const_def 1 ; object constants
	const SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_RED
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BLUE
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_GREEN
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BROWN
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PURPLE
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_TEAL
	const SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PINK
	const SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST2
	
	
	
ShimmerLabExperimentalLabBook:
	end

ShimmerLabFossilCutscene:
	faceplayer
	opentext
	writetext ShimmerLabLabFossilCutsceneText1
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext	
	pause 5
	
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	if_equal UP, .YouAreFacingUp
	applymovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, Movement_ShimmerLabLabFossilCutscene1
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, UP
	spriteface PLAYER, UP
	pause 10
	changeblock $0, $2, $8c
	changeblock $2, $2, $8d
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	opentext
	writetext ShimmerLabLabFossilCutsceneText2
	waitbutton
	closetext
	pause 5
	applyonemovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, turn_step_up
	closetext
	pause 10
	changeblock $0, $2, $77
	changeblock $2, $2, $78
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 5
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, DOWN
	pause 5
	applyonemovement PLAYER, step_left
	jump .cont
.YouAreFacingRight
	applymovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, Movement_ShimmerLabLabFossilCutscene2
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, UP
	spriteface PLAYER, UP
	pause 10
	changeblock $0, $2, $8c
	changeblock $2, $2, $8d
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	opentext
	writetext ShimmerLabLabFossilCutsceneText2
	waitbutton
	closetext
	pause 5
	applyonemovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, turn_step_up
	closetext
	pause 10
	changeblock $0, $2, $77
	changeblock $2, $2, $78
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 5
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, DOWN
	pause 5
	applyonemovement PLAYER, step_right
	jump .cont
.YouAreFacingUp
	applymovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, Movement_ShimmerLabLabFossilCutscene2
	applyonemovement PLAYER, step_up
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, UP
	pause 10
	changeblock $0, $2, $8c
	changeblock $2, $2, $8d
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	opentext
	writetext ShimmerLabLabFossilCutsceneText2
	waitbutton
	closetext
	pause 5
	applyonemovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, turn_step_up
	closetext
	pause 10
	changeblock $0, $2, $77
	changeblock $2, $2, $78
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 5
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, DOWN
	pause 5
.cont
	spriteface PLAYER, UP
	pause 5
	opentext
	writetext ShimmerLabLabFossilCutsceneText3
	waitbutton
	closetext

	waitbutton
	closetext
	
	copybytetovar wPlayerPalette
    if_equal 0, .red
    if_equal 1, .blue
    if_equal 2, .green
	if_equal 3, .brown
	if_equal 4, .purple
	if_equal 5, .teal
	if_equal 6, .pink
.red:	
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_RED
	jump .cont3

.blue
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BLUE
	jump .cont3

.green
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_GREEN
	jump .cont3
	
.brown
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BROWN
	jump .cont3
	
.purple
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PURPLE
	jump .cont3
	
.teal
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_TEAL
	jump .cont3
	
.pink
	appear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PINK

.cont3
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_RED, UP
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BLUE, UP
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_GREEN, UP
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BROWN, UP
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PURPLE, UP
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_TEAL, UP
	spriteface SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PINK, UP
	
	pause 10
	applyonemovement PLAYER, hide_person
	special Special_FadeOutMusic
	applymovement PLAYER, Movement_ShimmerLabLabFossilCutscenePlayer1
	pause 20
	spriteface PLAYER, DOWN
	pause 20
	writecode VAR_MOVEMENT, $fe
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SCIENTIST
	writebyte (1 << 7) | (PAL_OW_BROWN << 4)
	special Special_SetPlayerPalette
	special MapCallbackSprites_LoadUsedSpritesGFX
	applyonemovement PLAYER, show_person
	applyonemovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, hide_person
	
	playmusic MUSIC_MOM
	opentext
	writetext ShimmerLabLabFossilCutsceneText4
	waitbutton
	closetext
	pause 10
	spriteface PLAYER, UP
	pause 25
	playsound SFX_FOSSIL_MACHINE
	earthquake 60
	pause 20
	
	callasm ShimmerLabExperimentalLabChangeColorRedAsm
	special FadeInPalettes
rept 2
	playsound SFX_SLOT_MACHINE_START
	callasm ShimmerLabExperimentalLabFlashAsm
	waitsfx
endr
	callasm ShimmerLabExperimentalLabChangeColorYellowAsm
	special FadeInPalettes
	pause 20	
	playsound SFX_SLOT_MACHINE_START
	callasm ShimmerLabExperimentalLabFlashAsm
	waitsfx
	pause 10
	
	applymovement PLAYER, Movement_ShimmerLabLabFossilCutscenePlayer2
	spriteface PLAYER, DOWN
	pause 5
	opentext
	writetext ShimmerLabLabFossilCutsceneText5
	playsound SFX_HIT_END_OF_EXP_BAR
	waitsfx
	pause 5
	closetext
	spriteface PLAYER, UP
	pause 10
	opentext
	writetext ShimmerLabLabFossilCutsceneText6
	waitbutton
	closetext
	pause 10
	
	applymovement PLAYER, Movement_ShimmerLabLabFossilCutscenePlayer2
	spriteface PLAYER, DOWN
	pause 5
	opentext
	writetext ShimmerLabLabFossilCutsceneText7
	waitbutton
	closetext
	pause 10
	spriteface PLAYER, UP
	pause 25
	
rept 2
	playsound SFX_SLOT_MACHINE_START
	callasm ShimmerLabExperimentalLabFlashAsm
	waitsfx
endr
	callasm ShimmerLabExperimentalLabChangeColorGreenAsm
	special FadeInPalettes
	special Special_FadeOutMusic
	pause 35
	playsound SFX_FOSSIL_MACHINE
	earthquake 60
	pause 10
	playsound SFX_FOSSIL_MACHINE
	earthquake 60
	pause 80
	playsound SFX_SLOT_MACHINE_START
	callasm ShimmerLabExperimentalLabFlashAsm
	waitsfx
	callasm ShimmerLabExperimentalLabChangeColorRedAsm
	special FadeInPalettes
	
	disappear SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST

	pause 40
	changeblock $a, $2, $8e
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 50
	playsound SFX_DEX_FANFARE_170_199
	opentext
	writetext ShimmerLabLabFossilCutsceneText8
	waitsfx
	closetext
	pause 10
	changeblock $a, $2, $7a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	playmusic MUSIC_SHIMMER_CITY
	pause 15
	applymovement PLAYER, Movement_ShimmerLabLabFossilCutscenePlayer3
	appear SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST2
	pause 15
	applymovement PLAYER, Movement_ShimmerLabLabFossilCutscenePlayer4
	spriteface PLAYER, RIGHT
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special Special_RestorePlayerPalette
	special MapCallbackSprites_LoadUsedSpritesGFX
	applyonemovement PLAYER, show_person
	pause 10
	opentext
	writetext ShimmerLabLabFossilCutsceneText9
	waitbutton
	writetext ShimmerLabLabFossilTyruntText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYRUNT, 20
	writetext ShimmerLabLabFossilCutsceneText10
	waitbutton
	closetext
	setevent EVENT_ALWAYS_SET
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_RED
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BLUE
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_GREEN
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BROWN
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PURPLE
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_TEAL
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PINK
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	end
	
ShimmerLabLabFossilCutsceneText1:
	text "<PLAYER> handed over"
	line "the JAW FOSSIL."
	done
	
ShimmerLabLabFossilCutsceneText2:
	text "I'll put the fossil"
	line "into the chamber"
	cont "and we can begin!"
	done
	
ShimmerLabLabFossilCutsceneText3:
	text "Ready?"
	
	para "Go ahead and press"
	line "that button on the"
	cont "computer and the"
	cont "machine will start"
	cont "up."
	done
	
ShimmerLabLabFossilCutsceneText4:
	text "Alright!"
	
	para "First, the machine"
	line "will separate the"
	cont "organic material"
	cont "from the rock,"
	
	para "and extract the"
	line "ancient #MON's"
	cont "DNA."
	done
	
ShimmerLabLabFossilCutsceneText5:
	text "Next, we process"
	line "that DNA into data"
	cont "the machine can"
	cont "understand."
	
	para "This is a very"
	line "technical process"
	cont "and could take a"
	cont "very very long-"
	done
	
ShimmerLabLabFossilCutsceneText6:
	text "That was quick!"
	done
	
ShimmerLabLabFossilCutsceneText7:
	text "Lastly, we use the"
	line "data from the last"
	cont "step to create a"
	cont "clone of the"
	cont "ancient #MON."
	done
	
ShimmerLabLabFossilCutsceneText8:
	text "Success!"
	done
	
ShimmerLabLabFossilCutsceneText9:
	text "It turned out"
	line "wonderfully!"
	
	para "Here you are!"
	done
	
ShimmerLabLabFossilCutsceneText10:
	text "You've really"
	line "helped with our"
	cont "research!"
	
	para "Please bring me"
	line "any other fossils"
	cont "you find on your"
	cont "travels!"
	done
	
ShimmerLabLabFossilTyruntText:
	text "<PLAYER> received"
	line "TYRUNT!"
	done
	
Movement_ShimmerLabLabFossilCutscenePlayer1:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_left
	step_end
	
Movement_ShimmerLabLabFossilCutscenePlayer2:
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_ShimmerLabLabFossilCutscenePlayer3:
	step_left
	step_left
	step_left
	step_left
	slow_step_down
	step_down
	step_down
	step_left
	step_left
	step_end
	
Movement_ShimmerLabLabFossilCutscenePlayer4:
	hide_person
	slow_step_left
	step_end
	
Movement_ShimmerLabLabFossilCutscene1:
	step_down
	step_right
	step_right
	step_right
	step_up
	step_up
	slow_step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_ShimmerLabLabFossilCutscene2:
	step_right
	step_right
	step_right
	step_up
	slow_step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_end
	
Movement_ShimmerLabLabFossilCutsceneRight:
	step_down
	step_right
	step_right
	step_up
	step_end
	
Movement_ShimmerLabLabFossilCutsceneUp:
	step_right
	step_up
	step_end
	
ShimmerLabExperimentalLabChangeColorRedAsm:
	ld hl, ShimmerLabExperimentalLabRed
	jr ShimmerLabExperimentalLabChangeColorFinish
	
ShimmerLabExperimentalLabChangeColorYellowAsm:
	ld hl, ShimmerLabExperimentalLabYellow
	jr ShimmerLabExperimentalLabChangeColorFinish
	
ShimmerLabExperimentalLabChangeColorGreenAsm:
	ld hl, ShimmerLabExperimentalLabGreen
ShimmerLabExperimentalLabChangeColorFinish:
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM
	ret
	
ShimmerLabExperimentalLabRed:
	RGB 30, 28, 26
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 13, 13, 13
	
ShimmerLabExperimentalLabYellow:
	RGB 30, 28, 26
	RGB 27, 27, 07
	RGB 24, 18, 07
	RGB 13, 13, 13
	
ShimmerLabExperimentalLabGreen:
	RGB 30, 28, 26
	RGB 18, 27, 13
	RGB 07, 21, 02
	RGB 13, 13, 13

ShimmerLabExperimentalLabFlashAsm:
	ld c, 15
	call DelayFrames
	ld c, $4
.palette_loop
	push bc
	call .FlashPalettes
	ld c, 10
	call DelayFrames
	pop bc
	dec c
	jr nz, .palette_loop
	ret
.FlashPalettes:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, wOBPals palette PAL_OW_SILVER
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	ld c, $3
.palette_loop_2
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	dec hl
	ld a, d
	ld [hld], a
	ld a, e
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .palette_loop_2
	pop de
	dec hl
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a

	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret