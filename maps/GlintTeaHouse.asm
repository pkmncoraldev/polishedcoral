GlintTeaHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 3, GLINT_CITY
	warp_def 7, 3, 3, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GRANNY, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintTeaHouseTeaLady, -1
	person_event SPRITE_CUTE_GIRL, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintTeaHouseNPC, -1
	
	const_def 1 ; object constants
	const GLINT_TEAHOUSE_TEA_LADY
	const GLINT_TEAHOUSE_NPC

GlintTeaHouseTeaLady:
	faceplayer
	opentext
	writetext GlintTeaHouseTeaLadyText1
	yesorno
	iffalse .no
	checkitem FLOWER_PETAL
	iffalse .none
	takeitem FLOWER_PETAL
	checkitem FLOWER_PETAL
	iffalse .one
	takeitem FLOWER_PETAL
	checkitem FLOWER_PETAL
	iffalse .two
	takeitem FLOWER_PETAL
	checkitem FLOWER_PETAL
	iffalse .three
	takeitem FLOWER_PETAL
	writetext GlintTeaHouseTeaLadyTextGivePetals
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext GlintTeaHouseTeaLadyText3
	waitbutton
	closetext
	spriteface GLINT_TEAHOUSE_TEA_LADY, LEFT
	pause 40
	setlasttalked GLINT_TEAHOUSE_TEA_LADY
	faceplayer
	opentext
	writetext GlintTeaHouseTeaLadyText6
	waitbutton
	verbosegiveitem BLOSSOM_TEA
	iffalse .NoRoom
.no
	writetext GlintTeaHouseTeaLadyText7
	waitbutton
	closetext
	end
.three
	giveitem FLOWER_PETAL
.two
	giveitem FLOWER_PETAL
.one
	giveitem FLOWER_PETAL
	writetext GlintTeaHouseTeaLadyText4
	waitbutton
	closetext
	end
.none
	writetext GlintTeaHouseTeaLadyText2
	waitbutton
	closetext
	end
.NoRoom
	writetext GlintTeaHouseTeaLadyNoRoomText
	waitbutton
	closetext
	giveitem FLOWER_PETAL, 4
	done
	
GlintTeaHouseTeaLadyTextGivePetals:
	text "<PLAYER> handed"
	line "over the FLOWER"
	cont "PETALS."
	done
	
GlintTeaHouseTeaLadyText1:
	text "Care for some tea,"
	line "sweetie?"
	
	para "I'd be happy to"
	line "make you some if"
	cont "you have 4 FLOWER"
	cont "PETALS."
	done
	
GlintTeaHouseTeaLadyText2:
	text "Oh! <WAIT_S>You don't have"
	line "any FLOWER PETALS!"
	
	para "Off to the grove"
	line "to find some!"
	done
	
GlintTeaHouseTeaLadyText3:
	text "Alright sweetie!"
	
	para "Coming right up!"
	done
	
GlintTeaHouseTeaLadyText4:
	text "Sorry sweetie…"
	
	para "I need 4 FLOWER"
	line "PETALS to make"
	cont "you some tea."
	
	para "Off to the grove"
	line "to find some more!"
	done
	
GlintTeaHouseTeaLadyText6:
	text "Here we go!"
	done
	
GlintTeaHouseTeaLadyText7:
	text "I'll be here if you"
	line "ever want some"
	cont "tea."
	done
	
GlintTeaHouseTeaLadyNoRoomText:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "I'll give you back"
	line "the FLOWER PETALS."
	done
	
GlintTeaHouseNPC:
	checkevent EVENT_GOT_TEA_HOUSE_PETAL
	iftrue .done
	setevent EVENT_GOT_TEA_HOUSE_PETAL
	faceplayer
	opentext
	writetext GlintTeaHouseNPCText1
	waitbutton
	verbosegiveitem FLOWER_PETAL
	iffalse .NoRoom
	closetext
	end
.done
	jumptextfaceplayer GlintTeaHouseNPCText2
.NoRoom
	writetext GlintTeaHouseNPCText3
	waitbutton
	closetext
	end
	
GlintTeaHouseNPCText1:
	text "My grandma brews"
	line "FLOWER PETALS from"
	cont "GLINT GROVE into"
	cont "a tasty tea."

	para "#MON love it!"
	
	para "Here, have one."
	done
	
GlintTeaHouseNPCText2:
	text "My grandma brews"
	line "FLOWER PETALS from"
	cont "GLINT GROVE into"
	cont "a tasty tea."

	para "#MON love it!"
	done
	
GlintTeaHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Oh well!"
	done
