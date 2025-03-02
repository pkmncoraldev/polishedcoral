BrilloPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, BRILLO_TOWN, 5
	warp_event  5,  7, BRILLO_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_POKEMANIAC,  5, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPokeCenterNPC1, EVENT_ROUTE_17_COPS_GONE
	object_event  9, 6, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, TOUCANNON, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, BrilloPokeCenterToucannon, EVENT_ROUTE_17_COPS_GONE
	person_event SPRITE_COOLTRAINER_F,  4,  2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrilloPokeCenterNPC2, -1
	person_event SPRITE_SUPER_NERD,  4, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloPokeCenterNPC3, -1
	
	
BrilloPokeCenterToucannon:
	opentext
	writetext BrilloPokeCenterToucannonText
	cry TOUCANNON
	waitbutton
	closetext
	end
	
BrilloPokeCenterToucannonText:
	text "TOUCANNON: Tou-"
	line "CAAAW!"
	done
	
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
	
BrilloPokeCenterNPC2:
	checktime 1<<NITE
	iftrue .nite
	jumptextfaceplayer BrilloPokeCenterNPC2Text1
.nite
	jumptextfaceplayer BrilloPokeCenterNPC2Text2
	
BrilloPokeCenterNPC2Text1:
	text "I was sweating my"
	line "butt off outside."
	
	para "Boy am I glad the"
	line "#MON CENTER has"
	cont "A/C!"
	done
	
BrilloPokeCenterNPC2Text2:
	text "I was freezing my"
	line "butt off outside."
	
	para "Boy am I glad the"
	line "#MON CENTER is"
	cont "heated!"
	done
	
BrilloPokeCenterNPC3:
	jumptextfaceplayer BrilloPokeCenterNPC3Text
	
BrilloPokeCenterNPC3Text:
	text "Have you heard the"
	line "BROTHERS 3 sing?"
	
	para "I'm their biggest"
	line "fan!"
	
	para "I know all of"
	line "their songs!"
	
	para "They only have the"
	line "one song…"
	done
