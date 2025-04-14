BrilloMart_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrilloMartTrigger0
	scene_script BrilloMartTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BrilloMartCallback

	db 3 ; warp events
	warp_event  3,  7, BRILLO_TOWN, 6
	warp_event  2,  7, BRILLO_TOWN, 6
	warp_event  8,  0, BRILLO_GAME_CORNER, 1

	db 1 ; coord events
	xy_trigger 1,  1,  8, 0, BrilloMartDoorReset, 0, 0

	db 3 ; bg events
	signpost  0,  8, SIGNPOST_IFNOTSET, BrilloMartDoor
	signpost  1,  8, SIGNPOST_IFNOTSET, BrilloMartShelf
	signpost  1,  6, SIGNPOST_UP, BrilloMartCooler

	db 5 ; object events
	object_event  1,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_BRILLO, EVENT_BRILLO_CLERK_1_GONE
	person_event SPRITE_SAILOR,  3,  1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloMartClerk, EVENT_BRILLO_CLERK_2_GONE
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_BRILLO_2, EVENT_BRILLO_MART_NORMAL_CLERK_GONE
	person_event SPRITE_PEEP_HOLE,  0,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_POKEFAN_F,  6,  6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrilloMartNPC, -1

	const_def 1 ; object constants
	const BRILLO_MART_CLERK_1
	const BRILLO_MART_CLERK_2
	const BRILLO_MART_CLERK_3
	const BRILLO_MART_DOOR
	
	
BrilloMartCallback:
	checkevent EVENT_BRILLO_SHELF
	iffalse .checkdoor
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iffalse .normal
	changeblock $8, $0, $4a
	jump .cont
.normal
	changeblock $8, $0, $38
.cont
	changeblock $8, $2, $36
	changeblock $6, $0, $48
	changeblock $6, $2, $30
.checkdoor
	checkevent EVENT_BRILLO_DOOR
	iffalse .end
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iffalse .normal2
	changeblock $8, $0, $4a
	jump .cont2
.normal2
	changeblock $8, $0, $39
.cont2
	clearevent EVENT_BRILLO_DOOR
	dotrigger $1
.end
	return
	
BrilloMartTrigger0:
	end
	
BrilloMartTrigger1:
	end
	
BrilloMartDoorReset:
	changeblock $8, $0, $38
;	callasm GenericFinishBridge
	dotrigger $0
	end
	
BrilloMartNPC:
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .closed
	jumptextfaceplayer BrilloMartNPCText1
.closed
	jumptextfaceplayer BrilloMartNPCText2
	
BrilloMartNPCText1:
	text "You know, this"
	line "place is pretty"
	cont "busy for a little"
	cont "#MART."
	
	para "I wonder why."
	done
	
BrilloMartNPCText2:
	text "Up until recently,"
	line "this place was"
	cont "pretty busy."
	
	para "Business seems to"
	line "have died down"
	cont "for some reason."
	done
	
BrilloMartClerk:
	opentext
	writetext BrilloMartClerkText1
.menu
	loadmenudata MenuDataHeader_Secret
	verticalmenu
	closewindow
	if_equal $1, .buy
	if_equal $2, .sell
	if_equal $3, .secret
.quit
	writetext BrilloMartClerkText3
	waitbutton
	closetext
	end
	
.buy
	callasm BrilloMartClerkBuyAsm
	writetext BrilloMartClerkText2
	jump .menu
	
.sell
	callasm BrilloMartClerkSellAsm
	writetext BrilloMartClerkText2
	jump .menu
	
.secret
	callasm BrilloMartClerkSecretAsm
	writetext BrilloMartClerkText4
	waitbutton
	closetext
	end
	
BrilloMartShelf:
	dw EVENT_BRILLO_SHELF
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	opentext
	writetext BrilloMartShelfUpText1
	yesorno
	iffalse .no
	writetext BrilloMartShelfYesText
	waitbutton
	closetext
	special FadeOutPalettesBlack
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .closed
	changeblock $8, $0, $38
	jump .cont
.closed
	changeblock $8, $0, $4a
.cont
	changeblock $8, $2, $36
	changeblock $6, $0, $48
	changeblock $6, $2, $30
	callasm GenericFinishBridge
	setevent EVENT_BRILLO_SHELF
	wait 5
	playsound SFX_STRENGTH
	waitsfx
	callasm LoadMapPals
	special FadeInPalettes
	end
.no
	jumptext BrilloMartShelfNoText
.YouAreFacingRight
	jumptext BrilloMartShelfRightText
	end
	
BrilloMartShelfRightText:
	text "The shelf here"
	line "seems kinda loose."
	
	para "Maybe you could"
	line "push it from the"
	cont "other side…"
	done
	
BrilloMartShelfUpText1:
	text "The shelf here"
	line "seems kinda loose."
	
	para "Push it?"
	done
	
BrilloMartShelfYesText:
	text "Who wouldn't?"
	done
	
BrilloMartShelfNoText:
	text "Better not…"
	done
	
BrilloMartCooler:
	farjumptext MerchandiseShelfText
	
BrilloMartDoor:
	dw EVENT_BRILLO_DOOR
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .closed
	playsound SFX_PECK
	appear BRILLO_MART_DOOR
	pause 1
	spriteface BRILLO_MART_DOOR, DOWN
	pause 1
	spriteface BRILLO_MART_DOOR, UP
	pause 1
	spriteface BRILLO_MART_DOOR, LEFT
	pause 5
	checkevent EVENT_SAID_PASSWORD
	iftrue .donepassword
	opentext
	writetext BrilloMartDoorText1
	waitbutton
	special FadeOutPalettes
	callasm BrilloMartDoorAsm
	callasm BrilloMartCheckPassword
	iffalse .wrong
	ifequal 2, .nothing
.return
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
	opentext
	writetext BrilloMartDoorText3
	waitbutton
	closetext
	callasm BrilloMartInitializeBackupName
	setevent EVENT_BRILLO_DOOR
	setevent EVENT_SAID_PASSWORD
	end
.closed
	jumptext BrilloMartDoorText5
	
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
.donepassword
	opentext
	writetext BrilloMartDoorText1
	waitbutton
	callasm BrilloMartInitializeCorrectPassword
	jump .return
	
BrilloMartClerkBuyAsm:
	ld a, MARTTYPE_BUY_ONLY
	ld c, a
	ld a, MART_BRILLO
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farjp OpenMartDialog

BrilloMartClerkSellAsm:
	farjp SellMenu

BrilloMartClerkSecretAsm:
	ld a, MARTTYPE_COIN_MART
	ld c, a
	ld a, MART_COINS
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farjp OpenMartDialog
	
MenuDataHeader_Secret:
	db $40 ; flags
	db 00, 00 ; start coords
	db 10, 09 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15f90

.menudata2 ; 0x15f90
	db $80 ; strings
	db 4 ; items
	db "BUY@"
	db "SELL@"
	db "COINS@"
	db "QUIT@"
	
BrilloMartClerkText1:
	text "Welcome! <WAIT_S>How may I"
	line "help you?"
	done
	
BrilloMartClerkText2:
	text "Can I do anything"
	line "else for you?"
	done
	
BrilloMartClerkText3:
	text "Please come again!"
	done
	
BrilloMartClerkText4:
	text "Keep this to"
	line "youself, kid…"
	done
	
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
	ld hl, BackupPassword
BrilloMartInitialize:
	ld de, wBackupName
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret

BrilloMartInitializeCorrectPassword:
	ld hl, CorrectPassword
	jr BrilloMartInitialize
	
DefaultPassword:
	db "¯@@@@@@@@@@@"
	
CorrectPassword:
	db "STORM DRAIN@"
	
BackupPassword:
	db "???@"
	
BrilloMartDoorText1:
	text "What's da password?"
	done
	
BrilloMartDoorText2:
	text "<PLAYER> said"
	line "<WAIT_S>“<BACKUP>”."
	done
	
BrilloMartDoorText3:
	text "The door unlocked!"
	done
	
BrilloMartDoorText4:
	text "<PLAYER> didn't"
	line "say anything…"
	done
	
BrilloMartDoorText5:
	text "It's boarded up…"
	done
	