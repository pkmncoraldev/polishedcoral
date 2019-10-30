SunbeamGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 25,  4, 3, SUNBEAM_ISLAND
	warp_def 25,  5, 12, SUNBEAM_ISLAND
	warp_def  5, 12, 1, SUNBEAM_GYM_CAVE

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	person_event SPRITE_GYM_GUY, 21,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamGymGuyScript, -1
	person_event SPRITE_GENTLEMAN, 14,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerSunbeamGym_1, -1
	person_event SPRITE_PICNICKER, 13, 19, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerSunbeamGym_2, -1
	person_event SPRITE_GENTLEMAN,  6, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerSunbeamGym_3, -1
	person_event SPRITE_CAMPER, 13, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerSunbeamGym_4, -1
	person_event SPRITE_GENTLEMAN, 19, 27, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerSunbeamGym_5, -1
	person_event SPRITE_LEILANI, 16,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamGymLeilani, -1
	cuttree_event  4,  9, EVENT_SUNBEAM_GYM_CUT_TREE_1
	cuttree_event 24,  5, EVENT_SUNBEAM_GYM_CUT_TREE_2
	cuttree_event 25, 18, EVENT_SUNBEAM_GYM_CUT_TREE_3
	
	const_def 1 ; object constants
	const SUNBEAM_GYM_GYM_GUY
	const SUNBEAM_GYM_TRAINER_1
	const SUNBEAM_GYM_TRAINER_2
	const SUNBEAM_GYM_TRAINER_3
	const SUNBEAM_GYM_TRAINER_4
	const SUNBEAM_GYM_TRAINER_5
	const SUNBEAM_GYM_LEILANI
	const SUNBEAM_GYM_TREE_1
	const SUNBEAM_GYM_TREE_2
	const SUNBEAM_GYM_TREE_3
	
SunbeamGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LEILANI
	iftrue .SunbeamGymGuyWinScript
	writetext SunbeamGymGuyText
	waitbutton
	closetext
	end
	
.SunbeamGymGuyWinScript:
	writetext SunbeamGymGuyWinText
	waitbutton
	closetext
	end
	
TrainerSunbeamGym_1:
	generictrainer SAFARI, JULIAN, EVENT_BEAT_SUBEAM_GYM_TRAINER_1, .SeenText, .BeatenText

	text "A powerful"
	line "challenger?"
	
	para "How unusual!"
	done

.SeenText:
	text "A GYM in a jungle?"
	
	para "How unusual!"
	done

.BeatenText:
	text "My word!"
	done
	
TrainerSunbeamGym_2:
	generictrainer PICNICKER, TINA, EVENT_BEAT_SUBEAM_GYM_TRAINER_2, .SeenText, .BeatenText

	text "I'm not sure how"
	line "much longer I can"
	cont "take this…"
	
	para "I need A/C!"
	done

.SeenText:
	text "When I took this"
	line "job, I thought I"
	
	para "would be inside"
	line "all day."
	
	para "I'm burning up out"
	line "here!"
	done

.BeatenText:
	text "Pant…"
	line "Pant…"
	done

	
TrainerSunbeamGym_3:
	generictrainer SAFARI, PAUL, EVENT_BEAT_SUBEAM_GYM_TRAINER_3, .SeenText, .BeatenText

	text "WHAT?"
	
	para "THE WATERFALL IS"
	line "TOO LOUD!"
	done

.SeenText:
	text "I LOVE THE RUSHING"
	line "OF THE WATERFALL!"
	
	para "…"
	
	para "WHAT?"
	
	para "I CAN'T HEAR YOU!"
	done

.BeatenText:
	text "GOOD BATTLE!"
	done

	
TrainerSunbeamGym_4:
	generictrainer CAMPER, DANTE, EVENT_BEAT_SUBEAM_GYM_TRAINER_4, .SeenText, .BeatenText

	text "You should be"
	line "tough enough to"
	
	para "take on the GYM"
	line "LEADER."
	
	para "I still need to"
	line "train more."
	done

.SeenText:
	text "Man!"
	
	para "This GYM is so"
	line "intense!"
	
	para "Training in a"
	line "jungle toughens"
	
	para "your #MON up"
	line "quick!"
	done

.BeatenText:
	text "Not tough"
	line "enough!"
	done

	
TrainerSunbeamGym_5:
	generictrainer SAFARI, PHILLIP, EVENT_BEAT_SUBEAM_GYM_TRAINER_5, .SeenText, .BeatenText

	text "I thought this"
	line "would be a good"
	
	para "place to study"
	line "#MON."
	
	para "However, I haven't"
	line "been able to"
	cont "locate any"
	cont "specimens."
	done

.SeenText:
	text "This lush jungle"
	line "is the perfect"
	
	para "place to study "
	line "#MON."
	done

.BeatenText:
	text "I see."
	done
	
SunbeamGymGuyText:
	text "Yo!"
	
	para "Champ in making!"
	
	para "This jungle is"
	line "where you'll get"
	
	para "your next GYM"
	line "BADGE."
	
	para "I guess you could"
	line "call it a"
	cont "JUNGLE-GYM!"
	
	para "The TRAINERS here"
	line "specialize in"
	cont "GRASS #MON."
	
	para "They can't take a"
	line "hit from FIRE or"
	
	para "FLYING moves, but"
	line "using WATER or"
	
	para "ROCK is probably a"
	line "bad idea."
	
	para "Good luck, kid!"
	done

SunbeamGymGuyWinText:
	text "Great job!"

	para "You braved the"
	line "dangers of the"
	
	para "jungle, and came"
	line "out victorious!"
	
	para "That's 3 BADGES"
	line "down!"
	done
	
Movement_SunbeamGymNoEntry1:
	step_down
	step_end

Movement_SunbeamGymNoEntry2:
	step_right
	step_end
	
SunbeamGymLeilani:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LEILANI
	iftrue .FightDone
	writetext SunbeamGymLeilaniTextBeforeBattle1
	waitbutton
	closetext
	applymovement SUNBEAM_GYM_LEILANI, Movement_SunbeamGymLeilani
	faceplayer
	opentext
	writetext SunbeamGymLeilaniTextBeforeBattle2
	waitbutton
	closetext
	waitsfx
	winlosstext SunbeamGymLeilaniTextWin, SunbeamGymLeilaniTextLoss
	loadtrainer LEILANI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LEILANI
	opentext
	writetext Text_ReceivedThirdBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THIRDBADGE
	checkcode VAR_BADGES
	
	
.FightDone:	
	checkevent EVENT_GOT_TM_FROM_LEILANI
	iftrue .GotTMFromLeilani
	writetext SunbeamGymLeilaniTextAfterBattle
	buttonsound
	verbosegivetmhm TM_SUNNY_DAY
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM_FROM_LEILANI
	writetext SunbeamGymLeilaniTextTMSpeech
	waitbutton
	closetext
	end

.GotTMFromLeilani:
	writetext SunbeamGymLeilaniTextLoop
	waitbutton
.NoRoomForTM:
	closetext
	end

SunbeamGymLeilaniTextBeforeBattle1:
	text "Hey!"
	
	para "It's the kid from"
	line "the beach!"
	
	para "I'm LEILANI!"
	
	para "As I said earlier,"
	line "I'm the GYM LEADER"
	cont "of SUNBEAM ISLAND."	
	done
	
SunbeamGymLeilaniTextBeforeBattle2:
	text "You made it"
	line "through the"
	cont "jungle!"
	
	para "The harsh climate"
	line "and tough TRAINERS"
	
	para "usually weed out"
	line "the serious chal-"
	
	para "lengers from the"
	line "rest."
	
	para "You know, all my"
	line "life I've been told"
	cont "I'm beautiful, but"
	
	para "sometimes I feel"
	line "like that's all"
	cont "people see in me."
	
	para "I've spent so much"
	line "time and effort"
	
	para "refining not only"
	line "my appearance, but"
	
	para "also my battle"
	line "skills!"
	
	para "Now it's time to"
	line "prove once and for"
	
	para "all that I'm more"
	line "than just a pretty"
	cont "face!"
	done
	
SunbeamGymLeilaniTextWin:
	text "Haha!"
	
	para "Looks like you"
	line "win."
	
	para "Take this."
	done
	
SunbeamGymLeilaniTextLoss:
	text "Hehe!"
	
	para "Told you I'm good!"
	done
	
SunbeamGymLeilaniTextAfterBattle:
	text "You really are"
	line "something!"
	
	para "When I met you, I"
	line "had no idea you"
	cont "would be so tough."
	
	para "I judged you based"
	line "on you looks just"
	cont "like others judge"
	cont "me."
	
	para "I see now that I"
	line "was wrong."
	
	para "As an apology, I"
	line "want you to have"
	cont "this."
	done
	
SunbeamGymLeilaniTextTMSpeech:
	text "That TM contains"
	line "SUNNY DAY."
	
	para "Using it, you can"
	line "summon intense"
	cont "rays of sunlight"
	cont "at any time."
	
	para "The harsh sunlight"
	line "powers up FIRE-"
	
	para "type moves, but"
	line "also can assist"
	cont "GRASS-types."
	
	para "It even works in"
	line "the middle of the"
	cont "night!"
	
	para "Go out and prove"
	line "your worth by"
	
	para "taking on the rest"
	line "of the GYMs."
	
	para "I'll stay here and"
	line "better myself as"
	cont "well as my skills"
	cont "in battle!"
	done
	
SunbeamGymLeilaniTextLoop:
	text "Go out and prove"
	line "your worth by"
	
	para "taking on the rest"
	line "of the GYMs."
	
	para "I'll stay here and"
	line "better myself as"
	cont "well as my skills"
	cont "in battle!"
	done
	
Text_ReceivedThirdBadge:
	text "<PLAYER> received"
	line "the PETALBADGE."
	done
	
Movement_SunbeamGymLeilani:
	turn_head_up
	step_sleep 24
	turn_head_left
	step_sleep 24
	turn_head_down
	step_sleep 24
	turn_head_right
	step_sleep 24
	step_end