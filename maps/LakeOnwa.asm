LakeOnwa_MapScriptHeader:
	db 6 ; scene scripts
	scene_script LakeOnwaTrigger0
	scene_script LakeOnwaTrigger1
	scene_script LakeOnwaTrigger2
	scene_script LakeOnwaTrigger3
	scene_script LakeOnwaTrigger4
	scene_script LakeOnwaTrigger5

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
	warp_def  3, 55, 3, ROUTE_8_GATE

	db 59 ; coord events
	coord_event 20, 18, 0, LakeMakeSilverBrown
	coord_event 21, 18, 0, LakeMakeSilverBrown
	coord_event 22, 18, 0, LakeMakeSilverBrown
	coord_event 23, 18, 0, LakeMakeSilverBrown
	coord_event 24, 18, 0, LakeMakeSilverBrown
	coord_event 25, 18, 0, LakeMakeSilverBrown
	coord_event 26, 18, 0, LakeMakeSilverBrown
	coord_event 27, 18, 0, LakeMakeSilverBrown
	coord_event 28, 18, 0, LakeMakeSilverBrown
	coord_event 29, 18, 0, LakeMakeSilverBrown
	coord_event 32, 18, 0, LakeMakeSilverBrown
	coord_event 33, 18, 0, LakeMakeSilverBrown
	coord_event 34, 18, 0, LakeMakeSilverBrown
	coord_event 35, 18, 0, LakeMakeSilverBrown
	coord_event 36, 18, 0, LakeMakeSilverBrown
	coord_event 37, 18, 0, LakeMakeSilverBrown
	coord_event 38, 18, 0, LakeMakeSilverBrown
	coord_event 39, 18, 0, LakeMakeSilverBrown
	coord_event 40, 18, 0, LakeMakeSilverBrown
	coord_event 41, 18, 0, LakeMakeSilverBrown
	coord_event 42, 18, 0, LakeMakeSilverBrown
	coord_event 43, 18, 0, LakeMakeSilverBrown
	coord_event 44, 18, 0, LakeMakeSilverBrown
	coord_event 45, 18, 0, LakeMakeSilverBrown
	coord_event 48, 18, 0, LakeMakeSilverBrown
	coord_event 49, 18, 0, LakeMakeSilverBrown
	coord_event 50, 18, 0, LakeMakeSilverBrown
	coord_event 51, 18, 0, LakeMakeSilverBrown
	coord_event 20, 19, 5, LakeMakeSilverBlue
	coord_event 21, 19, 5, LakeMakeSilverBlue
	coord_event 22, 19, 5, LakeMakeSilverBlue
	coord_event 23, 19, 5, LakeMakeSilverBlue
	coord_event 24, 19, 5, LakeMakeSilverBlue
	coord_event 25, 19, 5, LakeMakeSilverBlue
	coord_event 26, 19, 5, LakeMakeSilverBlue
	coord_event 27, 19, 5, LakeMakeSilverBlue
	coord_event 28, 19, 5, LakeMakeSilverBlue
	coord_event 29, 19, 5, LakeMakeSilverBlue
	coord_event 32, 19, 5, LakeMakeSilverBlue
	coord_event 33, 19, 5, LakeMakeSilverBlue
	coord_event 34, 19, 5, LakeMakeSilverBlue
	coord_event 35, 19, 5, LakeMakeSilverBlue
	coord_event 36, 19, 5, LakeMakeSilverBlue
	coord_event 37, 19, 5, LakeMakeSilverBlue
	coord_event 38, 19, 5, LakeMakeSilverBlue
	coord_event 39, 19, 5, LakeMakeSilverBlue
	coord_event 40, 19, 5, LakeMakeSilverBlue
	coord_event 41, 19, 5, LakeMakeSilverBlue
	coord_event 42, 19, 5, LakeMakeSilverBlue
	coord_event 43, 19, 5, LakeMakeSilverBlue
	coord_event 44, 19, 5, LakeMakeSilverBlue
	coord_event 45, 19, 5, LakeMakeSilverBlue
	coord_event 48, 19, 5, LakeMakeSilverBlue
	coord_event 49, 19, 5, LakeMakeSilverBlue
	coord_event 50, 19, 5, LakeMakeSilverBlue
	coord_event 51, 19, 5, LakeMakeSilverBlue
	coord_event 19, 18, 5, LakeMakeSilverBlue
	coord_event 35,  8, 5, LakeRivalT
	coord_event 35,  9, 5, LakeRivalB

	db 6 ; bg events
	signpost 25, 59, SIGNPOST_READ, LakeSign
	signpost 29, 46, SIGNPOST_READ, LakeBoatHouseSignR
	signpost 23, 17, SIGNPOST_READ, LakeBoatHouseSignL
	signpost 23, 6, SIGNPOST_READ, LakeNameRaterSign
	signpost 17, 18, SIGNPOST_READ, LakeCenterSign
	signpost 8, 30, SIGNPOST_READ, MtOnwaSign

	db 17 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, 0, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 39, 31, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LakeBoat, -1
	object_event 40, 31, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LakeBoat, -1
	object_event 39, 32, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LakeBoat, -1
	object_event 40, 32, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_UP_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, LakeBoat, -1
	person_event SPRITE_COOL_DUDE, 32, 46, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LakeNpc1, -1
	person_event SPRITE_FISHER, 26, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LakeNpc2, -1
	person_event SPRITE_CUTE_GIRL, 12, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LakeNpc3, -1
	person_event SPRITE_GRANNY, 20, 8, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeNpc4, -1
	itemball_event 39, 16, MASTER_BALL, 1, EVENT_LAKE_ONWA_POKE_BALL1
	itemball_event 26, 6, HARD_STONE, 1, EVENT_LAKE_ONWA_POKE_BALL2
	person_event SPRITE_HIKER,  7, 61, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerLake, -1
	person_event SPRITE_WEIRD_TREE, 23, 56, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeSudowoodo, EVENT_FOUGHT_SUDOWOODO
	smashrock_event 23, 10
	smashrock_event 26,  9
	smashrock_event 27,  8
	person_event SPRITE_COLBY,  7, 37, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LakeBoat, EVENT_BEAT_LAKE_RIVAL


	const_def 1 ; object constants
	const LAKEBOATMANOUTSIDE
	const LAKEBOATT1
	const LAKEBOATT2
	const LAKEBOATB1
	const LAKEBOATB2
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
	const LAKERIVAL

LakeOnwaTrigger0:
	end

LakeOnwaTrigger1:
	priorityjump JustRodeBoatR
	end

LakeOnwaTrigger2:
	priorityjump JustRodeBoatL
	end
	
LakeOnwaTrigger3:
	priorityjump JustRodeBoatLakeStrandR
	end
	
LakeOnwaTrigger4:
	priorityjump JustRodeBoatLakeStrandL
	end
	
LakeOnwaTrigger5:
	end

LakeOnwaFlypointCallback:
	setflag ENGINE_FLYPOINT_LAKE_ONWA
	return
	
LakeOnwaCallback:
	checkevent EVENT_LAKE_BOAT_LEFT
	iffalse .boatnotleft
	moveperson LAKEBOATT1, 23, 25
	moveperson LAKEBOATT2, 24, 25
	moveperson LAKEBOATB1, 23, 26
	moveperson LAKEBOATB2, 24, 26
.boatnotleft
	checkscene
	ifequal $1, .right
	ifequal $3, .right
	ifequal $2, .left
	ifequal $4, .left
	checkevent EVENT_LAKE_ROCKS_BROWN
	iftrue .scene5
	dotrigger $0
	return
.scene5
	dotrigger $5
	return
.right
	disappear LAKEBOATMANOUTSIDE
	moveperson LAKEBOATMANOUTSIDE, 40, 31
	appear LAKEBOATMANOUTSIDE
	return
.left
	disappear LAKEBOATMANOUTSIDE
	moveperson LAKEBOATMANOUTSIDE, 23, 25
	appear LAKEBOATMANOUTSIDE
	return	
	
LakeMakeSilverBrown:
	setevent EVENT_LAKE_ROCKS_BROWN
;	loadvar wTimeOfDayPalFlags, $40 | 1
	special Special_UpdatePalsInstant
	dotrigger $5
	end
	
LakeMakeSilverBlue:
	clearevent EVENT_LAKE_ROCKS_BROWN
;	loadvar wTimeOfDayPalFlags, $40 | 0
	special Special_UpdatePalsInstant
	dotrigger $0
	end

JustRodeBoatR:
	spriteface LAKEBOATMANOUTSIDE, LEFT
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext JustRodeBoatText
	waitbutton
	closetext
	applymovement LAKEBOATMANOUTSIDE, Movement_JustRodeBoatR
	playsound SFX_EXIT_BUILDING
	disappear LAKEBOATMANOUTSIDE
	waitsfx
	special Special_StartLandmarkTimer
	waitsfx
	dotrigger $0
	end

JustRodeBoatL:
	spriteface LAKEBOATMANOUTSIDE, RIGHT
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext JustRodeBoatText
	waitbutton
	closetext
	applymovement LAKEBOATMANOUTSIDE, Movement_JustRodeBoatL
	playsound SFX_EXIT_BUILDING
	disappear LAKEBOATMANOUTSIDE
	waitsfx
	special Special_StartLandmarkTimer
	waitsfx
	dotrigger $0
	end
	
JustRodeBoatLakeStrandR:
	spriteface LAKEBOATMANOUTSIDE, LEFT
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext JustRodeBoatText
	waitbutton
	closetext
	spriteface LAKEBOATMANOUTSIDE, DOWN
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear LAKEBOATMANOUTSIDE
	disappear LAKEBOATT1
	disappear LAKEBOATT2
	disappear LAKEBOATB1
	disappear LAKEBOATB2
	moveperson LAKEBOATT1, 23, 25
	moveperson LAKEBOATT2, 24, 25
	moveperson LAKEBOATB1, 23, 26
	moveperson LAKEBOATB2, 24, 26
	appear LAKEBOATT1
	appear LAKEBOATT2
	appear LAKEBOATB1
	appear LAKEBOATB2
	setevent EVENT_LAKE_BOAT_LEFT
	waitsfx
	special Special_FadeInQuickly
	special Special_StartLandmarkTimer
	waitsfx
	dotrigger $0
	end
	
JustRodeBoatLakeStrandL:
	spriteface LAKEBOATMANOUTSIDE, RIGHT
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext JustRodeBoatText
	waitbutton
	closetext
	spriteface LAKEBOATMANOUTSIDE, DOWN
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear LAKEBOATMANOUTSIDE
	disappear LAKEBOATT1
	disappear LAKEBOATT2
	disappear LAKEBOATB1
	disappear LAKEBOATB2
	moveperson LAKEBOATT1, 39, 31
	moveperson LAKEBOATT2, 40, 31
	moveperson LAKEBOATB1, 39, 32
	moveperson LAKEBOATB2, 40, 32
	appear LAKEBOATT1
	appear LAKEBOATT2
	appear LAKEBOATB1
	appear LAKEBOATB2
	clearevent EVENT_LAKE_BOAT_LEFT
	waitsfx
	special Special_FadeInQuickly
	special Special_StartLandmarkTimer
	waitsfx
	dotrigger $0
	end

LakeRivalT:
	checkevent EVENT_BEAT_LAKE_RIVAL
	iftrue .end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LAKERIVAL, 15
	spriteface LAKERIVAL, DOWN
	pause 7
	playmusic MUSIC_RIVAL_ENCOUNTER
	pause 10
	applymovement LAKERIVAL, Movement_Lake_Rival_1
	opentext
	writetext LakeRivalText1
	waitbutton
	closetext
	waitsfx
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .totodile
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .cyndaquil
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .chikorita
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .charmander
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .bulbasaur
.totodile
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.chikorita
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.cyndaquil
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.squirtle
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.bulbasaur
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle

.charmander
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext LakeRivalText2
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	spriteface PLAYER, UP
	applymovement LAKERIVAL, Movement_LakeRivalWalkAway
	disappear LAKERIVAL
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ROUTE_4
	setevent EVENT_BEAT_LAKE_RIVAL
.end
	end
	
LakeRivalB:
	checkevent EVENT_BEAT_LAKE_RIVAL
	iftrue .end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LAKERIVAL, 15
	spriteface LAKERIVAL, DOWN
	pause 7
	playmusic MUSIC_RIVAL_ENCOUNTER
	pause 10
	applymovement LAKERIVAL, Movement_Lake_Rival_2
	opentext
	writetext LakeRivalText1
	waitbutton
	closetext
	waitsfx
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .totodile
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .cyndaquil
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .chikorita
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .charmander
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .bulbasaur
.totodile
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.chikorita
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.cyndaquil
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.squirtle
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.bulbasaur
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle

.charmander
	winlosstext LakeRivalWinText, LakeRivalLoseText
	setlasttalked LAKERIVAL
	loadtrainer RIVAL, RIVAL3_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext LakeRivalText2
	waitbutton
	closetext
	applyonemovement PLAYER, step_up
	spriteface PLAYER, DOWN
	applymovement LAKERIVAL, Movement_LakeRivalWalkAway
	disappear LAKERIVAL
	special Special_FadeOutMusic
	pause 15
	playmusic MUSIC_ROUTE_4
	setevent EVENT_BEAT_LAKE_RIVAL
.end
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
	iffalse LakeNoFlute
	opentext
	writetext LakeSudowoodoTextHaveFlute
	yesorno
	iffalse LakeDontUseFlute
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
	loadwildmon SUDOWOODO, 25
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	if_equal $2, DidntBeatLakeSudowoodo
	disappear LAKESUDOWOODO
	reloadmapafterbattle
	opentext
	writetext LakeSudowoodoTextSudowoodoGone
	waitbutton
	closetext
	setevent EVENT_FOUGHT_SUDOWOODO
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end

LakeDontUseFlute:
	writetext LakeSudowoodoTextDontUseFlute
	waitbutton
	closetext
	end

LakeNoFlute:
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
	
	para "NORTH:"
	line "ROUTE 8"
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
	text "It's a sailboat."
	
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
	cont "travel across the"
	cont "water, you'll have"
	cont "to take a boat."
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
	
	para "Snoring?"
	
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

LakeRivalText1:
	text "<PLAYER>?"
	
	para "What are you doing"
	line "here?"
	
	para "You're kidding me…"
	
	para "You're actually"
	line "still training"
	cont "your pathetic"
	cont "#MON?"
	
	para "Give it a rest!"
	
	para "A whimp like you"
	line "will never get"
	cont "ahead!"
	
	para "Last time was a"
	line "fluke, you know!"
	
	para "I'll prove how much"
	line "better I am than"
	cont "you!"	
	done
	
LakeRivalText2:
	text "What is going on!?"
	
	para "This has to be a"
	line "joke!"
	
	para "I KNOW I'm stronger"
	line "than you!"
	
	para "…"
	
	para "It's…"

	para "It's these stupid"
	line "#MON!"
	
	para "It has to be!"
	
	para "They aren't trying"
	line "hard enough!"
	
	para "Well that's gonna"
	line "change."
	
	para "This wont happen"
	line "next time,"
	cont "<PLAYER>!"
	
	para "Now, step aside!"
	done
	
LakeRivalWinText:
	text "Not again!"
	done
	
LakeRivalLoseText:
	text "Hmph!"
	
	para "Too easy."
	done
	
Movement_JustRodeBoatR:
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

Movement_JustRodeBoatL:
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end

SudowoodoShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step_up
	fast_jump_step_up
	step_end
	
Movement_Lake_Rival_1:
	step_down
	step_left
	step_end
	
Movement_Lake_Rival_2:
	step_down
	step_down
	step_left
	step_end
	
Movement_LakeRivalWalkAway:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_down
	step_left
	step_end
