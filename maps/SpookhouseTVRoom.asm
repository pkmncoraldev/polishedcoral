SpookhouseTVRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SpookhouseTVRoomTrigger0
	scene_script SpookhouseTVRoomTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  8,  2, 7, SPOOKHOUSE_HALLWAY_3
	warp_def  8,  3, 7, SPOOKHOUSE_HALLWAY_3

	db 5 ; coord events
	xy_trigger 1,  7,  2, 0, SpookHouseTVRoom1, 0, 0
	xy_trigger 1,  7,  4, 0, SpookHouseTVRoom2, 0, 0
	xy_trigger 1,  7,  3, 0, SpookHouseTVRoom3, 0, 0
	xy_trigger 1,  7,  1, 0, SpookHouseTVRoom4, 0, 0
	xy_trigger 1,  7,  0, 0, SpookHouseTVRoom5, 0, 0

	db 1 ; bg events
	signpost  3,  2, SIGNPOST_READ, SpookHouseTV

	db 5 ; object events
	person_event SPRITE_TWIN,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC2, EVENT_SPOOKHOUSE_GHOSTBEGONE
	person_event SPRITE_TWIN,  7,  1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	person_event SPRITE_TWIN,  7,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	person_event SPRITE_TWIN,  8,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	person_event SPRITE_TWIN,  6,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE

	const_def 1 ; object constants
	const SPOOKHOUSE_TVROOM_NPC1
	const SPOOKHOUSE_TVROOM_NPC2
	const SPOOKHOUSE_TVROOM_NPC3
	const SPOOKHOUSE_TVROOM_NPC4
	const SPOOKHOUSE_TVROOM_NPC5
	
SpookhouseTVRoomTrigger0:
	setflag ENGINE_PUNKS_IN_STARGLOW
	end
	
SpookhouseTVRoomTrigger1:
	checkevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	iftrue .tvoff
	end
.tvoff
	changeblock $2, $2, $73
	end
	
SpookHouseTVRoom1:
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
	
SpookHouseTVRoom2:
	checkevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	iffalse .end
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	special Special_StopRunning
	spriteface PLAYER, DOWN
	jump SpookHouseTVRoom1
.end
	end
	
SpookHouseTVRoom3:
	checkevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	iffalse .end
	applyonemovement PLAYER, step_left
	special Special_StopRunning
	spriteface PLAYER, DOWN
	jump SpookHouseTVRoom1
.end
	end
	
SpookHouseTVRoom4:
	checkevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	iffalse .end
	applyonemovement PLAYER, step_right
	special Special_StopRunning
	spriteface PLAYER, DOWN
	jump SpookHouseTVRoom1
.end
	end
	
SpookHouseTVRoom5:
	checkevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	iffalse .end
	applyonemovement PLAYER, step_right
	applyonemovement PLAYER, step_right
	special Special_StopRunning
	spriteface PLAYER, DOWN
	jump SpookHouseTVRoom1
.end
	end
	
SpookHouseNPC2:
	opentext
	writetext SpookHouseGhostText1
	waitbutton
	closetext
	wait 16
	opentext
	playsound SFX_UNKNOWN_5F
	faceplayer
	writetext SpookHouseGhostText2
	wait 4
	disappear SPOOKHOUSE_TVROOM_NPC1
	closetext
	changeblock $2, $2, $73
	reloadmappart
	setevent EVENT_SPOOKHOUSE_GHOSTBEGONE
	setevent EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	clearflag ENGINE_PUNKS_IN_STARGLOW
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
	
SpookHouseTVTextOn:
	text "Its just static."
	done
	
SpookHouseTVTextOff:
	text "The TV is off."
	done
