SunbeamSoftSandHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 8, SUNBEAM_ISLAND
	warp_def 7, 2, 8, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	
	person_event SPRITE_POKEFAN_M, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandSoftSandHouseNPC, -1

	const_def 1 ; object constants
	const SUNBEAM_SOFT_SAND_HOUSE_NPC
	
SunbeamIslandSoftSandHouseNPC:
	faceplayer
	opentext
	checkevent EVENT_GOT_SOFT_SAND
	iftrue .gotsand
	writetext SunbeamIslandSoftSandHouseNPCText1
	waitbutton
	verbosegiveitem SOFT_SAND
	iffalse .NoRoom
.gotsand
	writetext SunbeamIslandSoftSandHouseNPCText2
	waitbutton
	closetext
	setevent EVENT_GOT_SOFT_SAND
	end
.NoRoom
	writetext SunbeamIslandSoftSandHouseNPCText3
	waitbutton
	closetext
	end

SunbeamIslandSoftSandHouseNPCText1:
	text "Hey kid."
	
	para "Want something"
	line "cool?"
	
	para "Ok, hold out your"
	line "hands."
	done
	
SunbeamIslandSoftSandHouseNPCText2:
	text "What?"
	
	para "Sand from the"
	line "beach?"
	
	para "No way!"
	
	para "That's special"
	line "sand."
	
	para "Give it to your"
	line "#MON and their"
	cont "GROUND-type moves"
	cont "will power up!"
	done
	
SunbeamIslandSoftSandHouseNPCText3:
	text "Oh!"
	
	para "You seem to be"
	line "carrying too much!"
	
	para "Come back later."
	done