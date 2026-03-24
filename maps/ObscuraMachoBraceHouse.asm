ObscuraMachoBraceHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, OBSCURA_CITY, 8
	warp_event  3,  7, OBSCURA_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_BLACK_BELT,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMachoBraceHouseNPC, -1
	object_event 7, 3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, POLIWRATH, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMachoBraceHousePoliwrath, -1
	
ObscuraMachoBraceHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_MACHO_BRACE
	iftrue .gotbrace
	writetext ObscuraMachoBraceHouseNPCText1
	waitbutton
	verbosegiveitem MACHO_BRACE
	iffalse .NoRoom
.gotbrace
	writetext ObscuraMachoBraceHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_MACHO_BRACE
	end
.NoRoom
	writetext ObscuraMachoBraceHouseNPCText3
	waitbutton
	closetext
	end
	
ObscuraMachoBraceHouseNPCText1:
	text "My #MON is so"
	line "macho!"
	
	para "What's the secret?"
	
	para "Plenty of sit-ups,"
	line "tons of push-ups,"
	
	para "and of course,"
	line "my secret weapon."
	done
	
ObscuraMachoBraceHouseNPCText2:
	text "That'll make your"
	line "#MON slower in"
	cont "battle,"
	
	para "but it can make"
	line "their stats grow"
	cont "faster in the long"
	cont "run!"
	
	para "No pain, no gain!"
	done
	
ObscuraMachoBraceHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Oh well!"
	done
	
ObscuraMachoBraceHousePoliwrath:
	opentext TEXTBOX_POKEMON, POLIWRATH
	writetext ObscuraMachoBraceHousePoliwrathText
	cry POLIWRATH
	waitsfx
	waitbutton
	closetext
	end
	
ObscuraMachoBraceHousePoliwrathText:
	text "WRAAAAATH!"
	done
	