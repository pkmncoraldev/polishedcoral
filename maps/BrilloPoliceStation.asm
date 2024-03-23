BrilloPoliceStation_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  9, BRILLO_TOWN, 7
	warp_event  3,  9, BRILLO_TOWN, 8

	db 0 ; coord events

	db 2 ; bg events
	signpost  3, 11, SIGNPOST_READ, BrilloPoliceStationPrisoner1
	bg_event  1,  8, SIGNPOST_ITEM + TAPE_PLAYER, EVENT_MUSIC_BRILLO_TOWN

	db 12 ; object events
	person_event SPRITE_SITTING_POKEFANF,  7,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationLady, -1
	object_event  1,  4, SPRITE_SPA_WORKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCaptain, -1
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop1, -1
	object_event  4,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop2, -1
	object_event  5,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop3, -1
	object_event  3,  6, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop4, -1
	object_event 11,  3, SPRITE_COP_SCRUB, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner1, -1
	object_event 14,  2, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner2, -1
	object_event  8,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner3, -1
	object_event 14,  7, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner4, -1
	person_event SPRITE_SLOWPOKETAIL,  5,  0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	hiddentape_event 1, 8, MUSIC_BRILLO_TOWN, 1, EVENT_MUSIC_BRILLO_TOWN

	const_def 1 ; object constants
	const BRILLO_POLICE_STATION_LADY
	const BRILLO_POLICE_STATION_CAPTAIN
	const BRILLO_POLICE_STATION_COP_1
	const BRILLO_POLICE_STATION_COP_2
	const BRILLO_POLICE_STATION_COP_3
	const BRILLO_POLICE_STATION_COP_4


BrilloPoliceStationLady:
	faceplayer
	opentext
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	writetext BrilloPoliceStationLadyText1
	jump .cont
.YouAreFacingUp
	writetext BrilloPoliceStationLadyText2
.cont
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_LADY, RIGHT
	end

BrilloPoliceStationCaptain:
	opentext
	writetext BrilloPoliceStationCaptainText1
	waitbutton
	closetext
	applyonemovement BRILLO_POLICE_STATION_CAPTAIN, turn_step_up
	playsound SFX_MOVE_PUZZLE_PIECE
	earthquake 5
	waitsfx
	opentext
	writetext BrilloPoliceStationCaptainText2
	waitbutton
	closetext
	end
	
BrilloPoliceStationCop1:
	jumptext BrilloPoliceStationCop1Text

BrilloPoliceStationCop2:
	faceplayer
	opentext
	writetext BrilloPoliceStationCop2Text
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_2, RIGHT
	end

BrilloPoliceStationCop3:
	faceplayer
	opentext
	writetext BrilloPoliceStationCop3Text
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_3, LEFT
	end

BrilloPoliceStationCop4:
	jumptextfaceplayer BrilloPoliceStationCop4Text

BrilloPoliceStationPrisoner1:
	jumptext BrilloPoliceStationPrisoner1Text

BrilloPoliceStationPrisoner2:
	jumptext BrilloPoliceStationPrisoner2Text

BrilloPoliceStationPrisoner3:
	jumptext BrilloPoliceStationPrisoner3Text

BrilloPoliceStationPrisoner4:
	jumptext BrilloPoliceStationPrisoner4Text

BrilloPoliceStationPrisoner1Text:
	text "When's grub?"
	
	para "I'm starvin' over"
	line "here!"
	
	para "Crooks deserve to"
	line "eat, too!"
	done

BrilloPoliceStationPrisoner2Text:
	text "Mumble… mumble…"
	
	para "Back corner of the"
	line "#MART…"
	
	para "Mumble… mumble…"
	
	para "They'll never find"
	line "it…"
	done

BrilloPoliceStationPrisoner3Text:
	text "They've got the"
	line "wrong guy!"
	
	para "You gotta believe"
	line "me, kid!"
	done

BrilloPoliceStationPrisoner4Text:
	text "I ain't tellin' no"
	line "cop nothing'!"
	
	para "You hear me?"
	
	para "NOTHIN'!"
	done

BrilloPoliceStationLadyText1:
	text "Do you have an"
	line "appointment?"
	
	para "If not, now might"
	line "not be a good"
	cont "time…"
	done

BrilloPoliceStationLadyText2:
	text "Um…"
	
	para "Could you please"
	line "step back in front"
	cont "of the desk?"
	done

BrilloPoliceStationCaptainText1:
	text "Every lead is a"
	line "dead end!"
	
	para "ARGH!"
	done
	
BrilloPoliceStationCaptainText2:
	text "I'll bet those"
	line "dirty crooks are"
	cont "laughin' at us!"
	done

BrilloPoliceStationCop1Text:
	text "It just doesn't"
	line "add up…"
	
	para "What are we"
	line "missing?"
	done

BrilloPoliceStationCop2Text:
	text "Man we are all"
	line "gonna get it if we"
	cont "can't figure this"
	cont "out soon…"
	done
	
BrilloPoliceStationCop3Text:
	text "The CAPTAIN is"
	line "extra angry today…"
	
	para "I'm just gonna"
	line "stay over here by"
	cont "the water cooler…"
	done

BrilloPoliceStationCop4Text:
	text "We're hot on the"
	line "tail of an illegal"
	cont "gambling ring!"
	
	para "We've hit a wall in"
	line "the case, though…"
	
	para "And boy, is the"
	line "CAPTAIN mad about"
	cont "it!"
	done
