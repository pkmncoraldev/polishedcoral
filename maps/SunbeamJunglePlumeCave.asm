SunbeamJunglePlumeCave_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 13,  3, 8, SUNBEAM_JUNGLE

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_MISC_OVERHEAD, -2, -2, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 13, 10, SPRITE_RAFFLESIA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJunglePlumeCaveBoss, EVENT_SUNBEAM_JUNGLE_PLUME_CAVE_VILEPLUME_GONE
;	person_event SPRITE_RAFFLESIA, 10, 13, SPRITEMOVEDATA_PLUME_BOSS, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event  5, 10, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 6, 6, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 13, 3, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	object_event 15, 6, SPRITE_RAFFLESIA, SPRITEMOVEDATA_CUTTABLE_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamJungleRafflesia, -1
	tmhmball_event 13,  9, TM_GIGA_DRAIN, EVENT_TM19


SunbeamJunglePlumeCaveBoss:
	applyonemovement PLAYER, remove_fixed_facing
	callasm HasCutAvailable
;	ifequal 1, .no
	opentext
	checkflag ENGINE_AUTOCUT_ACTIVE
	iftrue .cont
	writetext SunbeamJunglePlumeCaveCutText
	yesorno
	iftrue .cont
	endtext
.cont
	callasm VileplumeCutAsm
	writetext SunbeamJunglePlumeCaveCutText2
	closetext
	waitsfx
	copybytetovar wBuffer6
	refreshscreen
	pokepic 0, 0
	cry 0
	waitsfx
	closepokepic
	waitsfx
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	pause 20
	special Special_FadeOutMusic
	pause 50
	spriteface 2, DOWN
	playsound SFX_INTRO_PICHU
	pause 5
	spriteface 2, UP
	pause 10
	spriteface 2, DOWN
	playsound SFX_INTRO_PICHU
	pause 5
	spriteface 2, UP
	pause 100
	playsound SFX_DITTO_POP_UP
	changeaction 2, PERSON_ACTION_PLUME_BOSS
	pause 75
	changeaction 2, PERSON_ACTION_STAND, LEFT
	applyonemovement 2, turn_step_left
	playsound SFX_INTRO_PICHU
	waitsfx
	applyonemovement 2, remove_fixed_facing
	pause 50
	
	opentext TEXTBOX_POKEMON, VILEPLUME
	writetext SunbeamJunglePlumeCaveVileplumeText
	cry VILEPLUME
	waitbutton
	closetext
	waitsfx
	loadwildmon VILEPLUME, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $1, .lose
	disappear 2
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_SUNBEAM_JUNGLE_PLUME_CAVE_VILEPLUME_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal VILEPLUME, .CaughtLedian
	opentext
	writetext SunbeamJunglePlumeCaveVileplumeTextGone
	waitbutton
	closetext
.CaughtLedian
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	setevent EVENT_UNIQUE_ENCOUNTER_VILEPLUME_BOSS
	end
.lose
	clearevent EVENT_SUNBEAM_JUNGLE_PLUME_CAVE_VILEPLUME_GONE
	reloadmapafterbattle
.no
	end
	
VileplumeCutAsm:
	farjp _VileplumeCutAsm
	
SunbeamJunglePlumeCaveCutText:
	text "This big flower"
	line "can be CUT!"
	
	para "Want to use CUT?"
	done
	
SunbeamJunglePlumeCaveCutText2:
	text_from_ram wStringBuffer2
	text " used"
	line "CUT!"
	prompt
	
SunbeamJunglePlumeCaveVileplumeText:
	text "PLUUULULUU!"
	done
	
SunbeamJunglePlumeCaveVileplumeTextGone:
	text "VILEPLUME"
	line "sauntered away."
	done
