ObscuraMuseum2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraMuseum2FCallback

	db 4 ; warp events
	warp_def  4,  9, 5, OBSCURA_MUSEUM_1F
	warp_def  6,  4, 1, OBSCURA_GYM
	warp_def  6,  5, 2, OBSCURA_GYM
	warp_def  6, 23, 1, OBSCURA_MUSEUM_3F

	db 1 ; coord events
	coord_event  2,  7, 1, ObscuraMuseum2FPhoto

	db 43 ; bg events
	signpost  5, 14, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 15, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 17, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 14, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 14, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 14, 16, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 14, 17, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 15, 17, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8, 18, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8, 19, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  9, 18, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  5, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 14,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost 14,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilText
	signpost  8, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 10, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 11, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 14, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 14, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 14, 14, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost 14, 15, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 14, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  8, 15, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 14, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  9, 15, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodText
	signpost  5, 16, SIGNPOST_JUMPTEXT, ObscuraMuseumFossilFactText
	signpost  9, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumWoodFactText
	signpost  9, 19, SIGNPOST_JUMPTEXT, ObscuraMuseumTriassicFactText
	signpost  4,  8, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost  6, 22, SIGNPOST_JUMPTEXT, ObscuraMuseum2FSign
	signpost  7,  6, SIGNPOST_JUMPTEXT, ObscuraMuseumGymSign
	signpost  6,  4, SIGNPOST_IFSET, ObscuraMuseumGymDoor
	signpost  6,  5, SIGNPOST_IFSET, ObscuraMuseumGymDoor
	signpost  8, 22, SIGNPOST_IFSET, ObscuraMuseumBarrier
	signpost  8, 23, SIGNPOST_IFSET, ObscuraMuseumBarrier
	bg_event 26,  8, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_MUSEUM_2F_HIDDEN_BOTTLE_CAP
	signpost  7,  2, SIGNPOST_UP, ObscuraMuseumSudowoodo1
	signpost  8,  2, SIGNPOST_DOWN, ObscuraMuseumSudowoodo2

	db 19 ; object events
	person_event SPRITE_SNARE,  5, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, ObscuraMuseum2FSnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  7, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, ObscuraMuseum2FSnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE_GIRL,  9,  7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, ObscuraMuseum2FSnare3, EVENT_MUSEUM_SNARE_GUY_GONE
	person_event SPRITE_ROCKY,  9, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FRocky, EVENT_MUSEUM_2F_ROCKY_GONE
	person_event SPRITE_SNARE_GIRL, 13, 25, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FSnareNPC, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_RECEPTIONIST,  8,  1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPhotoLady, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_OFFICER,  7, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FGuard, EVENT_MUSEUM_GUARD
	person_event SPRITE_COOLTRAINER_M,  9,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC1, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_TWIN, 12,  9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC2, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_MATRON, 12, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC3, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_SUPER_NERD,  6, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC4, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_REDS_MOM,  6, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC5, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_FISHING_GURU, 12, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC6, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_POKEFAN_M, 10, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC7, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_PONYTAIL, 11, 25, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FNPC8, EVENT_SNARE_AT_MUSEUM
	person_event SPRITE_RAINBOW_SILVER_WING,  7,  3, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MUSEUM_STANDEE,  7,  2, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GOLD_TROPHY,  7,  3, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_PICNIC,  7,  2, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	
	const_def 1 ; object constants
	const OBSCURA_MUSEUM_2F_SNARE_1
	const OBSCURA_MUSEUM_2F_SNARE_2
	const OBSCURA_MUSEUM_2F_SNARE_3
	const OBSCURA_MUSEUM_2F_ROCKY
	const OBSCURA_MUSEUM_2F_SNARE_NPC
	const OBSCURA_MUSEUM_2F_PHOTO_LADY
	const OBSCURA_MUSEUM_2F_GUARD
	const OBSCURA_MUSEUM_2F_NPC_1
	const OBSCURA_MUSEUM_2F_NPC_2
	const OBSCURA_MUSEUM_2F_NPC_3
	const OBSCURA_MUSEUM_2F_NPC_4
	const OBSCURA_MUSEUM_2F_NPC_5
	const OBSCURA_MUSEUM_2F_NPC_6
	const OBSCURA_MUSEUM_2F_NPC_7
	
ObscuraMuseum2FCallback:
	checkevent EVENT_MUSEUM_ROPE_LEFT
	iffalse .skip1
	changeblock $8, $8, $75
.skip1
	checkevent EVENT_MUSEUM_ROPE_RIGHT
	iffalse .skip2
	changeblock $10, $8, $75
.skip2
	checkevent EVENT_MUSEUM_BARRIER_DOWN
	iffalse .skip3
	changeblock $16, $6, $8a
	changeblock $16, $8, $8b
.skip3
	checkevent EVENT_SNARE_AT_MUSEUM
	iffalse .end
	changeblock $4, $6, $80
.end
	return
	
ObscuraMuseum2FGuard:
	faceplayer
	opentext
	writetext ObscuraMuseum2FGuardText
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_GUARD, DOWN
	end
	
ObscuraMuseum2FGuardText:
	text "Something happened"
	line "upstairs, so it's"
	cont "off limits."
	
	para "An exhibit was"
	line "stolen!"
	done
	
ObscuraMuseum2FNPC1:
	jumptextfaceplayer ObscuraMuseum2FNPC1Text
	
ObscuraMuseum2FNPC2:
	jumptext ObscuraMuseum2FNPC2Text
	
ObscuraMuseum2FNPC3:
	jumptext ObscuraMuseum2FNPC3Text
	
ObscuraMuseum2FNPC4:
	jumptext ObscuraMuseum2FNPC4Text
	
ObscuraMuseum2FNPC5:
	jumptext ObscuraMuseum2FNPC5Text
	
ObscuraMuseum2FNPC6:
	jumptextfaceplayer ObscuraMuseum2FNPC6Text
	
ObscuraMuseum2FNPC7:
	faceplayer
	opentext
	writetext ObscuraMuseum2FNPC7Text
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_NPC_7, UP
	end
	
ObscuraMuseum2FNPC8:
	jumptextfaceplayer ObscuraMuseum2FNPC8Text
	
ObscuraMuseum2FNPC1Text:
	text "There's a GYM here?"
	
	para "This museum's got"
	line "everything!"
	done
	
ObscuraMuseum2FNPC2Text:
	text "PETRO! PETRO!"
	
	para "I wanna get my"
	line "picture taken with"
	cont "PETRO!"
	done
	
ObscuraMuseum2FNPC3Text:
	text "In a minute,"
	line "sweetie."
	
	para "Let MOMMY rest"
	line "for a bit…"
	done
	
ObscuraMuseum2FNPC4Text:
	text "I'm bored!"
	
	para "Can we go home?"
	done
	
ObscuraMuseum2FNPC5Text:
	text "Aren't the fossils"
	line "so fascinating?"
	done
	
ObscuraMuseum2FNPC6Text:
	text "What's that girl"
	line "talking about?"
	
	para "PETRO?"
	
	para "That some kinda"
	line "cartoon character?"
	done
	
ObscuraMuseum2FNPC7Text:
	text "I bet all these"
	line "fossils are worth"
	cont "a pretty penny!"
	done
	
ObscuraMuseum2FNPC8Text:
	text "I hear the GYM"
	line "LEADER here is"
	cont "also the museum"
	cont "director."
	
	para "Seems like he"
	line "feels he has a"
	cont "lot to prove."
	done
	
ObscuraMuseum2FPhoto:
	applyonemovement PLAYER, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	pause 5
	applymovement OBSCURA_MUSEUM_2F_PHOTO_LADY, Movement_Museum2FPhotoLady
	applyonemovement OBSCURA_MUSEUM_2F_PHOTO_LADY, remove_fixed_facing
	pause 15
	opentext
	writetext ObscuraMuseum2FPhotoLadyText3
	waitbutton
	closetext
	pause 15
	playsound SFX_GRASS_RUSTLE
	callasm MuseumFlash
	callasm LoadMapPals
	callasm MuseumFadeInPalettes
	pause 20
	applyonemovement OBSCURA_MUSEUM_2F_PHOTO_LADY, step_up
	opentext
	writetext ObscuraMuseum2FPhotoLadyText4
	waitbutton
	setevent EVENT_DECO_POSTER_9
	writetext GiveMuseumPhotoText
	playsound SFX_ITEM
	pause 60
	writetext PutAwayMuseumPhotoText
	waitbutton
	closetext
	applymovement OBSCURA_MUSEUM_2F_PHOTO_LADY, Movement_Museum2FPhotoLady2
	clearevent EVENT_PAID_FOR_MUSEUM_PHOTO
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	setevent EVENT_TOOK_MUSEUM_PHOTO
	dotrigger $0
	end
	
Movement_Museum2FPhotoLady:
	step_right
	step_down
	turn_step_up
	step_end
	
Movement_Museum2FPhotoLady2:
	step_left
	turn_step_right
	step_end
	
MuseumFlash:
	ld c, 2
	jp FadeToWhite
	
MuseumFadeInPalettes:
	ld c, 35
	jp FadePalettes
	
ObscuraMuseum2FPhotoLady:
	faceplayer
	opentext
	checkevent EVENT_TOOK_MUSEUM_PHOTO
	iftrue .took_photo
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .ready
	checkevent EVENT_PAID_FOR_MUSEUM_PHOTO
	iftrue .no_refunds
	writetext ObscuraMuseum2FPhotoLadyText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .no
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	pause 5
	opentext
	writetext ObscuraMuseum2FPhotoLadyText2
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_PHOTO_LADY, RIGHT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	setevent EVENT_PAID_FOR_MUSEUM_PHOTO
	dotrigger $1
	end
.nomoney
	writetext ObscuraMuseum2FPhotoLadyTextNoMoney
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_PHOTO_LADY, RIGHT
	end
.no
	writetext ObscuraMuseum2FPhotoLadyTextNo
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_PHOTO_LADY, RIGHT
	end
.ready
	writetext ObscuraMuseum2FPhotoLadyTextReady
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_PHOTO_LADY, RIGHT
	end
.no_refunds
	writetext ObscuraMuseum2FPhotoLadyTextNoRefunds
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_PHOTO_LADY, RIGHT
	clearevent EVENT_PAID_FOR_MUSEUM_PHOTO
	end
.took_photo
	writetext ObscuraMuseum2FPhotoLadyTextTookPhoto
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_PHOTO_LADY, RIGHT
	end
	
ObscuraMuseum2FPhotoLadyTextTookPhoto:
	text "Have a good rest"
	line "of your visit!"
	done
	
ObscuraMuseum2FPhotoLadyText1:
	text "Having fun at the"
	line "museum?"
	
	para "How about taking"
	line "a commemorative"
	cont "photo?"
	
	para "Only ¥500!"
	done
	
ObscuraMuseum2FPhotoLadyText2:
	text "Great!"
	
	para "Stand behind the"
	line "cutout, and I'll"
	cont "take your photo."
	done
	
ObscuraMuseum2FPhotoLadyText3:
	text "Perfect!"
	line "You look great!"
	
	para "Ok, say…<WAIT_L>"
	line "SQUIRTBOTTLE!"
	done
	
ObscuraMuseum2FPhotoLadyText4:
	text "It turned out"
	line "wonderfully!"
	
	para "Here you go."
	
	para "I'm sure it will"
	line "look great on your"
	cont "wall at home."
	done
	
GiveMuseumPhotoText:
	text "<PLAYER> received"
	line "MUSEUM PHOTO!"
	done
	
PutAwayMuseumPhotoText:
	text "The PHOTO was sent"
	line "to the PC in"
	cont "<PLAYER>'s room."
	done
	
ObscuraMuseum2FPhotoLadyTextReady:
	text "Don't be shy, now."
	
	para "Stand behind the"
	line "cutout, and I'll"
	cont "take your photo."
	done
	
ObscuraMuseum2FPhotoLadyTextNoRefunds:
	text "You left without"
	line "taking a photo!"
	
	para "Did you change"
	line "your mind?"
	
	para "Sorry, no refunds!"
	done
	
ObscuraMuseum2FPhotoLadyTextNo:
	text "That's too bad!"
	done
	
ObscuraMuseum2FPhotoLadyTextNoMoney:
	text "Oops!"
	
	para "You don't have"
	line "enough money!"
	
	para "Maybe next time!"
	done
	
ObscuraMuseumSudowoodo1:
	jumptext ObscuraMuseumSudowoodo1Text
	
ObscuraMuseumSudowoodo1Text:
	text "A cutout of the"
	line "museum's mascot."
	done
	
ObscuraMuseumSudowoodo2:
	jumptext ObscuraMuseumSudowoodo2Text
	
ObscuraMuseumSudowoodo2Text:
	text "You look just like"
	line "a SUDOWOODO!"
	
	para "You inexplicably"
	line "feel like blocking"
	cont "the path for no"
	cont "good reason."
	done	
	
ObscuraMuseum2FRocky:
	checkevent EVENT_MUSEUM_2F_TALKED_TO_ROCKY
	iftrue .talked
	clearevent EVENT_MUSEUM_ROPE_LEFT
	setevent EVENT_MUSEUM_ROPE_RIGHT
	setevent EVENT_MUSEUM_CAN_LOWER_BARRIER
	setevent EVENT_MUSEUM_2F_TALKED_TO_ROCKY
	appear OBSCURA_MUSEUM_2F_SNARE_3
	changeblock $8, $8, $4b
	changeblock $10, $8, $75
	jumptextfaceplayer TEXTBOX_ROCKY, ObscuraMuseum2FRockyText1
.talked
	jumptextfaceplayer TEXTBOX_ROCKY, ObscuraMuseum2FRockyText2
	
ObscuraMuseum2FRockyText1:
	text "Darn!<WAIT_S> They put up"
	line "the barrier to the"
	cont "third floor!"
	
	para "You're gonna have"
	line "to go back down to"
	cont "the employees only"
	cont "room where you"
	cont "came in."
	
	para "You can drop the"
	line "barrier from in"
	cont "there."
	
	para "You'll need the"
	line "six digit code to"
	cont "drop the barrier."
	
	para "Ask the people in"
	line "the employees only"
	cont "room for the code."
	
	para "Hurry!<WAIT_S> Time is"
	line "running out!"
	done
	
ObscuraMuseum2FRockyText2:
	text "You'll need the"
	line "six digit code to"
	cont "drop the barrier."
	
	para "Ask the people in"
	line "the employees only"
	cont "room for the code."
	
	para "Hurry!<WAIT_S> Time is"
	line "running out!"
	done
	
ObscuraMuseum2FSnareNPC:
	faceplayer
	opentext
	writetext ObscuraMuseum2FSnareNPCText
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_2F_SNARE_NPC, UP
	end
	
ObscuraMuseum2FSnareNPCText:
	text "Fight you?<WAIT_S>"
	line "No way."
	
	para "I'm just enjoying"
	line "a drink from the"
	cont "vending machine."
	done
	
ObscuraMuseum2FSnare1:
	generictrainer GRUNTM, MUSEUM_GRUNTM_3, EVENT_BEAT_MUSEUM_GRUNT_4, .SeenText, .BeatenText

	text "You won't get"
	line "much further."
	
	para "I'm sure of it."
	done

.SeenText:
	text "Well, you made"
	line "it this far."
	
	para "But that's it!"
	done

.BeatenText:
	text "Oh well."
	done
	
ObscuraMuseum2FSnare2:
	generictrainer GRUNTM, MUSEUM_GRUNTM_4, EVENT_BEAT_MUSEUM_GRUNT_5, .SeenText, .BeatenText

	text "I've been reading"
	line "these fossil"
	cont "facts."
	
	para "Interesting stuff."
	
	para "…<WAIT_M>I mean…"
	
	para "You'll never stop"
	line "TEAM SNARE!"
	
	para "MUAH HA HA!"
	
	para "Yeah."
	done

.SeenText:
	text "There's tons of"
	line "cool stuff here."
	
	para "Why aren't we"
	line "taking more of it?"
	done

.BeatenText:
	text "Not cool!"
	done
	
ObscuraMuseum2FSnare3:
	generictrainer GRUNTF, MUSEUM_GRUNTF_2, EVENT_BEAT_MUSEUM_GRUNT_6, .SeenText, .BeatenText

	text "I didn't think"
	line "I'd get to pick"
	cont "a fight unless I"
	cont "moved the rope."
	
	para "Sorry about that."
	done

.SeenText:
	text "Someone moved the"
	line "rope?"
	
	para "Yeah, that was me."
	done

.BeatenText:
	text "Yikes!"
	done
	
ObscuraMuseumGymDoor:
	dw EVENT_SNARE_AT_MUSEUM
	jumptext ObscuraMuseumGymDoorText
	
ObscuraMuseumGymDoorText:
	text "It's locked."
	done

ObscuraMuseumBarrier:
	dw EVENT_MUSEUM_BARRIER_DOWN
	jumptext ObscuraMuseumBarrierText
	
ObscuraMuseumBarrierText:
	text "A barrier blocks"
	line "the way."
	done

