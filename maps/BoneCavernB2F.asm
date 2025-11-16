BoneCavernB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  3,  9, 4, BONE_CAVERN_B1F
	warp_def 13, 15, 5, BONE_CAVERN_B1F
	warp_def  9, 29, 6, BONE_CAVERN_B1F
	warp_def 23, 29, 7, BONE_CAVERN_B1F

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2, 16, SIGNPOST_READ, BoneCavernB2FBone1
	bg_event  6, 26, SIGNPOST_READ, BoneCavernB2FBone2
	bg_event 22, 24, SIGNPOST_READ, BoneCavernB2FBone3

	db 6 ; object events
	smashrock_event 14, 28
	itemball_event 27,  5, RARE_BONE, 1, EVENT_BONE_CAVERN_B2F_ITEM_1
	tmhmball_event 15, 25, TM_HEADBUTT, EVENT_BONE_CAVERN_B2F_HEADBUTT_TM
	person_event SPRITE_BONES, 15,  2, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_1_BOTTOM_GONE
	person_event SPRITE_BONES, 25,  6, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_2_BOTTOM_GONE
	person_event SPRITE_BONES, 23, 22, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_BONE_CAVERN_BONE_3_BOTTOM_GONE
	
BoneCavernB2FBone1:
	checkevent EVENT_BONE_CAVERN_BONE_1_TOP_GONE
	iftrue .done
	headbuttbone
	iffalse .end
	appear 4
	refreshscreen
	changeblock $2, $0e, $0d
	changeblock $2, $10, $9d
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_BONE_CAVERN_BONE_1_TOP_GONE
	clearevent EVENT_BONE_CAVERN_BONE_1_BOTTOM_GONE
.done
	jumptext BoneCavernBoneText3
.end
	end
BoneCavernB2FBone2:
	checkevent EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	iftrue .done
	headbuttbone
	iffalse .end
	appear 5
	refreshscreen
	changeblock $6, $18, $0d
	changeblock $6, $1a, $9d
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_BONE_CAVERN_BONE_2_TOP_GONE
	clearevent EVENT_BONE_CAVERN_BONE_2_BOTTOM_GONE
.done
	jumptext BoneCavernBoneText3
.end
	end
BoneCavernB2FBone3:
	checkevent EVENT_BONE_CAVERN_BONE_3_TOP_GONE
	iftrue .done
	headbuttbone
	iffalse .end
	appear 6
	refreshscreen
	changeblock $16, $16, $0d
	changeblock $16, $18, $9d
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_BONE_CAVERN_BONE_3_TOP_GONE
	clearevent EVENT_BONE_CAVERN_BONE_3_BOTTOM_GONE
.done
	jumptext BoneCavernBoneText3
.end
	end
