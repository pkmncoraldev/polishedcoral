EventideMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, EVENTIDE_VILLAGE, 4
	warp_event  2,  7, EVENTIDE_VILLAGE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_FLICKER
	person_event SPRITE_COOLTRAINER_F, 2, 8, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EventideMartNPC1, -1
	person_event SPRITE_COOLTRAINER_M, 6, 4, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, EventideMartNPC2, -1
	
	const_def 1 ; object constants
	const EVENTIDE_MART_CLERK
	const EVENTIDE_MART_NPC1
	const EVENTIDE_MART_NPC2
	
EventideMartNPC1:
	faceplayer
	opentext
	writetext EventideMartNPC1Text
	waitbutton
	closetext
	spriteface EVENTIDE_MART_NPC1, UP
	end
	
EventideMartNPC2:
	jumptextfaceplayer EventideMartNPC2Text
	
EventideMartNPC1Text:
	text "POTION or"
	line "SUPER POTION…"
	
	para "Which is better"
	line "bang for your"
	cont "buck?"
	done
	
EventideMartNPC2Text:
	text "MOO MOO MILK is"
	line "much better for"
	cont "your #MON than"
	cont "the POTIONs they"
	cont "sell here."
	done
