Route5Gate1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route5Gate1FCallback

	db 5 ; warp events
	warp_def  0, 11, 1, ROUTE_5
	warp_def  0, 12, 2, ROUTE_5
	warp_def  7, 11, 1, ROUTE_6
	warp_def  7, 12, 1, ROUTE_6
	warp_def  2,  0, 1, ROUTE_5_GATE_2F

	db 0 ; coord events

	db 2 ; bg events
	signpost  4,  8, SIGNPOST_READ, Route5Gate1FSign1
	signpost  2,  1, SIGNPOST_READ, Route5Gate1FSign2

	db 6 ; object events
	person_event SPRITE_OFFICER,  3, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19ab0b, -1
	object_event  6,  2, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, pokemart, MARTTYPE_REFRESHMENTS, MART_ROUTE_5_GATE, -1
	person_event SPRITE_POKEMANIAC,  7,  3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC1, -1
	person_event SPRITE_CAMPER,  2, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC2, -1
	person_event SPRITE_HIKER,  4, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC3, -1
	person_event SPRITE_CUTE_GIRL,  2,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route5Gate1FNPC4, -1

	const_def 1 ; object constants
	const ROUTE5GATE_OFFICER
	const ROUTE5GATE_CLERK
	const ROUTE5GATE_NPC1
	const ROUTE5GATE_NPC2
	const ROUTE5GATE_NPC3
	const ROUTE5GATE_NPC4
	
	
Route5Gate1FCallback:
	checkevent EVENT_ROUTE_5_GATE_1F_GIRL
	iffalse .end
	moveperson ROUTE5GATE_NPC4, $3, $2
.end
	return
	
OfficerScript_0x19ab0b:
	faceplayer
	opentext
	writetext UnknownText_0x19ab1f
	waitbutton
	closetext
	end

Route5Gate1FNPC1
	faceplayer
	opentext
	writetext Route5Gate1FNPC1Text
	waitbutton
	closetext
	spriteface ROUTE5GATE_NPC1, UP
	end
	
Route5Gate1FNPC2:
	jumptextfaceplayer Route5Gate1FNPC2Text
	
Route5Gate1FNPC3:
	jumptextfaceplayer Route5Gate1FNPC3Text
	
Route5Gate1FNPC4:
	faceplayer
	opentext
	checktmhm TM_FALSE_SWIPE
	iftrue .done
	checkevent EVENT_ROUTE_5_GATE_1F_GIRL
	iftrue .saidyes
	writetext Route5Gate1FNPC4Text1
	yesorno
	iffalse .no1
	writetext Route5Gate1FNPC4Text2
	yesorno
	iffalse .no2
	writetext Route5Gate1FNPC4Text3
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applyonemovement ROUTE5GATE_NPC4, step_right
	jump .cont
.YouAreFacingLeft
	applyonemovement ROUTE5GATE_NPC4, step_down
.cont
	setevent EVENT_ROUTE_5_GATE_1F_GIRL
	end
.no1
	writetext Route5Gate1FNPC4TextNo1
	waitbutton
	closetext
	end
.no2
	writetext Route5Gate1FNPC4TextNo2
	waitbutton
	closetext
	end
.no3
	writetext Route5Gate1FNPC4TextNo3
	waitbutton
	closetext
	end
.no4
	writetext Route5Gate1FNPC4TextNo4
	waitbutton
	closetext
	end
.saidyes
	writetext Route5Gate1FNPC4Text4
	yesorno
	iffalse .no3
	checkitem SODA_POP
	iffalse .no4
	writetext Route5Gate1FNPC4GiveText
	playsound SFX_LEVEL_UP 
	waitsfx
	writetext Route5Gate1FNPC4Text5
	waitbutton
	verbosegivetmhm TM_FALSE_SWIPE
	writetext Route5Gate1FNPC4Text6
	waitbutton
	closetext
	end
.done
	writetext Route5Gate1FNPC4Text7
	waitbutton
	closetext
	end
	
Route5Gate1FSign1:
	jumptext Route5Gate1FSign1Text
	
Route5Gate1FSign2:
	jumptext Route5Gate1FSign2Text
	
Route5Gate1FSign1Text:
	text "Refreshments"
	done
	
Route5Gate1FSign2Text:
	text "2ND FLOOR:"
	line "Viewing Platform"
	done
	
Route5Gate1FNPC1Text:
	text "The girl at the"
	line "REFRESHMENTS STALL"
	cont "sure is pretty!"
	
	para "She's kind of an"
	line "airhead, though."
	
	para "She accidentally"
	line "gave me some extra"
	cont "food!"
	done
	
Route5Gate1FNPC2Text:
	text "I sure am glad"
	line "there's a rest stop"
	cont "here."
	
	para "This road is long"
	line "and I'm tired!"
	done
	
Route5Gate1FNPC3Text:
	text "You'd be smart to"
	line "stop and take a"
	cont "break!"
	
	para "Plenty more road"
	line "ahead of ya!"
	done
	
Route5Gate1FNPC4Text1:
	text "Oh hi!"
	
	para "Are you trying to"
	line "use the ATM?"
	done
	
Route5Gate1FNPC4Text2:
	text "I thought so!"
	
	para "I'll move if you"
	line "promise to buy me"
	cont "a SODA POP!"
	
	para "How about it?"
	done
	
Route5Gate1FNPC4Text3:
	text "Ok then!"
	
	para "You'd better keep"
	line "your word!"
	done
	
Route5Gate1FNPC4Text4:
	text "So, didja bring"
	line "me a SODA POP like"
	cont "you promised?"
	done
	
Route5Gate1FNPC4Text5:
	text "Yay!"
	
	para "You kept your"
	line "word!"
	
	para "You're a good"
	line "person!"
	
	para "I'm sorry I blocked"
	line "the ATM earlier…"
	
	para "To make up for"
	line "blocking the ATM,"
	
	para "I'll give you"
	line "A… TM!"
	
	done
	
Route5Gate1FNPC4Text6:
	text "That TM contains"
	line "FALSE SWIPE!"
	
	para "No matter what,"
	line "that move won't KO"
	cont "the opponent!"
	
	para "It might not seem"
	line "very good,"
	
	para "but it's really"
	line "useful if you want"
	cont "to weaken a"
	cont "WILD #MON to"
	cont "catch it!"
	done
	
Route5Gate1FNPC4Text7:
	text "Thanks again for"
	line "keeping your word."
	
	para "The SODA POP was"
	line "really tasty!"
	done
	
Route5Gate1FNPC4TextNo1:
	text "Oh…"
	
	para "Nevermind, then…"
	done
	
Route5Gate1FNPC4TextNo2:
	text "Well then…"
	
	para "TOOOOOOO BAD!"
	done
	
Route5Gate1FNPC4TextNo3:
	text "Oh, but you"
	line "promised!"
	done
	
Route5Gate1FNPC4TextNo4:
	text "Huh?"
	
	para "You don't even"
	line "have a SODA POP!"
	
	para "What are you"
	line "trying to pull"
	cont "here?"
	done
	
Route5Gate1FNPC4GiveText:
	text "<PLAYER> handed"
	line "over a SODA POP."
	done
	
UnknownText_0x19ab1f:
	text "SOUTH of here is"
	line "SUNBEAM ISLAND."

	para "The #MON PROF."
	line "conductes his"
	cont "research on the"
	cont "island."
	done