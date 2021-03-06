EventideVillage_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, EventideVillageFlypointCallback
	callback MAPCALLBACK_OBJECTS, EventideVillageWendyRematch

	db 9 ; warp events
	warp_event  6, 20, EVENTIDE_VILLAGE_GATE, 3
	warp_event  6, 21, EVENTIDE_VILLAGE_GATE, 4
	warp_event 13, 17, EVENTIDE_POKECENTER, 1
	warp_event 23, 25, EVENTIDE_MART, 1
	warp_event 23, 13, EVENTIDE_BIKE_SHOP, 1
	warp_event 13, 25, EVENTIDE_GYM_SPEECH_HOUSE, 1
	warp_event 35, 13, EVENTIDE_SOOTHE_BELL_HOUSE, 1
	warp_event 31, 37, EVENTIDE_GYM, 1
	warp_event 32, 37, EVENTIDE_GYM, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event 24, 36, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 25, 36, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 26, 36, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 27, 36, SIGNPOST_JUMPTEXT, EventideVillageBiplaneText
	bg_event 18, 19, SIGNPOST_JUMPTEXT, EventideVillageSignText
	bg_event 24, 15, SIGNPOST_JUMPTEXT, EventideVillageBikeShopSignText
	bg_event 29, 38, SIGNPOST_JUMPTEXT, EventideVillageGymSignText
	signpost 17, 14, SIGNPOST_READ, EventideVillagePokeCenterSign
	signpost 25, 24, SIGNPOST_READ, EventideVillageMartSign

	db 11 ; object events
	person_event SPRITE_HANGAR_PARTS, 32, 33, SPRITEMOVEDATA_HANGAR_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 21, 32, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	object_event 19, 34, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	object_event 22, 36, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	object_event 13, 33, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	object_event 12, 38, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	object_event 14, 43, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, EventideVillageMiltank, -1
	person_event SPRITE_COWGIRL, 34, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EventideVillageMilkGirl, -1
	person_event SPRITE_ROCKER, 20, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EventideVillageNPC1, -1
	person_event SPRITE_CUTE_GIRL, 15, 30, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EventideVillageNPC2, -1
	itemball_event  8, 18, PROTEIN, 1, EVENT_EVENTIDE_VILLAGE_POKEBALL

EventideVillageFlypointCallback:
	setflag ENGINE_FLYPOINT_EVENTIDE
	return
	
EventideVillageWendyRematch:
	checkevent EVENT_BEAT_WENDY_REMATCH
	iffalse .end
	clearevent EVENT_BEAT_WENDY_REMATCH
	clearevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_1_REMATCH
	clearevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_2_REMATCH
	clearevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_3_REMATCH
	clearevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_4_REMATCH
	clearevent EVENT_BEAT_EVENTIDE_GYM_TRAINER_5_REMATCH
.end
	return
	
EventideVillagePokeCenterSign:
	jumpstd pokecentersign
	
EventideVillageMartSign:
	jumpstd martsign
	
EventideVillageNPC1:
	jumptextfaceplayer EventideVillageNPC1Text
	
EventideVillageNPC2:
	jumptextfaceplayer EventideVillageNPC2Text
	
EventideVillageMiltank:
	opentext
	writetext EventideVillageMiltankText
	cry MILTANK
	waitbutton
	closetext
	end
	
EventideVillageMilkGirl:
	faceplayer
	opentext
	writetext EventideVillageMilkGirlText1
	yesorno
	iffalse .no
	writetext EventideVillageMilkGirlText2
;	refreshscreen $0
	special PlaceMoneyTopRight
	loadmenudata EventideVillageMilkMenuData
	verticalmenu
	closewindow
	if_equal $1, .one
	if_equal $2, .dozen
	jump .no
.one
	checkmoney $0, 500
	ifequal $2, .nomoney
	giveitem MOOMOO_MILK
	iffalse .noroom
	takemoney $0, 500
	takeitem MOOMOO_MILK
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext EventideVillageMilkGirlTextOne
	buttonsound
	verbosegiveitem MOOMOO_MILK
	closetext
	end
.dozen
	checkmoney $0, 6000
	ifequal $2, .nomoney
	giveitem MOOMOO_MILK, 12
	iffalse .noroom
	takemoney $0, 6000
	takeitem MOOMOO_MILK, 12
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext EventideVillageMilkGirlTextDozen
	buttonsound
	verbosegiveitem MOOMOO_MILK, 12
	closetext
	end
.nomoney
	writetext EventideVillageMilkGirlTextNoMoney
	waitbutton
	closetext
	end
.noroom
	writetext EventideVillageMilkGirlTextNoRoom
	waitbutton
	closetext
	end
.no
	writetext EventideVillageMilkGirlTextNo
	waitbutton
	closetext
	end
	
EventideVillageMilkMenuData
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "× 1    ¥500@"
	db "×12   ¥6000@"
	db "CANCEL@"
	
EventideVillageNPC1Text:
	text "I wish I could"
	line "afford a bike."
	
	para "Could you imagine"
	line "me on a set of"
	cont "wheels?"
	
	para "Talk about a"
	line "lady-killer!"
	done
	
EventideVillageNPC2Text:
	text "Just passing"
	line "through?"
	
	para "Yeah, if you aren't"
	line "a farmer,"
	
	para "there isn't much to"
	line "do around here."
	done
	
EventideVillageMilkGirlText1:
	text "I take care of the"
	line "MILTANK here."
	
	para "Their milk is so"
	line "delicious and"
	cont "nutritious!"
	
	para "#MON love it!"
	
	para "Do you want to"
	line "buy some?"
	done
	
EventideVillageMilkGirlText2:
	text "I can sell single"
	line "bottles, or by the"
	cont "dozen."
	
	para "How much do you"
	line "want?"
	done
	
EventideVillageMilkGirlTextOne:
	text "One bottle?"
	line "Here ya go!"
	done
	
EventideVillageMilkGirlTextDozen:
	text "A dozen?"
	
	para "Coming right up!"
	done
	
EventideVillageMilkGirlTextNoMoney:
	text "Oh my!"
	
	para "It looks like you"
	line "don't have enough"
	cont "money!"
	
	para "Too bad…"
	done
	
EventideVillageMilkGirlTextNoRoom:
	text "Oh my!"
	
	para "It looks like your"
	line "PACK is full…"
	
	para "Come back when you've"
	line "made some room."
	done
	
EventideVillageMilkGirlTextNo:
	text "Oh well…"
	
	para "I'll be here."
	done
	
EventideVillageBiplaneText:
	text "An old biplane."
	
	para "It's obviously been"
	line "used recently."
	done
	
EventideVillageMiltankText:
	text "MILTANK: Mooo!"
	done
	
EventideVillageSignText:
	text "EVENTIDE VILLAGE"
	
	para "A town of soaring"
	line "ambitions."
	done

EventideVillageBikeShopSignText:
	text "EVENTIDE BIKE SHOP"
	done


EventideVillageGymSignText:
	text "EVENTIDE VILLAGE"
	line "#MON GYM"
	cont "LEADER: WENDY"

	para "The high-flying"
	line "aviator."
	done
	
	