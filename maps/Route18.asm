Route18_MapScriptHeader:
	db 2 ; scene scripts
	scene_script Route18Trigger0
	scene_script Route18Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route18Callback

	db 0 ; warp events

	db 1 ; coord events
	coord_event 23, 23, 0, Route18ChangeDisguiseman1

	db 0 ; bg events

	db 6 ; object events
	object_event  8, 22, SPRITE_DISGUISE_MASTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route18Disguiseman, EVENT_ROUTE_18_DISGUISEMAN1
	object_event  8, 22, SPRITE_DISGUISEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route18Disguiseman, EVENT_ROUTE_18_DISGUISEMAN2
	person_event SPRITE_BURGLAR, 18, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute18_1, -1
	person_event SPRITE_DELINQUENT_M, 27, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute18_2, -1
	person_event SPRITE_BIKER, 10,  9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute18_3, -1
	person_event SPRITE_CUEBALL,  2, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute18_4, -1

	const_def 1 ; object constants
	const ROUTE_18_DISGUISEMAN1
	const ROUTE_18_DISGUISEMAN2
	

Route18Trigger0:
	end
	
Route18Trigger1:
	end

Route18Callback:
	changeblock $c, $24, $2d
	return

Route18ChangeDisguiseman1:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	disappear ROUTE_18_DISGUISEMAN1
	appear ROUTE_18_DISGUISEMAN2
	dotrigger $1
	end

TrainerRoute18_1:
	generictrainer BURGLAR, ZEDAKI, EVENT_BEAT_ROUTE_18_TRAINER_1, .SeenText, .BeatenText

	text "The cops are"
	line "lookin' for me!"
	
	para "I gotta lay low"
	line "for awhile!"
	done

.SeenText:
	text "Hey there!"
	
	para "This is a holdup!"
	
	para "Give me all your"
	line "money."
	done

.BeatenText:
	text "Ok fine!"
	
	para "Take my money"
	line "instead…"
	done
	
TrainerRoute18_2:
	generictrainer DELINQUENT_M, MAO, EVENT_BEAT_ROUTE_18_TRAINER_2, .SeenText, .BeatenText

	text "Maybe I'm not cut"
	line "out for the desert"
	cont "lifestyle…"
	done

.SeenText:
	text "Out in the desert"
	line "no one can tell"
	cont "me what to do."
	
	para "I'm a free man!"
	done

.BeatenText:
	text "I just can't win!"
	done
	
TrainerRoute18_3:
	generictrainer BIKER, SHINTO, EVENT_BEAT_ROUTE_18_TRAINER_3, .SeenText, .BeatenText

	text "I knew I shouldn't"
	line "have taken this"
	cont "thing out here!"
	
	para "This ain't no"
	line "dirtbike!"
	done

.SeenText:
	text "Darn it!"
	
	para "My bike keeps"
	line "gettin' stuck in"
	cont "the sand!"
	
	para "I'll take it out"
	line "on you!"
	done

.BeatenText:
	text "My wheels are"
	line "spinnin!"
	done
	
TrainerRoute18_4:
	generictrainer CUEBALL, BONGO, EVENT_BEAT_ROUTE_18_TRAINER_4, .SeenText, .BeatenText

	text "You think yur"
	line "better than me!?"
	
	para "…<WAIT_M>Oh…"
	
	para "I guess you are…"
	
	para "HAW! <WAIT_S>HAW! <WAIT_S>HAW!"
	done

.SeenText:
	text "HAW! <WAIT_S>HAW! <WAIT_S>HAW!"
	
	para "Little kiddy all"
	line "alone out in the"
	cont "desert!"
	
	para "I'll put ya outta"
	line "yur misery!"
	done

.BeatenText:
	text "ARRGH!"
	done

Route18Disguiseman:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_DISGUISE_MASTER
	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement ROUTE_18_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan1
	opentext
	writetext StarglowCavern_DisguiseMan1Text1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Route18_DisguiseMan1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext Route18DisguisemanBeatenText, 0
	setlasttalked ROUTE_18_DISGUISEMAN2
	loadtrainer DISGUISE, MASTER_4
	startbattle
	reloadmapafterbattle
	opentext
	writetext Route18_DisguiseMan1Text3
	waitbutton
	closetext
	applymovement ROUTE_18_DISGUISEMAN2, Movement_StarglowCavern_DisguiseMan2
	disappear ROUTE_18_DISGUISEMAN2
	opentext
	writetext StarglowCavern_DisguiseMan1Text4
	waitbutton
	closetext
	setevent EVENT_ROUTE_18_DISGUISEMAN1
	setevent EVENT_ROUTE_18_DISGUISEMAN2
	setevent EVENT_UNIQUE_ENCOUNTER_DISGUISE_MASTER_ROUTE_18
	end
	
Route18_DisguiseMan1Text2:
	text "I donned my"
	line "costume way too"
	cont "late."
	
	para "I never thought"
	line "you'd take the"
	cont "bait."
	
	para "You saw my face,"
	line "and yet in spite,"
	
	para "you still came by"
	line "to pick a fight,"
	
	para "even though I'd"
	line "blown my cover."
	
	para "Are your just a"
	line "battle lover?"
	
	para "Well, without"
	line "further ado,"
	
	para "it's time for me"
	line "to scrap with you!"
	done
	
Route18_DisguiseMan1Text3:
	text "I could say I was"
	line "caught off guard,"
	
	para "but I would never"
	line "play that card."
	
	para "Next time I won't"
	line "be so surprised,"
	
	para "for I'm the MASTER"
	line "OF DISGUISE!"
	done

Route18DisguisemanBeatenText:
	text "You won that one,"
	line "there is no doubt."
	
	para "I will not cry."
	line "I will not pout."
	done
