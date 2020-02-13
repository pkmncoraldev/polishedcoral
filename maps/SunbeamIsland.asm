SunbeamIsland_MapScriptHeader:
	db 5 ; scene scripts
	scene_script SunbeamIslandTrigger0
	scene_script SunbeamIslandTrigger1
	scene_script SunbeamIslandTrigger2
	scene_script SunbeamIslandTrigger3
	scene_script SunbeamIslandTrigger4

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, SunbeamIslandFlyPoint

	db 14 ; warp events
	warp_def 29, 27, 2, SUNBEAM_MART
	warp_def 33, 17, 1, SUNBEAM_POKECENTER
	warp_def 18, 40, 1, SUNBEAM_GYM
	warp_def  9, 25, 1, SUNBEAM_TRADE_HOUSE
	warp_def  9, 31, 1, SUNBEAM_DODRIO_HOUSE
	warp_def 15, 16, 1, SPRUCES_LAB
	warp_def 25, 11, 1, SUNBEAM_OLD_COUPLES_HOUSE
	warp_def 25, 17, 1, SUNBEAM_BLUE_WATER_HOUSE
	warp_def 39, 17, 1, SUNBEAM_SURF_SHOP
	warp_def 11, 16, 3, SPRUCES_LAB
	warp_def 11, 17, 3, SPRUCES_LAB
	warp_def 18, 41, 2, SUNBEAM_GYM
	warp_def 47,  7, 1, SUNBEAM_BOAT_HOUSE
	warp_def 40, 17, 1, SUNBEAM_SURF_SHOP

	db 4 ; coord events
	xy_trigger 1, 40, 20, 0, SunbeamStartFirstContest1, 0, 0
	xy_trigger 1, 41, 20, 0, SunbeamStartFirstContest2, 0, 0
	xy_trigger 1, 42, 20, 0, SunbeamStartFirstContest3, 0, 0
	xy_trigger 1, 43, 20, 0, SunbeamStartFirstContest4, 0, 0

	db 10 ; bg events
	signpost 29, 21, SIGNPOST_READ, SunBeamSign
	signpost 16, 18, SIGNPOST_READ, SunBeamLabSign
	signpost 19, 29, SIGNPOST_READ, SunBeamGymSign
	signpost 40, 16, SIGNPOST_READ, SunBeamSurfSign
	signpost 39, 18, SIGNPOST_READ, SunBeamSurfboards
	signpost 39, 19, SIGNPOST_READ, SunBeamSurfboards
	signpost 33, 18, SIGNPOST_READ, SunBeamPokeSign
	signpost 29, 28, SIGNPOST_READ, SunBeamMartSign
	signpost 45, 12, SIGNPOST_READ, SunBeamBoatSign
	signpost 15,  6, SIGNPOST_READ, SunBeamSlowpokeGirlSign

	db 19 ; object events
	person_event SPRITE_DONPHAN,  6, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SLOWPOKETAIL, 14,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandSlowpoke, -1
	person_event SPRITE_COOL_DUDE, 41, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_FIRST_BIKINI_CONTEST
	person_event SPRITE_BATTLE_GIRL, 42, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_FIRST_BIKINI_CONTEST
	person_event SPRITE_GENERAL_VARIABLE_1, 48,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ISLAND_STRAND
	person_event SPRITE_MATRON, 20, 24, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC1, -1
	person_event SPRITE_POKEFAN_M, 10, 28, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC2, -1
	person_event SPRITE_CUTE_GIRL, 16,  6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC3, -1
	person_event SPRITE_VARIABLE_SUNBEAM, 26, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC4, -1
	person_event SPRITE_CUTE_GIRL, 42, 14, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC5, -1
	person_event SPRITE_SUPER_NERD, 43,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandNPC6, -1
	person_event SPRITE_ROWBOAT, 49,  8, SPRITEMOVEDATA_BOAT_BOB, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandBoat, -1
	person_event SPRITE_NIDOQUEEN,  6, 13, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNidoqueen, -1
	person_event SPRITE_NIDORANM,  7, 15, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNidoranM, -1
	person_event SPRITE_NIDORANF,  5, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandNidoranF, -1
	person_event SPRITE_LOPUNNY,  9,  8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandLopunny, -1
	person_event SPRITE_ALTARIA, 10, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamIslandAltaria, -1
	person_event SPRITE_MAGMAR, 13, 13, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunbeamIslandMagmar, -1
	person_event SPRITE_ELECTABUZZ, 11, 20, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandElectabuzz, -1

	
	const_def 1 ; object constants
	const SUNBEAM_DONPHAN
	const SUNBEAM_SLOWPOKE
	const SUNBEAM_CROWD1
	const SUNBEAM_CROWD2
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
	
SunbeamIslandTrigger4:
	playsound SFX_EXIT_BUILDING
	moveperson SUNBEAM_LEILANI, $11, $b
	appear SUNBEAM_LEILANI
	domaptrigger SPRUCES_LAB, $2
	pause 5
	applymovement SUNBEAM_LEILANI, Movement_SunbeamIslandSpruce
	spriteface SUNBEAM_LEILANI, DOWN
	opentext
	writetext SunbeamIslandSpruceText1
	waitbutton
	closetext
	follow SUNBEAM_LEILANI, PLAYER
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce2
	stopfollow
	spriteface SUNBEAM_LEILANI, RIGHT
	spriteface PLAYER, RIGHT
	opentext
	writetext SunbeamIslandSpruceText2
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce3
	spriteface SUNBEAM_LEILANI, DOWN
	opentext
	writetext SunbeamIslandSpruceText3
	waitbutton
	writetext SunbeamIslandDonphanText
	cry DONPHAN
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce4
	follow SUNBEAM_LEILANI, PLAYER
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce5
	stopfollow
	spriteface SUNBEAM_LEILANI, UP
	spriteface PLAYER, UP
	opentext
	writetext SunbeamIslandSpruceText4
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce6
	opentext
	writetext SunbeamIslandSpruceText5
	waitbutton
	writetext SunbeamIslandNidoqueenText
	cry NIDOQUEEN
	waitbutton
	closetext
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce7
	follow SUNBEAM_LEILANI, PLAYER
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce8
	stopfollow
	spriteface SUNBEAM_LEILANI, LEFT
	opentext
	writetext SunbeamIslandSpruceText6
	waitbutton
	closetext
	follow SUNBEAM_LEILANI, PLAYER
	applymovement SUNBEAM_LEILANI, Movement_SunbeamSpruce9
	stopfollow
	spriteface SUNBEAM_LEILANI, LEFT
	opentext
	writetext SunbeamIslandSpruceText7
	waitbutton
	closetext
;	applymovement PLAYER, Movement_SunbeamSpruce7
	spriteface PLAYER, DOWN
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing DOWN, SPRUCES_LAB, $5, $0
	end
	
SunbeamIslandFlyPoint:
	setflag ENGINE_FLYPOINT_SUNBEAM
	return
	
JustRodeBoatSunbeam:
	special Special_StopRunning
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
	
SunbeamStartFirstContest1:
	special Special_StopRunning
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC3, $1d, $29
	appear SUNBEAM_NPC3
	disappear SUNBEAM_NPC2
	moveperson SUNBEAM_NPC2, $1a, $29
	appear SUNBEAM_NPC2
	spriteface SUNBEAM_NPC2, UP
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, $1c, $29
	appear SUNBEAM_NPC4
	variablesprite SPRITE_VARIABLE_SUNBEAM, SPRITE_CHRIS
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
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
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, $1c, $29
	appear SUNBEAM_NPC4
	variablesprite SPRITE_VARIABLE_SUNBEAM, SPRITE_CHRIS
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
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
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, $1c, $29
	appear SUNBEAM_NPC4
	variablesprite SPRITE_VARIABLE_SUNBEAM, SPRITE_CHRIS
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
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
	disappear SUNBEAM_NPC4
	moveperson SUNBEAM_NPC4, $1c, $29
	appear SUNBEAM_NPC4
	variablesprite SPRITE_VARIABLE_SUNBEAM, SPRITE_CHRIS
	playmusic MUSIC_GSC_GAME_CORNER
	opentext
	writetext SunbeamFirstContestText1
	waitbutton
	closetext
;	special MapCallbackSprites_LoadUsedSpritesGFX
	closetext
	applymovement PLAYER, Movement_SunbeamFirstContest1
	spriteface SUNBEAM_NPC4, UP
	applymovement PLAYER, Movement_SunbeamFirstContest1_4
	
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
	spriteface SUNBEAM_NPC4, RIGHT
	pause 10
	spriteface SUNBEAM_NPC2, LEFT
	pause 10
	spriteface SUNBEAM_NPC3, UP
	pause 10
	spriteface SUNBEAM_CROWD1, UP
	pause 10
	spriteface SUNBEAM_NPC4, UP
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
	disappear SUNBEAM_NPC4
	disappear SUNBEAM_NPC2
	disappear SUNBEAM_NPC3
	moveperson SUNBEAM_NPC2, $1e, $a
	moveperson SUNBEAM_NPC3, $6, $10
	moveperson SUNBEAM_NPC4, $f, $1a
	appear SUNBEAM_NPC2
	appear SUNBEAM_NPC3
	appear SUNBEAM_NPC4	
	variablesprite SPRITE_VARIABLE_SUNBEAM, SPRITE_GRANNY
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
	domaptrigger SUNBEAM_GYM, $1
	dotrigger $2
	end
	
.MetLeilani
	ld hl, wMetGymLeaderFlags
	set 2, [hl] ; metleilani
	ret
	
SunbeamIslandNPC1:
	jumptextfaceplayer SunbeamIslandNPC1Text
	
SunbeamIslandNPC2:
	jumptextfaceplayer SunbeamIslandNPC2Text
	
SunbeamIslandNPC3:
	faceplayer
SunBeamSlowpokeGirlSign:
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
	
SunbeamIslandSpruceText1:
	text "My research"
	line "involves #MON"
	cont "conservation."
	
	para "As such, I run a"
	line "#MON reserve."
	done
	
SunbeamIslandSpruceText2:
	text "The #MON here"
	line "are all very"
	cont "docile."
	done
	
SunbeamIslandSpruceText3:
	text "Isn't that right,"
	line "DONPHAN?"
	done
	
SunbeamIslandSpruceText4:
	text "I let the #MON"
	line "live their lives"
	cont "as they would in"
	cont "the wild and"
	cont "study their behav-"
	cont "iors."
	done
	
SunbeamIslandSpruceText5:
	text "How are the young"
	line "ones, NIDOQUEEN?"
	done
	
SunbeamIslandSpruceText6:
	text "Recently, I have"
	line "experimented with"
	cont "letting TRAINERS"
	cont "catch some of the"
	cont "#MON in the"
	cont "habitat to see how"
	cont "they react to"
	cont "being trained."
	
	para "Feel free to catch"
	line "a few yourself."
	done
	
SunbeamIslandSpruceText7:
	text "Let's head back"
	line "inside."
	done
	
SunbeamIslandNidoqueen:
	opentext
	writetext SunbeamIslandNidoqueenText
	cry NIDOQUEEN
	waitbutton
	closetext
	end
	
SunbeamIslandNidoranM:
	opentext
	writetext SunbeamIslandNidoranMText
	cry NIDORAN_M
	waitbutton
	closetext
	end
	
SunbeamIslandNidoranF
	opentext
	writetext SunbeamIslandNidoranFText
	cry NIDORAN_F
	waitbutton
	closetext
	end
	
SunbeamIslandSlowpoke:
	opentext
	writetext SunbeamIslandSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end
	
SunbeamIslandLopunny:
	opentext
	writetext SunbeamIslandLopunnyText
	cry BULBASAUR ;LOPUNNY
	waitbutton
	closetext
	end
	
SunbeamIslandAltaria:
	opentext
	writetext SunbeamIslandAltariaText
	cry BULBASAUR ;ALTARIA
	waitbutton
	closetext
	end
	
SunbeamIslandDonphan:
	opentext
	writetext SunbeamIslandDonphanText
	cry DONPHAN
	waitbutton
	closetext
	end
	
SunbeamIslandMagmar:
	opentext
	writetext SunbeamIslandMagmarText
	cry MAGMAR
	waitbutton
	closetext
	end
	
SunbeamIslandElectabuzz:
	opentext
	writetext SunbeamIslandElectabuzzText
	cry ELECTABUZZ
	waitbutton
	closetext
	end
	
SunbeamIslandNidoqueenText:
	text "NIDOQUEEN: Nido!"
	done
	
SunbeamIslandNidoranMText:
	text "NIDORAN♂: Ran!"
	done
	
SunbeamIslandNidoranFText:
	text "NIDORAN♀: Ran…"
	line "Ran…"
	done
	
SunbeamIslandSlowpokeText:
	text "SLOWPOKE: Sloooow…"
	
	para "…"
	
	para "…"
	
	para "…"
	
	para "…poke?"
	done
	
SunbeamIslandLopunnyText:
	text "LOPUNNY: Lop! Lop!"
	done
	
SunbeamIslandAltariaText:
	text "ALTARIA: …Taria?"
	done
	
SunbeamIslandDonphanText:
	text "DONPHAN: Phan…"
	done
	
SunbeamIslandMagmarText:
	text "MAGMAR: MAG!"
	line "MAR!"
	done
	
SunbeamIslandElectabuzzText:
	text "ELECTABUZZ: BUZZ!"
	line "LECTA!"
	done
	
Movement_SunbeamIslandSpruce:
	step_up
	step_left
	step_end
	
Movement_SunbeamSpruce2:
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
	
Movement_SunbeamSpruce3:
	step_right
	step_end
	
Movement_SunbeamSpruce4:
	step_left
	step_end
	
Movement_SunbeamSpruce5:
	step_left
	step_left
	step_left
	step_down
	step_left
	step_down
	step_down
	step_left
	step_end
	
Movement_SunbeamSpruce6:
	step_up
	step_end
	
Movement_SunbeamSpruce7:
	step_down
	step_end
	
Movement_SunbeamSpruce8:
	step_down
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_down
	step_end
	
Movement_SunbeamSpruce9:
	step_right
	step_right
	step_up
	step_right
	step_up
	step_right
	step_right
	step_right
	step_right
	step_end