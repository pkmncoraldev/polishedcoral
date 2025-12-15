LuminaHealerHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 1, LUMINA_TOWN
	warp_def 7, 2, 1, LUMINA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_COOL_DUDE,  4,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseHealer, -1
	person_event SPRITE_DAISY,  3,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaHealerHouseClerk, -1
	
LuminaHealerHouseHealer:
	faceplayer
	opentext
	writetext LuminaHealerHouseHealerText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .no_heal
	checkmoney $0, 1000
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 1000
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	closetext	
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	jumptext LuminaHealerHouseHealerText2
.no_heal
	writetext LuminaHealerHouseHealerText3
	waitbutton
	closetext
	end
.nomoney
	writetext LuminaHealerHouseHealerText4
	waitbutton
	closetext
	end
	
LuminaHealerHouseClerk:
	faceplayer
	opentext
	writetext LuminaHealerHouseClerkText1
	waitbutton
	callasm LuminaHealerHouseClerkAsm
	writetext LuminaHealerHouseClerkText2
	waitbutton
	closetext
	spriteface 2, LEFT
	end
	
LuminaHealerHouseClerkText1:
	text "I sell some of the"
	line "herbs and powders"
	cont "the HEALER uses."
	
	para "Take a look!"
	done
	
LuminaHealerHouseClerkText2:
	text "Bye bye!"
	done
	
LuminaHealerHouseClerkAsm:
	ld a, MARTTYPE_BARTENDER
	ld c, a
	ld a, MART_HEALER
	ld e, a
	ld d, 0
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
	
LuminaHealerHouseHealerText1:
	text "I am a HEALER."
	
	para "I use herbs and"
	line "ancient magic"
	cont "to restore your"
	cont "#MON's power."
	
	para "Of course, my"
	line "services aren't"
	cont "free."
	
	para "I can heal you for"
	line "¥1000, Yes?"
	done
	
LuminaHealerHouseHealerText2:
	text "You are well."
	
	para "Return if you are"
	line "in need of healing"
	cont "again."
	done
	
LuminaHealerHouseHealerText3:
	text "Very well."
	
	para "Return if you are"
	line "in need of help."
	done
	
LuminaHealerHouseHealerText4:
	text "You do not have"
	line "enough cash!"
	
	para "I'm not running a"
	line "charity here!"
	done
