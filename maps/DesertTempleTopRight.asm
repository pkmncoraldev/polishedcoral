DesertTempleTopRight_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DesertTempleLowerLeftTrigger0
	scene_script DesertTempleLowerLeftTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  0, 16, DESERT_TEMPLE_1, 9
	warp_event  0, 17, DESERT_TEMPLE_1, 10

	db 0 ; coord events

	db 1 ; bg events
	signpost  1, 27, SIGNPOST_READ, DesertTempleTopRightSwitch

	db 1 ; object events
	person_event SPRITE_CORY_NPC, -6, -4, SPRITEMOVEDATA_SCREENSHAKE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

DesertTempleTopRightSwitch:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_6
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
	setevent EVENT_DESERT_TEMPLE_SWITCH_6
	pause 20
	scall CheckAllTempleSwitches
	opentext
	writetext DesertTemple1SwitchText2
	waitbutton
	closetext
	setevent EVENT_TEMPLE_RUMBLING
	callasm DesertTempleTopRightSetTimerAsm
	dotrigger $1
	appear DESERT_TEMPLE_SHAKE_OBJECT
	end
	
DesertTempleTopRightSetTimerAsm:
	ld hl, wStatusFlags2
	set 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	ld a, 60 ;time
	farjp StartTempleTimer