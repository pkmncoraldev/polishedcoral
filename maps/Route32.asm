Route32_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route32Callback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	strengthboulder_event 29, 48, -1
	strengthboulder_event 30, 49, -1
	person_event SPRITE_YOUNGSTER, 50, 29, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route32StrengthMan, -1
	smashrock_event 29, 49
	smashrock_event 30, 48
	smashrock_event 17, 42
	smashrock_event 18, 43
	
Route32Callback:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iffalse .skip
	moveperson 3, 29, 51
.skip
	return
	
Route32StrengthMan:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .skip_stuck_check
	callasm Route32CheckBouldersStuck
	iftrue .unstick
.skip_stuck_check
	checktmhm TM_SUPERPOWER
	iftrue .got_superpower
	checktmhm TM_SELFDESTRUCT ;mr pusher reward
	iffalse .normal
	writetext Route32StrengthManText2
	waitbutton
	verbosegivetmhm TM_SUPERPOWER
.got_superpower
	writetext Route32StrengthManText3
	waitbutton
	closetext
	end
.normal
	writetext Route32StrengthManText1
	waitbutton
	closetext
	end
.unstick
	writetext Route32StrengthManText4
	waitbutton
	closetext
	applyonemovement 3, step_down
	writepersonxy 3, 29, 51
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	end
	
Route32StrengthManText1:
	text "I'm a huge boulder"
	line "pushing fan."
	
	para "Have you met"
	line "MR. PUSHER?"
	
	para "He's my idol!"
	
	para "I even shave my"
	line "head to look just"
	cont "like him!"
	
	para "I'm just a newbie,"
	line "but I aspire to"
	cont "be a true pusher"
	cont "like MR. PUSHER!"
	done
	
Route32StrengthManText2:
	text "I'm a huge boulder"
	line "pushing fan."
	
	para "Have you met"
	line "MR. PUSHER?"
	
	para "You have!?"
	
	para "He's my idol!"
	
	para "If he said you're"
	line "a true pusher,"
	
	para "then you're my"
	line "idol too!"
	
	para "Here!"
	done
	
Route32StrengthManText3:
	text "SUPERPOWER does"
	line "huge damage, but"
	cont "drops your stats."
	
	para "I wonder if you"
	line "even need a TM"
	cont "like that."
	
	para "A true pusher"
	line "like you probably"
	cont "already has super-"
	cont "powered #MON!"
	done
	
Route32StrengthManText4:
	text "Oh, you got"
	line "yourself stuck?"
	
	para "Is that what a"
	line "true pusher would"
	cont "do?"
	done
	
Route32CheckBouldersStuck:
	ld a, 2
	call Route32CheckBoulders
	cp $20
	jr nz, .no
	ld a, 1
	call Route32CheckBoulders
	cp $21
	jr z, .yes
	cp $20
	jr nz, .no
.yes
	ld a, 1
	ld [wScriptVar], a
	ret
.no
	xor a
	ld [wScriptVar], a
	ret
	
Route32CheckBoulders:
	ldh [hMapObjectIndexBuffer], a
	call GetMapObject
	ld l, c
	ld h, b
	ld a, [hl]
	push af
	call GetObjectStruct
	pop af
	dec a
	ld bc, OBJECT_STRUCT_LENGTH
	ld hl, wObject1StandingMapX
	rst AddNTimes
	ld a, [hl]
	ret
	