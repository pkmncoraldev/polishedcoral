Route10Tent_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  5, ROUTE_10_EAST, 1
	warp_event  1,  5, ROUTE_10_EAST, 1
	

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_ROCKER,  3,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route10TentNPC, -1
	object_event 0, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, WIGGLYTUFF, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route10TentWigglytuff, -1
	
	
	const_def 1 ; object constants
	const ROUTE_10_TENT_NPC
	const ROUTE_10_TENT_WIGGLYTUFF
	
Route10TentNPC:
	faceplayer
	opentext
	checkevent EVENT_ICE_TEMPLE_GOT_TREASURE
	iftrue .got_treasure
	writetext Route10TentNPCText1
	waitbutton
	jump .end
.got_treasure
	checkevent EVENT_TALKED_TO_TENT_GUY_WITH_TREASURE
	iftrue .have_talked
	setevent EVENT_TALKED_TO_TENT_GUY_WITH_TREASURE
	writetext Route10TentNPCText3
	waitbutton
	writetext Route10TentNPCText4
	playsound SFX_LEVEL_UP
	waitsfx
	waitbutton
	closetext
	pause 5
	spriteface ROUTE_10_TENT_NPC, UP
	pause 10
	opentext
	writetext Route10TentNPCText7
	waitbutton
	closetext
	pause 25
	opentext
	writetext Route10TentNPCText8
	waitbutton
	closetext
	pause 10
	spriteface ROUTE_10_TENT_NPC, DOWN
	opentext
	writetext Route10TentNPCText9
	waitbutton
	verbosegiveitem AMULET_COIN
	jump .end
.have_talked
	writetext Route10TentNPCText2
	waitbutton
.end
	closetext
	spriteface ROUTE_10_TENT_NPC, RIGHT
	end
	
Route10TentWigglytuff:
	opentext
	writetext Route10TentWigglytuffText
	cry WIGGLYTUFF
	waitbutton
	closetext
	end
	
Route10TentNPCText1:
	text "Are you here"
	line "looking for the"
	cont "treasure too?"
	
	para "There is record"
	line "of a ruined temple"
	cont "deep within the"
	cont "caves near here."
	
	para "Rumor has it, at"
	line "the heart of the"
	cont "temple lies an"
	cont "ancient treasure"
	cont "of untold worth!"
	
	para "I'm not having any"
	line "luck finding it,"
	cont "however."
	
	para "Make sure you let"
	line "me know if you get"
	cont "any leads!"
	done
	
Route10TentNPCText2:
;	text "I work at a"
;	line "RESEARCH LAB in"
;	cont "SHIMMER CITY."
	
;	para "This looks just"
;	line "like an artifact"
;	cont "we have there."
	
;	para "There's a great"
;	line "researcher there"
;	cont "named UNFINISHED."
	
;	para "You should take it"
;	line "to him and see if"
;	cont "he knows anything"
;	cont "about it."
	
;	para "We could have a"
;	line "big find here!"
;	done

	text "We could have a"
	line "big find here!"
	
	para "I need to stay"
	line "a bit longer and"
	cont "wrap some things"
	cont "up here."
	done
	
Route10TentNPCText3:
	text "What?"
	
	para "You say you found"
	line "the ruins and beat"
	cont "the beast guarding"
	cont "it?"
	
	para "Did you find the"
	line "treasure?"
	
	para "You did!"
	
	para "You've gotta let"
	line "me see it!"
	done
	
Route10TentNPCText4:
	text "<PLAYER> showed"
	line "off the CLAY POT."
	done
	
Route10TentNPCText5:
	text "Come on kid!"
	
	line "I'm begging here!"
	done
	
Route10TentNPCText6:
	text "You've gotta let"
	line "me see it!"
	done
	
Route10TentNPCText7:
	text "Hmm…"
	done
	
Route10TentNPCText8:
	text "It looks like a"
	line "useless CLAY POT…"
	
	para "…"
	
	para "But wait!"
	
	para "I've seen a pot"
	line "like this before!"
	
	para "I wonder…"
	
	para "Could they be"
	line "connected?"
	done
	
Route10TentNPCText9:
;	text "Ok, kid!"
	
;	para "I work at a"
;	line "RESEARCH LAB in"
;	cont "SHIMMER CITY."
	
;	para "This looks just"
;	line "like an artifact"
;	cont "we have there."
	
;	para "There's a great"
;	line "researcher there"
;	cont "named UNFINISHED."
	
;	para "You should take it"
;	line "to him and see if"
;	cont "he knows anything"
;	cont "about it."
	
;	para "We could have a"
;	line "big find here!"
	
;	para "I need to stay"
;	line "a bit longer and"
;	cont "wrap some things"
;	cont "up here."
	
;	para "For now, though,"
;	line "take this as a"
;	cont "thank you."
	
;	para "It's said to bring"
;	line "great fortune!"
;	done

	text "We could have a"
	line "big find here!"
	
	para "I need to stay"
	line "a bit longer and"
	cont "wrap some things"
	cont "up here."
	
	para "For now, though,"
	line "take this as a"
	cont "thank you."
	
	para "It's said to bring"
	line "great fortune!"
	done
	
Route10TentWigglytuffText:
	text "WIGGLYTUFF: Tuff!"
	line "Tuff!"
	done
