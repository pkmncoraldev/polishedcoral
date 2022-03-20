BrilloRockHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRILLO_TOWN, 2
	warp_event  3,  7, BRILLO_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloDampRockHouseHouseNPC, -1
	object_event  2,  4, SPRITE_COOL_DUDE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloSmoothRockHouseNPC, -1
	
BrilloDampRockHouseHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_DAMP_ROCK
	iftrue .gotrock
	writetext BrilloDampRockHouseHouseNPCText1
	waitbutton
	verbosegiveitem DAMP_ROCK
	iffalse .NoRoom
.gotrock
	writetext BrilloDampRockHouseHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_DAMP_ROCK
	end
.NoRoom
	writetext BrilloDampRockHouseHouseNPCText3
	waitbutton
	closetext
	end
	
BrilloSmoothRockHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_SMOOTH_ROCK
	iftrue .gotrock
	writetext BrilloSmoothRockHouseNPCText1
	waitbutton
	verbosegiveitem SMOOTH_ROCK
	iffalse .NoRoom
.gotrock
	writetext BrilloSmoothRockHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_SMOOTH_ROCK
	end
.NoRoom
	writetext BrilloSmoothRockHouseNPCText3
	waitbutton
	closetext
	end

BrilloDampRockHouseHouseNPCText1:
	text "I found these"
	line "strange rocks by"
	cont "the shore."
	
	para "No matter what,"
	line "they won't dry out!"
	
	para "You want one?"
	done
	
BrilloDampRockHouseHouseNPCText2:
	text "I wonder if it"
	line "would be good to"
	cont "give to WATER-type"
	cont "#MON?"
	done
	
BrilloDampRockHouseHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
	
BrilloSmoothRockHouseNPCText1:
	text "I found these cool"
	line "rocks in the"
	cont "desert."
	
	para "They look rough,"
	line "but are actually"
	cont "super smooth!"
	
	para "Have one!"
	done
	
BrilloSmoothRockHouseNPCText2:
	text "You should try"
	line "letting a GROUND-"
	cont "type #MON!"
	done
	
BrilloSmoothRockHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done
