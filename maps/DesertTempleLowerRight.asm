DesertTempleLowerRight_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertTempleLowerLeftTrigger0
	scene_script DesertTempleLowerLeftTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  0, 20, DESERT_TEMPLE_1, 5
	warp_event  0, 21, DESERT_TEMPLE_1, 6

	db 0 ; coord events

	db 1 ; bg events
	signpost  1, 11, SIGNPOST_READ, DesertTempleLowerRightSwitch

	db 1 ; object events
	person_event SPRITE_CORY_NPC, -6, -6, SPRITEMOVEDATA_SCREENSHAKE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

DesertTempleLowerRightSwitch:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_4
	iftrue DesertTempleLowerLeftSwitchPressedAlready
	disappear DESERT_TEMPLE_SHAKE_OBJECT
	opentext
	writetext DesertTemple1SwitchText
	yesorno
	iffalse DesertTemple1SwitchNo
	writetext DesertTempleWhoWouldntText
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 10
	setevent EVENT_DESERT_TEMPLE_SWITCH_4
	pause 20
	scall CheckAllTempleSwitches
	opentext
	writetext DesertTemple1SwitchText2
	waitbutton
	closetext
	setevent EVENT_TEMPLE_RUMBLING
	callasm DesertTempleLowerRightSetTimerAsm
	dotrigger $1
	appear DESERT_TEMPLE_SHAKE_OBJECT
	end
	
DesertTempleLowerRightSetTimerAsm:
	ld hl, wStatusFlags2
	set 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	ld a, 15 ;time
	farjp StartTempleTimer