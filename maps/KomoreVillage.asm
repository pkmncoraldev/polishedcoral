KomoreVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, KomoreVillageFlyPoint
	callback MAPCALLBACK_TILES, KomoreVillageCallback

	db 7 ; warp events
	warp_def 19, 32, 1, KOMORE_COMMUNITY_CENTER
	warp_def 19, 33, 2, KOMORE_COMMUNITY_CENTER
	warp_def  7, 11, 1, KOMORE_HOUSE_1
	warp_def 13, 23, 1, KOMORE_HOUSE_2
	warp_def 13, 13, 1, KOMORE_HOUSE_3
	warp_def  5, 31, 1, KOMORE_POKECENTER
	warp_def  7, 19, 1, KOMORE_MART

	db 0 ; coord events

	db 6 ; bg events
	signpost  4, 27, SIGNPOST_JUMPTEXT, KomoreVillageSign
	signpost 20, 31, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign
	signpost  5, 32, SIGNPOST_READ, KomoreVillagePokeCenterSign
	signpost  7, 20, SIGNPOST_READ, KomoreVillageMartSign
	signpost 20, 28, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 21, 28, SIGNPOST_IFNOTSET, KomoreVillageTree

	db 2 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK

KomoreVillageFlyPoint:
	setflag ENGINE_FLYPOINT_KOMORE
	return
	
KomoreVillageCallback:
	checkevent EVENT_KOMORE_VILLAGE_TREE
	iffalse .skip
	changeblock $1c, $14, $bb
.skip
	jump Route23Callback
	
KomoreVillageSign:
	text "KOMORE VILLAGE"
	
	para "Shining like the"
	line "light through the"
	cont "trees."
	done
	
KomoreCommunityCenterSign:
	text "K-MORE COM-UN-TY"
	line "CEN-ER"
	
	para "The letters are"
	line "worn away…"
	done
	
KomoreVillageTreeText1:
	text "A huge fallen"
	line "tree blocks the"
	cont "way…"
	done
	
KomoreVillageTreeText2:
	text "A huge fallen"
	line "tree blocks the"
	cont "way…"
	
	para "Move it with"
	line "STRENGTH?"
	done
	
KomoreVillageTreeText3:
	text_from_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done
	
KomoreVillagePokeCenterSign:
	jumpstd pokecentersign
	
KomoreVillageMartSign:
	jumpstd martsign
	
KomoreVillageTree:
	dw EVENT_KOMORE_VILLAGE_TREE
	callasm KomoreTreeAsm
	iffalse .yes
	jumptext KomoreVillageTreeText1
.yes
	opentext
	writetext KomoreVillageTreeText2
	yesorno
	iffalse .said_no
	callasm KomoreTreeAsm2
	writetext KomoreVillageTreeText3
	waitbutton
	closetext
;	scall FieldMovePokepicScript
	copybytetovar wBuffer6
	refreshscreen
	pokepic 0, 0
	cry 0
	waitsfx
	closepokepic
	reloadmappart
;
	special FadeOutPalettesBlack
	pause 10
	playsound SFX_THUNDER
	waitsfx
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	waitsfx
	changeblock $1c, $14, $bb
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_KOMORE_VILLAGE_TREE
	end
.said_no
	endtext
	
KomoreTreeAsm:
	farcall TryStrengthOW
	ret
	
KomoreTreeAsm2:
	farcall PrepareOverworldMove
	ret