RadiantTownship_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, RadiantTownshipFlyPoint
	callback MAPCALLBACK_TILES, RadiantTownshipCallback

	db 8 ; warp events
	warp_def 13, 37, 1, RADIANT_FLOWER_SHOP
	warp_def 24, 20, 1, RADIANT_FIELD
	warp_def 24, 21, 2, RADIANT_FIELD
	warp_def 13, 24, 1, RADIANT_ORPHANAGE_1F
	warp_def  7,  7, 1, RADIANT_POKECENTER
	warp_def 15,  7, 2, RADIANT_MART
	warp_def  9, 17, 1, RADIANT_HOUSE
	warp_def  5, 33, 3, ROUTE_21_GATE

	db 0 ; coord events

	db 31 ; bg events
	signpost 14, 14, SIGNPOST_READ, RadiantTownshipSign
	signpost -1, -1, SIGNPOST_READ, RadiantMeadowSign
	signpost 14, 23, SIGNPOST_READ, RadiantTownshipGymSign
	signpost  6, 34, SIGNPOST_READ, RadiantTownshipRoute21Sign
	signpost  6,  4, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  6,  5, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  4, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  5, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 14, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 15, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 20, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 21, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 26, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 27, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 28, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 29, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 34, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 35, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  7,  8, SIGNPOST_READ, RadiantTownshipPokeCenterSign
	signpost 15,  8, SIGNPOST_READ, RadiantTownshipMartSign
	signpost 14, 38, SIGNPOST_READ, RadiantTownshipFlowerShopSign
	signpost 11,  4, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 11,  5, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 18, 16, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 18, 17, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 25, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 26, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 27, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 19, 28, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 19, 29, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 39, SIGNPOST_READ, RadiantTownshipSunflower

	db 16 ; object events
	person_event SPRITE_ERIKA, 14, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantTownshipErika, -1
	person_event SPRITE_CUTE_GIRL, 10, 10, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC1, -1
	person_event SPRITE_PONYTAIL, 17, 31, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC2, -1
	person_event SPRITE_SUPER_NERD,  9, 34, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC3, -1
	person_event SPRITE_POKEFAN_F, 14, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC4, -1
	person_event SPRITE_FAT_GUY, 18, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC5, -1
	person_event SPRITE_CASINO, 10,  4, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 10,  5, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 17, 16, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 17, 17, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 25, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 26, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 27, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 18, 28, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 18, 29, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 39, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1

	const_def 1 ; object constants
	const RADIANT_TOWNSHIP_ERIKA
	

RadiantTownshipFlyPoint:
	setflag ENGINE_FLYPOINT_RADIANT
	setevent EVENT_BEEN_TO_RADIANT_TOWN
	setevent EVENT_UNLOCKED_SOUTH_FLY_MAP
	return

RadiantTownshipCallback:
	checkevent EVENT_BEAT_LEILANI_REMATCH
	iffalse .skip1
	clearevent EVENT_BEAT_LEILANI_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_ROSE_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_LILY_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_IRIS_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_POPPY_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_VIOLET_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_CLOVER_REMATCH
	clearevent EVENT_BEAT_RADIANT_GYM_FELICIA_REMATCH
	clearevent EVENT_RADIANT_GYM_ACTIVE
	setevent EVENT_RADIANT_GYM_INACTIVE
.skip1
	checkevent EVENT_BEAT_LEILANI_FIRST_TIME
	iffalse .skip2
	clearevent EVENT_RADIANT_GYM_ACTIVE
	setevent EVENT_RADIANT_GYM_INACTIVE
	setevent EVENT_CAN_FIGHT_ERIKA
	clearevent EVENT_BEAT_LEILANI_FIRST_TIME
.skip2
	checkevent EVENT_ERIKA_OUTSIDE_ORPAHANGE
	iftrue .end
	moveperson RADIANT_TOWNSHIP_ERIKA, -5, -5
.end
	return
	
RadiantTownshipErika:
	faceplayer
	opentext
	writetext RadiantTownshipErikaText
	waitbutton
	closetext
	applyonemovement RADIANT_TOWNSHIP_ERIKA, step_up
	disappear RADIANT_TOWNSHIP_ERIKA
	playsound SFX_ENTER_DOOR
	clearevent EVENT_ERIKA_OUTSIDE_ORPAHANGE
	callasm RadiantErikaClearLostGirlsAsm
	end
	
RadiantErikaClearLostGirlsAsm:
	xor a
	ld [wLostGirls], a
	ret

RadiantTownshipErikaText:
	text "Oh, <PLAYER>!"
	
	para "It's wonderful!"
	
	para "All the girls have"
	line "returned!"
	
	para "GRAMMA LEILANI is"
	line "doing better too!"
	
	para "Please, come"
	line "inside!"
	done

RadiantTownshipSunflower:
	jumptext RadiantTownshipSunflowerText

RadiantTownshipSunflowerText:
	text "A huge sunflower!"
	done

RadiantTownshipNPC1:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .lostgirls
	jumptextfaceplayer RadiantTownshipNPC1Text1
.lostgirls
	jumptextfaceplayer RadiantTownshipNPC1Text2

RadiantTownshipNPC2:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .lostgirls
	jumptextfaceplayer RadiantTownshipNPC2Text1
.lostgirls
	jumptextfaceplayer RadiantTownshipNPC2Text2
	
RadiantTownshipNPC3:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .lostgirls
	jumptextfaceplayer RadiantTownshipNPC3Text1
.lostgirls
	jumptextfaceplayer RadiantTownshipNPC3Text2

RadiantTownshipNPC4:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .lostgirls
	jumptextfaceplayer RadiantTownshipNPC4Text1
.lostgirls
	jumptextfaceplayer RadiantTownshipNPC4Text2
	
RadiantTownshipNPC5:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .lostgirls
	jumptextfaceplayer RadiantTownshipNPC5Text1
.lostgirls
	jumptextfaceplayer RadiantTownshipNPC5Text2

RadiantTownshipSign:
	jumptext RadiantTownshipSignText
	
RadiantMeadowSign:
	jumptext RadiantMeadowSignText
	
RadiantTownshipGymSign:
	jumptext RadiantTownshipGymSignText
	
RadiantTownshipRoute21Sign:
	jumptext RadiantTownshipRoute21SignText
	
RadiantTownshipSolarPanel:
	jumptext RadiantTownshipSolarPanelText
	
RadiantTownshipPokeCenterSign:
	jumpstd pokecentersign
	
RadiantTownshipMartSign:
	jumpstd martsign
	
RadiantTownshipFlowerShopSign:
	jumptext RadiantTownshipFlowerShopSignText
	
RadiantTownshipSignText:
	text "RADIANT TOWN"
	
	para "A spot of green in"
	line "a sea of flowers."
	done
	
RadiantMeadowSignText:
	text "RADIANT MEADOW"
	done
	
RadiantTownshipGymSignText:
	text "RADIANT TOWN"
	line "ORPHANAGE & GYM"
	
	cont "LEADER: LEILANI"
	
	para "The ferocious"
	line "flower."
	done
	
RadiantTownshipRoute21SignText:
	text "NORTH:"
	line "ROUTE 21"
	done
	
RadiantTownshipFlowerShopSignText:
	text "PUFF PUFF"
	line "FLOWER SHOP"
	
	para "We trade pollen!"
	line "Inquire inside."
	done
	
RadiantTownshipSolarPanelText:
	text "A reflective"
	line "solar panel."
	
	para "Shiny!"
	done
	
RadiantTownshipNPC1Text1:
	text "Hello!"
	
	para "Beautiful day"
	line "isn't it?"
	done
	
RadiantTownshipNPC1Text2:
	text "The girls from the"
	line "orhpanage have"
	cont "gone missing?"
	
	para "How terrible!"
	
	para "I did see two"
	line "girls run by a"
	cont "while ago."
	
	para "It looked like"
	line "they were heading"
	cont "to PORT SHIMMER."
	done
	
RadiantTownshipNPC2Text1:
	text "My MOM travels to"
	line "PORT SHIMMER every"
	cont "day."
	
	para "She sells the"
	line "BERRIES she grows"
	cont "at the market."
	done
	
RadiantTownshipNPC2Text2:
	text "Missing girls?"
	
	para "Sorry, I can't"
	line "help you."
	
	para "I wouldn't doubt if"
	line "they headed out of"
	cont "town, though."
	done
	
RadiantTownshipNPC3Text1:
	text "I've been thinking"
	line "of asking the girl"
	cont "at the FLOWER SHOP"
	cont "out on a date."
	
	para "What do you even"
	line "get a girl like"
	cont "that?"
	
	para "…<WAIT_L>Flowers?"
	done
	
RadiantTownshipNPC3Text2:
	text "The kids from the"
	line "orphanage?"
	
	para "No clue, dude."
	
	para "Girls like"
	line "flowers, right?"
	
	para "Maybe check the"
	line "meadow to the"
	cont "SOUTH?"
	done
	
RadiantTownshipNPC4Text1:
	text "The orphanage here"
	line "is run by our GYM"
	cont "LEADER, LEILANI."
	
	para "The orphans help"
	line "her test the GYM"
	cont "challengers."
	
	para "How cute!"
	done
	
RadiantTownshipNPC4Text2:
	text "The girls ran off?"
	
	para "That's not very"
	line "surprising."
	
	para "It may be hard to"
	line "believe, but ERIKA"
	cont "used to be a"
	cont "troublemaker, too!"
	done
	
RadiantTownshipNPC5Text1:
	text "RADIANT TOWN is"
	line "powered totally"
	cont "by solar energy."
	
	para "This place is both"
	line "figuratively and"
	cont "literally green!"
	done

RadiantTownshipNPC5Text2:
	text "The orphans?"
	
	para "I guess they might"
	line "have run off to"
	cont "DUSK TURNPIKE."
	
	para "Though why anyone"
	line "would go there is"
	cont "beyond me…"
	done
