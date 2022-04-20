IceTempleB2F1_MapScriptHeader:
	db 1 ; scene scripts
	scene_script IceTempleB2F1Trigger0

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, IceTempleB2F1CampfiresCallback

	db 5 ; warp events
	warp_def  3, 15, 3, ICE_TEMPLE_B1F_3
	warp_def  1, 1, 1, ICE_TEMPLE_B2F_2
	warp_def  1, 2, 2, ICE_TEMPLE_B2F_2
	warp_def  1, 11, 3, ICE_TEMPLE_B2F_2
	warp_def  1, 12, 4, ICE_TEMPLE_B2F_2

	db 0 ; coord events

	db 4 ; bg events
	signpost  1,  3, SIGNPOST_READ, IceTempleTorch8
	signpost  1,  0, SIGNPOST_READ, IceTempleTorch9
	signpost  4,  6, SIGNPOST_READ, IceTempleCampfire5
	signpost  4,  9, SIGNPOST_READ, IceTempleCampfire6

	db 13 ; object events
	object_event  3,  0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_8_UNLIT
	object_event  0,  0, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TORCH_9_UNLIT
	object_event  6,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire5, EVENT_ICE_TEMPLE_CAMPFIRE_5_UNLIT
	object_event  9,  4, SPRITE_CAMPFIRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, IceTempleCampfire6, EVENT_ICE_TEMPLE_CAMPFIRE_6_UNLIT
	person_event SPRITE_BIG_MAMOSWINE,  3,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_PURPLE
	person_event SPRITE_BIG_MAMOSWINE,  3,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_PURPLE
	person_event SPRITE_BIG_MAMOSWINE,  4,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_PURPLE
	person_event SPRITE_BIG_MAMOSWINE,  4,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_PURPLE
	person_event SPRITE_BIG_MAMOSWINE,  3,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_TEAL
	person_event SPRITE_BIG_MAMOSWINE,  3,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_TEAL
	person_event SPRITE_BIG_MAMOSWINE,  4,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_TEAL
	person_event SPRITE_BIG_MAMOSWINE,  4,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, IceTempleMamoswine, EVENT_MAMOSWINE_TEAL
	itemball_event  8,  2, CLAY_POT, 1, EVENT_ICE_TEMPLE_GOT_TREASURE
	
	
	const_def 1 ; object constants
	const ICE_TEMPLE_B2F_1_FIRE_1
	const ICE_TEMPLE_B2F_1_FIRE_2
	const ICE_TEMPLE_B2F_1_FIRE_3
	const ICE_TEMPLE_B2F_1_FIRE_4
	const ICE_TEMPLE_B2F_1_MAMOSWINEP1
	const ICE_TEMPLE_B2F_1_MAMOSWINEP2
	const ICE_TEMPLE_B2F_1_MAMOSWINEP3
	const ICE_TEMPLE_B2F_1_MAMOSWINEP4
	const ICE_TEMPLE_B2F_1_MAMOSWINET1
	const ICE_TEMPLE_B2F_1_MAMOSWINET2
	const ICE_TEMPLE_B2F_1_MAMOSWINET3
	const ICE_TEMPLE_B2F_1_MAMOSWINET4
	
	
IceTempleB2F1Trigger0:
	end
	
IceTempleB2F1CampfiresCallback:
	checkevent EVENT_BEAT_MAMOSWINE
	iftrue .beat_mamo
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_MAMOSWINE_TEAL
	clearevent EVENT_MAMOSWINE_PURPLE
	jump .cont
.purple
	setevent EVENT_MAMOSWINE_PURPLE
	clearevent EVENT_MAMOSWINE_TEAL
	jump .cont
.beat_mamo
	setevent EVENT_MAMOSWINE_PURPLE
	setevent EVENT_MAMOSWINE_TEAL
.cont
	checkevent EVENT_TORCH_8_UNLIT
	iffalse .OpenSesame1
.cont1
	checkevent EVENT_TORCH_9_UNLIT
	iffalse .OpenSesame2
.cont2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_5_UNLIT
	iffalse .OpenSesame3
.cont3
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_6_UNLIT
	iffalse .OpenSesame4
.cont4
	return
	
.OpenSesame1
	changeblock $2, $0, $ed
	jump .cont1
.OpenSesame2
	changeblock $0, $0, $ec
	jump .cont2
.OpenSesame3
	changeblock $6, $4, $ea
	jump .cont3
.OpenSesame4
	changeblock $8, $4, $eb
	jump .cont4
	
IceTempleMamoswine:
	jumptext IceTempleMamoswineText1
	
IceTempleMamoswineCutscene:
	setevent EVENT_MAMOSWINE_CUTSCENE
	pause 30
	special Special_FadeOutMusic
	pause 20
	playsound SFX_EMBER
	earthquake 60
	pause 20
	opentext
	writetext IceTempleMamoswineText2
	waitbutton
	closetext
	playsound SFX_EMBER
	loadvar wTimeOfDayPalFlags, $40 | 1
	earthquake 60
	waitsfx
	pause 20
	opentext
	writetext IceTempleMamoswineText3
	waitbutton
	closetext
	playsound SFX_EMBER
	earthquake 60
	pause 40
	opentext
	writetext IceTempleMamoswineText4
	cry MAMOSWINE
	waitbutton
	closetext
	waitsfx
	loadwildmon MAMOSWINE, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, .cont
	disappear ICE_TEMPLE_B2F_1_MAMOSWINEP1
	disappear ICE_TEMPLE_B2F_1_MAMOSWINEP2
	disappear ICE_TEMPLE_B2F_1_MAMOSWINEP3
	disappear ICE_TEMPLE_B2F_1_MAMOSWINEP4
	disappear ICE_TEMPLE_B2F_1_MAMOSWINET1
	disappear ICE_TEMPLE_B2F_1_MAMOSWINET2
	disappear ICE_TEMPLE_B2F_1_MAMOSWINET3
	disappear ICE_TEMPLE_B2F_1_MAMOSWINET4
	setevent EVENT_BEAT_MAMOSWINE
.cont
	reloadmapafterbattle
	playmusic MUSIC_LUSTER_SEWER
	clearevent EVENT_MAMOSWINE_CUTSCENE
.end
	end
	
IceTempleTorch8:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_8_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B2F_1_FIRE_1
	changeblock $2, $0, $ed
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_8_UNLIT
	end
	
IceTempleTorch9:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit
	checkevent EVENT_TORCH_9_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit
	opentext
	writetext IceTempleFireText4
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B2F_1_FIRE_2
	changeblock $0, $0, $ec
	opentext
	writetext IceTempleFireText5
	waitbutton
	closetext
	clearevent EVENT_TORCH_9_UNLIT
	end
	
IceTempleCampfire5:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_5_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B2F_1_FIRE_3
	changeblock $6, $4, $ea
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_5_UNLIT
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_6_UNLIT
	iftrue .end
	pause 5
	applyonemovement PLAYER, step_right
	spriteface PLAYER, UP
	jump IceTempleMamoswineCutscene
.end
	end
	
IceTempleCampfire6:
	checkitem TORCH
	iffalse IceTemplePlayerTorchNotLit2
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_6_UNLIT
	iffalse IceTempleFire
	checkevent EVENT_TORCH_LIT
	iffalse IceTemplePlayerTorchNotLit2
	opentext
	writetext IceTempleCampfireText1
	yesorno
	iffalse IceTempleTorchNo
	closetext
	appear ICE_TEMPLE_B2F_1_FIRE_4
	changeblock $8, $4, $eb
	opentext
	writetext IceTempleCampfireText2
	waitbutton
	closetext
	clearevent EVENT_ICE_TEMPLE_CAMPFIRE_6_UNLIT
	checkevent EVENT_ICE_TEMPLE_CAMPFIRE_5_UNLIT
	iftrue .end
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
	spriteface PLAYER, UP
	jump IceTempleMamoswineCutscene
.end
	end
	
IceTempleMamoswineText1:
	text "A huge #MON is"
	line "frozen solid!"
	done
	
IceTempleMamoswineText2:
	text "It's beginning to"
	line "thaw out!"
	done
	
IceTempleMamoswineText3:
	text "The beast stirs!"
	done
	
IceTempleMamoswineText4:
	text "GAH! OOOOOO!"
	done
	