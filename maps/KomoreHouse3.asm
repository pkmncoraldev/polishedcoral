KomoreHouse3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  6, KOMORE_VILLAGE, 5
	warp_event  3,  6, KOMORE_VILLAGE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_POKEFAN_M,  3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KomoreHouse3NPC1, -1
	person_event SPRITE_MATRON,  4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse3NPC2, -1
	person_event SPRITE_TWIN,  6, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KomoreHouse3NPC3, -1
	object_event  3,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, JIGGLYPUFF, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, KomoreHouse3Jiggly, -1
	object_event  1,  6, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, SWABLU, -1, -1, PAL_NPC_TEAL, PERSONTYPE_SCRIPT, 0, KomoreHouse3Swablu, -1
	object_event  0,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, MARILL, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse3Marill, -1
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, MAREEP, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse3Mareep, -1
	
KomoreHouse3Jiggly:
	jumptext KomoreHouse3JigglyText
	
KomoreHouse3Swablu:
	jumptext KomoreHouse3SwabluText
	
KomoreHouse3Marill:
	jumptext KomoreHouse3MarillText
	
KomoreHouse3Mareep:
	jumptext KomoreHouse3MareepText
	
KomoreHouse3Giraf:
	jumptext KomoreHouse3GirafText
	
KomoreHouse3NPC1:
	jumptextfaceplayer KomoreHouse3NPC1Text
	
KomoreHouse3NPC2:
	jumptextfaceplayer KomoreHouse3NPC2Text
	
KomoreHouse3NPC3:
	faceplayer
	opentext
	checkevent EVENT_KOMORE_DOLL_GIRL_EXPLAINED
	iftrue KomoreHouse3NPC3Dolls
	writetext KomoreHouse3NPC3Text1
	pause 6
	cry PIKACHU
	waitsfx
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext KomoreHouse3NPC3Text2
	checkevent EVENT_UNIQUE_ENCOUNTER_MIMIKYU_BOSS
	iftrue .did_mimikyu
	waitbutton
	closetext
	end
.did_mimikyu
	setevent EVENT_KOMORE_DOLL_GIRL_EXPLAINED
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext KomoreHouse3NPC3Text3
	buttonsound
	farwritetext StdBlankText
	pause 6
	jump KomoreHouse3NPC3Electivire
	
KomoreHouse3NPC3Dolls:
	
	
KomoreHouse3NPC3Electivire:
	writetext KomoreHouse3NPC3Text4
	pause 6
	cry ELECTIVIRE
	scall KomoreHouse3NPC3PresentMon
	iffalse KomoreHouse3NPC3No
	if_not_equal ELECTIVIRE, KomoreHouse3NPC3Wrong
	writetext KomoreHouse3NPC3Text6
;	setevent EVENT_DECO_ELEKID_DOLL
	writetext GiveElekidDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayElekidDollText
	waitbutton
	writetext KomoreHouse3NPC3Text9
	waitbutton
	endtext
	
KomoreHouse3NPC3Magmortar:
	writetext KomoreHouse3NPC3Text4
	pause 6
	cry MAGMORTAR
	scall KomoreHouse3NPC3PresentMon
	iffalse KomoreHouse3NPC3No
	if_not_equal MAGMORTAR, KomoreHouse3NPC3Wrong
	writetext KomoreHouse3NPC3Text6
;	setevent EVENT_DECO_MAGBY_DOLL
	writetext GiveMagbyDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayMagbyDollText
	waitbutton
	writetext KomoreHouse3NPC3Text9
	waitbutton
	endtext
	
KomoreHouse3NPC3Mamoswine:
	writetext KomoreHouse3NPC3Text4
	pause 6
	cry MAMOSWINE
	scall KomoreHouse3NPC3PresentMon
	iffalse KomoreHouse3NPC3No
	if_not_equal MAMOSWINE, KomoreHouse3NPC3Wrong
	writetext KomoreHouse3NPC3Text6
	setevent EVENT_DECO_BIG_MAMOSWINE_DOLL
	writetext GiveMamoswineDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayMamoswineDollText
	waitbutton
	writetext KomoreHouse3NPC3Text9
	waitbutton
	endtext
	
KomoreHouse3NPC3Volcarona:
	writetext KomoreHouse3NPC3Text4
	pause 6
	cry VOLCARONA
	scall KomoreHouse3NPC3PresentMon
	iffalse KomoreHouse3NPC3No
	if_not_equal VOLCARONA, KomoreHouse3NPC3Wrong
	writetext KomoreHouse3NPC3Text6
;	setevent EVENT_DECO_VOLCARONA_DOLL
	writetext GiveVolcaronaDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayVolcaronaDollText
	waitbutton
	writetext KomoreHouse3NPC3Text9
	waitbutton
	endtext
	
KomoreHouse3NPC3Cursola:
	writetext KomoreHouse3NPC3Text4
	pause 6
	cry CURSOLA
	scall KomoreHouse3NPC3PresentMon
	iffalse KomoreHouse3NPC3No
	if_not_equal CURSOLA, KomoreHouse3NPC3Wrong
	writetext KomoreHouse3NPC3Text6
;	setevent EVENT_DECO_JUMBO_CURSOLA_DOLL
	writetext GiveCursolaDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayCursolaDollText
	waitbutton
	writetext KomoreHouse3NPC3Text9
	waitbutton
	endtext
	
KomoreHouse3NPC3Wrong:
	writetext KomoreHouse3NPC3Text7
	waitbutton
	endtext
	
KomoreHouse3NPC3No:
	writetext KomoreHouse3NPC3Text8
	waitbutton
	endtext
	
KomoreHouse3NPC3PresentMon:
	waitsfx
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext KomoreHouse3NPC3Text5
	waitbutton
	callasm KomoreDollHouseShowMon
	end
	
KomoreDollHouseShowMon:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wScriptVar], a
	ret
.cancel
	xor a
	ld [wScriptVar], a
	ret
	
GiveElekidDollText:
	text "<PLAYER> received"
	line "ELEKID DOLL!"
	done
	
PutAwayElekidDollText:
	text "ELEKID DOLL"
	line "was sent to the PC"
	cont "in <PLAYER>'s room."
	done
	
GiveMagbyDollText:
	text "<PLAYER> received"
	line "MAGBY DOLL!"
	done
	
PutAwayMagbyDollText:
	text "MAGBY DOLL"
	line "was sent to the PC"
	cont "in <PLAYER>'s room."
	done
	
GiveMamoswineDollText:
	text "<PLAYER> received"
	line "BIG MAMOSWINE DOLL!"
	done
	
PutAwayMamoswineDollText:
	text "BIG MAMOSWINE DOLL"
	line "was sent to the PC"
	cont "in <PLAYER>'s room."
	done
	
GiveVolcaronaDollText:
	text "<PLAYER> received"
	line "VOLCARONA DOLL!"
	done
	
PutAwayVolcaronaDollText:
	text "VOLCARONA DOLL"
	line "was sent to the PC"
	cont "in <PLAYER>'s room."
	done
	
GiveCursolaDollText:
	text "<PLAYER> received"
	line "JUMBO CURSOLA DOLL!"
	done
	
PutAwayCursolaDollText:
	text "JUMBO CURSOLA DOLL"
	line "was sent to the PC"
	cont "in <PLAYER>'s room."
	done
	
KomoreHouse3NPC1Text:
	text "Why would a"
	line "PIKACHU take a"
	cont "child's doll?"
	
	para "We don't even"
	line "have wild PIKACHU"
	cont "around here!"
	done
	
KomoreHouse3NPC2Text:
	text "Our little girl's"
	line "dolls keep going"
	cont "missing."
	
	para "She keeps making"
	line "up tall tales"
	cont "about a PIKACHU"
	cont "taking them."
	
	para "I think she just"
	line "wants us to buy"
	cont "her new toys!"
	done
	
KomoreHouse3NPC3Text1:
	text "A scary PIKACHU"
	line "comes in at night"
	cont "and takes away my"
	cont "dollies!"
	
	para "It's true!"
	
	para "PIKACHU usually"
	line "sounds like,"
	done
	
KomoreHouse3NPC3Text2:
	text "but this one"
	line "sounds different…"
	done

KomoreHouse3NPC3Text3:
	text "Oh!"
	
	para "The scary PIKACHU"
	line "was a #MON"
	cont "called MIMIKYU?"
	
	para "Maybe it took my"
	line "dollies because"
	cont "it was lonely."
	
	para "Well, that's ok.<WAIT_S>"
	line "I can share!"
	done
	
KomoreHouse3NPC3Text4:
	text "I can share my"
	line "dollies with"
	cont "you, too!."
	
	para "If you show me"
	line "a #MON that"
	cont "sounds like,"
	done
	
KomoreHouse3NPC3Text5:
	text "I'll give you one"
	line "of my dollies!"
	done
	
KomoreHouse3NPC3Text6:
	text "Yes! Yes!"
	
	para "That's exactly it!"
	
	para "You can have one"
	line "of my dollies."
	done
	
KomoreHouse3NPC3Text7:
	text "No."
	done
	
KomoreHouse3NPC3Text8:
	text "Maybe next time,"
	line "then…"
	done
	
KomoreHouse3NPC3Text9:
	text "Come and visit"
	line "tomorrow, and I'll"
	cont "share some more!"
	done
	
KomoreHouse3NPC3Text10:
	text "I don't think I"
	line "have any more"
	cont "dollies to share."
	
	para "Don't be greedy!"
	done
	
KomoreHouse3JigglyText:
	text "A fluffy"
	line "JIGGLYPUFF doll."
	done
	
KomoreHouse3SwabluText:
	text "A fluffy"
	line "SWABLU doll."
	done
	
KomoreHouse3MarillText:
	text "A fluffy"
	line "MARILL doll."
	done
	
KomoreHouse3MareepText:
	text "A fluffy"
	line "MAREEP doll."
	done
	
KomoreHouse3GirafText:
	text "A fluffy"
	line "GIRAFARIG doll."
	done
