RiverRapidsEntrance_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RiverRapidsEntranceCallback

	db 1 ; warp events
	warp_def  9, 19, 2, RIVER_RAPIDS_HOUSE

	db 0 ; coord events

	db 9 ; bg events
	signpost  5,  2, SIGNPOST_JUMPTEXT, RiverRapidsEntranceRapidText
	signpost  5,  3, SIGNPOST_JUMPTEXT, RiverRapidsEntranceRapidText
	signpost  5,  4, SIGNPOST_JUMPTEXT, RiverRapidsEntranceRapidText
	signpost  5,  5, SIGNPOST_JUMPTEXT, RiverRapidsEntranceRapidText
	signpost  9, 22, SIGNPOST_JUMPTEXT, RiverRapidsEntranceWoodText
	signpost  9, 23, SIGNPOST_JUMPTEXT, RiverRapidsEntranceWoodText
	signpost  8, 16, SIGNPOST_READ, RiverRapidsEntranceHerbs
	signpost  8, 17, SIGNPOST_READ, RiverRapidsEntranceHerbs
	signpost 10, 21, SIGNPOST_JUMPTEXT, RiverRapidsEntranceBowlsText

	db 2 ; object events
	object_event 20, 10, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, EEVEE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RiverRapidsEntranceEevee, -1
	person_event SPRITE_SLOWPOKETAIL, 12,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RiverRapidsEntranceSlowpoke, -1
	
	
RiverRapidsEntranceCallback:
	checkevent EVENT_RIVER_RAPIDS
	iffalse .end
	domaptrigger RIVER_RAPIDS, $0
	clearevent EVENT_RIVER_RAPIDS
	playnewmapmusic
.end
	return
	
Movement_RiverRapidsEntrance:
	step_right
	step_right
	step_right
	step_up
	step_end
	
Movement_RiverRapidsEntrance_StepDown:
	fix_facing
	step_down
	remove_fixed_facing
	step_end
	
RiverRapidsEntranceRapidText:
	text "The current here"
	line "is super fast!"
	done
	
RiverRapidsEntranceWoodText:
	text "Wood is stacked"
	line "neatly by the"
	cont "kiln."
	done
	
RiverRapidsEntranceBowlsText:
	text "A food and water"
	line "bowl."
	done
	
RiverRapidsEntranceEevee:
	checkevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	iftrue .talked
	opentext TEXTBOX_POKEMON, EEVEE
	jump .cont
.talked
	opentext TEXTBOX_JUNIPER
.cont
	writetext RiverRapidsEntranceEeveeText1
	cry EEVEE
	waitsfx
	buttonsound
	changetextboxspeaker
	writetext RiverRapidsEntranceEeveeText2
	waitbutton
	closetext
	end
	
RiverRapidsEntranceEeveeText1:
	text "Vuiii…"
	done
	
RiverRapidsEntranceEeveeText2:
	text "It looks happy"
	line "and well-fed."
	done
	
RiverRapidsEntranceAzumarill:
	checkevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	iftrue .talked
	opentext TEXTBOX_POKEMON, AZUMARILL
	jump .cont
.talked
	opentext TEXTBOX_RAINDROP
.cont
	writetext RiverRapidsEntranceAzumarillText1
	cry AZUMARILL
	waitsfx
	buttonsound
	changetextboxspeaker
	writetext RiverRapidsEntranceAzumarillText2
	waitbutton
	closetext
	end

RiverRapidsEntranceAzumarillText1:
	text "Zu zu zu!"
	done
	
RiverRapidsEntranceAzumarillText2:
	text "It's bobbing back"
	line "and forth happily."
	done
	
RiverRapidsEntranceMagby:
	checkevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	iftrue .talked
	opentext TEXTBOX_POKEMON, MAGBY
	jump .cont
.talked
	opentext TEXTBOX_SPIRIT
.cont
	writetext RiverRapidsEntranceMagbyText1
	cry MAGBY
	waitsfx
	buttonsound
	changetextboxspeaker
	writetext RiverRapidsEntranceMagbyText2
	waitbutton
	closetext
	end

RiverRapidsEntranceMagbyText1:
	text "Gahhhg-bee…"
	done
	
RiverRapidsEntranceMagbyText2:
	text "It keeps glancing"
	line "at the fireplace."
	done
	
RiverRapidsEntranceSwablu:
	checkevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	iftrue .talked
	opentext TEXTBOX_POKEMON, SWABLU
	jump .cont
.talked
	opentext TEXTBOX_BLISS
.cont
	writetext RiverRapidsEntranceSwabluText1
	cry SWABLU
	waitsfx
	buttonsound
	changetextboxspeaker
	writetext RiverRapidsEntranceSwabluText2
	waitbutton
	closetext
	end
	
RiverRapidsEntranceSwabluText1:
	text "Lu lu luuu!"
	done
	
RiverRapidsEntranceSwabluText2:
	text "It's whistling a"
	line "happy tune."
	done
	
RiverRapidsEntranceSlowpoke:
	checkevent EVENT_TALKED_TO_RIVER_RAPIDS_LADY_ONCE
	iftrue .talked
	opentext TEXTBOX_POKEMON, SLOWPOKE
	jump .cont
.talked
	opentext TEXTBOX_FLOWER
.cont
	writetext RiverRapidsEntranceSlowpokeText1
	cry SLOWPOKE
	waitsfx
	buttonsound
	changetextboxspeaker
	writetext RiverRapidsEntranceSlowpokeText2
	waitbutton
	closetext
	end

RiverRapidsEntranceSlowpokeText1:
	text "<WAIT_S>S<WAIT_S>l<WAIT_S>o<WAIT_S>o<WAIT_S>o<WAIT_S>o<WAIT_S>w<WAIT_S>…<WAIT_L><WAIT_L><WAIT_M>"
	line "…poke?"
	done
	
RiverRapidsEntranceSlowpokeText2:
	text "There's a sign"
	line "around its neck:"
	
	para "LAKE's RIVER RUSH"
	
	para "Inquire ahead."
	done
	
RiverRapidsEntranceHerbs:
	farjumptext HerbsText
