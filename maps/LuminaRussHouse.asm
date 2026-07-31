LuminaRussHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 6, 3, 5, LUMINA_TOWN
	warp_def 6, 2, 5, LUMINA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaRussHouseRuss, EVENT_RUSS_NOT_HOME
	
LuminaRussHouseRuss:
	faceplayer
	opentext TEXTBOX_RUSS
	checkevent EVENT_TALKED_TO_RUSS_AT_HIS_HOUSE
	iftrue .talked
	setevent EVENT_TALKED_TO_RUSS_AT_HIS_HOUSE
	writetext LuminaRussHouseRussText1
	waitbutton
	endtext
.talked	
	writetext LuminaRussHouseRussText2
	waitbutton
	endtext
	
LuminaRussHouseRussText1:
	text "…<WAIT_L>You again…"
	
	para "I apologize for"
	line "my outburst at"
	cont "the saloon."
	
	para "That boy.<WAIT_M>"
	line "Your friend."
	
	para "Or whatever he"
	line "was to you."
	
	para "<RIVAL>…"
	
	para "He was…<WAIT_L> my"
	line "grandson."
	
	para "I haven't seen"
	line "him since he was"
	cont "just a baby."
	
	para "His father, ANDRE,"
	line "was always a"
	cont "troubled boy."
	
	para "He was a talented"
	line "TRAINER."
	
	para "Incredibly so,"
	line "in fact."
	
	para "But it was never"
	line "enough."
	
	para "He didn't want to"
	line "just be a great"
	cont "TRAINER,"
	
	para "he wanted to be"
	line "the BEST."
	
	para "He thought that if"
	line "he proved he was"
	cont "the best in ONWA,"
	
	para "the DRAGON of"
	line "legend would show"
	cont "itself to him."
	
	para "He devoted his"
	line "entire youth to"
	cont "such pursuits."
	
	para "…"
	
	para "Until one day,"
	line "he met a girl."
	
	para "The two quickly"
	line "fell in love."
	
	para "However, she would"
	line "only be with him"
	cont "if he promised to"
	cont "settle down."
	
	para "Reluctantly, he"
	line "agreed, and left"
	cont "LUMINA TOWN to"
	cont "start a family."
	
	para "I had hoped that"
	line "life would be"
	cont "enough for him,"
	
	para "but I knew it"
	line "never would be."
	
	para "Sure enough, a"
	line "few years after"
	cont "his son was born,"
	
	para "ANDRE left them"
	line "to persue strength"
	cont "once again."
	
	para "Last I heard, he"
	line "had done it."
	
	para "He was CHAMPION."
	
	para "Knowing him, even"
	line "that wasn't enough."
	
	para "…"
	
	para "I wish I had"
	line "stepped in with"
	cont "<RIVAL>."
	
	para "Told him that"
	line "whatever he was"
	cont "trying to prove…"
	
	para "That it wasn't"
	line "worth it."
	
	para "But now it's too"
	line "late…"
	
	para "…"
	
	para "He probably"
	line "wouldn't have"
	cont "listened, anyway."
	
	para "Not if he was"
	line "anything like his"
	cont "father…"
	
	para "Maybe he was"
	line "always destined"
	cont "to take that same"
	cont "path."
	
	para  "…"
	
	para "I've said enough."
	
	para "Please, just leave"
	line "me be now…"
	done
	
LuminaRussHouseRussText2:
	text "…"
	
	para "I've said enough."
	
	para "Please, just leave"
	line "me be now…"
	done