GlintPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 1, GLINT_CITY
	warp_def 7, 4, 1, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_FISHING_GURU, 5, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc1, -1
	person_event SPRITE_GENTLEMAN, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc2, -1
	person_event SPRITE_SCHOOLBOY,  2,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc3, -1
	person_event SPRITE_GRANNY,  6,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintPokeCenterTeaLady, -1

	const_def 1 ; object constants
	const GLINT_POKECENTER_NURSE
	const GLINT_POKECENTER_CHANSEY
	const GLINT_POKECENTER_NPC1
	const GLINT_POKECENTER_NPC2
	const GLINT_POKECENTER_NPC3
	const GLINT_POKECENTER_TEA_LADY
	
GlintPokeCenterTeaLady:
	faceplayer
	opentext
	checkevent EVENT_GLINT_CENTER_TALKED_TO_OLD_LADY
	iftrue .alreadytalked
	writetext GlintPokeCenterTeaLadyText5
	jump .cont
.alreadytalked
	writetext GlintPokeCenterTeaLadyText1
.cont
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
	writetext GlintPokeCenterTeaLadyTextGivePetals
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext GlintPokeCenterTeaLadyText3
	waitbutton
	closetext
	spriteface GLINT_POKECENTER_TEA_LADY, RIGHT
	pause 40
	setlasttalked GLINT_POKECENTER_TEA_LADY
	faceplayer
	opentext
	writetext GlintPokeCenterTeaLadyText6
	waitbutton
	verbosegiveitem BLOSSOM_TEA
	setevent EVENT_GLINT_CENTER_TALKED_TO_OLD_LADY
.no
	writetext GlintPokeCenterTeaLadyText7
	waitbutton
	closetext
	end
.three
	giveitem FLOWER_PETAL
.two
	giveitem FLOWER_PETAL
.one
	giveitem FLOWER_PETAL
	writetext GlintPokeCenterTeaLadyText4
	waitbutton
	closetext
	end
.none
	writetext GlintPokeCenterTeaLadyText2
	waitbutton
	closetext
	end
	
GlintPokeCenterNpc1:
	jumptextfaceplayer GlintPokeCenterNpc1Text

GlintPokeCenterNpc2:
	jumptextfaceplayer GlintPokeCenterNpc2Text

GlintPokeCenterNpc3:
	jumptextfaceplayer GlintPokeCenterNpc3Text

GlintPokeCenterTeaLadyTextGivePetals:
	text "<PLAYER> handed"
	line "over the FLOWER"
	cont "PETALS."
	done
	
GlintPokeCenterTeaLadyText1:
	text "Care for some more"
	line "tea, sweetie?"
	
	para "I'd be happy to"
	line "make you some if"
	cont "you have 4 FLOWER"
	cont "PETALS."
	done
	
GlintPokeCenterTeaLadyText2:
	text "Oh! You don't have"
	line "any FLOWER PETALS!"
	
	para "Off to the grove"
	line "to find some!"
	done
	
GlintPokeCenterTeaLadyText3:
	text "Alright, sweetie!"
	
	para "Coming right up!"
	done
	
GlintPokeCenterTeaLadyText4:
	text "Sorry sweetie…"
	
	para "I need 4 FLOWER"
	line "PETALS to make"
	cont "you some tea."
	
	para "Off to the grove"
	line "to find some more!"
	done
	
GlintPokeCenterTeaLadyText5:
	text "FLOWER PETALS from"
	line "GLINT GROVE can be"
	cont "brewed into a"
	cont "tasty tea."

	para "#MON love it!"
	
	para "I often go to the"
	line "grove to collect"
	cont "them myself."
	
	para "If you bring me 4"
	line "FLOWER PETALS,"
	
	para "I'd be more then"
	line "happy to make you"
	cont "some tea."
	
	para "How about it?"
	done
	
GlintPokeCenterTeaLadyText6:
	text "Here we go!"
	done
	
GlintPokeCenterTeaLadyText7:
	text "I'll be here if you"
	line "ever want some"
	cont "tea."
	done
	
GlintPokeCenterNpc1Text:
	text "Our GYM LEADER"
	line "specializes in"
	cont "NORMAL TYPE"
	cont "#MON."
	
	para "NORMAL doesn't"
	line "have many"
	cont "strengths,"
	
	para "but it doesn't"
	line "have many"
	cont "weaknesses either."
	done

GlintPokeCenterNpc2Text:
	text "There is a grove"
	line "NORTH of GLINT"
	cont "CITY."
	
	para "FAIRY TYPE #MON"
	line "seem to be drawn"
	
	para "to it for some"
	line "reason."
	done

GlintPokeCenterNpc3Text:
	text "You can store you"
	line "#MON in the PCs"
	cont "at every #MON"
	cont "CENTER."
	
	para "Each box can store"
	line "up to 20 #MON."
	
	para "Make sure to"
	line "change boxes when"
	cont "they get full,"
	
	para "or you won't be"
	line "able to catch"
	cont "anymore #MON."
	done