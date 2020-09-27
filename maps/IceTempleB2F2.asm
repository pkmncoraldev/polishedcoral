IceTempleB2F2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, IceTempleB2F2CampfiresCallback

	db 4 ; warp events
	warp_def 13,  9, 2, ICE_TEMPLE_B2F_1
	warp_def 13, 10, 3, ICE_TEMPLE_B2F_1
	warp_def 13, 19, 4, ICE_TEMPLE_B2F_1
	warp_def 13, 20, 5, ICE_TEMPLE_B2F_1

	db 0 ; coord events

	db 1 ; bg events
	signpost  6, 13, SIGNPOST_READ, IceTempleCampfire7

	db 1 ; object events
	object_event 13,  6, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire7, EVENT_ICE_TEMPLE_CAMPFIRE_7_UNLIT

	
	const_def 1 ; object constants
	const ICE_TEMPLE_B2F_2_FIRE
	
IceTempleB2F2CampfiresCallback:
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_7_UNLIT
	iffalse .OpenSesame
	return
	
.OpenSesame
	changeblock $c, $6, $eb
	return
	
IceTempleCampfire7:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_7_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B2F_2_FIRE
	changeblock $c, $6, $eb
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_7_UNLIT
	end