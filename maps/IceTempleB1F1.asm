IceTempleB1F1_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, IceTempleB1F1TorchesCallback

	db 8 ; warp events
	warp_def 21, 20, 2, ICE_CAVE_B3F
	warp_def 21, 21, 3, ICE_CAVE_B3F
	warp_def  1,  2, 1, ICE_TEMPLE_B1F_2
	warp_def  1,  3, 2, ICE_TEMPLE_B1F_2
	warp_def  1, 20, 3, ICE_TEMPLE_B1F_2
	warp_def  1, 21, 4, ICE_TEMPLE_B1F_2
	warp_def 13, 20, 1, ICE_TEMPLE_B1F_3
	warp_def 13, 21, 2, ICE_TEMPLE_B1F_3

	db 2 ; coord events
	xy_trigger 1, 21, 20, 0, IceTempleFireForceTorchOut, 0, 0
	xy_trigger 1, 21, 21, 0, IceTempleFireForceTorchOut, 0, 0

	db 7 ; bg events
	signpost  3, 13, SIGNPOST_READ, IceTempleTorch1
	signpost  1,  4, SIGNPOST_READ, IceTempleTorch2
	signpost  1,  1, SIGNPOST_READ, IceTempleTorch3
	signpost  1, 22, SIGNPOST_READ, IceTempleTorch4
	signpost  1, 19, SIGNPOST_READ, IceTempleTorch5
	signpost 13, 22, SIGNPOST_READ, IceTempleTorch6
	signpost 13, 19, SIGNPOST_READ, IceTempleTorch7

	db 7 ; object events
	object_event 13,  2, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  4,  0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_2_UNLIT
	object_event  1,  0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_3_UNLIT
	object_event 22,  0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_4_UNLIT
	object_event 19,  0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_5_UNLIT
	object_event 22, 12, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_6_UNLIT
	object_event 19, 12, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_7_UNLIT
	
	
	const_def 1 ; object constants
	const ICE_TEMPLE_B1F_1_FIRE_1
	const ICE_TEMPLE_B1F_1_FIRE_2
	const ICE_TEMPLE_B1F_1_FIRE_3
	const ICE_TEMPLE_B1F_1_FIRE_4
	const ICE_TEMPLE_B1F_1_FIRE_5
	const ICE_TEMPLE_B1F_1_FIRE_6
	const ICE_TEMPLE_B1F_1_FIRE_7
	
IceTempleB1F1TorchesCallback:
	checkevent EVENT_TORCH_2_UNLIT
	iffalse .OpenSesame1
.cont1
	checkevent EVENT_TORCH_3_UNLIT
	iffalse .OpenSesame2
.cont2
	checkevent EVENT_TORCH_4_UNLIT
	iffalse .OpenSesame3
.cont3
	checkevent EVENT_TORCH_5_UNLIT
	iffalse .OpenSesame4
.cont4
	checkevent EVENT_TORCH_6_UNLIT
	iffalse .OpenSesame5
.cont5
	checkevent EVENT_TORCH_7_UNLIT
	iffalse .OpenSesame6
.cont6
	return

.OpenSesame1
	changeblock $4, $0, $8d
	jump .cont1
.OpenSesame2
	changeblock $0, $0, $8e
	jump .cont2
.OpenSesame3
	changeblock $16, $0, $8d
	jump .cont3
.OpenSesame4
	changeblock $12, $0, $8e
	jump .cont4
.OpenSesame5
	changeblock $16, $c, $8d
	jump .cont5
.OpenSesame6
	changeblock $12, $c, $8e
	jump .cont6
	
	
IceTempleFireForceTorchOut:
	dotrigger $0
	callasm ForceTorchOutAsm
	special Special_StopRunning
	clearevent EVENT_TORCH_LIT
	loadvar wTimeOfDayPalFlags, $40 | 0
	thistext

	text_jump TorchWentOutText
	db "@"
	end
	
IceTempleTorch1:
	checkitem TORCH
	iffalse IceTempleTorch1NoTorch
	jump IceTempleFire
	end
	
IceTempleTorch1NoTorch:
	opentext
	writetext IceTempleFireBlazingText
	waitbutton
	closetext
	end
	
IceTempleTorch2:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_2_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_1_FIRE_2
	changeblock $4, $0, $8d
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_2_UNLIT
	end
	
IceTempleTorch3:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_3_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_1_FIRE_3
	changeblock $0, $0, $8e
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_3_UNLIT
	end
	
IceTempleTorch4:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_4_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_1_FIRE_4
	changeblock $16, $0, $8d
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_4_UNLIT
	end
	
IceTempleTorch5:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_5_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_1_FIRE_5
	changeblock $12, $0, $8e
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_5_UNLIT
	end
	
IceTempleTorch6:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_6_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_1_FIRE_6
	changeblock $16, $c, $8d
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_6_UNLIT
	end
	
IceTempleTorch7:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_7_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B1F_1_FIRE_7
	changeblock $12, $c, $8e
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_7_UNLIT
	end

IceTempleFire:
	opentext
	writetext IceTempleFireText1
	yesorno
	iffalse IceTempleTorchNo
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .playerfemale
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .playerfemale
	writetext IceTempleFireText2Boy
	jump .cont
.playerfemale
	writetext IceTempleFireText2Girl
.cont
	waitbutton
	callasm LightTorchAsm
	setevent EVENT_TORCH_LIT
	loadvar wTimeOfDayPalFlags, $40 | 1
	closetext
	domaptrigger ICE_TEMPLE_B1F_1, $1
	end
	
IceTemplePlayerTorchNotLit:
	opentext
	writetext IceTempleUnlitTorchText
	waitbutton
	closetext
	end
	
IceTempleTorchNo:
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
LightTorchAsm:
	ld a, 50
	ld [wTorchSteps], a
	ret
	
ForceTorchOutAsm:
	ld a, 0
	ld [wTorchSteps], a
	ret
	
IceTempleFireText1:
	text "A fire is blazing!"
	
	para "Light your TORCH?"
	done
	
IceTempleFireText2Boy:
	text "<PLAYER> lit"
	line "his TORCH!"
	done
	
IceTempleFireText2Girl:
	text "<PLAYER> lit"
	line "her TORCH!"
	done
	
IceTempleFireText4:
	text "An unlit torch"
	line "sits on the wall."
	
	para "Light it?"
	done
	
IceTempleFireText5:
	text "<PLAYER> lit"
	line "the TORCH!"
	done
	
IceTempleFireBlazingText:
	text "A fire is blazing!"
	done
	
IceTempleUnlitTorchText:
	text "An unlit torch"
	line "sits on the wall."
	done
