NettBuilding1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding1FCallback

	db 6 ; warp events
	warp_event 12, 19, LUSTER_CITY_BUSINESS, 5
	warp_event 13, 19, LUSTER_CITY_BUSINESS, 6
	warp_event 24,  3, NETT_BUILDING_2F, 1
	warp_event 20,  3, NETT_BUILDING_ELEVATOR, 1
	warp_event  5,  3, NETT_BUILDING_M_BATHROOM, 1
	warp_event  2,  3, NETT_BUILDING_F_BATHROOM, 1

	db 0 ; coord events

	db 8 ; bg events
	signpost  3, 12, SIGNPOST_READ, NettBuilding1F_NPC_4
	signpost  3, 23, SIGNPOST_READ, NettBuilding1F_Sign
	signpost  8, 12, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  8, 13, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  9, 12, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  9, 13, SIGNPOST_READ, NettBuilding1F_Pokeball
	signpost  3,  4, SIGNPOST_READ, NettBuilding1F_MensRoom
	signpost  3,  1, SIGNPOST_READ, NettBuilding1F_LadiesRoom

	db 18 ; object events
	person_event SPRITE_SLOWPOKETAIL,  7, 12, SPRITEMOVEDATA_NETT_BALL_L, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7, 13, SPRITEMOVEDATA_NETT_BALL_R, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_CAMPFIRE,  3,  4, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_CAMPFIRE,  3,  1, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_ROCKER,  7, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_1, -1
	person_event SPRITE_REDS_MOM,  6,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_2, -1
	person_event SPRITE_OFFICER,  4, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_3, -1
	person_event SPRITE_RECEPTIONIST,  2, 12, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_4, -1
	person_event SPRITE_TEACHER, 12, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_5, -1
	person_event SPRITE_GENTLEMAN, 15,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_6, -1
	person_event SPRITE_POKEMANIAC,  9, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_7, -1
	person_event SPRITE_INVISIBLE, -5, -5, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NettBuilding1FLockedElevator, -1
	person_event SPRITE_SUPER_NERD, 15, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_Mumble, -1
	person_event SPRITE_BEAUTY, 15, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_Mumble, -1
	person_event SPRITE_SUPER_NERD,  6, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_Mumble, -1
	person_event SPRITE_BEAUTY,  6, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_Mumble, -1
	person_event SPRITE_SUPER_NERD,  7,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_Mumble, -1
	person_event SPRITE_BEAUTY,  8,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuilding1F_Mumble, -1

	
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
	
NettBuilding1FCallback:
	checkevent EVENT_NETT_ELEVATOR_BROKEN
	iffalse .skip_locked_elevator
	moveperson  7, 20, 4
.skip_locked_elevator
	checkevent EVENT_NETT_OFFICER_MOVED
	iffalse .end
	moveperson 12, 19, 3
.end
	return
	
NettBuilding1FLockedElevator:
	jumptext NettBuilding1FLockedElevatorText
	
NettBuilding1FLockedElevatorText:
	text "The doors won't"
	line "budge…"
	done
	
NettBuilding1F_Sign:
	jumptext NettBuilding1F_SignText
	
NettBuilding1F_Pokeball:
	jumptext NettBuilding1F_PokeballText
	
NettBuilding1F_MensRoom:
	jumptext NettBuilding1F_MensRoomText
	
NettBuilding1F_LadiesRoom:
	jumptext NettBuilding1F_LadiesRoomText
	
NettBuilding1F_NPC_1:
	jumptextfaceplayer NettBuilding1F_NPC_1_Text
	
NettBuilding1F_NPC_2:
	jumptextfaceplayer NettBuilding1F_NPC_2_Text
	
NettBuilding1F_NPC_3:
	checkevent EVENT_NETT_ELEVATOR_BROKEN
	iftrue .elevator_broken
	jumptextfaceplayer NettBuilding1F_NPC_3_Text1
.elevator_broken
	jumptextfaceplayer NettBuilding1F_NPC_3_Text2
	
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
	text "The CEO, MR. ELI,"
	line "inhereted the"
	cont "company from his"
	cont "father."
	
	para "I wonder what kind"
	line "of man he was."
	done
	
NettBuilding1F_NPC_2_Text:
	text "Apparently profits"
	line "have been down"
	cont "since the current"
	cont "CEO took over."
	
	para "You'd never know it"
	line "just from looking"
	cont "at the building!"
	done
	
NettBuilding1F_NPC_3_Text1:
	text "The stairwell is"
	line "through here."
	
	para "Employees only!"
	done
	
NettBuilding1F_NPC_3_Text2:
	text "Something's wrong"
	line "with the elevator."
	
	para "It seems to be"
	line "stuck on the 7th"
	cont "floor."
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
	
NettBuilding1F_Mumble:
	jumptext NettBuilding1FMumbleText
	
NettBuilding1FMumbleText:
	text "Mumble… <WAIT_S>mumble…"
	done
