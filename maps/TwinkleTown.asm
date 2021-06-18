TwinkleTown_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleTownTrigger0
	scene_script TwinkleTownTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, TwinkleTownFlypointCallback
	callback MAPCALLBACK_OBJECTS, TwinkleTownCallback

	db 7 ; warp events
	warp_def 47, 11, 1, TWINKLE_POKECENTER
	warp_def 41, 17, 1, TWINKLE_MART
	warp_def 31, 17, 1, TWINKLE_ROCK_HOUSE
	warp_def 39,  7, 1, TWINKLE_TRADE_HOUSE
	warp_def 49, 21, 1, TWINKLE_HOUSE_3
	warp_def  5, 34, 1, ICE_CAVE_B1F
	warp_def 21, 10, 1, TWINKLE_GYM_ENTRY

	db 0 ; coord events

	db 7 ; bg events
	signpost 44,  8, SIGNPOST_READ, TwinkleTownSign
	signpost 22, 12, SIGNPOST_READ, TwinkleTownGymSign
	signpost 47, 12, SIGNPOST_READ, TwinkleTownPokeCenterSign
	signpost 41, 18, SIGNPOST_READ, TwinkleTownMartSign
	signpost 41, 15, SIGNPOST_READ, TwinkleTownSnowman1
	signpost 22,  8, SIGNPOST_READ, TwinkleTownSnowman2
	signpost 30, 15, SIGNPOST_READ, TwinkleTownSnowman3

	db 6 ; object events
	person_event SPRITE_CHILD, 31, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC1, EVENT_TWINKLE_SNOWMAN_3_1
	person_event SPRITE_TWIN, 30, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC2, EVENT_TWINKLE_SNOWMAN_3_1
	person_event SPRITE_SKIER, 29, 35, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC3, -1
	person_event SPRITE_BOARDER, 30, 40, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC4, -1
	person_event SPRITE_SKIER, 36, 32, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC5, -1
	person_event SPRITE_BOARDER, 36, 33, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC6, -1
	person_event SPRITE_SKIER, 40, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinkleTownNPC7, -1
	
	
	const_def 1 ; object constants
	const TWINKLE_TOWN_NPC_1
	const TWINKLE_TOWN_NPC_2
	const TWINKLE_TOWN_NPC_3
	const TWINKLE_TOWN_NPC_4
	const TWINKLE_TOWN_NPC_5
	const TWINKLE_TOWN_NPC_6
	
TwinkleTownFlypointCallback:
	setflag ENGINE_FLYPOINT_TWINKLE
	return
	
TwinkleTownCallback:
	checkevent EVENT_BEAT_CHARLIE_REMATCH
	iffalse .skip
	clearevent EVENT_BEAT_CHARLIE_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_TRAINER_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_BLUE_ROOM_LEADER_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_1_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_TRAINER_2_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_LEADER_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_1_REMATCH
	clearevent EVENT_BEAT_TWINKLE_GYM_YELLOW_ROOM_BATHER_2_REMATCH
.skip
	checkevent EVENT_SNOWSTORM_HAPPENING
	iffalse .endcallback
	dotrigger $1
.endcallback
	return
	
TwinkleTownTrigger0:
	end

TwinkleTownTrigger1:
	clearevent EVENT_SNOWSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger ROUTE_10, $0
	dotrigger $0
	end
	
TwinkleTownSnowman1:
	opentext
	checkevent EVENT_TWINKLE_SNOWMAN_1_2
	iftrue .tooksecondeye
	checkevent EVENT_TWINKLE_SNOWMAN_1_1
	iftrue .tookfirsteye
	writetext TwinkleTownSnowman1Text1
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $e, $28, $b0
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text2
	waitbutton
	closetext
	setevent EVENT_TWINKLE_SNOWMAN_1_1
	end
.tookfirsteye
	writetext TwinkleTownSnowman1Text3
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $e, $28, $b3
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text4
	waitbutton
	closetext
	setevent EVENT_TWINKLE_SNOWMAN_1_2
	end
.tooksecondeye
	writetext TwinkleTownSnowman1Text5
	waitbutton
	closetext
	end
.no
	writetext TwinkleTownSnowman1TextNo
	waitbutton
	closetext
	end
	
TwinkleTownSnowman2:
	opentext
	checkevent EVENT_TWINKLE_SNOWMAN_2_2
	iftrue .tooksecondeye
	checkevent EVENT_TWINKLE_SNOWMAN_2_1
	iftrue .tookfirsteye
	writetext TwinkleTownSnowman1Text1
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $8, $16, $b2
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text2
	waitbutton
	closetext
	setevent EVENT_TWINKLE_SNOWMAN_2_1
	end
.tookfirsteye
	writetext TwinkleTownSnowman1Text3
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $8, $16, $b5
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text4
	waitbutton
	closetext
	setevent EVENT_TWINKLE_SNOWMAN_2_2
	end
.tooksecondeye
	writetext TwinkleTownSnowman1Text5
	waitbutton
	closetext
	end
.no
	writetext TwinkleTownSnowman1TextNo
	waitbutton
	closetext
	end
	
TwinkleTownSnowman3:
	opentext
	checkevent EVENT_TWINKLE_SNOWMAN_3_2
	iftrue .tooksecondeye
	checkevent EVENT_TWINKLE_SNOWMAN_3_1
	iftrue .tookfirsteye
	writetext TwinkleTownSnowman1Text1
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $e, $1e, $b1
	opentext
	verbosegiveitem BOTTLE_CAP
	closetext
	spriteface TWINKLE_TOWN_NPC_1, DOWN
	spriteface TWINKLE_TOWN_NPC_2, DOWN
	opentext
	writetext TwinkleTownSnowman1TextScaredKids
	waitbutton
	closetext	
	applyonemovement TWINKLE_TOWN_NPC_2, run_step_down
	follow TWINKLE_TOWN_NPC_2, TWINKLE_TOWN_NPC_1
	applymovement TWINKLE_TOWN_NPC_2, Movement_TwinkleTownScaredKids
	stopfollow
	disappear TWINKLE_TOWN_NPC_1
	disappear TWINKLE_TOWN_NPC_2
	setevent EVENT_TWINKLE_SNOWMAN_3_1
	end
.tookfirsteye
	writetext TwinkleTownSnowman1Text3
	yesorno
	iffalse .no
	writetext TwinkleTownSnowman1TextAreYouSure
	yesorno
	iffalse .no
	closetext
	changeblock $e, $1e, $b4
	opentext
	verbosegiveitem BOTTLE_CAP
	writetext TwinkleTownSnowman1Text4
	waitbutton
	closetext
	setevent EVENT_TWINKLE_SNOWMAN_3_2
	end
.tooksecondeye
	writetext TwinkleTownSnowman1Text5
	waitbutton
	closetext
	end
.no
	writetext TwinkleTownSnowman1TextNo
	waitbutton
	closetext
	end
	
TwinkleTownNPC1:
	faceplayer
	opentext
	writetext TwinkleTownNPC1Text
	waitbutton
	closetext
	spriteface TWINKLE_TOWN_NPC_1, UP
	end
	
TwinkleTownNPC2:
	faceplayer
	opentext
	checkevent EVENT_TWINKLE_TOWN_GOT_BOTTLE_CAP
	iftrue .got_cap
	writetext TwinkleTownNPC2Text1
	waitbutton
	verbosegiveitem BOTTLE_CAP
	closetext
	setevent EVENT_TWINKLE_TOWN_GOT_BOTTLE_CAP
	spriteface TWINKLE_TOWN_NPC_2, RIGHT
	end
.got_cap
	writetext TwinkleTownNPC2Text2
	waitbutton
	closetext
	spriteface TWINKLE_TOWN_NPC_2, RIGHT
	end
	
TwinkleTownNPC3:
	jumptextfaceplayer TwinkleTownNPC3Text
	
TwinkleTownNPC4:
	faceplayer
	opentext
	writetext TwinkleTownNPC4Text
	waitbutton
	closetext
	spriteface TWINKLE_TOWN_NPC_4, LEFT
	end
	
TwinkleTownNPC5:
	jumptextfaceplayer TwinkleTownNPC5Text
	
TwinkleTownNPC6:
	jumptextfaceplayer TwinkleTownNPC6Text
	
TwinkleTownNPC7:
	jumptextfaceplayer TwinkleTownNPC7Text
	
TwinkleTownSign:
	jumptext TwinkleTownSignText
	
TwinkleTownGymSign:
	jumptext TwinkleTownGymSignText
	
TwinkleTownPokeCenterSign:
	jumpstd pokecentersign
	
TwinkleTownMartSign:
	jumpstd martsign
	
TwinkleTownSignText:
	text "TWINKLE TOWN"
	
	para "A shining beacon"
	line "in the storm."
	done
	
TwinkleTownGymSignText:
	text "TWINKLE TOWN"
	line "#MON GYM"
	cont "LEADER: CHARLIE"

	para "The smokin' hot"
	line "stud."
	done
	
TwinkleTownSnowman1Text1:
	text "A snowman with"
	line "BOTTLE CAPs for"
	cont "eyes."
	
	para "…"
	
	para "Take one?"
	done
	
TwinkleTownSnowman1Text2:
	text "The snowman looks"
	line "sad…"
	done
	
TwinkleTownSnowman1Text3:
	text "A snowman with a"
	line "BOTTLE CAP for an"
	cont "eye."
	
	para "…"
	
	para "Take the other"
	line "one?"
	done
	
TwinkleTownSnowman1Text4:
	text "You monster!"
	done
	
TwinkleTownSnowman1Text5:
	text "A snowman with"
	line "no face…"
	done
	
TwinkleTownSnowman1TextAreYouSure:
	text "Are you sure?"
	done
	
TwinkleTownSnowman1TextNo:
	text "Better not…"
	done
	
TwinkleTownSnowman1TextScaredKids:
	text "AHHHHHHH!"
	done
	
TwinkleTownNPC1Text:
	text "Snowman! Snowman!"
	
	para "Hehehe!"
	done
	
TwinkleTownNPC2Text1:
	text "We don't have any"
	line "coal for the"
	cont "snowman's eyes…"
	
	para "We've been using"
	line "BOTTLE CAPs!"
	
	para "Want one?"
	done
	
TwinkleTownNPC2Text2:
	text "Don't throw that"
	line "BOTTLE CAP away,"
	cont "ok?"
	done
	
TwinkleTownNPC3Text:
	text "What's your"
	line "problem?"
	
	para "You're messing up"
	line "my twirl!"
	done
	
TwinkleTownNPC4Text:
	text "Woah!"
	
	para "Look at that girl"
	line "spin!"
	
	para "She's making me"
	line "dizzy…"
	done
	
TwinkleTownNPC5Text:
	text "A lot of people"
	line "like to skate on"
	cont "the frozen lake."
	
	para "It's a lot of fun!"
	
	para "You should give it"
	line "a try!"
	done
	
TwinkleTownNPC6Text:
	text "Once you start"
	line "sliding,"
	
	para "it's really hard"
	line "to stop."
	
	para "You'll just keep"
	line "going until you"
	cont "bump into a wall!"
	done
	
TwinkleTownNPC7Text:
	text "See all the cute"
	line "snowmen around"
	cont "town?"
	
	para "Their eyes are"
	line "actually BOTTLE"
	cont "CAPs!"
	
	para "Some people like"
	line "to collect those,"
	
	para "but I don't have"
	line "the heart to steal"
	cont "a snowman's eyes…"
	done
	
Movement_TwinkleTownScaredKids:
	run_step_left
	run_step_left
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	run_step_down
	step_end
