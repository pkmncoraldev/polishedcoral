BrilloMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  3,  7, BRILLO_TOWN, 6
	warp_event  2,  7, BRILLO_TOWN, 6
	warp_event  8,  0, BRILLO_MART, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost  0,  8, SIGNPOST_READ, BrilloMartDoor

	db 2 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_BRILLO
	person_event SPRITE_PEEP_HOLE,  0,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

	const_def 1 ; object constants
	const BRILLO_MART_CLERK
	const BRILLO_MART_DOOR
	
	
BrilloMartDoor:
	playsound SFX_PECK
	appear BRILLO_MART_DOOR
	pause 1
	spriteface BRILLO_MART_DOOR, DOWN
	pause 1
	spriteface BRILLO_MART_DOOR, UP
	pause 1
	spriteface BRILLO_MART_DOOR, LEFT
	pause 5
	opentext
	writetext BrilloMartDoorText1
	buttonsound
	writetext BrilloMartDoorText2
	waitbutton
	closetext
	waitsfx
	playsound SFX_PECK
	pause 1
	spriteface BRILLO_MART_DOOR, UP
	pause 1
	spriteface BRILLO_MART_DOOR, DOWN
	pause 1
	disappear BRILLO_MART_DOOR
	pause 20
	playsound SFX_WALL_OPEN
	waitsfx
	changeblock $8, $0, $39
	callasm GetMovementPermissions
	opentext
	writetext BrilloMartDoorText3
	waitbutton
	closetext
	end
	
BrilloMartDoorText1:
	text "What's da password?"
	done
	
BrilloMartDoorText2:
	text "<PLAYER> said"
	line "the password."
	done
	
BrilloMartDoorText3:
	text "The door unlocked!"
	done
	