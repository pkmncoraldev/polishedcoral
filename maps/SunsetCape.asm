SunsetCape_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  3, 29, SUNSET_LIGHTHOUSE, 1
	warp_event  5,  5, ROUTE_1_GATE, 4
	warp_event 15, 15, PLAYER_HOUSE_1F, 2 ;DAYBREAK_GROTTO_WATERWAY

	db 0 ; coord events

	db 2 ; bg events
	signpost 11,  6, SIGNPOST_READ, SunsetCapeSign
	signpost 29,  5, SIGNPOST_READ, SunsetLighthouseSign

	db 15 ; object events
	person_event SPRITE_GRAMPS, 33,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<MORN, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc1, -1
	person_event SPRITE_RAICHU, 33,  5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, 1<<MORN, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc2, -1
	person_event SPRITE_LADY, 33,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<DAY, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc3, -1
	person_event SPRITE_POKEMANIAC, 33,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<NITE, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc4, -1
	person_event SPRITE_CUTE_GIRL, 33,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<NITE, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc4, -1
	person_event SPRITE_SWIMMER_GIRL, 32, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSunsetCape, -1
	itemball_event  1, 24, POKE_BALL, 1, EVENT_SUNSET_CAPE_POKE_BALL
	fruittreeinvis_event 16, 12, FRUITTREE_SUNSET_CAPE, ORAN_BERRY
	person_event SPRITE_LIGHTHOUSE, 22,  2, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 22,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 25,  4, SPRITEMOVEDATA_LIGHTHOUSE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 26,  4, SPRITEMOVEDATA_LIGHTHOUSE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 27,  4, SPRITEMOVEDATA_LIGHTHOUSE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 28,  4, SPRITEMOVEDATA_LIGHTHOUSE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 29,  4, SPRITEMOVEDATA_LIGHTHOUSE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	

	const_def 1 ; object constants
	const SUNSET_CAPE_NPC_1
	const SUNSET_CAPE_NPC_2
	const SUNSET_CAPE_NPC_3
	const SUNSET_CAPE_NPC_4
	const SUNSET_CAPE_NPC_5
	const SUNSET_CAPE_TRAINER
	const SUNSET_CAPE_POKE_BALL1
	
SunsetCapeNpc1:
	faceplayer
	opentext
	writetext SunsetCapeNpc1Text
	waitbutton
	spriteface SUNSET_CAPE_NPC_1, DOWN
	closetext
	end
	
SunsetCapeNpc2:
	opentext
	writetext SunsetCapeNpc2Text
	cry RAICHU
	waitbutton
	closetext
	end
	
SunsetCapeNpc3:
	faceplayer
	opentext
	writetext SunsetCapeNpc3Text
	waitbutton
	spriteface SUNSET_CAPE_NPC_3, DOWN
	closetext
	applyonemovement PLAYER, hide_person
	end
	
SunsetCapeNpc4:
	jumptext SunsetCapeNpc4Text
	
SunsetCapeSign:
	jumptext SunsetCapeSignText
	
SunsetLighthouseSign:
	jumptext SunsetLighthouseSignText
	
TrainerSunsetCape:
;	trainer EVENT_BEAT_SUNSET_CAPE_TRAINER, SWIMMERF, 1, TrainerSunsetCapeSeenText, TrainerSunsetCapeBeatenText, 0, .Script
	
;.Script:
;	end_if_just_battled
;	opentext
;	writetext TrainerSunsetCapeNormalText
;	waitbutton
;	closetext
	end

TrainerSunsetCapeSeenText:
	text "I love swimming in"
	line "this spot."
	
	para "It's nice and"
	line "secluded."
	done
	
TrainerSunsetCapeBeatenText:
	text "…"
	done
	
TrainerSunsetCapeNormalText:
	text "Well, It WAS nice"
	line "and secluded…"
	done
	
SunsetCapeNpc1Text:
	text "I had my first"
	line "date with my wife"
	cont "at this very"
	cont "spot."
	
	para "I come here every-"
	line "day with my RAICHU"
	cont "to watch the"
	cont "sunrise."
	done
	
SunsetCapeNpc2Text:
	text "RAICHU: CHU! CHU!"
	line "RAI!"
	done
	
SunsetCapeNpc3Text:
	text "My ex-boyfriend"
	line "and I used to come"
	cont "here all the time."
	
	para "He turned out to"
	line "be a jerk!"
	
	para "Will I ever find"
	line "true love?"
	done
	
SunsetCapeNpc4Text:
	text "They're holding"
	line "hands."
	done	
	
SunsetCapeSignText:
	text "SUNSET CAPE"
	
	para "NORTH:"
	line "ROUTE 1"
	
	para "SOUTH:"
	line "LIGHTHOUSE"
	done
	
SunsetLighthouseSignText:
	text "SUNSET CAPE"
	line "LIGHTHOUSE"
	done