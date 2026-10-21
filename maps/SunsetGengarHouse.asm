SunsetGengarHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SUNSET_BAY, 7
	warp_event  3,  7, SUNSET_BAY, 7

	db 4 ; coord events
	coord_event  5,  2, 1, SunsetGengarHouseTrip
	coord_event  7,  4, 1, SunsetGengarHouseTrip
	coord_event  6,  5, 1, SunsetGengarHouseTrip
	coord_event  7,  2, 1, SunsetGengarHouseTrip

	db 2 ; bg events
	bg_event  6,  1, SIGNPOST_JUMPSTD, picturebookshelf
	bg_event  7,  1, SIGNPOST_JUMPSTD, magazinebookshelf

	db 3 ; object events
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunsetGengarHouseNPC1, -1
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetGengarHouseNPC2, -1
	object_event  6,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, GENGAR, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetGengarHouseGengar, -1

	
SunsetGengarHouseNPC1:
	setevent EVENT_HEARD_BUTTERCUPS_NAME
	jumptextfaceplayer SunsetGengarHouseNPC1Text

SunsetGengarHouseNPC2:
	faceplayer
	checkflag ENGINE_FIRSTBADGE
	iftrue .badge1
	jumptext SunsetGengarHouseNPC2TextNoBadges
.badge1
	checkevent EVENT_DECO_SMEARGLE_DOLL
	iffalse .smeargle
	checkflag ENGINE_SECONDBADGE
	iftrue .badge2
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge2
	checkevent EVENT_DECO_GYARADOS_DOLL
	iffalse .gyarados
	checkflag ENGINE_THIRDBADGE
	iftrue .badge3
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge3
	checkevent EVENT_DECO_SWABLU_DOLL
	iffalse .swablu
	checkflag ENGINE_FOURTHBADGE
	iftrue .badge4
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge4
	checkevent EVENT_DECO_CUBONE_DOLL
	iffalse .cubone
	checkflag ENGINE_FIFTHBADGE
	iftrue .badge5
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge5
	checkevent EVENT_DECO_WOOPER_DOLL
	iffalse .wooper
	checkflag ENGINE_SIXTHBADGE
	iftrue .badge6
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge6
	checkevent EVENT_DECO_SUNFLORA_DOLL
	iffalse .sunflora
	checkflag ENGINE_SEVENTHBADGE
	iftrue .badge7
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge7
	checkevent EVENT_DECO_SUDOWOODO_DOLL
	iffalse .sudowoodo
	checkflag ENGINE_EIGHTHBADGE
	iftrue .badge8
	jumptext SunsetGengarHouseNPC2TextMoreLater
.badge8
	checkevent EVENT_DECO_NATU_DOLL
	iffalse .natu
	jumptext SunsetGengarHouseNPC2TextNoMoreDolls
.smeargle
	opentext
	writetext SunsetGengarHouseNPC2TextBadge1
	waitbutton
	setevent EVENT_DECO_SMEARGLE_DOLL
	writetext GiveSmeargleDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwaySmeargleDollText
	jump .more_to_come
.gyarados
	opentext
	writetext SunsetGengarHouseNPC2TextBadge2
	waitbutton
	setevent EVENT_DECO_GYARADOS_DOLL
	writetext GiveGyaradosDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayGyaradosDollText
	jump .more_to_come
.swablu
	opentext
	writetext SunsetGengarHouseNPC2TextBadge3
	waitbutton
	setevent EVENT_DECO_SWABLU_DOLL
	writetext GiveSwabluDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwaySwabluDollText
	jump .more_to_come
.cubone
	opentext
	writetext SunsetGengarHouseNPC2TextBadge4
	waitbutton
	setevent EVENT_DECO_CUBONE_DOLL
	writetext GiveCuboneDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayCuboneDollText
	jump .more_to_come
.wooper
	opentext
	writetext SunsetGengarHouseNPC2TextBadge5
	waitbutton
	setevent EVENT_DECO_WOOPER_DOLL
	writetext GiveWooperDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayWooperDollText
	jump .more_to_come
.sunflora
	opentext
	writetext SunsetGengarHouseNPC2TextBadge6
	waitbutton
	setevent EVENT_DECO_SUNFLORA_DOLL
	writetext GiveSunfloraDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwaySunfloraDollText
	jump .more_to_come
.sudowoodo
	opentext
	writetext SunsetGengarHouseNPC2TextBadge7
	waitbutton
	setevent EVENT_DECO_SUDOWOODO_DOLL
	writetext GiveSudowoodoDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwaySudowoodoDollText
	jump .more_to_come
.natu
	opentext
	writetext SunsetGengarHouseNPC2TextBadge8
	waitbutton
	setevent EVENT_DECO_NATU_DOLL
	writetext GiveNatuDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayNatuDollText
	waitbutton
	writetext SunsetGengarHouseNPC2TextNoMoreDolls
	waitbutton
	endtext
.more_to_come
	waitbutton
	writetext SunsetGengarHouseNPC2TextMoreLater
	waitbutton
	endtext
	
SunsetGengarHouseGengar:
	checkevent EVENT_HEARD_BUTTERCUPS_NAME
	iftrue .buttercup
	opentext TEXTBOX_POKEMON, GENGAR
	jump .cont
.buttercup
	opentext TEXTBOX_BUTTERCUP
.cont
	writetext SunsetGengarHouseGengarText1
	cry GENGAR
	buttonsound
	changetextboxspeaker
	writetext SunsetGengarHouseGengarText2
	waitbutton
	closetext
	
	checkcode VAR_FACING
	if_equal DOWN, .FallLeft
	if_equal RIGHT, .FallUp
	callasm SunsetGengarHouseFallDownAsm
	dotrigger $1
	end
.FallLeft
	callasm SunsetGengarHouseFallLeftAsm
	dotrigger $1
	end
.FallUp
	callasm SunsetGengarHouseFallUpAsm
	dotrigger $1
	end
	
SunsetGengarHouseTrip:
	callasm SunsetGengarHouseAsm
	dotrigger $0
	end
	
SunsetGengarHouseFallLeftAsm:
	ld a, 2
	ld [wPlaceBallsY], a
	ret
	
SunsetGengarHouseFallUpAsm:
	ld a, 1
	ld [wPlaceBallsY], a
	ret
	
SunsetGengarHouseFallDownAsm:
	ld a, 0
	ld [wPlaceBallsY], a
	ret
	
SunsetGengarHouseAsm:
	ld a, 69
	ld [wSkateboardGrinding], a
	ret
	
SunsetGengarHouseNPC1Text:
	text "I've known my"
	line "GENGAR, BUTTERCUP,"
	cont "for many years."
	
	para "She still likes to"
	line "play pranks."
	done

SunsetGengarHouseNPC2TextBadge1:
	text "Ohoho!"
	
	para "Is that the"
	line "STARKBADGE?"
	
	para "That badge shows"
	line "your potential as"
	cont "a new TRAINER!"
	
	para "Great job!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge2:
	text "Ohoho!"
	
	para "Is that the"
	line "SPLASHBADGE?"
	
	para "That badge shows"
	line "that you battle"
	cont "with the force of"
	cont "a mighty wave!"
	
	para "Impressive!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge3:
	text "Ohoho!"
	
	para "Is that the"
	line "GALEBADGE?"
	
	para "That badge shows"
	line "that you will soar"
	cont "to the top!"
	
	para "Very nice!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge4:
	text "Ohoho!"
	
	para "Is that the"
	line "BURNBADGE?"
	
	para "That badge shows"
	line "that your spirit"
	cont "burns like flame!"
	
	para "Way to go!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge5:
	text "Ohoho!"
	
	para "Is that the"
	line "BANEBADGE?"
	
	para "That badge shows"
	line "your strategic"
	cont "superiority!"
	
	para "Excellent!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge6:
	text "Ohoho!"
	
	para "Is that the"
	line "PETALBADGE?"
	
	para "That badge shows"
	line "your composure in"
	cont "battle!"
	
	para "Superb!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge7:
	text "Ohoho!"
	
	para "Is that the"
	line "GEOBADGE?"
	
	para "That badge shows"
	line "your resolve to"
	cont "win no matter the"
	cont "cost!"
	
	para "Wonderful!"
	
	para "Here, take this."
	done
	
SunsetGengarHouseNPC2TextBadge8:
	text "Ohoho!"
	
	para "Is that the"
	line "DRAKEBADGE?"
	
	para "That badge shows"
	line "that you are an"
	cont "honorable TRAINER."
	
	para "I'm in awe!"
	
	para "Here, take this."
	done

SunsetGengarHouseNPC2TextNoBadges:
	text "So, <WAIT_S>you're"
	line "taking the GYM"
	cont "CHALLENGE, eh?"
	
	para "Come back here"
	line "when you get your"
	cont "first GYM BADGE."
	
	para "I'll be sure to"
	line "give you something"
	cont "special."
	
	para "Hohohoho."
	done
	
SunsetGengarHouseNPC2TextMoreLater:
	text "Make sure to come"
	line "back and show me"
	cont "another BADGE."
	
	para "I'll be sure to"
	line "give you something"
	cont "special."
	
	para "Hohohoho."
	done
	
SunsetGengarHouseNPC2TextNoMoreDolls:
	text "Well, you cleaned"
	line "me out!"
	
	para "I've got nothing"
	line "else to give you!"
	
	para "You've truly come"
	line "a long way!"
	
	para "Hohohoho."
	done

SunsetGengarHouseGengarText1:
	text "Gah gan!"
	done
	
SunsetGengarHouseGengarText2:
	text "She tied together"
	line "your shoelaces…"
	done
	
GiveSmeargleDollText:
	text "<PLAYER> received"
	line "SMEARGLE DOLL!"
	done
	
PutAwaySmeargleDollText:
	text "SMEARGLE DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveGyaradosDollText:
	text "<PLAYER> received"
	line "BIG GYARADOS DOLL!"
	done
	
PutAwayGyaradosDollText:
	text "BIG GYARADOS DOLL"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveSwabluDollText:
	text "<PLAYER> received"
	line "SWABLU DOLL!"
	done
	
PutAwaySwabluDollText:
	text "SWABLU DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveCuboneDollText:
	text "<PLAYER> received"
	line "CUBONE DOLL!"
	done
	
PutAwayCuboneDollText:
	text "CUBONE DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveWooperDollText:
	text "<PLAYER> received"
	line "WOOPER DOLL!"
	done
	
PutAwayWooperDollText:
	text "WOOPER DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveSunfloraDollText:
	text "<PLAYER> received"
	line "SUNFLORA DOLL!"
	done
	
PutAwaySunfloraDollText:
	text "SUNFLORA DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveSudowoodoDollText:
	text "<PLAYER> received"
	line "SUDOWOODO DOLL!"
	done
	
PutAwaySudowoodoDollText:
	text "SUDOWOODO DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	
GiveNatuDollText:
	text "<PLAYER> received"
	line "NATU DOLL!"
	done
	
PutAwayNatuDollText:
	text "NATU DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
	done
	