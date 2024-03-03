HuntersThicket_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29, 20, SIGNPOST_ITEM + SUN_STONE, EVENT_HUNTERS_THICKET_HIDDEN_SUN_STONE

	db 8 ; object events
	itemball_event  5, 20, CALCIUM, 1, EVENT_HUNTERS_THICKET_BALL_1
	itemball_event 18, 29, REPEL, 1, EVENT_HUNTERS_THICKET_BALL_2
	itemball_event 14, 21, X_SPEED, 1, EVENT_HUNTERS_THICKET_BALL_3
	person_event SPRITE_COOLTRAINER_F, 29, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 2, TrainerHunters_1, -1
	person_event SPRITE_BUG_CATCHER, 16, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerHunters_2, -1
	person_event SPRITE_PICNICKER, 19, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerHunters_3, -1
	object_event 10,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LEDIAN, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, HuntersThicketLedian, EVENT_HUNTERS_THICKET_LEDIAN_GONE
	fruittree_event  8, 14, FRUITTREE_HUNTERS_THICKET, CHESTO_BERRY

	const_def 1 ; object constants
	const HUNTERS_THICKET_POKE_BALL_1
	const HUNTERS_THICKET_POKE_BALL_2
	const HUNTERS_THICKET_POKE_BALL_3
	const HUNTERS_THICKET_TRAINER_1
	const HUNTERS_THICKET_TRAINER_2
	const HUNTERS_THICKET_TRAINER_3
	const HUNTERS_THICKET_LEDIAN

HuntersThicketLedian:
	opentext
	writetext HuntersThicketLedianText
	cry LEDIAN
	waitbutton
	closetext
	waitsfx
	loadwildmon LEDIAN, 19
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear HUNTERS_THICKET_LEDIAN
	reloadmapafterbattle
	setevent EVENT_HUNTERS_THICKET_LEDIAN_GONE
	checkcode VAR_MONJUSTCAUGHT
	if_equal LEDIAN, .CaughtLedian
	opentext
	writetext HuntersThicketLedianTextGone
	waitbutton
	closetext
.CaughtLedian
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end

HuntersThicketLedianText:
	text "LEDIIIII!"
	done

HuntersThicketLedianTextGone:
	text "LEDIAN flew off"
	line "into the woods!"
	done

TrainerHunters_1:
	generictrainer COOLTRAINERF, SALLY, EVENT_BEAT_HUNTERS_TRAINER_1, .SeenText, .BeatenText

	text "I was at 19 wins"
	line "in a row until you"
	cont "came along…"
	done

.SeenText:
	text "Nice!"
	
	para "Another TRAINER!"
	
	para "Time to keep my"
	line "winning streak"
	cont "going!"
	done

.BeatenText:
	text "No!"
	
	para "My winning streak!"
	done
	
TrainerHunters_2:
	generictrainer BUG_CATCHER, JOSH, EVENT_BEAT_HUNTERS_TRAINER_2, .SeenText, .BeatenText

	text "My BUG #MON"
	line "ARE rocks!"
	done

.SeenText:
	text "BUG #MON rock!"
	
	para "Let me show you!"
	done

.BeatenText:
	text "See?"
	
	para "I told you."
	done
	
TrainerHunters_3:
	generictrainer PICNICKER, TRISTA, EVENT_BEAT_HUNTERS_TRAINER_3, .SeenText, .BeatenText

	text "Why'd you have to"
	line "come along and"
	cont "ruin my good time?"
	done

.SeenText:
	text "Isn't this spot"
	line "just beautiful?"
	
	para "This is my favor-"
	line "ite place in the"
	cont "whole wide world!"
	done

.BeatenText:
	text "Who invited you?"
	done
