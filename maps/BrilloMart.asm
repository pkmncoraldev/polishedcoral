BrilloMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  3,  7, BRILLO_TOWN, 6
	warp_event  2,  7, BRILLO_TOWN, 6
	warp_event  8,  0, BRILLO_MART, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost  0,  8, SIGNPOST_IFNOTSET, BrilloMartDoor
	signpost  1,  6, SIGNPOST_UP, BrilloMartShelf

	db 2 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_BRILLO
	person_event SPRITE_PEEP_HOLE,  0,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

	const_def 1 ; object constants
	const BRILLO_MART_CLERK
	const BRILLO_MART_DOOR
	
BrilloMartShelf:
	farjumptext MerchandiseShelfText
	
BrilloMartDoor:
	dw EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
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
	waitbutton
	
	callasm BrilloMartDoorAsm
	callasm BrilloMartCheckPassword
	iffalse .wrong
	ifequal 2, .nothing

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
	pause 40
	playsound SFX_WALL_OPEN
	waitsfx
	changeblock $8, $0, $39
	callasm GetMovementPermissions
	opentext
	writetext BrilloMartDoorText3
	waitbutton
	closetext
	callasm BrilloMartInitializeBackupName
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
	
.nothing
	writetext BrilloMartDoorText4
	jump .wrong_end
.wrong
	writetext BrilloMartDoorText2
.wrong_end
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
	callasm BrilloMartInitializeBackupName
	end
	
	
BrilloMartDoorAsm:
	ld b, $5 ; password
	ld de, wBackupName
	farcall _NamingScreen
	ld hl, wBackupName
	ld de, DefaultPassword
	jp InitName
	
BrilloMartCheckPassword:
	ld hl, DefaultPassword
	ld de, wBackupName
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .default
	
	ld hl, CorrectPassword
	ld de, wBackupName
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .correct
	ld a, 0
	ld [wScriptVar], a
	ret
	
.correct
	ld a, 1
	ld [wScriptVar], a
	ret
	
.default
	ld a, 2
	ld [wScriptVar], a
	ret
	
BrilloMartInitializeBackupName:
	ld hl, .Backup
	ld de, wBackupName
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret
	
.Backup: db "???@"
	
DefaultPassword:
	db "¯@@@@@@@@@@"
	
CorrectPassword:
	db "PENIS@@@@@@"
	
BrilloMartDoorText1:
	text "What's da password?"
	done
	
BrilloMartDoorText2:
	text "<PLAYER> said"
	line "“<BACKUP>”."
	done
	
BrilloMartDoorText3:
	text "The door unlocked!"
	done
	
BrilloMartDoorText4:
	text "<PLAYER> didn't"
	line "say anything…"
	done
	