LusterSkyscraperPorygonRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2, 11, LUSTER_SKYSCRAPER_B1F, 2
	warp_event  3, 11, LUSTER_SKYSCRAPER_B1F, 2

	db 0 ; coord events

	db 19 ; bg events
	signpost  3,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  4,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  5,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  6,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  7,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  8,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  9,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost 10,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost 11,  1, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  3,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  4,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  5,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  6,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  7,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  8,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  9,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost 10,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost 11,  4, SIGNPOST_JUMPTEXT, LusterSkyscraperPorygonRoomServerText
	signpost  2,  2, SIGNPOST_READ, LusterSkyscraperPorygonRoomComputer

	db 1 ; object events
	person_event SPRITE_PLANK_BRIDGE,  2,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSkyscraperPorygonRoomComputer, EVENT_DONE_PORYGON_ENCOUNTER
	
	const_def 1 ; object constants
	const PORYGON_ROOM_SCREEN


LusterSkyscraperPorygonRoomComputer:
	checkevent EVENT_DONE_PORYGON_ENCOUNTER
	iffalse .havent_done_event
	jumptext LusterSkyscraperPorygonRoomComputerDoneText
.havent_done_event
	opentext
	writetext LusterSkyscraperPorygonRoomComputerPasswordText
	waitbutton
	
	callasm PorygonRoomDoorAsm
	callasm PorygonRoomCheckPassword
	iffalse .wrong
	ifequal 2, .nothing

	closetext
	callasm SetupPorygonEncounterAsm
	special FadeOutPalettes
	playsound SFX_WARP_TO
	wait 10
	killsfx
	playsound SFX_WARP_TO
	wait 9
	killsfx
	playsound SFX_WARP_TO
	wait 8
	killsfx
	playsound SFX_WARP_TO
	wait 7
	killsfx
	playsound SFX_WARP_TO
	wait 6
	killsfx
	playsound SFX_WARP_TO
	wait 5
	killsfx
	playsound SFX_WARP_TO
	wait 4
	killsfx
	playsound SFX_WARP_TO
	wait 3
	killsfx
	playsound SFX_WARP_TO
	wait 2
	killsfx
	playsound SFX_WARP_TO
	wait 1
	killsfx
	playsound SFX_WARP_TO
	wait 1
	killsfx
	
	
	playsound SFX_WARP_TO
	waitsfx
	warp2 UP, FAKE_ROUTE_1, $14, $1d
	end
	
.nothing
	writetext PorygonRoomNothingText
	jump .wrong_end
.wrong
	writetext PorygonRoomSaidPasswordText
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext PorygonRoomWrongText
.wrong_end
	waitbutton
	closetext
	callasm PorygonRoomInitializeBackupName
	end
	
PorygonRoomDoorAsm:
	ld b, $5 ; password
	ld de, wBackupName
	farcall _NamingScreen
	ld hl, wBackupName
	ld de, DefaultPorygonPassword
	jp InitName
	
PorygonRoomCheckPassword:
	ld hl, DefaultPorygonPassword
	ld de, wBackupName
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .default
	
	ld hl, CorrectPorygonPassword
	ld de, wBackupName
	ld c, 4
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
	
PorygonRoomInitializeBackupName:
	ld hl, BackupPorygonPassword
PorygonRoomInitialize:
	ld de, wBackupName
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret
	
DefaultPorygonPassword:
	db "¯@@@@@@@@@@@"
	
CorrectPorygonPassword:
	db "TEST@"
	
BackupPorygonPassword:
	db "???@"
	
SetupPorygonEncounterAsm:
	ld a, 9
	ld [wTorchSteps], a
	ret
	
LusterSkyscraperPorygonRoomComputerDoneText:
	text "It's turned off…"
	done
	
LusterSkyscraperPorygonRoomServerText:
	text "A huge stack of"
	line "computer servers"
	cont "are whirring."
	done
	
LusterSkyscraperPorygonRoomComputerPasswordText:
	text "It's open to a"
	line "login screen."
	
	para "“PLEASE ENTER"
	line "PASSWORD”"
	done
	
PorygonRoomNothingText:
	text "<PLAYER> didn't"
	line "type anything…"
	done
	
PorygonRoomSaidPasswordText:
	text "<PLAYER> said"
	line "“<BACKUP>”."
	done
	
PorygonRoomWrongText:
	text "ACCESS DENIED!"
	done
	