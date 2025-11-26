BoneCavernMarowakRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 11, 21, 8, BONE_CAVERN_B1F
	warp_def  7, 23, 3, BONE_CAVERN_MAROWAK_ROOM
	warp_def 13,  7, 2, BONE_CAVERN_MAROWAK_ROOM

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  4, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 10,  8, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event  4, 10, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 20,  6, SIGNPOST_READ, BoneCavernB1FBone4

	db 1 ; object events
	object_event  7,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MAROWAK, -1, -1, (1 << 3) | PAL_NPC_TEAL, PERSONTYPE_SCRIPT, ALOLAN_FORM, BoneCavernMarowak, EVENT_BONE_CAVERN_MAROWAK_GONE
	
	
BoneCavernMarowak:
	opentext TEXTBOX_POKEMON, MAROWAK
	writetext BoneCavernMarowakText
	cry MAROWAK
	waitbutton
	closetext
	waitsfx
	loadwildmon MAROWAK, ALOLAN_FORM, 55
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY_2
	startbattle
	if_equal $1, .lose
	disappear 1
	reloadmapafterbattle
	setevent EVENT_BONE_CAVERN_MAROWAK_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal MAROWAK, .CaughtMarowak
	opentext
	writetext BoneCavernMarowakTextGone
	waitbutton
	closetext
.CaughtMarowak
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	setevent EVENT_UNIQUE_ENCOUNTER_MAROWAK_BOSS
	end
.lose
	clearevent EVENT_BONE_CAVERN_MAROWAK_GONE
	reloadmapafterbattle
	end

BoneCavernMarowakText:
	text "WACK-A KAAA!"
	done

BoneCavernMarowakTextGone:
	text "MAROWAK fled deep"
	line "into the cave!"
	done
