KomorePokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  7, KOMORE_VILLAGE, 6
	warp_event  6,  7, KOMORE_VILLAGE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_FAT_GUY,  7, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KomorePokeCenterMushroomGuy, -1
	person_event SPRITE_CUTE_GIRL,  6, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KomorePokeCenterNPC1, -1
	person_event SPRITE_YOUNGSTER,  4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KomorePokeCenterNPC2, -1
	
	
KomorePokeCenterNPC1:
	faceplayer 
	opentext
	writetext KomorePokeCenterNPC1Text
	waitbutton
	closetext
	spriteface 4, RIGHT
	end
	
KomorePokeCenterNPC1Text:
	text "Ew!"
	
	para "That gross guy"
	line "just sits there"
	cont "stuffing his face"
	cont "with mushrooms."
	
	para "What a weirdo!"
	done
	
KomorePokeCenterNPC2:
	faceplayer
	opentext
	writetext KomorePokeCenterNPC2Text1
	yesorno
	writetext KomorePokeCenterNPC2Text2
	waitbutton
	closetext
	end
	
KomorePokeCenterNPC2Text1:
	text "Hey you wanna"
	line "battle?"
	done
	
KomorePokeCenterNPC2Text2:
	text "Nah, <WAIT_S>we better"
	line "not."
	
	para "The nurse might"
	line "get mad!"
	done
	
KomorePokeCenterMushroomGuy:
	opentext
	writetext KomorePokeCenterMushroomGuyText1
	pause 10
	faceplayer
	writetext KomorePokeCenterMushroomGuyText2
	yesorno
	iffalse .no
	special Special_ChooseItem
	iffalse .no
	callasm CheckItemMushroom
	ifequal TINYMUSHROOM, .tiny
	ifequal BIG_MUSHROOM, .big
	ifequal BALMMUSHROOM, .balm
.not_interested
	writetext KomorePokeCenterMushroomGuyText4
	waitbutton
	closetext
	spriteface 3, UP
	end
.no
	writetext KomorePokeCenterMushroomGuyText3
	waitbutton
	closetext
	spriteface 3, UP
	end
.balm
	writetext KomorePokeCenterMushroomGuyText7
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	playsound SFX_TRANSACTION
	givemoney $0, 10000
	takeitem BALMMUSHROOM
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	jump .finish
.big
	writetext KomorePokeCenterMushroomGuyText6
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	playsound SFX_TRANSACTION
	givemoney $0, 2500
	takeitem BIG_MUSHROOM
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	jump .finish
.tiny
	writetext KomorePokeCenterMushroomGuyText5
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	playsound SFX_TRANSACTION
	givemoney $0, 500
	takeitem TINYMUSHROOM
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
.finish
	writetext KomorePokeCenterMushroomGuyText8
	waitbutton
	closetext
	spriteface 3, UP
	end
	
CheckItemMushroom:
	ld a, [wCurItem]
	ld [wd265], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	ld a, [wCurItem]
	ld [wScriptVar], a
	
KomorePokeCenterMushroomGuyText1:
	text "Munch! <WAIT_M>Scarf!<WAIT_M>"
	done
	
KomorePokeCenterMushroomGuyText2:
	text "Guh…"
	
	para "Do you have any"
	line "tasty mushrooms?"
	
	para "Hand 'em over!"
	
	para "I'll pay you"
	line "for 'em!"
	done
	
KomorePokeCenterMushroomGuyText3:
	text "Guh!"
	
	para "Then leave me"
	line "alone!"
	done
	
KomorePokeCenterMushroomGuyText4:
	text "Guh!"
	
	para "That's not a"
	line "mushroom!"
	
	para "Get that outta my"
	line "face!"
	done
	
KomorePokeCenterMushroomGuyText5:
	text "Guh."
	
	para "A tasty little"
	line "TINYMUSHROOM."
	
	para "I'll buy it for"
	line "¥500!"
	done
	
KomorePokeCenterMushroomGuyText6:
	text "Guh!"
	
	para "A delightful"
	line "BIG MUSHROOM!"
	
	para "I'll buy it for"
	line "¥2500!"
	done
	
KomorePokeCenterMushroomGuyText7:
	text "Guh!!!"
	
	para "A luxurious"
	line "BALMMUSHROOM!"
	
	para "I'll buy it for"
	line "¥10,000!"
	done
	
KomorePokeCenterMushroomGuyText8:
	text "Great, thanks!"
	
	para "Now let me eat"
	line "in peace!"
	done
	