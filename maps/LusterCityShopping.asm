LusterCityShopping_MapScriptHeader:
	db 1 ; scene scripts
	scene_script LusterCityShoppingTrigger0

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, LusterCityFlypointCallback
	callback MAPCALLBACK_TILES, ShoppingCallback

	db 8 ; warp events
	warp_def 11,  0, 1, LUSTER_TRAIN_STATION
	warp_def 11,  1, 2, LUSTER_TRAIN_STATION
	warp_def 33, 12, 1, LUSTER_MALL
	warp_def 33, 13, 2, LUSTER_MALL
	warp_def 33, 16, 3, LUSTER_MALL
	warp_def 33, 17, 4, LUSTER_MALL
	warp_def 19, 18, 3, LUSTER_MALL_BACK_ROOM
	warp_def 19, 19, 3, LUSTER_MALL_BACK_ROOM

	db 20 ; coord events
	xy_trigger 0, 46,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 47,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 48,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 49,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 50,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 51,  0, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 46, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 47, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 48, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 49, 29, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 21,  2, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 21,  3, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 0, 21,  4, 0, LusterShoppingSignThing, 0, 0
	xy_trigger 1, 19,  2, 0, LusterResidentialSignThing, 0, 0
	xy_trigger 1, 19,  3, 0, LusterResidentialSignThing, 0, 0
	xy_trigger 1, 19,  4, 0, LusterResidentialSignThing, 0, 0
	xy_trigger 1, 19,  5, 0, LusterResidentialSignThing, 0, 0
	coord_event 20, 17, 2, LusterShoppingDeliveryEvent
	coord_event 20, 18, 2, LusterShoppingDeliveryEvent
	coord_event 20, 19, 2, LusterShoppingDeliveryEvent

	db 7 ; bg events
	signpost 24,  5, SIGNPOST_READ, LusterShoppingTrashcan1
	signpost 26,  5, SIGNPOST_READ, LusterShoppingTrashcan2
	signpost 24, 25, SIGNPOST_READ, LusterShoppingTrashcan3
	signpost 26, 25, SIGNPOST_READ, LusterShoppingTrashcan4
	signpost 28, 24, SIGNPOST_READ, LusterShoppingFenceKid
	bg_event  7, 21, SIGNPOST_ITEM + MAX_REVIVE, EVENT_LUSTER_SHOPPING_HIDDEN_ITEM_1
	bg_event 25, 27, SIGNPOST_ITEM + RARE_CANDY, EVENT_LUSTER_SHOPPING_HIDDEN_ITEM_2

	db 16 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 44, -3, SPRITEMOVEDATA_TILE_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN, 44,  7, SPRITEMOVEDATA_MALL_SIGN_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN, 44,  8, SPRITEMOVEDATA_MALL_SIGN_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN, 31, 15, SPRITEMOVEDATA_MALL_SIGN_3, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_MALL_SIGN, 31, 16, SPRITEMOVEDATA_MALL_SIGN_4, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_LASS, 36, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster2NPC1, -1
	person_event SPRITE_BATTLE_GIRL, 36, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster2NPC2, -1
	person_event SPRITE_CHILD, 36, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster2NPC3, -1
	person_event SPRITE_LASS, 46, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2NPC4, -1
	person_event SPRITE_BATTLE_GIRL, 33, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster2NPC5, -1
	person_event SPRITE_COOL_DUDE, 33, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Luster2NPC6, -1
	person_event SPRITE_FISHER, 40, 15, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster2NPC7, -1
	person_event SPRITE_SUPER_NERD, 29, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2NPC8, -1
	itemball_event 25, 25, LEFTOVERS, 1, EVENT_LUSTER_SHOPPING_POKEBALL
	person_event SPRITE_SNARE, 18, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster2Snare, EVENT_PART_TIME_JOB_BEAT_SNARE
	person_event SPRITE_FAT_GUY, 18, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Luster2Delivery, EVENT_PART_TIME_JOB_SAVED_DELIVERY

	const_def 1 ; object constants
	const LUSTER2STREETLIGHT
	const LUSTER2MALLSIGN1_1
	const LUSTER2MALLSIGN1_2
	const LUSTER2MALLSIGN2_1
	const LUSTER2MALLSIGN2_2
	const LUSTER2NPC1
	const LUSTER2NPC2
	const LUSTER2NPC3
	const LUSTER2NPC4
	const LUSTER2NPC5
	const LUSTER2NPC6
	const LUSTER2NPC7
	const LUSTER2NPC8
	const LUSTER2ITEM
	const LUSTER2SNARE
	const LUSTER2DELIVERY

LusterCityShoppingTrigger0:
	checktime 1<<NITE
	iffalse .end
	checkflag ENGINE_STREETLIGHTS
	iftrue .end
	changeblock -4, 20, $84
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
.end
	end
	
LusterResidentialSignThing:
	dotrigger $0
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	setevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	end
	
LusterShoppingSignThing:
	dotrigger $1
	setevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	setevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	end
	
LusterCityFlypointCallback:
	setflag ENGINE_FLYPOINT_LUSTER
	return
	
ShoppingCallback:
	checkevent EVENT_PART_TIME_JOB_SAVED_DELIVERY
	iffalse .skip1
	changeblock $16, $10, $64
	jump .skip2
.skip1
	checkevent EVENT_MIDDLE_PART_TIME_JOB
	iffalse .skip2
	moveperson LUSTER2SNARE, $18, $11
.skip2
	checktime 1<<NITE
	iffalse .notnite
	changeblock -4, 20, $84
.notnite
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_1
	iftrue .OpenSesame1
.cont1
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_2
	iftrue .OpenSesame2
.cont2
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_3
	iftrue .OpenSesame3
.cont3
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_4
	iftrue .OpenSesame4
.cont4
	return
	
.OpenSesame1:
	changeblock $4, $18, $52
	jump .cont1

.OpenSesame2:
	changeblock $4, $1a, $52
	jump .cont2
	
.OpenSesame3:
	changeblock $18, $18, $52
	jump .cont3
	
.OpenSesame4:
	changeblock $18, $1a, $52
	jump .cont4
	
LusterShoppingFenceKid:
	jumptext LusterShoppingFenceKidText
	
LusterShoppingTrashcan1:
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_1
	iftrue LusterTrashcanOnlyTrash
	changeblock $4, $18, $52
	setevent EVENT_LUSTER_SHOPPING_TRASHCAN_1
	jump LusterTrashcanEnd
	
LusterShoppingTrashcan2:
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_2
	iftrue LusterTrashcanOnlyTrash
	changeblock $4, $1a, $52
	setevent EVENT_LUSTER_SHOPPING_TRASHCAN_2
	jump LusterTrashcanEnd
	
LusterShoppingTrashcan3:
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_3
	iftrue LusterTrashcanOnlyTrash
	changeblock $18, $18, $52
	setevent EVENT_LUSTER_SHOPPING_TRASHCAN_3
	jump LusterTrashcanEnd
	
LusterShoppingTrashcan4:
	checkevent EVENT_LUSTER_SHOPPING_TRASHCAN_4
	iftrue LusterTrashcanOnlyTrash
	changeblock $18, $1a, $52
	setevent EVENT_LUSTER_SHOPPING_TRASHCAN_4
	jump LusterTrashcanEnd
	
Luster2Snare:
	faceplayer
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	opentext
	writetext LusterShoppingSnareText3
	waitbutton
	closetext
	waitsfx
	special SaveMusic
	winlosstext LusterShoppingSnareWinText, 0
	setlasttalked LUSTER2SNARE
	loadtrainer GRUNTM, LUSTER_GRUNTM
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	opentext
	writetext LusterShoppingSnareText4
	waitbutton
	closetext
	pause 7
	special FadeOutPalettesBlack
	pause 20
	disappear LUSTER2SNARE
	callasm LoadMapPals
	special FadeInPalettes
	playmusic MUSIC_LUSTER_CITY
	pause 7
	setevent EVENT_PART_TIME_JOB_BEAT_SNARE
	end
	
Luster2Delivery:
	checkevent EVENT_PART_TIME_JOB_BEAT_SNARE
	iftrue .saved
	jumptextfaceplayer LusterShoppingDeliveryText2
.saved
	faceplayer
	opentext
	writetext LusterShoppingDeliveryText3
	waitbutton
	closetext
	pause 7
	special FadeOutPalettesBlack
	pause 20
	changeblock $16, $10, $64
	callasm GenericFinishBridge
	disappear LUSTER2DELIVERY
	callasm LoadMapPals
	special FadeInPalettes
	pause 7
	setevent EVENT_PART_TIME_JOB_SAVED_DELIVERY
	end

LusterShoppingDeliveryEvent:
	applyonemovement LUSTER2SNARE, turn_step_left
	opentext
	writetext LusterShoppingSnareText1
	waitbutton
	closetext
	pause 5
	applyonemovement LUSTER2DELIVERY, turn_step_right
	opentext
	writetext LusterShoppingDeliveryText1
	waitbutton
	closetext
	pause 5
	applyonemovement LUSTER2SNARE, turn_step_left
	opentext
	writetext LusterShoppingSnareText2
	waitbutton
	closetext
	applymovement LUSTER2SNARE, Movement_LusterShoppingSnare1
	spriteface LUSTER2SNARE, LEFT
	moveperson LUSTER2SNARE, $18, $11
	dotrigger $1
	setevent EVENT_MIDDLE_PART_TIME_JOB
	end
	
Luster2NPC1:
	faceplayer
	opentext
	writetext Luster2NPC1Text
	waitbutton
	closetext
	spriteface LUSTER2NPC1, LEFT
	end

Luster2NPC2:
	faceplayer
	opentext
	writetext Luster2NPC2Text
	waitbutton
	closetext
	spriteface LUSTER2NPC2, RIGHT
	end

Luster2NPC3:
	faceplayer
	opentext
	writetext Luster2NPC3Text
	waitbutton
	closetext
	spriteface LUSTER2NPC3, LEFT
	end
	
Luster2NPC4:
	faceplayer
	opentext
	writetext Luster2NPC4Text
	waitbutton
	closetext
	spriteface LUSTER2NPC4, UP
	end
	
Luster2NPC5:
	faceplayer
	opentext
	writetext Luster2NPC5Text
	waitbutton
	closetext
	spriteface LUSTER2NPC5, DOWN
	end
	
Luster2NPC6:
	faceplayer
	opentext
	writetext Luster2NPC6Text
	waitbutton
	closetext
	spriteface LUSTER2NPC6, DOWN
	end
	
Luster2NPC7:
	faceplayer
	opentext
	writetext Luster2NPC7Text
	waitbutton
	closetext
	spriteface LUSTER2NPC7, LEFT
	end
	
Luster2NPC8:
	faceplayer
	opentext
	writetext Luster2NPC8Text
	waitbutton
	closetext
	spriteface LUSTER2NPC8, UP
	end
	
Luster2NPC1Text:
	text "I love coming to"
	line "the SHOPPING MALL!"
	
	para "My MOM always"
	line "makes me bring my"
	cont "little brother"
	cont "along, though…"
	done
	
Luster2NPC2Text:
	text "Why'd she have to"
	line "bring her kid"
	cont "brother along?"
	
	para "He's so annoying!"
	done
	
Luster2NPC3Text:
	text "My big sister is"
	line "taking me to the"
	cont "SHOPPING MALL!"
	
	para "YAY!"
	done
	
Luster2NPC4Text:
	text "This is the only"
	line "place in this city"
	cont "that I could des-"
	cont "cribe as pretty."
	
	para "Well, there is the"
	line "ROUTE 11 park,"
	cont "I guess."
	
	para "But, that place is"
	line "always so crowded."
	done
	
Luster2NPC5Text:
	text "Ehehehe!"
	
	para "I can't wait to"
	line "buy my boyfriend"
	cont "all sorts of cute"
	cont "outfits!"
	done
	
Luster2NPC6Text:
	text "Help me!"
	
	para "She dragged me"
	line "along with her…"
	done
	
Luster2NPC7Text:
	text "I locked my keys"
	line "in my car!"
	
	para "Today is not my"
	line "day…"
	done
	
Luster2NPC8Text:
	text "Only employees are"
	line "allowed behind the"
	cont "SHOPPING MALL."
	
	para "I'm thinking of"
	line "getting a job just"
	cont "to see what goes"
	cont "on back there…"
	done
	
LusterShoppingFenceKidText:
	text "Woah!"
	
	para "You got behind the"
	line "SHOPPING MALL!"
	
	para "What's it like"
	line "back there?"
	
	para "Sigh…"
	
	para "Someday…"
	done
	
LusterShoppingSnareText1:
	text "Alright, hand 'em"
	line "over!"
	
	para "I know you've got"
	line "APRICORNS on this"
	cont "truck."
	
	para "And you're gonna"
	line "give 'em to me,"
	cont "or else."
	done
	
LusterShoppingSnareText2:
	text "Smart move."
	
	para "Hehe…"
	done
	
LusterShoppingSnareText3:
	text "Who the?"
	
	para "You want these"
	line "APRICORNS?"
	
	para "No way!"
	
	para "They belong to"
	line "TEAM SNARE now!"
	
	para "I'm stealing them"
	line "fair and square!"
	done
	
LusterShoppingSnareText4:
	text "Darn it!"
	
	para "I was told not to"
	line "let this shipment"
	cont "make it to the"
	cont "#BALL SHOP!"
	
	para "Now I'm gonna get"
	line "it…"
	done
	
LusterShoppingSnareWinText:
	text "Ah geeze…"
	done
	
LusterShoppingDeliveryText1:
	text "Ok ok…"
	
	para "Just take them!"
	
	para "The shipment is in"
	line "the back…"
	done
	
LusterShoppingDeliveryText2:
	text "Psst…"
	
	para "A little help"
	line "here?"
	
	para "That guy's robbing"
	line "me!"
	
	para "If I don't finish"
	line "this delivery,"
	cont "I'll be in huge"
	cont "trouble!"
	
	para "Don't just stand"
	line "there…"
	
	para "Take him out!"
	done
	
LusterShoppingDeliveryText3:
	text "Wow!"
	
	para "Thanks a lot!"
	
	para "Now I can finish"
	line "this delivery."
	
	para "I'm already super"
	line "late!"
	done
	
Movement_LusterShoppingSnare1:
	step_right
	step_up
	step_end
