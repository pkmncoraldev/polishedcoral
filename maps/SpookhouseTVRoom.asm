SpookhouseTVRoom_MapScriptHeader:
	db 4 ; scene scripts
	scene_script SpookhouseTVRoomTrigger0
	scene_script SpookhouseTVRoomTrigger1
	scene_script SpookhouseTVRoomTrigger2
	scene_script SpookhouseTVRoomTrigger3

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  8,  2, 1, SPOOKHOUSE_HALLWAY_2
	warp_def  8,  3, 1, SPOOKHOUSE_HALLWAY_2

	db 0 ; coord events

	db 3 ; bg events
	signpost  3,  2, SIGNPOST_READ, SpookHouseTV
	signpost  9,  2, SIGNPOST_IFNOTSET, SpookHouseTVScaryDoorLeft
	signpost  9,  3, SIGNPOST_IFNOTSET, SpookHouseTVScaryDoor

	db 5 ; object events
	person_event SPRITE_TWIN,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC2, EVENT_SPOOKHOUSE_GHOSTBEGONE
	person_event SPRITE_TWIN,  7,  1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	person_event SPRITE_TWIN,  7,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	person_event SPRITE_TWIN,  8,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	person_event SPRITE_TWIN,  6,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC3, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE

	const_def 1 ; object constants
	const SPOOKHOUSE_TVROOM_NPC1
	const SPOOKHOUSE_TVROOM_NPC2
	const SPOOKHOUSE_TVROOM_NPC3
	const SPOOKHOUSE_TVROOM_NPC4
	const SPOOKHOUSE_TVROOM_NPC5
	
SpookhouseTVRoomTrigger0:
	end
	
SpookhouseTVRoomTrigger1:
	checkevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	iftrue .tvoff
	end
.tvoff
	changeblock $2, $2, $73
	changeblock $2, $8, $26
	end
	
SpookhouseTVRoomTrigger2:
	end
	
SpookhouseTVRoomTrigger3:
	callasm SpookHouseTVRoomAsmThing
	appear SPOOKHOUSE_TVROOM_NPC5
	dotrigger $0
	end
	
SpookHouseTVRoomAsmThing:
	ld a, 5
	ld b, a
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	dec a
	ld e, a
	farjp CopyDECoordsToMapObject
	
SpookHouseTVScaryDoorLeft:
	dw EVENT_SPOOKHOUSE_DARK
	setevent EVENT_SCARY_DOOR_LEFT
	jump SpookHouseTVScaryDoorCont
SpookHouseTVScaryDoor:
	dw EVENT_SPOOKHOUSE_DARK
SpookHouseTVScaryDoorCont:
	setevent EVENT_SPOOKHOUSE_DARK
	opentext
	writetext SpookHouseScaryDoorText
	closetext
	changemap SpookhouseTVRoom2_BlockData
	reloadmappart
	playsound SFX_UNKNOWN_5F
	waitsfx
	dotrigger $2
	end
	
SpookHouseNPC3:
	opentext
	writetext SpookHouseGhostText9
	closetext
	disappear SPOOKHOUSE_TVROOM_NPC5
	applyonemovement PLAYER, hide_person
	checkevent EVENT_SCARY_DOOR_LEFT
	iftrue .girlleft
	changemap SpookhouseTVRoom3_BlockData
.return
	callasm GenericFinishBridge
	closetext
	playsound SFX_SCREAM
	waitsfx
	loadwildmon SPIRITOMB, 30
	startbattle
	changemap SpookhouseTVRoom_BlockData
	dontrestartmapmusic
	reloadmap
	applyonemovement PLAYER, show_person
	opentext
	writetext SpookHouseGhostText2
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	closetext
	special FadeOutPalettes
	pause 15
	setevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	setevent EVENT_SPOOKHOUSE_BEATEN
	warp OLD_MANOR_EXTERIOR, 14, 10
	end
.girlleft
	changemap SpookhouseTVRoom4_BlockData
	jump .return
	
SpookHouseTVRoom5:
	checkevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	iffalse .end
	clearevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	clearevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	appear SPOOKHOUSE_TVROOM_NPC4
	opentext
	writetext SpookHouseGhostText3
	waitbutton
	closetext
	disappear SPOOKHOUSE_TVROOM_NPC4
	wait 8
	appear SPOOKHOUSE_TVROOM_NPC2
	reloadmappart
	wait 4
	spriteface PLAYER, LEFT
	opentext
	writetext SpookHouseGhostText4
	waitbutton
	closetext
	disappear SPOOKHOUSE_TVROOM_NPC2
	wait 8
	appear SPOOKHOUSE_TVROOM_NPC3
	reloadmappart
	wait 4
	spriteface PLAYER, RIGHT
	opentext
	writetext SpookHouseGhostText5
	waitbutton
	closetext
	disappear SPOOKHOUSE_TVROOM_NPC3
	wait 16
	appear SPOOKHOUSE_TVROOM_NPC4
	reloadmappart
	wait 4
	spriteface PLAYER, DOWN
	wait 8
	opentext
	writetext SpookHouseGhostText6
	waitbutton
	closetext
	disappear SPOOKHOUSE_TVROOM_NPC4
	wait 8
	opentext
	writetext SpookHouseGhostText7
	wait 32
	closetext
	appear SPOOKHOUSE_TVROOM_NPC5
	spriteface PLAYER, UP
	cry BULBASAUR
	opentext
	writetext SpookHouseGhostText8
	wait 8
	closetext
	loadwildmon BULBASAUR, 1
	startbattle
	disappear SPOOKHOUSE_TVROOM_NPC5
	reloadmapafterbattle
	opentext
	writetext SpookHouseGhostText2
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	closetext
	special FadeOutPalettes
	pause 15
	setevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	warp OLD_MANOR_EXTERIOR, 14, 10
.end
	end
	
SpookHouseNPC2:
	opentext
	writetext SpookHouseGhostText1
	waitbutton
	closetext
	wait 16
;	opentext
;	playsound SFX_UNKNOWN_5F
;	faceplayer
;	writetext SpookHouseGhostText2
;	wait 4
	disappear SPOOKHOUSE_TVROOM_NPC1
	closetext
	changeblock $2, $2, $73
	callasm GenericFinishBridge
	playmusic MUSIC_NONE
	setevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	setevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	dotrigger $1
	end
	
SpookHouseTV:
	checkevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	iftrue .tvoff
	jumptext SpookHouseTVTextOn
	
.tvoff
	jumptext SpookHouseTVTextOff
	
SpookHouseGhostText1:
	text "You shouldn't be"
	line "here…"
	done
	
SpookHouseGhostText2:
	text "GET OUT!"
	done
	
SpookHouseGhostText3:
	text "Teehee…"
	
	para "Actually, you"
	line "should stay"
	cont "and play with"
	cont "me…"
	done
	
SpookHouseGhostText4:
	text "We can play for-"
	line "ever and ever!"
	done
	
SpookHouseGhostText5:
	text "…and I'll never"
	line "be alone again…"
	done
	
SpookHouseGhostText6:
	text "You should have"
	line "left while you"
	cont "could…"
	done
	
SpookHouseGhostText7:
	text "But now…"
	done
	
SpookHouseGhostText8:
	text "YOU'RE MINE!"
	done
	
SpookHouseGhostText9:
	text "This place isn't"
	line "for people like"
	cont "you…"
	
	para "MOMMY and DADDY"
	line "used to be like"
	cont "you…"
	
	para "But now, they're"
	line "like me…"
	
	para "You should have"
	line "left while you"
	cont "could…"
	
	para "But now…"
	
	para "We can play for-"
	line "ever and ever…"
	
	para "and ever and ever…"
	
	para "and ever and"
	done
	
SpookHouseGhostText10:
	text "and ever and ever"
	line "and ever and ever"
	done
	
SpookHouseGhostText11:
	text "and ever and"
	done
	
SpookHouseTVTextOn:
	text "Its just static."
	done
	
SpookHouseTVTextOff:
	text "The TV is off."
	done
	
SpookHouseScaryDoorText:
	text "That's weird…"
	
	para "It won't budge"
	line "at all…"
	
	para "Maybe you should"
	done
