BrilloPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, BRILLO_TOWN, 5
	warp_event  5,  7, BRILLO_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_POKEMANIAC,  5, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPokeCenterNPC1, EVENT_ROUTE_17_COPS_GONE
	
	
BrilloPokeCenterNPC1:
	checkevent EVENT_TALKED_TO_BRILLO_RESEARCHER_IN_CENTER
	iftrue .talked
	setevent EVENT_CAN_TALK_TO_POLICE_CAPTAIN
	setevent EVENT_TALKED_TO_BRILLO_RESEARCHER_IN_CENTER
	jumptextfaceplayer BrilloPokeCenterNPC1Text1
.talked
	jumptextfaceplayer BrilloPokeCenterNPC1Text2
	
BrilloPokeCenterNPC1Text1:
	text "Are you <PLAYER>?"
	
	para "You're the one"
	line "PROF. HILL said"
	cont "found the ruins"
	cont "near TWINKLE TOWN."
	
	para "There's reason to"
	line "believe that there"
	cont "could be more"
	cont "ruins around here."
	
	para "My colleague set"
	line "up camp in the"
	cont "desert past"
	cont "ROUTE 17."
	
	para "Unfortunately,"
	line "the police have"
	cont "decided to set"
	cont "up a roadblock."
	
	para "They say it was"
	line "direct orders"
	cont "from the CAPTAIN."
	
	para "I don't know what"
	line "to do now."
	done
	
BrilloPokeCenterNPC1Text2:
	text "My colleague set"
	line "up camp in the"
	cont "desert past"
	cont "ROUTE 17."
	
	para "Unfortunately,"
	line "the police have"
	cont "decided to set"
	cont "up a roadblock."
	
	para "They say it was"
	line "direct orders"
	cont "from the CAPTAIN."
	
	para "I don't know"
	line "what to do now."
	done
	
