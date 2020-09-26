SunbeamIsland_MapScriptHeader:
	db 5 ; scene scripts
	scene_script SunbeamIslandTrigger0
	scene_script SunbeamIslandTrigger1
	scene_script SunbeamIslandTrigger2
	scene_script SunbeamIslandTrigger3
	scene_script SunbeamIslandTrigger4

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, SunbeamIslandFlyPoint
	callback MAPCALLBACK_TILES, SunbeamIslandCallback

	db 14 ; warp events
	warp_def 29, 27, 2, SUNBEAM_MART
	warp_def 33, 17, 1, SUNBEAM_POKECENTER
	warp_def 18, 34, 1, SUNBEAM_JUNGLE
	warp_def  9, 25, 1, SUNBEAM_TRADE_HOUSE
	warp_def  9, 31, 1, SUNBEAM_DODRIO_HOUSE
	warp_def 15, 16, 1, SPRUCES_LAB
	warp_def 25, 11, 1, SUNBEAM_OLD_COUPLES_HOUSE
	warp_def 25, 17, 1, SUNBEAM_SOFT_SAND_HOUSE
	warp_def 41, 17, 1, SUNBEAM_SURF_SHOP
	warp_def 11, 16, 3, SPRUCES_LAB
	warp_def 11, 17, 3, SPRUCES_LAB
	warp_def 18, 35, 2, SUNBEAM_JUNGLE
	warp_def 47,  7, 1, SUNBEAM_BOAT_HOUSE
	warp_def 42, 17, 1, SUNBEAM_SURF_SHOP

	db 2 ; coord events
	xy_trigger 2, 21, 32, 0, SunbeamSnareStopsYouD, 0, 0
	xy_trigger 3, 20, 32, 0, SunbeamSnareStopsYouU, 0, 0

	db 9 ; bg events
	signpost 29, 21, SIGNPOST_READ, SunBeamSign
	signpost 16, 18, SIGNPOST_READ, SunBeamLabSign
	signpost 19, 25, SIGNPOST_READ, SunBeamJungleSign
	signpost 42, 16, SIGNPOST_READ, SunBeamSurfSign
	signpost 41, 18, SIGNPOST_READ, SunBeamSurfboards
	signpost 41, 19, SIGNPOST_READ, SunBeamSurfboards
	signpost 33, 18, SIGNPOST_READ, SunBeamPokeSign
	signpost 29, 28, SIGNPOST_READ, SunBeamMartSign
	signpost 45, 12, SIGNPOST_READ, SunBeamBoatSign

	db 18 ; object events
	person_event SPRITE_MATRON, 22, 24, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC1, -1
	person_event SPRITE_FAT_GUY, 10, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC2, -1
	person_event SPRITE_CUTE_GIRL, 16,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC3, -1
	person_event SPRITE_GRANNY, 15, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC4, -1
	person_event SPRITE_CUTE_GIRL, 43, 19, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC5, -1
	person_event SPRITE_SUPER_NERD, 45,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC6, -1
	person_event SPRITE_GENERAL_VARIABLE_1, 48,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ISLAND_STRAND
	person_event SPRITE_ROWBOAT, 49,  8, SPRITEMOVEDATA_BOAT_BOB, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandBoat, -1
	person_event SPRITE_DONPHAN,  6, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamReserveDonphan, -1
	person_event SPRITE_SLOWPOKETAIL, 14,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamReserveSlowpoke, -1
	person_event SPRITE_MAGMAR, 13, 13, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamReserveMagmar, -1
	person_event SPRITE_ELECTABUZZ, 11, 20, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamReserveElectabuzz, -1
	person_event SPRITE_TRUNKS, 41, 29, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_COOL_DUDE, 41, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_BIKINI_3, 41, 28, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_POKEFAN_M, 42, 29, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_BATTLE_GIRL, 42, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNBEAM_CROWD_GONE
	person_event SPRITE_SNARE, 20, 33, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SumbeamSnare, EVENT_SAVED_SUNBEAM


	const_def 1 ; object constants
	const SUNBEAM_NPC1
	const SUNBEAM_NPC2
	const SUNBEAM_NPC3
	const SUNBEAM_NPC4
	const SUNBEAM_NPC5
	const SUNBEAM_NPC6
	const SUNBEAM_BOAT_MAN
	const SUNBEAM_ROWBOAT
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

SunbeamIslandFlyPoint:
	setflag ENGINE_FLYPOINT_SUNBEAM
	return

SunbeamIslandCallback:
	checkevent EVENT_SUNBEAM_SNARE_STEPPED_DOWN
	iffalse .skipsnarestepdown
	moveperson SUNBEAM_SNARE, $21, $15
.skipsnarestepdown
	checkflag ENGINE_DAILY_BIKINI_CONTEST
	iftrue .donebikinicontest
	clearevent EVENT_SUNBEAM_CROWD_GONE
	return
.donebikinicontest
	setevent EVENT_SUNBEAM_CROWD_GONE
	return

JustRodeBoatSunbeamStrand:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	applymovement PLAYER, Movement_SunbeamPlayerStepOffBoat
	spriteface PLAYER, LEFT
	opentext
	writetext SunbeamJustRodeBoatText
	waitbutton
	closetext
	spriteface SUNBEAM_BOAT_MAN, DOWN
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SUNBEAM_BOAT_MAN
	waitsfx
	special Special_FadeInQuickly
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_ISLAND_STRAND
	checkevent EVENT_SNARE_ASLEEP
	iftrue .sunbeamsnareasleep
	dotrigger $2
	end
.sunbeamsnareasleep
	dotrigger $4
	end

JustRodeBoatSunbeamNormal:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	applymovement PLAYER, Movement_SunbeamPlayerStepOffBoat
	spriteface PLAYER, LEFT
	opentext
	writetext SunbeamJustRodeBoatText2
	waitbutton
	closetext
	applymovement SUNBEAM_BOAT_MAN, Movement_SunbeamPlayerStepOffBoat
	playsound SFX_EXIT_BUILDING
	disappear SUNBEAM_BOAT_MAN
	waitsfx
	setevent EVENT_ISLAND_STRAND
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	checkevent EVENT_SNARE_ASLEEP
	iftrue .sunbeamsnareasleep
	dotrigger $2
	end
.sunbeamsnareasleep
	dotrigger $4
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
	moveperson SUNBEAM_SNARE, $21, $15
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
	moveperson SUNBEAM_SNARE, $21, $14
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
	setflag ENGINE_THIRDBADGE
	clearevent EVENT_SPRUCELAB_SPRUCE1_GONE
	setevent EVENT_SPRUCELAB_SPRUCE3_GONE
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

	para "He's sleeping"
	line "soundly!"
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

	para "He's sleeping"
	line "soundly!"
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
	text "Uh uh."
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

Movement_SunbeamPlayerStepOffBoat:
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
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamFirstContest1_2:
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamFirstContest1_3:
	step_right
	step_down
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamFirstContest1_4:
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

Movement_SunbeamFirstContest2:
	turn_head_left
	step_sleep 20
	step_left
	step_end

Movement_SunbeamFirstContest3:
	turn_head_left
	step_sleep 24
	turn_head_up
	step_sleep 24
	turn_head_right
	step_sleep 24
	turn_head_down
	step_sleep 24
	step_end

Movement_SunbeamFirstContest4:
	step_right
	step_down
	step_down
	step_left
	step_end

Movement_SunbeamFirstContest5:
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_up
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
