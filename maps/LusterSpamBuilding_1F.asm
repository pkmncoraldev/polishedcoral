LusterSpamBuilding_1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSpamBuilding_1FCallBack

	db 3 ; warp events
	warp_event  2,  7, LUSTER_CITY_BUSINESS, 3
	warp_event  3,  7, LUSTER_CITY_BUSINESS, 4
	warp_event  8,  1, LUSTER_SPAM_BUILDING_ELEVATOR, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_RECEPTIONIST, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSpamBuilding_1F_NPC1, -1
	person_event SPRITE_OFFICER, 2, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterSpamBuilding_1F_NPC2, -1
	
	const_def 1 ; object constants
	const LUSTER_SPAM_BUILDING_NPC1
	const LUSTER_SPAM_BUILDING_NPC2
	
	
LusterSpamBuilding_1FCallBack:
	checkevent EVENT_SPAM_BUILDING_GUARD_MOVED
	iffalse .end
	moveperson LUSTER_SPAM_BUILDING_NPC2, 9, 2
.end
	return
	
LusterSpamBuilding_1F_NPC1:
	checkevent EVENT_CAN_DO_SPAM_BUILDING
	iffalse .no
	checkevent EVENT_DONE_SPAM_BUILDING_4F
	iftrue .done_entire_building
	checkevent EVENT_DONE_SPAM_BUILDING_2F_2
	iftrue .explain_4f
	checkevent EVENT_DONE_SPAM_BUILDING_3F
	iftrue .explain_2f_2
	checkevent EVENT_DONE_SPAM_BUILDING_2F_1
	iftrue .explain_3f
	checkevent EVENT_TALKED_SPAM_BUILDING_LADY
	iftrue .explain_2f_1
.start
	setevent EVENT_TALKED_SPAM_BUILDING_LADY
	setevent EVENT_SPAM_BUILDING_2F_DOOR_1
	clearevent EVENT_SPAM_BUILDING_2F_DOOR_2
	clearevent EVENT_SPAM_BUILDING_3F_DOOR
	clearevent EVENT_SPAM_BUILDING_4F_DOOR
	faceplayer
	opentext
	writetext LusterSpamBuilding_1F_NPC1Text2
	waitbutton
	closetext
	applyonemovement LUSTER_SPAM_BUILDING_NPC2, step_right
	setevent EVENT_SPAM_BUILDING_GUARD_MOVED
	end
.explain_2f_1
	jumptextfaceplayer LusterSpamBuilding_1F_NPC1Text3
.explain_3f
	jumptextfaceplayer LusterSpamBuilding_1F_NPC1Text4
.explain_2f_2
	jumptextfaceplayer LusterSpamBuilding_1F_NPC1Text5
.explain_4f
	jumptextfaceplayer LusterSpamBuilding_1F_NPC1Text6
.done_entire_building
	jumptextfaceplayer LusterSpamBuilding_1F_NPC1Text7
.no
	jumptextfaceplayer LusterSpamBuilding_1F_NPC1Text1
	
LusterSpamBuilding_1F_NPC2:
	faceplayer
	opentext
	writetext LusterSpamBuilding_1F_NPC2Text1
	waitbutton
	closetext
	spriteface LUSTER_SPAM_BUILDING_NPC2, DOWN
	end
	
LusterSpamBuilding_1F_NPC1Text1:
	text "How can I help"
	line "you?"
	
	para "If you don't have"
	line "business here,"
	cont "be on your way."
	done
	
LusterSpamBuilding_1F_NPC1Text2:
	text "How can I help"
	line "you?"
	
	para "If you don't have"
	line "business here,"
	cont "be on your way."
	
	para "…"
	
	para "You say you want"
	line "to be taken off"
	cont "of our call list?"
	
	para "…<WAIT_L>Fine."
	
	para "You need to speak"
	line "to our Customer"
	cont "Representative."
	
	para "Take the elevator"
	line "to the 11th floor."
	
	para "You'll find him"
	line "there."
	
	para "DO NOT go into any"
	line "other rooms, or"
	cont "we'll have issues,"
	cont "got it?"
	done
	
LusterSpamBuilding_1F_NPC1Text3:
	text "You need to speak"
	line "to our Customer"
	cont "Representative."
	
	para "Take the elevator"
	line "to the 11th floor."
	
	para "You'll find them"
	line "there."
	
	para "DO NOT go into any"
	line "other rooms, or"
	cont "we'll have issues,"
	cont "got it?"
	done
	
LusterSpamBuilding_1F_NPC1Text4:
	text "You need to speak"
	line "to Head of"
	cont "Marketing."
	
	para "Take the elevator"
	line "to the 35th floor."
	
	para "You'll find them"
	line "there."
	
	para "DO NOT go into any"
	line "other rooms, or"
	cont "we'll have issues,"
	cont "got it?"
	done
	
LusterSpamBuilding_1F_NPC1Text5:
	text "You need to speak"
	line "to Consumer"
	cont "Relations."
	
	para "Take the elevator"
	line "to the 11th floor."
	
	para "You'll find them"
	line "there."
	
	para "DO NOT go into any"
	line "other rooms, or"
	cont "we'll have issues,"
	cont "got it?"
	done
	
LusterSpamBuilding_1F_NPC1Text6:
	text "You need to speak"
	line "to the Co-Vice"
	cont "Synergy Manager."
	
	para "Take the elevator"
	line "to the 58th floor."
	
	para "You'll find them"
	line "there."
	
	para "DO NOT go into any"
	line "other rooms, or"
	cont "we'll have issues,"
	cont "got it?"
	done
	
LusterSpamBuilding_1F_NPC1Text7:
	text "If you don't have"
	line "business here,"
	cont "be on your way."
	done
	
LusterSpamBuilding_1F_NPC2Text1:
	text "…"
	
	para "He's glaring at"
	line "you…"
	done