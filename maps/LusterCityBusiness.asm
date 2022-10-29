LusterCityBusiness_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BusinessCallback

	db 6 ; warp events
	warp_event 16, 13, LUSTER_SKYSCRAPER_1_1F, 1
	warp_event 17, 13, LUSTER_SKYSCRAPER_1_1F, 2
	warp_event 22, 25, LUSTER_SKYSCRAPER_2_1F, 1
	warp_event 23, 25, LUSTER_SKYSCRAPER_2_1F, 2
	warp_event 24, 11, NETT_BUILDING_1F, 1
	warp_event 25, 11, NETT_BUILDING_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	signpost 12, 23, SIGNPOST_READ, NettBuildingSign

	db 11 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 24, 14, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_POKEMANIAC, 33, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC1, -1
	person_event SPRITE_SUPER_NERD, 29, 30, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC2, -1
	person_event SPRITE_BEAUTY, 19, 36, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster3NPC3, -1
	person_event SPRITE_SUPER_NERD, 16, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC4, -1
	person_event SPRITE_LADY, 17, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster3NPC5, -1
	person_event SPRITE_ROCKER, 17, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster3NPC6, -1
	person_event SPRITE_POKEMANIAC, 26, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC7, -1
	person_event SPRITE_SUPER_NERD, 13, 26, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster3NPC8, -1
	person_event SPRITE_POKEFAN_F, 24, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster3NPC9, -1
	person_event SPRITE_CHILD, 25, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Luster3NPC10, -1

	const_def 1 ; object constants
	const LUSTERBUSINESS_TRAFFIC_LIGHT
	const LUSTERBUSINESS_NPC1
	const LUSTERBUSINESS_NPC2
	const LUSTERBUSINESS_NPC3
	const LUSTERBUSINESS_NPC4
	const LUSTERBUSINESS_NPC5
	const LUSTERBUSINESS_NPC6
	const LUSTERBUSINESS_NPC7
	const LUSTERBUSINESS_NPC8
	const LUSTERBUSINESS_NPC9
	const LUSTERBUSINESS_NPC10
	
	
BusinessCallback:
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	setevent EVENT_IN_BUSINESS_DISTRICT
	return
	
NettBuildingSign:
	jumptext NettBuildingSignText
	
Luster3NPC1:
	jumptextfaceplayer Luster3NPC1Text
	
Luster3NPC1Text:
	text "The BUSINESS"
	line "DISTRICT is no"
	cont "place for a kid!"
	
	para "This place is"
	line "strictly for"
	cont "no-nonsense"
	cont "business!"
	
	para "Come back when"
	line "you have bills"
	cont "to pay, mouths to"
	cont "feed, and business"
	cont "to do!"
	done
	
Luster3NPC2:
	jumptextfaceplayer Luster3NPC2Text
	
Luster3NPC2Text:
	text "Meetings, due"
	line "dates, proposals…"
	
	para "Sometimes I wish I"
	line "was just a #MON"
	cont "TRAINER like you!"
	done
	
Luster3NPC3:
	jumptextfaceplayer Luster3NPC3Text
	
Luster3NPC3Text:
	text "I think I'm lost!"
	
	para "I'm looking for the"
	line "mall,"
	
	para "but there's just a"
	line "bunch of boring"
	cont "office buildings"
	cont "around here!"
	done
	
Luster3NPC4:
	faceplayer
	opentext
	checktmhm TM_WORK_UP_GROWTH
	iftrue .got_tm
	writetext Luster3NPC4Text1
	waitbutton
	verbosegivetmhm TM_WORK_UP_GROWTH
	writetext Luster3NPC4Text2
	waitbutton
	closetext
	end
.got_tm
	writetext Luster3NPC4Text3
	waitbutton
	closetext
	end
	
Luster3NPC4Text1:
	text "Work! Work! Work!"
	
	para "In the morning,"
	line "I'm late for work!"
	
	para "In the evening,"
	line "I stay late after"
	cont "work!"
	
	para "At night, I'm up"
	line "late THINKING"
	cont "about work!"
	
	para "It gets me so"
	line "worked up!"
	
	para "Here! Take this!"
	done
	
Luster3NPC4Text2:
	text "That TM contains"
	line "the move WORK UP!"
	
	para "It raises the"
	line "user's ATTACK and"
	cont "SPCL. ATK!"
	
	para "It'll give you the"
	line "boost you need to"
	cont "get through the"
	cont "work day!"
	
	para "Now, if you'll"
	line "excuse me,"
	
	para "I gotta get"
	line "back to work!"
	done
	
Luster3NPC4Text3:
	text "Work! Work! Work!"
	done
	
Luster3NPC5:
	faceplayer
	opentext
	writetext Luster3NPC5Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC5, UP
	end
	
Luster3NPC5Text:
	text "There it is!"
	
	para "The NETT BUILDING!"
	
	para "The tallest"
	line "building in the"
	cont "ONWA REGION!"
	
	para "I wonder what they"
	line "do inside."
	done
	
Luster3NPC6:
	faceplayer
	opentext
	writetext Luster3NPC6Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC6, UP
	end
	
Luster3NPC6Text:
	text "Is this what you"
	line "do on vacation?"
	
	para "Just look at tall"
	line "buildings?"
	
	para "I don't get it…"
	done

Luster3NPC7:
	jumptextfaceplayer Luster3NPC7Text
	
Luster3NPC7Text:
	text "They say this area"
	line "is a concrete"
	cont "jungle,"
	
	para "but at night, when"
	line "all the lights"
	cont "come on,"
	
	para "I think there is a"
	line "certain charm to"
	cont "it."
	done
	
Luster3NPC8:
	jumptextfaceplayer Luster3NPC8Text
	
Luster3NPC8Text:
	text "This is the NETT"
	line "CORP. building."
	
	para "The CEO of NETT"
	line "CORP. is MR. NETT."
	
	para "He's a super rich"
	line "tech genious and"
	cont "philanthropist."
	done
	
Luster3NPC9:
	faceplayer
	opentext
	writetext Luster3NPC9Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC9, LEFT
	end
	
Luster3NPC9Text:
	text "Now, now!"
	
	para "We have to wait"
	line "our turn before"
	cont "crossing the road!"
	
	para "We can cross when"
	line "the light changes."
	done
	
Luster3NPC10:
	faceplayer
	opentext
	writetext Luster3NPC10Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC10, LEFT
	end
	
Luster3NPC10Text:
	text "The light is NEVER"
	line "gonna change…"
	done

NettBuildingSignText:
	text "NETT CORP."
	
	para "“To Capture a"
	line "Better Tomorrow”"
	done
