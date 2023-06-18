LusterSkyscraperPorygonRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterSkyscraperPorygonRoomTrigger0
	scene_script LusterSkyscraperPorygonRoomTrigger1

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
	person_event SPRITE_PORYGON_SCREEN,  2,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LusterSkyscraperPorygonRoomComputer, EVENT_DONE_PORYGON_ENCOUNTER

	
	const_def 1 ; object constants
	const PORYGON_ROOM_SCREEN


LusterSkyscraperPorygonRoomTrigger0:
	end
	
LusterSkyscraperPorygonRoomTrigger1:
	opentext
	writetext LusterSkyscraperPorygonRoomPoryGONE
	waitbutton
	closetext
	dotrigger $0
	end
	
LusterSkyscraperPorygonRoomComputer:
	checkevent EVENT_DONE_PORYGON_ENCOUNTER
	iffalse .havent_done_event
	jumptext LusterSkyscraperPorygonRoomComputerDoneText
.havent_done_event
	opentext
	writetext LusterSkyscraperPorygonRoomComputerPasswordText
	waitbutton
	
	callasm PorygonRoomCheckPassword
	iffalse .wrong
	ifequal 2, .nothing

	writetext PorygonRoomSaidPasswordText
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext PorygonRoomRightText
	waitbutton
	closetext
	wait 14
	callasm SetupPorygonEncounterAsm
	domaptrigger FAKE_ROUTE_1, $0
;	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 10
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 9
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 8
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 7
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 6
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 5
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 4
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 3
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 2
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	wait 1
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	callasm LoadMapPals
	special FadeInPalettes
	
	killsfx
	playsound SFX_WARP_TO
	special FadeOutPalettes
	applyonemovement PLAYER, hide_person
	callasm LoadMapPals
	special FadeInPalettes
	waitsfx
	wait 10
	
	playsound SFX_WARP_TO
	special FadeOutPalettes
	applyonemovement PLAYER, show_person
	
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	
	waitsfx
;	warp2 UP, FAKE_ROUTE_1, $14, $1d
;	scall HandleEventsFly
	reloadmappart
	special UpdateTimePals
	applymovement PLAYER, .TeleportFrom
;	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end
.TeleportFrom: ; cce1
	teleport_from
	step_end

.TeleportTo: ; cce3
	teleport_to
	step_end
	
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
	
PorygonRoomCheckPassword:
	ld b, $5 ; password
	ld de, wBackupName
	farcall _NamingScreen
	ld hl, wBackupName
	ld de, DefaultPorygonPassword
	call InitName

	ld hl, DefaultPorygonPassword
	ld de, wBackupName
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .default
	
	ld hl, SecretWord
	ld de, wBackupName
	ld c, 10
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
	db "PORYGON@"
	
BackupPorygonPassword:
	db "???@"
	
SetupPorygonEncounterAsm:
	ld a, 15
	ld [wTorchSteps], a
	ld a, SPAWN_FAKE_ROUTE_1
	ld [wDefaultSpawnpoint], a
	ret
	
LusterSkyscraperPorygonRoomPoryGONE:
	text "PORYGON's illusion"
	line "faded…"
	done
	
LusterSkyscraperPorygonRoomComputerDoneText:
	text "It's turned off…"
	done
	
LusterSkyscraperPorygonRoomServerText:
	text "A huge stack of"
	line "computer servers"
	cont "click and whir."
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
	text "<PLAYER> typed"
	line "“<BACKUP>”."
	done
	
PorygonRoomRightText:
	text "…"
	
	para "ACCESS GRANTED!"
	done
	
PorygonRoomWrongText:
	text "ACCESS DENIED!"
	done
	