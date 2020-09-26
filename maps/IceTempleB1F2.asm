IceTempleB1F2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, IceTempleB1F2CampfiresCallback

	db 4 ; warp events
	warp_def 19,  2, 3, ICE_TEMPLE_B1F_1
	warp_def 19,  3, 4, ICE_TEMPLE_B1F_1
	warp_def 19, 22, 5, ICE_TEMPLE_B1F_1
	warp_def 19, 23, 6, ICE_TEMPLE_B1F_1

	db 0 ; coord events

	db 2 ; bg events
	signpost 17,  7, SIGNPOST_READ, IceTempleCampfire1
	signpost 17, 18, SIGNPOST_READ, IceTempleCampfire2

	db 2 ; object events
	object_event  7, 17, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire1, EVENT_ICE_TEMPLE_CAMPFIRE_1_UNLIT
	object_event 18, 17, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire2, EVENT_ICE_TEMPLE_CAMPFIRE_2_UNLIT


	const_def 1 ; object constants
	const ICE_TEMPLE_B1F_2_FIRE_1
	const ICE_TEMPLE_B1F_2_FIRE_2
	
	
IceTempleB1F2CampfiresCallback:
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_1_UNLIT
	iffalse .OpenSesame1
.cont1
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_2_UNLIT
	iffalse .OpenSesame2
.cont2
	return
	
.OpenSesame1
	changeblock $6, $10, $bc
	jump .cont1
.OpenSesame2
	changeblock $12, $10, $bd
	jump .cont2
	
IceTempleCampfire1:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_1_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_2_FIRE_1
	changeblock $6, $10, $c0
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	pause 20
	playsound SFX_SQUEAK
	changeblock $6, $10, $c4
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $6, $10, $c8
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $6, $10, $bc
	opentext
	writetext IceTempleCampfireText3
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_1_UNLIT
	end
	
IceTempleCampfire2:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_2_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_2_FIRE_2
	changeblock $12, $10, $c1
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	pause 20
	playsound SFX_SQUEAK
	changeblock $12, $10, $c5
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $12, $10, $c9
	reloadmappart
	pause 20
	playsound SFX_SQUEAK
	changeblock $12, $10, $bd
	opentext
	writetext IceTempleCampfireText3
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_2_UNLIT
	end
	
IceTemplePlayerTorchNotLit2:
	opentext
	writetext IceTempleUnlitCampfireText
	waitbutton
	closetext
	end
	
IceTempleCampfireText1:
	text "An unlit campfire."
	
	para "Light it?"
	done
	
IceTempleCampfireText2:
	text "<PLAYER> lit"
	line "the campfire."
	done
	
IceTempleCampfireText3:
	text "The ice block"
	line "melted away…"
	done
	
IceTempleUnlitCampfireText:
	text "An unlit campfire."
	done
	
Movement_IceTempleIceBlock:
	step_sleep 15
	turn_step_left
	step_sleep 5
	turn_step_up
	step_sleep 15
	step_end
