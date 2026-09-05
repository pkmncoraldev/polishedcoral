Route33House_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route33HouseCallback

	db 2 ; warp events
	warp_event 2, 6, ROUTE_33, 13
	warp_event 3, 6, ROUTE_33, 13

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_GENTLEMAN, -5, -5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route33HouseNPCArticuno, -1
	person_event SPRITE_GENTLEMAN, -5, -5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route33HouseNPCZapdos, -1
	person_event SPRITE_GENTLEMAN, -5, -5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route33HouseNPCMoltres, -1
	
Route33HouseCallback:
	checkevent EVENT_ARTICUNO_ACTIVE
	iffalse .not_articuno
	moveperson 1, 5, 4
	return
.not_articuno
	checkevent EVENT_ZAPDOS_ACTIVE
	iffalse .not_zapdos
	moveperson 2, 5, 4
	return
.not_zapdos
	moveperson 3, 5, 4
	return
	
	
Route33HouseNPCArticuno:
	faceplayer
	opentext
	checkevent EVENT_PRESENTED_LEGENDARY_BIRD
	iftrue .showed_articuno
	writetext Route33HouseNPCIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext Route33HouseNPCArticunoText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	writebyte ARTICUNO
	special Special_FindThatSpecies
	iffalse .done_articuno
	writetext Route33HouseNPCArticunoText2
	waitbutton
	verbosegiveitem POTION	 ;TODO red item
	writetext Route33HouseNPCArticunoText3
	setevent EVENT_PRESENTED_LEGENDARY_BIRD
	buttonsound
	farwritetext StdBlankText
	pause 6
	jump .done_articuno
.showed_articuno
	writetext Route33HouseNPCIntroText2
	buttonsound
	farwritetext StdBlankText
	pause 6
.done_articuno
	scall ZapdosItem
	scall MoltresItem
	writetext Route33HouseNPCEndText
	waitbutton
	closetext
	end
	
Route33HouseNPCZapdos:
	faceplayer
	opentext
	checkevent EVENT_PRESENTED_LEGENDARY_BIRD
	iftrue .showed_zapdos
	writetext Route33HouseNPCIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext Route33HouseNPCZapdosText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	writebyte ZAPDOS
	special Special_FindThatSpecies
	iffalse .done_zapdos
	writetext Route33HouseNPCZapdosText2
	waitbutton
	verbosegiveitem SUPER_POTION	 ;TODO yellow item
	writetext Route33HouseNPCZapdosText3
	setevent EVENT_PRESENTED_LEGENDARY_BIRD
	buttonsound
	farwritetext StdBlankText
	pause 6
	jump .done_zapdos
.showed_zapdos
	writetext Route33HouseNPCIntroText2
	buttonsound
	farwritetext StdBlankText
	pause 6
.done_zapdos
	scall ArticunoItem
	scall MoltresItem
	writetext Route33HouseNPCEndText
	waitbutton
	closetext
	end
	
Route33HouseNPCMoltres:
	faceplayer
	opentext
	checkevent EVENT_PRESENTED_LEGENDARY_BIRD
	iftrue .showed_moltres
	writetext Route33HouseNPCIntroText
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext Route33HouseNPCMoltresText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	writebyte MOLTRES
	special Special_FindThatSpecies
	iffalse .done_moltres
	writetext Route33HouseNPCMoltresText2
	waitbutton
	verbosegiveitem HYPER_POTION	 ;TODO red item
	writetext Route33HouseNPCMoltresText3
	setevent EVENT_PRESENTED_LEGENDARY_BIRD
	buttonsound
	farwritetext StdBlankText
	pause 6
	jump .done_moltres
.showed_moltres
	writetext Route33HouseNPCIntroText2
	buttonsound
	farwritetext StdBlankText
	pause 6
.done_moltres
	scall ArticunoItem
	scall ZapdosItem
	writetext Route33HouseNPCEndText
	waitbutton
	closetext
	end
	
ArticunoItem:
	checkitem POTION ;TODO blue item
	iffalse .no
	checkevent EVENT_UNLOCKED_BOREAL_ISLAND
	iftrue .no
	checkevent EVENT_EXPLAINED_ARTICUNO_ITEM
	iftrue .repeat
	writetext Route33HouseNPCArticunoItemText
	buttonsound
	farwritetext StdBlankText
	pause 6
	setevent EVENT_EXPLAINED_ARTICUNO_ITEM
	end
.repeat
	writetext Route33HouseNPCArticunoItemText2
	buttonsound
	farwritetext StdBlankText
	pause 6
.no
	end
	
ZapdosItem:
	checkitem SUPER_POTION ;TODO yellow item
	iffalse .no
	checkevent EVENT_UNLOCKED_TEMPEST_ISLAND
	iftrue .no
	checkevent EVENT_EXPLAINED_ZAPDOS_ITEM
	iftrue .repeat
	writetext Route33HouseNPCZapdosItemText
	buttonsound
	farwritetext StdBlankText
	pause 6
	setevent EVENT_EXPLAINED_ZAPDOS_ITEM
	end
.repeat
	writetext Route33HouseNPCZapdosItemText2
	buttonsound
	farwritetext StdBlankText
	pause 6
.no
	end
	
MoltresItem:
	checkitem HYPER_POTION ;TODO red item
	iffalse .no
	checkevent EVENT_UNLOCKED_EMBER_ISLAND
	iftrue .no
	checkevent EVENT_EXPLAINED_MOLTRES_ITEM
	iftrue .repeat
	writetext Route33HouseNPCMoltresItemText
	buttonsound
	farwritetext StdBlankText
	pause 6
	setevent EVENT_EXPLAINED_MOLTRES_ITEM
	end
.repeat
	writetext Route33HouseNPCMoltresItemText2
	buttonsound
	farwritetext StdBlankText
	pause 6
.no
	end
	
Route33HouseNPCIntroText:
	text "This lagoon is"
	line "home to three"
	cont "islets."
	
	para "BOREAL ISLET,"
	line "TEMPEST ISLET,"
	cont "and EMBER ISLET."
	
	para "A great bird #-"
	line "MON perches on"
	cont "each islet."
	
	para "They've been sealed"
	line "off to keep the"
	cont "#MON safe from"
	cont "those who would"
	cont "do them harm."
	
	para "Recently, though,"
	line "one of the #MON"
	cont "has left to fly"
	cont "the skies of the"
	cont "mainland."
	done
	
Route33HouseNPCIntroText2:
	text "Was there anything"
	line "interesting left"
	cont "on that islet?"
	done
	
Route33HouseNPCEndText:
	text "Now, if you'll"
	line "excuse me."
	done
	
Route33HouseNPCArticunoItemText:
	text "…<WAIT_M>Oh!<WAIT_S> You have the"
	line "blue item!"
	
	para "It'll let you get"
	line "onto BOREAL ISLET"
	cont "to the EAST."
	done
	
Route33HouseNPCArticunoItemText2:
	text "That blue item"
	line "will let you get"
	cont "onto BOREAL ISLET"
	cont "to the EAST."
	done
	
Route33HouseNPCZapdosItemText:
	text "…<WAIT_M>Oh!<WAIT_S> You have the"
	line "yellow item!"
	
	para "It'll let you get"
	line "onto TEMPEST ISLET"
	cont "to the SOUTH."
	done
	
Route33HouseNPCZapdosItemText2:
	text "That yellow item"
	line "will let you get"
	cont "onto TEMPEST ISLET"
	cont "to the SOUTH."
	done
	
Route33HouseNPCMoltresItemText:
	text "…<WAIT_M>Oh!<WAIT_S> You have the"
	line "red item!"
	
	para "It'll let you get"
	line "onto EMBER ISLET"
	cont "to the WEST."
	done
	
Route33HouseNPCMoltresItemText2:
	text "That red item"
	line "will let you get"
	cont "onto EMBER ISLET"
	cont "to the WEST."
	done
	
Route33HouseNPCMoltresText1:
	text "MOLTRES, the bird"
	line "they say has wings"
	cont "of pure fire!"
	
	para "It used to roost"
	line "on EMBER ISLET."
	
	para "That's the western-"
	line "most islet in the"
	cont "ROUTE 33 lagoon."
	done
	
Route33HouseNPCMoltresText2:
	text "…<WAIT_M>Hold on."
	
	para "That's it!"
	
	para "You have MOLTRES!"
	
	para "You tamed it?<WAIT_S>"
	line "Amazing!"
	
	para "Here, have this."
	
	para "It's rightfully"
	line "yours."
	done
	
Route33HouseNPCMoltresText3:
	text "It'll let you get"
	line "onto EMBER ISLET"
	cont "to the WEST."
	
	para "You might find"
	line "something MOLTRES"
	cont "left behind."
	done
	
Route33HouseNPCZapdosText1:
	text "ZAPDOS, the bird"
	line "they say has wings"
	cont "that crackle with"
	cont "lightning!"
	
	para "It used to roost"
	line "on TEMPEST ISLET."
	
	para "That's the southern-"
	line "most islet in the"
	cont "ROUTE 33 lagoon."
	done
	
Route33HouseNPCZapdosText2:
	text "…<WAIT_M>Hold on."
	
	para "That's it!"
	
	para "You have ZAPDOS!"
	
	para "You tamed it?<WAIT_S>"
	line "Amazing!"
	
	para "Here, have this."
	
	para "It's rightfully"
	line "yours."
	done
	
Route33HouseNPCZapdosText3:
	text "It'll let you get"
	line "onto TEMPEST ISLET"
	cont "to the SOUTH."
	
	para "You might find"
	line "something ZAPDOS"
	cont "left behind."
	done
	
Route33HouseNPCArticunoText1:
	text "ARTICUNO, the bird"
	line "they say chills the"
	cont "very air itself!"
	
	para "It used to roost"
	line "on BOREAL ISLET."
	
	para "That's the eastern-"
	line "most islet in the"
	cont "ROUTE 33 lagoon."
	done
	
Route33HouseNPCArticunoText2:
	text "…<WAIT_M>Hold on."
	
	para "That's it!"
	
	para "You have ARTICUNO!"
	
	para "You tamed it?<WAIT_S>"
	line "Amazing!"
	
	para "Here, have this."
	
	para "It's rightfully"
	line "yours."
	done
	
Route33HouseNPCArticunoText3:
	text "It'll let you get"
	line "onto BOREAL ISLET"
	cont "to the NORTHEAST."
	
	para "You might find"
	line "something ARTICUNO"
	cont "left behind."
	done
