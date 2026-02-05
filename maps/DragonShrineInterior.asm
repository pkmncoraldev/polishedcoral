DragonShrineInterior_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 75,  7, 1, LUMINA_GYM
	warp_def 75,  8, 2, LUMINA_GYM
	warp_def  1,  7, 1, ROUTE_1
	warp_def  1,  8, 1, ROUTE_1

	db 0 ; coord events

	db 8 ; bg events
	signpost  1,  7, SIGNPOST_JUMPTEXT, DragonShrineInteriorDoorText
	signpost  1,  8, SIGNPOST_JUMPTEXT, DragonShrineInteriorDoorText
	signpost  6,  7, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  6,  8, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  7,  7, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  7,  8, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  8,  7, SIGNPOST_READ, DragonShrineInteriorBigStatue
	signpost  8,  8, SIGNPOST_READ, DragonShrineInteriorBigStatue

	db 0 ; object events


DragonShrineInteriorDoorText:
	text "It looks like"
	line "someone broke"
	cont "down the door."
	done
	
DragonShrineInteriorBigStatue:
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	jumptext DragonShrineInteriorBigStatueText
.YouAreFacingUp
	opentext
	writetext DragonShrineInteriorBigStatueLegendText1
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText2
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText3
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText4
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText5
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText6
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText7
	yesorno
	iffalse .end
	writetext DragonShrineInteriorBigStatueLegendText8
	waitbutton
.end
	closetext
	end
	
DragonShrineInteriorBigStatueText:
	text "A familiar looking"
	line "statue."
	
	para "It shines, radiant"
	line "and untarnished."
	
	para "The plaque on the"
	line "the front seems"
	cont "undamaged."
	done
	
DragonShrineInteriorBigStatueLegendText1:
	text "A familiar looking"
	line "statue."
	
	para "It shines, radiant"
	line "and untarnished."
	
	para "The plaque under"
	line "it is undamaged."
	
	para "Read it?"
	done
	
DragonShrineInteriorBigStatueLegendText2:
	text "THE DRAGON STONE"
	
	para "Long ago, before"
	line "the age of men,"
	
	para "a dragon descended"
	line "upon the land,"
	cont "bare and formless."
	
	para "It parted its lips"
	line "and spoke,"
	
	para "and at this the"
	line "earth split open."
	
	para "Sweeping valleys,"
	line "heavenly peaks,"
	
	para "vast, coral-laden"
	line "oceans,"
	
	para "all formed from"
	line "the dragon's will."
	
	para "The ONWA region"
	line "was created."
	
	para "Satisfied, the"
	line "dragon took roost"
	cont "upon the tallest"
	cont "mountain."
	
	para "Keep reading?"
	done

DragonShrineInteriorBigStatueLegendText3:	
	text "Years passed."
	line "Then decades."
	
	para "Centuries came"
	line "and went."
	
	para "Beasts claimed"
	line "the wilderness,"
	
	para "while man created"
	line "settlements of"
	cont "his own."
	
	para "One of these towns"
	line "lay on the side of"
	cont "a mountain."
	
	para "The same on which"
	line "the dragon rested."
	
	para "Keep reading?"
	done
	
DragonShrineInteriorBigStatueLegendText4:	
	text "One day a boy from"
	line "the village left"
	cont "home."
	
	para "He climbed high"
	line "up the mountain."
	
	para "There he saw a"
	line "small beast."
	
	para "It was the son of"
	line "the great dragon."
	
	para "The boy approached"
	line "it, not with the"
	cont "malice so common"
	cont "to man,"
	
	para "but with grace and"
	line "and compassion."
	
	para "Seeing this, the"
	line "beast responded"
	cont "in kind."
	
	para "Keep reading?"
	done

DragonShrineInteriorBigStatueLegendText5:	
	text "Although they did"
	line "not speak the"
	cont "same tongue,"
	
	para "they came to"
	line "understand one"
	cont "another."
	
	para "Soon they became"
	line "inseparable."
	
	para "Their bond was"
	line "that of a #MON"
	cont "and its TRAINER."
	
	para "Seeing this, the"
	line "other beasts of"
	cont "the mountain grew"
	cont "envious."
	
	para "They vowed to make"
	line "the dragon's son"
	cont "suffer."
	
	para "Keep reading?"
	done

DragonShrineInteriorBigStatueLegendText6:
	text "One day, as the"
	line "two were together,"
	
	para "the beasts emerged"
	line "from the shadows."
	
	para "They bore down on"
	line "the dragon's son."
	
	para "They bit and they"
	line "gnashed, and tore"
	cont "its flesh asunder."
	
	para "It cried out, but"
	line "the boy stood by"
	cont "helplessly."
	
	para "Seeing the beasts'"
	line "might, he fled in"
	cont "fear."
	
	para "Keep reading?"
	done

DragonShrineInteriorBigStatueLegendText7:
	text "The next day, the"
	line "boy returned to"
	cont "the mountain."
	
	para "He searched for"
	line "his friend,"
	
	para "but he was nowhere"
	line "to be seen."
	
	para "In his place, the"
	line "boy found only a"
	cont "small jade pearl."
	
	para "The boy, overrun"
	line "with grief,"
	
	para "cast himself from"
	line "the mountain."
	
	para "Keep reading?"
	done

DragonShrineInteriorBigStatueLegendText8:
	text "The dragon then"
	line "descended from its"
	cont "pearch."
	
	para "It seized him as"
	line "he fell,"
	
	para "carrying him back"
	line "to safety."

	para "As it did, it "
	line "spoke to the boy:"
	
	para "“You loved my son,"
	line "and he loved you,"
	
	para "despite your"
	line "cowardice."
	
	para "Go now back to"
	line "your village."
	
	para "Cherish that stone"
	line "as you would his"
	cont "life."
	
	para "When the best of"
	line "your kind returns"
	cont "and presents it,"

	para "I will show myself"
	line "once more.”"
	
	para "Saying this, the"
	line "dragon returned to"
	cont "the peak,"
	
	para "hiding itself"
	line "away."
	done
	