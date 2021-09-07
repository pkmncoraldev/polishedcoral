NettBuilding1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 6 ; warp events
	warp_event  8, 13, LUSTER_CITY_BUSINESS, 5
	warp_event  9, 13, LUSTER_CITY_BUSINESS, 6
	warp_event  2,  3, NETT_BUILDING_STAIRWELL, 1
	warp_event  4,  3, NETT_BUILDING_ELEVATOR, 1
	warp_event 14,  3, NETT_BUILDING_M_BATHROOM, 1
	warp_event 16,  3, NETT_BUILDING_F_BATHROOM, 1

	db 0 ; coord events

	db 8 ; bg events
	signpost  3,  8, SIGNPOST_READ, NettBuilding1F_NPC_4
	signpost  3,  1, SIGNPOST_READ, NettBuilding1F_Sign
	signpost  6,  8, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  6,  9, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  7,  8, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  7,  9, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  3, 13, SIGNPOST_READ, NettBuilding1F_MensRoom
	signpost  3, 15, SIGNPOST_READ, NettBuilding1F_LadiesRoom

	db 11 ; object events
	person_event SPRITE_SLOWPOKETAIL,  5,  8, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  5,  9, SPRITEMOVEDATA_TILE_RIGHT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_CAMPFIRE,  3, 13, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_CAMPFIRE,  3, 15, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SUPER_NERD, 13, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_1, -1
	person_event SPRITE_BEAUTY, 13, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_2, -1
	person_event SPRITE_OFFICER,  4,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_3, -1
	person_event SPRITE_RECEPTIONIST,  2,  8, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_4, -1
	person_event SPRITE_TEACHER,  8, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_5, -1
	person_event SPRITE_GENTLEMAN, 11,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_6, -1
	person_event SPRITE_POKEMANIAC,  7,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_7, -1

	
	const_def 1 ; object constants
	const NETT_1F_BALL_1
	const NETT_1F_BALL_2
	const NETT_1F_SIGN_1
	const NETT_1F_SIGN_2
	const NETT_1F_NPC_1
	const NETT_1F_NPC_2
	const NETT_1F_NPC_3
	const NETT_1F_NPC_4
	const NETT_1F_NPC_5
	const NETT_1F_NPC_6
	const NETT_1F_NPC_7
	
NettBuilding1F_Sign:
	jumptext NettBuilding1F_SignText
	
NettBuilding1F_Pokeball:
	jumptext NettBuilding1F_PokeballText
	
NettBuilding1F_MensRoom:
	jumptext NettBuilding1F_MensRoomText
	
NettBuilding1F_LadiesRoom:
	jumptext NettBuilding1F_LadiesRoomText
	
NettBuilding1F_NPC_1:
	jumptext NettBuilding1F_NPC_1_Text
	
NettBuilding1F_NPC_2:
	jumptext NettBuilding1F_NPC_2_Text
	
NettBuilding1F_NPC_3:
	jumptextfaceplayer NettBuilding1F_NPC_3_Text
	
NettBuilding1F_NPC_4:
	jumptext NettBuilding1F_NPC_4_Text
	
NettBuilding1F_NPC_5:
	jumptextfaceplayer NettBuilding1F_NPC_5_Text
	
NettBuilding1F_NPC_6:
	faceplayer
	opentext
	writetext NettBuilding1F_NPC_6_Text
	waitbutton
	closetext
	spriteface NETT_1F_NPC_6, DOWN
	end
	
NettBuilding1F_NPC_7:
	faceplayer
	opentext
	writetext NettBuilding1F_NPC_7_Text
	waitbutton
	closetext
	spriteface NETT_1F_NPC_7, RIGHT
	end
	
NettBuilding1F_SignText:
	text "FLOOR 1"
	done
	
NettBuilding1F_PokeballText:
	text "A giant sculpture"
	line "of a #BALL"
	cont "shrouded by a net."
	done
	
NettBuilding1F_MensRoomText:
	text "MEN'S ROOM"
	done
	
NettBuilding1F_LadiesRoomText:
	text "LADY'S ROOM"
	done
	
NettBuilding1F_NPC_1_Text:
	text "Mumble… mumble…"
	
	para "This presentation"
	line "needs to go well…"
	
	para "Mumble… mumble…"
	done
	
NettBuilding1F_NPC_2_Text:
	text "Mumble… mumble…"
	
	para "This contract will"
	line "make or break our"
	cont "careers…"
	
	para "Mumble… mumble…"
	done
	
NettBuilding1F_NPC_3_Text:
	text "The stairwell is"
	line "through here."
	
	para "Employees only!"
	done
	
NettBuilding1F_NPC_4_Text:
	text "Welcome to the"
	line "NETT BUILDING."
	
	para "Do you have an"
	line "appointment to"
	cont "meet with someone?"
	
	para "If so, please use"
	line "the elevator!"
	done
	
NettBuilding1F_NPC_5_Text:
	text "NETT CORP. is the"
	line "largest company in"
	cont "the region."
	
	para "They produce #-"
	line "BALLs and other"
	cont "items that every"
	cont "TRAINER uses!"
	done
	
NettBuilding1F_NPC_6_Text:
	text "I'm waiting for my"
	line "appointment."
	
	para "I've been here for"
	line "hours!"
	
	para "I wonder if they"
	line "know I'm here…"
	done
	
NettBuilding1F_NPC_7_Text:
	text "Pretty impressive,"
	line "huh?"
	
	para "I think it's a bit"
	line "tacky, but eh…"
	
	para "What do I know?"
	done