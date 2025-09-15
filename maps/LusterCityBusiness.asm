LusterCityBusiness_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterCityBusinessTrigger0
	scene_script LusterCityBusinessTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BusinessCallback

	db 6 ; warp events
	warp_event 16, 13, LUSTER_SKYSCRAPER_1F, 1
	warp_event 17, 13, LUSTER_SKYSCRAPER_1F, 2
	warp_event 22, 25, LUSTER_SPAM_BUILDING_1F, 1
	warp_event 23, 25, LUSTER_SPAM_BUILDING_1F, 2
	warp_event 30, 11, NETT_BUILDING_1F, 1
	warp_event 31, 11, NETT_BUILDING_1F, 2

	db 8 ; coord events
	coord_event 13, 26, 0, LusterCityBusinessRival1
	coord_event 13, 27, 0, LusterCityBusinessRival2
	coord_event 13, 28, 0, LusterCityBusinessRival3
	coord_event 13, 29, 0, LusterCityBusinessRival4
	coord_event 14, 26, 0, LusterCityBusinessRival5
	coord_event 14, 27, 0, LusterCityBusinessRival6
	coord_event 14, 28, 0, LusterCityBusinessRival7
	coord_event 14, 29, 0, LusterCityBusinessRival8

	db 3 ; bg events
	signpost 12, 32, SIGNPOST_READ, NettBuildingSign
	signpost 25, 20, SIGNPOST_READ, BankBuildingSign
	signpost 13, 19, SIGNPOST_READ, GenericBuildingSign

	db 19 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 24, 14, SPRITEMOVEDATA_TILE_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_SUPER_NERD, 33, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC1, -1
	person_event SPRITE_SUPER_NERD, 29, 33, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC2, -1
	person_event SPRITE_BEAUTY, 19, 36, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster3NPC3, -1
	person_event SPRITE_SUPER_NERD, 16, 15, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC4, -1
	person_event SPRITE_LADY, 17, 31, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster3NPC5, -1
	person_event SPRITE_ROCKER, 17, 30, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster3NPC6, -1
	person_event SPRITE_SUPER_NERD, 26, 26, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3NPC7, -1
	person_event SPRITE_POKEMANIAC, 13, 29, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster3NPC8, -1
	person_event SPRITE_POKEFAN_F, 24, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster3NPC9, -1
	person_event SPRITE_CHILD, 25, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Luster3NPC10, -1
	person_event SPRITE_SUPER_NERD, 20, 14, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3GenericNPC, -1
	person_event SPRITE_BEAUTY, 21, 14, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3GenericNPC, -1
	person_event SPRITE_SUPER_NERD, 29, 22, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3GenericNPC, -1
	person_event SPRITE_BEAUTY, 29, 21, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3GenericNPC, -1
	person_event SPRITE_SUPER_NERD, 14, 22, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3GenericNPC, -1
	person_event SPRITE_BEAUTY, 14, 23, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster3GenericNPC, -1
	person_event SPRITE_COLBY,  0,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	tapeball_event 43, 13, MUSIC_RIVAL_BATTLE, 2, EVENT_MUSIC_RIVAL_BATTLE

	const_def 1 ; object constants
	const LUSTERBUSINESS_TRAFFIC_LIGHT
	const LUSTERBUSINESS_NPC1
	const LUSTERBUSINESS_NPC2
	const LUSTERBUSINESS_NPC3
	const LUSTERBUSINESS_NPC4
	const LUSTERBUSINESS_NPC5
	const LUSTERBUSINESS_NPC6
	const LUSTERBUSINESS_NPC7
	const LUSTERBUSINESS_NPC8
	const LUSTERBUSINESS_NPC9
	const LUSTERBUSINESS_NPC10
	const LUSTERBUSINESS_GENERIC_NPC1
	const LUSTERBUSINESS_GENERIC_NPC2
	const LUSTERBUSINESS_GENERIC_NPC3
	const LUSTERBUSINESS_GENERIC_NPC4
	const LUSTERBUSINESS_GENERIC_NPC5
	const LUSTERBUSINESS_GENERIC_NPC6
	const LUSTERBUSINESS_RIVAL
	
	
LusterCityBusinessTrigger0:
	end
	
LusterCityBusinessTrigger1:
	end
	
BusinessCallback:
	checkevent EVENT_DONE_SPAM_BUILDING_4F
	iffalse .skip
	clearevent EVENT_CAN_DO_SPAM_BUILDING
.skip
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	setevent EVENT_IN_BUSINESS_DISTRICT
	return
	
NettBuildingSign:
	jumptext NettBuildingSignText
	
BankBuildingSign:
	jumptext BankBuildingSignText
	
GenericBuildingSign:
	jumptext GenericBuildingSignText
	
LusterCityBusinessRival1:
	moveperson LUSTERBUSINESS_RIVAL, $f, $15
	clearevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival2:
	moveperson LUSTERBUSINESS_RIVAL, $f, $16
	clearevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival3:
	moveperson LUSTERBUSINESS_RIVAL, $f, $17
	clearevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival4:
	moveperson LUSTERBUSINESS_RIVAL, $f, $18
	setevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival5:
	moveperson LUSTERBUSINESS_RIVAL, $10, $15
	clearevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival6:
	moveperson LUSTERBUSINESS_RIVAL, $10, $16
	clearevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival7:
	moveperson LUSTERBUSINESS_RIVAL, $10, $17
	clearevent EVENT_LUSTER_RIVAL_MOVE_UP
	jump LusterCityBusinessRival
	
LusterCityBusinessRival8:
	moveperson LUSTERBUSINESS_RIVAL, $10, $18
	setevent EVENT_LUSTER_RIVAL_MOVE_UP
	
LusterCityBusinessRival:
	special Special_StopRunning
	disappear LUSTERBUSINESS_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	appear LUSTERBUSINESS_RIVAL
	applyonemovement LUSTERBUSINESS_RIVAL, step_sleep_1
	wait 15
	applymovement LUSTERBUSINESS_RIVAL, Movement_LusterCityBusinessRival1
	spriteface PLAYER, RIGHT
	opentext TEXTBOX_RIVAL
	writetext LusterCityBusinessRivalText1
	waitbutton
	closetext
	waitsfx
	checkevent EVENT_GOT_TOTODILE_FROM_SPRUCE
	iftrue .totodile
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
	iftrue .cyndaquil
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .chikorita
	checkevent EVENT_GOT_SQUIRTLE_FROM_SPRUCE
	iftrue .squirtle
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .charmander
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .bulbasaur
.totodile
	winlosstext LusterCityBusinessRivalWinText, LusterCityBusinessRivalLoseText
	setlasttalked LUSTERBUSINESS_RIVAL
	loadtrainer RIVAL, RIVAL4_6
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.chikorita
	winlosstext LusterCityBusinessRivalWinText, LusterCityBusinessRivalLoseText
	setlasttalked LUSTERBUSINESS_RIVAL
	loadtrainer RIVAL, RIVAL4_5
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.cyndaquil
	winlosstext LusterCityBusinessRivalWinText, LusterCityBusinessRivalLoseText
	setlasttalked LUSTERBUSINESS_RIVAL
	loadtrainer RIVAL, RIVAL4_4
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.squirtle
	winlosstext LusterCityBusinessRivalWinText, LusterCityBusinessRivalLoseText
	setlasttalked LUSTERBUSINESS_RIVAL
	loadtrainer RIVAL, RIVAL4_3
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle
	
.bulbasaur
	winlosstext LusterCityBusinessRivalWinText, LusterCityBusinessRivalLoseText
	setlasttalked LUSTERBUSINESS_RIVAL
	loadtrainer RIVAL, RIVAL4_2
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .afterbattle

.charmander
	winlosstext LusterCityBusinessRivalWinText, LusterCityBusinessRivalLoseText
	setlasttalked LUSTERBUSINESS_RIVAL
	loadtrainer RIVAL, RIVAL4_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	
.afterbattle
	playmusic MUSIC_RIVAL_AFTER
	opentext TEXTBOX_RIVAL
	writetext LusterCityBusinessRivalText2
	waitbutton
	closetext	
	checkevent EVENT_LUSTER_RIVAL_MOVE_UP
	iftrue .move_up
	applyonemovement LUSTERBUSINESS_RIVAL, step_down
	jump .finish
.move_up
	applyonemovement LUSTERBUSINESS_RIVAL, step_up
.finish
	applymovement LUSTERBUSINESS_RIVAL, Movement_LusterCityBusinessRival2
	disappear LUSTERBUSINESS_RIVAL
	special Special_FadeOutMusic
	pause 15
	playmapmusic
	setevent EVENT_LUSTER_RIVAL
	dotrigger $1
	end
	
LusterCityBusinessRivalText1:
	text "You!"
	
	para "What are you doing"
	line "here?"
	
	para "Look, <WAIT_S>I have more"
	line "important things"
	cont "to deal with!"
	
	para "I have a lot on"
	line "my mind right now."
	
	para "Someone just said"
	line "something to me"
	cont "and it has me"
	cont "thinking…"
	
	para "…"
	
	para "You know what?<WAIT_M>"
	line "I'm actually glad"
	cont "you're here."
	
	para "I need to vent"
	line "some frustration!"
	done
	
LusterCityBusinessRivalText2:
	text "This… <WAIT_M>This isn't"
	line "right!"
	
	para "How can someone"
	line "like you keep"
	cont "beating me?"
	
	para "This is no fluke…"
	
	para "…"
	
	para "Cheating!"
	
	para "You're cheating!"
	
	para "You've gotta be!"
	
	para "Well if you can"
	line "cheat, then…"
	
	para "Then maybe I can"
	line "cheat too."
	
	para "Someday you're"
	line "gonna be sorry,"
	cont "<PLAYER>."
	done
	
LusterCityBusinessRivalWinText:
	text "ARGH!"
	done
	
LusterCityBusinessRivalLoseText:
	text "Yeah!"
	
	para "That's what you"
	line "get!"
	done
	
Movement_LusterCityBusinessRival1:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	step_end
	
Movement_LusterCityBusinessRival2:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
Luster3NPC1:
	jumptextfaceplayer Luster3NPC1Text
	
Luster3NPC1Text:
	text "The BUSINESS"
	line "DISTRICT is no"
	cont "place for a kid!"
	
	para "This place is"
	line "strictly for"
	cont "no-nonsense"
	cont "business!"
	
	para "Come back when"
	line "you have bills"
	cont "to pay, mouths to"
	cont "feed, and business"
	cont "to do!"
	done
	
Luster3NPC2:
	jumptextfaceplayer Luster3NPC2Text
	
Luster3NPC2Text:
	text "Meetings, <WAIT_S>due"
	line "dates, <WAIT_S>proposals…"
	
	para "Sometimes I wish I"
	line "was just a #MON"
	cont "TRAINER like you!"
	done
	
Luster3NPC3:
	jumptextfaceplayer Luster3NPC3Text
	
Luster3NPC3Text:
	text "I think I'm lost!"
	
	para "I'm looking for the"
	line "mall,"
	
	para "but there's just a"
	line "bunch of boring"
	cont "office buildings"
	cont "around here!"
	done
	
Luster3NPC4:
	faceplayer
	opentext
	checktmhm TM_WORK_UP_GROWTH
	iftrue .got_tm
	writetext Luster3NPC4Text1
	waitbutton
	verbosegivetmhm TM_WORK_UP_GROWTH
	writetext Luster3NPC4Text2
	waitbutton
	closetext
	end
.got_tm
	writetext Luster3NPC4Text3
	waitbutton
	closetext
	end
	
Luster3NPC4Text1:
	text "Work! <WAIT_S>Work! <WAIT_S>Work!"
	
	para "In the morning,"
	line "I'm late for work!"
	
	para "In the evening,"
	line "I stay late after"
	cont "work!"
	
	para "At night, I'm up"
	line "late THINKING"
	cont "about work!"
	
	para "It gets me so"
	line "worked up!"
	
	para "Here! Take this!"
	done
	
Luster3NPC4Text2:
	text "That TM contains"
	line "the move WORK UP!"
	
	para "It raises the"
	line "user's ATTACK and"
	cont "SPCL. ATK!"
	
	para "It'll give you the"
	line "boost you need to"
	cont "get through the"
	cont "work day!"
	
	para "Now, if you'll"
	line "excuse me,"
	
	para "I gotta get"
	line "back to work!"
	done
	
Luster3NPC4Text3:
	text "Work! <WAIT_S>Work! <WAIT_S>Work!"
	done
	
Luster3NPC5:
	faceplayer
	opentext
	writetext Luster3NPC5Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC5, UP
	end
	
Luster3NPC5Text:
	text "There it is!<WAIT_M>"
	line "The NETT BUILDING!"
	
	para "The tallest"
	line "building in the"
	cont "ONWA REGION!"
	
	para "I wonder what they"
	line "do inside."
	done
	
Luster3NPC6:
	faceplayer
	opentext
	writetext Luster3NPC6Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC6, UP
	end
	
Luster3NPC6Text:
	text "Is this what you"
	line "do on vacation?"
	
	para "Just look at tall"
	line "buildings?"
	
	para "I don't get it…"
	done

Luster3NPC7:
	jumptextfaceplayer Luster3NPC7Text
	
Luster3NPC7Text:
	text "They say this area"
	line "is a concrete"
	cont "jungle,"
	
	para "but at night, when"
	line "all the lights"
	cont "come on,"
	
	para "I think there is a"
	line "certain charm to"
	cont "it."
	done
	
Luster3NPC8:
	jumptextfaceplayer Luster3NPC8Text
	
Luster3NPC8Text:
	text "This is the NETT"
	line "CORP. building."
	
	para "The CEO of NETT"
	line "CORP. is MR. NETT."
	
	para "He's a super rich"
	line "tech genius and"
	cont "philanthropist."
	done
	
Luster3NPC9:
	faceplayer
	opentext
	writetext Luster3NPC9Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC9, LEFT
	end
	
Luster3NPC9Text:
	text "Now, now!"
	
	para "We have to wait"
	line "our turn before"
	cont "crossing the road!"
	
	para "We can cross when"
	line "the light changes."
	done
	
Luster3NPC10:
	faceplayer
	opentext
	writetext Luster3NPC10Text
	waitbutton
	closetext
	spriteface LUSTERBUSINESS_NPC10, LEFT
	end
	
Luster3NPC10Text:
	text "The light is NEVER"
	line "gonna change…"
	done
	
Luster3GenericNPC:
	jumptext Luster3GenericNPCText
	
Luster3GenericNPCText:
	text "Mumble… <WAIT_S>mumble…"
	done

NettBuildingSignText:
	text "NETT CORP."
	
	para "“To Capture a"
	line "Better Tomorrow”"
	done
	
GenericBuildingSignText:
	text "GENERICON"
	line "ENTERPRISES"
	
	para "“Business is Our"
	line "Business”"
	done
	
BankBuildingSignText:
	text "FRIENDLY CO. LLC."
	line "Coorperate Offices"
	
	para "NO SOLICITING!"
	done
