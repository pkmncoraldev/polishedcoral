StarglowCavernFossilRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  9,  3, 4, STARGLOW_CAVERN_2F


	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_SUPER_NERD,  4,  3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowCavernFossilRoomNpc, EVENT_BEAT_STARGLOW_CAVERN_FOSSIL_GUY
	person_event SPRITE_SUPER_NERD,  2,  3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowCavernFossilRoomNpc2, EVENT_STARGLOW_CAVERN_FOSSIL_GUY
	person_event SPRITE_BOULDER_ROCK_FOSSIL,  3,  4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, StarglowCavernFossilRoomCoverFossil, EVENT_GOT_FOSSIL
	person_event SPRITE_BOULDER_ROCK_FOSSIL,  3,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, StarglowCavernFossilRoomPlumeFossil, EVENT_GOT_FOSSIL
	
	
	const_def 1 ; object constants
	const STARGLOWCAVERNFOSSILGUY1
	const STARGLOWCAVERNFOSSILGUY2
	const STARGLOWCAVERNCOVERFOSSIL
	const STARGLOWCAVERNPLUMEFOSSIL
	
StarglowCavernFossilRoomNpc:
	opentext
	writetext StarglowCavernFossilRoomNpcText1
	waitbutton
	closetext
	pause 20
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, STARGLOWCAVERNFOSSILGUY1, 15
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext StarglowCavernFossilRoomNpcText2
	waitbutton
	closetext
	waitsfx
	winlosstext StarglowCavernFossilRoomNpcWinText, 0
	setlasttalked STARGLOWCAVERNFOSSILGUY1
	loadtrainer SUPER_NERD, CHESTER
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_STARGLOW_CAVERN_FOSSIL_GUY
	opentext
	writetext StarglowCavernFossilRoomNpcText3
	waitbutton
	closetext
	applymovement STARGLOWCAVERNFOSSILGUY1, Movement_StarglowCavernFossilGuy
	spriteface STARGLOWCAVERNFOSSILGUY1, DOWN
	clearevent EVENT_STARGLOW_CAVERN_FOSSIL_GUY
	appear STARGLOWCAVERNFOSSILGUY2
	opentext
	disappear STARGLOWCAVERNFOSSILGUY1
	writetext StarglowCavernFossilRoomNpcText4
	waitbutton
	closetext
	end
	
StarglowCavernFossilRoomNpc2:
	faceplayer
	opentext
	checkevent EVENT_GOT_FOSSIL
	iftrue .got_fossil
	writetext StarglowCavernFossilRoomNpcText5
	waitbutton
	closetext
	end
.got_fossil
	writetext StarglowCavernFossilRoomNpcText6
	waitbutton
	closetext
	end
	
StarglowCavernFossilRoomCoverFossil:
	opentext
	writetext StarglowCavernFossilRoomCoverFossilText
	yesorno
	iffalse StarglowCavernFossilRoomNo
	disappear STARGLOWCAVERNCOVERFOSSIL
	setevent EVENT_GOT_FOSSIL
	verbosegiveitem COVER_FOSSIL
	closetext
	pause 5
	spriteface PLAYER, UP
	opentext
	writetext StarglowCavernFossilRoomNpcText7
	waitbutton
	closetext
	applyonemovement STARGLOWCAVERNFOSSILGUY2, step_left
	spriteface STARGLOWCAVERNFOSSILGUY2, DOWN
	pause 5
	disappear STARGLOWCAVERNPLUMEFOSSIL
	opentext
	writetext FossilGuyPickedPlumeFossilText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	end
	
StarglowCavernFossilRoomPlumeFossil:
	opentext
	writetext StarglowCavernFossilRoomPlumeFossilText
	yesorno
	iffalse StarglowCavernFossilRoomNo
	disappear STARGLOWCAVERNPLUMEFOSSIL
	setevent EVENT_GOT_FOSSIL
	verbosegiveitem PLUME_FOSSIL
	closetext
	pause 5
	spriteface PLAYER, UP
	opentext
	writetext StarglowCavernFossilRoomNpcText7
	waitbutton
	closetext
	applyonemovement STARGLOWCAVERNFOSSILGUY2, step_right
	spriteface STARGLOWCAVERNFOSSILGUY2, DOWN
	pause 5
	disappear STARGLOWCAVERNCOVERFOSSIL
	opentext
	writetext FossilGuyPickedCoverFossilText
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	closetext
	end
	
StarglowCavernFossilRoomNo:
	writetext StarglowCavernFossilTextNo
	waitbutton
	closetext
	end
	
StarglowCavernFossilRoomCoverFossilText:
	text "A fossil of a"
	line "#MON's shell-"
	cont "like cover!"
	
	para "Take the"
	line "COVER FOSSIL?"
	done
	
StarglowCavernFossilRoomPlumeFossilText:
	text "A fossil of a"
	line "#MON's feathery"
	cont "plume!"
	
	para "Take the"
	line "PLUME FOSSIL?"
	done
	
FossilGuyPickedCoverFossilText:
	text "CHESTER took the"
	line "COVER FOSSIL!"
	done
	
FossilGuyPickedPlumeFossilText:
	text "CHESTER took the"
	line "PLUME FOSSIL!"
	done
	
StarglowCavernFossilTextNo:
	text "Better think it"
	line "over carefully…"
	done
	
StarglowCavernFossilRoomAlreadyGotFossilText:
	text "You already took"
	line "a fossil."
	
	para "Don't be greedy!"
	done
	
StarglowCavernFossilRoomNpcText1:
	text "They're mine!"
	
	para "They're all mine!"
	
	para "Don't worry my"
	line "beauties…"
	
	para "No one will ever"
	line "take you away from"
	cont "me!"
	done
	
StarglowCavernFossilRoomNpcText2:
	text "Ahhh!"
	
	para "Who are you?"
	
	para "You're here for my"
	line "precious fossils,"
	cont "aren't you?"
	
	para "Well, you can't"
	line "have them!"
	
	para "They're mine!"
	
	para "All mine!"
	done
	
StarglowCavernFossilRoomNpcText3:
	text "Alright fine!"
	
	para "You win!"
	
	para "You can have one."
	
	para "ONLY one!"
	done
	
StarglowCavernFossilRoomNpcText4:
	text "Go ahead…"
	
	para "Take your pick…"
	done
	
StarglowCavernFossilRoomNpcText5:
	text "What are you"
	line "waiting for?"
	
	para "Take your pick and"
	line "leave me alone!"
	done
	
StarglowCavernFossilRoomNpcText6:
	text "Ok, you got your"
	line "fossil, now leave"
	cont "us alone!"
	done
	
StarglowCavernFossilRoomNpcText7:
	text "Fine, I'll take the"
	line "other one."
	done
	
StarglowCavernFossilRoomNpcWinText:
	text "YOU WIN"
	done
	
Movement_StarglowCavernFossilGuy:
	step_up
	step_up
	step_end