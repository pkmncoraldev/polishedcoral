ShimmerHouse2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SHIMMER_CITY, 25
	warp_event  3,  7, SHIMMER_CITY, 25

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_PONYTAIL,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerHouse2NPC, -1
	object_event 6, 3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, WEEZING, -1, -1, PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, ShimmerHouse2Weezing, -1
	
ShimmerHouse2NPC:
	jumptextfaceplayer ShimmerHouse2NPCText
	
ShimmerHouse2NPCText:
	text "Have you seen all"
	line "the scary stuff on"
	cont "the news?"
	
	para "I've started to"
	line "train my WEEZING,"
	cont "just in case."
	
	para "What if we have to"
	line "defend ourselves?"
	done
	
ShimmerHouse2Weezing:
	opentext TEXTBOX_POKEMON, WEEZING
	writetext ShimmerHouse2WeezingText1
	cry WEEZING
	waitsfx
	buttonsound
	changetextboxspeaker
	writetext ShimmerHouse2WeezingText2
	waitbutton
	closetext
	end
	
ShimmerHouse2WeezingText1:
	text "We-HEEE-zing!"
	done
	
ShimmerHouse2WeezingText2:
	text "WEEZING looks"
	line "worried…"
	done