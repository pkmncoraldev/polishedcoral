ShimmerLabExperimentalLab_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  9, SHIMMER_LAB_LOBBY, 4
	warp_event  6,  9, SHIMMER_LAB_LOBBY, 4

	db 0 ; coord events

	db 1 ; bg events
	signpost  7,  8, SIGNPOST_READ, ShimmerLabExperimentalLabBook

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
	opentext
	writetext ShimmerLabExperimentalLabBookText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext ShimmerLabExperimentalLabBookTextWhich
	loadmenudata ShimmerLabExperimentalLabBookMenuData
	verticalmenu
	closewindow
	if_equal $1, .cover
	if_equal $2, .plume
	if_equal $3, .cancel
	jump .cancel
.cover
	closetext
	pokepic TIRTOUGA
	waitbutton
	closepokepic
	callasm SetCoverDex
	end
.plume
	closetext
	pokepic ARCHEN
	waitbutton
	closepokepic
	callasm SetPlumeDex
	end
.cancel
	closetext
	end
	
SetCoverDex:
	ld a, TIRTOUGA
	jp SetSeenMon
	
SetPlumeDex:
	ld a, ARCHEN
	jp SetSeenMon
	
ShimmerLabExperimentalLabBookMenuData:
	db $40 ; flags
	db 00, 00 ; start coords
	db 12, 14 ; end coords
	dw .MenuData
	db 1 ; default option

.MenuData:
	db $80 ; flags
	db 3 ; items
	db "COVER FOSSIL@"
	db "PLUME FOSSIL@"
	db "CANCEL@"
	end
	
ShimmerLabExperimentalLabBookText1:
	text "A book with an"
	line "artist's renders of"
	cont "ancient #MON!"
	done

ShimmerLabExperimentalLabBookTextWhich:
	text "Which article?"
	done
	
ShimmerLabFossilCutscene:
	faceplayer
	opentext
	writetext ShimmerLabFossilCutsceneText1
	checkitem COVER_FOSSIL
	iftrue .own_cover
	checkitem PLUME_FOSSIL
	iftrue .own_plume
	checkitem OLD_AMBER
	iftrue .ask_old_amber
	jumpopenedtext NoFossilsText

.own_cover
	checkitem PLUME_FOSSIL
	iftrue .own_cover_and_plume
	checkitem OLD_AMBER
	iftrue .ask_cover_amber
	writetext AskCoverFossilText
	yesorno
	iftrue ResurrectCoverFossil
	jump .maybe_later

.own_plume
	checkitem OLD_AMBER
	iftrue .ask_plume_amber
	writetext AskPlumeFossilText
	yesorno
	iftrue ResurrectPlumeFossil
	jump .maybe_later

.own_cover_and_plume
	checkitem OLD_AMBER
	iftrue .ask_cover_plume_amber
	loadmenu CoverDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectCoverFossil
	ifequal $2, ResurrectPlumeFossil
	jump .maybe_later

.ask_old_amber
	writetext AskOldAmberText
	yesorno
	iftrue ResurrectOldAmber
	jump .maybe_later

.ask_cover_amber
	loadmenu CoverAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectCoverFossil
	ifequal $2, ResurrectOldAmber
	jump .maybe_later

.ask_plume_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectPlumeFossil
	ifequal $2, ResurrectOldAmber
	jump .maybe_later

.ask_cover_plume_amber
	loadmenu CoverDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, ResurrectCoverFossil
	ifequal $2, ResurrectPlumeFossil
	ifequal $3, ResurrectOldAmber
.maybe_later:
	jumpopenedtext MaybeLaterText

CoverDomeMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "COVER FOSSIL@"
	db "DOME FOSSIL@"
	db "CANCEL@"

CoverAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "COVER FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

DomeAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

CoverDomeAmberMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "COVER FOSSIL@"
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"
	
ResurrectCoverFossil:
	takeitem COVER_FOSSIL
	setevent EVENT_REVIVING_COVER
	clearevent EVENT_REVIVING_PLUME
	writetext ShimmerLabHandOverCover
	jump ShimmerLabFossilCutsceneCont
	
ResurrectPlumeFossil:
	takeitem PLUME_FOSSIL
	clearevent EVENT_REVIVING_COVER
	setevent EVENT_REVIVING_PLUME
	writetext ShimmerLabHandOverPlume
	jump ShimmerLabFossilCutsceneCont
	
ResurrectOldAmber:
	takeitem OLD_AMBER
	clearevent EVENT_REVIVING_COVER
	clearevent EVENT_REVIVING_PLUME
	writetext ShimmerLabHandOverAmber
	
ShimmerLabFossilCutsceneCont:
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext	
	pause 5
	
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	if_equal UP, .YouAreFacingUp
	applymovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, Movement_ShimmerLabFossilCutscene1
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, UP
	spriteface PLAYER, UP
	pause 10
	changeblock $0, $2, $8c
	changeblock $2, $2, $8d
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	opentext
	writetext ShimmerLabFossilCutsceneText2
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
	applymovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, Movement_ShimmerLabFossilCutscene2
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, UP
	spriteface PLAYER, UP
	pause 10
	changeblock $0, $2, $8c
	changeblock $2, $2, $8d
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	opentext
	writetext ShimmerLabFossilCutsceneText2
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
	applymovement SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, Movement_ShimmerLabFossilCutscene2
	applyonemovement PLAYER, step_up
	spriteface SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST, UP
	pause 10
	changeblock $0, $2, $8c
	changeblock $2, $2, $8d
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	opentext
	writetext ShimmerLabFossilCutsceneText2
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
	writetext ShimmerLabFossilCutsceneText3
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
	applymovement PLAYER, Movement_ShimmerLabFossilCutscenePlayer1
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
	writetext ShimmerLabFossilCutsceneText4
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
	
	applymovement PLAYER, Movement_ShimmerLabFossilCutscenePlayer2
	spriteface PLAYER, DOWN
	pause 5
	opentext
	writetext ShimmerLabFossilCutsceneText5
	playsound SFX_HIT_END_OF_EXP_BAR
	waitsfx
	pause 5
	closetext
	spriteface PLAYER, UP
	pause 10
	opentext
	writetext ShimmerLabFossilCutsceneText6
	waitbutton
	closetext
	pause 10
	
	applymovement PLAYER, Movement_ShimmerLabFossilCutscenePlayer2
	spriteface PLAYER, DOWN
	pause 5
	opentext
	writetext ShimmerLabFossilCutsceneText7
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
	writetext ShimmerLabFossilCutsceneText8
	waitsfx
	closetext
	pause 10
	changeblock $a, $2, $7a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	pause 10
	playmusic MUSIC_SHIMMER_CITY
	pause 15
	applymovement PLAYER, Movement_ShimmerLabFossilCutscenePlayer3
	appear SHIMMER_LAB_EXPERIMENTAL_LAB_SCIENTIST2
	pause 15
	applymovement PLAYER, Movement_ShimmerLabFossilCutscenePlayer4
	spriteface PLAYER, RIGHT
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	special Special_RestorePlayerPalette
	special MapCallbackSprites_LoadUsedSpritesGFX
	applyonemovement PLAYER, show_person
	pause 10
	opentext
	writetext ShimmerLabFossilCutsceneText9
	waitbutton
	
	checkevent EVENT_REVIVING_COVER
	iftrue .tirtouga
	checkevent EVENT_REVIVING_PLUME
	iftrue .archen
	writetext ShimmerLabAerodactylText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 20
	jump .end
.tirtouga
	writetext ShimmerLabTirtougaText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TIRTOUGA, 20
	jump .end
.archen
	writetext ShimmerLabArchenText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke ARCHEN, 20
.end
	writetext ShimmerLabFossilCutsceneText10
	waitbutton
	closetext
	setevent EVENT_ALWAYS_SET
	clearevent EVENT_REVIVING_COVER
	clearevent EVENT_REVIVING_PLUME
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_RED
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BLUE
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_GREEN
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_BROWN
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PURPLE
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_TEAL
	disappear SHIMMER_LAB_EXPERIMENTAL_PLAYER_CUTSCENE_PINK
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	end

ShimmerLabHandOverCover:
	text "<PLAYER> handed over"
	line "the COVER FOSSIL."
	done
	
ShimmerLabHandOverPlume:
	text "<PLAYER> handed over"
	line "the PLUME FOSSIL."
	done
	
ShimmerLabHandOverAmber:
	text "<PLAYER> handed over"
	line "the OLD AMBER."
	done
	
ShimmerLabFossilCutsceneText1:
	text "I'm working on a"
	line "machine that can"
	cont "clone #MON from"
	cont "fossils!"
	
	para "Do you have a"
	line "fossil for me?"
	done
	
ShimmerLabFossilCutsceneText2:
	text "I'll put the fossil"
	line "into the chamber"
	cont "and we can begin!"
	done
	
ShimmerLabFossilCutsceneText3:
	text "Ready?"
	
	para "Go ahead and press"
	line "that button on the"
	cont "computer and the"
	cont "machine will start"
	cont "up."
	done
	
ShimmerLabFossilCutsceneText4:
	text "Alright!"
	
	para "First, the machine"
	line "will separate the"
	cont "organic material"
	cont "from the rock,"
	
	para "and extract the"
	line "ancient #MON's"
	cont "DNA."
	done
	
ShimmerLabFossilCutsceneText5:
	text "Next, we process"
	line "that DNA into data"
	cont "the machine can"
	cont "understand."
	
	para "This is a very"
	line "technical process"
	cont "and could take a"
	cont "very very long-"
	done
	
ShimmerLabFossilCutsceneText6:
	text "That was quick!"
	done
	
ShimmerLabFossilCutsceneText7:
	text "Lastly, we use the"
	line "data from the last"
	cont "step to create a"
	cont "clone of the"
	cont "ancient #MON."
	done
	
ShimmerLabFossilCutsceneText8:
	text "Success!"
	done
	
ShimmerLabFossilCutsceneText9:
	text "It turned out"
	line "wonderfully!"
	
	para "Here you are!"
	done
	
ShimmerLabFossilCutsceneText10:
	text "You've really"
	line "helped with our"
	cont "research!"
	
	para "Please bring me"
	line "any other fossils"
	cont "you find on your"
	cont "travels!"
	done
	
ShimmerLabTirtougaText:
	text "<PLAYER> received"
	line "TIRTOUGA!"
	done
	
ShimmerLabArchenText:
	text "<PLAYER> received"
	line "ARCHEN!"
	done
	
ShimmerLabAerodactylText:
	text "<PLAYER> received"
	line "AERODACTYL!"
	done
	
AskCoverFossilText:
	text "Do you want to"
	line "resurrect the"
	cont "COVER FOSSIL?"
	done

AskPlumeFossilText:
	text "Do you want to"
	line "resurrect the"
	cont "PLUME FOSSIL?"
	done

AskOldAmberText:
	text "Do you want to"
	line "resurrect the"
	cont "OLD AMBER?"
	done
	
NoFossilsText:
	text "You don't seem to"
	line "have any fossils."
	done
	
MaybeLaterText:
	text "Come back if you"
	line "change your mind."
	done
	
Movement_ShimmerLabFossilCutscenePlayer1:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_left
	step_end
	
Movement_ShimmerLabFossilCutscenePlayer2:
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_ShimmerLabFossilCutscenePlayer3:
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
	
Movement_ShimmerLabFossilCutscenePlayer4:
	hide_person
	slow_step_left
	step_end
	
Movement_ShimmerLabFossilCutscene1:
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
	
Movement_ShimmerLabFossilCutscene2:
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
	
Movement_ShimmerLabFossilCutsceneRight:
	step_down
	step_right
	step_right
	step_up
	step_end
	
Movement_ShimmerLabFossilCutsceneUp:
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