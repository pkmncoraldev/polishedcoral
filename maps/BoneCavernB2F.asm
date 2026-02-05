BoneCavernB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BoneCavernB2FCallback

	db 4 ; warp events
	warp_def  3, 11, 4, BONE_CAVERN_B1F
	warp_def 13, 15, 5, BONE_CAVERN_B1F
	warp_def  9, 29, 6, BONE_CAVERN_B1F
	warp_def 23, 29, 7, BONE_CAVERN_B1F

	db 0 ; coord events

	db 7 ; bg events
	bg_event  2, 16, SIGNPOST_READ, BoneCavernB2FBone1
	bg_event  6, 26, SIGNPOST_READ, BoneCavernB2FBone2
	bg_event 22, 24, SIGNPOST_READ, BoneCavernB2FBone3
	bg_event 18,  4, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 24, 10, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 18, 14, SIGNPOST_READ, BoneCavernB1FBone4
	bg_event 16, 28, SIGNPOST_READ, BoneCavernB1FBone4

	db 4 ; object events
	smashrock_event 14, 28
	itemball_event 27,  5, RARE_BONE, 1, EVENT_BONE_CAVERN_B2F_ITEM_1
	tmhmball_event 15, 25, TM_HEADBUTT, EVENT_TM02
	person_event SPRITE_SCIENTIST,  4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, BoneCavernB2FTrainer1, -1
	
	
BoneCavernB2FCallback:
	checkevent EVENT_BONE_CAVERN_BONE_1_GONE
	iffalse .skip1
	changeblock $02, $0e, $5a
	changeblock $02, $10, $9d
.skip1
	checkevent EVENT_BONE_CAVERN_BONE_2_GONE
	iffalse .skip2
	changeblock $06, $18, $5a
	changeblock $06, $1a, $9d
.skip2
	checkevent EVENT_BONE_CAVERN_BONE_3_GONE
	iffalse .skip3
	changeblock $16, $16, $5a
	changeblock $16, $18, $9d
.skip3
	return
	
BoneCavernB2FTrainer1:
	generictrainer SCIENTIST, MARTIN, EVENT_BEAT_BONE_CAVERN_B2F_TRAINER_1, .SeenText, .BeatenText

	text "These huge bones!"
	
	para "What creature did"
	line "they belong to?"
	done

.SeenText:
	text "I'm from a LAB"
	line "in PORT SHIMMER."
	
	para "I'm here studying"
	line "the giant bones"
	cont "in this cave."
	done

.BeatenText:
	text "Aren't they just"
	line "fascinating?"
	done
	
BoneCavernB2FBone1:
	checkevent EVENT_BONE_CAVERN_BONE_1_GONE
	iftrue .done
	headbuttbone
	iffalse .end
	refreshscreen
	changeblock $02, $0e, $5a
	changeblock $02, $10, $9d
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_BONE_CAVERN_BONE_1_GONE
.done
	jumptext BoneCavernBoneText3
.end
	end
BoneCavernB2FBone2:
	checkevent EVENT_BONE_CAVERN_BONE_2_GONE
	iftrue .done
	headbuttbone
	iffalse .end
	refreshscreen
	changeblock $06, $18, $5a
	changeblock $06, $1a, $9d
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_BONE_CAVERN_BONE_2_GONE
.done
	jumptext BoneCavernBoneText3
.end
	end
BoneCavernB2FBone3:
	checkevent EVENT_BONE_CAVERN_BONE_3_GONE
	iftrue .done
	headbuttbone
	iffalse .end
	refreshscreen
	changeblock $16, $16, $5a
	changeblock $16, $18, $9d
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_BONE_CAVERN_BONE_3_GONE
.done
	jumptext BoneCavernBoneText3
.end
	end
