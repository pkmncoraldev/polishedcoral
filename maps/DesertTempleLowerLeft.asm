DesertTempleLowerLeft_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertTempleLowerLeftTrigger0
	scene_script DesertTempleLowerLeftTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 27, 10, DESERT_TEMPLE_1, 3
	warp_event 27, 11, DESERT_TEMPLE_1, 4

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  1, SIGNPOST_READ, DesertTempleLowerLeftSwitch

	db 11 ; object events
	person_event SPRITE_CORY_NPC,  -4,  -6, SPRITEMOVEDATA_SCREENSHAKE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -4, -6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DesertTempleRockSmash, -1
	
	const_def 1 ; object constants
	const DESERT_TEMPLE_SHAKE_OBJECT

DesertTempleLowerLeftTrigger0:
	end
	
DesertTempleLowerLeftTrigger1:
	callasm DesertTempleShakeSfxAsm
	end
	
DesertTempleRockSmash:
	clearevent EVENT_TEMPLE_RUMBLING
	farscall AskRockSmashScript2
	setevent EVENT_TEMPLE_RUMBLING
	end
	
DesertTempleLowerLeftKeepShakingGoingAsm:
	ld a, FALSE
	ld [wScriptVar], a
	ld a, [wObject1StepDuration]
	cp 0
	ret nz
	ld a, TRUE
	ld [wScriptVar], a
	ret
	
DesertTempleShakeSfxAsm:
	farcall CheckSFX
	ret c
	ld de, SFX_TEMPLE_RUMBLE
	farcall PlaySFX
	ret

DesertTempleLowerLeftSwitch:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_3
	iftrue DesertTempleLowerLeftSwitchPressedAlready
	disappear 2
	disappear 3
	disappear 4
	disappear 5
	disappear 6
	disappear 7
	disappear 8
	disappear 9
	disappear 10
	disappear 11
	moveperson 2, 10, 16
	moveperson 3, 11, 17
	moveperson 4, 12, 19
	moveperson 5, 13, 18
	moveperson 6, 15, 11
	moveperson 7, 14, 10
	moveperson 8, 7, 7
	moveperson 9, 6, 8
	moveperson 10, 22, 13
	moveperson 11, 22, 12
	changeblock $0, $c, $0a
	changeblock $8, $e, $0a
	changeblock $8, $10, $0a
	changeblock $c, $10, $0a
	changeblock $e, $10, $0a
	changeblock $e, $e, $0a
	changeblock $e, $c, $0a
	changeblock $c, $8, $0a
	changeblock $10, $c, $0a
	changeblock $10, $8, $0a
	changeblock $e, $4, $0a
	changeblock $12, $6, $0a
	changeblock $12, $8, $0a
	changeblock $12, $a, $0a
	changeblock $12, $c, $0a
	changeblock $16, $8, $0a
	changeblock $16, $a, $0a
	changeblock $6, $a, $12
	opentext
	writetext DesertTemple1SwitchText
	yesorno
	iffalse DesertTemple1SwitchNo
	writetext DesertTempleWhoWouldntText
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 10
	setevent EVENT_DESERT_TEMPLE_SWITCH_3
	pause 20
	scall CheckAllTempleSwitches
	opentext
	writetext DesertTemple1SwitchText2
	waitbutton
	closetext
	pause 25
	opentext
	writetext DesertTemple1SwitchText4
	playsound SFX_TEMPLE_RUMBLE
	earthquake 60
	closetext	
	callasm DesertTempleLowerLeftSetTimerAsm
	dotrigger $1
	setevent EVENT_TEMPLE_RUMBLING
	appear DESERT_TEMPLE_SHAKE_OBJECT
	appear 2
	appear 3
	appear 4
	appear 5
	appear 6
	appear 7
	appear 8
	appear 9
	appear 10
	appear 11
	end
	
CheckAllTempleSwitches:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_3
	iffalse .end
	checkevent EVENT_DESERT_TEMPLE_SWITCH_4
	iffalse .end
	checkevent EVENT_DESERT_TEMPLE_SWITCH_5
	iffalse .end
	checkevent EVENT_DESERT_TEMPLE_SWITCH_6
	iffalse .end
	domaptrigger DESERT_TEMPLE_1, $2
.end
	end
	
DesertTempleLowerLeftSwitchPressedAlready:
	jumptext DesertTempleLowerLeftSwitchPressedAlreadyText
	
DesertTempleLowerLeftSwitchPressedAlreadyText:
	text "There's no time!"
	done
	
DesertTempleLowerLeftSetTimerAsm:
	ld hl, wStatusFlags2
	set 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	ld a, 60 ;time
	farjp StartTempleTimer