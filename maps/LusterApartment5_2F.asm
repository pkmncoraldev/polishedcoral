LusterApartment5_2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 1, 1, 3, LUSTER_APARTMENT_5_1F

	db 0 ; coord events

	db 7 ; bg events
	signpost  3,  4, SIGNPOST_JUMPTEXT, LusterApartment5_2F_FlowersText
	signpost  3,  5, SIGNPOST_JUMPTEXT, LusterApartment5_2F_FlowersText
	signpost  6,  0, SIGNPOST_JUMPTEXT, LusterApartment5_2F_FlowersText
	signpost  7,  0, SIGNPOST_JUMPTEXT, LusterApartment5_2F_FlowersText
	signpost  6,  7, SIGNPOST_JUMPTEXT, LusterApartment5_2F_FlowersText
	signpost  7,  7, SIGNPOST_JUMPTEXT, LusterApartment5_2F_FlowersText
	signpost  6,  4, SIGNPOST_JUMPTEXT, LusterApartment5_2F_BookText

	db 4 ; object events
	person_event SPRITE_HEX_MANIAC,  6,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterApartment5_2F_NPC1, -1
	person_event SPRITE_DELINQUENT_F,  3,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterApartment5_2F_NPC2, -1
	person_event SPRITE_COSPLAYER,  5,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterApartment5_2F_NPC3, -1
	person_event SPRITE_CANDLE,  5,  3, SPRITEMOVEDATA_CANDLE, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
LusterApartment5_2F_FlowersText:
	text "Some eerie"
	line "flowers."
	
	para "They don't smell"
	line "like MOM's at all!"
	done
	
LusterApartment5_2F_BookText:
	text "It's all written"
	line "in an odd language"
	cont "you've never seen"
	cont "before."
	done
	
LusterApartment5_2F_NPC1:
	faceplayer
	checktmhm TM_CURSE
	iftrue .got_tm
	opentext
	writetext LusterApartment5_2F_NPC1Text1
	waitbutton
	verbosegivetmhm TM_CURSE
	writetext LusterApartment5_2F_NPC1Text2
	waitbutton
	closetext
	setevent EVENT_TM03
	end
.got_tm
	jumptextfaceplayer LusterApartment5_2F_NPC1Text3
	
LusterApartment5_2F_NPC2:
	jumptextfaceplayer LusterApartment5_2F_NPC2Text
	
LusterApartment5_2F_NPC3:
	jumptextfaceplayer LusterApartment5_2F_NPC3Text
	
LusterApartment5_2F_NPC1Text1:
	text "Ahh!<WAIT_M>"
	line "An outsider!"
	
	para "Who allowed you to"
	line "enter my room?"
	
	para "You've totally"
	line "thrown off the"
	cont "vibe!"
	
	para "A CURSE!"
	
	para "A CURSE on your"
	line "house!"
	
	para "A CURSE ON YOUR"
	line "BLOODLINE!"
	done
	
LusterApartment5_2F_NPC1Text2:
	text "CURSE has mulitple"
	line "effects based on"
	cont "the type of the"
	cont "user."
	
	para "When used by a"
	line "GHOST-type, such"
	cont "as myself,"
	
	para "it deals damage"
	line "every turn at the"
	cont "cost of some HP."
	
	para "Now, begone"
	line "creature of light!"
	
	para "Leave us to our"
	line "dark communion!"
	done
	
LusterApartment5_2F_NPC1Text3:
	text "Begone, creature"
	line "of light!"
	
	para "Leave us to our"
	line "dark communion!"
	done
	
LusterApartment5_2F_NPC2Text:
	text "Hmm…"
	
	para "Can you not get"
	line "so close?"
	
	para "Your aura is"
	line "totally off…"
	done
	
LusterApartment5_2F_NPC3Text:
	text "The flowers are so"
	line "beautiful,"
	
	para "But their thorns"
	line "cut so deep…"
	
	para "Alas, I am more"
	line "like the flowers"
	cont "than you might"
	cont "think…"
	done