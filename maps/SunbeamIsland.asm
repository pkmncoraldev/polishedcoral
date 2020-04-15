SunbeamIsland_MapScriptHeader:
	db 3 ; scene scripts
	scene_script SunbeamIslandTrigger0
	scene_script SunbeamIslandTrigger1
	scene_script SunbeamIslandTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, SunbeamIslandFlyPoint

	db 14 ; warp events
	warp_def 29, 27, 2, SUNBEAM_MART
	warp_def 33, 17, 1, SUNBEAM_POKECENTER
	warp_def 16, 40, 1, SUNBEAM_GYM
	warp_def  9, 25, 1, SUNBEAM_TRADE_HOUSE
	warp_def  9, 31, 1, SUNBEAM_DODRIO_HOUSE
	warp_def 15, 16, 1, SPRUCES_LAB
	warp_def 25, 11, 1, SUNBEAM_OLD_COUPLES_HOUSE
	warp_def 25, 17, 1, SUNBEAM_BLUE_WATER_HOUSE
	warp_def 39, 17, 1, SUNBEAM_SURF_SHOP
	warp_def -1, -1, 3, SPRUCES_LAB
	warp_def -1, -1, 3, SPRUCES_LAB
	warp_def 16, 41, 2, SUNBEAM_GYM
	warp_def 47,  7, 1, SUNBEAM_BOAT_HOUSE
	warp_def 40, 17, 1, SUNBEAM_SURF_SHOP

	db 0 ; coord events

	db 9 ; bg events
	signpost 29, 21, SIGNPOST_READ, SunBeamSign
	signpost 16, 18, SIGNPOST_READ, SunBeamLabSign
	signpost 19, 29, SIGNPOST_READ, SunBeamGymSign
	signpost 40, 16, SIGNPOST_READ, SunBeamSurfSign
	signpost 39, 18, SIGNPOST_READ, SunBeamSurfboards
	signpost 39, 19, SIGNPOST_READ, SunBeamSurfboards
	signpost 33, 18, SIGNPOST_READ, SunBeamPokeSign
	signpost 29, 28, SIGNPOST_READ, SunBeamMartSign
	signpost 45, 12, SIGNPOST_READ, SunBeamBoatSign

	db 14 ; object events
	person_event SPRITE_MATRON, 20, 24, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC1, -1
	person_event SPRITE_POKEFAN_M, 10, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC2, -1
	person_event SPRITE_CUTE_GIRL, 16,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC3, -1
	person_event SPRITE_GRANNY, 26, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC4, -1
	person_event SPRITE_CUTE_GIRL, 42, 14, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC5, -1
	person_event SPRITE_SUPER_NERD, 43,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC6, -1
	person_event SPRITE_GENERAL_VARIABLE_1, 48,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ISLAND_STRAND
	person_event SPRITE_COOL_DUDE, 41, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BATTLE_GIRL, 42, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ROWBOAT, 49,  8, SPRITEMOVEDATA_BOAT_BOB, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandBoat, -1
	person_event SPRITE_DONPHAN,  6, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamReserveDonphan, -1
	person_event SPRITE_SLOWPOKETAIL, 14,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamReserveSlowpoke, -1
	person_event SPRITE_MAGMAR, 13, 13, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamReserveMagmar, -1
	person_event SPRITE_ELECTABUZZ, 11, 20, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamReserveElectabuzz, -1

	
	const_def 1 ; object constants
	const SUNBEAM_NPC1
	const SUNBEAM_NPC2
	const SUNBEAM_NPC3
	const SUNBEAM_NPC4
	const SUNBEAM_NPC5
	const SUNBEAM_NPC6
	const SUNBEAM_BOAT_MAN
	const SUNBEAM_CROWD1
	const SUNBEAM_CROWD2
	const SUNBEAM_ROWBOAT
	const SUNBEAM_DONPHAN
	const SUNBEAM_SLOWPOKE
	const SUNBEAM_MAGMAR
	const SUNBEAM_ELECTABUZZ
	
SunbeamIslandTrigger0:
	priorityjump JustRodeBoatSunbeam
	end
	
SunbeamIslandTrigger1:
	priorityjump JustRodeBoatSunbeam2
	end
	
SunbeamIslandTrigger2:
	end
	
SunbeamIslandFlyPoint:
	setflag ENGINE_FLYPOINT_SUNBEAM
	return
	
JustRodeBoatSunbeam:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	applymovement PLAYER, Movement_SunbeamPlayerStepOffBoat
	spriteface PLAYER, LEFT
	opentext
	writetext SunbeamJustRodeBoatText
	waitbutton
	closetext
	applymovement SUNBEAM_BOAT_MAN, Movement_SunbeamPlayerStepOffBoat
	playsound SFX_EXIT_BUILDING
	disappear SUNBEAM_BOAT_MAN
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_ISLAND_STRAND
	dotrigger $2
	end
	
JustRodeBoatSunbeam2:
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
	dotrigger $2
	end
	
SunbeamIslandUmbrellaScript:
	end
	
SunbeamIslandBoat:
	jumptext SunbeamBoatText
	
SunBeamSign:
	jumptext SunBeamSignText
	
SunBeamBoatSign:
	jumptext SunBeamBoatSignText
	
SunbeamIslandNPC1:
	jumptextfaceplayer SunbeamIslandNPC1Text
	
SunbeamIslandNPC2:
	jumptextfaceplayer SunbeamIslandNPC2Text
	
SunbeamIslandNPC3:
	faceplayer
SunbeamSlowpokeGirlSign:
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
	
SunBeamGymSign:
	jumptext SunBeamGymSignText
	
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

SunBeamGymSignText:
	text "SUNBEAM ISLAND"
	line "#MON GYM"
	cont "LEADER: LEILANI"

	para "The brutal beauty."
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
	
SunbeamFirstContestText1:
	text "And now, the mom-"
	line "ent you've all been"
	cont "waiting for…"
	done
	
SunbeamFirstContestText2:
	text "And the winner of"
	line "the BEACH BATTLE"
	cont "BEAUTY CONTEST is…"	
	done
	
SunbeamFirstContestText3:
	text "LEILANI!"
	done
	
SunbeamFirstContestText4:
	text "Thank you so much,"
	line "everyone!"
	done
	
SunbeamFirstContestText5:
	text "Well folks, that's"
	line "all for today!"
	
	para "Join us next time"
	line "for another fierce"
	cont "competition!"
	done
	
SunbeamLeilaniText:
	text "Thanks for coming"
	line "out to the show!"
	
	para "I'm LEILANI!"
	
	para "I'm the GYM LEADER"
	line "of SUNBEAM ISLAND,"
	
	para "and I guess I'm"
	line "the latest BEACH"
	cont "BATTLE BEAUTY!"
	
	para "And you are?"
	
	para "<PLAYER>!"
	
	para "Well, you should"
	line "come by sometime"
	cont "and have a battle."
	
	para "The GYM on the"
	line "island is in the"
	cont "jungle, so you"
	cont "can't miss it!"
	
	para "I'll see you"
	line "around."
	done
	
SunbeamIslandNPC1Text:
	text "SUNBEAM ISLAND'S"
	line "GYM isn't in a"
	cont "building like most"
	cont "GYMS."
	
	para "Instead, TRAINERS"
	line "have to journey"
	cont "through the jungle"
	cont "to reach the GYM"
	cont "LEADER."
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
	
	para "but this island"
	line "used to be very"
	cont "quiet."
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
