LuminaTown_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 17, 25, 1, LUMINA_HEALER_HOUSE
	warp_def 12, 12, 1, LUMINA_HOUSE_1
	warp_def  8, 28, 1, LUMINA_HOUSE_2
	warp_def  7, 44, 1, LUMINA_ELDERS_HOUSE

	db 0 ; coord events

	db 17 ; bg events
	signpost 20, 17, SIGNPOST_JUMPTEXT, LuminaTownSignText
	signpost  0,  0, SIGNPOST_JUMPTEXT, LuminaTownHealerSignText
	signpost 16, 37, SIGNPOST_JUMPTEXT, LuminaTownElderHouseSignText
	signpost  7, 14, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  7, 17, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 13, 37, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  3, 35, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 15, 45, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 13, 47, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 14, 17, SIGNPOST_READ, LuminaTownBigStatue
	signpost 14, 18, SIGNPOST_READ, LuminaTownBigStatue
	signpost 15, 17, SIGNPOST_READ, LuminaTownBigStatue
	signpost 15, 18, SIGNPOST_READ, LuminaTownBigStatue
	signpost 16, 17, SIGNPOST_READ, LuminaTownBigStatue
	signpost 16, 18, SIGNPOST_READ, LuminaTownBigStatue
	signpost 16, 23, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText
	signpost 17, 23, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText

	db 2 ; object events
	
	itemball_event  8,  8, DRAGON_FANG, 1, EVENT_LUMINA_TOWN_ITEMBALL
	tmhmball_event 37,  4, TM_DRAGONBREATH, EVENT_LUMINA_TOWN_DRAGON_BREATH_TM
	
	
LuminaTownNPC1:
	checkevent EVENT_LUMINA_TOWN_UNDER_ATTACK
	iffalse .early
	checkevent EVENT_TALKED_TO_LUMINA_LADIES
	iftrue .talked
	setevent EVENT_TALKED_TO_LUMINA_LADIES
	jumptextfaceplayer LuminaTownNPC1Text1
.talked
	jumptextfaceplayer LuminaTownNPC1Text2
.early
	jumptextfaceplayer LuminaTownNPC1Text3

LuminaTownNPC1Text1:
	text "Ahead is the way"
	line "to the shrine."
	
	para "A foolish child"
	line "pushed past with-"
	cont "out permission!"
	
	para "He claims that the"
	line "dragon will recog-"
	cont "nize him as the"
	cont "chosen one."
	
	para "Please, seek out"
	line "the ELDER at once."
	
	para "You mustn't enter"
	line "the shrine without"
	cont "permission."
	done
	
LuminaTownNPC1Text2:
	text "Please, seek out"
	line "the ELDER at once."
	
	para "You mustn't enter"
	line "the shrine without"
	cont "permission."
	done
	
LuminaTownNPC1Text3:
	text "Ahead is the way"
	line "to the shrine."
	
	para "You mustn't enter"
	line "the shrine without"
	cont "permission."
	done
	
LuminaTownNPC2:
	faceplayer
	opentext
	checkevent EVENT_DONE_DRAGON_SHRINE
	iftrue .talked
	writetext LuminaTownNPC2Text1
	setevent EVENT_DONE_DRAGON_SHRINE
	jump .finish
.talked
	writetext LuminaTownNPC2Text2
.finish
	waitbutton
	closetext
	end
	
	
LuminaTownNPC2Text1:
	text "You have been"
	line "acknowledged as"
	cont "worthy."
	
	para "Please, enter the"
	line "shrine at once!"
	done
	
LuminaTownNPC2Text2:
	text "The dragon did"
	line "not apprear when"
	cont "offered the stone?"
	
	para "But what of our"
	line "legend?"
	done
	
LuminaTownBarrelsText:
	text "Large barrels too"
	line "heavy to move."
	done
	
LuminaTownSmallStatueText:
	text "A smaller statue"
	line "depicting the same"
	cont "#MON as in the"
	cont "center of town."
	done
	
LuminaTownBigStatue:
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	jumptext LuminaTownBigStatueText
.YouAreFacingUp
	opentext
	writetext LuminaTownBigStatueLegendText1
	yesorno
	iffalse .end
	writetext LuminaTownBigStatueLegendText2
	waitbutton
.end
	closetext
	end
	
LuminaTownBigStatueText:
	text "An imposing statue"
	line "of a legendary"
	cont "dragon #MON."
	
	para "It is dull and"
	line "tarnished."
	
	para "There is a plaque"
	line "up front depicting"
	cont "the legend of the"
	cont "DRAGON STONE."
	done
	
LuminaTownBigStatueLegendText1:
	text "An imposing statue"
	line "of a legendary"
	cont "dragon #MON."
	
	para "It is dull and"
	line "tarnished."
	
	para "There is a plaque"
	line "under it depicting"
	cont "the legend of the"
	cont "DRAGON STONE."
	
	para "Read it?"
	done
	
LuminaTownBigStatueLegendText2:
	text "TODO: DRAGON STONE"
	line "LEGEND PART"
	done
	
LuminaTownSignText:
	text "LUMINA TOWN"
	
	para "A town steeped"
	line "in tradition."
	done
	
LuminaTownHealerSignText:
	text "HEALER's HOUSE"
	done
	
LuminaTownElderHouseSignText:
	text "ELDER's HOUSE"
	line "ahead."
	done
	