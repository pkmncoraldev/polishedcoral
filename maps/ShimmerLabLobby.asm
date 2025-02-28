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

	db 5 ; object events
	person_event SPRITE_DAISY,  2,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyNPC, -1
	person_event SPRITE_ROCKER,  -5,  -5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyNPC2, EVENT_SHIMMER_FIRST_RESEARCHER_GONE
	object_event -5, -5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, WIGGLYTUFF, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyWigglytuff, EVENT_SHIMMER_FIRST_RESEARCHER_GONE
	person_event SPRITE_POKEMANIAC,  -5,  -5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyNPC3, EVENT_SHIMMER_SECOND_RESEARCHER_GONE
	object_event -5, -5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, TOUCANNON, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyToucannon, EVENT_SHIMMER_SECOND_RESEARCHER_GONE

	const_def 1 ; object constants
	const SHIMMER_LAB_LOBBY_NPC1
	const SHIMMER_LAB_LOBBY_NPC2
	const SHIMMER_LAB_LOBBY_WIGGLYTUFF
	const SHIMMER_LAB_LOBBY_NPC3
	const SHIMMER_LAB_LOBBY_TOUCANNON

ShimmerLabLobbyCallback:
	checkevent EVENT_UNDERWATER_TEMPLE_2_ARTIFACT
	iffalse .skip
	setevent EVENT_SHIMMER_FIRST_RESEARCHER_GONE
	moveperson SHIMMER_LAB_LOBBY_NPC3, 4, 3
	moveperson SHIMMER_LAB_LOBBY_TOUCANNON, 5, 3
.skip
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
	checkevent EVENT_CAN_GET_AMULET_COIN
	iftrue .give_amulet_coin
	jumptextfaceplayer ShimmerLabLobbyNPC2Text
.give_amulet_coin
	opentext
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
	
ShimmerLabLobbyNPC3:
	jumptextfaceplayer ShimmerLabLobbyNPC3Text

ShimmerLabLobbyWigglytuff:
	opentext
	writetext ShimmerLabLobbyWigglytuffText
	cry WIGGLYTUFF
	waitbutton
	closetext
	end
	
ShimmerLabLobbyToucannon:
	opentext
	writetext ShimmerLabLobbyToucannonText
	cry TOUCANNON
	waitbutton
	closetext
	end
	
ShimmerLabLobbyToucannonText:
	text "TOUCANNON: Tou-"
	line "CAAAW!"
	done

ShimmerLabResearchSign:
	jumptext ShimmerLabResearchSignText
	
ShimmerLabExperimentSign:
	jumptext ShimmerLabExperimentSignText
	
ShimmerLabLobbyNPCText:
	text "Welcome to the"
	line "PORT SHIMMER LAB."
	
	para "All sorts of"
	line "research is con-"
	cont "ducted here."
	done
	
ShimmerLabLobbyNPC2Text:
	text "Hey!<WAIT_S>"
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
	text "Hey!<WAIT_S>"
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
	
ShimmerLabLobbyNPC3Text:
	text "Hey, how are you"
	line "doing?"
	
	para "Do you remember"
	line "me?"
	
	para "I was one of the"
	line "researchers from"
	cont "the desert."
	
	para "I'm here wrapping"
	line "up some stuff from"
	cont "our expedition."
	
	para "I have a feeling"
	line "I might have left"
	cont "something behind"
	cont "at the site…"
	
	para "Hope it wasn't"
	line "too important!"
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