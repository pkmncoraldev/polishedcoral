MtOnwaB3F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 25, 17, 3, MT_ONWA_B2F
	warp_def 23, 17, 3, MT_ONWA_B3F
	warp_def 25, 7, 2, MT_ONWA_B3F
	warp_def 11, 15, 4, MT_ONWA_B2F

	db 2 ; coord events
	coord_event  3, 20, 0, MtOnwaB3FTrainerStopsYou
	coord_event  4, 20, 0, MtOnwaB3FTrainerStopsYou2

	db 0 ; bg events

	db 4 ; object events
	object_event 4, 3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MAGMAR, -1, -1, (1 << 3) | PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, LavaCaveBF3Magmar, EVENT_MT_ONWA_B3F_MAGMAR_GONE
	person_event SPRITE_FIREBREATHER, 20, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MtOnwaB3FTrainer, -1
	itemball_event 13, 8, ELECTIRIZER, 1, EVENT_MT_ONWA_B3F_POKE_BALL
	itemball_event  7, 16, ULTRA_BALL, 1, EVENT_MT_ONWA_B3F_POKE_BALL_2
	
	const_def 1 ; object constants
	const MTONWABF3_MAGMAR
	const MTONWABF3_TRAINER

	
LavaCaveBF3Magmar:
	opentext
	writetext LavaCaveBF3MagmarText
	cry MAGMAR
	waitbutton
	closetext
	waitsfx
	loadwildmon MAGMAR, 25
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear MTONWABF3_MAGMAR
	reloadmapafterbattle
	setevent EVENT_MT_ONWA_B3F_MAGMAR_2
	checkcode VAR_MONJUSTCAUGHT
	if_equal MAGMAR, .CaughtMagmar
	opentext
	writetext LavaCaveBF3MagmarTextGone
	waitbutton
	closetext
.CaughtMagmar
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end

MtOnwaB3FTrainerStopsYou:
	special SaveMusic
	playmusic MUSIC_HIKER_ENCOUNTER
	showemote EMOTE_SHOCK, MTONWABF3_TRAINER,  30
	jump MtOnwaB3FTrainerStopsYouCont
MtOnwaB3FTrainerStopsYou2:
	special SaveMusic
	playmusic MUSIC_HIKER_ENCOUNTER
	showemote EMOTE_SHOCK, MTONWABF3_TRAINER,  30
	applyonemovement MTONWABF3_TRAINER, step_right
MtOnwaB3FTrainerStopsYouCont:
	spriteface PLAYER, LEFT
	opentext
	writetext LavaCaveBF3TrainerSeenText
	waitbutton
	closetext
	waitsfx
	winlosstext LavaCaveBF3TrainerBeatenText, 0
	setlasttalked MTONWABF3_TRAINER
	loadtrainer FIREBREATHER, DOM
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_MT_ONWA_B3F_TRAINER
	dotrigger $1
MtOnwaB3FTrainer:
	faceplayer
	opentext
	writetext LavaCaveBF3TrainerHealText
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
.no
	closetext
	end
	
LavaCaveBF3MagmarText:
	text "MAAAAAR! MAG!"
	line "MAR!"
	done
	
LavaCaveBF3MagmarTextGone:
	text "With a loud roar,"
	line "MAGMAR retreated"
	cont "deep into the"
	cont "cave!"
	done
	
LavaCaveBF3TrainerHealText:
	text "Alright, a deal"
	line "is a deal."
	
	para "You want me to"
	line "heal your #MON?"
	done
	
LavaCaveBF3TrainerSeenText:
	text "There's a really"
	line "tough #MON up"
	cont "ahead."
	
	para "You aren't tired,"
	line "are ya?"
	
	para "I'll tell you"
	line "what."
	
	para "If you beat me,"
	line "I'll heal your"
	cont "#MON for you."
	done
	
LavaCaveBF3TrainerBeatenText:
	text "Really tough!"
	done
