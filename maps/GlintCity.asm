GlintCity_MapScriptHeader:
	db 2 ; scene scripts
	scene_script GlintCityTrigger0
	scene_script GlintCityTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, GlintCityFlyPoint
	callback MAPCALLBACK_OBJECTS, GlintCityStanleyRematch

	db 7 ; warp events
	warp_def 15, 27, 2, GLINT_POKECENTER
	warp_def 9, 27, 2, GLINT_MART
	warp_def 9, 7, 2, GLINT_EVO_HOUSE
	warp_def 3, 5, 2, GLINT_RIVAL_HOUSE
	warp_def 5, 15, 2, GLINT_APARTMENT_LEFT_1F
	warp_def 5, 21, 2, GLINT_APARTMENT_RIGHT_1F
	warp_def 15, 6, 2, GLINT_GYM

	db 0 ; coord events

	db 9 ; bg events
	signpost 18, 20, SIGNPOST_READ, GlintCitySign
	signpost 16, 5, SIGNPOST_READ, GlintGymSign
	signpost 5, 19, SIGNPOST_READ, GlintApartmentsSign
	signpost 14, 15, SIGNPOST_READ, GlintCityParkSign
	signpost 3, 8, SIGNPOST_READ, GlintCityRivalHouseSign
	signpost 15, 28, SIGNPOST_READ, GlintCityPokeCenterSign
	signpost 9, 28, SIGNPOST_READ, GlintCityMartSign
	signpost 17,  2, SIGNPOST_ITEM + REVIVE, EVENT_GLINT_CITY_HIDDEN_REVIVE
	signpost 9, 38, SIGNPOST_READ, GlintCityRoute3sign

	db 11 ; object events
	person_event SPRITE_COOLTRAINER_F,  8, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintNPC1, -1
	person_event SPRITE_FAT_GUY, 16, 13, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintNPC2, -1
	person_event SPRITE_SCHOOLGIRL, 12, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, GlintNPC3, -1
	person_event SPRITE_TWIN, 11, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GlintNPC4, -1
	person_event SPRITE_GAMEBOY_KID,  8, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintNPC5, -1
	person_event SPRITE_CLERK, 10, 25, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintNPC6, -1
	person_event SPRITE_GRANNY,  8, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GlintNPC7, -1
	object_event 14, 8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, GROWLITHE, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, GlintDoggo, -1
	object_event 21, 10, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, PIKIPEK, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, GlintBirb, -1
	object_event 20, 9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, PIKIPEK, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, GlintBirb, -1

	
	const_def 1 ; object constants
	const GLINT_NPC1
	const GLINT_NPC2
	const GLINT_NPC3
	const GLINT_NPC4
	const GLINT_NPC5
	const GLINT_NPC6
	const GLINT_NPC7
	const GLINT_GROWLITHE
	const GLINT_BIRB1
	const GLINT_BIRB2
	
GlintCityTrigger0:
	end
	
GlintCityTrigger1:
	end
	
GlintCityFlyPoint:
	setflag ENGINE_FLYPOINT_GLINT
	return
	
GlintCityStanleyRematch:
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	checkevent EVENT_BEAT_STANLEY_REMATCH
	iffalse .end
	clearevent EVENT_BEAT_STANLEY_REMATCH
	clearevent EVENT_BEAT_GLINT_GYM_TRAINER_1_REMATCH
	clearevent EVENT_BEAT_GLINT_GYM_TRAINER_2_REMATCH
.end
	return
	
GlintCitySign:
	jumptext GlintCitySignText

GlintGymSign:
	jumptext GlintGymSignText
	
GlintApartmentsSign:
	jumptext GlintApartmentsSignText
	
GlintCityParkSign:
	jumptext GlintCityParkSignText
	
GlintCityRivalHouseSign:
	jumptext GlintCityRivalHouseSignText
	
GlintCityPokeCenterSign:
	jumpstd pokecentersign
	
GlintCityMartSign:
	jumpstd martsign
	
GlintCityRoute3sign:
	jumptext GlintCityRoute3signText
	
GlintCitySignText:
	text "GLINT CITY"
	
	para "A city of"
	line "blossoming hope."
	done
	
GlintGymSignText:
	text "GLINT CITY"
	line "#MON GYM"
	cont "LEADER: STANLEY"

	para "The studious"
	line "valedictorian."
	done
	
GlintApartmentsSignText:
	text "GLINT APARTMENTS"
	done
	
GlintCityParkSignText:
	text "GLINT PARK"
	
	para "The jewel of"
	line "GLINT CITY."
	done
	
GlintCityRivalHouseSignText:
	text "<RIVAL>'s HOUSE"
	done
	
GlintCityRoute3signText:
	text "ROUTE 3"
	
	para "EAST:"
	line "STARGLOW CAVERN"
	
	para "WEST:"
	line "GLINT CITY"
	done
	
GlintNPC1:
	faceplayer
	opentext
	writetext GlintNPC1Text
	waitbutton
	spriteface GLINT_NPC1, LEFT
	closetext
	end

GlintNPC2:
	jumptextfaceplayer GlintNPC2Text
	
GlintNPC3:
	faceplayer
	opentext
	writetext GlintNPC3Text
	waitbutton
	spriteface GLINT_NPC3, UP
	closetext
	end
	
GlintNPC4:
	faceplayer
	opentext
	writetext GlintNPC4Text
	waitbutton
	spriteface GLINT_NPC4, DOWN
	closetext
	end
	
GlintNPC5:
	faceplayer
	opentext
	writetext GlintNPC5Text
	waitbutton
	spriteface GLINT_NPC5, DOWN
	closetext
	end

GlintNPC6:
	checkevent EVENT_GLINT_GUY_GAVE_POTION
	iftrue .GlintNPC6_2
	checkevent EVENT_BEAT_STANLEY
	iftrue .GlintNPC6_3
	faceplayer
	opentext
	writetext GlintNPC6Text
	buttonsound
	verbosegiveitem POTION
	writetext GlintNPC6Text2
	waitbutton
	setevent EVENT_GLINT_GUY_GAVE_POTION
	closetext
	end
	
.GlintNPC6_2:
	jumptextfaceplayer GlintNPC6Text2
	
.GlintNPC6_3
	faceplayer
	opentext
	writetext GlintNPC6Text3
	buttonsound
	verbosegiveitem POTION
	writetext GlintNPC6Text2
	waitbutton
	setevent EVENT_GLINT_GUY_GAVE_POTION
	closetext
	end
	
GlintNPC7:
	opentext
	writetext GlintNPC7Text2
	waitbutton
	closetext
	end
	
GlintDoggo:
	opentext
	writetext GlintDoggoText
	cry GROWLITHE
	waitbutton
	closetext
	end
	
GlintBirb:
	opentext
	writetext GlintBirbText
	cry PIKIPEK
	waitbutton
	closetext
	end
	
GlintNPC1Text:
	text "My GROWLITHE loves"
	line "coming to the"
	cont "park."
	
	para "I have to keep her"
	line "on the leash,"
	cont "or she'll try to"
	cont "chase the PIKIPEK!"
	done
	
GlintNPC2Text:
	text "The GYM LEADER"
	line "here is named"
	cont "STANLEY."
	
	para "He graduated top"
	line "of his class at"
	cont "the TRAINER SCHOOL"
	cont "in DAYBREAK"
	cont "VILLAGE."
	
	para "Still,"
	
	para "he's just a"
	line "kid."
	
	para "Is he ready to be"
	line "a GYM LEADER?"
	done
	
GlintNPC3Text:
	text "I love FAIRY #-"
	line "MON!"
	
	para "They're super"
	line "cute!"
	done
	
GlintNPC4Text:
	text "We got our FAIRY"
	line "#MON at GLINT"
	cont "GROVE."
	
	para "You should get one"
	line "too."
	done
	
GlintNPC5Text:
	text "My parents forced"
	line "me to stop playing"
	cont "video games and go"
	cont "outside."
	
	para "Good thing I can "
	line "play video games"
	cont "outside too!"
	done
	
GlintNPC6Text:
	text "The #MART has"
	line "everything a"
	cont "TRAINER needs."
	
	para "Make sure to stock"
	line "up before you"
	cont "challenge the GYM"
	cont "LEADER!"
	
	para "Here."
	
	para "Try a sample."
	done
	
GlintNPC6Text2:
	text "It's always a good"
	line "idea to have a"
	cont "POTION or two with"
	cont "you."
	
	para "If you need more,"
	line "you should stop by"
	cont "the #MART."
	done
	
GlintNPC6Text3:
	text "The #MART has"
	line "everything a"
	cont "TRAINER needs."
	
	para "Make sure to stock"
	line "up before you"
	cont "head out of town!"
	
	para "Here."
	
	para "Try a sample."
	done
	
GlintNPC7Text:
	text "Back when I was"
	line "young,"
	
	para "the boys would"
	line "flock to me for my"
	cont "looks."
	
	para "Nowadays the only"
	line "ones flocking to"
	cont "me are the bird"
	cont "#MON."
	
	para "Sigh…"
	done
	
GlintNPC7Text2:
	text "She's happily"
	line "feeding the"
	cont "PIKIPEK."
	done
	
GlintDoggoText:
	text "GROWLITHE: BARK!"
	line "BARK!"
	done
	
GlintBirbText:
	text "PIKIPEK: PIKI!"
	line "PIKI!"
	done