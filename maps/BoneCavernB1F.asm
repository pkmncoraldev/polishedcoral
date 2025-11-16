BoneCavernB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BoneCavernB1FCallback

	db 7 ; warp events
	warp_def  9,  3, 1, ROUTE_32
	warp_def  3,  5, 3, BONE_CAVERN_B1F
	warp_def 26,  9, 2, BONE_CAVERN_B1F
	warp_def  5, 13, 1, BONE_CAVERN_B2F
	warp_def 13, 19, 2, BONE_CAVERN_B2F
	warp_def 11, 33, 3, BONE_CAVERN_B2F
	warp_def 21, 33, 4, BONE_CAVERN_B2F

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6, 18, SIGNPOST_READ, BoneCavernB1FBone1
	bg_event 10, 22, SIGNPOST_READ, BoneCavernB1FBone2
	bg_event 26, 20, SIGNPOST_READ, BoneCavernB1FBone3
	bg_event 16, 10, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 26,  6, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 18, 18, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 28, 16, SIGNPOST_READ, BoneCavernB1FBone4

	db 13 ; object events
	smashrock_event 24, 14
	smashrock_event 25, 13
	smashrock_event 24, 15
	smashrock_event 25, 15
	strengthboulder2_event 21, 10, -1
	strengthboulder2_event 11, 17, -1
	person_event SPRITE_BONES,  9, 16, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_BONES, 17,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_1_TOP_GONE
	person_event SPRITE_BONES, 21, 10, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	person_event SPRITE_BONES, 19, 26, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_3_TOP_GONE
	person_event SPRITE_BONES, 18,  6, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_1_BOTTOM_GONE
	person_event SPRITE_BONES, 22, 10, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_2_BOTTOM_GONE
	person_event SPRITE_BONES, 20, 26, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_3_BOTTOM_GONE
	
	
BoneCavernB1FCallback:
	checkevent EVENT_BONE_CAVERN_BONE_1_TOP_GONE
	iffalse .skip1
	changeblock $06, $12, $2b
.skip1
	checkevent EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	iffalse .skip2
	changeblock $0a, $16, $82
.skip2
	checkevent EVENT_BONE_CAVERN_BONE_3_TOP_GONE
	iffalse .skip3
	changeblock $1a, $14, $2b
.skip3
	return

BoneCavernB1FBone1:
	checkevent EVENT_BONE_CAVERN_BONE_1_TOP_GONE
	iftrue .done
	jumptext BoneCavernBoneText1
.done
	jumptext BoneCavernBoneText2
	
BoneCavernB1FBone2:
	checkevent EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	iftrue .done
	jumptext BoneCavernBoneText1
.done
	jumptext BoneCavernBoneText2
	
BoneCavernB1FBone3:
	checkevent EVENT_BONE_CAVERN_BONE_3_TOP_GONE
	iftrue .done
	jumptext BoneCavernBoneText1
.done
	jumptext BoneCavernBoneText2
	
BoneCavernB1FBone4:
	jumptext BoneCavernBoneText4
	
BoneCavernBoneText1:
	text "A pillar of bone"
	line "stretches up from"
	cont "the floor below."
	
	para "It blocks the way."
	done
	
BoneCavernBoneText2:
	text "The bone fell and"
	line "is now flush with"
	cont "the ground."
	
	para "It should be safe"
	line "to walk on."
	done
	
BoneCavernBoneText3:
	text "The bone fell,"
	line "opening the way on"
	cont "the floor above!"
	done
	
BoneCavernBoneText4:
	text "A big, sturdy"
	line "bone sticks out"
	cont "of the ground."
	done
