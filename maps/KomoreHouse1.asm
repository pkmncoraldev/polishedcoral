KomoreHouse1_MapScriptHeader:
	db 2 ; scene scripts
	scene_script KomoreHouse1Trigger0
	scene_script KomoreHouse1Trigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, KOMORE_VILLAGE, 3
	warp_event  3,  7, KOMORE_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, trade, TRADE_WITH_MARTY_FOR_MIENFOO, -1
	object_event  6,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, GIRAFARIG, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, KomoreHouse3Giraf, -1
	
	const_def 1 ; object constants
	const KOMORE_HOUSE_1_NPC
	const KOMORE_HOUSE_1_GIRA_DOLL
	
KomoreHouse1Trigger0:
	end
	
KomoreHouse1Trigger1:
	dotrigger $0
	pause 15
	opentext
	writetext KomoreTradeCompleteText
	waitbutton
	disappear KOMORE_HOUSE_1_GIRA_DOLL
	writetext GiveGirafarigDollText
	playsound SFX_ITEM
	pause 60
	writetext PutAwayGirafarigDollText
	waitbutton
	closetext
	end
	
KomoreTradeCompleteText:
	text "Oh!"
	
	para "Why don't you take"
	line "this, too."
	
	para "I don't need it"
	line "anymore."
	
	para "I've got the real"
	line "thing!"
	done
	
GiveGirafarigDollText:
	text "<PLAYER> received"
	line "GIRAFARIG DOLL!"
	done
	
PutAwayGirafarigDollText:
	text "The DOLL was sent"
	line "to <PLAYER>'s PC."
	done