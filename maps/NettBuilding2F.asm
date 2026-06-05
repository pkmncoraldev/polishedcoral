NettBuilding2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 21,  2, NETT_BUILDING_1F, 3
	warp_event 17,  2, NETT_BUILDING_3F, 1

	db 7 ; coord events
	coord_event 16,  9, -1, NettBuilding2FTeleporter1
	coord_event 15, 15, -1, NettBuilding2FTeleporter2
	coord_event 21, 15, -1, NettBuilding2FTeleporter3
	coord_event 11,  9, -1, NettBuilding2FTeleporter4
	coord_event  3,  9, -1, NettBuilding2FTeleporter5
	coord_event  7, 15, -1, NettBuilding2FTeleporter6
	coord_event  1, 15, -1, NettBuilding2FTeleporter7

	db 1 ; bg events
	signpost  2, 19, SIGNPOST_JUMPTEXT, NettBuilding2FSignText

	db 1 ; object events
	person_event SPRITE_SNARE_GIRL,  2,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, NettBuilding2FNurse, -1
	
	
NettBuilding2FSignText:
	text "FLOOR 2"
	done
	
NettBuilding3FSignText:
	text "FLOOR 3"
	done
	
NettBuilding4FSignText:
	text "FLOOR 4"
	done
	
NettBuilding5FSignText:
	text "FLOOR 5"
	done
	
NettBuilding6FSignText:
	text "FLOOR 6"
	done
	
NettBuilding7FSignText:
	text "FLOOR 7"
	done
	
NettBuilding2FNurse:
	faceplayer
	opentext
	writetext NettBuilding2FNurseText1
	yesorno
	iffalse .no_heal
	closetext	
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	end
.no_heal
	writetext NettBuilding2FNurseText2
	waitbutton
	closetext
	end
	
NettBuilding2FTeleporter1:
	teleporter NETT_BUILDING_3F, 22, 7
	end
	
NettBuilding2FTeleporter2:
	teleporter NETT_BUILDING_3F, 11, 5
	end
	
NettBuilding2FTeleporter3:
	teleporter NETT_BUILDING_6F, 1, 15
	end
	
NettBuilding2FTeleporter4:
	teleporter NETT_BUILDING_3F, 21, 15
	end
	
NettBuilding2FTeleporter5:
	teleporter NETT_BUILDING_3F, 3, 13
	end
	
NettBuilding2FTeleporter6:
	teleporter NETT_BUILDING_6F, 13, 13
	end
	
NettBuilding2FTeleporter7:
	teleporter NETT_BUILDING_4F, 17, 11
	end
	
NettBuilding2FNurseText1:
	text "I used to be a"
	line "nurse before I"
	cont "joined TEAM SNARE."
	done
	
NettBuilding2FNurseText2:
	text "TEXT 2"
	done
	
