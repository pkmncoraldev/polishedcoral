RadiantTownship_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, RadiantTownshipFlyPoint
	callback MAPCALLBACK_TILES, RadiantTownshipCallback

	db 8 ; warp events
	warp_def 13, 35, 1, RADIANT_FLOWER_SHOP
	warp_def 24, 18, 1, RADIANT_FIELD
	warp_def 24, 19, 2, RADIANT_FIELD
	warp_def 13, 22, 1, RADIANT_ORPHANAGE_1F
	warp_def  7,  5, 1, RADIANT_POKECENTER
	warp_def 15,  5, 1, RADIANT_MART
	warp_def  9, 15, 1, RADIANT_HOUSE
	warp_def  5, 31, 3, ROUTE_21_GATE

	db 0 ; coord events

	db 31 ; bg events
	signpost 14, 12, SIGNPOST_READ, RadiantTownshipSign
	signpost 18, 20, SIGNPOST_READ, RadiantMeadowSign
	signpost 14, 21, SIGNPOST_READ, RadiantTownshipGymSign
	signpost  6, 32, SIGNPOST_READ, RadiantTownshipRoute21Sign
	signpost  6,  2, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  6,  3, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  2, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  3, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 12, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 13, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 18, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 19, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 24, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 25, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 26, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 27, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 32, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 33, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  7,  6, SIGNPOST_READ, RadiantTownshipPokeCenterSign
	signpost 15,  6, SIGNPOST_READ, RadiantTownshipMartSign
	signpost 14, 36, SIGNPOST_READ, RadiantTownshipFlowerShopSign
	signpost 11,  2, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 11,  3, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 18, 14, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 18, 15, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 23, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 24, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 25, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 19, 26, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 19, 27, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 37, SIGNPOST_READ, RadiantTownshipSunflower

	db 16 ; object events
	person_event SPRITE_ERIKA, 15, 22, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantTownshipErika, -1
	person_event SPRITE_CUTE_GIRL, 10,  8, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC1, -1
	person_event SPRITE_BATTLE_GIRL, 17, 29, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC2, -1
	person_event SPRITE_SUPER_NERD,  9, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC3, -1
	person_event SPRITE_POKEFAN_F, 14, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC4, -1
	person_event SPRITE_FAT_GUY, 18,  8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC5, -1
	person_event SPRITE_CASINO, 10,  2, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 10,  3, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 17, 14, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 17, 15, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 23, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 24, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 25, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 18, 26, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 18, 27, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 37, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1

	const_def 1 ; object constants
	const RADIANT_TOWNSHIP_ERIKA
	

RadiantTownshipFlyPoint:
	setflag ENGINE_FLYPOINT_RADIANT
	return

RadiantTownshipCallback:
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
	applymovement RADIANT_TOWNSHIP_ERIKA, Movement_RadiantTownshipErika
	disappear RADIANT_TOWNSHIP_ERIKA
	playsound SFX_ENTER_DOOR
	clearevent EVENT_ERIKA_OUTSIDE_ORPAHANGE
	end

RadiantTownshipErikaText:
	text "YIPPEE!"
	
	para "You did it!"
	done

Movement_RadiantTownshipErika:
	step_up
	step_up
	step_end

RadiantTownshipSunflower:
	jumptext RadiantTownshipSunflowerText

RadiantTownshipSunflowerText:
	text "A huge sunflower!"
	done

RadiantTownshipNPC1:
;	clearevent EVENT_RADIANT_GYM_ACTIVE
;	setevent EVENT_RADIANT_GYM_INACTIVE
;	setevent EVENT_SAVED_ALL_LOST_GIRLS
;	setevent EVENT_ERIKA_OUTSIDE_ORPAHANGE
;	setevent EVENT_CAN_GO_TO_DESERT
;	end

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
	
	para "A little place"
	line "among the flowers."
	done
	
RadiantMeadowSignText:
	text "RADIANT MEADOW"
	done
	
RadiantTownshipGymSignText:
	text "RADIANT TOWN"
	line "ORPHANAGE &"
	cont "#MON GYM"
	done
	
RadiantTownshipRoute21SignText:
	text "NORTH:"
	line "ROUTE 21"
	done
	
RadiantTownshipFlowerShopSignText:
	text "POLLEN PUFF"
	line "FLOWER SHOP."
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
	text "Sigh…"
	
	para "The girl at the"
	line "FLOWER SHOP is my"
	cont "dream girl!"
	
	para "I want to ask her"
	line "out, but what do"
	cont "you even get a"
	cont "girl like that?"
	
	para "…"
	
	para "…Flowers?"
	done
	
RadiantTownshipNPC3Text2:
	text "The kids from the"
	line "orphanage?"
	
	para "No clue, dude."
	
	para "Girls like"
	line "flowers, right?"
	
	para "Maybe check the"
	line "meadow."
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
	cont "troublemaker too!"
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
