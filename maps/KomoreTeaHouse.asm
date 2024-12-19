KomoreTeaHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, KOMORE_VILLAGE, 8
	warp_event  4,  7, KOMORE_VILLAGE, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_ELDER,  3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KomoreTeaHouseMaster, -1
	
	const_def 1 ; object constants
	const KOMORE_TEA_HOUSE_MASTER
	
KomoreTeaHouseMaster:
	faceplayer
	opentext
	checkevent EVENT_SPOKEN_TO_TEA_MASTER
	iftrue .talked
	setevent EVENT_SPOKEN_TO_TEA_MASTER
	writetext KomoreTeaHouseMasterText1
	buttonsound
	farwritetext StdBlankText
	waitsfx
	special SaveMusic
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_DOJO
	writetext KomoreTeaHouseMasterText1_2
	playmusic MUSIC_NONE
	buttonsound
	farwritetext StdBlankText
	pause 6
	special Special_DotDotDot
	pause 40
	special RestoreMusic
	writetext KomoreTeaHouseMasterText1_3
	jump .cont
.talked
	writetext KomoreTeaHouseMasterText5
.cont
	yesorno
	iffalse .no
	writetext KomoreTeaHouseMasterText8
	waitbutton
	special FadeOutPalettes
	special Special_ChooseItem
	iffalse .no
	callasm CheckItemTeaMaster
	iffalse .not_interested
	ifequal 1, .gold
	ifequal 2, .silver
.gold
	takeitem GOLD_LEAF
	checkitem GOLD_LEAF
	iffalse .gold_one
	takeitem GOLD_LEAF
	checkitem GOLD_LEAF
	iffalse .gold_two
	takeitem GOLD_LEAF
	checkitem GOLD_LEAF
	iffalse .gold_three
	takeitem GOLD_LEAF
	writetext KomoreTeaHouseMasterTextGiveGold
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext KomoreTeaHouseMasterText2
	waitbutton
	closetext
	spriteface KOMORE_TEA_HOUSE_MASTER, RIGHT
	pause 40
	setlasttalked KOMORE_TEA_HOUSE_MASTER
	faceplayer
	opentext
	writetext KomoreTeaHouseMasterText3
	waitbutton
	verbosegiveitem GOLD_TEA
	iffalse .NoRoomGold
	jump .no
.silver
	takeitem SILVER_LEAF
	checkitem SILVER_LEAF
	iffalse .silver_one
	takeitem SILVER_LEAF
	checkitem SILVER_LEAF
	iffalse .silver_two
	takeitem SILVER_LEAF
	checkitem SILVER_LEAF
	iffalse .silver_three
	takeitem SILVER_LEAF
	writetext KomoreTeaHouseMasterTextGiveGold
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext KomoreTeaHouseMasterText2
	waitbutton
	closetext
	spriteface KOMORE_TEA_HOUSE_MASTER, RIGHT
	pause 40
	setlasttalked KOMORE_TEA_HOUSE_MASTER
	faceplayer
	opentext
	writetext KomoreTeaHouseMasterText3
	waitbutton
	verbosegiveitem SILVER_TEA
	iffalse .NoRoomSilver
.no
	writetext KomoreTeaHouseMasterText4
	waitbutton
	closetext
	end
.not_interested
	writetext KomoreTeaHouseMasterText7
	waitbutton
	closetext
	end
.NoRoomGold
	writetext KomoreTeaHouseMasterText9
	waitbutton
	closetext
	giveitem GOLD_LEAF, 4
	done
.NoRoomSilver
	writetext KomoreTeaHouseMasterText10
	waitbutton
	closetext
	giveitem SILVER_LEAF, 4
	done
.gold_three
	giveitem GOLD_LEAF
.gold_two
	giveitem GOLD_LEAF
.gold_one
	giveitem GOLD_LEAF
	writetext KomoreTeaHouseMasterText6
	waitbutton
	closetext
	end
.silver_three
	giveitem SILVER_LEAF
.silver_two
	giveitem SILVER_LEAF
.silver_one
	giveitem SILVER_LEAF
	writetext KomoreTeaHouseMasterText6
	waitbutton
	closetext
	end

CheckItemTeaMaster:
	ld a, [wCurItem]
	cp GOLD_LEAF
	jr z, .gold
	cp SILVER_LEAF
	jr z, .silver
	ld a, FALSE
	ld [wScriptVar], a
	ret
.gold
	ld a, 1
	ld [wScriptVar], a
	ret
.silver
	ld a, 2
	ld [wScriptVar], a
	ret
	
KomoreTeaHouseMasterTextGiveGold:
	text "<PLAYER> handed"
	line "over the GOLD"
	cont "LEAVES."
	done
	
KomoreTeaHouseMasterTextGiveSilver:
	text "<PLAYER> handed"
	line "over the SILVER"
	cont "LEAVES."
	done
	
KomoreTeaHouseMasterText1:
	text "Say nothing,"
	line "child."
	
	para "I know why you"
	line "have come."
	
	para "You come seeking"
	line "enlightenment from"
	cont "THE MASTER."
	
	para "Many have come"
	line "seeking just such"
	cont "a thing."
	done
	
KomoreTeaHouseMasterText1_2:
	text "I…<WAIT_L><WAIT_M> am THE MASTER…<WAIT_L><WAIT_L><WAIT_M>'s<WAIT_S>"
	line "brother."
	done
	
KomoreTeaHouseMasterText1_3:
	text "Ahem…"
	
	para "People call me the"
	line "MASTER BREWER!"
	
	para "I'll brew anything"
	line "in the world, as"
	cont "long as it's GOLD"
	cont "or SILVER TEA."
	
	para "GOLD and SILVER"
	line "TEA are wonderful"
	cont "drinks that will"
	cont "surely help you."
	
	para "I mean seriously,"
	line "you want this tea,"
	cont "my child."
	
	para "I brew them from"
	line "4 GOLD or SILVER"
	cont "LEAVES."
	
	para "Do you have 4 GOLD"
	line "or SILVER LEAVES"
	cont "for me?"
	done
	
KomoreTeaHouseMasterText2:
	text "Let us begin."
	done
	
KomoreTeaHouseMasterText3:
	text "This will be to"
	line "your liking,"
	cont "I'm sure."
	done
	
KomoreTeaHouseMasterText4:
	text "Return to me if"
	line "you need tea,"
	cont "young one."
	done
	
KomoreTeaHouseMasterText5:
	text "Hello, young one."
	
	para "If you want"
	line "something from"
	cont "the MASTER BREWER,"
	cont "it must be tea."
	
	para "Do you have 4 GOLD"
	line "or SILVER LEAVES"
	cont "for me?"
	done
	
KomoreTeaHouseMasterText6:
	text "That's not"
	line "enough."
	
	para "I need 4 leaves"
	line "to brew tea!"
	done
	
KomoreTeaHouseMasterText7:
	text "I can't brew"
	line "just anything…"
	
	para "It has to be a"
	line "GOLD or SILVER"
	cont "LEAF."
	done
	
KomoreTeaHouseMasterText8:
	text "What shall I"
	line "brew?"
	done
	
KomoreTeaHouseMasterText9:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "I'll give you back"
	line "the GOLD LEAVES."
	done
	
KomoreTeaHouseMasterText10:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "I'll give you back"
	line "the SILVER LEAVES."
	done
	