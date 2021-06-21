TwinkleRockHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  1, 3, TWINKLE_TOWN
	warp_def  9,  2, 3, TWINKLE_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  6,  5, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinkleIcyRockHouseNPC, -1
	object_event  2,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleHeatRockHouseNPC, -1
	
TwinkleIcyRockHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_ICY_ROCK
	iftrue .gotrock
	writetext TwinkleIcyRockHouseNPCText1
	waitbutton
	verbosegiveitem ICY_ROCK
	iffalse .NoRoom
.gotrock
	writetext TwinkleIcyRockHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_ICY_ROCK
	end
.NoRoom
	writetext TwinkleIcyRockHouseNPCText3
	waitbutton
	closetext
	end
	
TwinkleHeatRockHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_HEAT_ROCK
	iftrue .gotrock
	writetext TwinkleHeatRockHouseNPCText1
	waitbutton
	verbosegiveitem HEAT_ROCK
	iffalse .NoRoom
.gotrock
	writetext TwinkleHeatRockHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_HEAT_ROCK
	end
.NoRoom
	writetext TwinkleHeatRockHouseNPCText3
	waitbutton
	closetext
	end

TwinkleIcyRockHouseNPCText1:
	text "I found these"
	line "pretty rocks when"
	cont "I was out on a"
	cont "walk."
	
	para "No matter what,"
	line "they stay cold!"
	
	para "Here, take one!"
	done
	
TwinkleIcyRockHouseNPCText2:
	text "I wonder if it"
	line "would be good to"
	cont "give to ICE-type"
	cont "#MON?"
	done
	
TwinkleIcyRockHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
	
TwinkleHeatRockHouseNPCText1:
	text "I have these crazy"
	line "rocks that are"
	cont "always warm."
	
	para "They're really good"
	line "to have around"
	cont "here."
	
	para "Have one!"
	done
	
TwinkleHeatRockHouseNPCText2:
	text "You should try"
	line "giving it to a"
	cont "FIRE-type #MON!"
	done
	
TwinkleHeatRockHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
	