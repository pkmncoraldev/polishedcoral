LuminaTown_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, LuminaTownFlyPoint

	db 7 ; warp events
	warp_def 17, 27, 1, LUMINA_HEALER_HOUSE
	warp_def 12, 14, 1, LUMINA_HOUSE_1
	warp_def  6, 24, 1, LUMINA_ADMIN_HOUSE
	warp_def  7, 46, 1, LUMINA_ELDERS_HOUSE
	warp_def  8, 30, 1, LUMINA_RUSS_HOUSE
	warp_def 13,  6, 1, LUMINA_TOWN_CAVE
	warp_def  9,  5, 2, LUMINA_TOWN_CAVE

	db 0 ; coord events

	db 14 ; bg events
	signpost 20, 20, SIGNPOST_JUMPTEXT, LuminaTownSignText
	signpost 16, 38, SIGNPOST_JUMPTEXT, LuminaTownElderHouseSignText
	signpost  7, 16, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  7, 19, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  9, 44, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  2, 37, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost 14, 19, SIGNPOST_READ, LuminaTownBigStatue
	signpost 14, 20, SIGNPOST_READ, LuminaTownBigStatue
	signpost 15, 19, SIGNPOST_READ, LuminaTownBigStatue
	signpost 15, 20, SIGNPOST_READ, LuminaTownBigStatue
	signpost 16, 19, SIGNPOST_READ, LuminaTownBigStatue
	signpost 16, 20, SIGNPOST_READ, LuminaTownBigStatue
	signpost 16, 25, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText
	signpost 17, 25, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText

	db 3 ; object events
	person_event SPRITE_GRANNY, 20, 17, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LuminaTownNPC, -1
	person_event SPRITE_POKEFAN_M, 11, 17, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPCWoman, -1
	person_event SPRITE_CHILD, 13, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPCKid, -1
	itemball_event 14,  9, DRAGON_FANG, 1, EVENT_LUMINA_TOWN_ITEMBALL
	tmhmball_event 37,  3, TM_DRAGON_PULSE, EVENT_TM59
	
	
LuminaTownFlyPoint:
	setflag ENGINE_FLYPOINT_LUMINA
	setevent EVENT_REACHED_LUMINA
	return
	
LuminaTownNPCWoman:
	jumptextfaceplayer LuminaTownNPCWomanText
	
LuminaTownNPCWomanText:
	text "This is a good"
	line "place to raise a"
	cont "child."
	
	para "Then again, my"
	line "son sure is shy"
	cont "for his age."
	
	para "I wonder, is a bit"
	line "of excitement is"
	cont "important for a"
	cont "kid's development?"
	done
	
LuminaTownNPCKid:
	jumptextfaceplayer LuminaTownNPCKidText
	
LuminaTownNPCKidText:
	text "…<WAIT_L>Hi."
	
	para "I wanna train a"
	line "#MON just like"
	cont "you!"
	done
	
LuminaTownNPC:
	checkevent EVENT_PLAYER_IS_FEMALE
	iftrue .girl
	jumptextfaceplayer LuminaTownNPCText1_boy
.girl
	jumptextfaceplayer LuminaTownNPCText1_girl
	
LuminaTownNPCText1_boy:
	text "We almost never"
	line "see strangers,"
	cont "but you're the"
	cont "second one now."
	
	para "First that other"
	line "boy, and now you."
	
	para "What's the"
	line "occassion?"
	done
	
LuminaTownNPCText1_girl:
	text "We almost never"
	line "see strangers,"
	cont "but you're the"
	cont "second one now."
	
	para "First that boy,"
	line "and now you."
	
	para "What's the"
	line "occassion?"
	done
	
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
	checkevent EVENT_DRAGON_SHRINE_DONE
	iftrue .talked
	writetext LuminaTownNPC2Text1
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
	line "up front."
	done
	
LuminaTownBigStatueLegendText1:
	text "An imposing statue"
	line "of a legendary"
	cont "dragon #MON."
	
	para "It is dull and"
	line "tarnished."
	
	para "There is a plaque"
	line "under it."
	
	para "Read it?"
	done
	
LuminaTownBigStatueLegendText2:
	text "You can only make"
	line "out a few parts:"
	
	para "THE DRAGON STONE"
	
	para "Long ago, before…"
	
	para "…dragon descended"
	line "upon the land…"
	
	para "…formed from the"
	line "dragon's…"
	
	para "…climbed high up"
	line "the mountia…"
	
	para "…and tore its"
	line "flesh…"
	
	para "…small jade pearl…"
	
	para "When the best of"
	line "your kind returns"
	cont "and presents it, I"
	cont "will show myself…"
	
	para "…"
	
	para "The rest is worn"
	line "away."
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
	