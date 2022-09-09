PlayerHouse1F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script PlayerHouse1FTrigger0
	scene_script PlayerHouse1FTrigger1
	scene_script PlayerHouse1FTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, PlayerHouse1FSetMusic

	db 3 ; warp events
	warp_event  6,  7, SUNSET_BAY, 1
	warp_event  7,  7, SUNSET_BAY, 1
	warp_event  9,  0, PLAYER_HOUSE_2F, 1

	db 1 ; coord events
	coord_event  9,  1, 0, SunsetMomStopsYou

	db 4 ; bg events
	bg_event  1,  1, SIGNPOST_JUMPTEXT, SinkText
	bg_event  0,  1, SIGNPOST_JUMPTEXT, StoveText
	bg_event  2,  1, SIGNPOST_JUMPTEXT, FridgeText
	bg_event  4,  1, SIGNPOST_UP, TVScript

	db 2 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunsetMomScript, EVENT_PLAYER_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunsetMomScript, EVENT_PLAYER_HOUSE_MOM_2
	
	const_def 1 ; object constants
	const PLAYERHOUSE1F_MOM1
	const PLAYERHOUSE1F_MOM2
	
PlayerHouse1FTrigger0:
	end
	
PlayerHouse1FTrigger1:
	end
	
PlayerHouse1FTrigger2:
	end

PlayerHouse1FSetMusic:
	callasm PlayerHouse1FSetMusicAsm
;	iffalse .end
;	special Special_FadeOutMusic
;	pause 15
;	special RestartMapMusic
;.end
	return
	
PlayerHouse1FSetMusicAsm:
	call FadeToMapMusic
	ret
	ld a, [wMapMusic]
	cp MUSIC_SUNSET_BAY
	jr z, .normalmusic
	ld a, 1
	ret
.normalmusic
	ld a, 0
	ret
	
SunsetMomStopsYou:
	special Special_StopRunning
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERHOUSE1F_MOM1, 15
	applymovement PLAYERHOUSE1F_MOM1, SunsetMomStopsYouMovement
	opentext
	writetext SunsetMomText1
	waitbutton
	closetext
	applymovement PLAYERHOUSE1F_MOM1, SunsetMomStopsYouReturn
	special RestartMapMusic
	setevent EVENT_TALKED_TO_MOM
	dotrigger $1
	domaptrigger SUNSET_BAY, $4
	end

SunsetMomScript:
	checkevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	iftrue SunsetMomRetellsYouAboutStrand
	checkevent EVENT_MOM_SPEECH_LOOP
	iftrue SunsetMomSpeech
	checkevent EVENT_MOM_GOT_POKEGEAR
	iftrue SunsetMomGotPokeGear
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iftrue SunsetMomGotAPokemon
	checkevent EVENT_TALKED_TO_MAN_IN_SHACK
	iftrue SunsetMomGoToLighthouse
	jumptextfaceplayer SunsetMomText2
	
SunsetMomRetellsYouAboutStrand:
	checkevent EVENT_TALKED_TO_MOM_IN_PERSON_ABOUT_STRAND
	iftrue .islandmomtalkloop
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	iffalse .howdidyouknow
	faceplayer
	opentext
	writetext SunsetMomTextGivePass1
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	setevent EVENT_TALKED_TO_MOM_IN_PERSON_ABOUT_STRAND
	clearevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	clearevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	end
.howdidyouknow
	faceplayer
	opentext
	writetext SunsetMomTextGivePass2
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	setevent EVENT_TALKED_TO_MOM_IN_PERSON_ABOUT_STRAND
	clearevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	clearevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	end
.islandmomtalkloop
	faceplayer
	opentext
	writetext SunsetMomTextGivePass3
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	end
	
SunsetMomSpeech:
	faceplayer
	opentext
	writetext SunsetMomText6
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	end
	
SunsetMomGotPokeGear:
	faceplayer
	opentext
	writetext SunsetMomText5
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	end
	
SunsetMomGoToLighthouse:
	faceplayer
	opentext
	writetext SunsetMomText3
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	end
	
SunsetMomGotAPokemon:
	faceplayer
	opentext
	writetext SunsetMomText4
	waitbutton
	stringtotext GearName, $1
	scall UnknownScript_0x7a57e
	setflag ENGINE_TRAINER_CARD
	setevent EVENT_MOM_GOT_POKEGEAR
;	addcellnum PHONE_MOM
	clearevent EVENT_CAN_CALL_TRAINER_CARD
;	writetext SetDayOfWeekText
;	buttonsound
;	special Special_SetDayOfWeek
;UnknownScript_0x7a519:
;	writetext UnknownText_0x7a742
;	yesorno
;	iffalse UnknownScript_0x7a52a
;	special Special_InitialSetDSTFlag
;	yesorno
;	iffalse UnknownScript_0x7a519
;	jump UnknownScript_0x7a531
;
;UnknownScript_0x7a52a:
;	special Special_InitialClearDSTFlag
;	yesorno
;	iffalse UnknownScript_0x7a519
;UnknownScript_0x7a531:
	writetext UnknownText_0x7a763
	waitbutton
	closetext
	spriteface PLAYERHOUSE1F_MOM1, LEFT
	setevent EVENT_LIGHTHOUSE_KIDS_DIE
	domaptrigger SUNSET_BAY, $2
	domaptrigger ROUTE_1_GATE, $2
	end
	
GearName:
	db "TRAINER CARD@"

UnknownScript_0x7a57e:
	jumpstd receiveitem
	end

	
TVScript:
	jumptext TVText
	
SunsetMomStopsYouMovement:
	run_step_right
	run_step_right
	run_step_up
	run_step_up
	step_end

SunsetMomStopsYouReturn:
	step_down
	step_down
	step_left
	step_left
	step_end

SunsetMomTextGivePass1:
	text "<PLAYER>!"
	
	para "How's your"
	line "adventure going?"
	
	para "CAP'N STRAND can"
	line "take you to"
	cont "SUNBEAM ISLAND."
	
	para "Do you remember"
	line "where he lives?"
	
	para "His house is on"
	line "the beach SOUTH"
	cont "of town."
	
	para "Good luck out"
	line "there, sweetie."
	done
	
SunsetMomTextGivePass2:
	text "<PLAYER>!"
	
	para "What are you"
	line "doing home?"
	
	para "Hm?"
	
	para "A ride to"
	line "SUNBEAM ISLAND?"
	
	para "Woah…"
	
	para "Deja vu!"
	
	para "We've done this"
	line "before, haven't"
	cont "we?"
	
	para "Well, anyway…"
	
	para "CAP'N STAND can"
	line "probably give"
	cont "you a ride."
	
	para "Do you remember"
	line "where he lives?"
	
	para "His house is on"
	line "the beach SOUTH"
	cont "of town."
	
	para "Good luck out"
	line "there, sweetie."
	done
	
SunsetMomTextGivePass3:
	text "CAP'N STRAND can"
	line "take you to"
	cont "SUNBEAM ISLAND."
	
	para "Do you remember"
	line "where he lives?"
	
	para "His house is on"
	line "the beach SOUTH"
	cont "of town."
	
	para "Good luck out"
	line "there, sweetie."
	done
	
MomAfterGearText:
	text "You should get"
	line "going."
	
	para "Make sure you"
	line "have everything"
	cont "you need before"
	cont "you leave town."
	
	para "You can stop by"
	line "the CAFE if you"
	cont "want to get some"
	cont "items for your"
	cont "#MON."
	
	para "Good luck out"
	line "there, sweetie."
	done

UnknownText_0x7a763:
	text "It's a TRAINER"
	line "CARD!"

	para "It'll help track"
	line "your progress as"
	cont "a TRAINER."

	para "It also doubles"
	line "as an ATM CARD!"
	
	para "Any money you earn"
	line "will automatically"
	cont "be put into your"
	cont "account!"
	
	para "Just visit the ATM"
	line "at any #MON"
	cont "CENTER to DEPOSIT"
	cont "or WITHDRAW money!"
	
	para "How convenient!"
	
	para "…"
	
	para "So, I guess you're"
	line "heading off, then."
	
	para "My little baby is"
	line "growing up!"
	
	para "Make sure you"
	line "have everything"
	cont "you need before"
	cont "you leave town."
	
	para "You can stop by"
	line "the CAFE if you"
	cont "want to get some"
	cont "items for your"
	cont "#MON."
	
	para "Good luck out"
	line "there, sweetie."
	done
	done
	
UnknownText_0x7a807:
	text "I'll read the"
	line "instructions."

	para "Turn the #GEAR"
	line "on and select the"
	cont "PHONE icon."
	
	para "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done

UnknownText_0x7a850:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done
	
SunsetMomText1:
	text "<PLAYER>?"
	para "You're still here?"

	
	para "Get down to the"
	line "docks!"
	
	para "Hurry! You're late!"
	
	para "CAP'N STRAND is"
	line "supposed to give"
	cont "you your #MON"
	cont "today!"
	done

SunsetMomText2::
	text "What are you"
	line "waiting for?"
	
	para "Go get your"
	line "#MON!"
	done
	
SunsetMomText3:
	text "Oh?"
	
	para "CAP'N STRAND didn't"
	line "have your #MON?"
	
	para "You'd better hurry"
	line "down to the light-"
	cont "house then."
	done
	
SunsetMomText4:
	text "Oh, hey!"
	
	para "You're back!"
	
	para "You got your"
	line "#MON?"
	
	para "Let me see it!"
	
	para "Oh…"
	
	para "So you picked"
	line "THAT one."
	
	para "…"
	
	para "Well, that's okay."
	
	para "Anyway, since"
	line "you're going to"
	cont "challenge the ONWA"
	cont "#MON LEAGUE,"
	
	para "I thought you"
	line "could use this."
	done
	
SunsetMomText5:
	text "Good luck out"
	line "there, sweetie."
	done

SunsetMomText6:
	text "Welcome home!"
	
	para "How is the"
	line "adventure?"
	
	para "If your #MON"
	line "are injured,"
	
	para "make sure to visit"
	line "a #MON CENTER."
	done
	
StoveText:
	text "What's cooking?"

	para "Hmm…"
	
	para "Looks yummy!"
	done

SinkText:
	text "There's a single"
	line "plate in the sink."
	
	para "Looks like MOM al-"
	line "ready ate."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"
	
	para "…"

	para "Nothing good,"
	line "as usual…"
	done

TVText:
	text "There's a movie on"
	line "TV: A crazy old"
	cont "man and a kid in a"
	cont "vest are speeding"
	cont "through an empty"
	cont "parking lot."

	para "I'd better get"
	line "rolling too!"
	done
