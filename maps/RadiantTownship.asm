RadiantTownship_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 8 ; warp events
	warp_def 13, 35, 1, RADIANT_FLOWER_SHOP
	warp_def 25, 18, 1, RADIANT_FIELD
	warp_def 25, 19, 2, RADIANT_FIELD
	warp_def 13, 22, 1, RADIANT_ORPHANAGE_1F
	warp_def  7,  5, 1, RADIANT_POKECENTER
	warp_def 15,  5, 1, RADIANT_MART
	warp_def  9, 15, 1, RADIANT_HOUSE
	warp_def  5, 31, 3, ROUTE_20_GATE

	db 0 ; coord events

	db 31 ; bg events
	signpost 14, 12, SIGNPOST_READ, RadiantTownshipSign
	signpost 18, 20, SIGNPOST_READ, RadiantMeadowSign
	signpost 14, 21, SIGNPOST_READ, RadiantTownshipGymSign
	signpost  6, 32, SIGNPOST_READ, RadiantTownshipRoute19Sign
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

	db 11 ; object events
	person_event SPRITE_CUTE_GIRL, 10,  8, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantTownshipNPC1, -1
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

RadiantTownshipSign:
	jumptext RadiantTownshipSignText
	
RadiantMeadowSign:
	jumptext RadiantMeadowSignText
	
RadiantTownshipGymSign:
	jumptext RadiantTownshipGymSignText
	
RadiantTownshipRoute19Sign:
	jumptext RadiantTownshipRoute19SignText
	
RadiantTownshipSolarPanel:
	jumptext RadiantTownshipSolarPanelText
	
RadiantTownshipPokeCenterSign:
	jumpstd pokecentersign
	
RadiantTownshipMartSign:
	jumpstd martsign
	
RadiantTownshipFlowerShopSign:
	jumptext RadiantTownshipFlowerShopSignText
	
RadiantTownshipSignText:
	text "RADIANT TOWNSHIP"
	
	para "A little community"
	line "among the flowers."
	done
	
RadiantMeadowSignText:
	text "RADIANT MEADOW"
	done
	
RadiantTownshipGymSignText:
	text "RADIANT TOWNSHIP"
	line "ORPHANAGE &"
	cont "#MON GYM"
	done
	
RadiantTownshipRoute19SignText:
	text "NORTH:"
	line "ROUTE 20"
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
	text "TEXT 1"
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
