SunsetCape_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SunsetCapeTrigger0
	scene_script SunsetCapeTrigger1

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  3, 29, SUNSET_LIGHTHOUSE, 1
	warp_event  5,  5, ROUTE_1_GATE, 4
	warp_event 15, 15, DAYBREAK_GROTTO_3, 4

	db 12 ; coord events
	coord_event  6, 17, 0, SunsetCapeMakeSilverLighthouse
	coord_event  7, 17, 0, SunsetCapeMakeSilverLighthouse
	coord_event  8, 17, 0, SunsetCapeMakeSilverLighthouse
	coord_event  9, 17, 0, SunsetCapeMakeSilverLighthouse
	coord_event  6, 18, 0, SunsetCapeMakeSilverLighthouse
	coord_event  7, 18, 0, SunsetCapeMakeSilverLighthouse
	coord_event  6, 15, 1, SunsetCapeMakeSilverGreen
	coord_event  7, 15, 1, SunsetCapeMakeSilverGreen
	coord_event  6, 16, 1, SunsetCapeMakeSilverGreen
	coord_event  7, 16, 1, SunsetCapeMakeSilverGreen
	coord_event  8, 16, 1, SunsetCapeMakeSilverGreen
	coord_event  9, 16, 1, SunsetCapeMakeSilverGreen

	db 2 ; bg events
	signpost  8,  6, SIGNPOST_READ, SunsetCapeSign
	signpost 29,  5, SIGNPOST_READ, SunsetLighthouseSign

	db 16 ; object events
	person_event SPRITE_GRAMPS, 33,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<MORN, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc1, -1
	object_event  6, 33, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, RAICHU, -1, 1<<MORN, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc2, -1
	person_event SPRITE_LADY, 33,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<DAY, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc3, -1
	person_event SPRITE_POKEMANIAC, 33,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<NITE, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc4, -1
	person_event SPRITE_CUTE_GIRL, 33,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 1<<NITE, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunsetCapeNpc4, -1
	person_event SPRITE_SWIMMER_GIRL, 32, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerSunsetCape, -1
	itemball_event  1, 25, POKE_BALL, 1, EVENT_SUNSET_CAPE_POKE_BALL
	fruittree_event 16, 12, FRUITTREE_SUNSET_CAPE, ORAN_BERRY
	person_event SPRITE_LIGHTHOUSE, 22,  2, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 22,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 25,  4, SPRITEMOVEDATA_LIGHTHOUSE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 26,  4, SPRITEMOVEDATA_LIGHTHOUSE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 27,  4, SPRITEMOVEDATA_LIGHTHOUSE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 28,  4, SPRITEMOVEDATA_LIGHTHOUSE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 29,  4, SPRITEMOVEDATA_LIGHTHOUSE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_LIGHTHOUSE, 29,  2, SPRITEMOVEDATA_LIGHTHOUSE_3, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	

	const_def 1 ; object constants
	const SUNSET_CAPE_NPC_1
	const SUNSET_CAPE_NPC_2
	const SUNSET_CAPE_NPC_3
	const SUNSET_CAPE_NPC_4
	const SUNSET_CAPE_NPC_5
	const SUNSET_CAPE_TRAINER
	const SUNSET_CAPE_POKE_BALL1
	const SUNSET_CAPE_FRUIT
	const SUNSET_CAPE_LIGHTHOUSE_1
	const SUNSET_CAPE_LIGHTHOUSE_2
	const SUNSET_CAPE_LIGHTHOUSE_3
	const SUNSET_CAPE_LIGHTHOUSE_4
	const SUNSET_CAPE_LIGHTHOUSE_5
	const SUNSET_CAPE_LIGHTHOUSE_6
	const SUNSET_CAPE_LIGHTHOUSE_7
	const SUNSET_CAPE_LIGHTHOUSE_8
	
	
SunsetCapeTrigger0:
	end
	
SunsetCapeTrigger1:
	end
	
SunsetCapeMakeSilverLighthouse:
	setevent EVENT_CAPE_LIGHTHOUSE_COLORS
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
SunsetCapeMakeSilverGreen:
	clearevent EVENT_CAPE_LIGHTHOUSE_COLORS
	special Special_UpdatePalsInstant
	dotrigger $0
	end
	
SunsetCapeNpc1:
	faceplayer
	opentext
	writetext SunsetCapeNpc1Text
	waitbutton
	spriteface SUNSET_CAPE_NPC_1, DOWN
	closetext
	end
	
SunsetCapeNpc2:
	opentext TEXTBOX_POKEMON, RAICHU
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
	end
	
SunsetCapeNpc4:
	jumptext SunsetCapeNpc4Text
	
SunsetCapeSign:
	jumptext SunsetCapeSignText
	
SunsetLighthouseSign:
	jumptext SunsetLighthouseSignText
	
TrainerSunsetCape:
	generictrainer SWIMMERF, BECKY, EVENT_BEAT_SUNSET_CAPE_TRAINER, .SeenText, .BeatenText
	
	text "Well, It WAS <WAIT_S>nice"
	line "and secluded…"
	done

.SeenText:
	text "I love swimming"
	line "in this spot."
	
	para "It's nice and"
	line "secluded."
	done
	
.BeatenText:
	text "…"
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
	text "CHU!<WAIT_S> CHU!<WAIT_S> RAI!"
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