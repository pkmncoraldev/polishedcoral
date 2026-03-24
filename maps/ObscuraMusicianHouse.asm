ObscuraMusicianHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, OBSCURA_CITY, 10
	warp_event  3,  7, OBSCURA_CITY, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_ROCKER,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMusicianHouseNPC, -1
	
ObscuraMusicianHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .done_sold
	checkevent EVENT_SOLD_POKEFLUTE
	iftrue .sold
	checkevent EVENT_TALKED_TO_MUSICIAN
	iftrue .talked
	setevent EVENT_TALKED_TO_MUSICIAN
	writetext ObscuraMusicianHouseNPCText1
	jump .cont1
.talked
	writetext ObscuraMusicianHouseNPCText2
.cont1
	yesorno
	iffalse .no1
	writetext ObscuraMusicianHouseNPCTextGive
	takeitem POKE_FLUTE
	playsound SFX_LEVEL_UP 
	waitsfx
	verbosegiveitem COMET_SHARD
.done_sold
	writetext ObscuraMusicianHouseNPCText3
	waitbutton
	closetext
	setevent EVENT_SOLD_POKEFLUTE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end
.no1
	writetext ObscuraMusicianHouseNPCTextNo1
	waitbutton
	closetext
	end
.sold
	checkitem POKE_FLUTE
	iftrue .totally_done
	writetext ObscuraMusicianHouseNPCText4
	special PlaceMoneyTopRight
	yesorno
	iffalse .no2
	checkmoney $0, 60000
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 60000
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	verbosegiveitem POKE_FLUTE
.totally_done
	writetext ObscuraMusicianHouseNPCText5
	waitbutton
	closetext
	end
.no2
	writetext ObscuraMusicianHouseNPCTextNo2
	waitbutton
	closetext
	end
.nomoney
	writetext ObscuraMusicianHouseNPCTextNoMoney
	waitbutton
	closetext
	end
	
ObscuraMusicianHouseNPCText1:
	text "Hello."
	
	para "I'm a master"
	line "musician."
	
	para "I've been looking"
	line "for a new musical"
	cont "instrument to"
	cont "master."
	
	para "Oh!<WAIT_S> You have a"
	line "#FLUTE!"
	
	para "Would you trade"
	line "it to me for this"
	cont "COMET SHARD?"
	
	para "It's worth ¥15000."
	done
	
ObscuraMusicianHouseNPCText2:
	text "My offer is still"
	line "on the table."
	
	para "Your #FLUTE for"
	line "this COMET SHARD?"
	
	para "It's worth ¥15000."
	done
	
ObscuraMusicianHouseNPCText3:
	text "Thank you!"
	
	para "I can't wait to"
	line "master this!"
	done
	
ObscuraMusicianHouseNPCText4:
	text "Oh, hi.<WAIT_S>"
	line "It's you again."
	
	para "If you came back,"
	line "I wonder…"
	
	para "Did you want your"
	line "#FLUTE back?"
	
	para "I'll sell it back"
	line "to you for… <WAIT_S>say…"
	cont "¥60000."
	done
	
ObscuraMusicianHouseNPCText5:
	text "I'm glad we reached"
	line "an agreement!"
	done
	
ObscuraMusicianHouseNPCTextGive:
	text "<PLAYER> handed over"
	line "#FLUTE."
	done
	
ObscuraMusicianHouseNPCTextNo1:
	text "Suit yourself!"
	done
	
ObscuraMusicianHouseNPCTextNo2:
	text "Ok then!"
	done
	
ObscuraMusicianHouseNPCTextNoMoney:
	text "Oh, sorry."
	
	para "You don't have"
	line "the money."
	done
	
	