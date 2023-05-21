ShimmerLabLobby_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  5, SHIMMER_CITY, 1
	warp_event  4,  5, SHIMMER_CITY, 1
	warp_event  7,  3, SHIMMER_LAB_RESEARCH_ROOM, 1
	warp_event 11,  3, SHIMMER_LAB_EXPERIMENTAL_LAB, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost  3,  6, SIGNPOST_UP, ShimmerLabResearchSign
	signpost  3, 10, SIGNPOST_UP, ShimmerLabExperimentSign

	db 1 ; object events
	person_event SPRITE_SCIENTIST_F,  2,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabLobbyNPC, -1


ShimmerLabLobbyNPC:
	jumptextfaceplayer ShimmerLabLobbyNPCText

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
	
ShimmerLabResearchSignText:
	text "ANTHROPOLOGY LAB"
	done
	
ShimmerLabExperimentSignText:
	text "#ZOOLOGY LAB"
	done