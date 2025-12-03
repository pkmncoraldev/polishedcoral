LuminaTown_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 15 ; bg events
	signpost 18, 19, SIGNPOST_JUMPTEXT, LuminaTownSignText
	signpost 16, 25, SIGNPOST_JUMPTEXT, LuminaTownHealerSignText
	signpost 14, 37, SIGNPOST_JUMPTEXT, LuminaTownElderHouseSignText
	signpost  5, 14, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  5, 17, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 11, 37, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  1, 35, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 13, 45, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 11, 47, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 12, 17, SIGNPOST_READ, LuminaTownBigStatue
	signpost 12, 18, SIGNPOST_READ, LuminaTownBigStatue
	signpost 13, 17, SIGNPOST_READ, LuminaTownBigStatue
	signpost 13, 18, SIGNPOST_READ, LuminaTownBigStatue
	signpost 14, 17, SIGNPOST_READ, LuminaTownBigStatue
	signpost 14, 18, SIGNPOST_READ, LuminaTownBigStatue

	db 6 ; object events
	person_event SPRITE_GRANNY,  4, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaTownNPC1, EVENT_LUMINA_LADIES_1_GONE
	person_event SPRITE_GRANNY,  4, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPC1, EVENT_LUMINA_LADIES_1_GONE
	person_event SPRITE_GRANNY,  4, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaTownNPC2, EVENT_LUMINA_LADIES_2_GONE
	person_event SPRITE_GRANNY,  4, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPC2, EVENT_LUMINA_LADIES_2_GONE
	itemball_event 27, 11, DRAGON_FANG, 1, EVENT_LUMINA_TOWN_ITEMBALL
	tmhmball_event 37,  2, TM_DRAGONBREATH, EVENT_LUMINA_TOWN_DRAGON_BREATH_TM
	
	
LuminaTownNPC1:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_LUMINA_LADIES
	iftrue .talked
	writetext LuminaTownNPC1Text1
	setevent EVENT_TALKED_TO_LUMINA_LADIES
	jump .finish
.talked
	writetext LuminaTownNPC1Text2
.finish
	waitbutton
	closetext
	end

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
	
LuminaTownSmallStatueText:
	text "A smaller statue"
	line "depicting the same"
	cont "#MON as the one"
	cont "in the center of"
	cont "town."
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
	
	para "There is a plaque"
	line "up front depicting"
	cont "the legend of the"
	cont "DRAGON STONE."
	done
	
LuminaTownBigStatueLegendText1:
	text "An imposing statue"
	line "of a legendary"
	cont "dragon #MON."
	
	para "There is a plaque"
	line "under it depicting"
	cont "the legend of the"
	cont "DRAGON STONE."
	
	para "Read it?"
	done
	
LuminaTownBigStatueLegendText2:
	text "big dragon like"
	line "the stone a lot :)"
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
	