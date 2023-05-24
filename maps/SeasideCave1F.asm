SeasideCave1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  7,  1, ROUTE_17, 3
	warp_event 15,  3, SEASIDE_CAVE_B1F, 1
	warp_event 15, 19, SEASIDE_CAVE_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 15,  9, SPRITE_TRUNKS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SeasideCave1FNPC1, EVENT_TALKED_TO_SEASIDE_CAVE_GUY_3
	object_event 15, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14, 14, SPRITE_TRUNKS_WATER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SEASIDE_CAVE_GUY_NOT_SPINNING
	
	
	const_def 1 ; object constants
	const SEASIDE_CAVE_NPC_1
	const SEASIDE_CAVE_NPC_2
	
SeasideCave1FNPC1:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEASIDE_CAVE_GUY_2
	iftrue .alreadytalked2
	checkevent EVENT_TALKED_TO_SEASIDE_CAVE_GUY_1
	iftrue .alreadytalked1
	writetext SeasideCave1FNPC1Text1
	setevent EVENT_TALKED_TO_SEASIDE_CAVE_GUY_1
	jump .cont
.alreadytalked1
	writetext SeasideCave1FNPC1Text2
	setevent EVENT_TALKED_TO_SEASIDE_CAVE_GUY_2
	jump .cont
.alreadytalked2
	writetext SeasideCave1FNPC1Text3
	setevent EVENT_TALKED_TO_SEASIDE_CAVE_GUY_3
	clearevent EVENT_SEASIDE_CAVE_GUY_NOT_SPINNING
.cont
	waitbutton
	closetext
	spriteface SEASIDE_CAVE_NPC_1, DOWN
	end
	
SeasideCave1FNPC1Text1:
	text "We wandered into"
	line "this cave and my"
	cont "friend got swept"
	cont "up in the current!"
	
	para "I should probably"
	line "help her, but…"
	done
	
SeasideCave1FNPC1Text2:
	text "Look at her go!"
	
	para "Looks kinda like"
	line "fun!"
	done
	
SeasideCave1FNPC1Text3:
	text "…"
	
	para "I might join her…"
	done
	