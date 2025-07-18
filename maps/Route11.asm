Route11_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route11ChangeBlocks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 15 ; object events
	person_event SPRITE_COOLTRAINER_M,  7, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_1, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_COOLTRAINER_F, 18, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_2, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_COOLTRAINER_M,  7, 24, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_1_2, EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	person_event SPRITE_COOLTRAINER_F, 18, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_2_2, EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	person_event SPRITE_ENGINEER, 22, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11NPC1, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_ENGINEER, 27, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_ENGINEER, 27, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_ENGINEER, 20, 11, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11NPC2, -1
	object_event 10, 28, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11Machoke, -1
	object_event 19, 30, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11Machoke, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_MISC_CONE,  8, 21, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_MISC_CONE, 25, 13, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_11_BRIDGE_BUILT
	person_event SPRITE_MISC_CONE, 25, 15, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_11_BRIDGE_BUILT
	itemball_event 20, 17, MAX_REPEL, 1, EVENT_ROUTE_11_POKE_BALL_1
	tapeball_event 21, 27, MUSIC_GENTLEMAN_ENCOUNTER, 2, EVENT_MUSIC_GENTLEMAN_ENCOUNTER

	
Route11ChangeBlocks:
	checkevent EVENT_ROUTE_11_BRIDGE_BUILT
	iffalse .end
	changemap Route11Bridge_BlockData
	moveperson 9, $0c, $15
	moveperson 10, $0c, $14
.end
	return
	
Route11Machoke:
	opentext TEXTBOX_POKEMON, MACHOKE
	writetext Route11MachokeText
	cry MACHOKE
	waitbutton
	closetext
	end
	
Route11MachokeText:
	text "CHO! CHOKE!"
	done
	
Route11NPC1:
	jumptextfaceplayer Route11NPC1Text
	
Route11NPC2:
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
	checkevent EVENT_ROUTE_11_BRIDGE_BUILT
	iffalse .no_bridge_boy
	writetext Route11NPC2Text1Boy2
	jump .cont
.no_bridge_boy
	writetext Route11NPC2Text1Boy
	jump .cont
.girl
	checkevent EVENT_ROUTE_11_BRIDGE_BUILT
	iffalse .no_bridge_girl
	writetext Route11NPC2Text1Girl2
	jump .cont
.no_bridge_girl
	writetext Route11NPC2Text1Girl
.cont
	waitbutton
	verbosegiveitem ROCKY_HELMET
	iffalse .NoRoom
.gothelmet
	writetext Route11NPC2Text2
	waitbutton
	closetext
	setevent EVENT_GOT_ROCKY_HELMET
	end
.NoRoom
	writetext Route11NPC2Text3
	waitbutton
	closetext
	end
	
Route11NPC1Text:
	text "We're already way"
	line "behind schedule!"
	
	para "We can't have a"
	line "kid wandering"
	cont "around!"
	done
	
Route11NPC2Text1Boy:
	text "Are you the new"
	line "guy?"
	
	para "You can't be on"
	line "the site without"
	cont "a helmet."
	
	para "Catch!"
	done
	
Route11NPC2Text1Boy2:
	text "Are you the new"
	line "guy?"
	
	para "You're super late!"
	
	para "We're just doin'"
	line "final inspections"
	cont "on the bridge."
	
	para "You can't be on"
	line "the site without"
	cont "a helmet."
	
	para "Catch!"
	done
	
Route11NPC2Text1Girl:
	text "Are you the new"
	line "girl?"
	
	para "You can't be on"
	line "the site without"
	cont "a helmet."
	
	para "Catch!"
	done
	
Route11NPC2Text1Girl2:
	text "Are you the new"
	line "guy?"
	
	para "You're super late!"
	
	para "We're just doin'"
	line "final inspections"
	cont "on the bridge."
	
	para "You can't be on"
	line "the site without"
	cont "a helmet."
	
	para "Catch!"
	done
	
Route11NPC2Text2:
	text "If you decide to"
	line "give that to your"
	cont "#MON,"
	
	para "they'll deal some"
	line "hurt to the other"
	cont "guy when they"
	cont "touch 'em."
	
	para "…<WAIT_L>Hold on!"
	
	para "You aren't on the"
	line "crew!"
	done
	
Route11NPC2Text3:
	text "You can't hold more"
	line "stuff?"
	
	para "Well, make room!"
	done
	
TrainerRoute11_1:
	generictrainer COOLTRAINERM, ANDY, EVENT_BEAT_ROUTE_11_TRAINER_1, .SeenText, .BeatenText

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
	text "Alright.<WAIT_M>"
	line "That's that."
	done

TrainerRoute11_2:
	generictrainer COOLTRAINERF, MARY, EVENT_BEAT_ROUTE_11_TRAINER_2, .SeenText, .BeatenText

	text "I don't think"
	line "we're supposed to"
	cont "be here!"
	
	para "How exciting!"
	done

.SeenText:
	text "Those guys are"
	line "building something"
	cont "with #MON."
	
	para "How cool!"
	done

.BeatenText:
	text "Great battle!<WAIT_M>"
	line "How fun!"
	done
	
TrainerRoute11_1_2:
	generictrainer COOLTRAINERM, ANDY, EVENT_BEAT_ROUTE_11_TRAINER_1, .SeenText, .BeatenText

	text "The new bridge"
	line "makes getting to"
	cont "SOUTHERN ONWA"
	cont "way easier."
	
	para "You should have a"
	line "look."
	done

.SeenText:
	text "The road recently"
	line "just opened back"
	cont "up."
	
	para "You should have a"
	line "look at the new"
	cont "bridge."
	
	para "Well, after our"
	line "battle, of course."
	done

.BeatenText:
	text "Alright.<WAIT_M>"
	line "That's that."
	done

TrainerRoute11_2_2:
	generictrainer COOLTRAINERF, MARY, EVENT_BEAT_ROUTE_11_TRAINER_2, .SeenText, .BeatenText

	text "I can't wait to"
	line "cross the new"
	cont "bridge!"
	
	para "How exciting!"
	done

.SeenText:
	text "They built the"
	line "new bridge with"
	cont "help from #MON."
	
	para "How cool!"
	done

.BeatenText:
	text "Great battle!<WAIT_M>"
	line "How fun!"
	done
