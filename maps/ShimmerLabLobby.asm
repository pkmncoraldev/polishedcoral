ShimmerLabLobby_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ShimmerLabLobbyCallback

	db 4 ; warp events
	warp_event  3,  5, SHIMMER_CITY, 1
	warp_event  4,  5, SHIMMER_CITY, 1
	warp_event  7,  3, SHIMMER_LAB_RESEARCH_ROOM, 1
	warp_event 11,  3, SHIMMER_LAB_EXPERIMENTAL_LAB, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost  3,  6, SIGNPOST_UP, ShimmerLabResearchSign
	signpost  3, 10, SIGNPOST_UP, ShimmerLabExperimentSign

	db 3 ; object events
	person_event SPRITE_SCIENTIST_F,  2,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyNPC, -1
	person_event SPRITE_ROCKER,  -5,  -5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyNPC2, -1
	object_event -5, -5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, WIGGLYTUFF, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyWigglytuff, -1

	const_def 1 ; object constants
	const SHIMMER_LAB_LOBBY_NPC1
	const SHIMMER_LAB_LOBBY_NPC2
	const SHIMMER_LAB_LOBBY_WIGGLYTUFF

ShimmerLabLobbyCallback:
	checkevent EVENT_TALKED_TO_TENT_GUY_WITH_TREASURE
	iffalse .end
	moveperson SHIMMER_LAB_LOBBY_NPC2, 4, 3
	moveperson SHIMMER_LAB_LOBBY_WIGGLYTUFF, 5, 3
	domaptrigger ROUTE_10_EAST, $2
	checktmhm TM_BLIZZARD
	iftrue .end
	clearevent EVENT_ROUTE_10_EAST_POKE_BALL_BLIZZARD
.end
	return

ShimmerLabLobbyNPC:
	jumptextfaceplayer ShimmerLabLobbyNPCText

ShimmerLabLobbyNPC2:
	faceplayer
	opentext
	checkevent EVENT_CAN_GET_AMULET_COIN
	iftrue .give_amulet_coin
	jumptextfaceplayer ShimmerLabLobbyNPC2Text
.give_amulet_coin
	writetext ShimmerLabLobbyNPC2Text2
	waitbutton
	verbosegiveitem AMULET_COIN
	iffalse .NoRoom
	clearevent EVENT_CAN_GET_AMULET_COIN
	writetext ShimmerLabLobbyNPC2Text3
	waitbutton
	closetext
	end
.NoRoom
	writetext ShimmerLabLobbyNPC2NoRoomText
	closetext
	end

ShimmerLabLobbyWigglytuff:
	opentext
	writetext ShimmerLabLobbyWigglytuffText
	cry WIGGLYTUFF
	waitbutton
	closetext
	end

ShimmerLabResearchSign:
	jumptext ShimmerLabResearchSignText
	
ShimmerLabExperimentSign:
	jumptext ShimmerLabExperimentSignText
	
ShimmerLabLobbyNPCText:
	text "Welcome to the"
	line "PORT SHIMMER LAB!"
	
	para "All sorts of"
	line "research is con-"
	cont "ducted here."
	done
	
ShimmerLabLobbyNPC2Text:
	text "Hey!"
	line "It's me!"
	
	para "The researcher you"
	line "met on ROUTE 10!"
	
	para "How've you been?"
	
	para "I think I left"
	line "an important TM"
	cont "behind…"
	
	para "I haven't seen it"
	line "since I was pack-"
	cont "ing up my tent…"
	done
	
ShimmerLabLobbyNPC2Text2:
	text "Hey!"
	line "It's me!"
	
	para "The researcher you"
	line "met on ROUTE 10!"
	
	para "How've you been?"
	
	para "I wanted to give"
	line "this to you as"
	cont "thanks for your"
	cont "help."
	
	para "It's said to bring"
	line "great fortune!"
	done
	
ShimmerLabLobbyNPC2Text3:
	text "I think I left"
	line "an important TM"
	cont "behind…"
	
	para "I haven't seen it"
	line "since I was pack-"
	cont "ing up my tent…"
	done
	
ShimmerLabLobbyNPC2NoRoomText:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
	
ShimmerLabLobbyWigglytuffText:
	text "WIGGLYTUFF: Tuff!"
	line "Tuff!"
	done
	
ShimmerLabResearchSignText:
	text "ANTHROPOLOGY LAB"
	done
	
ShimmerLabExperimentSignText:
	text "#ZOOLOGY LAB"
	done