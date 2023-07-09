DesertTempleTopLeft_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  5, SIGNPOST_READ, DesertTempleTopLeftSwitch

	db 0 ; object events


DesertTempleTopLeftSwitch:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_5
	iftrue DesertTemple1SwitchPressedAlready
	opentext
	writetext DesertTemple1SwitchText
	yesorno
	iffalse DesertTemple1SwitchNo
	writetext DesertTempleWhoWouldntText
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 10
	setevent EVENT_DESERT_TEMPLE_SWITCH_5
	pause 20
	opentext
	writetext DesertTemple1SwitchText2
	waitbutton
	closetext
	ld hl, wStatusFlags2
	set 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	farjp StartTempleTimer
	end