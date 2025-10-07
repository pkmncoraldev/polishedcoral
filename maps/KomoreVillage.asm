KomoreVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, KomoreVillageFlyPoint
	callback MAPCALLBACK_TILES, KomoreVillageCallback

	db 8 ; warp events
	warp_def 19, 32, 1, KOMORE_COMMUNITY_CENTER
	warp_def 19, 33, 2, KOMORE_COMMUNITY_CENTER
	warp_def  7, 11, 1, KOMORE_HOUSE_1
	warp_def 13, 23, 1, KOMORE_HOUSE_2
	warp_def 13, 13, 1, KOMORE_HOUSE_3
	warp_def  5, 31, 1, KOMORE_POKECENTER
	warp_def  7, 19, 1, KOMORE_MART
	warp_def 18, 17, 1, KOMORE_TEA_HOUSE

	db 0 ; coord events

	db 8 ; bg events
	signpost  4, 27, SIGNPOST_JUMPTEXT, KomoreVillageSign
	signpost 20, 31, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign
	signpost  5, 32, SIGNPOST_READ, KomoreVillagePokeCenterSign
	signpost  7, 20, SIGNPOST_READ, KomoreVillageMartSign
	signpost 20, 28, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 21, 28, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 20, 29, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 19, 18, SIGNPOST_READ, KomoreTeaMasterSign

	db 3 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_PICNICKER, 1, 1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KomoreVillageNPC1, -1

KomoreVillageFlyPoint:
	setflag ENGINE_FLYPOINT_KOMORE
	return
	
KomoreVillageCallback:
	checkevent EVENT_KOMORE_VILLAGE_TREE
	iffalse .skip
	changeblock $1c, $14, $bb
.skip
	jump Route23Callback2
	
KomoreVillageNPC1:
	jumptextfaceplayer KomoreVillageNPC1Text
	
KomoreVillageNPC1Text:
	text ""
	done
	
KomoreVillageNPC2:
	jumptextfaceplayer KomoreVillageNPC2Text
	
KomoreVillageNPC2Text:
	text ""
	done
	
KomoreVillageNPC3:
	jumptextfaceplayer KomoreVillageNPC3Text
	
KomoreVillageNPC3Text:
	text ""
	done
	
KomoreTeaMasterSign:
	checkevent EVENT_SPOKEN_TO_TEA_MASTER
	iftrue .alt
	setevent EVENT_MASTER_BREWER_SIGN
	jumptext KomoreTeaMasterSignText1
.alt
	checkevent EVENT_MASTER_BREWER_SIGN
	iftrue .alt2
	jumptext KomoreTeaMasterSignText2
.alt2
	jumptext KomoreTeaMasterSignText3
	
KomoreTeaMasterSignText1:
	text "Home of the"
	line "MASTER."
	done
	
KomoreTeaMasterSignText2:
	text "Home of the"
	line "MASTER BREWER."
	done
	
KomoreTeaMasterSignText3:
	text "Home of the"
	line "MASTER."
	
	para "…"
	
	para "Upon further"
	line "inspection, the"
	cont "word “BREWER ” is"
	cont "at the end in"
	cont "small letters."
	done
	
KomoreVillageSign:
	text "KOMORE VILLAGE"
	
	para "Shining like the"
	line "light through the"
	cont "trees."
	done
	
KomoreCommunityCenterSign:
	text "K MORE COM   ITY"
	line "CEN ER"
	
	para "…"
	
	para "The letters are"
	line "worn away…"
	done
	
KomoreVillagePokeCenterSign:
	jumpstd pokecentersign
	
KomoreVillageMartSign:
	setevent EVENT_SPOKEN_TO_TEA_MASTER
	jumpstd martsign
	
KomoreVillageTree:
	dw EVENT_KOMORE_VILLAGE_TREE
	strengthtree
	iffalse .end
	changeblock $1c, $14, $bb
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_KOMORE_VILLAGE_TREE
.end
	end
