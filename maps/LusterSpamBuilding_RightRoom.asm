LusterSpamBuilding_RightRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 8 ; warp events
	warp_event  1,  5, LUSTER_SPAM_BUILDING_2F, 2
	warp_event  2,  5, LUSTER_SPAM_BUILDING_2F, 2
	warp_event 11,  5, LUSTER_SPAM_BUILDING_2F, 3
	warp_event 12,  5, LUSTER_SPAM_BUILDING_2F, 3
	warp_event  1, 15, LUSTER_SPAM_BUILDING_3F, 2
	warp_event  2, 15, LUSTER_SPAM_BUILDING_3F, 2
	warp_event 11, 15, LUSTER_SPAM_BUILDING_4F, 2
	warp_event 12, 15, LUSTER_SPAM_BUILDING_4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_SUPER_NERD,  3,  1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSpamBuilding_RightRoom_NPC1, -1
	person_event SPRITE_SUPER_NERD,  3, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSpamBuilding_RightRoom_NPC2, -1
	person_event SPRITE_SUPER_NERD, 13,  1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSpamBuilding_RightRoom_NPC3, -1
	person_event SPRITE_SUPER_NERD, 13, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSpamBuilding_RightRoom_NPC4, -1
	
	const_def 1 ; object constants
	const LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_1
	const LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_2
	const LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_3
	const LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_4
	
LusterSpamBuilding_RightRoom_NPC1:
	faceplayer
	opentext
	checkevent EVENT_DONE_SPAM_BUILDING_2F_1
	iftrue .done
	writetext LusterSpamBuilding_RightRoom_NPC1Text1
	waitbutton
	closetext
	waitsfx
	winlosstext LusterSpamBuilding_RightRoom_NPC1WinText, -1
	loadtrainer BUSINESSMAN, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
.done
	writetext LusterSpamBuilding_RightRoom_NPC1Text2
	waitbutton
	closetext
	spriteface LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_1, UP
	setevent EVENT_DONE_SPAM_BUILDING_2F_1
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_1
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_2
	setevent EVENT_SPAM_BUILDING_3F_DOOR
	clearevent EVENT_SPAM_BUILDING_4F_DOOR
	setevent EVENT_STEP_DOWN
	end
	
LusterSpamBuilding_RightRoom_NPC1Text1:
	text "Yes, yes."
	
	para "I'm the Customer"
	line "Representative."
	
	para "What do you want?"
	
	para "Take your number"
	line "off the call list?"
	
	para "Why should I help"
	line "you?"
	
	para "Quit bugging me!"
	done
	
LusterSpamBuilding_RightRoom_NPC1Text2:
	text "I couldn't help you"
	line "if I wanted to."
	
	para "You need the"
	line "Head of Marketing."
	
	para "He's on the 35th"
	line "floor."
	
	para "Now leave me"
	line "alone!"
	done
	
LusterSpamBuilding_RightRoom_NPC1WinText:
	text "You pest!"
	done
	
LusterSpamBuilding_RightRoom_NPC2:
	faceplayer
	opentext
	checkevent EVENT_DONE_SPAM_BUILDING_2F_2
	iftrue .done
	writetext LusterSpamBuilding_RightRoom_NPC2Text1
	waitbutton
	closetext
	waitsfx
	winlosstext LusterSpamBuilding_RightRoom_NPC2WinText, -1
	loadtrainer BUSINESSMAN, 2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
.done
	writetext LusterSpamBuilding_RightRoom_NPC2Text2
	waitbutton
	closetext
	spriteface LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_2, UP
	setevent EVENT_DONE_SPAM_BUILDING_2F_2
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_1
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_2
	clearevent EVENT_SPAM_BUILDING_3F_DOOR
	setevent EVENT_SPAM_BUILDING_4F_DOOR
	setevent EVENT_STEP_DOWN
	end
	
LusterSpamBuilding_RightRoom_NPC2Text1:
	text "Yeah, I'm Consumer"
	line "Relations."
	
	para "Yeah, I can help"
	line "you out."
	
	para "Yeah, we have to"
	line "battle first."
	done
	
LusterSpamBuilding_RightRoom_NPC2Text2:
	text "Yeah, I can't help"
	line "you out."
	
	para "You'll need the"
	line "Co-Vice Synergy"
	cont "Manager."
	
	para "Yeah, for sure"
	line "this time."
	
	para "You'll find him on"
	line "the 58th floor."
	
	para "Yeah."
	done
	
LusterSpamBuilding_RightRoom_NPC2WinText:
	text "Yeah, you beat me."
	done
	
LusterSpamBuilding_RightRoom_NPC3:
	faceplayer
	opentext
	checkevent EVENT_DONE_SPAM_BUILDING_3F
	iftrue .done
	writetext LusterSpamBuilding_RightRoom_NPC3Text1
	waitbutton
	closetext
	waitsfx
	winlosstext LusterSpamBuilding_RightRoom_NPC3WinText, -1
	loadtrainer BUSINESSMAN, 3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
.done
	writetext LusterSpamBuilding_RightRoom_NPC3Text2
	waitbutton
	closetext
	spriteface LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_3, UP
	setevent EVENT_DONE_SPAM_BUILDING_3F
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_1
	setevent EVENT_SPAM_BUILDING_2F_DOOR_2
	clearevent EVENT_SPAM_BUILDING_3F_DOOR
	clearevent EVENT_SPAM_BUILDING_4F_DOOR
	setevent EVENT_STEP_DOWN
	end
	
LusterSpamBuilding_RightRoom_NPC3Text1:
	text "What do YOU want?"
	
	para "Head of Marketing?<WAIT_S>"
	line "Who's asking?"
	
	para "You're number's on"
	line "the call list?"
	
	para "Yeah sure, beat me"
	line "and I might help"
	cont "you out."
	
	para "…<WAIT_M>Maybe."
	done
	
LusterSpamBuilding_RightRoom_NPC3Text2:
	text "You have to talk"
	line "to Consumer"
	cont "Relations."
	
	para "That's back on the"
	line "11th floor."
	
	para "Now stop bothering"
	line "me."
	done
	
LusterSpamBuilding_RightRoom_NPC3WinText:
	text "Alright, alright…"
	done
	
LusterSpamBuilding_RightRoom_NPC4:
	faceplayer
	opentext
	checkevent EVENT_DONE_SPAM_BUILDING_4F
	iftrue .done
	writetext LusterSpamBuilding_RightRoom_NPC4Text1
	waitbutton
	closetext
	waitsfx
	winlosstext LusterSpamBuilding_RightRoom_NPC4WinText, -1
	loadtrainer BUSINESSMAN, 4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext LusterSpamBuilding_RightRoom_NPC4Text2
	waitbutton
	closetext
	spriteface LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_4, UP
	pause 10
	opentext
	writetext LusterSpamBuilding_RightRoom_NPC4Text3
	farwritetext StdBlankText
	pause 6
	special Special_DotDotDot
	closetext
	pause 60
	faceplayer
	opentext
.done
	writetext LusterSpamBuilding_RightRoom_NPC4Text4
	waitbutton
	closetext
	spriteface LUSTER_SPAM_BUILDING_RIGHT_ROOM_NPC_4, UP
	setevent EVENT_DONE_SPAM_BUILDING_4F
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_1
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_2
	clearevent EVENT_SPAM_BUILDING_3F_DOOR
	clearevent EVENT_SPAM_BUILDING_4F_DOOR
	clearevent EVENT_CAN_DO_SPAM_BUILDING
	setevent EVENT_STEP_DOWN
	loadvar wSpamCallSteps, $ff
	loadvar wSpamCallSteps+1, $ff
	end
	
LusterSpamBuilding_RightRoom_NPC4Text1:
	text "Ha ha ha!<WAIT_S> So you"
	line "finally came!"
	
	para "This is the end of"
	line "the line for you!"
	
	para "I am the Co-Vice"
	line "Synergy Manager."
	
	para "If you want your"
	line "name taken off of"
	cont "the call list,"
	
	para "you'll have to"
	line "prove yourself to"
	cont "be worthy!"
	
	para "Enough talk!<WAIT_L>"
	line "Have at you!"
	done
	
LusterSpamBuilding_RightRoom_NPC4Text2:
	text "Alright, alright…<WAIT_S>"
	line "You win."
	
	para "I'll take you off"
	line "call list, jeez!"
	
	para "You know, it"
	line "wouldn't hurt you"
	cont "to play along"
	cont "a bit…"
	done
	
LusterSpamBuilding_RightRoom_NPC4Text3:
	text "CLICK <WAIT_S>CLACK <WAIT_S>CLICK<WAIT_L>"
	done
	
LusterSpamBuilding_RightRoom_NPC4Text4:
	text "It's done."
	
	para "You won't get any"
	line "annoying calls"
	cont "anymore."
	
	para "Now, get outta"
	line "here before I call"
	cont "security."
	done
	
LusterSpamBuilding_RightRoom_NPC4WinText:
	text "It's over for me!"
	done
