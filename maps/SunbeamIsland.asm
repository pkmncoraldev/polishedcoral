SunbeamIsland_MapScriptHeader:
	db 6 ; scene scripts
	scene_script SunbeamIslandTrigger0
	scene_script SunbeamIslandTrigger1
	scene_script SunbeamIslandTrigger2
	scene_script SunbeamIslandTrigger3
	scene_script SunbeamIslandTrigger4
	scene_script SunbeamIslandTrigger5

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, SunbeamIslandFlyPoint
	callback MAPCALLBACK_TILES, SunbeamIslandCallback

	db 14 ; warp events
	warp_def 31, 27, 2, SUNBEAM_MART
	warp_def 35, 17, 1, SUNBEAM_POKECENTER
	warp_def 20, 34, 1, SUNBEAM_JUNGLE
	warp_def 11, 25, 1, SUNBEAM_TRADE_HOUSE
	warp_def 11, 31, 1, SUNBEAM_DODRIO_HOUSE
	warp_def 17, 16, 1, SPRUCES_LAB
	warp_def 27, 11, 1, SUNBEAM_OLD_COUPLES_HOUSE
	warp_def 27, 17, 1, SUNBEAM_SOFT_SAND_HOUSE
	warp_def 43, 17, 1, SUNBEAM_SURF_SHOP
	warp_def 13, 16, 3, SPRUCES_LAB
	warp_def 13, 17, 3, SPRUCES_LAB
	warp_def 20, 35, 2, SUNBEAM_JUNGLE
	warp_def 49,  9, 1, SUNBEAM_BOAT_HOUSE
	warp_def 44, 17, 1, SUNBEAM_SURF_SHOP

	db 6 ; coord events
	xy_trigger 2, 23, 32, 0, SunbeamSnareStopsYouD, 0, 0
	xy_trigger 3, 22, 32, 0, SunbeamSnareStopsYouU, 0, 0
	xy_trigger 6, 44, 20, 0, SunbeamFirstContest1, 0, 0
	xy_trigger 6, 45, 20, 0, SunbeamFirstContest2, 0, 0
	xy_trigger 6, 46, 20, 0, SunbeamFirstContest3, 0, 0
	xy_trigger 6, 47, 20, 0, SunbeamFirstContest4, 0, 0

	db 9 ; bg events
	signpost 31, 21, SIGNPOST_READ, SunBeamSign
	signpost 18, 18, SIGNPOST_READ, SunBeamLabSign
	signpost 21, 25, SIGNPOST_READ, SunBeamJungleSign
	signpost 44, 16, SIGNPOST_READ, SunBeamSurfSign
	signpost 43, 18, SIGNPOST_READ, SunBeamSurfboards
	signpost 43, 19, SIGNPOST_READ, SunBeamSurfboards
	signpost 35, 18, SIGNPOST_READ, SunBeamPokeSign
	signpost 31, 28, SIGNPOST_READ, SunBeamMartSign
	signpost 47, 12, SIGNPOST_READ, SunBeamBoatSign

	db 20 ; object events
	person_event SPRITE_MATRON, 24, 24, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC1, -1
	person_event SPRITE_FAT_GUY, 12, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC2, -1
	person_event SPRITE_CUTE_GIRL, 18,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC3, -1
	person_event SPRITE_GENERAL_VARIABLE_1, 17, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC4, -1
	person_event SPRITE_CUTE_GIRL, 45, 19, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC5, -1
	person_event SPRITE_SUPER_NERD, 47,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC6, -1
	object_event 19,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DONPHAN, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamReserveDonphan, -1
	person_event SPRITE_SLOWPOKETAIL, 16,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunbeamReserveSlowpoke, -1
	object_event 13, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MAGMAR, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SunbeamReserveMagmar, -1
	object_event 20, 13, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, ELECTABUZZ, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamReserveElectabuzz, -1
	person_event SPRITE_TRUNKS, 43, 29, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamCrowd, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_COOL_DUDE, 43, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamCrowd, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_BIKINI_3, 43, 28, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamCrowd, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_POKEFAN_M, 44, 29, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamCrowd, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_BATTLE_GIRL, 44, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamCrowd, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_SNARE, 22, 33, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SumbeamSnare, EVENT_SAVED_SUNBEAM
	object_event  7, 52, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_COMMAND, end, NULL, EVENT_SUNBEAM_BOAT_GONE
	object_event  7, 53, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_UP_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_COMMAND, end, NULL, EVENT_SUNBEAM_BOAT_GONE
	object_event  6, 53, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_COMMAND, end, NULL, EVENT_SUNBEAM_BOAT_GONE
	object_event  6, 52, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_COMMAND, end, NULL, EVENT_SUNBEAM_BOAT_GONE


	const_def 1 ; object constants
	const SUNBEAM_NPC1
	const SUNBEAM_NPC2
	const SUNBEAM_NPC3
	const SUNBEAM_NPC4;
	const SUNBEAM_NPC5
	const SUNBEAM_NPC6
	const SUNBEAM_DONPHAN
	const SUNBEAM_SLOWPOKE
	const SUNBEAM_MAGMAR
	const SUNBEAM_ELECTABUZZ
	const SUNBEAM_CROWD1
	const SUNBEAM_CROWD2
	const SUNBEAM_CROWD3
	const SUNBEAM_CROWD4
	const SUNBEAM_CROWD5
	const SUNBEAM_SNARE
	const SUNBEAM_SAILBOAT_T1
	const SUNBEAM_SAILBOAT_T2
	const SUNBEAM_SAILBOAT_B1
	const SUNBEAM_SAILBOAT_B2

SunbeamIslandTrigger0:
	priorityjump JustRodeBoatSunbeamStrand
	end

SunbeamIslandTrigger1:
	priorityjump JustRodeBoatSunbeamNormal
	end

SunbeamIslandTrigger2:
	end

SunbeamIslandTrigger3:
	end

SunbeamIslandTrigger4:
	end
	
SunbeamIslandTrigger5:
	priorityjump JustRodeBoatSunbeamStrand2
	end

SunbeamIslandFlyPoint:
	setflag ENGINE_FLYPOINT_SUNBEAM
	return

SunbeamIslandCallback:
	checkevent EVENT_ISLAND_STRAND
	iffalse .dontmoveboat
	moveperson SUNBEAM_SAILBOAT_T1, 13, 52
	moveperson SUNBEAM_SAILBOAT_T2, 13, 53
	moveperson SUNBEAM_SAILBOAT_B1, 12, 53
	moveperson SUNBEAM_SAILBOAT_B2, 12, 52
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, 13, 52
	appear SUNBEAM_NPC4
	jump .skipsunbeamboatman
.dontmoveboat
	checkevent EVENT_ISLAND_BOATMAN
	iftrue .skipsunbeamboatman
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, 7, 51
	appear SUNBEAM_NPC4
.skipsunbeamboatman
	checkevent EVENT_SUNBEAM_SNARE_STEPPED_DOWN
	iffalse .skipsnarestepdown
	moveperson SUNBEAM_SNARE, $21, $17
.skipsnarestepdown
	checkflag ENGINE_DAILY_BIKINI_CONTEST
	iftrue .donebikinicontest
	clearevent EVENT_SUNBEAM_CROWD_GONE
	return
.donebikinicontest
	setevent EVENT_SUNBEAM_CROWD_GONE
	return

JustRodeBoatSunbeamStrand:
	spriteface SUNBEAM_NPC4, UP
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext SunbeamJustRodeBoatText
	waitbutton
	closetext
	spriteface SUNBEAM_NPC4, DOWN
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SUNBEAM_NPC4
	disappear SUNBEAM_SAILBOAT_T1
	disappear SUNBEAM_SAILBOAT_T2
	disappear SUNBEAM_SAILBOAT_B1
	disappear SUNBEAM_SAILBOAT_B2
	moveperson SUNBEAM_NPC4, 15, 25
	appear SUNBEAM_NPC4
	waitsfx
	special Special_FadeInQuickly
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_ISLAND_BOATMAN
	setevent EVENT_SUNBEAM_BOAT_GONE
	clearevent EVENT_ISLAND_STRAND
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_GRANNY
	checkevent EVENT_SNARE_ASLEEP
	iftrue .sunbeamsnareasleep
	checkevent EVENT_FIRST_BIKINI_CONTEST
	iftrue .firstcontestdone
	dotrigger $6
	end
.firstcontestdone
	dotrigger $2
	end
.sunbeamsnareasleep
	dotrigger $4
	end

JustRodeBoatSunbeamNormal:
	spriteface SUNBEAM_NPC4, DOWN
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext SunbeamJustRodeBoatText2
	waitbutton
	closetext
	applymovement SUNBEAM_NPC4, Movement_SunbeamBoatmanLeave
	playsound SFX_EXIT_BUILDING
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, 15, 25
	appear SUNBEAM_NPC4
	waitsfx
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_ISLAND_BOATMAN
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_GRANNY
	checkevent EVENT_SNARE_ASLEEP
	iftrue .sunbeamsnareasleep
	checkevent EVENT_FIRST_BIKINI_CONTEST
	iftrue .firstcontestdone
	dotrigger $6
	end
.firstcontestdone
	dotrigger $2
	end
.sunbeamsnareasleep
	dotrigger $4
	end
	
JustRodeBoatSunbeamStrand2:
	spriteface SUNBEAM_NPC4, UP
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext SunbeamJustRodeBoatText
	waitbutton
	closetext
	spriteface SUNBEAM_NPC4, DOWN
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, 15, 25
	appear SUNBEAM_NPC4
	disappear SUNBEAM_SAILBOAT_T1
	disappear SUNBEAM_SAILBOAT_T2
	disappear SUNBEAM_SAILBOAT_B1
	disappear SUNBEAM_SAILBOAT_B2
	moveperson SUNBEAM_SAILBOAT_T1, 7, 52
	moveperson SUNBEAM_SAILBOAT_T2, 7, 53
	moveperson SUNBEAM_SAILBOAT_B1, 6, 53
	moveperson SUNBEAM_SAILBOAT_B2, 6, 52
	appear SUNBEAM_SAILBOAT_T1
	appear SUNBEAM_SAILBOAT_T2
	appear SUNBEAM_SAILBOAT_B1
	appear SUNBEAM_SAILBOAT_B2
	waitsfx
	special Special_FadeInQuickly
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_ISLAND_BOATMAN
	clearevent EVENT_ISLAND_STRAND
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_GRANNY
	checkevent EVENT_SNARE_ASLEEP
	iftrue .sunbeamsnareasleep
	checkevent EVENT_FIRST_BIKINI_CONTEST
	iftrue .firstcontestdone
	dotrigger $6
	end
.firstcontestdone
	dotrigger $2
	end
.sunbeamsnareasleep
	dotrigger $4
	end
	
SunbeamFirstContest1:
	disappear SUNBEAM_NPC4
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CHARLIE
	moveperson SUNBEAM_NPC4, $1c, $2c
	appear SUNBEAM_NPC4
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestCrowdText
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
	applymovement PLAYER, Movement_SunbeamFirstContest1_1
	jump SunbeamFirstContest
SunbeamFirstContest2:
	disappear SUNBEAM_NPC4
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CHARLIE
	moveperson SUNBEAM_NPC4, $1c, $2c
	appear SUNBEAM_NPC4
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestCrowdText
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
	applymovement PLAYER, Movement_SunbeamFirstContest1_2
	jump SunbeamFirstContest
SunbeamFirstContest3:
	disappear SUNBEAM_NPC4
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CHARLIE
	moveperson SUNBEAM_NPC4, $1c, $2c
	appear SUNBEAM_NPC4
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestCrowdText
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
	applymovement PLAYER, Movement_SunbeamFirstContest1_3
	jump SunbeamFirstContest
SunbeamFirstContest4:
	disappear SUNBEAM_NPC4
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CHARLIE
	moveperson SUNBEAM_NPC4, $1c, $2c
	appear SUNBEAM_NPC4
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamContestCrowdText
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
	applymovement PLAYER, Movement_SunbeamFirstContest1_4
SunbeamFirstContest:
	pause 7
	opentext
	writetext SunbeamContestText18
	waitbutton
	closetext
	pause 7
	special FadeOutPalettesBlack
	pause 20
	playmusic MUSIC_SUNBEAM_ISLAND
	disappear SUNBEAM_CROWD1
	disappear SUNBEAM_CROWD2
	disappear SUNBEAM_CROWD3
	disappear SUNBEAM_CROWD4
	disappear SUNBEAM_CROWD5
	callasm LoadMapPals
	special FadeInPalettes
	pause 7
	spriteface SUNBEAM_NPC4, LEFT
	opentext
	writetext SunbeamFirstContestCharlieText1
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	pause 7
	opentext
	writetext SunbeamFirstContestCharlieText2
	waitbutton
	closetext
	spriteface SUNBEAM_NPC4, DOWN
	pause 40
	spriteface SUNBEAM_NPC4, LEFT
	opentext
	writetext SunbeamFirstContestCharlieText3
	waitbutton
	closetext
	applymovement SUNBEAM_NPC4, Movement_SunbeamFirstContest2
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, 23, 17
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_GRANNY
	appear SUNBEAM_NPC4
	dotrigger $2
	setevent EVENT_FIRST_BIKINI_CONTEST
	setevent EVENT_SUNBEAM_CROWD_GONE
	setevent EVENT_MET_CHARLIE
;	setflag ENGINE_DAILY_BIKINI_CONTEST
	end

SunbeamSnareStopsYouD:
	special Special_StopRunning
	applyonemovement SUNBEAM_SNARE, run_step_down
	spriteface PLAYER, RIGHT
	spriteface SUNBEAM_SNARE, LEFT
	dotrigger $3
	opentext
	callasm SunbeamSnareStopsYouAsm1
	waitbutton
	closetext
	setevent EVENT_SUNBEAM_SNARE_STEPPED_DOWN
	moveperson SUNBEAM_SNARE, $21, $17
	end

SunbeamSnareStopsYouU:
	special Special_StopRunning
	applyonemovement SUNBEAM_SNARE, run_step_up
	spriteface PLAYER, RIGHT
	spriteface SUNBEAM_SNARE, LEFT
	dotrigger $2
	opentext
	callasm SunbeamSnareStopsYouAsm1
	waitbutton
	closetext
	clearevent EVENT_SUNBEAM_SNARE_STEPPED_DOWN
	moveperson SUNBEAM_SNARE, $21, $16
	end

SumbeamSnare:
	checkevent EVENT_SNARE_ASLEEP
	iftrue .asleep
	jumptext SunbeamSnareSleepyText
.asleep
	jumptext SunbeamSnareAsleepText

SunbeamPlayedFluteForSleepySnare::
	writetext SunbeamTextUseFlute
	playsound SFX_POKEFLUTE
	waitsfx
	closetext
	wait 10
	opentext
	writetext SunbeamSnareFallAsleepText
	waitbutton
	closetext
	setevent EVENT_SNARE_ASLEEP
	dotrigger $4
	end

SunbeamIslandBoat:
	jumptext SunbeamBoatText

SunBeamSign:
	jumptext SunBeamSignText

SunBeamBoatSign:
	jumptext SunBeamBoatSignText

SunbeamCrowd:
	faceplayer
	opentext
	writetext SunbeamCrowdText
	waitbutton
	closetext
	spriteface SUNBEAM_CROWD1, UP
	spriteface SUNBEAM_CROWD2, UP
	spriteface SUNBEAM_CROWD3, UP
	spriteface SUNBEAM_CROWD4, UP
	spriteface SUNBEAM_CROWD5, UP
	end

SunbeamIslandNPC1:
	checkevent EVENT_SAVED_SUNBEAM
	iftrue .sunbeamsaved
	checkevent EVENT_SNARE_ASLEEP
	iftrue .asleep
	jumptextfaceplayer SunbeamIslandNPC1Text1
.asleep
	jumptextfaceplayer SunbeamIslandNPC1Text2
.sunbeamsaved
	jumptextfaceplayer SunbeamIslandNPC1Text3

SunbeamIslandNPC2:
	jumptextfaceplayer SunbeamIslandNPC2Text

SunbeamIslandNPC3:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SLOWPOKE_GIRL
	iftrue .talked
	writetext SunbeamIslandNPC3Text1
	waitbutton
	spriteface SUNBEAM_NPC3, UP
	closetext
	setevent EVENT_TALKED_TO_SLOWPOKE_GIRL
	end
.talked
	writetext SunbeamIslandNPC3Text2
	waitbutton
	spriteface SUNBEAM_NPC3, UP
	closetext
	end

SunbeamIslandNPC4:
	jumptextfaceplayer SunbeamIslandNPC4Text

SunbeamIslandNPC5:
	jumptextfaceplayer SunbeamIslandNPC5Text

SunbeamIslandNPC6:
	faceplayer
	opentext
	writetext SunbeamIslandNPC6Text
	waitbutton
	spriteface SUNBEAM_NPC6, DOWN
	closetext
	end

SunBeamLabSign:
	jumptext SunBeamLabSignText

SunBeamJungleSign:
	jumptext SunBeamJungleSignText

SunBeamSurfSign:
	jumptext SunBeamSurfSignText

SunBeamSurfboards:
	jumptext SunBeamSurfboardsText

SunBeamPokeSign:
	jumpstd pokecentersign

SunBeamMartSign:
	jumpstd martsign

SunbeamCrowdText:
	text "The BIKINI CONTEST"
	line "is about to start!"
	
	para "I can't wait!"
	done

SunbeamBoatText:
	text "It's a rowboat."

	para "It's seen some use,"
	line "but it's still in"
	cont "good shape."
	done

SunBeamSignText:
	text "SUNBEAM ISLAND"

	para "A shining spot in"
	line "an endless sea."
	done

SunBeamBoatSignText:
	text "SUNBEAM ISLAND"
	line "BOAT HOUSE"

	para "Inquire inside"
	line "for a ride."
	done

SunBeamLabSignText:
	text "SPRUCE #MON LAB"
	done

SunBeamJungleSignText:
	text "SUNBEAM JUNGLE"
	done

SunbeamDontLeaveText1:
	text "Woah!"

	para "Hold up!"
	done

SunBeamSurfSignText:
	text "SUNBEAM SURF SHOP"

	para "Surf's up!"

	para "Judges wanted for"
	line "BEACH BATTLE"
	cont "BEAUTY CONTEST."

	para "Inquire inside for"
	line "details."	
	done

SunBeamSurfboardsText:
	text "Some surfboards"
	line "are leaning on the"
	cont "wall of the shop."
	done

SunbeamIslandNPC1Text1:
	text "That creepy guy"
	line "over there keeps"
	cont "dozing off."

	para "He looks like he"
	line "could use a warm"
	cont "blanket and a"
	cont "lullaby!"
	done

SunbeamIslandNPC1Text2:
	text "Look at him"
	line "snooze!"

	para "Seem's like that"
	line "flute did the"
	cont "trick!"
	done

SunbeamIslandNPC1Text3:
	text "That guy must've"
	line "been really tired"
	cont "to fall asleep"
	cont "standing up!"
	
	para "I wonder where he"
	line "went."
	done
	
SunbeamIslandNPC2Text:
	text "The bright sun-"
	line "shine around here"
	cont "makes a certain"
	cont "#MON evolve"
	cont "differently."
	done

SunbeamIslandNPC3Text1:
	text "That goofy looking"
	line "#MON keeps"
	cont "going 'Slowwwww…'"

	para "Hehe!"

	para "That's actually"
	line "kinda fun!"

	para "Slowwwww…"
	done

SunbeamIslandNPC3Text2:
	text "Slowwwww…"
	done

SunbeamIslandNPC4Text:
	text "I've lived on this"
	line "island for as long"
	cont "as I can remember."

	para "I know it might be"
	line "hard to believe,"

	para "but it used to be"
	line "very quiet around"
	cont "here."
	done

SunbeamIslandNPC5Text:
	text "I always walk"
	line "barefoot on the"
	cont "beach."

	para "I love the feeling"
	line "of sand between my"
	cont "toes."
	done

SunbeamIslandNPC6Text:
	text "Someday I'm going"
	line "to sail the seas"
	cont "with my #MON"
	cont "and find out what's"
	cont "out there…"
	done

SunbeamJustRodeBoatText:
	text "Here we are,"
	line "SUNBEAM ISLAND."

	para "Take care."
	done

SunbeamJustRodeBoatText2:
	text "Thanks for riding."

	para "Come again."
	done

SunbeamSnareFallAsleepText:
	text "Oh man…"

	para "That song is so"
	line "soothing…"

	para "I think I'll just"
	line "close my eyes for"
	cont "a sec…"

	para "…"

	para "…"

	para "He's fast asleep!"
	done

SunbeamSnareSleepyText:
	text "Yaaaaawn…"

	para "I'm so sleepy…"

	para "…"

	para "Huh!?"

	para "Move along kid."

	para "Nothing to see"
	line "here!"
	done

SunbeamSnareAsleepText:
	text "…"

	para "…"

	para "He's fast asleep!"
	done

SunbeamSnareText1:
	text "Nope."
	done

SunbeamSnareText2:
	text "Nah."
	done

SunbeamSnareText3:
	text "Don't think so."
	done

SunbeamSnareText4:
	text "Nuh uh."
	done

SunbeamSnareText5:
	text "Negative."
	done

SunbeamSnareText6:
	text "Wrong."
	done

SunbeamSnareText7:
	text "No way."
	done

SunbeamSnareText8:
	text "Denied."
	done

SunbeamTextUseFlute:
	text "<PLAYER> played the"
	line "# FLUTE."
	done
	
SunbeamFirstContestCharlieText1:
	text "Looks like you"
	line "just missed the"
	cont "show, huh?"
	done
	
SunbeamFirstContestCharlieText2:
	text "That's a shame…"
	
	para "It was a good one!"
	
	para "Filled with ups"
	line "and downs and"
	cont "dramatic battles!"
	
	para "Pretty good for a"
	line "bikini contest,"
	cont "huh?"
	
	para "…"
	
	para "Anyway, you aren't"
	line "from around here,"
	cont "are you?"
	
	para "That's ok, I'm not"
	line "either."
	
	para "I'm CHARLIE!"
	
	para "I run the GYM in"
	line "TWINKLE TOWN."
	done
	
SunbeamFirstContestCharlieText3:
	text "Compared to up"
	line "there,"
	
	para "this place is a"
	line "tropical paradise!"
	
	para "It's sometimes nice"
	line "to get a break"
	cont "from the cold and"
	cont "soak in some sun!"
	
	para "But I'm rambling,"
	line "aren't I?"
	
	para "Well, if you ever"
	line "find yourself in"
	cont "TWINKLE TOWN,"

	para "you should stop by"
	line "and challenge the"
	cont "GYM!"
	
	para "But I'll warn you,"
	line "I'm no slouch!"
	
	para "See you around,"
	line "TRAINER!"
	done

Movement_SunbeamBoatmanLeave:
	step_up
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamDontLeave1:
	step_down
	step_end

Movement_SunbeamDontLeave2:
	step_right
	step_end

Movement_SunbeamFirstContest1:
	step_right
	step_right
	step_end
	
Movement_SunbeamFirstContest1_1:
	step_right
	step_right
	step_down
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamFirstContest1_2:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamFirstContest1_3:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

Movement_SunbeamFirstContest1_4:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_end

Movement_SunbeamFirstContest2:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

SunbeamSnareStopsYouAsm1:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsm2_1
	jr SunbeamSnareStopsYouAsm2_2

SunbeamSnareStopsYouAsm2_1:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsm3_1
	jr SunbeamSnareStopsYouAsm3_2

SunbeamSnareStopsYouAsm2_2:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsm4_1
	jr SunbeamSnareStopsYouAsm4_2

SunbeamSnareStopsYouAsm3_1:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsmText1
	jr SunbeamSnareStopsYouAsmText2

SunbeamSnareStopsYouAsm3_2:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsmText3
	jr SunbeamSnareStopsYouAsmText4

SunbeamSnareStopsYouAsm4_1:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsmText5
	jr SunbeamSnareStopsYouAsmText6

SunbeamSnareStopsYouAsm4_2:
	call Random
	cp $7f ; 50 percent
	jr c, SunbeamSnareStopsYouAsmText7
	jr SunbeamSnareStopsYouAsmText8

SunbeamSnareStopsYouAsmText1:
	ld hl, SunbeamSnareText1
	call PrintText
	ret

SunbeamSnareStopsYouAsmText2:
	ld hl, SunbeamSnareText2
	call PrintText
	ret

SunbeamSnareStopsYouAsmText3:
	ld hl, SunbeamSnareText3
	call PrintText
	ret

SunbeamSnareStopsYouAsmText4:
	ld hl, SunbeamSnareText4
	call PrintText
	ret

SunbeamSnareStopsYouAsmText5:
	ld hl, SunbeamSnareText5
	call PrintText
	ret

SunbeamSnareStopsYouAsmText6:
	ld hl, SunbeamSnareText6
	call PrintText
	ret

SunbeamSnareStopsYouAsmText7:
	ld hl, SunbeamSnareText7
	call PrintText
	ret

SunbeamSnareStopsYouAsmText8:
	ld hl, SunbeamSnareText8
	call PrintText
	ret
