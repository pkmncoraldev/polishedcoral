ShimmerLabResearchRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  9, SHIMMER_LAB_LOBBY, 3
	warp_event  6,  9, SHIMMER_LAB_LOBBY, 3

	db 0 ; coord events

	db 7 ; bg events
	signpost  1,  2, SIGNPOST_UP, ShimmerLabBooks
	signpost  1,  3, SIGNPOST_UP, ShimmerLabBooks
	signpost  1,  4, SIGNPOST_UP, ShimmerLabBooks
	signpost  1,  5, SIGNPOST_UP, ShimmerLabBooks
	signpost  5,  7, SIGNPOST_UP, ShimmerLabBooks
	signpost  5,  8, SIGNPOST_UP, ShimmerLabBooks
	signpost  5,  9, SIGNPOST_UP, ShimmerLabBooks

	db 3 ; object events
	person_event SPRITE_SCIENTIST_F,  2,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerLabResearchRoomProf, -1
	person_event SPRITE_SCIENTIST,  4,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabResearchNPC1, -1
	person_event SPRITE_SCIENTIST,  7,  0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabResearchNPC2, -1
	
	
	const_def 1 ; object constants
	const SHIMMER_LAB_RESEARCH_ROOM_PROF
	const SHIMMER_LAB_RESEARCH_ROOM_NPC1
	const SHIMMER_LAB_RESEARCH_ROOM_NPC2
	
ShimmerLabResearchRoomProf:
	faceplayer
	opentext
;	checkevent EVENT_TALKED_TO_TENT_GUY_WITH_TREASURE
;	iftrue .checkpot
;	writetext ShimmerLabResearchRoomProfText1
;	waitbutton
;	closetext
;	end
.checkpot
	checkitem CLAY_POT
	iftrue .startquest
	jump .startquest_end
.startquest
	writetext ShimmerLabResearchRoomProfText2
	waitbutton
	writetext ShimmerLabResearchRoomPotText
	takeitem CLAY_POT
	playsound SFX_LEVEL_UP
	setevent EVENT_CAN_GO_TO_DESERT
	clearevent EVENT_ROUTE_10_EAST_POKE_BALL_BLIZZARD
	domaptrigger ROUTE_10_EAST, $2
	waitsfx
	waitbutton
	closetext
	spriteface SHIMMER_LAB_RESEARCH_ROOM_PROF, UP
	pause 15
	opentext
	writetext ShimmerLabResearchRoomProfText3
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext ShimmerLabResearchRoomProfText4
	buttonsound
	farwritetext StdBlankText
	pause 6
.startquest_end
	writetext ShimmerLabResearchRoomProfText5
	waitbutton
	closetext
	end
	
ShimmerLabResearchNPC1:
	faceplayer
	opentext
	writetext ShimmerLabResearchRoomNPC1Text
	waitbutton
	closetext
	spriteface SHIMMER_LAB_RESEARCH_ROOM_NPC1, UP
	end
	
ShimmerLabResearchNPC2:
	faceplayer
	opentext
	writetext ShimmerLabResearchRoomNPC2Text
	waitbutton
	closetext
	spriteface SHIMMER_LAB_RESEARCH_ROOM_NPC2, UP
	end

ShimmerLabResearchRoomPotText:
	text "<PLAYER> handed"
	line "over the CLAY POT!"
	done

ShimmerLabResearchRoomProfText1:
	text "My name is"
	line "PROF. HILL."
	
	para "We have found"
	line "evidence of an"
	cont "ancient temple in"
	cont "the desert on a"
	cont "nearby island."
	
	para "More reasearch is"
	line "required…"
	done
	
ShimmerLabResearchRoomProfText2:
	text "My name is"
	line "PROF. HILL."
	
	para "You met one of our"
	line "researchers near"
	cont "TWINKLE TOWN,"
	cont "right?"
	
	para "He mentioned that"
	line "you discovered"
	cont "an artifact that"
	cont "matches one we"
	cont "have here."
	
	para "May I see it?"
	done
	
ShimmerLabResearchRoomProfText3:
	text "Hmm…"
	
	para "I see…"
	done
	
ShimmerLabResearchRoomProfText4:
	text "It is slightly"
	line "different than the"
	cont "one we have here."
	
	para "However, it IS"
	line "very similar."
	
	para "We found ours in"
	cont "the desert on a"
	cont "nearby island."
	
	para "To find such a"
	line "similar artifact"
	cont "so far from the"
	cont "first…"
	
	para "Very interesting"
	line "indeed!"
	
	para "It could imply the"
	line "existence of another"
	cont "ruined temple on"
	cont "the island."
	
	para "We need to follow"
	line "this lead."
	
	para "If you'd continue"
	line "to assist us, it"
	cont "would be most"
	cont "appreicated!"
	done
	
ShimmerLabResearchRoomProfText5:
	text "Take the boat from"
	line "the harbor here in"
	cont "PORT SHIMMER."
	
	para "They'll take you"
	line "to BRILLO TOWN."
	
	para "We have a research"
	line "team stationed"
	cont "in the desert"
	cont "nearby."
	
	para "They are searching"
	line "for the remains of"
	cont "an ancient temple."
	
	para "See if you can"
	line "help them track"
	cont "down any leads."
	done
	
ShimmerLabResearchRoomNPC1Text:
	text "We are researching"
	line "ancient civiliza-"
	cont "tions."
	done
	
ShimmerLabResearchRoomNPC2Text:
	text "The smallest disc-"
	line "overies can have"
	cont "HUGE implications"
	cont "when it comes to"
	cont "archaeology."
	done
	