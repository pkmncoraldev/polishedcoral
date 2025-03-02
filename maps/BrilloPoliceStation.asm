BrilloPoliceStation_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  2, 15, BRILLO_TOWN, 7
	warp_event  3, 15, BRILLO_TOWN, 8
	warp_event 12,  1, BRILLO_POLICE_BACK_ROOM, 2

	db 1 ; coord events
	coord_event 18,  8, 0, BrilloPoliceStationGuardStopsYou

	db 3 ; bg events
	signpost  9, 11, SIGNPOST_READ, BrilloPoliceStationPrisoner1
	signpost 12, 11, SIGNPOST_READ, BrilloPoliceStationPrisoner6
	bg_event  1, 14, SIGNPOST_ITEM + TAPE_PLAYER, EVENT_MUSIC_BRILLO_TOWN

	db 18 ; object events
	person_event SPRITE_SITTING_POKEFANF, 13,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationLady, -1
	object_event  1, 10, SPRITE_SPA_WORKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCaptain, -1
	object_event  2, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop1, -1
	object_event  4, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop2, -1
	object_event  5, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop3, -1
	object_event  3, 12, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop4, EVENT_COOPERATED_WITH_BRILLO_POLICE
	object_event 19,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationGuard, -1
	object_event 19,  8, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationGuard, -1
	object_event 15,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  9, SPRITE_COP_SCRUB, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner1, -1
	object_event 14,  8, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner2, -1
	object_event -5, -5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner3, -1
	object_event 14, 13, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner4, -1
	object_event  8,  8, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner5, EVENT_BRILLO_MART_NORMAL_CLERK_GONE
	object_event 11, 14, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationPrisoner6, EVENT_BRILLO_MART_NORMAL_CLERK_GONE
	person_event SPRITE_SLOWPOKETAIL, 11,  0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	hiddentape_event 1, 8, MUSIC_BRILLO_TOWN, 1, EVENT_MUSIC_BRILLO_TOWN

	const_def 1 ; object constants
	const BRILLO_POLICE_STATION_LADY
	const BRILLO_POLICE_STATION_CAPTAIN
	const BRILLO_POLICE_STATION_COP_1
	const BRILLO_POLICE_STATION_COP_2
	const BRILLO_POLICE_STATION_COP_3
	const BRILLO_POLICE_STATION_COP_4
	const BRILLO_POLICE_STATION_GUARD_1
	const BRILLO_POLICE_STATION_GUARD_2


BrilloPoliceStationGuardStopsYou:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface BRILLO_POLICE_STATION_GUARD_2, LEFT
	showemote EMOTE_SHOCK, BRILLO_POLICE_STATION_GUARD_2, 15
	pause 7
	spriteface PLAYER, RIGHT
	opentext
	writetext BrilloPoliceStationGuardText2
	waitbutton
	closetext
	follow PLAYER, BRILLO_POLICE_STATION_GUARD_2
	applyonemovement PLAYER, step_down
	stopfollow
	spriteface PLAYER, UP
	spriteface BRILLO_POLICE_STATION_GUARD_2, DOWN
	opentext
	writetext BrilloPoliceStationGuardText1
	waitbutton
	closetext
	applyonemovement BRILLO_POLICE_STATION_GUARD_2, step_right
	spriteface BRILLO_POLICE_STATION_GUARD_2, UP
	end

BrilloPoliceStationGuard:
	faceplayer
	opentext
	writetext BrilloPoliceStationGuardText1
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_GUARD_2, UP
	end
	
BrilloPoliceStationGuardText1:
	text "Move along, kid."
	done
	
BrilloPoliceStationGuardText2:
	text "Hey!"
	done

BrilloPoliceStationLady:
	faceplayer
	opentext
	checkcode VAR_FACING
	if_equal UP, .YouAreFacingUp
	checkevent EVENT_CAN_TALK_TO_POLICE_CAPTAIN
	iftrue .can_talk_to_captain
	writetext BrilloPoliceStationLadyText1
	jump .cont
.can_talk_to_captain
	writetext BrilloPoliceStationLadyText3
	jump .cont
.YouAreFacingUp
	writetext BrilloPoliceStationLadyText2
.cont
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_LADY, RIGHT
	end

BrilloPoliceStationCaptain:
	checkevent EVENT_ROUTE_17_COPS_GONE
	iftrue .roadblock_gone
	checkevent EVENT_TALKED_TO_POLICE_CAPTAIN
	iftrue .investigating
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
	checkevent EVENT_CAN_TALK_TO_POLICE_CAPTAIN
	iftrue .start_captain
	end
.start_captain
	pause 15
	faceplayer
	opentext
	writetext BrilloPoliceStationCaptainText3
	buttonsound
	farwritetext StdBlankText
	pause 6
.reexplain
	writetext BrilloPoliceStationCaptainText6
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_CAPTAIN, UP
	setevent EVENT_TALKED_TO_POLICE_CAPTAIN
	clearevent EVENT_CAN_TALK_TO_POLICE_CAPTAIN
	end
.investigating
	checkevent EVENT_BEEN_IN_GAME_CORNER
	iftrue .finish_investigation
	faceplayer
	opentext
	writetext BrilloPoliceStationCaptainText4
	yesorno
	iftrue .reexplain
	writetext BrilloPoliceStationCaptainText5
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_CAPTAIN, UP
	end	
.finish_investigation
	faceplayer
	spriteface BRILLO_POLICE_STATION_COP_1, LEFT
	opentext
	writetext BrilloPoliceStationCaptainText7
	yesorno
	iffalse .said_no
.ask_again
	writetext BrilloPoliceStationCaptainText9
	yesorno
	iffalse .refused
	writetext BrilloPoliceStationCaptainText10
	playsound SFX_LEVEL_UP
	waitsfx
	waitbutton
	writetext BrilloPoliceStationCaptainText11
	waitbutton
	closetext
	pause 5
	spriteface BRILLO_POLICE_STATION_CAPTAIN, RIGHT
	opentext
	writetext BrilloPoliceStationCaptainText12
	waitbutton
	closetext
	pause 20
	faceplayer
	opentext
	writetext BrilloPoliceStationCaptainText13
	waitbutton
	closetext
	pause 10
	setevent EVENT_ROUTE_17_COPS_GONE
	setevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	setevent EVENT_BRILLO_CLERK_1_GONE
	setevent EVENT_BRILLO_CLERK_2_GONE
	clearevent EVENT_BRILLO_MART_NORMAL_CLERK_GONE
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warp2 DOWN, BRILLO_TOWN, 35, 13
	end
.refused
	writetext BrilloPoliceStationCaptainText14
	yesorno
	iffalse .ask_again
	writetext BrilloPoliceStationCaptainText15
	waitbutton
	closetext
	follow BRILLO_POLICE_STATION_CAPTAIN, PLAYER
	applymovement BRILLO_POLICE_STATION_CAPTAIN, Movement_BrilloPoliceStationCaptain2
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear BRILLO_POLICE_STATION_CAPTAIN
	waitsfx
	applyonemovement PLAYER, step_up
	warpcheck
	end
.said_no
	writetext BrilloPoliceStationCaptainText8
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_CAPTAIN, UP
	end
.roadblock_gone
	faceplayer
	opentext
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .cooperated
	writetext BrilloPoliceStationCaptainText16
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_CAPTAIN, UP
	end
.cooperated
	writetext BrilloPoliceStationCaptainText17
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_CAPTAIN, UP
	end
	
BrilloPoliceStationCop1:
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .alt
	jumptext BrilloPoliceStationCop1Text1
.alt
	faceplayer
	opentext
	writetext BrilloPoliceStationCop1Text2
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_1, UP
	end

BrilloPoliceStationCop2:
	faceplayer
	opentext
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .alt
	writetext BrilloPoliceStationCop2Text1
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_2, RIGHT
	end
.alt
	writetext BrilloPoliceStationCop2Text2
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_2, RIGHT
	end

BrilloPoliceStationCop3:
	faceplayer
	opentext
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .alt
	writetext BrilloPoliceStationCop3Text1
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_3, LEFT
	end
.alt
	writetext BrilloPoliceStationCop3Text2
	waitbutton
	closetext
	spriteface BRILLO_POLICE_STATION_COP_3, LEFT
	end

BrilloPoliceStationCop4:
	checkevent EVENT_COOPERATED_WITH_BRILLO_POLICE
	iftrue .alt
	jumptextfaceplayer BrilloPoliceStationCop4Text1
.alt
	jumptextfaceplayer BrilloPoliceStationCop4Text2

BrilloPoliceStationPrisoner1:
	jumptext BrilloPoliceStationPrisoner1Text

BrilloPoliceStationPrisoner2:
	jumptext BrilloPoliceStationPrisoner2Text

BrilloPoliceStationPrisoner3:
	jumptext BrilloPoliceStationPrisoner3Text

BrilloPoliceStationPrisoner4:
	jumptext BrilloPoliceStationPrisoner4Text
	
BrilloPoliceStationPrisoner5:
	jumptextfaceplayer BrilloPoliceStationPrisoner5Text
	
BrilloPoliceStationPrisoner6:
	spriteface 16, UP
	jumptext BrilloPoliceStationPrisoner6Text

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
	
BrilloPoliceStationPrisoner5Text:
	text "What happened?"
	
	para "One minute those"
	line "cops had no idea"
	cont "about the MARACTUS"
	cont "ROOM,"
	
	para "and the next"
	line "they're busting"
	cont "down the door!"
	done

BrilloPoliceStationPrisoner6Text:
	text "Someone ratted us"
	line "out to the cops!"
	
	para "Was it you?"
	
	para "We'll get you for"
	line "this!"
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
	
BrilloPoliceStationLadyText3:
	text "The CAPTAIN?"
	
	para "That's him over by"
	line "the corkboard."
	
	para "I wouldn't bother"
	line "him unless it's"
	cont "important."
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
	
BrilloPoliceStationCaptainText3:
	text "CAPTAIN: What?<WAIT_S>"
	line "What do you want?"
	
	para "Can't you see we're"
	line "busy?"
	
	para "Move the ROUTE 17"
	line "roadblock?"
	
	para "I don't have time"
	line "to deal with that!"
	
	para "…"
	
	para "Actually, wait.<WAIT_S>"
	line "You know what?"
	
	para "I'll help you out."
	
	para "But only If you do"
	line "something for me."
	done
	
BrilloPoliceStationCaptainText4:
	text "You got an update?"
	
	para "Don't tell me you"
	line "forgot our deal!"
	done
	
BrilloPoliceStationCaptainText5:
	text "Good."
	
	para "Now get out of my"
	line "face unless you've"
	cont "got some info for"
	cont "me!"
	done
	
BrilloPoliceStationCaptainText6:
	text "Some lowlifes are"
	line "running an illegal"
	cont "gambling ring in"
	cont "our fair PUEBLO"
	cont "BRILLO."
	
	para "We've been trying"
	line "to track them down"
	cont "for months!"
	
	para "They just won't"
	line "slip up and give"
	cont "us anything…"
	
	para "But you."
	
	para "You aren't from"
	line "around here."
	
	para "They won't be able"
	line "to recognize you."
	
	para "If you can find"
	line "out where they're"
	cont "running their"
	cont "little operation,"
	
	para "I'll get my boys"
	line "to let you pass."
	
	para "That's the deal."
	
	para "Now get out of my"
	line "face unless you've"
	cont "got some info for"
	cont "me!"
	done
	
BrilloPoliceStationCaptainText7:
	text "You got an update?"
	done
	
BrilloPoliceStationCaptainText8:
	text "What're you hiding"
	line "from me, kid?"
	done

BrilloPoliceStationCaptainText9:
	text "Great!"
	
	para "Now spit it out"
	line "and we'll take 'em"
	cont "down!"
	
	para "That place'll be"
	line "gone for good!"
	
	para "Well? <WAIT_S>You gonna"
	line "tell me?"
	done
	
BrilloPoliceStationCaptainText10:
	text "<PLAYER> explained"
	line "everything."
	done
	
BrilloPoliceStationCaptainText11:
	text "The #MART!<WAIT_S>"
	line "Of course!"
	
	para "A secret room in"
	line "the back of the"
	cont "#MART!"
	
	para "It was right under"
	line "our noses the"
	cont "whole time!"
	done
	
BrilloPoliceStationCaptainText12:
	text "We're finally gonna"
	line "bust those crooks!"
	done
	
BrilloPoliceStationCaptainText13:
	text "A deal's a deal."
	
	para "I'll call my boys"
	line "and have 'em move"
	cont "the roadblock."
	
	para "Thanks for your"
	line "cooperation, kid."
	done
	
BrilloPoliceStationCaptainText14:
	text "So, you've decided"
	line "not to cooperate."
	
	para "Is that right?"
	done
	
BrilloPoliceStationCaptainText15:
	text "Fine!<WAIT_S>"
	line "Suit yourself!"
	
	para "You're comin' with"
	line "me!"
	done
	
BrilloPoliceStationCaptainText16:
	text "I thought I told"
	line "you never to show"
	cont "your face here"
	cont "again."
	
	para "Outta my sight!"
	done
	
BrilloPoliceStationCaptainText17:
	text "With those crooks"
	line "behind bars,"
	cont "PUEBLO BRILLO is a"
	cont "much safer place."
	
	para "Maybe you aren't"
	line "so bad, kid."
	done

BrilloPoliceStationCop1Text1:
	text "It just doesn't"
	line "add up…"
	
	para "What are we"
	line "missing?"
	done
	
BrilloPoliceStationCop1Text2:
	text "The CAPTAIN won't"
	line "say it himself,"
	cont "but he appreciates"
	cont "your help."
	
	para "So, thanks!"
	done

BrilloPoliceStationCop2Text1:
	text "Man we are all"
	line "gonna get it if we"
	cont "can't figure this"
	cont "out soon…"
	done
	
BrilloPoliceStationCop2Text2:
	text "I'm so glad that"
	line "case is finally"
	cont "over."
	
	para "Our jobs live to"
	line "see another day!"
	done
	
BrilloPoliceStationCop3Text1:
	text "The CAPTAIN is"
	line "extra angry today…"
	
	para "I'm just gonna"
	line "stay over here by"
	cont "the water cooler…"
	done
	
BrilloPoliceStationCop3Text2:
	text "The CAPTAIN has"
	line "finally cooled"
	cont "down."
	
	para "I'll still keep"
	line "to myself at the"
	cont "water cooler,"
	cont "however."
	done

BrilloPoliceStationCop4Text1:
	text "We're hot on the"
	line "tail of an illegal"
	cont "gambling ring!"
	
	para "We've hit a wall in"
	line "the case, though…"
	
	para "And boy, is the"
	line "CAPTAIN mad about"
	cont "it!"
	done
	
BrilloPoliceStationCop4Text2:
	text "We finally tracked"
	line "that gambling ring"
	cont "down!"
	
	para "The day is saved"
	line "again all thanks"
	cont "to us!"
	done
	
Movement_BrilloPoliceStationCaptain:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
	
Movement_BrilloPoliceStationCaptain2:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
