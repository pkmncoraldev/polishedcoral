Route1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  19,  29, ROUTE_1_GATE, 1
	warp_event  20,  29, ROUTE_1_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 21, 26, SIGNPOST_JUMPTEXT, Route1SignText
;	bg_event 31, 15, SIGNPOST_READ, Route1Clue

	db 4 ; object events
	object_event 10,  9, SPRITE_POKEMANIAC, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route1NPCScript, -1
	fruittree_event  2,  6, FRUITTREE_ROUTE_1, PECHA_BERRY
	cuttree_event 15, 17, EVENT_ROUTE_1_CUT_TREE_1
	cuttree_event 22, 11, EVENT_ROUTE_1_CUT_TREE_2
	
	const_def 1 ; object constants
	const ROUTE1_NPC
	
Route1NPCScript:
	jumptextfaceplayer Route1NPCText

;Route1Clue:
;	checkitem CLUE_1
;	iffalse .end
;	checkitem CLUE_2
;	iftrue .end
;	opentext
;	writetext Route1ClueText
;	waitbutton
;	verbosegiveitem CLUE_2
;	closetext
;	end
;.end
;	killsfx
;	end
	
Route1SignText:
	text "ROUTE 1"
	
	para "NORTH:"
	line "DAYBREAK VILLAGE"
	
	para "SOUTH:"
	line "SUNSET BAY"
	done
	
Route1NPCText:
	text "You probably"
	line "already know this,"
	
	para "but if you go into"
	line "the tall grass,"
	cont "wild #MON might"
	cont "attack you."
	
	para "Yeah, you already"
	line "knew that."
	done

Route1ClueText:
	text "You find something"
	line "nestled in the"
	cont "flower patch…"
	
	para "It's another clue!"
	done