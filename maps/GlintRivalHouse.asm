GlintRivalHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 4, GLINT_CITY
	warp_def 7, 3, 4, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_POKEFAN_F, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintRivalHouseMom, -1


	const_def 1 ; object constants
	const GLINT_RIVALHOUSE_MOM
	
GlintRivalHouseMom:
	faceplayer
	opentext
	checkitem RIVAL_POKEDEX
	iffalse .GlintRivalHouseMomLoop
	domaptrigger GLINT_GROVE_ENTRANCE, $1
	takeitem RIVAL_POKEDEX
	writetext GlintRivalMomText1
	waitbutton
	writetext GlintRivalMomTextGiveDex
	playsound SFX_LEVEL_UP 
	waitsfx
;	waitbutton
	writetext GlintRivalMomText4
	buttonsound
	stringtotext .mapcardname, $1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	buttonsound
	writetext GlintRivalMomText2
	waitbutton
	closetext
	setevent EVENT_GLINT_CONTACT_GUY_1
	clearevent EVENT_GLINT_CONTACT_GUY_2
	domaptrigger GLINT_GROVE_ENTRANCE, $1
	end

.GlintRivalHouseMomLoop:
	writetext GlintRivalMomText3
	waitbutton
	closetext
	end

.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	
GlintRivalHouseRivalHmphText:
	text "Hmph…"
	done
	
GotMapCardText:
	text "<PLAYER>'s #GEAR"
	line "now has a MAP!"
	done
	
GlintRivalMomText1:
	text "<RIVAL>'s MOM: You"
	line "must be <PLAYER>!"
	
	para "<RIVAL> has told"
	line "me all about you."
	
	para "I know he can be a"
	line "bit to deal with,"
	
	para "but don't let it"
	line "get to you."
	
	para "I'm hoping that"
	line "going on a journey"
	cont "with his #MON"
	cont "will help him"
	cont "mature a bit."
	
	para "Oh?"
	
	para "A #DEX?"
	
	para "<RIVAL> ran off"
	line "before they were"
	cont "handed out?"
	
	para "Sigh…"
	
	para "Well, thanks for"
	line "bringing it by."
	done
	
GlintRivalMomText2:
	text "That MAP CARD lets"
	line "you view a map of"
	cont "the ONWA region"
	cont "from your #-"
	cont "GEAR."
	
	para "It's really handy!"
	
	para "Thanks again for"
	line "bringing by"
	cont "<RIVAL>'s #DEX."
	done
	
GlintRivalMomText3:
	text "Thanks again for"
	line "bringing by"
	cont "<RIVAL>'s #DEX."
	done
	
GlintRivalMomText4:
	text "<RIVAL> went off"
	line "to GLINT GROVE to"
	cont "do some training."
	
	para "I'll be sure to"
	line "give this to him"
	cont "when he gets back."
	
	para "Say, you have a"
	line "#GEAR, right?"
	
	para "Why don't you take"
	line "this as thanks?"
	done
	
GlintRivalMomTextGiveDex:
	text "<PLAYER> gave"
	line "<RIVAL>'s #DEX"
	cont "to <RIVAL>'s MOM."
	done
