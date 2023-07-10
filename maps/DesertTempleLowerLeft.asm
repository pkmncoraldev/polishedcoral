DesertTempleLowerLeft_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertTempleLowerLeftTrigger0
	scene_script DesertTempleLowerLeftTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  9,  8, DESERT_TEMPLE_1, 3
	warp_event  9,  9, DESERT_TEMPLE_1, 4

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  5, SIGNPOST_READ, DesertTempleLowerLeftSwitch

	db 1 ; object events
	person_event SPRITE_CORY,  5,  4, SPRITEMOVEDATA_SCREENSHAKE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

	const_def 1 ; object constants
	const DESERT_TEMPLE_LOWER_LEFT_SHAKE_OBJECT

DesertTempleLowerLeftTrigger0:
	end
	
DesertTempleLowerLeftTrigger1:
	callasm DesertTempleLowerLeftKeepShakingGoingAsm
	iffalse .end
	appear DESERT_TEMPLE_LOWER_LEFT_SHAKE_OBJECT
.end
	callasm DesertTempleShakeSfxAsm
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
	ld de, SFX_EMBER ;REPLACE WITH CUSTOM SOUND
	farcall PlaySFX
	ret

DesertTempleLowerLeftSwitch:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_3
	iftrue DesertTemple1SwitchPressedAlready
	disappear DESERT_TEMPLE_LOWER_LEFT_SHAKE_OBJECT
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
	opentext
	writetext DesertTemple1SwitchText2
	waitbutton
	closetext
	callasm DesertTempleLowerLeftSetTimerAsm
	appear DESERT_TEMPLE_LOWER_LEFT_SHAKE_OBJECT
	dotrigger $1
	end
	
DesertTempleLowerLeftSetTimerAsm:
	ld hl, wStatusFlags2
	set 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	farjp StartTempleTimer