LakeOnwaPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 4, 6, LAKE_ONWA
	warp_def 7, 5, 6, LAKE_ONWA

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_COOLTRAINER_F, 3, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeOwnaCenterNPC1, -1
	person_event SPRITE_YOUNGSTER, 5, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LakeOwnaCenterNPC2, -1


	const_def 1 ; object constants
	const LAKE_ONWA_POKECENTER_NURSE
	const LAKE_ONWA_POKECENTER_CHANSEY
	const LAKE_ONWA_POKECENTER_NPC1
	const LAKE_ONWA_POKECENTER_NPC2
	
LakeOwnaCenterNPC1:
	jumptextfaceplayer LakeOwnaCenterNPC1Text
	
LakeOwnaCenterNPC2:
	jumptextfaceplayer LakeOwnaCenterNPC2Text
	
LakeOwnaCenterNPC1Text:
	text "This #MON"
	line "CENTER is still"
	cont "fairly new."
	
	para "There were so many"
	line "TRAINERs whose"
	cont "#MON were get-"
	cont "ting injured in"
	cont "MT. ONWA,"
	
	para "that they had to"
	line "build one."
	done
	
LakeOwnaCenterNPC2Text:
	text "I got partway up"
	line "the mountain,"
	
	para "but my #MON was"
	line "too tired to cont-"
	cont "inue."
	
	para "I had to come back"
	line "down here and"
	cont "rest."
	done
