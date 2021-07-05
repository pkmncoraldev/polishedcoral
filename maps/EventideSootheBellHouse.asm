EventideSootheBellHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 3, 7, EVENTIDE_VILLAGE, 7
	warp_event 4, 7, EVENTIDE_VILLAGE, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_REDS_MOM,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EventideSootheBellHouseNPC, -1
	object_event 7, 3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, TOGETIC, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, EventideSootheBellHouseTogetic, -1

	
EventideSootheBellHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_SOOTHE_BELL
	iftrue .gotsand
	writetext EventideSootheBellHouseNPCText1
	waitbutton
	verbosegiveitem SOOTHE_BELL
	iffalse .NoRoom
.gotsand
	writetext EventideSootheBellHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_SOOTHE_BELL
	end
.NoRoom
	writetext EventideSootheBellHouseNPCText3
	waitbutton
	closetext
	end
	
EventideSootheBellHouseTogetic:
	opentext
	writetext EventideSootheBellHouseTogeticText
	cry TOGETIC
	waitsfx
	waitbutton
	closetext
	end
	
EventideSootheBellHouseNPCText1:
	text "Ring… ring…"
	
	para "Ah…"
	
	para "Don't you just love"
	line "that sound?"
	
	para "This bell makes"
	line "the most lovely"
	cont "sound!"
	
	para "Why don't you take"
	line "one for yourself?"
	done
	
EventideSootheBellHouseNPCText2:
	text "#MON love the"
	line "sound of that"
	cont "bell."
	
	para "If you give it to"
	line "a #MON, it will"
	cont "become friendlier!"
	done
	
EventideSootheBellHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Oh well!"
	
	para "More for me!"
	done
	
EventideSootheBellHouseTogeticText:
	text "TOGETIC: Geh…"
	line "Tic!"
	done
	