LakeOnwa_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LakeOnwaTrigger0
	scene_script LakeOnwaTrigger1
	scene_script LakeOnwaTrigger2

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, LakeOnwaFlypointCallback
	callback MAPCALLBACK_TILES, LakeOnwaCallback

	db 7 ; warp events
	warp_def 29, 43, 1, LAKE_ONWA_BOAT_HOUSE_RIGHT
	warp_def 23, 19, 1, LAKE_ONWA_BOAT_HOUSE_LEFT
	warp_def  5, 36, 1, MT_ONWA_1F
	warp_def 22,  5, 1, LAKE_ONWA_NAME_RATER_HOUSE
	warp_def 16, 11, 1, LAKE_ONWA_ITEM_HOUSE
	warp_def 17, 17, 1, LAKE_ONWA_POKECENTER
	warp_def  1, 55, 3, ROUTE_8_GATE

	db 0 ; coord events

	db 6 ; bg events
	signpost 25, 57, SIGNPOST_READ, LakeSign
	signpost 29, 46, SIGNPOST_READ, LakeBoatHouseSignR
	signpost 23, 17, SIGNPOST_READ, LakeBoatHouseSignL
	signpost 23, 6, SIGNPOST_READ, LakeNameRaterSign
	signpost 17, 18, SIGNPOST_READ, LakeCenterSign
	signpost 8, 30, SIGNPOST_READ, MtOnwaSign

	db 16 ; object events
	person_event SPRITE_FAT_GUY, 30, 39, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOAT_BOYS_BEGONE
	person_event SPRITE_FAT_GUY, 24, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BOAT_BOYS_BEGONE
	person_event SPRITE_ROWBOAT, 32, 40, SPRITEMOVEDATA_BOAT_BOB, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LakeBoat, EVENT_LAKE_BOAT_RIGHT_GONE
	person_event SPRITE_ROWBOAT, 26, 24, SPRITEMOVEDATA_BOAT_BOB, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LakeBoat, EVENT_LAKE_BOAT_LEFT_GONE
	person_event SPRITE_COOL_DUDE, 32, 46, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LakeNpc1, -1
	person_event SPRITE_FISHER, 26, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LakeNpc2, -1
	person_event SPRITE_CUTE_GIRL, 12, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LakeNpc3, -1
	person_event SPRITE_GRANNY, 20, 8, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeNpc4, -1
	itemball_event 39, 16, POKE_BALL, 1, EVENT_LAKE_ONWA_POKE_BALL
	tmhmball_event  26, 6, TM_ICE_PUNCH, 1, EVENT_LAKE_ONWA_POKE_BALL2
	person_event SPRITE_HIKER,  7, 61, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerLake, -1
	person_event SPRITE_WEIRD_TREE, 22, 55, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeSudowoodo, EVENT_FOUGHT_SUDOWOODO
	smashrock_event 22, 10
	smashrock_event 20, 13
	smashrock_event 26,  9
	smashrock_event 27,  8


	const_def 1 ; object constants
	const LAKEBOATMANOUTSIDER
	const LAKEBOATMANOUTSIDEL
	const LAKEBOAT1
	const LAKEBOAT2
	const LAKENPC1
	const LAKENPC2
	const LAKENPC3
	const LAKENPC4
	const LAKEPOKEBALL
	const LAKEPOKEBALL2
	const LAKETRAINER
	const LAKESUDOWOODO
	const LAKEROCK1
	const LAKEROCK2
	const LAKEROCK3
	const LAKEROCK4

LakeOnwaTrigger0:
	end

LakeOnwaTrigger1:
	priorityjump JustRodeBoatR
	end

LakeOnwaTrigger2:
	priorityjump JustRodeBoatL
	end

LakeOnwaFlypointCallback:
	setflag ENGINE_FLYPOINT_LAKE_ONWA
	return
	
LakeOnwaCallback:
	checkevent EVENT_BOAT_BOYS_BEGONE
	iftrue .skip
	changeblock $26, $20, $b1
	changeblock $18, $1a, $b1
.skip
	return

JustRodeBoatR:
	applymovement PLAYER, Movement_PlayerStepOffBoat
	opentext
	writetext JustRodeBoatText
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement LAKEBOATMANOUTSIDER, Movement_JustRodeBoatR
	playsound SFX_EXIT_BUILDING
	disappear LAKEBOATMANOUTSIDER
	disappear LAKEBOATMANOUTSIDEL
	waitsfx
	setevent EVENT_BOAT_BOYS_BEGONE
	changeblock $26, $20, $43
	changeblock $18, $1a, $43
	dotrigger $0
	end

JustRodeBoatL:
	applymovement PLAYER, Movement_PlayerStepOffBoat
	opentext
	writetext JustRodeBoatText
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applymovement LAKEBOATMANOUTSIDEL, Movement_JustRodeBoatL
	playsound SFX_EXIT_BUILDING
	disappear LAKEBOATMANOUTSIDER
	disappear LAKEBOATMANOUTSIDEL
	waitsfx
	setevent EVENT_BOAT_BOYS_BEGONE
	changeblock $26, $20, $43
	changeblock $18, $1a, $43
	dotrigger $0
	end

MtOnwaSign:
	jumptext MtOnwaSignText

LakeNpc1:
	jumptextfaceplayer LakeNpc1Text

LakeNpc2:
	jumptextfaceplayer LakeNpc2Text

LakeNpc3:
	jumptextfaceplayer LakeNpc3Text

LakeNpc4:
	faceplayer
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED
	iftrue .alreadyhaveseed
	writetext LakeNpc4Text1
	buttonsound
	verbosegiveitem MIRACLE_SEED
	iffalse .NoRoom
	setevent EVENT_GOT_MIRACLE_SEED
.alreadyhaveseed:
	writetext LakeNpc4Text2
	waitbutton
	closetext
	end
.NoRoom:
	writetext LakeNpc4Text3
	waitbutton
	closetext
	end

LakeSign:
	jumptext LakeSignText

LakeBoatHouseSignR:
	jumptext LakeBoatHouseSignRText

LakeBoatHouseSignL:
	jumptext LakeBoatHouseSignLText

LakeNameRaterSign:
	jumptext LakeNameRaterSignText

LakeCenterSign:
	jumpstd pokecentersign

LakeBoat:
	jumptext LakeBoatText

TrainerLake:
	generictrainer HIKER, DARRYL, EVENT_BEAT_LAKE_TRAINER, .SeenText, .BeatenText

	text "Guess it needs"
	line "more training…"
	done

.SeenText:
	text "I found a weird"
	line "tree earlier."
	
	para "Turns out it was"
	line "a #MON!"
	done

.BeatenText:
	text "My new #MON!"
	done

LakeSudowoodo:
	checkitem POKE_FLUTE
	iffalse noflutelake
	opentext
	writetext LakeSudowoodoTextHaveFlute
	yesorno
	iffalse dontuseflutelake
LakePlayedFluteForSudowoodo::
	writetext LakeSudowoodoTextUseFlute
	playsound SFX_POKEFLUTE
	waitsfx
	playsound SFX_SANDSTORM
	applymovement LAKESUDOWOODO, SudowoodoShakeMovement
	writetext LakeSudowoodoTextWakeUp
	cry SUDOWOODO
	waitbutton
	closetext
	waitsfx
	loadwildmon SUDOWOODO, 30
	startbattle
	if_equal $2, DidntBeatLakeSudowoodo
	disappear LAKESUDOWOODO
	reloadmapafterbattle
	opentext
	writetext LakeSudowoodoTextSudowoodoGone
	waitbutton
	closetext
	setevent EVENT_FOUGHT_SUDOWOODO
	end

dontuseflutelake:
	writetext LakeSudowoodoTextDontUseFlute
	waitbutton
	closetext
	end

noflutelake:
	opentext
	writetext LakeSudowoodoTextNoFlute
	waitbutton
	closetext
	end

DidntBeatLakeSudowoodo:
	reloadmapafterbattle
	applymovement LAKESUDOWOODO, WeirdTreeMovement_Flee
	disappear LAKESUDOWOODO
	end

TrainerLakeSeenText:
	text "I found a weird"
	line "tree earlier."
	
	para "Turns out it was"
	line "a #MON!"
	done

TrainerLakeBeatenText:
	text "My new #MON!"
	done

TrainerLakeNormalText:
	text "Guess it needs"
	line "more training…"
	done

MtOnwaSignText:
	text "MT. ONWA ahead."
	done

LakeSnareWalkText:
	text "Roger."
	
	para "Heading to the"
	line "island now."
	done

LakeSignText:
	text "LAKE ONWA"
	
	para "WEST:"
	line "MT. ONWA"
	
	para "EAST:"
	line "ROUTE 7"
	done

LakeBoatHouseSignRText:
	text "LAKE ONWA BOAT"
	line "HOUSE 1"
	
	para "Inquire inside"
	line "for a ride."
	done

LakeBoatHouseSignLText:
	text "LAKE ONWA BOAT"
	line "HOUSE 2"
	
	para "Inquire inside"
	line "for a ride."
	done

LakeNameRaterSignText:
	text "NAME RATER"

	para "Get your #MON"
	line "nicknames rated."
	done

LakeBoatText:
	text "It's a rowboat."
	
	para "It's seen some use,"
	line "but it's still in"
	cont "good shape."
	done

JustRodeBoatText:
	text "Thanks for riding."
	
	para "Come again."
	done

LakeNpc1Text:
	text "Unless you have a"
	line "#MON that can"
	cont "travel across"
	cont "water,"
	
	para "you'll have to take"
	line "a boat."
	
	para "It's not even free!"
	
	para "What a rip off…"
	done

LakeNpc2Text:
	text "I love this quiet"
	line "little town."
	
	para "Can it even be"
	line "considered a town?"
	
	para "We don't even have"
	line "a GYM or #MART."
	done

LakeNpc3Text:
	text "Alright."
	
	para "I've heard this"
	line "mountain is pretty"
	cont "dangerous."
	
	para "I've got my POTIONS"
	line "and # BALLS."
	
	para "I think I'm good"
	line "to go."
	done

LakeNpc4Text1:
	text "Aren't these"
	line "flowers just"
	cont "beautiful?"
	
	para "I take care of"
	line "them every day."
	
	para "It's hard work"
	line "for someone as old"
	cont "as I am,"
	
	para "but it's worth"
	line "every minute."
	
	para "Here."
	
	para "Why don't you take"
	line "this?"
	done

LakeNpc4Text2:
	text "If you give that"
	line "seed to a #MON,"
	
	para "the power of it's"
	line "GRASS-type moves"
	cont "will grow as beau-"
	cont "tifully as my"
	cont "flowers."
	done

LakeNpc4Text3:
	text "You don't seem to"
	line "have enough space"
	cont "to carry this."
	
	para "Come back after"
	line "you've made some"
	cont "room."
	done

LakeSudowoodoTextHaveFlute:
	text "A weird tree"
	line "blocks the path."
	
	para "Is it…"
	
	para "Sleeping?"
	
	para "Play the"
	line "# FLUTE?"
	done

LakeSudowoodoTextNoFlute:
	text "A weird tree"
	line "blocks the path."
	
	para "Is it…"
	
	para "Sleeping?"
	done

LakeSudowoodoTextWakeUp:
	text "The tree woke up!?"
	
	para "It attacked in a"
	line "grumpy rage!"
	done

LakeSudowoodoTextDontUseFlute:
	text "Better not wake it"
	line "now…"
	done

LakeSudowoodoTextUseFlute:
	text "<PLAYER> played the"
	line "# FLUTE."
	done

LakeSudowoodoTextSudowoodoGone:
	text "SUDOWOODO is no"
	line "longer blocking"
	cont "the path!"
	done

Movement_PlayerStepOffBoat:
	step_up
	step_end

Movement_JustRodeBoatR:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_JustRodeBoatL:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end

SudowoodoShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step_up
	fast_jump_step_up
	step_end