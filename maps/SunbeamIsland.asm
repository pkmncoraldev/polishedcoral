SunbeamIsland_MapScriptHeader:
	db 4 ; scene scripts
	scene_script SunbeamIslandTrigger0
	scene_script SunbeamIslandTrigger1
	scene_script SunbeamIslandTrigger2
	scene_script SunbeamIslandTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, SunbeamIslandFlyPoint

	db 13 ; warp events
	warp_def 29, 27, 2, ROUTE_1 ; CHERRYGROVE_MART
	warp_def 33, 17, 1, ROUTE_1 ; CHERRYGROVE_POKECENTER_1F
	warp_def 18, 40, 1, ROUTE_1 ; CHERRYGROVE_GYM_SPEECH_HOUSE
	warp_def  9, 25, 1, ROUTE_1 ; GUIDE_GENTS_HOUSE
	warp_def  9, 31, 1, ROUTE_1 ; CHERRYGROVE_EVOLUTION_SPEECH_HOUSE
	warp_def 15, 16, 1, ROUTE_1 ; ELMS_LAB
	warp_def 25, 11, 1, ROUTE_1 ; ELMS_HOUSE
	warp_def 25, 17, 1, ROUTE_1 ; KRISS_NEIGHBORS_HOUSE
	warp_def 49,  8, 1, ROUTE_1 ; MR_POKEMONS_HOUSE
	warp_def 11, 16, 3, ROUTE_1 ; ELMS_LAB
	warp_def 11, 17, 3, ROUTE_1 ; ELMS_LAB
	warp_def 18, 41, 2, ROUTE_1 ; CHERRYGROVE_GYM_SPEECH_HOUSE
	warp_def 47,  7, 1, ROUTE_1 ; ROUTE_30_BERRY_SPEECH_HOUSE

	db 4 ; coord events
	xy_trigger 1, 40, 20, 0, SunbeamStartFirstContest1, 0, 0
	xy_trigger 1, 41, 20, 0, SunbeamStartFirstContest2, 0, 0
	xy_trigger 1, 42, 20, 0, SunbeamStartFirstContest3, 0, 0
	xy_trigger 1, 43, 20, 0, SunbeamStartFirstContest4, 0, 0

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
	person_event SPRITE_DONPHAN,  6, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandDonphan, -1
	person_event SPRITE_SLOWPOKETAIL, 13,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandSlowpoke, -1
	person_event SPRITE_COOL_DUDE, 41, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamIslandDonphan, EVENT_SAW_FIRST_BIKINI_CONTEST
	person_event SPRITE_BATTLE_GIRL, 42, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamIslandDonphan, EVENT_SAW_FIRST_BIKINI_CONTEST
	person_event SPRITE_TWIN, 41, 28, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandDonphan, EVENT_SAW_FIRST_BIKINI_CONTEST
	person_event SPRITE_GENERAL_VARIABLE_1, 48,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandDonphan, EVENT_ISLAND_STRAND
	person_event SPRITE_MATRON, 20, 24, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC1, -1
	person_event SPRITE_POKEFAN_M, 10, 30, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC2, -1
	person_event SPRITE_CUTE_GIRL, 16,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC3, -1
	person_event SPRITE_GRANNY, 26, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC4, -1
	person_event SPRITE_CUTE_GIRL, 42, 14, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC5, -1
	person_event SPRITE_SUPER_NERD, 43,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC6, -1
	person_event SPRITE_ROWBOAT, 49,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandBoat, -1
	person_event SPRITE_ROWBOAT, 49,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandBoat, -1
	
	const_def 1 ; object constants
	const SUNBEAM_DONPHAN
	const SUNBEAM_SLOWPOKE
	const SUNBEAM_CROWD1
	const SUNBEAM_CROWD2
	const SUNBEAM_CROWD3
	const SUNBEAM_LEILANI
	const SUNBEAM_NPC1
	const SUNBEAM_NPC2
	const SUNBEAM_NPC3
	const SUNBEAM_NPC4
	const SUNBEAM_NPC5
	const SUNBEAM_NPC6
	const SUNBEAM_BOAT_L
	const SUNBEAM_BOAT_R
	
SunbeamIslandTrigger0:
	priorityjump JustRodeBoatSunbeam
	end
	
SunbeamIslandTrigger1:
	end
	
SunbeamIslandTrigger2:
	end
	
SunbeamIslandTrigger3:
	priorityjump JustRodeBoatSunbeam2
	end
	
SunbeamIslandFlyPoint:
	setflag ENGINE_FLYPOINT_SUNBEAM
	return
	
JustRodeBoatSunbeam:
	applymovement PLAYER, Movement_SunbeamPlayerStepOffBoat
	spriteface PLAYER, LEFT
	opentext
	writetext SunbeamJustRodeBoatText
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamPlayerStepOffBoat
	playsound SFX_EXIT_BUILDING
	disappear SUNBEAM_LEILANI
	waitsfx
	setevent EVENT_ISLAND_STRAND
	checkevent EVENT_SAW_FIRST_BIKINI_CONTEST
	iftrue .sawbikinicontest
	dotrigger $1
	end
.sawbikinicontest
	dotrigger $2
	end
	
JustRodeBoatSunbeam2:
	applymovement PLAYER, Movement_SunbeamPlayerStepOffBoat
	spriteface PLAYER, LEFT
	opentext
	writetext SunbeamJustRodeBoatText2
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamPlayerStepOffBoat
	playsound SFX_EXIT_BUILDING
	disappear SUNBEAM_LEILANI
	waitsfx
	setevent EVENT_ISLAND_STRAND
	checkevent EVENT_SAW_FIRST_BIKINI_CONTEST
	iftrue .sawbikinicontest
	dotrigger $1
	end
.sawbikinicontest
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
	
SunbeamStartFirstContest1:
	special Special_StopRunning
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC3, $1d, $29
	appear SUNBEAM_NPC3
	disappear SUNBEAM_NPC2
	moveperson SUNBEAM_NPC2, $1a, $29
	appear SUNBEAM_NPC2
	spriteface SUNBEAM_NPC2, UP
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1_1
	jump SunbeamStartFirstContestCont
	
SunbeamStartFirstContest2:
	special Special_StopRunning
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC3, $1d, $29
	appear SUNBEAM_NPC3
	disappear SUNBEAM_NPC2
	moveperson SUNBEAM_NPC2, $1a, $29
	appear SUNBEAM_NPC2
	spriteface SUNBEAM_NPC2, UP
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	applymovement PLAYER, Movement_SunbeamFirstContest1_2
	jump SunbeamStartFirstContestCont
	
SunbeamStartFirstContest3:
	special Special_StopRunning
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC3, $1d, $29
	appear SUNBEAM_NPC3
	disappear SUNBEAM_NPC2
	moveperson SUNBEAM_NPC2, $1a, $29
	appear SUNBEAM_NPC2
	spriteface SUNBEAM_NPC2, UP
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1_3
	jump SunbeamStartFirstContestCont
	
SunbeamStartFirstContest4:
	special Special_StopRunning
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC3, $1d, $29
	appear SUNBEAM_NPC3
	disappear SUNBEAM_NPC2
	moveperson SUNBEAM_NPC2, $1a, $29
	appear SUNBEAM_NPC2
	spriteface SUNBEAM_NPC2, UP
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1_4
	jump SunbeamStartFirstContestCont
	
SunbeamStartFirstContestCont
	callasm .MetLeilani
;	disappear SUNBEAM_LEILANI
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_LEILANI
	special MapCallbackSprites_LoadUsedSpritesGFX
;	pause 7
	opentext
	writetext SunbeamFirstContestText2
	playmusic MUSIC_NONE
	
	spriteface SUNBEAM_CROWD1, RIGHT
	pause 10
	spriteface SUNBEAM_NPC3, LEFT
	pause 10
	spriteface SUNBEAM_CROWD3, RIGHT
	pause 10
	spriteface SUNBEAM_NPC2, LEFT
	pause 10
	spriteface SUNBEAM_NPC3, UP
	pause 10
	spriteface SUNBEAM_CROWD1, UP
	pause 10
	spriteface SUNBEAM_CROWD3, UP
	pause 10
	spriteface SUNBEAM_NPC2, UP
	pause 10
	
	writetext SunbeamFirstContestText3
	playmusic MUSIC_GSC_GAME_CORNER
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	playmusic MUSIC_GSC_GAME_CORNER
	waitbutton
	closetext
	pause 7
	moveperson SUNBEAM_LEILANI, $1b, $27
	appear SUNBEAM_LEILANI
	playsound SFX_EXIT_BUILDING
	applymovement SUNBEAM_LEILANI, Movement_SunbeamFirstContest2
	spriteface SUNBEAM_LEILANI, DOWN
	opentext
	writetext SunbeamFirstContestText4
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamFirstContest3
	pause 14
	opentext
	writetext SunbeamFirstContestText5
	waitbutton
	closetext
	pause 7
	
	playsound SFX_EXIT_BUILDING
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SUNBEAM_CROWD1
	disappear SUNBEAM_CROWD2
	disappear SUNBEAM_CROWD3
	disappear SUNBEAM_NPC2
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC2, $1e, $a
	moveperson SUNBEAM_NPC3, $6, $10
	appear SUNBEAM_NPC2
	appear SUNBEAM_NPC3
	waitsfx
	special Special_FadeOutMusic
	pause 20
	special RestartMapMusic
	special Special_FadeInQuickly
	applymovement SUNBEAM_LEILANI, Movement_SunbeamFirstContest4
	spriteface SUNBEAM_LEILANI, DOWN
	opentext
	writetext SunbeamLeilaniText
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamFirstContest5
	disappear SUNBEAM_LEILANI
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	special MapCallbackSprites_LoadUsedSpritesGFX
	setevent EVENT_SAW_FIRST_BIKINI_CONTEST
	setflag ENGINE_DAILY_BIKINI_CONTEST
;	domaptrigger CHERRYGROVE_GYM_SPEECH_HOUSE, $1
	dotrigger $2
	end
	
.MetLeilani
	ld hl, wMetGymLeaderFlags
	set 2, [hl] ; metleilani
	ret
	
SunbeamIslandSnare:
	jumptextfaceplayer SunbeamIslandSnareText
	
SunbeamIslandSnare2:
	faceplayer
	opentext
	writetext SunbeamIslandSnare2Text
	waitbutton
	closetext
	spriteface SUNBEAM_CROWD1, DOWN
	end
	
SunbeamIslandDonphan
	jumptext SunbeamIslandDonphanText
	
SunbeamIslandSlowpoke:
	jumptext SunbeamIslandSlowpokeText
	
SunbeamIslandNPC1:
	jumptextfaceplayer SunbeamIslandNPC1Text
	
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
	
SunBeamGymSign:
	jumptext SunBeamGymSignText
	
SunBeamSurfSign:
	checkflag ENGINE_DAILY_BIKINI_CONTEST
	iftrue .donebikinicontest
	jumptext SunBeamSurfSignText2
.donebikinicontest
	jumptext SunBeamSurfSignText1
	
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
	
SunBeamSurfSignText1:
	text "SUNBEAM SURF SHOP"
	
	para "Surf's up!"
	done
	
SunBeamSurfSignText2:
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
	
SunbeamIslandDonphanText:
	text "How did you get"
	line "here?"
	done
	
SunbeamIslandSlowpokeText:
	text "I could really use"
	line "a smoke…"
	
	para "I mean!"
	
	para "Slowwwww…"
	
	para "Phew…"
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
	
	para "jungle, so you"
	line "can't miss it!"
	
	para "I'll see you"
	line "around."
	done
	
SunbeamIslandSnareText:
	text "No one is allowed"
	line "off the island"
	cont "for now!"
	
	para "Why?"
	
	para "Uhhh…"
	
	para "No reason…"
	done
	
SunbeamIslandSnare2Text:
	text "I've been told to"
	line "stand guard here"
	
	para "and not let any"
	line "punk kids inside."
	
	para "You look like a"
	line "punk kid to me."
	
	para "Buzz off."
	done
	
SunbeamIslandNPC1Text:
	text "SUNBEAM ISLAND'S"
	line "GYM isn't in a"
	
	para "building like most"
	line "GYMS."
	
	para "Instead, TRAINERS"
	line "have to journey"
	
	para "through the jungle"
	line "to reach the GYM"
	cont "LEADER."
	done
	
SunbeamIslandNPC2Text:
	text "SUNBEAM ISLAND"
	line "is known for it's"
	
	para "bright sunshine,"
	line "and deep blue"
	cont "waters."

	para "There's really no"
	line "place like it in"
	cont "all of ONWA!"
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
	
	para "with my #MON,"
	line "and find out what's"
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
	
Movement_SunbeamFirstContest1_1:
	step_right
	step_right
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
	step_right
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
	step_right
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