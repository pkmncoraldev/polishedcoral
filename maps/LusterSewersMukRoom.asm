LusterSewersMukRoom_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersMukRoomTrigger0
	scene_script LusterSewersMukRoomTrigger1
	scene_script LusterSewersMukRoomTrigger2

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 11,  7, 5, LUSTER_SEWERS_B2F
	warp_def 11,  8, 5, LUSTER_SEWERS_B2F

	db 0 ; coord events

	db 0 ; bg events

	db 16 ; object events
	person_event SPRITE_GRIMER_A,  6,  6, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer1, EVENT_LUSTER_SEWERS_GRIMER_1
	person_event SPRITE_GRIMER_A_OW,  6,  6, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_GRIMER_A,  6,  7, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer2, EVENT_LUSTER_SEWERS_GRIMER_2
	person_event SPRITE_GRIMER_A_OW,  6,  7, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer2, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_GRIMER_A,  6,  8, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer3, EVENT_LUSTER_SEWERS_GRIMER_3
	person_event SPRITE_GRIMER_A_OW,  6,  8, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer3, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_GRIMER_A,  6,  9, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer4, EVENT_LUSTER_SEWERS_GRIMER_4
	person_event SPRITE_GRIMER_A_OW,  6,  9, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer4, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_BIG_MUK,  4,  7, SPRITEMOVEDATA_BIG_MUK_2, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterSewersMukRoomGrimer1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE
	person_event SPRITE_PLAYER_CUTSCENE,  7,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_MT_ONWA_CUTSCENE

	
	const_def 1 ; object constants
	const LUSTER_SEWERS_GRIMER_1_1
	const LUSTER_SEWERS_GRIMER_1_2
	const LUSTER_SEWERS_GRIMER_2_1
	const LUSTER_SEWERS_GRIMER_2_2
	const LUSTER_SEWERS_GRIMER_3_1
	const LUSTER_SEWERS_GRIMER_3_2
	const LUSTER_SEWERS_GRIMER_4_1
	const LUSTER_SEWERS_GRIMER_4_2
	const LUSTER_SEWERS_MUK
	const LUSTER_SEWERS_MUK_CUTSCENE_1
	const LUSTER_SEWERS_MUK_CUTSCENE_2
	const LUSTER_SEWERS_MUK_CUTSCENE_3
	const LUSTER_SEWERS_MUK_CUTSCENE_4
	const LUSTER_SEWERS_MUK_CUTSCENE_5
	const LUSTER_SEWERS_MUK_CUTSCENE_6
	const LUSTER_SEWERS_MUK_CUTSCENE_7
	
LusterSewersMukRoomTrigger0:
	checkevent EVENT_LUSTER_SEWERS_GRIMER_1
	iffalse .end
	checkevent EVENT_LUSTER_SEWERS_GRIMER_2
	iffalse .end
	checkevent EVENT_LUSTER_SEWERS_GRIMER_3
	iffalse .end
	checkevent EVENT_LUSTER_SEWERS_GRIMER_4
	iffalse .end
	callasm AsmCheckPlayerYCoord
	ifequal 6, .top
	callasm AsmCheckPlayerXCoord
	ifequal 6, .bottomone
	ifequal 8, .bottomtwo
	ifequal 9, .bottomthree
	applyonemovement PLAYER, step_down
.return
	spriteface PLAYER, UP
	playmusic MUSIC_NONE
	pause 30
	playsound SFX_EMBER
	earthquake 60
	pause 20
	opentext
	writetext LusterSewersMukRoomMukText1
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
	appear LUSTER_SEWERS_MUK_CUTSCENE_1
	jump .cont

.blue
	appear LUSTER_SEWERS_MUK_CUTSCENE_2
	jump .cont

.green
	appear LUSTER_SEWERS_MUK_CUTSCENE_3
	jump .cont
	
.brown
	appear LUSTER_SEWERS_MUK_CUTSCENE_4
	jump .cont
	
.purple
	appear LUSTER_SEWERS_MUK_CUTSCENE_5
	jump .cont
	
.teal
	appear LUSTER_SEWERS_MUK_CUTSCENE_6
	jump .cont
	
.pink
	appear LUSTER_SEWERS_MUK_CUTSCENE_7

.cont
	
	changeblock $06, $04, $9b
	changeblock $08, $04, $9b
	callasm RefreshScreen_BridgeUpdate
	applyonemovement PLAYER, hide_person
	
	callasm AsmCheckPlayerXCoord
	ifequal 8, .right
	applymovement PLAYER, Movement_LusterSewersMukRoomGrimer1
.return2
	pause 10
	appear LUSTER_SEWERS_MUK
	playsound SFX_EMBER
	earthquake 60
	pause 20
	applymovement LUSTER_SEWERS_MUK, Movement_LusterSewersMukRoomMuk1
	playsound SFX_EMBER
	earthquake 60
	pause 20
	applymovement LUSTER_SEWERS_MUK, Movement_LusterSewersMukRoomMuk3
	changeblock $06, $04, $09
	changeblock $08, $04, $09
	callasm RefreshScreen_BridgeUpdate
	pause 20
	checkevent EVENT_LUSTER_SEWERS_MUK_RIGHT
	iftrue .right2
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer5
.return3
	spriteface PLAYER, UP
	applyonemovement PLAYER, show_person
	pause 40
	playsound SFX_SLUDGE_BOMB
	applymovement LUSTER_SEWERS_MUK, Movement_LusterSewersMukRoomMuk2
	applymovement LUSTER_SEWERS_MUK, Movement_LusterSewersMukRoomMuk3
	pause 20
	playsound SFX_SLUDGE_BOMB
	applymovement LUSTER_SEWERS_MUK, Movement_LusterSewersMukRoomMuk2
	applymovement LUSTER_SEWERS_MUK, Movement_LusterSewersMukRoomMuk3
	pause 20
	disappear LUSTER_SEWERS_MUK_CUTSCENE_1
	disappear LUSTER_SEWERS_MUK_CUTSCENE_2
	disappear LUSTER_SEWERS_MUK_CUTSCENE_3
	disappear LUSTER_SEWERS_MUK_CUTSCENE_4
	disappear LUSTER_SEWERS_MUK_CUTSCENE_5
	disappear LUSTER_SEWERS_MUK_CUTSCENE_6
	disappear LUSTER_SEWERS_MUK_CUTSCENE_7
	opentext
	writetext LusterSewersMukRoomMukText2
	cry MUK_A
	waitbutton
	closetext
	waitsfx
	loadwildmon MUK_A, 20
	startbattle
	disappear LUSTER_SEWERS_MUK
	reloadmapafterbattle
	setevent EVENT_LUSTER_SEWERS_MUK_ROOM_MUK
	checkcode VAR_MONJUSTCAUGHT
	if_equal MUK_A, .CaughtMuk
	opentext
	writetext LusterSewersMukRoomMukText2
	waitbutton
	closetext
.CaughtMuk
	dotrigger $1
.end
	end
.top
	callasm AsmCheckPlayerXCoord
	ifequal 5, .topone
	ifequal 6, .toptwo
	ifequal 8, .topthree
	ifequal 9, .topfour
	ifequal 10, .topfive
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer6
	jump .return
.topone
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer1
	jump .return
.toptwo
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer7
	jump .return
.topthree
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer6
	jump .moveperson
.topfour
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer8
	jump .moveperson
.topfive
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer4
	jump .moveperson
.bottomone
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer2
	jump .return
.bottomtwo
	applyonemovement PLAYER, step_down
	jump .moveperson
.bottomthree
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayer3
.moveperson
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_1, 8, 7
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_2, 8, 7
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_3, 8, 7
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_4, 8, 7
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_5, 8, 7
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_6, 8, 7
	moveperson LUSTER_SEWERS_MUK_CUTSCENE_7, 8, 7
	jump .return
.right
	setevent EVENT_LUSTER_SEWERS_MUK_RIGHT
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayerRight
	jump .return2
.right2
	applymovement PLAYER, Movement_LusterSewersMukRoomPlayerRight2
	jump .return3
	
LusterSewersMukRoomTrigger1:
	end
	
LusterSewersMukRoomTrigger2:
	end
	
AsmCheckPlayerYCoord:
	ld a, [wYCoord]
	ld [wScriptVar], a
	ret
	
AsmCheckPlayerXCoord:
	ld a, [wXCoord]
	ld [wScriptVar], a
	ret
	
LusterSewersMukRoomGrimer1:
	appear LUSTER_SEWERS_GRIMER_1_2
	opentext
	writetext LusterSewersMukRoomGrimerText
	cry GRIMER_A
	waitbutton
	closetext
	disappear LUSTER_SEWERS_GRIMER_1_1
	applymovement LUSTER_SEWERS_GRIMER_1_2, Movement_LusterSewersMukRoomGrimer1
	spriteface LUSTER_SEWERS_GRIMER_1_2, DOWN
	pause 10
	changeblock $06, $04, $99
	callasm RefreshScreen_BridgeUpdate
	applymovement LUSTER_SEWERS_GRIMER_1_2, Movement_LusterSewersMukRoomGrimer2
	disappear LUSTER_SEWERS_GRIMER_1_2
	changeblock $06, $04, $09
	callasm RefreshScreen_BridgeUpdate
	setevent EVENT_LUSTER_SEWERS_GRIMER_1
	end
	
LusterSewersMukRoomGrimer2:
	appear LUSTER_SEWERS_GRIMER_2_2
	opentext
	writetext LusterSewersMukRoomGrimerText
	cry GRIMER_A
	waitbutton
	closetext
	disappear LUSTER_SEWERS_GRIMER_2_1
	applymovement LUSTER_SEWERS_GRIMER_2_2, Movement_LusterSewersMukRoomGrimer1
	spriteface LUSTER_SEWERS_GRIMER_2_2, DOWN
	pause 10
	changeblock $06, $04, $9a
	callasm RefreshScreen_BridgeUpdate
	applymovement LUSTER_SEWERS_GRIMER_2_2, Movement_LusterSewersMukRoomGrimer2
	disappear LUSTER_SEWERS_GRIMER_2_2
	changeblock $06, $04, $09
	callasm RefreshScreen_BridgeUpdate
	setevent EVENT_LUSTER_SEWERS_GRIMER_2
	end
	
LusterSewersMukRoomGrimer3:
	appear LUSTER_SEWERS_GRIMER_3_2
	opentext
	writetext LusterSewersMukRoomGrimerText
	cry GRIMER_A
	waitbutton
	closetext
	disappear LUSTER_SEWERS_GRIMER_3_1
	applymovement LUSTER_SEWERS_GRIMER_3_2, Movement_LusterSewersMukRoomGrimer1
	spriteface LUSTER_SEWERS_GRIMER_3_2, DOWN
	pause 10
	changeblock $08, $04, $99
	callasm RefreshScreen_BridgeUpdate
	applymovement LUSTER_SEWERS_GRIMER_3_2, Movement_LusterSewersMukRoomGrimer2
	disappear LUSTER_SEWERS_GRIMER_3_2
	changeblock $08, $04, $09
	callasm RefreshScreen_BridgeUpdate
	setevent EVENT_LUSTER_SEWERS_GRIMER_3
	end
	
LusterSewersMukRoomGrimer4:
	appear LUSTER_SEWERS_GRIMER_4_2
	opentext
	writetext LusterSewersMukRoomGrimerText
	cry GRIMER_A
	waitbutton
	closetext
	disappear LUSTER_SEWERS_GRIMER_4_1
	applymovement LUSTER_SEWERS_GRIMER_4_2, Movement_LusterSewersMukRoomGrimer1
	spriteface LUSTER_SEWERS_GRIMER_4_2, DOWN
	pause 10
	changeblock $08, $04, $9a
	callasm RefreshScreen_BridgeUpdate
	applymovement LUSTER_SEWERS_GRIMER_4_2, Movement_LusterSewersMukRoomGrimer2
	disappear LUSTER_SEWERS_GRIMER_4_2
	changeblock $08, $04, $09
	callasm RefreshScreen_BridgeUpdate
	setevent EVENT_LUSTER_SEWERS_GRIMER_4
	end

LusterSewersMukRoomMukText1:
	text "He's coming…"
	done
	
LusterSewersMukRoomMukText2:
	text "MUK: GRAAAAAAAH!"
	done
	
LusterSewersMukRoomGrimerText:
	text "GRIMER: RAI AI!"
	line "MER!"
	done
	
Movement_LusterSewersMukRoomPlayer1:
;	step_down
	step_down
	step_right
	step_right
	step_end
	
Movement_LusterSewersMukRoomPlayer2:
;	step_down
	step_right
	step_end
	
Movement_LusterSewersMukRoomPlayer3:
;	step_down
	step_left
	step_end
	
Movement_LusterSewersMukRoomPlayer4:
;	step_down
	step_down
	step_left
	step_left
	step_end
	
Movement_LusterSewersMukRoomPlayer5:
	slow_step_down
	slow_step_down
	step_end
	
Movement_LusterSewersMukRoomPlayer6:
;	step_down
	step_down
	step_end
	
Movement_LusterSewersMukRoomPlayer7:
;	step_down
	step_down
	step_right
	step_end
	
Movement_LusterSewersMukRoomPlayer8:
;	step_down
	step_down
	step_left
	step_end
	
Movement_LusterSewersMukRoomGrimer1:
	slow_step_up
	slow_step_up
	step_end
	
Movement_LusterSewersMukRoomGrimer2:
	slow_step_down
	step_end
	
Movement_LusterSewersMukRoomMuk1:
	step_muk_up
	step_end
	
Movement_LusterSewersMukRoomMuk2:
	step_muk_down
	step_end
	
Movement_LusterSewersMukRoomMuk3:
	step_muk_sleep 20
	step_end
	
Movement_LusterSewersMukRoomPlayerRight:
	slow_step_up
	slow_step_up
	slow_step_left
	step_end
	
Movement_LusterSewersMukRoomPlayerRight2:
	slow_step_down
	slow_step_down
	slow_step_right
	step_end
	