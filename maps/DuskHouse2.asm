DuskHouse2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, DUSK_TURNPIKE, 14
	warp_event  3,  7, DUSK_TURNPIKE, 14

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_DELINQUENT_F,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, DuskHouse2NPC1, -1
	person_event SPRITE_DELINQUENT_F,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, DuskHouse2NPC2, -1
	person_event SPRITE_CANDLE,  3,  3, SPRITEMOVEDATA_CANDLE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

DuskHouse2NPC1:
	faceplayer
	opentext
	checktmhm TM_DESTINY_BOND
	iftrue .got_tm
	writetext DuskHouse2NPC1Text1
	waitbutton
	verbosegivetmhm TM_DESTINY_BOND
	writetext DuskHouse2NPC1Text2
	waitbutton
	closetext
	end
.got_tm
	writetext DuskHouse2NPC1TextLoop
	waitbutton
	closetext
	end
	
DuskHouse2NPC2:
	faceplayer
	opentext
	checkevent EVENT_GOT_DESTINY_KNOT
	iftrue .got_item
	writetext DuskHouse2NPC2Text1
	waitbutton
	verbosegiveitem DESTINY_KNOT
	iffalse .no_room
	setevent EVENT_GOT_DESTINY_KNOT
	writetext DuskHouse2NPC2Text2
	waitbutton
	closetext
	end
.no_room
	writetext DuskHouse2NPC2Text3
	waitbutton
	closetext
	end
.got_item
	writetext DuskHouse2NPC2TextLoop
	waitbutton
	closetext
	end
	
DuskHouse2NPC1Text1:
	text "Do you believe in"
	line "destiny?"
	
	para "Friends, <WAIT_M>enemies…<WAIT_M>"
	line "Lovers, <WAIT_M>strangers…<WAIT_S>"
	
	para "Destiny binds us"
	line "all together."
	
	para "Try as you might,<WAIT_S>"
	line "that bond cannot"
	cont "be broken."
	
	para "Here."
	
	para "I believe it is"
	line "your destiny to"
	cont "have this."
	done
	
DuskHouse2NPC1Text2:
	text "That TM contains"
	line "DESTINY BOND."
	
	para "If your #MON"
	line "uses this move"
	cont "and is taken down"
	cont "by the opponent,"
	
	para "they will fall"
	line "as well."
	
	para "Almost as if they"
	line "are destined to be"
	cont "together…"
	done
	
DuskHouse2NPC1TextLoop:
	text "Friends, <WAIT_M>enemies…<WAIT_M>"
	line "Lovers, <WAIT_M>strangers…<WAIT_S>"
	
	para "Destiny binds us"
	line "all together."
	
	para "Try as you might,"
	line "that bond cannot"
	cont "be broken."
	done
	
DuskHouse2NPC2Text1:
	text "Do you believe in"
	line "destiny?"
	
	para "The young become"
	line "old…"
	
	para "The old fade from"
	line "memory…"
	
	para "The threads of"
	line "destiny string us"
	cont "along to our"
	cont "eventual fates."
	
	para "Try as you might,<WAIT_S>"
	line "it cannot be"
	cont "stopped."
	
	para "Here."
	
	para "I believe it is"
	line "your destiny to"
	cont "have this."
	done
	
DuskHouse2NPC2Text2:
	text "If your #MON"
	line "holds this and"
	cont "falls in love with"
	cont "the opponent,"
	
	para "they will return"
	line "those feelings."
	
	para "Almost as if they"
	line "are destined to be"
	cont "together…"
	done
	
DuskHouse2NPC2Text3:
	text "I was going to"
	line "give you something,"
	cont "but your bag is"
	cont "full."
	
	para "It must not be"
	line "destiny…"
	done
	
DuskHouse2NPC2TextLoop:
	text "The young become"
	line "old…"
	
	para "The old fade from"
	line "memory…"
	
	para "The threads of"
	line "destiny string us"
	cont "along to our"
	cont "eventual fates."
	
	para "Try as you might,<WAIT_S>"
	line "it cannot be"
	cont "stopped."
	done
	