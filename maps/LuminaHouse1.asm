LuminaHouse1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 6, 3, 2, LUMINA_TOWN
	warp_def 6, 2, 2, LUMINA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_GRANNY,  3,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaHouse1NPC, -1


LuminaHouse1NPC:
	faceplayer
	opentext
	checkevent EVENT_PLAYER_IS_FEMALE
	iftrue LuminaHouse1NPCGirl
	checkevent EVENT_DAILY_GOT_COIN
	iftrue .got_coin
	writetext LuminaHouse1NPCText1
	waitbutton
	checkevent EVENT_GOT_SILVER_COIN
	iftrue .gold
	verbosegiveitem SILVER_COIN
	iffalse .noroom
	setevent EVENT_GOT_SILVER_COIN
	setevent EVENT_DAILY_GOT_COIN
	writetext LuminaHouse1NPCText2
	waitbutton
	closetext
	end
.gold
	verbosegiveitem GOLD_COIN
	iffalse .noroom
	clearevent EVENT_GOT_SILVER_COIN
	setevent EVENT_DAILY_GOT_COIN
	writetext LuminaHouse1NPCText2
	waitbutton
	closetext
	end
.got_coin
	writetext LuminaHouse1NPCTextDone
	waitbutton
	closetext
	end
.noroom
	writetext LuminaHouse1NPCTextNoRoom
	waitbutton
	closetext
	end
	
LuminaHouse1NPCGirl:
	checkevent EVENT_DAILY_GOT_COIN
	iftrue .got_coin
	writetext LuminaHouse1NPCText1girl
	waitbutton
	checkevent EVENT_GOT_SILVER_COIN
	iftrue .gold
	verbosegiveitem SILVER_COIN
	iffalse .noroom
	setevent EVENT_GOT_SILVER_COIN
	setevent EVENT_DAILY_GOT_COIN
	writetext LuminaHouse1NPCText2girl
	waitbutton
	closetext
	end
.gold
	verbosegiveitem GOLD_COIN
	iffalse .noroom
	clearevent EVENT_GOT_SILVER_COIN
	setevent EVENT_DAILY_GOT_COIN
	writetext LuminaHouse1NPCText2girl
	waitbutton
	closetext
	end
.got_coin
	writetext LuminaHouse1NPCTextDonegirl
	waitbutton
	closetext
	end
.noroom
	writetext LuminaHouse1NPCTextNoRoomgirl
	waitbutton
	closetext
	end
	
LuminaHouse1NPCText1:
	text "Oh, RAPLHIE!"
	
	para "You came to visit"
	line "GRANDMA."
	
	para "You are a good"
	line "boy, RAPLHIE."
	
	para "Here, have some"
	line "pocket money."
	done
	
LuminaHouse1NPCText2:
	text "Now don't go"
	line "spending it all"
	cont "on licorice and"
	cont "crackerjacks."
	
	para "Come visit again"
	line "tomorrow, RAPLHIE."
	
	para "GRANDMA will give"
	line "you some more"
	cont "pocket money."
	done
	
LuminaHouse1NPCTextDone:
	text "Come visit again"
	line "tomorrow, RAPLHIE."
	
	para "GRANDMA will give"
	line "you some more"
	cont "pocket money."
	done
	
LuminaHouse1NPCTextNoRoom:
	text "Your pockets are"
	line "too full, RAPLHIE!"
	
	para "Make some room for"
	line "GRANDMA's gift."
	done
	
LuminaHouse1NPCText1girl:
	text "Oh, RUTHIE!"
	
	para "You came to visit"
	line "GRANDMA."
	
	para "You are a good"
	line "girl, RUTHIE."
	
	para "Here, have some"
	line "pocket money."
	done
	
LuminaHouse1NPCText2girl:
	text "Now don't go"
	line "spending it all"
	cont "on licorice and"
	cont "crackerjacks."
	
	para "Come visit again"
	line "tomorrow, RUTHIE."
	
	para "GRANDMA will give"
	line "you some more"
	cont "pocket money."
	done
	
LuminaHouse1NPCTextDonegirl:
	text "Come visit again"
	line "tomorrow, RUTHIE."
	
	para "GRANDMA will give"
	line "you some more"
	cont "pocket money."
	done
	
LuminaHouse1NPCTextNoRoomgirl:
	text "Your pockets are"
	line "too full, RUTHIE!"
	
	para "Make some room for"
	line "GRANDMA's gift."
	done