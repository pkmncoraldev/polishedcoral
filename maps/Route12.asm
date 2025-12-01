Route12_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  5, 28, 3, ROUTE_12_GATE
	warp_def  5, 29, 4, ROUTE_12_GATE
	warp_def 45,  8, 1, AIRPORT_GATE
	warp_def 45,  9, 2, AIRPORT_GATE

	db 0 ; coord events

	db 2 ; bg events
	signpost 12, 28, SIGNPOST_JUMPTEXT, Route12SignText1
	signpost 39,  8, SIGNPOST_JUMPTEXT, Route12SignText2

	db 20 ; object events
	person_event SPRITE_SKATER, 26, 30, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route12Npc1, -1
	person_event SPRITE_SKATER, 25, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12Npc2, EVENT_ROUTE_12_SKATERS_GONE
	person_event SPRITE_SKATER, 30, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12Npc3, EVENT_ROUTE_12_SKATERS_GONE
	person_event SPRITE_FISHER, 19, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12Npc4, -1
	person_event SPRITE_PONYTAIL, 18, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route12Npc5, -1
	person_event SPRITE_YOUNGSTER,  9, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route12Npc6, -1
	person_event SPRITE_SKATER, 44, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route12Npc7, -1
	person_event SPRITE_POKEMANIAC, 21, 25, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route12Npc8, -1
	person_event SPRITE_COOLTRAINER_F, 37,  7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route12Npc9, -1
	person_event SPRITE_GENTLEMAN,  8, 32, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route12Npc10, -1
	person_event SPRITE_POKEFAN_M, 42,  5, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route12Npc11, -1
	person_event SPRITE_TEACHER, 32, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, Route12Trainer1, -1
	person_event SPRITE_CAMPER, 21,  4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, Route12Trainer2, -1
	person_event SPRITE_PICNICKER, 14,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, Route12Trainer3, -1
	person_event SPRITE_SKATER, 29, 34, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route12Trainer4, -1
	person_event SPRITE_SKATER, 29,  7, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route12Trainer5, -1
	person_event SPRITE_SUPER_NERD, 35, 18, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, Route12Trainer6, -1
	tapeball_event 24, 41, MUSIC_GSC_GAME_CORNER, 1, EVENT_MUSIC_GSC_GAME_CORNER
	fruittree_event 18, 25, FRUITTREE_ROUTE_12, FIGY_BERRY
	itemball_event 18,  8, MAX_POTION, 1, EVENT_ROUTE_12_POKE_BALL
	
	const_def 1 ; object constants
	const ROUTE_12_NPC1
	const ROUTE_12_NPC2
	const ROUTE_12_NPC3
	const ROUTE_12_NPC4
	const ROUTE_12_NPC5
	const ROUTE_12_NPC6
	const ROUTE_12_NPC7
	const ROUTE_12_NPC8
	const ROUTE_12_NPC9
	const ROUTE_12_NPC10
	const ROUTE_12_NPC11
	
Route12SignText1:
	text "ROUTE 12"
	
	para "NORTH:"
	line "LUSTER CITY"
	
	para "EAST:"
	line "SKATEPARK"
	
	para "SOUTH:"
	line "ONWA INTL AIRPORT"
	done
	
Route12SignText2:
	text "ROUTE 12"
	
	para "NORTH:"
	line "LUSTER CITY"
	
	para "EAST:"
	line "YOUR MOM"
	
	para "SOUTH:"
	line "ONWA INTL AIRPORT"
	
	para "…"
	
	para "Unless MOM's been"
	line "hanging out at the"
	cont "SKATEPARK,"
	
	para "it's obviously been"
	line "vandalized…"
	done
	
Route12Trainer1:
	generictrainer TEACHER, LYNN, EVENT_BEAT_ROUTE_12_TRAINER_1, .SeenText, .BeatenText

	text "Someone should do"
	line "something about"
	cont "those skater kids."
	
	para "They won't listen"
	line "to a word anyone"
	cont "tells them!"
	done

.SeenText:
	text "Those rowdy kids!"
	
	para "Someone should do"
	line "something about"
	cont "them!"
	done

.BeatenText:
	text "How rowdy!"
	done
	
Route12Trainer2:
	generictrainer CAMPER, EMILE, EVENT_BEAT_ROUTE_12_TRAINER_2, .SeenText, .BeatenText

	text "Before long this"
	line "park will be just"
	cont "more city!"
	done

.SeenText:
	text "This park is"
	line "smaller than it"
	cont "used to be."
	
	para "They keep putting"
	line "up more and more"
	cont "buildings!"
	done

.BeatenText:
	text "Oh well."
	done
	
Route12Trainer3:
	generictrainer PICNICKER, BAILEY, EVENT_BEAT_ROUTE_12_TRAINER_3, .SeenText, .BeatenText

	text "I shouldn't have"
	line "challenged you!"
	done

.SeenText:
	text "I came here for a"
	line "walk, but how"
	cont "about a battle?"
	done

.BeatenText:
	text "Oh no!"
	para "I lost!"
	done
	
Route12Trainer4:
	generictrainer SKATER, TONY, EVENT_BEAT_ROUTE_12_TRAINER_4, .SeenText, .BeatenText

	text "My bad."
	done

.SeenText:
	text "Wait up!"
	
	para "Show me what you"
	line "got!"
	done

.BeatenText:
	text "You're tough!"
	done
	
Route12Trainer5:
	generictrainer SKATER, ROD, EVENT_BEAT_ROUTE_12_TRAINER_5, .SeenText, .BeatenText

	text "In the grass, you"
	line "can't get enough"
	cont "speed to OLLIE."
	done

.SeenText:
	text "You can't skate"
	line "in the grass."
	
	para "So don't even try!"
	done

.BeatenText:
	text "I tried!"
	done
	
Route12Trainer6:
	generictrainer SUPER_NERD, TREV, EVENT_BEAT_ROUTE_12_TRAINER_6, .SeenText, .BeatenText

	text "Get outta here."

	para "Leave me be!"
	done

.SeenText:
	text "What do you want?"
	
	para "I just want to"
	line "be left alone!"
	done

.BeatenText:
	text "Go away!"
	done
	
Route12Npc1:
	faceplayer
	opentext
	writetext Route12Npc1Text
	waitbutton
	closetext
	spriteface ROUTE_12_NPC1, UP
	end
	
Route12Npc2:
	checkcode VAR_FACING
	if_equal DOWN, .yourefacingdown
	setevent EVENT_ROUTE_12_SKATERS_GONE
	jumptextfaceplayer Route12Npc2Text2
.yourefacingdown
	checkitem SKATEBOARD
	iffalse .no_board
	jumptextfaceplayer Route12Npc2Text1
.no_board
	jumptextfaceplayer Route12Npc2Text3
	
Route12Npc3:
	checkcode VAR_FACING
	if_equal DOWN, .yourefacingdown
	checkitem SKATEBOARD
	iffalse .no_board
	jumptextfaceplayer Route12Npc2Text1
.no_board
	jumptextfaceplayer Route12Npc2Text3
.yourefacingdown
	setevent EVENT_ROUTE_12_SKATERS_GONE
	jumptextfaceplayer Route12Npc2Text2
	
Route12Npc4:
	faceplayer
	opentext
	writetext Route12Npc4Text
	waitbutton
	closetext
	spriteface ROUTE_12_NPC4, DOWN
	end
	
Route12Npc5:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE
	iftrue .gotsand
	writetext Route12Npc5Text1
	waitbutton
	verbosegiveitem HARD_STONE
	iffalse .NoRoom
.gotsand
	writetext Route12Npc5Text2
	waitbutton
	closetext
	setevent EVENT_GOT_HARD_STONE
	spriteface ROUTE_12_NPC5, UP
	end
.NoRoom
	writetext Route12Npc5Text3
	waitbutton
	closetext
	spriteface ROUTE_12_NPC5, UP
	end
	
Route12Npc6:
	jumptextfaceplayer Route12Npc6Text
	
Route12Npc7:
	jumptextfaceplayer Route12Npc7Text
	
Route12Npc8:
	checkevent EVENT_ROUTE_12_SKATERS_GONE
	iftrue .skaters_gone
	jumptextfaceplayer Route12Npc8Text1
.skaters_gone
	jumptextfaceplayer Route12Npc8Text2
	
Route12Npc9:
	jumptextfaceplayer Route12Npc9Text
	
Route12Npc10:
	faceplayer
	opentext
	writetext Route12Npc10Text
	waitbutton
	closetext
	spriteface ROUTE_12_NPC10, DOWN
	end
	
Route12Npc11:
	faceplayer
	opentext
	writetext Route12Npc11Text
	waitbutton
	closetext
	spriteface ROUTE_12_NPC11, DOWN
	end
	
Route12Npc1Text:
	text "…or Die!"
	done
	
Route12Npc2Text1:
	text "Get lost, poser!"
	done
	
Route12Npc2Text2:
	text "What!?"
	
	para "How'd you get past?"
	done
	
Route12Npc2Text3:
	text "Skaters only!"
	
	para "Get lost, poser!"
	done
	
Route12Npc4Text:
	text "I love fishin'"
	line "at the park."
	
	para "You can cast your"
	line "rod right over"
	cont "the side."
	done
	
Route12Npc5Text1:
	text "I'm skipping rocks"
	line "on the pond."
	
	para "Here, take one."
	done
	
Route12Npc5Text2:
	text "Actually, wait."
	
	para "That looks like a"
	line "good one."
	
	para "Maybe you shouldn't"
	line "throw that one."
	done
	
Route12Npc5Text3:
	text "Oops."
	
	para "You're holding"
	line "too much stuff."
	done
	
Route12Npc6Text:
	text "Just past ROUTE 12"
	line "is the ONWA INTL."
	cont "AIRPORT."
	
	para "It's always so"
	line "busy there."
	done
	
Route12Npc7Text:
	text "If you want to"
	line "practice tricks,"
	
	para "the SKATEPARK is"
	line "the place to be."
	done
	
Route12Npc8Text1:
	text "They won't let"
	line "me pass!"
	
	para "That's not cool!"
	done
	
Route12Npc8Text2:
	text "Now that those"
	line "guys are gone,"
	cont "I can get past!"
	
	para "Although, I've"
	line "gotten used to"
	cont "standing here…"
	done

Route12Npc9Text:
	text "The airplanes are"
	line "taking off and"
	cont "landing all day."
	
	para "So noisy!"
	done
	
Route12Npc10Text:
	text "My nephew lives in"
	line "a little town in"
	cont "SOUTH OWNA called"
	cont "BRIGHTBURG."
	
	para "I haven't heard"
	line "from him in a long"
	cont "time."
	
	para "I wonder how he's"
	line "doing."
	done
	
Route12Npc11Text:
	text "There's an entrance"
	line "to the SEWERS by"
	cont "the train station"
	cont "in LUSTER CITY."
	cont "HOUSING DISTRICT."
	
	para "Hm?"
	
	para "What does that"
	line "have to do with"
	cont "anything?"
	
	para "I'm just making"
	line "small talk…"
	done
