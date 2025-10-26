RiverRapids_MapScriptHeader:
	db 2 ; scene scripts
	scene_script RiverRapidsTrigger0
	scene_script RiverRapidsTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  4, 12, 1, RIVER_RAPIDS

	db 16 ; coord events
	coord_event 12,  9, -1, RiverRapidsRockLeft
	coord_event 12, 19, -1, RiverRapidsRockLeft
	coord_event 13, 19, -1, RiverRapidsRockRight
	coord_event 16, 27, -1, RiverRapidsRockLeft
	coord_event 17, 27, -1, RiverRapidsRockRight
	coord_event  6, 43, -1, RiverRapidsRockLeft
	coord_event  7, 43, -1, RiverRapidsRockRight
	coord_event 10, 55, -1, RiverRapidsRockLeft
	coord_event 11, 55, -1, RiverRapidsRockRight
	coord_event 12, 67, -1, RiverRapidsRockLeft
	coord_event 13, 67, -1, RiverRapidsRockRight
	coord_event 10, 30, -1, RiverRapidsRockUp
	coord_event 10, 31, -1, RiverRapidsRockDown
	coord_event 18, 50, -1, RiverRapidsRockUp
	coord_event 18, 51, -1, RiverRapidsRockDown
	coord_event 12, 81, -1, RiverRapidsEnd

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_INVISIBLE,  4, 12, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORAL_STAR, 80, 12, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


RiverRapidsTrigger0:
	pause 22
	playsound SFX_DEX_FANFARE_170_199
	loadvar wCenteredObject, 1
	applymovement PLAYER, Movement_RiverRapidsGetIntoPlace
	applyonemovement PLAYER, show_person
	applymovement PLAYER, Movement_RiverRapidsStart
	loadvar wCenteredObject, PLAYER
	applyonemovement PLAYER, show_person
	loadvar wButtonPressedFrameCooldownActive, 1
	waitsfx
	pause 15
	opentext
	farwritetext TextCountdown3
	playsound SFX_TALLY
	pause 25
	farwritetext TextCountdown2
	playsound SFX_TALLY
	pause 25
	farwritetext TextCountdown1
	playsound SFX_TALLY
	pause 25
	farwritetext TextCountdownGo
	playsound SFX_THROW_BALL
	pause 25
	closetext
	playmusic MUSIC_DODRIO_RACE
	setevent EVENT_TIMER_ACTIVE
	setevent EVENT_RIVER_RAPIDS
	loadvar wMoogooCard1Value, 0 ;miss value
	loadvar wMoogooCard2Value, 0 ;good value
	loadvar wMoogooCard3Value, 0 ;great value
	loadvar wMoogooCard4Value, 0 ;perfect value
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wRanchRaceMinutes, 0
	loadvar wMinigameCentiseconds, 0
	loadvar hMinigameTimer, 1
	dotrigger $1
	end
	
RiverRapidsTrigger1:
	end
	
RiverRapidsEnd:
	loadvar hMinigameTimer, 0
	callasm RiverRapidsStoreScore
	clearevent EVENT_TIMER_ACTIVE
	playmusic MUSIC_NONE
	playsound SFX_FINISH_RIVER_RAPIDS
	loadvar wCenteredObject, 1
	applymovement PLAYER, Movement_RiverRapidsFinish
	waitsfx
	pause 20
	playmusic MUSIC_DEV_MESSAGE
	loadvar wButtonPressedFrameCooldownActive, 0
	loadvar wButtonPressedFrameCooldown, 0
	loadvar wSpinning, 0
	refreshscreen
	callasm RiverRapidsDisplayScore
	waitbutton
	special FadeOutPalettes
	loadvar wCenteredObject, PLAYER
	warp2 UP, RIVER_RAPIDS_HOUSE, $2, $5
	end
	
RiverRapidsStoreScore:
	ld a, [wMinigameCentiseconds]
	sla a
	ld [wRiverRapidsScoreCentiseconds], a
	ld a, [wRanchRaceSeconds]
	ld [wRiverRapidsScoreSeconds], a
	ld a, [wRanchRaceMinutes]
	ld [wRiverRapidsScoreMinutes], a	
	ret

RiverRapidsDisplayScore:
	call LoadStandardFont
	ld hl, RiverRapidsDisplayScoreMenuDataHeader
	call CopyMenuDataHeader
	call MenuBox
	hlcoord 6, 4
	ld de, .ResultsString
	call PlaceString
	call BGMapAnchorTopLeft
	ld c, 50
	call DelayFrames
	hlcoord 1, 6
	ld de, .TimeString
	call PlaceString
	call RiverRapidsDisplayScoreSfx
	hlcoord 9, 6
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wRiverRapidsScoreMinutes
	call PrintNum
	ld [hl], ":"
	inc hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wRiverRapidsScoreSeconds
	call PrintNum
	ld [hl], ":"
	inc hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wRiverRapidsScoreCentiseconds
	call PrintNum
	call RiverRapidsDisplayScoreSfx
	hlcoord 1, 8
	ld de, .MissString
	call PlaceString
	hlcoord 6, 8
	lb bc, 1, 1
	ld de, wMoogooCard1Value	;miss value
	ld a, [de]
	cp $a
	jr nz, .skip1
	ld de, .OverNineString
	call PlaceString
	jr .cont1
.skip1
	call PrintNum
.cont1
	call RiverRapidsDisplayScoreSfx
	hlcoord 1, 10
	ld de, .GoodString
	call PlaceString
	hlcoord 6, 10
	lb bc, 1, 1
	ld de, wMoogooCard2Value	;good value
	ld a, [de]
	cp $a
	jr nz, .skip2
	ld de, .OverNineString
	call PlaceString
	jr .cont2
.skip2
	call PrintNum
.cont2
	call RiverRapidsDisplayScoreSfx
	hlcoord 9, 8
	ld de, .GreatString
	call PlaceString
	hlcoord 15, 8
	lb bc, 1, 1
	ld de, wMoogooCard3Value	;great value
	ld a, [de]
	cp $a
	jr nz, .skip3
	ld de, .OverNineString
	call PlaceString
	jr .cont3
.skip3
	call PrintNum
.cont3
	call RiverRapidsDisplayScoreSfx
	hlcoord 9, 10
	ld de, .PerfectString
	call PlaceString
	hlcoord 17, 10
	lb bc, 1, 1
	ld de, wMoogooCard4Value	;perfect value
	ld a, [de]
	cp $a
	jr nz, .skip4
	ld de, .OverNineString
	call PlaceString
	jr .cont4
.skip4
	call PrintNum
.cont4
	call RiverRapidsDisplayScoreSfx
	ld c, 40
	call DelayFrames
	call RiverRapidsHiScoreStuff
	jr nc, .new_record
	hlcoord 1, 12
	ld de, .RecordString
	call PlaceString
	hlcoord 9, 12
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wRiverRapidsRecordMinutes
	call PrintNum
	ld [hl], ":"
	inc hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wRiverRapidsRecordSeconds
	call PrintNum
	ld [hl], ":"
	inc hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	ld de, wRiverRapidsRecordCentiseconds
	call PrintNum
	ld a, [wRiverRapidsScoreMinutes]
	cp 1
	jr c, .goal
	call RiverRapidsDisplayScoreSfx
	ld a, 1
	ld [wAlways0Trigger], a
	ret
.goal
	call BGMapAnchorTopLeft
	push de
	ld d, 0
	ld e, SFX_LEVEL_UP
	call PlaySFX
	ld c, 40
	call DelayFrames
	pop de
	ld a, 2
	ld [wAlways0Trigger], a
	ret
.new_record
	hlcoord 4, 12
	ld de, .NewRecordString
	call PlaceString
	call BGMapAnchorTopLeft
	ld d, 0
	ld e, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX
	ld a, 3
	ld [wAlways0Trigger], a
	ret
.ResultsString
	db "RESULTS@"
	
.TimeString
	db "TIME:@"
	
.MissString
	db "MISS×@"
	
.GoodString
	db "GOOD×@"
	
.GreatString
	db "GREAT×@"
	
.PerfectString
	db "PERFECT×@"
	
.NewRecordString
	db "NEW RECORD!@"
	
.RecordString
	db "RECORD:@"
	
.OverNineString
	db "9+@"
	
RiverRapidsHiScoreStuff:
	ld a, [wRiverRapidsScoreMinutes]
	ld e, a
	ld a, [wRiverRapidsRecordMinutes]
	cp e
	ret c
	jr nz, .yes
	ld a, [wRiverRapidsScoreSeconds]
	ld e, a
	ld a, [wRiverRapidsRecordSeconds]
	cp e
	ret c
	jr nz, .yes
	ld a, [wRiverRapidsScoreCentiseconds]
	ld e, a
	ld a, [wRiverRapidsRecordCentiseconds]
	cp e
	ret c
	jr nz, .yes
	scf
	ret
.yes
	ld a, [wRiverRapidsScoreMinutes]
	ld [wRiverRapidsRecordMinutes], a
	ld a, [wRiverRapidsScoreSeconds]
	ld [wRiverRapidsRecordSeconds], a
	ld a, [wRiverRapidsScoreCentiseconds]
	ld [wRiverRapidsRecordCentiseconds], a
	xor a
	ret

	
RiverRapidsDisplayScoreSfx:
	call BGMapAnchorTopLeft
	push de
	ld d, 0
	ld e, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ld c, 40
	call DelayFrames
	pop de
	ret
	
RiverRapidsDisplayScoreMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 13, 19 ; end coords
	dw NULL
	db 1 ; default option

RiverRapidsRockLeft:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_LEFT + 2, .left3
	if_equal D_RIGHT + 2, .right3
	if_equal D_LEFT + 1, .left2
	if_equal D_RIGHT + 1, .right2
	if_equal D_LEFT, .left
	if_equal D_RIGHT, .right
	scall RiverRapidMiss
	applyonemovement PLAYER, turn_away_left
	end
.left
	scall RiverRapidsGood
	applyonemovement PLAYER, turn_away_left
	end
.left2
	scall RiverRapidGreat
	applyonemovement PLAYER, turn_away_left
	end
.left3
	scall RiverRapidsPerfect
	applyonemovement PLAYER, turn_in_left
	end
.right
	scall RiverRapidsGood
	applymovement PLAYER, Movement_RiverRapidsRockRight
	end
.right2
	scall RiverRapidGreat
	applymovement PLAYER, Movement_RiverRapidsRockRight
	end
.right3
	scall RiverRapidsPerfect
	applymovement PLAYER, Movement_RiverRapidsRockRight2
	end
	
RiverRapidsRockRight:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_LEFT + 2, .left3
	if_equal D_RIGHT + 2, .right3
	if_equal D_LEFT + 1, .left2
	if_equal D_RIGHT + 1, .right2
	if_equal D_LEFT, .left
	if_equal D_RIGHT, .right
	scall RiverRapidMiss
	applyonemovement PLAYER, turn_away_right
	end
.left
	scall RiverRapidsGood
	applymovement PLAYER, Movement_RiverRapidsRockLeft
	end
.left2
	scall RiverRapidGreat
	applymovement PLAYER, Movement_RiverRapidsRockLeft
	end
.left3
	scall RiverRapidsPerfect
	applymovement PLAYER, Movement_RiverRapidsRockLeft2
	end
.right
	scall RiverRapidsGood
	applyonemovement PLAYER, turn_away_right
	end
.right2
	scall RiverRapidGreat
	applyonemovement PLAYER, turn_away_right
	end
.right3
	scall RiverRapidsPerfect
	applyonemovement PLAYER, turn_in_right
	end
	
RiverRapidsRockUp:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_UP + 2, .up3
	if_equal D_DOWN + 2, .down3
	if_equal D_UP + 1, .up2
	if_equal D_DOWN + 1, .down2
	if_equal D_UP, .up
	if_equal D_DOWN, .down
	scall RiverRapidMiss
	applyonemovement PLAYER, turn_away_up
	end
.up
	scall RiverRapidsGood
	applyonemovement PLAYER, turn_away_up
	end
.up2
	scall RiverRapidGreat
	applyonemovement PLAYER, turn_away_up
	end
.up3
	scall RiverRapidsPerfect
	applyonemovement PLAYER, turn_in_up
	end
.down
	scall RiverRapidsGood
	applymovement PLAYER, Movement_RiverRapidsRockDown
	end
.down2
	scall RiverRapidGreat
	applymovement PLAYER, Movement_RiverRapidsRockDown
	end
.down3
	scall RiverRapidsPerfect
	applymovement PLAYER, Movement_RiverRapidsRockDown2
	end
	
RiverRapidsRockDown:
	callasm RiverRapidsCheckJoyPressedAsm
	if_equal D_UP + 2, .up3
	if_equal D_DOWN + 2, .down3
	if_equal D_UP + 1, .up2
	if_equal D_DOWN + 1, .down2
	if_equal D_UP, .up
	if_equal D_DOWN, .down
	scall RiverRapidMiss
	applyonemovement PLAYER, turn_away_down
	end
.up
	scall RiverRapidsGood
	applymovement PLAYER, Movement_RiverRapidsRockUp
	end
.up2
	scall RiverRapidGreat
	applymovement PLAYER, Movement_RiverRapidsRockUp
	end
.up3
	scall RiverRapidsPerfect
	applymovement PLAYER, Movement_RiverRapidsRockUp2
	end
.down
	scall RiverRapidsGood
	applyonemovement PLAYER, turn_away_down
	end
.down2
	scall RiverRapidGreat
	applyonemovement PLAYER, turn_away_down
	end
.down3
	scall RiverRapidsPerfect
	applyonemovement PLAYER, turn_in_down
	end
	
RiverRapidMiss:
	playsound SFX_EGG_BOMB
	earthquake 50
	thisasm
	ld a, [wMoogooCard1Value]
	cp $a
	ret z
	inc a
	ld [wMoogooCard1Value], a
	ret
	
RiverRapidsGood:
	playsound SFX_RAZOR_WIND
	earthquake 6
	thisasm
	ld a, [wMoogooCard2Value]
	cp $a
	ret z
	inc a
	ld [wMoogooCard2Value], a
	ret
	
RiverRapidGreat:
	playsound SFX_GRASS_RUSTLE
	thisasm
	ld a, [wMoogooCard3Value]
	cp $a
	ret z
	inc a
	ld [wMoogooCard3Value], a
	ret
	
RiverRapidsPerfect:
	playsound SFX_TWINKLE
	thisasm
	ld a, [wMoogooCard4Value]
	cp $a
	ret z
	inc a
	ld [wMoogooCard4Value], a
	ret
	
Movement_RiverRapidsRockRight:
	turn_away_right
	turn_away_right
	step_end
	
Movement_RiverRapidsRockLeft:
	turn_away_left
	turn_away_left
	step_end
	
Movement_RiverRapidsRockUp:
	turn_away_up
	turn_away_up
	step_end
	
Movement_RiverRapidsRockDown:
	turn_away_down
	turn_away_down
	step_end
	
Movement_RiverRapidsRockRight2:
	turn_in_right
	turn_in_right
	step_end
	
Movement_RiverRapidsRockLeft2:
	turn_in_left
	turn_in_left
	step_end
	
Movement_RiverRapidsRockUp2:
	turn_in_up
	turn_in_up
	step_end
	
Movement_RiverRapidsFinish:
	turn_in_down
Movement_RiverRapidsStart:
	turn_in_down
	turn_in_down
	turn_in_down
Movement_RiverRapidsRockDown2:
	turn_in_down
	turn_in_down
	step_end
	
Movement_RiverRapidsGetIntoPlace:
	big_step_up
	big_step_up
	big_step_up
	step_end
	
RiverRapidsCheckJoyPressedAsm:
	ld a, [wButtonPressedFrameCooldown]
	and $f
	cp 0
	jr z, .miss
	cp 6
	jr c, .slow
.perfect
	ld a, [wButtonPressedFrameCooldown]
	and $f0
	add 2
	jr .end
.slow
	cp 0
	jr z, .end
	ld a, [wButtonPressedFrameCooldown]
	and $f0
	add 1
	jr .end
.miss
	ld hl, hJoyDown
	ld a, [hl]
.end
	ld [wScriptVar], a
	ret
