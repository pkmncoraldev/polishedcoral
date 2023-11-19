BrilloTown_MapScriptHeader:
	db 3 ; scene scripts
	scene_script BrilloTownTrigger0
	scene_script BrilloTownTrigger1
	scene_script BrilloTownTrigger2

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, BrilloTownFlyPoint
	callback MAPCALLBACK_TILES, BrilloTownCallback

	db 8 ; warp events
	warp_event 19, 21, BRILLO_BOAT_HOUSE, 1
	warp_event 17, 15, BRILLO_ROCK_HOUSE, 1
	warp_event 29, 17, BRILLO_TRADE_HOUSE, 1
	warp_event 15,  9, BRILLO_LEGEND_SPEECH_HOUSE, 1
	warp_event 22, 11, BRILLO_POKECENTER, 1
	warp_event 29, 11, BRILLO_MART, 1
	warp_event 35, 10, BRILLO_POLICE_STATION, 1
	warp_event 36, 10, BRILLO_POLICE_STATION, 2

	db 4 ; coord events
	coord_event 16, 18, 0, BrilloMakeSilverGreen
	coord_event 17, 18, 0, BrilloMakeSilverGreen
	coord_event 16, 19, 2, BrilloMakeSilverBlue
	coord_event 17, 19, 2, BrilloMakeSilverBlue

	db 4 ; bg events
	signpost 11, 30, SIGNPOST_READ, BrilloTownMartSign
	signpost 17, 15, SIGNPOST_READ, BrilloTownSign
	signpost 11, 37, SIGNPOST_READ, BrilloTownPoliceSign
	signpost  9, 34, SIGNPOST_READ, BrilloTownGoP

	db 15 ; object events
	object_event 17, 24, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, EVENT_BRILLO_BOATMAN
	object_event 38, 11, SPRITE_ICESKATER_VARIABLE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloGraffitiCop, -1
	object_event 39, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloCommanderCop, -1
	object_event 25, 11, SPRITE_SINGER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloSinger, -1
	object_event 26, 11, SPRITE_SINGER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloSinger, -1
	object_event 27, 11, SPRITE_SINGER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrilloSinger, -1
	object_event 17, 25, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 17, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_UP_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 16, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 16, 25, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	person_event SPRITE_MALL_SIGN, 11, 23, SPRITEMOVEDATA_PC_SIGN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloTownPokeCenterSign, -1
	object_event 38,  9, SPRITE_MARACTUS_GRAFFITI, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 38, 10, SPRITE_MARACTUS_GRAFFITI, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 39,  9, SPRITE_MARACTUS_GRAFFITI, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 39, 10, SPRITE_CORA_MISC, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1

	const_def 1 ; object constants
	const BRILLO_BOAT_MAN
	const BRILLO_GRAFFITI_COP
	const BRILLO_COMMANDER_COP
	const BRILLO_SINGER_L
	const BRILLO_SINGER_M
	const BRILLO_SINGER_R
	
	
BrilloTownTrigger0:
	end
	
BrilloTownTrigger1:
	priorityjump JustRodeBoatBrillo
	end
	
BrilloTownTrigger2:
	end
	
BrilloTownFlyPoint:
	setflag ENGINE_FLYPOINT_BRILLO
	return
	
BrilloTownCallback:
	clearevent EVENT_BRILLO_SHELF
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_COP_SCRUB
	return
	
JustRodeBoatBrillo:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext BrilloJustRodeBoatText
	waitbutton
	closetext
	applymovement BRILLO_BOAT_MAN, Movement_BrilloBoatmanLeave
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_BOAT_MAN
	waitsfx
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_BRILLO_BOATMAN
	dotrigger $0
	end
	
BrilloMakeSilverGreen:
	setevent EVENT_BRILLO_MARACTUS_GREEN
;	loadvar wTimeOfDayPalFlags, $40 | 1
	special Special_UpdatePalsInstant
	dotrigger $2
	end
	
BrilloMakeSilverBlue:
	clearevent EVENT_BRILLO_MARACTUS_GREEN
;	loadvar wTimeOfDayPalFlags, $40 | 0
	special Special_UpdatePalsInstant
	dotrigger $0
	end
	
BrilloSingerTextScrollAsm1:
	ld hl, wOptions1
	ld a, [hl]
	ld [wPlaceBallsX], a
	set NO_TEXT_SCROLL, [hl]
	ret
	
BrilloSingerTextScrollAsm2:
	ld a, [wPlaceBallsX]
	ld [wOptions1], a
	xor a
	ld [wPlaceBallsX], a
	ld a, MUSIC_OASIS
	ld c, a
	ld hl, wUnlockedSongs
	ld b, SET_FLAG
	ld d, 0
	predef FlagPredef
	ret
	
BrilloSinger:
	opentext
	writetext BrilloSingerText1
	buttonsound
	farwritetext StdBlankText
	pause 6
	special PlaceMoneyTopRight
	writetext BrilloSingerText2
	yesorno
	iffalse .end
	checkmoney $0, 1
	if_equal $2, .no_money
	playsound SFX_TRANSACTION
	takemoney $0, 1
	special PlaceMoneyTopRight
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl1
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl1
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl1
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl1
	writetext BrilloSingerText5
	jump .cont1
.girl1
	writetext BrilloSingerText5Girl
.cont1
	waitbutton
	closetext
	pause 10
	special Special_FadeOutMusic
	wait 20
	callasm BrilloSingerTextScrollAsm1
	opentext
	playmusic MUSIC_BRILLO_SONG
	writetext SongText1
	wait 7
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText2
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText3
	wait 8
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 8
	writetext SongText4
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 20
	writetext SongText5
	wait 8
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText6
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText7
	wait 7
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 8
	writetext SongText8
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 13
	writetext SongText9
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	writetext SongText10
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	writetext SongText11
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	writetext SongText12
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	
	writetext SongText13
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	writetext SongText14
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	writetext SongText15
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 14
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 15
	writetext SongText16
	
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 2
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 2
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 4
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 4
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 9
	
	writetext SongText17
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText18
	wait 7
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText19
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 8
	writetext SongText20
	wait 7
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 20
	writetext SongText21
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 8
	writetext SongText22
	wait 7
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	writetext SongText23
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 14
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 8
	writetext SongText20
	wait 7
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 7
	
	writetext SongText19
	wait 7
	spriteface BRILLO_SINGER_L, RIGHT
	spriteface BRILLO_SINGER_R, LEFT
	spriteface BRILLO_SINGER_M, UP
	wait 13
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 18
	writetext SongText20
	wait 5
	spriteface BRILLO_SINGER_L, LEFT
	spriteface BRILLO_SINGER_R, RIGHT
	spriteface BRILLO_SINGER_M, UP
	wait 15
	spriteface BRILLO_SINGER_L, DOWN
	spriteface BRILLO_SINGER_R, DOWN
	spriteface BRILLO_SINGER_M, DOWN
	wait 15
	closetext
	callasm BrilloSingerTextScrollAsm2
	wait 10
	playmusic MUSIC_BRILLO_TOWN
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl2
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl2
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl2
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl2
	writetext BrilloSingerText3
	jump .cont2
.girl2
	writetext BrilloSingerText3Girl
.cont2
	waitbutton
	closetext
	end
.no_money
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl3
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl3
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl3
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl3
	writetext BrilloSingerText6
	jump .cont3
.girl3
	writetext BrilloSingerText6Girl
.cont3
	waitbutton
	closetext
	end
.end
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl4
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl4
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl4
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl4
	writetext BrilloSingerText4
	jump .cont4
.girl4
	writetext BrilloSingerText4Girl
.cont4
	waitbutton
	closetext
	end
	
BrilloSingerText1:
	text "We are the"
	line "BROTHERS 3."
	
	para "Would you like to"
	line "hear our song?"
	done
	
BrilloSingerText2:
	text "We'll sing for"
	line "¥1."
	done
	
BrilloSingerText3:
	text "Thanks for"
	line "listening, amigo!"
	
	para "We're always here"
	line "if you want to"
	cont "hear us again!"
	done
	
BrilloSingerText3Girl:
	text "Thanks for"
	line "listening, amiga!"
	
	para "We're always here"
	line "if you want to"
	cont "hear us again!"
	done
	
BrilloSingerText4:
	text "It's a good"
	line "song, amigo…"
	done
	
BrilloSingerText4Girl:
	text "It's a good"
	line "song, amiga…"
	done
	
BrilloSingerText5:
	text "You won't regret"
	line "it, amigo!"
	
	para "Alright, here's"
	line "“THE BALLAD OF"
	cont "PUEBLO BRILLO”."
	done
	
BrilloSingerText5Girl:
	text "You won't regret"
	line "it, amiga!"
	
	para "Alright, here's"
	line "“THE BALLAD OF"
	cont "PUEBLO BRILLO”."
	done
	
BrilloSingerText6:
	text "You seem to be"
	line "short on cash,"
	cont "amigo…"
	done
	
BrilloSingerText6Girl:
	text "You seem to be"
	line "short on cash,"
	cont "amiga…"
	done
	
SongText1:
	text "They say that once"
	line "there was a man,"
	done
	
SongText2:
	text "he was the bravest"
	line "in the land."
	done
	
SongText3:
	text "He wanted money,"
	line "wanted riches…"
	done
	
SongText4:
	text "…so he came up"
	line "with a plan!"
	done
	
SongText5:
	text "There was a legend"
	line "that was told,"
	done

SongText6:
	text "of a great temple"
	line "made of gold."
	done
	
SongText7:
	text "It spoke of for-"
	line "tune for the lucky"
	done
	
SongText8:
	text "for the foolish,"
	line "for the bold!"
	done
	
SongText9:
	text "Lost in the"
	line "wasteland,"
	done
	
SongText10:
	text "blinded by harsh"
	line "sand,"
	done
	
SongText11:
	text "fell to his"
	line "knees and…"
	done
	
SongText12:
	text "just couldn't"
	line "stand!"
	done

SongText13:
	text "Flags in the"
	line "fierce wind…"
	done
	
SongText14:
	text "guided our brave"
	line "friend,"
	done
	
SongText15:
	text "but he did not"
	line "comprehend!"
	done
	
SongText16:
	text "So he met his"
	line "end!"
	done
	
SongText17:
	text "Now while the man"
	line "he may have died,"
	done
	
SongText18:
	text "he could have made"
	line "it out alive!"
	done
	
SongText19:
	text "Because the colors"
	line "make a compass,"
	done
	
SongText20:
	text "and the flags they"
	line "are the guide!"
	done
	
SongText21:
	text "So if you want to"
	line "find your way,"
	done
	
SongText22:
	text "you'd better listen"
	line "when we say:"
	done
	
SongText23:
	text "Oh yes the colors"
	line "make a compass,"
	done

BrilloGraffitiCop:
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_OFFICER
	faceplayer
	opentext
	writetext BrilloGraffitiCopText
	waitbutton
	closetext
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_COP_SCRUB
	end
	
BrilloCommanderCop:
	applyonemovement BRILLO_COMMANDER_COP, turn_step_left
	opentext
	writetext BrilloCommanderCopText1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext BrilloCommanderCopText2
	waitbutton
	closetext
	spriteface BRILLO_COMMANDER_COP, LEFT
	end
	
BrilloTownPokeCenterSign:
	jumpstd pokecentersign
	
BrilloTownMartSign:
	jumpstd martsign
	
BrilloTownSign:
	jumptext BrilloTownSignText
	
BrilloTownPoliceSign:
	jumptext BrilloTownPoliceSignText
	
BrilloTownGoP:
	jumptext BrilloTownGoPText
	
BrilloSailboat:
	jumptext BrilloSailboatText
	
BrilloTownSignText:
	text "PUEBLO BRILLO"
	
	para "The vibrant rose"
	line "of the desert."
	done
	
BrilloTownPoliceSignText:
	text "POLICE STATION"
	done
	
BrilloGraffitiCopText:
	text "Why did I get"
	line "stuck scrubbing"
	cont "off this stupid"
	cont "graffiti?"
	
	para "Being a cop ain't"
	line "all it's cracked up"
	cont "to be…"
	done
	
BrilloCommanderCopText1:
	text "Hey, new guy!"
	
	para "Less complaining,"
	line "more scrubbing!"
	done
	
BrilloCommanderCopText2:
	text "I love this job!"
	done
	
BrilloTownGoPText:
	text "“Go-P” is"
	line "spray-painted on"
	cont "on the wall."
	
	para "What could that"
	line "mean?"
	done
	
BrilloSailboatText:
	text "It's a sailboat."
	
	para "It's seen some use,"
	line "but it's still in"
	cont "good shape."
	done
	
BrilloJustRodeBoatText:
	text "Here we are,"
	line "PUEBLO BRILLO."
	
	para "Thanks for riding."
	
	para "Come again."
	done
	
Movement_BrilloBoatmanLeave:
	step_up
	step_up
	step_right
	step_right
	step_up
	step_end
