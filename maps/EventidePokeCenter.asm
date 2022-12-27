EventidePokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, EVENTIDE_VILLAGE, 3
	warp_event  5,  7, EVENTIDE_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_GRANNY, 7, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, EventidePokeCenterNPC1, -1
	person_event SPRITE_SCHOOLGIRL, 5, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EventidePokeCenterNPC2, -1
	person_event SPRITE_PICNICKER, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EventidePokeCenterNPC3, -1
	object_event 9, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LITWICK, -1, -1, PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, EventidePokeCenterLitwick, -1


EventidePokeCenterNPC1:
	jumptextfaceplayer EventidePokeCenterNPC1Text
	
EventidePokeCenterNPC2:
	jumptextfaceplayer EventidePokeCenterNPC2Text
	
EventidePokeCenterNPC3:
	jumptextfaceplayer EventidePokeCenterNPC3Text
	
EventidePokeCenterLitwick:
	opentext
	writetext EventidePokeCenterLitwickText1
	cry LITWICK
	waitsfx
	buttonsound
	writetext EventidePokeCenterLitwickText2
	waitbutton
	closetext
	end
	
EventidePokeCenterNPC1Text:
	text "Children often go"
	line "missing in the"
	cont "nearby woods."
	
	para "How terrible!"
	done
	
EventidePokeCenterNPC2Text:
	text "I've been so tired"
	line "lately…"
	
	para "I wonder if I'm"
	line "getting sick…"
	done
	
EventidePokeCenterNPC3Text:
	text "Phew!"
	
	para "The GYM LEADER"
	line "here is no joke!"
	
	para "I might not be"
	line "ready for her…"
	done
	
EventidePokeCenterLitwickText1:
	text "LITWICK: Whi! Whi!"
	done
	
EventidePokeCenterLitwickText2:
	text "It looks full of"
	line "energy!"
	done
