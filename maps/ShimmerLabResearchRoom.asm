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
	checkevent EVENT_DESERT_TEMPLE_2_POKE_BALL
	iftrue .done_desert
	checkevent EVENT_TALKED_TO_TENT_GUY_WITH_TREASURE
	iftrue .checkpot
	writetext ShimmerLabResearchRoomProfText1
	waitbutton
	closetext
	end
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
.done_desert
	checkitem BLACK_PEARL
	iffalse .gave_pearl
	writetext ShimmerLabResearchRoomProfText6
	waitbutton
	writetext ShimmerLabResearchRoomPearlText
	takeitem BLACK_PEARL
	playsound SFX_LEVEL_UP
	waitsfx
	waitbutton
	closetext
	spriteface SHIMMER_LAB_RESEARCH_ROOM_PROF, UP
	pause 15
	opentext
	writetext ShimmerLabResearchRoomProfText7
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext ShimmerLabResearchRoomProfText8
	buttonsound
	verbosegivetmhm TM_DIVE
;	setevent EVENT_GOT_HM05_DIVE
;	setflag ENGINE_GOT_DIVE
	writetext ShimmerLabResearchRoomProfText9
	buttonsound
	farwritetext StdBlankText
	pause 6
.gave_pearl
	writetext ShimmerLabResearchRoomProfText10
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
	
ShimmerLabResearchRoomPearlText:
	text "<PLAYER> handed"
	line "over the"
	cont "BLACK PEARL!"
	done

ShimmerLabResearchRoomProfText1:
	text "My name is"
	line "PROF. HILL."
	
	para "We are looking"
	line "into rumors of"
	cont "ancient ruins seen"
	cont "across the ONWA"
	cont "REGION."
	
	para "We have sent a"
	line "researcher off to"
	cont "ROUTE 10 near"
	cont "TWINKLE TOWN."
	
	para "You should pay him"
	line "a visit if you're"
	cont "interested."
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
	line "the desert on a"
	cont "nearby island."
	
	para "To find such a"
	line "similar artifact"
	cont "so far from the"
	cont "first…"
	
	para "Very interesting"
	line "indeed!"
	
	para "It could imply the"
	line "existence of a"
	cont "similar temple to"
	cont "the one you found"
	cont "yours in."
	
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
	line "to a town called"
	cont "PUEBLO BRILLO."
	
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
	
ShimmerLabResearchRoomProfText6:
	text "Ah, you've"
	line "returned."
	
	para "Did you find any"
	line "information?"
	
	para "…"
	
	para "What!?"
	
	para "You found a temple"
	line "in the desert?"
	
	para "I knew it!"
	
	para "What was inside?"
	done
	
ShimmerLabResearchRoomProfText7:
	text "Unbelievable!"
	
	para "Such color!"
	line "Such luster!"
	
	para "It's beautiful…"
	done
	
ShimmerLabResearchRoomProfText8:
	text "Ahem!"
	
	para "There's no doubt"
	line "about it."
	
	para "It's a genuine"
	line "BLACK PEARL!"
	
	para "Similar pearls"
	line "have been found in"
	cont "the waters NORTH"
	cont "of here."
	
	para "However, they are"
	line "very rare."
	
	para "To find such a"
	line "pearl so deep in"
	cont "the desert…"
	
	para "Could there be a"
	line "connection between"
	cont "the two locations?"
	
	para "…"
	
	para "Well, regardless,"
	line "I should reward"
	cont "you for your"
	cont "assistance."
	done
	
ShimmerLabResearchRoomProfText9:
	text "That TM contains"
	line "the move DIVE."
	
	para "It allows you to"
	line "dive underwater"
	cont "at certain spots."
	
	para "Since it isn't an"
	line "HM, you do need to"
	cont "teach it to your"
	cont "#MON to use it"
	cont "outside of battle."
	
	para "However, you don't"
	line "a badge."
	done
	
ShimmerLabResearchRoomProfText10:
	text "If you use DIVE to"
	line "explore the water"
	cont "to the NORTH,"
	cont "keep a look out."
	
	para "There could be a"
	line "connection between"
	cont "the desert temple"
	cont "and the PEARLs"
	cont "found there."
	
	para "If you find any"
	line "information,"
	cont "let me know!"
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
	