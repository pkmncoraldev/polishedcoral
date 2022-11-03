FlickerPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 4, 1, FLICKER_STATION
	warp_def 7, 5, 1, FLICKER_STATION

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_CUTE_GIRL, 5, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FlickerCenterNPC1, -1
	person_event SPRITE_POKEFAN_F, 4, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FlickerCenterNPC2, -1
	
FlickerCenterNPC1:
	jumptextfaceplayer FlickerCenterNPC1Text
	
FlickerCenterNPC2:
	jumptextfaceplayer FlickerCenterNPC2Text
	
FlickerCenterNPC1Text:
	text "I heard this town"
	line "was great for"
	cont "training."
	
	para "Turns out it"
	line "wasn't the same"
	cont "kind of training"
	cont "I thought it was…"
	done
	
FlickerCenterNPC2Text:
	text "There's a group of"
	line "kids that hang out"
	cont "at the old train"
	cont "depot and cause"
	cont "problems."
	done
