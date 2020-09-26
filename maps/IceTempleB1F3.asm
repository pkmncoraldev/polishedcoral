IceTempleB1F3_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, IceTempleB1F3CampfiresCallback

	db 3 ; warp events
	warp_def  7,  3, 7, ICE_TEMPLE_B1F_1
	warp_def  7,  4, 8, ICE_TEMPLE_B1F_1
	warp_def  3,  4, 1, ICE_TEMPLE_B2F_1

	db 0 ; coord events

	db 2 ; bg events
	signpost  4,  2, SIGNPOST_READ, IceTempleCampfire3
	signpost  4,  5, SIGNPOST_READ, IceTempleCampfire4

	db 3 ; object events
	object_event  2,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire3, EVENT_ICE_TEMPLE_CAMPFIRE_3_UNLIT
	object_event  5,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire4, EVENT_ICE_TEMPLE_CAMPFIRE_4_UNLIT
	itemball_event  2,  5, TORCH, 1, EVENT_ICE_TEMPLE_GOT_TORCH


	const_def 1 ; object constants
	const ICE_TEMPLE_B1F_3_FIRE_1
	const ICE_TEMPLE_B1F_3_FIRE_2

	
IceTempleB1F3CampfiresCallback:
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_3_UNLIT
	iffalse .OpenSesame1
.cont1
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_4_UNLIT
	iffalse .OpenSesame2
.cont2
	return
	
.OpenSesame1
	changeblock $2, $4, $d0
	jump .cont1
.OpenSesame2
	changeblock $4, $4, $d1
	jump .cont2
	
IceTempleCampfire3:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_3_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_3_FIRE_1
	changeblock $2, $4, $d4
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	pause 20
	playsound SFX_SQUEAK
	changeblock $2, $4, $d8
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $2, $4, $dc
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $2, $4, $d0
	opentext
	writetext IceTempleCampfireText3
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_3_UNLIT
	end
	
IceTempleCampfire4:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_4_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_3_FIRE_2
	changeblock $4, $4, $d5
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	pause 20
	playsound SFX_SQUEAK
	changeblock $4, $4, $d9
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $4, $4, $dd
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $4, $4, $d1
	opentext
	writetext IceTempleCampfireText3
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_4_UNLIT
	end
	