StarglowCavern3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 13,  3, 1, ROUTE_3_EAST
	warp_def  3,  5, 3, STARGLOW_CAVERN_2F


	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_COOLTRAINER_F,  8,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerStarglowCavern3F_1, -1
	
TrainerStarglowCavern3F_1:
	generictrainer COOLTRAINERF, JULES, EVENT_BEAT_STARGLOW_CAVERN_3F_TRAINER, .SeenText, .BeatenText

	text "You have to be"
	line "tough if you're"
	cont "this off the"
	cont "beaten path."
	done	

.SeenText:
	text "I don't see many"
	line "people around"
	cont "here."
	
	para "You must be tough!"
	done

.BeatenText:
	text "Sure are!"
	done
