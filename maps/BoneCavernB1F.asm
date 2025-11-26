BoneCavernB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BoneCavernB1FCallback

	db 8 ; warp events
	warp_def  9,  3, 1, ROUTE_32
	warp_def  3,  5, 3, BONE_CAVERN_B1F
	warp_def 26,  9, 2, BONE_CAVERN_B1F
	warp_def  5, 15, 1, BONE_CAVERN_B2F
	warp_def 13, 19, 2, BONE_CAVERN_B2F
	warp_def 11, 33, 3, BONE_CAVERN_B2F
	warp_def 21, 33, 4, BONE_CAVERN_B2F
	warp_def 15,  9, 1, BONE_CAVERN_MAROWAK_ROOM

	db 0 ; coord events

	db 8 ; bg events
	bg_event  6, 18, SIGNPOST_READ, BoneCavernB1FBone1
	bg_event 10, 22, SIGNPOST_READ, BoneCavernB1FBone2
	bg_event 26, 20, SIGNPOST_READ, BoneCavernB1FBone3
	bg_event 16, 10, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 26,  6, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 18, 18, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 28, 16, SIGNPOST_READ, BoneCavernB1FBone4
	signpost 23, 10, SIGNPOST_IFNOTSET, BoneCavernB1FBlockedRockClimb

	db 18 ; object events
	smashrock_event 24, 14
	smashrock_event 25, 13
	smashrock_event 24, 15
	smashrock_event 25, 15
	strengthboulder2_event 21, 10, -1
	strengthboulder2_event 11, 17, -1
	person_event SPRITE_HIKER, 21, 19, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BoneCavernB1FNPC, -1
	person_event SPRITE_BONES,  9, 16, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_BONES, 17,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_1_TOP_GONE
	person_event SPRITE_BONES, 21, 10, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	person_event SPRITE_BONES, 19, 26, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_3_TOP_GONE
	person_event SPRITE_BONES, 18,  6, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_1_BOTTOM_GONE
	person_event SPRITE_BONES, 22, 10, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_2_BOTTOM_GONE
	person_event SPRITE_BONES, 20, 26, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_3_BOTTOM_GONE
	person_event SPRITE_POKEMANIAC, 20, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, BoneCavernB1FTrainer1, -1
	person_event SPRITE_BLACK_BELT,  7, 29, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, BoneCavernB1FTrainer2, -1
	itemball_event  7, 17, DUSK_STONE, 1, EVENT_BONE_CAVERN_B1F_ITEM_1
	itemball_event 26, 22, DUSK_BALL, 1, EVENT_BONE_CAVERN_B1F_ITEM_2
	
	
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
	
BoneCavernB1FNPC:
	jumptextfaceplayer BoneCavernB1FNPCText
	
BoneCavernB1FNPCText:
	text "Those huge bones"
	line "coming from the"
	cont "ground…"
	
	para "Some of them look"
	line "like they're ready"
	cont "to crumble."
	
	para "I bet a a #MON's"
	line "hard head could"
	cont "smash them with"
	cont "a HEADBUTT!"
	done
	
BoneCavernB1FTrainer1:
	generictrainer POKEMANIAC, MARTIN, EVENT_BEAT_BONE_CAVERN_B1F_TRAINER_1, .SeenText, .BeatenText

	text "POP! CRACK!"
	line "SNAP!"
	
	para "The beautiful"
	line "sound of bones"
	cont "snapping!"
	done

.SeenText:
	text "POP! CRACK!"
	line "SNAP!"
	
	para "Do you hear it?"
	
	para "The sound of the"
	line "bones snapping!"
	done

.BeatenText:
	text "Can you hear the"
	line "sound?"
	done
	
BoneCavernB1FTrainer2:
	generictrainer BLACKBELT_T, MASA, EVENT_BEAT_BONE_CAVERN_B1F_TRAINER_2, .SeenText, .BeatenText

	text "I would never"
	line "train under the"
	cont "MASTER."
	
	para "I will continue"
	line "to train my body"
	cont "in solitude."
	done

.SeenText:
	text "Do you know of"
	line "the MASTER?"
	
	para "He claims that"
	line "the mind is as"
	cont "important as"
	cont "the body."
	
	para "What a fool"
	line "he is…"
	done

.BeatenText:
	text "Fools…"
	done

BoneCavernB1FBlockedRockClimb:
	dw EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	jumptext BoneCavernB1FBlockedRockClimbText
	
BoneCavernB1FBlockedRockClimbText:
	text "A #MON could"
	line "climb the rocks"
	cont "if the way was"
	cont "clear…"
	done

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
