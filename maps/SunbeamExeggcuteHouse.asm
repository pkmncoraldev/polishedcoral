SunbeamExeggcuteHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 5, SUNBEAM_ISLAND
	warp_def 7, 2, 5, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_REDS_MOM, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse4NPC1, -1
	person_event SPRITE_PONYTAIL, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse4NPC2, -1
	
	const_def 1 ; object constants
	const SUNBEAM_DODRIO_HOUSE_NPC1
	const SUNBEAM_DODRIO_HOUSE_NPC2
	const SUNBEAM_DODRIO_HOUSE_DODUO
	
SunbeamIslandHouse4NPC1:
	faceplayer
	opentext
	writetext SunbeamIslandHouse4NPC1Text1
	waitbutton
	writebyte EXEGGCUTE
	special Special_FindThatSpecies
	iftrue .haveegg
	closetext
	end
.haveegg
	special FadeOutPalettes
	callasm SunbeamIslandExeggcuteAsm
	ifequal 4, .wrong_exeggcute
	ifequal 3, .cancel
	iffalse .no
	writetext SunbeamIslandHouse4NPC1Text2
	waitbutton
	closetext
	end
.cancel
	writetext SunbeamIslandHouse4NPC1Text3
	waitbutton
	closetext
	end
.no
	writetext SunbeamIslandHouse4NPC1Text4
	waitbutton
	closetext
	end
.wrong_exeggcute
	writetext SunbeamIslandHouse4NPC1Text5
	waitbutton
	closetext
	end
	
SunbeamIslandExeggcuteAsm:
	farcall SelectEncounterHouseMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	cp EXEGGCUTE
	jr nz, .no
	ld a, [wCurForm]
	cp ALOLAN_FORM
	jr nz, .wrong_exeggcute
	ld a, TRUE
	ld [wScriptVar], a
	ret
.no
	ld a, FALSE
	ld [wScriptVar], a
	ret
.cancel
	ld a, 3
	ld [wScriptVar], a
	ret
.wrong_exeggcute
	ld a, 4
	ld [wScriptVar], a
	ret
	
SunbeamIslandHouse4NPC2:
	jumptextfaceplayer SunbeamIslandHouse4NPC2Text
	
SunbeamIslandHouse4NPC1Text1:
	text "EXEGGCUTE around"
	line "here are sometimes"
	cont "taller than usual"
	cont "after they evolve."
	
	para "There's a special"
	line "trick to see which"
	cont "ones will get big."
	
	para "If you bring me an"
	line "EXEGGCUTE, I can"
	cont "tell you if it'll"
	cont "grow tall."
	done
	
SunbeamIslandHouse4NPC1Text2:
	text "Yes!"
	
	para "This EXEGGCUTE"
	line "will grow tall"
	cont "for sure!"
	done
	
SunbeamIslandHouse4NPC1Text3:
	text "I'll be here if you"
	line "find an EXEGGCUTE."
	done
	
SunbeamIslandHouse4NPC1Text4:
	text "That's not"
	line "EXEGGCUTE!"
	done
	
SunbeamIslandHouse4NPC1Text5:
	text "Hmm…"
	
	para "Nope."
	
	para "This one won't get"
	line "too big…"
	done
	
SunbeamIslandHouse4NPC2Text:
	text "EXEGGCUTE live in"
	line "the trees."
	
	para "If you wanna see"
	line "them, you have to"
	cont "knock 'em down"
	cont "somehow."
	done