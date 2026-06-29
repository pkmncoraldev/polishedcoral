SunbeamOldCouplesHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 7, SUNBEAM_ISLAND
	warp_def 7, 2, 7, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse1NPC1, -1
	person_event SPRITE_GRANNY, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse1NPC2, -1

	const_def 1 ; object constants
	const SUNBEAM_OLD_COUPLES_HOUSE_NPC1
	const SUNBEAM_OLD_COUPLES_HOUSE_NPC2
	
SunbeamIslandHouse1NPC1:
	jumptextfaceplayer SunbeamIslandHouse1NPC1Text
	
SunbeamIslandHouse1NPC2:
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iffalse .do_dolls
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iffalse .do_dolls
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iffalse .do_dolls
	checkevent EVENT_DECO_CHIKORITA_DOLL
	iffalse .do_dolls
	checkevent EVENT_DECO_CYNDAQUIL_DOLL
	iffalse .do_dolls
	checkevent EVENT_DECO_TOTODILE_DOLL
	iffalse .do_dolls
	jumptextfaceplayer SunbeamIslandHouse1NPC2Text2
.do_dolls
	faceplayer
	opentext
	writetext SunbeamIslandHouse1NPC2Text1
	waitbutton
	callasm SunbeamIslandHouse1NPC2Asm
	iffalse .no
	if_equal BULBASAUR, .bulb
	if_equal CHARMANDER, .charm
	if_equal SQUIRTLE, .squirt
	if_equal CHIKORITA, .chik
	if_equal CYNDAQUIL, .cynda
	if_equal TOTODILE, .toto
	if_equal IVYSAUR, .bulbevo
	if_equal CHARMELEON, .charmevo
	if_equal WARTORTLE, .squirtevo
	if_equal BAYLEEF, .chikevo
	if_equal QUILAVA, .cyndaevo
	if_equal CROCONAW, .totoevo
	if_equal VENUSAUR, .bulbevo
	if_equal CHARIZARD, .charmevo
	if_equal BLASTOISE, .squirtevo
	if_equal MEGANIUM, .chikevo
	if_equal TYPHLOSION, .cyndaevo
	if_equal FERALIGATR, .totoevo
	writetext SunbeamIslandHouse1NPC2TextWrong
	waitbutton
	closetext
	end
.bulbevo
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextEvo
	jump .bulbcont
.bulb
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextRight
.bulbcont
	waitbutton
	setevent EVENT_DECO_BULBASAUR_DOLL
	writetext GiveBulbaDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayBulbaDollText
	waitbutton
	closetext
	end
.charmevo
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextEvo
	jump .charmcont
.charm
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextRight
.charmcont
	waitbutton
	setevent EVENT_DECO_CHARMANDER_DOLL
	writetext GiveCharmDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayCharmDollText
	waitbutton
	closetext
	end
.squirtevo
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextEvo
	jump .squirtcont
.squirt
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextRight
.squirtcont
	waitbutton
	setevent EVENT_DECO_SQUIRTLE_DOLL
	writetext GiveSquirtDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwaySquirtDollText
	waitbutton
	closetext
	end
.chikevo
	checkevent EVENT_DECO_CHIKORITA_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextEvo
	jump .chikcont
.chik
	checkevent EVENT_DECO_CHIKORITA_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextRight
.chikcont
	waitbutton
	setevent EVENT_DECO_CHIKORITA_DOLL
	writetext GiveChikoDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayChikoDollText
	waitbutton
	closetext
	end
.cyndaevo
	checkevent EVENT_DECO_CYNDAQUIL_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextEvo
	jump .cyndacont
.cynda
	checkevent EVENT_DECO_CYNDAQUIL_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextRight
.cyndacont
	waitbutton
	setevent EVENT_DECO_CYNDAQUIL_DOLL
	writetext GiveCyndaDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayCyndaDollText
	waitbutton
	closetext
	end
.totoevo
	checkevent EVENT_DECO_TOTODILE_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextEvo
	jump .totocont
.toto
	checkevent EVENT_DECO_TOTODILE_DOLL
	iftrue .done_that_doll
	writetext SunbeamIslandHouse1NPC2TextRight
.totocont
	waitbutton
	setevent EVENT_DECO_TOTODILE_DOLL
	writetext GiveTotoDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayTotoDollText
	waitbutton
	closetext
	end
.done_that_doll
	writetext SunbeamIslandHouse1NPC2TextAlreadyShowed
	waitbutton
	closetext
	end
.no
	writetext SunbeamIslandHouse1NPC2TextNo
	waitbutton
	closetext
	end
	
SunbeamIslandHouse1NPC2Asm:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wScriptVar], a
	ret
.cancel
	xor a
	ld [wScriptVar], a
	ret
	
SunbeamIslandHouse1NPC1Text:
	text "This island was"
	line "the perfect place"
	cont "to retire."
	
	para "We have great wea-"
	line "ther, and it isn't"
	cont "too quiet or too"
	cont "busy."
	done
	
SunbeamIslandHouse1NPC2Text1:
	text "PROF. SPRUCE used"
	line "to have 6 cute"
	cont "little #MON on"
	cont "his reserve."
	
	para "He had them sent"
	line "off for some kids"
	cont "to train as their"
	cont "starter #MON."
	
	para "If show me one of"
	line "them, I'll give you"
	cont "something good!"
	done
	
SunbeamIslandHouse1NPC2Text2:
	text "Sorry dear, I have"
	line "no more dolls to"
	cont "give."
	done
	
SunbeamIslandHouse1NPC2TextWrong:
	text "No, that isn't one"
	line "of the #MON I'm"
	cont "talking about…"
	done
	
SunbeamIslandHouse1NPC2TextNo:
	text "Next time, then."
	done
	
SunbeamIslandHouse1NPC2TextAlreadyShowed:
	text "You've already let"
	line "me see that one!"
	done
	
SunbeamIslandHouse1NPC2TextRight:
	text "That's it!"
	
	para "It's just as cute"
	line "as I remember!"
	
	para "Here you go,"
	line "as promised."
	done
	
SunbeamIslandHouse1NPC2TextEvo:
	text "Oh my!"
	
	para "I think that's it,"
	line "but the dear thing"
	cont "went and evolved!"
	
	para "Well, here you go,"
	line "as promised."
	done
	
GiveBulbaDollText:
	text "<PLAYER> received"
	line "BULBASAUR DOLL!"
	done
	
PutAwayBulbaDollText:
	text "BULBASAUR DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveCharmDollText:
	text "<PLAYER> received"
	line "CHARMANDER DOLL!"
	done
	
PutAwayCharmDollText:
	text "CHARMANDER DOLL"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveSquirtDollText:
	text "<PLAYER> received"
	line "SQUIRTLE DOLL!"
	done
	
PutAwaySquirtDollText:
	text "SQUIRTLE DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveChikoDollText:
	text "<PLAYER> received"
	line "CHIKORITA DOLL!"
	done
	
PutAwayChikoDollText:
	text "CHIKORITA DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveCyndaDollText:
	text "<PLAYER> received"
	line "CYNDAQUIL DOLL!"
	done
	
PutAwayCyndaDollText:
	text "CYNDAQUIL DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveTotoDollText:
	text "<PLAYER> received"
	line "TOTODILE DOLL!"
	done
	
PutAwayTotoDollText:
	text "TOTODILE DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	