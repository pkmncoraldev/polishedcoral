RadiantHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, RADIANT_TOWNSHIP, 7
	warp_event  3,  7, RADIANT_TOWNSHIP, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_MATRON,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantHouseNPC1, -1
	person_event SPRITE_REDS_MOM,  3,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantHouseNPC2, -1


RadiantHouseNPC1:
	faceplayer
	opentext
	checkevent EVENT_GOT_BIG_ROOT
	iftrue .got_root
	writecode VAR_SCRIPT_VAR, GIGA_DRAIN
	callasm CheckPartyForCertainMove
	iftrue .yes
.no
	writetext RadiantHouseNPCText1
	waitbutton
	closetext
	end
.yes
	writetext RadiantHouseNPCText2
	waitbutton
	verbosegiveitem BIG_ROOT
	iffalse .no_room
	setevent EVENT_GOT_BIG_ROOT
.got_root
	writetext RadiantHouseNPCText3
	waitbutton
	closetext
	end
.no_room
	writetext RadiantHouseNPCText4
	waitbutton
	closetext
	end
	
RadiantHouseNPC2:
	jumptextfaceplayer RadiantHouseNPC2Text
	
RadiantHouseNPC2Text:
	text "Her over there?"
	
	para "She's quite the"
	line "root fan."
	
	para "She's a bit of a"
	line "tuber-head."
	
	para "Why, she's a real"
	line "rhizome lover…"
	done
	
RadiantHouseNPCText1:
	text "I love roots!"
	
	para "They absorb nutri-"
	line "ents from the soil"
	cont "and give plants"
	cont "energy."
	
	para "#MON can do the"
	line "same with certain"
	cont "moves."
	
	para "If you show me a"
	line "#MON with the"
	cont "move GIGA DRAIN,"
	
	para "I'll share one of"
	line "my totally tubular"
	cont "roots with you."
	
	para "…"
	
	para "Hmm…"
	
	para "None of your #-" 
	line "MON know the move"
	cont "GIGA DRAIN."
	
	para "That won't do at"
	line "all!"
	done
	
RadiantHouseNPCText2:
	text "I love roots!"
	
	para "They absorb nutri-"
	line "ents from the soil"
	cont "and give plants"
	cont "energy."
	
	para "#MON can do the"
	line "same with certain"
	cont "moves."
	
	para "If you show me a"
	line "#MON with the"
	cont "move GIGA DRAIN,"
	
	para "I'll share one of"
	line "my totally tubular"
	cont "roots with you."
	
	para "…"
	
	para "Hmm…"
	
	para "Yes!"
	
	para "Your @"
	text_from_ram wStringBuffer3
	text ""
	line "knows GIGA DRAIN!"
	
	para "Here, take this!"
	done

RadiantHouseNPCText3:
	text "That BIG ROOT lets"
	line "#MON with moves"
	cont "like GIGA DRAIN"
	cont "absorb more HP!"
	
	para "It's a mighty fine"
	line "root for sure!"
	done

RadiantHouseNPCText4:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
	