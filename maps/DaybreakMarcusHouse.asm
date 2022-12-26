DaybreakMarcusHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 4, 7, DAYBREAK_VILLAGE, 3
	warp_event 3, 7, DAYBREAK_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_REDS_MOM, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, DaybreakMarcusMom, -1
	object_event 6, 5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, BRELOOM, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, DaybreakMarcusHouseBreloom, -1

	const_def 1 ; object constants
	const DAYBREAK_MARCUS_HOUSE_MARCUS_MOM
	
DaybreakMarcusMom:
	jumptextfaceplayer DaybreakMarcusMomText
	
DaybreakMarcusHouseBreloom:
	opentext
	writetext DaybreakMarcusHouseBreloomText
	cry BRELOOM
	waitbutton
	closetext
	end

DaybreakMarcusMomText:
	text "Hi <PLAYER>!"
	
	para "MARCUS already"
	line "left for the first"
	cont "GYM to the north."
	
	para "I know the GYM's"
	line "type is NORMAL."
	
	para "If only I could"
	line "remember what"
	
	para "NORMAL was weak"
	line "to…"
	done

DaybreakMarcusHouseBreloomText:
	text "BRELOOM: Loo lum?"
	done