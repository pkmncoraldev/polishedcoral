LusterMallPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 5, LUSTER_MALL
	warp_def 7, 6, 6, LUSTER_MALL

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMallPokeCenterNPC1, -1
	person_event SPRITE_YOUNGSTER, 6, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LusterMallPokeCenterNPC2, -1
	person_event SPRITE_SUPER_NERD, 4, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMallPokeCenterNPC3, -1
	person_event SPRITE_PONYTAIL, 5, 7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMallPokeCenterNPC4, -1
	object_event 11, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CROAGUNK, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, LusterMallPokeCenterCroagunk, -1
	
LusterMallPokeCenterNPC1:
	jumptextfaceplayer LusterMallPokeCenterNPC1Text
	
LusterMallPokeCenterNPC2:
	jumptextfaceplayer LusterMallPokeCenterNPC2Text
	
LusterMallPokeCenterNPC3:
	jumptextfaceplayer LusterMallPokeCenterNPC3Text
	
LusterMallPokeCenterNPC4:
	jumptextfaceplayer LusterMallPokeCenterNPC4Text
	
LusterMallPokeCenterCroagunk:
	opentext TEXTBOX_POKEMON, CROAGUNK
	writetext LusterMallPokeCenterCroagunkText
	cry CROAGUNK
	waitbutton
	closetext
	end
	
LusterMallPokeCenterNPC1Text:
	text "They say the GYM"
	line "here is full of"
	cont "chicks!"
	
	para "…"
	
	para "I'm still trying"
	line "to work up the"
	cont "courage to step"
	cont "inside…"
	done
	
LusterMallPokeCenterNPC2Text:
	text "The #MON"
	line "CENTER is the only"
	cont "thing in this MALL"
	cont "that doesn't cost"
	cont "money!"
	
	para "I gotta make some"
	line "cash!"
	done
	
LusterMallPokeCenterNPC3Text:
	text "I heard girls like"
	line "guys with cute"
	cont "#MON!"
	
	para "Then why do I have"
	line "such bad luck with"
	cont "the ladies?"
	done
	
LusterMallPokeCenterNPC4Text:
	text "I'm supposed to be"
	line "meeting someone"
	cont "upstairs."
	
	para "I'm totally blowing"
	line "them off!"
	done
	
LusterMallPokeCenterCroagunkText:
	text "Gu-gunk!"
	done
