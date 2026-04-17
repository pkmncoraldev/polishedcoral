Route31_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route31Trigger0

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  3, 49, 1, BONE_CAVERN_B1F

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	strengthboulder_event 48, 12, -1
	strengthboulder_event 28,  4, -1
	strengthboulder_event 29,  5, -1
	strengthboulder_event 53, 13, -1
	person_event SPRITE_YOUNGSTER,  4, 31, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route32StrengthMan, -1
	smashrock_event 28,  5
	smashrock_event 29,  4
	smashrock_event 49,  5
	smashrock_event 48,  4
	person_event SPRITE_GENTLEMAN,  9, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route31Trainer1, -1
	person_event SPRITE_SCIENTIST, 16, 30, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route31Trainer2, -1
	person_event SPRITE_POKEFAN_F, 14, 47, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route31Trainer3, -1
	tapeball_event 44, 19, MUSIC_TRAINER_BATTLE, 2, EVENT_MUSIC_TRAINER_BATTLE
	
	
Route31Trigger0:
	special Special_UpdatePalsInstant
	end

Route31Trainer1:
	generictrainer GENTLEMAN, EUGENE, EVENT_BEAT_ROUTE_31_TRAINER_1, .SeenText, .BeatenText

	text "Be it days, weeks,"
	line "years, or decades"
	cont "from now,"
	
	para "eventually we'll"
	line "all turn to bones."
	
	para "Even you and your"
	line "#MON!"
	done

.SeenText:
	text "All things must"
	line "come to an end."
	
	para "Even life itself"
	line "must eventually"
	cont "come to an end."
	done

.BeatenText:
	text "All things must"
	line "come to an end."
	
	para "Even #MON"
	line "battles."
	done
	
Route31Trainer2:
	generictrainer SCIENTIST, MARTY, EVENT_BEAT_ROUTE_31_TRAINER_2, .SeenText, .BeatenText

	text "My colleage went"
	line "ahead to the"
	cont "BONE CAVERNS."
	
	para "I stuck back"
	line "because, well…"
	
	para "I'm scared of"
	line "the bones!"
	done

.SeenText:
	text "My colleague and I"
	line "were tasked with"
	cont "with researching"
	cont "the BONE CAVERNS."
	
	para "He ran ahead"
	line "without me!"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route31Trainer3:
	generictrainer POKEFANF, BERTHA, EVENT_BEAT_ROUTE_31_TRAINER_3, .SeenText, .BeatenText

	text "I wonder if that"
	line "little #MON I"
	cont "saw lost its mama…"
	done

.SeenText:
	text "I saw a little"
	line "#MON crying in"
	cont "the grass."
	
	para "How sad…"
	done

.BeatenText:
	text "You beat me!"
	line "How sad…"
	done