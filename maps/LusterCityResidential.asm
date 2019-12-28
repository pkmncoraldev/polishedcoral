LusterCityResidential_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, CheckLusterTrashcans

	db 8 ; warp events
	warp_def 20, 2, 1, ROUTE_1 ;FAST_SHIP_1F
	warp_def 21, 2, 6, ROUTE_1 ;VERMILION_CITY
	warp_def 22, 2, 7, ROUTE_1 ;VERMILION_CITY
	warp_def 23, 2, 8, ROUTE_1 ;VERMILION_CITY
	warp_def 9, 13, 1, ROUTE_1 ;ROCK_TUNNEL_1F
	warp_def 67, 22, 1, ROUTE_1 ;ROUTE_6_SAFFRON_GATE
	warp_def 67, 23, 2, ROUTE_1 ;ROUTE_6_SAFFRON_GATE
	warp_def 32, 14, 1, ROUTE_1 ;KOGAS_ROOM

	db 0 ; coord events

	db 8 ; bg events
	signpost 30, 13, SIGNPOST_READ, LusterTrashcan1
	signpost 30, 14, SIGNPOST_READ, LusterTrashcan2
	signpost 47, 14, SIGNPOST_READ, LusterTrashcan3
	signpost 47, 20, SIGNPOST_READ, LusterTrashcan4
	signpost 57, 14, SIGNPOST_READ, LusterTrashcan5
	signpost 57, 20, SIGNPOST_READ, LusterTrashcan6
	signpost 17, 27, SIGNPOST_READ, LusterSign1
	signpost 27, 23, SIGNPOST_READ, LusterSign2

	db 15 ; object events
	person_event SPRITE_OFFICER, 19, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC1, -1
	person_event SPRITE_COOLTRAINER_F, 15, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster1NPC2, -1
	person_event SPRITE_GENTLEMAN, 25, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Luster1NPC3, -1
	person_event SPRITE_YOUNGSTER, 37, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC4, -1
	person_event SPRITE_COOLTRAINER_F, 45, 21, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster1NPC5, -1
	person_event SPRITE_YOUNGSTER, 51, 16, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Luster1NPC6, -1
	person_event SPRITE_LASS, 38, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster1NPC7, -1
	person_event SPRITE_FISHER, 45, 9, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC8, -1
	person_event SPRITE_BUG_CATCHER, 59, 7, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC9, -1
	person_event SPRITE_YOUNGSTER, 64, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster1NPC10, -1
	person_event SPRITE_MEOWTH, 56, 14, SPRITEMOVEDATA_POKEMON, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC11, -1
	person_event SPRITE_PIKACHU, 37, 14, SPRITEMOVEDATA_POKEMON, 2, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC12, -1
	person_event SPRITE_DELINQUENT_M, 32, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterPunk1, -1
	person_event SPRITE_DELINQUENT_F, 33, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterPunk2, -1
	person_event SPRITE_DELINQUENT_M, 32, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterPunk3, -1


	const_def 1 ; object constants
	const LUSTER1NPC1
	const LUSTER1NPC2
	const LUSTER1NPC3
	const LUSTER1NPC4
	const LUSTER1NPC5
	const LUSTER1NPC6
	const LUSTER1NPC7
	const LUSTER1NPC8
	const LUSTER1NPC9
	const LUSTER1NPC10
	const LUSTER1NPC11
	const LUSTER1NPC12
	const LUSTERPUNK1
	const LUSTERPUNK2
	const LUSTERPUNK3
	
CheckLusterTrashcans:
	checkevent EVENT_LUSTER_TRASHCAN_1
	iftrue .OpenSesame1
.cont1
	checkevent EVENT_LUSTER_TRASHCAN_2
	iftrue .OpenSesame2
.cont2
	checkevent EVENT_LUSTER_TRASHCAN_3
	iftrue .OpenSesame3
.cont3
	checkevent EVENT_LUSTER_TRASHCAN_4
	iftrue .OpenSesame4
.cont4
	checkevent EVENT_LUSTER_TRASHCAN_5
	iftrue .OpenSesame5
.cont5
	checkevent EVENT_LUSTER_TRASHCAN_6
	iftrue .OpenSesame6
.cont6
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .OpenSesameSewer
	return

.OpenSesame1:
	changeblock $c, $1e, $52
	jump .cont1

.OpenSesame2:
	changeblock $e, $1e, $53
	jump .cont2
	
.OpenSesame3:
	changeblock $e, $2e, $4d
	jump .cont3
	
.OpenSesame4:
	changeblock $14, $2e, $4c
	jump .cont4
	
.OpenSesame5:
	changeblock $e, $38, $4d
	jump .cont5
	
.OpenSesame6:
	changeblock $14, $38, $4c
	jump .cont6
	
.OpenSesameSewer:
	changeblock $e, $20, $5a
	return
	
LusterSign1:
	jumptext LusterSign1Text
	
LusterSign2:
	jumptext LusterSign2Text
	
Luster1NPC1:
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUP
;	checkitem TRAIN_TICKET
;	iffalse .noticket
	
	faceplayer
	opentext
	writetext Luster1NPC1TextRideTrain1
	yesorno
	iffalse .end
	writetext Luster1NPC1TextRideTrain2
	waitbutton
	closetext
	applymovement LUSTER1NPC1, Movement_LusterTrainGuy
	spriteface LUSTER1NPC1, DOWN
	applymovement PLAYER, Movement_LusterTrainPlayer
	spriteface PLAYER, DOWN
	
.end
.noticket
	writetext Luster1NPC1TextRideTrain3
	waitbutton
	closetext
	end
	
.YouAreFacingUP
	jumptextfaceplayer Luster1NPC1TextGetOffTracks
		
Luster1NPC2:
	jumptextfaceplayer Luster1NPC2Text
	
	
Luster1NPC3:
	faceplayer
	opentext
	writetext Luster1NPC3Text
	waitbutton
	closetext
	spriteface LUSTER1NPC3, DOWN
	end
	
Luster1NPC4:
	jumptextfaceplayer Luster1NPC4Text
		
Luster1NPC5:
	jumptextfaceplayer Luster1NPC5Text
	
Luster1NPC6:
	jumptextfaceplayer Luster1NPC6Text
	
Luster1NPC7:
	jumptextfaceplayer Luster1NPC7Text
	
Luster1NPC8:
	jumptextfaceplayer Luster1NPC8Text
	
Luster1NPC9:
	jumptextfaceplayer Luster1NPC9Text
	
Luster1NPC10:
	jumptextfaceplayer Luster1NPC10Text
		
Luster1NPC11:
	opentext
	writetext Luster1NPC11Text
	cry MEOWTH
	waitbutton
	closetext
	setevent EVENT_LUSTER_SEWER_OPEN
	changeblock $e, $20, $5a
	end
	
Luster1NPC12:
	opentext
	writetext Luster1NPC12Text
	cry PIKACHU
	waitbutton
	closetext
	end
	
LusterTrashcan1:
	changeblock $c, $1e, $52
	opentext
	reloadmappart
	closetext
	setevent EVENT_LUSTER_TRASHCAN_1
	end
	
LusterTrashcan2:
	changeblock $e, $1e, $53
	opentext
	reloadmappart
	closetext
	setevent EVENT_LUSTER_TRASHCAN_2
	end
	
LusterTrashcan3:
	changeblock $e, $2e, $4d
	opentext
	reloadmappart
	closetext
	setevent EVENT_LUSTER_TRASHCAN_3
	end
	
LusterTrashcan4:
	changeblock $14, $2e, $4c
	opentext
	reloadmappart
	closetext
	setevent EVENT_LUSTER_TRASHCAN_4
	end
	
LusterTrashcan5:
	changeblock $e, $38, $4d
	opentext
	reloadmappart
	closetext
	setevent EVENT_LUSTER_TRASHCAN_5
	end
	
LusterTrashcan6:
	changeblock $14, $38, $4c
	opentext
	reloadmappart
	closetext
	setevent EVENT_LUSTER_TRASHCAN_6
	end
	
LusterPunk1:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_PUNK_1
	iftrue .end
	writetext LusterPunk1Text1
	waitbutton
	winlosstext LusterPunk1WinText, 0
	setlasttalked LUSTERPUNK1
	loadtrainer DELINQUENT_M, 1
	startbattle
	reloadmapafterbattle
	opentext
	checkevent EVENT_BEAT_LUSTER_PUNK_2
	iffalse .notlast
	checkevent EVENT_BEAT_LUSTER_PUNK_3
	iffalse .notlast
	writetext LusterPunk1Text4
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	end
.notlast
	writetext LusterPunk1Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	setevent EVENT_BEAT_LUSTER_PUNK_1
	end
.end
	writetext LusterPunk1Text3
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	end
	
LusterPunk2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_PUNK_2
	iftrue .end
	writetext LusterPunk2Text1
	waitbutton
	winlosstext LusterPunk2WinText, 0
	setlasttalked LUSTERPUNK2
	loadtrainer DELINQUENT_F, 1
	startbattle
	reloadmapafterbattle
	opentext
	checkevent EVENT_BEAT_LUSTER_PUNK_1
	iffalse .notlast
	checkevent EVENT_BEAT_LUSTER_PUNK_3
	iffalse .notlast
	writetext LusterPunk2Text4
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	end
.notlast
	writetext LusterPunk2Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	setevent EVENT_BEAT_LUSTER_PUNK_2
	end
.end
	writetext LusterPunk2Text3
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	end
	
LusterPunk3:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUSTER_PUNK_3
	iftrue .end
	writetext LusterPunk3Text1
	waitbutton
	winlosstext LusterPunk3WinText, 0
	setlasttalked LUSTERPUNK3
	loadtrainer DELINQUENT_M, 2
	startbattle
	reloadmapafterbattle
	opentext
	checkevent EVENT_BEAT_LUSTER_PUNK_1
	iffalse .notlast
	checkevent EVENT_BEAT_LUSTER_PUNK_2
	iffalse .notlast
	writetext LusterPunk3Text4
	waitbutton
	closetext
	spriteface LUSTERPUNK3, LEFT
	end
.notlast
	writetext LusterPunk3Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK3, LEFT
	setevent EVENT_BEAT_LUSTER_PUNK_3
	end
.end
	writetext LusterPunk3Text3
	waitbutton
	closetext
	spriteface LUSTERPUNK3, LEFT
	end
	
LusterSign1Text:
	text "LUSTER TRAIN"
	line "STATION"
	done
	
LusterSign2Text:
	text "LUSTER CITY"
	
	para "The bustling"
	line "center of the"
	cont "ONWA REGION."
	done
	
LusterPunk1Text1:
	text "TEXT 1"
	done
	
LusterPunk1Text2:
	text "TEXT 2"
	done
	
LusterPunk1Text3:
	text "TEXT 3"
	done
	
LusterPunk1Text4:
	text "TEXT 4"
	done
	
LusterPunk1WinText:
	text "WIN TEXT"
	done
	
LusterPunk2Text1:
	text "TEXT 1"
	done
	
LusterPunk2Text2:
	text "TEXT 2"
	done
	
LusterPunk2Text3:
	text "TEXT 3"
	done
	
LusterPunk2Text4:
	text "TEXT 4"
	done
	
LusterPunk2WinText:
	text "WIN TEXT"
	done
	
LusterPunk3Text1:
	text "TEXT 1"
	done
	
LusterPunk3Text2:
	text "TEXT 2"
	done
	
LusterPunk3Text3:
	text "TEXT 3"
	done
	
LusterPunk3Text4:
	text "TEXT 4"
	done
	
LusterPunk3WinText:
	text "WIN TEXT"
	done
	
Luster1NPC1Text:
	text "TEXT 1"
	done
	
Luster1NPC2Text:
	text "It looks like I"
	line "can get down from"
	cont "here, but it seems"
	cont "a bit dangerous."
	
	para "I might be better"
	line "off using a #-"
	cont "MON to get down…"
	done
	
Luster1NPC3Text:
	text "TEXT 3"
	done
	
Luster1NPC4Text:
	text "LUSTER CITY has"
	line "two #MON"
	cont "CENTERS."
	
	para "There's this one"
	line "here, and also one"
	cont "in the SHOPPING"
	cont "MALL."
	
	para "Pretty convenient"
	line "if you ask me!"
	done
	
Luster1NPC5Text:
	text "TEXT 5"
	done
	
Luster1NPC6Text:
	text "TEXT 6"
	done
	
Luster1NPC7Text:
	text "TEXT 7"
	done
	
Luster1NPC8Text:
	text "TEXT 8"
	done
	
Luster1NPC9Text:
	text "I'm not supposed to"
	line "play in the"
	cont "street."
	
	para "Don't tell my"
	line "parents."
	done
	
Luster1NPC10Text:
	text "TEXT 10"
	done
	
Luster1NPC11Text:
	text "TEXT 11"
	done
	
Luster1NPC12Text:
	text "TEXT 12"
	done
	
Luster1NPC1TextRideTrain1:
	text "TEXT 1"
	done
	
Luster1NPC1TextRideTrain2:
	text "TEXT 2"
	done
	
Luster1NPC1TextRideTrain3:
	text "TEXT 3"
	done
	
Luster1NPC1TextGetOffTracks:
	text "TEXT"
	done
	
Movement_LusterTrainGuy:
	step_down
	step_right
	step_end
	
Movement_LusterTrainPlayer:
	step_down
	step_down
	step_right
	step_right
	step_end
