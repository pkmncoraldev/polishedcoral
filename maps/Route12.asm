Route12_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 14 ; object events
	person_event SPRITE_COOLTRAINER_M,  7, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute12_1, -1
	person_event SPRITE_COOLTRAINER_F, 16, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute12_2, -1
	person_event SPRITE_BIKER, 18, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute12_3, -1
	person_event SPRITE_ENGINEER, 22, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12NPC1, -1
	person_event SPRITE_ENGINEER, 27, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ENGINEER, 27, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ENGINEER, 20, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route12NPC2, -1
	object_event 10, 28, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 19, 30, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC,  8, 21, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC, 25, 13, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_CORY_MISC, 25, 15, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event 20, 17, MAX_REPEL, 1, EVENT_ROUTE_12_POKE_BALL_1
	itemball_event 21, 27, METAL_POWDER, 1, EVENT_ROUTE_12_POKE_BALL_2

	
Route12NPC1:
	jumptextfaceplayer Route12NPC1Text
	
Route12NPC2:
	faceplayer
	opentext
	checkevent EVENT_GOT_ROCKY_HELMET
	iftrue .gothelmet
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext Route12NPC2Text1Boy
	jump .cont
.girl
	writetext Route12NPC2Text1Girl
.cont
	waitbutton
	verbosegiveitem ROCKY_HELMET
	iffalse .NoRoom
.gothelmet
	writetext Route12NPC2Text2
	waitbutton
	closetext
	setevent EVENT_GOT_ROCKY_HELMET
	end
.NoRoom
	writetext Route12NPC2Text3
	waitbutton
	closetext
	end
	
Route12NPC1Text:
	text "We're already way"
	line "behind schedule!"
	
	para "We can't have a"
	line "kid wandering"
	cont "around!"
	done
	
Route12NPC2Text1Boy:
	text "Are you the new"
	line "guy?"
	
	para "You can't be on"
	line "the site without"
	cont "a helmet."
	
	para "Catch!"
	done
	
Route12NPC2Text1Girl:
	text "Are you the new"
	line "girl?"
	
	para "You can't be on"
	line "the site without"
	cont "a helmet."
	
	para "Catch!"
	done
	
Route12NPC2Text2:
	text "If you decide to"
	line "give that to your"
	cont "#MON,"
	
	para "they'll deal some"
	line "hurt to the other"
	cont "guy when they"
	cont "touch 'em."
	
	para "…"
	
	para "Hold on!"
	
	para "You don't work"
	line "here!"
	done
	
Route12NPC2Text3:
	text "You can't hold more"
	line "stuff?"
	
	para "Well, make room!"
	done
	
TrainerRoute12_1:
	generictrainer COOLTRAINERM, ANDY, EVENT_BEAT_ROUTE_12_TRAINER_1, .SeenText, .BeatenText

	text "Keep going if you"
	line "want, but they"
	cont "won't let you pass."
	
	para "Don't say I didn't"
	line "warn you."
	done

.SeenText:
	text "Road's closed."
	
	para "May as well turn"
	line "around."
	
	para "Well, after our"
	line "battle, of course."
	done

.BeatenText:
	text "Alright."
	
	para "That's that."
	done

TrainerRoute12_2:
	generictrainer COOLTRAINERF, MARY, EVENT_BEAT_ROUTE_12_TRAINER_2, .SeenText, .BeatenText

	text "I don't think"
	line "we're supposed to"
	cont "be here!"
	
	para "How exciting!"
	done

.SeenText:
	text "Those guys are"
	line "building something"
	cont "with their #MON."
	
	para "How cool!"
	done

.BeatenText:
	text "Great battle!"
	
	para "How fun!"
	done

TrainerRoute12_3:
	generictrainer BIKER, HANK, EVENT_BEAT_ROUTE_12_TRAINER_3, .SeenText, .BeatenText

	text "They better finish"
	line "this thing soon."
	
	para "I'm tired of"
	cont "waitin'!"
	done

.SeenText:
	text "I hear they're"
	line "building a bridge"
	cont "or somethin'."
	
	para "I'm gonna rip it up"
	line "on my bike when it's"
	cont "done."
	done

.BeatenText:
	text "Rev it up!"
	done
