SunsetGengarHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SUNSET_BAY, 7
	warp_event  3,  7, SUNSET_BAY, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  1, SIGNPOST_JUMPSTD, picturebookshelf
	bg_event  7,  1, SIGNPOST_JUMPSTD, magazinebookshelf

	db 3 ; object events
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunsetGengarHouseNPC1, -1
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetGengarHouseNPC2, -1
	object_event  6,  3, SPRITE_GENGAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetGengarHouseGengar, -1

	
SunsetGengarHouseNPC1:
	jumptextfaceplayer SunsetGengarHouseNPC1Text

SunsetGengarHouseNPC2:
	jumptextfaceplayer SunsetGengarHouseNPC2Text
	
SunsetGengarHouseGengar:
	opentext
	writetext SunsetGengarHouseGengarText1
	cry GENGAR
	buttonsound
	writetext SunsetGengarHouseGengarText2
	waitbutton
	closetext
	end

SunsetGengarHouseNPC1Text:
	text "I've known my"
	line "GENGAR, BUTTERCUP,"
	cont "for many years."
	
	para "She still likes to"
	line "play pranks."
	done

SunsetGengarHouseNPC2Text:
	text "So, you're"
	line "starting your"
	cont "#MON journey,"
	cont "eh?"
	
	para "Come back here"
	line "when you become"
	cont "the ONWA #MON"
	cont "LEAGUE CHAMPION."
	
	para "I'll make sure"
	line "to give you"
	cont "something special."
	
	para "Hohohoho."
	done

SunsetGengarHouseGengarText1:
	text "BUTTERCUP: Ga gan!"
	done
	
SunsetGengarHouseGengarText2:
	text "She untied your"
	line "shoelaces."
	done