Route32_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route32Trigger0

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route32Callback

	db 1 ; warp events
	warp_def 21, 37, 1, BONE_CAVERN_B1F

	db 0 ; coord events

	db 3 ; bg events
	bg_event 37, 51, SIGNPOST_ITEM + TAPE_PLAYER, MUSIC_MINIBOSS_BATTLE
	signpost 20, 31, SIGNPOST_ITEM + FULL_RESTORE, EVENT_ROUTE_32_HIDDEN_ITEM
	signpost 40, 24, SIGNPOST_JUMPTEXT, Route32Sign

	db 14 ; object events
	strengthboulder_event 29, 48, -1
	strengthboulder_event 30, 49, -1
	person_event SPRITE_YOUNGSTER, 48, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route32StrengthMan, -1
	smashrock_event 29, 49
	smashrock_event 30, 48
	smashrock_event 37, 44
	smashrock_event 38, 45
	hiddentape_event 37, 51, MUSIC_MINIBOSS_BATTLE, 2, EVENT_MUSIC_MINIBOSS_BATTLE
	fruittree_event 20,  8, FRUITTREE_ROUTE_32, PERSIM_BERRY
	person_event SPRITE_TEACHER, 11,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute32_1, -1
	person_event SPRITE_GRANNY, 43, 27, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, TrainerRoute32_2, -1
	person_event SPRITE_LASS, 32, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute32_3, -1
	person_event SPRITE_PONYTAIL, 16, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route32NPC1, -1
	person_event SPRITE_POKEFAN_F, 30, 25, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32NPC2, -1
	
	
Route32Trigger0:
	special Special_UpdatePalsInstant
	end
	
Route32Callback:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iffalse .skip
	moveperson 3, 29, 51
.skip
	return
	
Route32Sign:
	text "ROUTE 32"
	
	para "SOUTH:"
	line "CROSSROADS"
	
	para "NORTHWEST:"
	line "ROUTE 11 BRIDGE &"
	cont "EVENTIDE VILLAGE"
	done
	
Route32NPC1:
	jumptextfaceplayer Route32NPC1Text
	
Route32NPC1Text:
	text "That poor SNUBBULL"
	line "at that house over"
	cont "there."
	
	para "Forced to sleep"
	line "outside in a tiny"
	cont "doghouse…"
	
	para "I'd be angry too!"
	done
	
Route32NPC2:
	jumptextfaceplayer Route32NPC2Text
	
Route32NPC2Text:
	text "This area is"
	line "pretty rocky."
	
	para "Now that they"
	line "built that bridge"
	cont "up NORTH,"
	
	para "I wonder if this"
	line "area will be paved"
	cont "over, too."
	
	para "I hope they don't"
	line "disrupt the poor"
	cont "#MON in that"
	cont "cave nearby…"
	done
	
TrainerRoute32_1:
	generictrainer TEACHER, WANDA, EVENT_BEAT_ROUTE_32_TRAINER_1, .SeenText, .BeatenText

	text "School is very"
	line "important,"
	
	para "but it's also"
	line "good that you're"
	cont "out exercising."
	done

.SeenText:
	text "Shouldn't you be in"
	line "class right now?"
	done

.BeatenText:
	text "You schooled me!"
	done
	
TrainerRoute32_2:
	generictrainer LADY, MURIEL, EVENT_BEAT_ROUTE_32_TRAINER_2, .SeenText, .BeatenText

	text "I can't stand"
	line "being cooped up"
	cont "inside."
	done

.SeenText:
	text "I'm staying at"
	line "that little inn."
	
	para "I had to get out"
	line "of my room and"
	cont "stretch my legs."
	done

.BeatenText:
	text "Good show!"
	done
	
TrainerRoute32_3:
	generictrainer LASS, DEEDEE, EVENT_BEAT_ROUTE_32_TRAINER_3, .SeenText, .BeatenText

	text "I wonder if that"
	line "little #MON I"
	cont "saw lost its mama…"
	done

.SeenText:
	text "I saw a little"
	line "#MON crying in"
	cont "the grass."
	
	para "How sad…"
	done

.BeatenText:
	text "You beat me!"
	line "How sad…"
	done
	
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
	setevent EVENT_TM48
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
	