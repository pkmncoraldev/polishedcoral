KomoreHouse2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, KOMORE_VILLAGE, 4
	warp_event  3,  7, KOMORE_VILLAGE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_GRAMPS,  7, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse2WindyMan, -1
	person_event SPRITE_REDS_MOM,  4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KomoreHouse2NPC1, -1
	person_event SPRITE_YOUNGSTER,  3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, KomoreHouse2NPC2, -1
	
KomoreHouse2WindyMan:
	opentext
	checkflag ENGINE_WINDY_DAY
	iftrue .windy
	faceplayer 
	writetext KomoreHouse2WindyManText1
	waitbutton
	closetext
	spriteface 1, DOWN
	end
.windy
	writetext KomoreHouse2WindyManText2
	waitbutton
	closetext
	spriteface 1, DOWN
	end
	
KomoreHouse2WindyManAsm:
	ld hl, wDailyFlags2
	bit 7, [hl] ; ENGINE_WINDY_DAY
	jr z, .notset
	ld a, 1
	ld [wScriptVar], a
	ret
.notset
	xor a
	ld [wScriptVar], a
	ret
	
KomoreHouse2NPC1:
	jumptextfaceplayer KomoreHouse2NPC1Text
	
KomoreHouse2NPC2:
	jumptextfaceplayer KomoreHouse2NPC2Text
	
KomoreHouse2WindyManText1:
	text "…"
	
	para "Today doesn't"
	line "seem too windy…"
	done
	
KomoreHouse2WindyManText2:
	text "…"
	
	para "The wind's really"
	line "blowing today!"
	done
	
KomoreHouse2NPC1Text:
	text "Strong gusts of"
	line "wind often blow"
	cont "the leaves around."
	
	para "Different #MON"
	line "show themselves"
	cont "on windy days."
	done
	
KomoreHouse2NPC2Text:
	text "GRANDPA doesn't"
	line "leave the house"
	cont "these days."
	
	para "He just watches"
	line "the wind blow the"
	cont "leaves out the"
	cont "window."
	done
	