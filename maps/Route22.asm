Route22_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route22Trigger0

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, Route22Callback
	callback MAPCALLBACK_OBJECTS, Route22StartEngine

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 19 ; object events
	person_event SPRITE_FISHING_GURU,  6, 104, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route22NPC1, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_BEAUTY,  9, 108, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route22NPC2, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_COOL_DUDE,  7, 110, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route22NPC3, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_SNARE, 11, 77, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route22Snare1, EVENT_ROUTE_22_1_SNARE_GONE
	person_event SPRITE_SNARE,  6, 131, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route22Snare2, EVENT_ROUTE_22_1_SNARE2_GONE
	person_event SPRITE_SNARE,  7, 137, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route22Snare3, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_COOL_DUDE,  7, 130, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route22Medic, EVENT_ROUTE_22_MEDIC_GONE
	person_event SPRITE_FOSSIL_DISPLAYS,  6, 126, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route22NPC4, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_CHILD,  7, 125, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route22NPC5, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE, 10, 75, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE, 10, 76, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE, 10, 78, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE,  5, 137, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE,  6, 137, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE,  8, 137, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_MISC_CONE,  9, 137, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_22_ROADBLOCK_GONE
	person_event SPRITE_BILLBOARD_1,  4, 18, SPRITEMOVEDATA_BILLBOARD_1_L, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route22NPC1, -1
	person_event SPRITE_BILLBOARD_1,  4, 58, SPRITEMOVEDATA_BILLBOARD_2_L, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route22NPC1, -1
	person_event SPRITE_BILLBOARD_2,  4, 90, SPRITEMOVEDATA_BILLBOARD_1_L, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, Route22NPC1, -1


Route22Trigger0:
	special Special_UpdatePalsInstant
	callasm Route22GetXCoordAsm
	if_equal 1, .first_right
	if_equal 2, .second_left
	if_equal 3, .second_right
	if_equal 4, .third_left
	if_equal 5, .third_right
	if_equal 6, .clear
	checkevent EVENT_BILLBOARDS_RIGHT
	iffalse .billboards_done
;.first_left
	moveperson 17, 18, 4
	billboard_move 17, 18, 4, -$30
	clearevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.first_right
	checkevent EVENT_BILLBOARDS_RIGHT
	iftrue .billboards_done
	moveperson 17, 21, 4
	billboard_move 17, 21, 4, $30
	setevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.second_left
	checkevent EVENT_BILLBOARDS_RIGHT
	iffalse .billboards_done
	moveperson 18, 58, 4
	billboard_move 18, 58, 4, -$30
	clearevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.second_right
	checkevent EVENT_BILLBOARDS_RIGHT
	iftrue .billboards_done
	moveperson 18, 61, 4
	billboard_move 18, 61, 4, $30
	setevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.third_left
	checkevent EVENT_BILLBOARDS_RIGHT
	iffalse .billboards_done
	moveperson 19, 90, 4
	billboard_move 19, 90, 4, -$30
	clearevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.third_right
	checkevent EVENT_BILLBOARDS_RIGHT
	iftrue .billboards_done
	moveperson 19, 93, 4
	billboard_move 19, 93, 4, $30
	setevent EVENT_BILLBOARDS_RIGHT
	jump .billboards_done
.clear
	clearevent EVENT_BILLBOARDS_RIGHT
.billboards_done
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<DUSK
	iffalse .end
	changeblock -$2, $4, $f2
	changeblock $c, $4, $f2
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock -$2, $4, $f3
	changeblock $c, $4, $f3
	clearflag ENGINE_STREETLIGHTS
	clearflag ENGINE_STREETLIGHTS2
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end
	
Route22GetXCoordAsm:
	ld a, [wXCoord]
	cp $74
	jr nc, .clear
	cp $5c
	jr nc, .third_right
	cp $4a
	jr nc, .third_left
	cp $3c
	jr nc, .second_right
	cp $2a
	jr nc, .second_left
	cp $14
	jr nc, .first_right
;.first_left
	xor a
	ld [wScriptVar], a
	ret
.first_right
	ld a, 1
	ld [wScriptVar], a
	ret
.second_left
	ld a, 2
	ld [wScriptVar], a
	ret
.second_right
	ld a, 3
	ld [wScriptVar], a
	ret
.third_left
	ld a, 4
	ld [wScriptVar], a
	ret
.third_right
	ld a, 5
	ld [wScriptVar], a
	ret
.clear
	ld a, 6
	ld [wScriptVar], a
	ret

Route22Callback:
	checktime 1<<DUSK
	iftrue .nite
	checktime 1<<NITE
	iffalse .notnite
.nite
	changeblock -$2, $4, $f2
	changeblock $c, $4, $f2
	setflag ENGINE_STREETLIGHTS
.notnite
	checkevent EVENT_ROUTE_22_1_SNARE2_MOVED
	iffalse .roadblock
	moveperson 5, 139, 6
.roadblock
	checkevent EVENT_ROUTE_22_ROADBLOCK_GONE
	iffalse .end
	changeblock 74, 12, 193
	changeblock 76, 12, 185
	changeblock 78, 12, 194
	changeblock 108, 4, 11
	changeblock 110, 4, 11
	changeblock 124, 4, 11
	changeblock 128, 4, 11
	changeblock 130, 4, 11
	changeblock 136, 4, 11
	changeblock 108, 6, 32
	changeblock 110, 6, 32
	changeblock 112, 6, 78
	changeblock 114, 6, 78
	changeblock 124, 6, 32
	changeblock 126, 6, 32
	changeblock 128, 6, 32
	changeblock 130, 6, 32
	changeblock 132, 6, 32
	changeblock 136, 6, 78
	changeblock 108, 8, 28
	changeblock 110, 8, 28
	changeblock 112, 8, 28
	changeblock 114, 8, 28
	changeblock 124, 8, 28
	changeblock 126, 8, 77
	changeblock 134, 8, 28
	changeblock 136, 8, 28
.end
	return
	
Route22StartEngine:
	checkevent EVENT_BIKE_ENGINE_ON
	iftrue .end
	opentext
	writetext Route22StartEngineText
	waitbutton
	closetext
	setevent EVENT_BIKE_ENGINE_ON
	writecode VAR_MOVEMENT, PLAYER_DODRIO
	special MapCallbackSprites_LoadUsedSpritesGFX
.end
	return
	
Route22StartEngineText:
	text "Better kick the"
	line "engine on!"
	done
	
Route22StopEngineText:
	text "Better stop the"
	line "engine for now."
	done
	
Route22Snare1:
	checkevent EVENT_ROUTE_22_TALKED_ABOUT_SNARE
	iftrue .leave
	jumptext Route22Snare1Text1
.leave
	opentext
	writetext Route22Snare1Text1
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext Route22Snare1Text2
	waitbutton
	closetext
	applymovement 4, Movement_Route22_Snare1
	disappear 4
	end
	
Route22Snare1Text1:
	text "Road's closed."
	
	para "We're doing uh…"
	line "<WAIT_S>construction."
	
	para "Yeah."
	done
	
Route22Snare1Text2:
	text "…<WAIT_L>Hold on.<WAIT_S>"
	line "I know you!"
	
	para "You kicked my tail"
	line "when we took over"
	cont "that train!"
	
	para "I got demoted"
	line "because of you…"
	
	para "I'm outta here!"
	done
	
Movement_Route22_Snare1:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end
	
Route22Snare2:
	faceplayer
	opentext
	writetext Route22Snare2Text1
	waitbutton
	closetext
	waitsfx
	winlosstext Route22Snare2WinText, 0
	loadtrainer GRUNTM, HIGHWAY_GRUNTM_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext Route22Snare2Text2
	waitbutton
	closetext
	applymovement 5, Movement_Route22_Snare2
	setevent EVENT_ROUTE_22_1_SNARE2_MOVED
	pause 10
	playsound SFX_EXIT_BUILDING
	moveperson 7, 129, 6
	appear 7
	applymovement 7, Movement_Route22_Medic
	spriteface PLAYER, LEFT
Route22Medic:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_22_TALKED_TO_MEDIC
	iftrue .skip_speech
	setevent EVENT_ROUTE_22_TALKED_TO_MEDIC
	writetext Route22MedicText1
	buttonsound
	farwritetext StdBlankText
	pause 6
.skip_speech
	writetext Route22MedicText2
.cont
	yesorno
	iffalse .no
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
.no
	writetext Route22MedicTextNo
	waitbutton
	closetext
	end
	
Movement_Route22_Snare2:
	turn_step_up
	turn_step_up
	turn_step_up
	run_step_up
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_down
	step_end
	
Movement_Route22_Medic:
	step_down
	step_right
	step_end
	
Route22Snare2Text1:
	text "Alright!<WAIT_M> Enough!"
	
	para "No more running!"
	
	para "I…<WAIT_L><WAIT_S> am a man!"
	
	para "Time to start"
	line "acting like it!"
	
	para "…<WAIT_M>Gulp."
	done
	
Route22Snare2Text2:
	text "Aw man, now I'm"
	line "gonna get it!"
	
	para "Back to running!"
	done
	
Route22Snare2WinText:
	text "Gahh!"
	done
	
Route22Snare3:
	faceplayer
	opentext
	writetext Route22Snare3Text1
	waitbutton
	closetext
	waitsfx
	winlosstext Route22Snare3WinText, 0
	loadtrainer GRUNTM, HIGHWAY_GRUNTM_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext Route22Snare3Text2
	waitbutton
	closetext
	follow 6, 5
	applymovement 6, Movement_Route22_Snare3
	stopfollow
	pause 10
	special FadeOutPalettesBlack
	pause 10
	opentext
	writetext Route22Snare3Text3
	waitbutton
	closetext
	pause 10
	setevent EVENT_ROUTE_22_MEDIC_GONE
	setevent EVENT_ROUTE_22_1_SNARE2_GONE
	setevent EVENT_ROUTE_22_1_SNARE_GONE
	setevent EVENT_ROUTE_22_2_SNARE_GONE
	setevent EVENT_ROUTE_22_ROADBLOCK_GONE
	special FadeOutPalettes
	warp2 DOWN, ROUTE_22, 136, 7
	end
	
Route22Snare3Text1:
	text "Yeah, we're the"
	line "ones blocking"
	cont "traffic."
	
	para "All these fine"
	line "folks need to do"
	cont "to pass is give us"
	cont "their #MON."
	
	para "We ain't moving a"
	line "muscle until that"
	cont "happens."
	
	para "Since you're here,"
	line "you can do your"
	cont "part too!"
	done
	
Route22Snare3Text2:
	text "Big mistake!"
	
	para "We'll just go get"
	line "our boss, then"
	cont "we'll see what's up!"
	done
	
Route22Snare3Text3:
	text "With the roadblock"
	line "gone, the traffic"
	cont "cleared up!"
	done
	
Route22Snare3WinText:
	text "Why you…"
	done
	
Movement_Route22_Snare3:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end
	
Route22MedicText1:
	text "Are these guys"
	line "out here still"
	cont "blocking traffic?"
	
	para "Oh, you're taking"
	line "care of them!"
	
	para "Thank you!"
	done
	
Route22MedicText2:
	text "Do you need some"
	line "medicine?"
	
	para "It's the least I"
	line "can do."
	done
	
Route22MedicTextNo:
	text "Take care of"
	line "those guys so we"
	cont "can get going!"
	done
	
Route22NPC1:
	jumptextfaceplayer Route22NPC1Text
	
Route22NPC1Text:
	text "Looks like we got"
	line "a classic traffic"
	cont "jam on our hands!"
	
	para "I wonder what the"
	line "holdup is."
	done
	
Route22NPC2:
	setevent EVENT_ROUTE_22_TALKED_ABOUT_SNARE
	jumptextfaceplayer Route22NPC2Text
	
Route22NPC2Text:
	text "Did you see the"
	line "guy blocking the"
	cont "detour back the"
	cont "way you came?"
	
	para "He says he's a"
	line "road worker,"
	cont "but I doubt it."
	
	para "Someone should"
	line "make him move!"
	done
	
Route22NPC3:
	jumptext Route22NPC3Text
	
Route22NPC3Text:
	text "I'm calling to say"
	line "I'll be late to"
	cont "work."
	
	para "I'm stuck in a"
	line "traffic jam!"
	
	para "I know I've already"
	line "used that excuse"
	cont "3 times, but this"
	cont "time it's true!"
	
	para "I mean…<WAIT_S> Oops…"
	done
	
Route22NPC4:
	jumptext Route22NPC4Text
	
Route22NPC4Text:
	text "What's with all"
	line "you kids crowdin'"
	cont "around my ride?"
	
	para "Hands off the"
	line "paint."
	
	para "Can't we get this"
	line "traffic movin'?"
	done
	
Route22NPC5:
	jumptextfaceplayer Route22NPC5Text
	
Route22NPC5Text:
	text "Those men holding"
	line "up traffic…"
	
	para "They're TEAM SNARE,"
	line "aren't they?"
	
	para "What are we gonna"
	line "do?"
	done
	