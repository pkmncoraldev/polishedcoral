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
	signpost -1, -1, SIGNPOST_JUMPTEXT, KomoreCommunityCenterSign
	signpost  5, 32, SIGNPOST_READ, KomoreVillagePokeCenterSign
	signpost  7, 20, SIGNPOST_READ, KomoreVillageMartSign
	signpost 20, 28, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 21, 28, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 20, 29, SIGNPOST_IFNOTSET, KomoreVillageTree
	signpost 19, 18, SIGNPOST_READ, KomoreTeaMasterSign

	db 7 ; object events
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -5, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_PICNICKER,  9, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KomoreVillageNPC1, -1
	person_event SPRITE_BATTLE_GIRL, 20, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KomoreVillageNPC2, -1
	person_event SPRITE_FISHING_GURU, 14, 17, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KomoreVillageNPC3, -1
	person_event SPRITE_PONYTAIL,  7, 14, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KomoreVillageNPC4, -1
	object_event 15,  7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SHROOMISH, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KomoreShroomish, -1

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
	text "Have you found"
	line "any pretty leaves?"
	
	para "Just walking in"
	line "the leaves is all"
	cont "it takes to find"
	cont "rare ones."
	done
	
KomoreVillageNPC2:
	jumptextfaceplayer KomoreVillageNPC2Text
	
KomoreVillageNPC2Text:
	text "Even if you don't"
	line "buy into the spir-"
	cont "ituality of it,"
	
	para "there is a lot to"
	line "learn from the"
	cont "MASTER's teachings."
	done
	
KomoreVillageNPC3:
	jumptextfaceplayer KomoreVillageNPC3Text
	
KomoreVillageNPC3Text:
	text "I want to catch"
	line "a SKARMORY, but I"
	cont "can't find one!"
	
	para "Do they only"
	line "appear on certain"
	cont "days?"
	done
	
KomoreVillageNPC4:
	jumptextfaceplayer KomoreVillageNPC4Text
	
KomoreVillageNPC4Text:
	text "I found my friend"
	line "here while I was"
	cont "picking mushrooms."
	
	para "I thought I found"
	line "a BALMMUSHROOM,"
	
	para "but I actually"
	line "found a best pal!"
	done
	
KomoreShroomish:
	opentext TEXTBOX_POKEMON, SHROOMISH
	writetext KomoreShroomishText
	cry SHROOMISH
	waitbutton
	closetext
	end
	
KomoreShroomishText:
	text "Mish mish mish!"
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
