DuskAutoLobby_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DuskAutoLobbyCallback

	db 2 ; warp events
	warp_def  5,  2, 8, DUSK_TURNPIKE
	warp_def  5,  3, 8, DUSK_TURNPIKE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_POKEMANIAC,  4,  6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DuskAutoLobbyGuy, -1
	
	
	const_def 1 ; object constants
	const DUSK_AUTO_LOBBY_GUY
	
DuskAutoLobbyCallback:
	checkevent EVENT_SAVED_POPPY
	iftrue .end
	moveperson DUSK_AUTO_LOBBY_GUY, -5, -5
.end
	return
	
SetUpBikeUpgradeStepsAsm:
	ld a, 5
	ld [wBikeUpgradeSteps], a
	ret
	
DuskAutoLobbyGuy:
	opentext
	checkevent EVENT_CAN_PICK_UP_BIKE
	iftrue .pick_up_bike
	checkevent EVENT_GAVE_BIKE_TO_AUTO_GUY
	iftrue .gave_bike
	checkevent EVENT_TALKED_TO_AUTO_GUY_HAVE_BIKE
	iftrue .ask_upgrade_bike
	checkevent EVENT_TALKED_TO_TOLL_BOOTH
	iftrue .talked_toll
	writetext DuskAutoLobbyGuyText1
	waitbutton
	closetext
	end
.talked_toll
	checkitem BICYCLE
	iftrue .have_bike
	checkevent EVENT_TALKED_TO_AUTO_GUY_NO_BIKE
	iftrue .talked_no_bike
	writetext DuskAutoLobbyGuyText2
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_AUTO_GUY_NO_BIKE
	end
.talked_no_bike
	writetext DuskAutoLobbyGuyText3
	waitbutton
	closetext
	end
.have_bike
	setevent EVENT_TALKED_TO_AUTO_GUY_HAVE_BIKE
	checkevent EVENT_TALKED_TO_AUTO_GUY_NO_BIKE
	iftrue .talked_no_bike2
	writetext DuskAutoLobbyGuyText4
	buttonsound
	farwritetext StdBlankText
	pause 6
	jump .ask_upgrade_bike
.talked_no_bike2
	writetext DuskAutoLobbyGuyText5
	buttonsound
	farwritetext StdBlankText
	pause 6
.ask_upgrade_bike
	writetext DuskAutoLobbyGuyText6
	yesorno
	iffalse .said_no
.said_yes
	writetext DuskAutoLobbyGuyTextGiveBike
	playsound SFX_LEVEL_UP
	takeitem BICYCLE
	waitsfx
	writetext DuskAutoLobbyGuyTextSaidYesText
	closetext
	addcellnum PHONE_AUTO
	setevent EVENT_GAVE_BIKE_TO_AUTO_GUY
	callasm SetUpBikeUpgradeStepsAsm
	end
.said_no
	writetext DuskAutoLobbyGuyTextSaidNoText
	waitbutton
	closetext
	end
.gave_bike
	writetext DuskAutoLobbyGuyText7
	waitbutton
	closetext
	end
.pick_up_bike
	checkitem BICYCLE
	iftrue .have_bike_upgrade
	giveitem BICYCLE
	writetext DuskAutoLobbyGuyText8
	waitbutton
	closetext
	end
.have_bike_upgrade
	writetext DuskAutoLobbyGuyText9
	waitbutton
	closetext
	end

DuskAutoLobbyGuyText1:
	text "You know that girl"
	line "kinda reminded me"
	cont "of my kid brother."
	
	para "He lives with my"
	line "MOM in EVENTIDE"
	cont "VILLAGE."
	
	para "I should give them"
	line "a call…"
	done

DuskAutoLobbyGuyText2:
	text "Oh hey!"
	
	para "It's you again."
	
	para "Thanks for your"
	line "help with that"
	cont "kid earlier."
	
	para "What's up?"
	
	para "They won't let you"
	line "on the HIGHWAY"
	cont "because you don't"
	cont "have a vehicle?"
	
	para "Hm…"
	
	para "I might be able"
	line "to add a motor to"
	cont "your BIKE…"
	
	para "That would likely"
	line "do the trick."
	
	para "Oh, you don't have"
	line "a bike?"
	
	para "Well, my MOM runs"
	line "a BIKE SHOP in"
	cont "EVENTIDE VILLAGE"
	cont "with my kid"
	cont "brother."
	
	para "If you need a"
	line "BIKE, thats the"
	cont "place to be!"
	done
	
DuskAutoLobbyGuyText3:
	text "They won't let you"
	line "on the HIGHWAY"
	cont "because you don't"
	cont "have a vehicle?"
	
	para "Hm…"
	
	para "I might be able"
	line "to add a motor to"
	cont "your BIKE…"
	
	para "That would likely"
	line "do the trick."
	
	para "Oh, you don't have"
	line "a bike?"
	
	para "Well, my MOM runs"
	line "a BIKE SHOP in"
	cont "EVENTIDE VILLAGE"
	cont "with my kid"
	cont "brother."
	
	para "If you need a"
	line "BIKE, thats the"
	cont "place to be!"
	done
	
DuskAutoLobbyGuyText4:
	text "Oh hey!"
	
	para "It's you again."
	
	para "Thanks for your"
	line "help with that"
	cont "kid earlier."
	
	para "What's up?"
	
	para "They won't let you"
	line "on the HIGHWAY"
	cont "because you don't"
	cont "have a vehicle?"
	
	para "Hm…"
	
	para "I might be able"
	line "to add a motor to"
	cont "your BIKE…"
	
	para "That would likely"
	line "do the trick."
	
	para "Let me see your"
	line "BIKE."
	
	para "Wait a minute…"
	
	para "This is one of my"
	line "MOM's bikes!"
	
	para "Is your name"
	line "<PLAYER>?"
	
	para "I thought so!"
	
	para "You helped my kid"
	line "brother,"
	cont "didn't you?"
	
	para "My MOM explained"
	line "everything."
	
	para "You really are a"
	line "hero to lost kids"
	cont "everywhere, huh?"
	done
	
DuskAutoLobbyGuyText5:
	text "Oh you're back."
	
	para "Did you get a"
	line "bike?"
	
	para "Nice! Let me see!"
	
	para "Wait a minute…"
	
	para "This is one of my"
	line "MOM's bikes!"
	
	para "Is your name"
	line "<PLAYER>?"
	
	para "I thought so!"
	
	para "You helped my kid"
	line "brother,"
	cont "didn't you?"
	
	para "My MOM explained"
	line "everything."
	
	para "You really are a"
	line "hero to lost kids"
	cont "everywhere, huh?"
	done
	
DuskAutoLobbyGuyText6:
	text "So, how about we"
	line "get you on the"
	cont "HIGHWAY with a new"
	cont "motor upgrade?"
	
	para "For everything"
	line "you've done for me,"
	cont "it's on the house!"
	
	para "You'll have to"
	line "leave your BIKE"
	cont "with me for a bit,"
	cont "though."
	
	para "Is that ok?"
	done
	
DuskAutoLobbyGuyText7:
	text "I'll give you a"
	line "call when your"
	cont "BIKE is done."
	
	para "It might take"
	line "awhile, so feel"
	cont "free to take care"
	cont "of anything you"
	cont "need to."
	done
	
DuskAutoLobbyGuyText8:
	text "EXPLAIN BIKE"
	done
	
DuskAutoLobbyGuyText9:
	text "TEXT LOOP"
	done
	
DuskAutoLobbyGuyTextGiveBike:
	text "<PLAYER> handed"
	line "over the BIKE."
	done
	
DuskAutoLobbyGuyTextSaidYesText:
	text "Alright, give me"
	line "your phone number,"
	
	para "and I'll give you"
	line "a call when it's"
	cont "done."
	
	para "It might take"
	line "awhile, so feel"
	cont "free to take care"
	cont "of anything you"
	cont "need to."
	done
	
DuskAutoLobbyGuyTextSaidNoText:
	text "Come back if you"
	line "change your mind."
	done