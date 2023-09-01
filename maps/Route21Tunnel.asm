Route21Tunnel_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route21TunnelTrigger0
	scene_script Route21TunnelTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route21TunnelCallback

	db 7 ; warp events
	warp_event 38, 13, DUSK_TURNPIKE, 3
	warp_event 38, 14, DUSK_TURNPIKE, 4
	warp_event 38, 15, DUSK_TURNPIKE, 5
	warp_event 38, 16, DUSK_TURNPIKE, 6
	warp_event 38, 17, DUSK_TURNPIKE, 7
	warp_event 19,  3, SEASIDE_CAVE_1F, 4
	warp_event  5, 21, ROUTE_18, 4

	db 82 ; coord events
	xy_trigger 0, 13, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 14, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 15, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 16, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 17, 38, 0, Route21TunnelLightEntrance, 0, 0
	xy_trigger 0, 15,  4, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15,  5, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16,  4, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16,  5, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 14, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 15, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 14, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 15, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 24, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 25, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 24, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 25, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 34, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 15, 35, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 34, 0, Route21TunnelLight, 0, 0
	xy_trigger 0, 16, 35, 0, Route21TunnelLight, 0, 0
	xy_trigger 1, 13,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  2, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  3, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  2, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  3, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  7, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15,  6, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  7, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16,  6, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 18,  4, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 18,  5, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 12, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 12, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 14, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 15, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 17, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 17, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 22, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 22, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 24, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 25, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 27, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 27, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 32, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 32, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 34, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 35, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 13, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 37, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 14, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 15, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 13, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 13, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 14, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 15, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 16, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 16, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 24, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 25, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 23, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 23, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 24, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 25, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 26, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 26, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 36, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 36, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 35, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 14, 34, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 15, 33, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 16, 33, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 34, 0, Route21TunnelDark, 0, 0
	xy_trigger 1, 17, 35, 0, Route21TunnelDark, 0, 0

	db 1 ; bg events
	signpost 12, 21, SIGNPOST_READ, Route21TunnelGate

	db 8 ; object events
	person_event SPRITE_BIKER, 13, 12, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route21TunnelTrainer1, EVENT_HIDE_OW_OBJECTS_BLUE
	person_event SPRITE_BIKER, 17, 10, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route21TunnelTrainer2, EVENT_HIDE_OW_OBJECTS_BLUE
	person_event SPRITE_BIKER, 13,  8, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, Route21TunnelTrainer3, EVENT_HIDE_OW_OBJECTS_BLUE
	person_event SPRITE_CUEBALL, 17,  2, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route21TunnelTrainer4, EVENT_HIDE_OW_OBJECTS_BLUE
	person_event SPRITE_BIKER, 13, 12, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 4, Route21TunnelTrainer1, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_BIKER, 17, 10, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 4, Route21TunnelTrainer2, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_BIKER, 13,  8, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 4, Route21TunnelTrainer3, EVENT_HIDE_OW_OBJECTS_TEAL
	person_event SPRITE_CUEBALL, 17,  2, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route21TunnelTrainer4, EVENT_HIDE_OW_OBJECTS_TEAL


Route21TunnelTrigger0:
	end
	
Route21TunnelTrigger1:
	end

Route21TunnelCallback:
	readvar VAR_PLAYER_COLOR
	if_equal 1, .blue
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	jump .cont
.blue
	setevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
.cont
	checkscene
	ifequal $0, .nite
	checktime 1<<NITE
	iftrue .nite
	setflag ENGINE_NEAR_CAMPFIRE
	dotrigger $1
	return
.nite
	clearflag ENGINE_NEAR_CAMPFIRE
	return
	
Route21TunnelTrainer1:
	generictrainer BIKER, REX, EVENT_BEAT_ROUTE_21_TUNNEL_TRAINER_1, .SeenText, .BeatenText

	text "MOOMOO'S brings in"
	line "a real bad crowd…"
	
	para "Just a bunch of"
	line "hooligans and"
	cont "ner'er-do-wells."
	
	para "My people!"
	
	para "Gahaha!"
	done

.SeenText:
	text "When we aren't"
	line "hanging out in"
	cont "this tunnel,"
	
	para "you can find us"
	line "at MOOMOO'S!"
	done

.BeatenText:
	text "That's no good!"
	done
	
Route21TunnelTrainer2:
	generictrainer BIKER, JAMES, EVENT_BEAT_ROUTE_21_TUNNEL_TRAINER_2, .SeenText, .BeatenText

	text "There's no bridge"
	line "to the desert"
	cont "island."
	
	para "Only way there is"
	line "by boat!"
	done

.SeenText:
	text "You been to the"
	line "desert island?"
	
	para "They say you can't"
	line "get there by bike."
	done

.BeatenText:
	text "Burnout!"
	done
	
Route21TunnelTrainer3:
	generictrainer BIKER, HERB, EVENT_BEAT_ROUTE_21_TUNNEL_TRAINER_3, .SeenText, .BeatenText

	text "I guess you"
	line "showed me, huh?"
	done

.SeenText:
	text "Full throttle!"
	done

.BeatenText:
	text "Crash and"
	line "burn!"
	done
	
Route21TunnelTrainer4:
	generictrainer CUEBALL, CURLY, EVENT_BEAT_ROUTE_21_TUNNEL_TRAINER_4, .SeenText, .BeatenText

	text "Alright! alright!"
	
	para "You win, just"
	line "leave me alone!"
	done

.SeenText:
	text "Guh! Huh! Huh!"
	
	para "What's a little"
	line "runt like you"
	cont "doin' inna place"
	cont "like this?"
	done

.BeatenText:
	text "Guh! Huh! Wuh!"
	done
	
Route21TunnelGate:
	checkcode VAR_FACING
	ifequal DOWN, .FacingGate
	jumptext Route21TunnelGateText1
.FacingGate
	checkevent EVENT_ROUTE_21_TUNNEL_GATE_IS_UP
	iftrue .gate_is_up
	opentext
	writetext Route21TunnelGateText2
	yesorno
	iffalse .saidno
	writetext Route21TunnelGateTextPressedButton
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 5
	changeblock $12, $0c, $1c
	changeblock $14, $0c, $a6
	changeblock $14, $0a, $a2
	pause 20
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	callasm GenericFinishBridge
	setevent EVENT_ROUTE_21_TUNNEL_GATE_IS_UP
	end
.gate_is_up
	opentext
	writetext Route21TunnelGateText3
	yesorno
	iffalse .saidno
	writetext Route21TunnelGateTextPressedButton
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 5
	changeblock $12, $0c, $b8
	changeblock $14, $0c, $a7
	changeblock $14, $0a, $a3
	pause 20
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	callasm GenericFinishBridge
	clearevent EVENT_ROUTE_21_TUNNEL_GATE_IS_UP
	end
.saidno
	writetext Route21TunnelGateTextNo
	waitbutton
	closetext
	end
	
Route21TunnelLightEntrance:
	checktime 1<<NITE
	iftrue Route21TunnelDark
;fallthrough

Route21TunnelLight:
	setflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
Route21TunnelDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $0
	end
	
Route21TunnelGateText1:
	text "A control panel"
	line "for the gate arm."
	
	para "You can't reach"
	line "the button from"
	cont "this side…"
	done
	
Route21TunnelGateText2:
	text "The gate is down."
	
	para "Press the button?"
	done
	
Route21TunnelGateText3:
	text "The gate is up."
	
	para "Press the button?"
	done
	
Route21TunnelGateTextPressedButton:
	text "Who wouldn't?"
	done
	
Route21TunnelGateTextNo:
	text "Better not…"
	done
	